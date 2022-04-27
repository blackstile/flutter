import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsividade_flutter_web/screen/auto_size_text_example.dart';
import 'package:responsividade_flutter_web/screen/responsividade_column_row.dart';
import 'package:responsividade_flutter_web/screen/responsividade_media_query.dart';
import 'package:responsividade_flutter_web/screen/responsividade_orietation_builder.dart';
import 'package:responsividade_flutter_web/screen/responsividade_wrap.dart';
import 'package:responsividade_flutter_web/screen/widget_different_size.dart';
import 'package:responsividade_flutter_web/screen/widget_proportional_size.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return MaterialApp(
          title: "Flutter Web ",
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          home: const WidgetDifferentSize(),
        );
      },
    ),
  );
}
