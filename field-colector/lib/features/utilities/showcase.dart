// Referencia visual de widgets y estilos del proyecto.
// No se usa en la app — solo para consulta.
//
// Para verlo en el emulador, temporalmente cambia en home.dart:
//   return ShowcaseScreen();

import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  bool _switchVal = false;
  double _sliderVal = 0.5;
  int _selectedRadio = 0;
  bool _checkVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcase de estilos'),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Tipografía ---
            const Text('Title', style: AppStyles.title),
            AppStyles.gapSm,
            const Text('Subtitle', style: AppStyles.subtitle),
            AppStyles.gapSm,
            const Text('Body text - Lorem ipsum dolor sit amet, consectetur adipiscing elit.', style: AppStyles.body),
            AppStyles.gapSm,
            const Text('Caption text', style: AppStyles.caption),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Botones ---
            const Text('Botones', style: AppStyles.subtitle),
            AppStyles.gapMd,
            ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
            AppStyles.gapSm,
            OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
            AppStyles.gapSm,
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            AppStyles.gapSm,
            ElevatedButton(onPressed: null, child: const Text('Disabled')),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Inputs ---
            const Text('Inputs', style: AppStyles.subtitle),
            AppStyles.gapMd,
            const TextField(decoration: InputDecoration(labelText: 'Campo normal')),
            AppStyles.gapMd,
            const TextField(decoration: InputDecoration(labelText: 'Con hint', hintText: 'Escribe algo...')),
            AppStyles.gapMd,
            const TextField(decoration: InputDecoration(labelText: 'Con prefijo', prefixIcon: Icon(Icons.search))),
            AppStyles.gapMd,
            const TextField(decoration: InputDecoration(labelText: 'Con error', errorText: 'Este campo es obligatorio')),
            AppStyles.gapMd,
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password', suffixIcon: Icon(Icons.visibility_off)),
            ),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Cards ---
            const Text('Cards', style: AppStyles.subtitle),
            AppStyles.gapMd,
            Container(
              decoration: AppStyles.card,
              padding: AppStyles.paddingMd,
              child: const Text('Card normal', style: AppStyles.body),
            ),
            AppStyles.gapMd,
            Container(
              decoration: AppStyles.cardAccent,
              padding: AppStyles.paddingMd,
              child: const Text('Card con acento', style: AppStyles.body),
            ),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Badges ---
            const Text('Badges', style: AppStyles.subtitle),
            AppStyles.gapMd,
            Wrap(
              spacing: 8,
              children: [
                Container(
                  decoration: AppStyles.badgeWarning,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text('Pendiente', style: AppStyles.caption.copyWith(color: AppColors.primaryDark)),
                ),
                Container(
                  decoration: AppStyles.badgeInfo,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text('Info', style: AppStyles.caption.copyWith(color: AppColors.primaryDark)),
                ),
              ],
            ),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Controles ---
            const Text('Controles', style: AppStyles.subtitle),
            AppStyles.gapMd,
            SwitchListTile(
              title: const Text('Switch'),
              value: _switchVal,
              onChanged: (v) => setState(() => _switchVal = v),
            ),
            CheckboxListTile(
              title: const Text('Checkbox'),
              value: _checkVal,
              onChanged: (v) => setState(() => _checkVal = v ?? false),
            ),
            RadioListTile(title: const Text('Opción A'), value: 0, groupValue: _selectedRadio, onChanged: (v) => setState(() => _selectedRadio = v!)),
            RadioListTile(title: const Text('Opción B'), value: 1, groupValue: _selectedRadio, onChanged: (v) => setState(() => _selectedRadio = v!)),
            Slider(value: _sliderVal, onChanged: (v) => setState(() => _sliderVal = v)),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Colores ---
            const Text('Colores de la paleta', style: AppStyles.subtitle),
            AppStyles.gapMd,
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _colorChip('grassShadow', AppColors.grassShadow),
                _colorChip('greenParasol', AppColors.greenParasol),
                _colorChip('cumulusBlue', AppColors.cumulusBlue),
                _colorChip('wildYellow', AppColors.wildYellow),
                _colorChip('cloudWhite', AppColors.cloudWhite),
                _colorChip('error', AppColors.error),
              ],
            ),

            AppStyles.gapLg,
            const Divider(),
            AppStyles.gapLg,

            // --- Feedback ---
            const Text('Feedback', style: AppStyles.subtitle),
            AppStyles.gapMd,
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Esto es un SnackBar')),
                );
              },
              child: const Text('Mostrar SnackBar'),
            ),
            AppStyles.gapSm,
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Dialog'),
                    content: const Text('Así se ve un AlertDialog con el tema.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                      ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Aceptar')),
                    ],
                  ),
                );
              },
              child: const Text('Mostrar Dialog'),
            ),

            AppStyles.gapLg,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _colorChip(String name, Color color) {
    final isLight = color.computeLuminance() > 0.5;
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: isLight ? Border.all(color: Colors.black12) : null,
      ),
      child: Text(
        name,
        style: TextStyle(fontSize: 10, color: isLight ? AppColors.textPrimary : Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
