import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'main.directories.g.dart';
import 'package:todolist/design_system/theme/app_theme.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: buildLightTheme()),
            WidgetbookTheme(name: 'Dark', data: buildDarkTheme()),
          ],
          initialTheme: WidgetbookTheme(name: 'Light', data: buildLightTheme()),
        ),
        DeviceFrameAddon(devices: Devices.all),
        TextScaleAddon(scales: [1.0, 1.2, 1.5, 2.0]),
        AlignmentAddon(),
      ],
      directories: directories,
    );
  }
}
