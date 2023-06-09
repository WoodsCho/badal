import 'package:badal/common/view/splash_screen.dart';
import 'package:badal/user/view/login_screen.dart';

import 'package:flutter/material.dart';

void main () {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


