import 'dart:async';

import 'package:flutter/material.dart';

import 'welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _splashDuration = Duration(milliseconds: 8000);
  static const _splashAsset = AssetImage('assets/images/load_splash.gif');

  Timer? _navigationTimer;
  bool _isPreparing = true;
  bool _hasStarted = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_hasStarted) return;
    _hasStarted = true;
    _prepareAndStartSplash();
  }

  Future<void> _prepareAndStartSplash() async {
    await precacheImage(_splashAsset, context);

    if (!mounted) return;

    setState(() {
      _isPreparing = false;
    });

    _navigationTimer = Timer(_splashDuration, () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomePage()),
      );
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final targetWidth = (screenWidth * 1.15).round();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: _isPreparing
              ? const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(strokeWidth: 3),
                )
              : RepaintBoundary(
                  child: Image.asset(
                    'assets/images/load_splash.gif',
                    fit: BoxFit.contain,
                    gaplessPlayback: true,
                    filterQuality: FilterQuality.low,
                    isAntiAlias: false,
                    cacheWidth: targetWidth,
                  ),
                ),
        ),
      ),
    );
  }
}
