import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'configs/constants.dart';
import 'widgets/custom_glassmorphism.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppImages.welcomeBg,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Build Widget Glassmorphism
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Glassmorphism(
                      blur: 15,
                      opacity: 0.2,
                      radius: 20,
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Text(
                              heading,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16.0,
                              ),
                            ),
                            const Spacer(),

                            /// Button
                            Glassmorphism(
                                blur: _isBlur ? 20 : 0,
                                opacity: 0.2,
                                radius: 50.0,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      // set _isBlur to true
                                      _isBlur = !_isBlur;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(microseconds: kDuration),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 20.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(60)),
                                      border: Border.all(
                                        width: 1.5,
                                        color: _isBlur
                                            ? Colors.redAccent
                                            : Colors.lightGreenAccent,
                                      ),
                                    ),
                                    child: const Text(
                                      startNow,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
