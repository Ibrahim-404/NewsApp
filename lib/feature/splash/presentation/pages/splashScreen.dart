import 'package:flutter/material.dart';
import 'package:news_clean_architecture/core/app_style.dart';
import 'package:news_clean_architecture/core/const_color.dart';
import 'package:news_clean_architecture/core/routes/routes_name.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _moveUp = false;
  bool _showDescription = false;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();

    // Animation for sliding text in from top
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    // After showing in center, move it up
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _moveUp = true;
      });

      // Show description after the title moves
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          _showDescription = true;
        });
      });
      Future.delayed(const Duration(milliseconds: 650), () {
        setState(() {
          _isButtonVisible = true;
        });
      });
    });
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _isButtonVisible
              ? FloatingActionButton(
                child: const Icon(Icons.navigate_next),
                onPressed: ()  {
                   Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.homeScreen,
                    (route) => false,
                  );
                },
              )
              : null,
      backgroundColor: ConstColor.splashScreenColor,
      body: Stack(
        children: [
          // Title animation
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            top:
                _moveUp
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.45,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Center(
                child: Text("TweetLeaks", style: AppStyle.mainTitle),
              ),
            ),
          ),

          // Description text
          if (_showDescription)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ChimeBellText(
                  text:
                      'Your daily dose of trending tweets, spicy leaks, and hot gossip — all in one place!',
                  duration: const Duration(milliseconds: 600),
                  type: AnimationType.word,
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
