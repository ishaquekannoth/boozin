import 'package:boozin/core/strings/asset_strings.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isDarkMode
                ? AssetStrings.boozinLogoDark
                : AssetStrings.boozinLogoLight),
            const Text("Fitness")
          ],
        ),
      ),
    );
  }
}
