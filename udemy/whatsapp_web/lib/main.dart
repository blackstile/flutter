import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_web/telas/login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:whatsapp_web/widgets/loading.dart';

main() async {
  //Documentacao Firebase Flutter
  //https://firebase.flutter.dev/docs/installation/web
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: ((context) => HomeWhatappWeb()),
  ));
}

class HomeWhatappWeb extends StatefulWidget {
  const HomeWhatappWeb({Key? key}) : super(key: key);

  @override
  State<HomeWhatappWeb> createState() => _HomeWhatappWebState();
}

class _HomeWhatappWebState extends State<HomeWhatappWeb> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Whatsapp Wen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      home: const Login(),
    );
  }
}
