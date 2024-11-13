import 'package:boozin/core/strings/asset_strings.dart';
import 'package:boozin/features/home/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _positionAnimation = Tween<Offset>(
      begin: const Offset(-1.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();


    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const HomeView());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: SlideTransition(
                    position: _positionAnimation,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        isDarkMode
                            ? AssetStrings.boozinLogoDark
                            : AssetStrings.boozinLogoLight,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text("Fitness", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
