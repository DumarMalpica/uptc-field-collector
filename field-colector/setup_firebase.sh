#!/bin/bash
set -e

echo "Iniciando configuración automatizada de Firebase para UPTC Field Collector..."

if ! command -v firebase &> /dev/null; then
    echo "No se encontró firebase-tools. Instalando..."
    npm install -g firebase-tools
fi

if ! command -v flutterfire &> /dev/null; then
    echo "No se encontró flutterfire_cli. Instalando..."
    dart pub global activate flutterfire_cli
    export PATH="$PATH":"$HOME/.pub-cache/bin"
fi

echo ""
echo "Por favor, inicia sesión con la cuenta de Google final."
firebase login

echo ""
read -p "Ingresa un ID único para el nuevo proyecto de Firebase (ej. field-collector-produccion): " PROJECT_ID

echo ""
echo "Creando el proyecto '$PROJECT_ID' en la nube..."
firebase projects:create $PROJECT_ID --display-name "UPTC Field Collector"

echo ""
echo "Esperando 15 segundos para que Google sincronice el proyecto en sus servidores..."
sleep 15

echo ""
echo "Registrando las apps de Android/iOS y descargando claves..."
flutterfire configure \
  --project=$PROJECT_ID \
  --platforms=android,ios \
  --android-package-name=com.citesa.field_colector \
  --ios-bundle-id=com.citesa.fieldColector \
  --yes

echo ""
echo "¡Configuración terminada! El archivo firebase_options.dart y google-services.json han sido generados para la nueva cuenta."