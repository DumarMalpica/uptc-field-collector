allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// AGP 8+: todo módulo Android library necesita namespace. Isar 3.1.0+1
// no lo declara; se rellena desde package= del AndroidManifest.
// Debe ir ANTES de evaluationDependsOn(":app") para poder registrar
// afterEvaluate antes de que Gradle evalúe los plugins.
subprojects {
    afterEvaluate {
        val androidExt = extensions.findByName("android") ?: return@afterEvaluate
        val getNs =
            androidExt.javaClass.methods.find { it.name == "getNamespace" }
                ?: return@afterEvaluate
        val current =
            try {
                getNs.invoke(androidExt) as? String
            } catch (_: Exception) {
                null
            }
        if (!current.isNullOrBlank()) return@afterEvaluate

        val manifest = file("src/main/AndroidManifest.xml")
        if (!manifest.exists()) return@afterEvaluate

        val pkg =
            Regex("""package="([^"]+)"""").find(manifest.readText())?.groupValues?.get(1)
                ?: return@afterEvaluate

        val setNs =
            androidExt.javaClass.methods.find {
                it.name == "setNamespace" &&
                    it.parameterTypes.contentEquals(arrayOf(String::class.java))
            } ?: return@afterEvaluate
        setNs.invoke(androidExt, pkg)
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
