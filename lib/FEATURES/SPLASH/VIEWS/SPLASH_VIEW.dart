import 'package:flutter/material.dart';
import 'package:videos_sounds_app/FEATURES/SPLASH/WIDGETS/SPLASH_VIEW_BODY.dart';

class SPLASH_VIEW extends StatefulWidget {
  const SPLASH_VIEW({super.key});

  @override
  State<SPLASH_VIEW> createState() => _SPLASH_VIEWState();
}

class _SPLASH_VIEWState extends State<SPLASH_VIEW> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SPLASH_VIEW_BODY(),
    );
  }
}
