import 'package:flutter/material.dart';
import 'package:zml_soundboard/screens/welcome_screen.dart';

void main() {
  runApp(ZMLSoundBoard());
}

class ZMLSoundBoard extends StatelessWidget {
  const ZMLSoundBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
