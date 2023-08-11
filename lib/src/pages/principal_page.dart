import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:practica_obligatoria_5/src/pages/inicio1_page.dart';
import 'package:practica_obligatoria_5/src/pages/inicio2_page.dart';
import 'package:practica_obligatoria_5/src/pages/inicio3_page.dart';
import 'package:practica_obligatoria_5/src/widgets/liquid_pages.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
      pages: liquidPages,
      fullTransitionValue: 350,
      enableLoop: true,
      enableSideReveal: false,
      positionSlideIcon: 0.8,
      slideIconWidget: Icon(Icons.arrow_back_ios),
      ignoreUserGestureWhileAnimating: true,
    ));
  }
}
