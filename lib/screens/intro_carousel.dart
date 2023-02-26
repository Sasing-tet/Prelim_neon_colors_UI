// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sasing_prelims/screens/home_screen.dart';

import '../../constants.dart';
import '../../image_data.dart';

class introCarousel extends StatefulWidget {
  const introCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<introCarousel> createState() => _IntroCarouselState();
}

class _IntroCarouselState extends State<introCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: neonPink,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 40,
                    sigmaY: 40,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 180,
              top: 200,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: neonGreen,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 70,
                    sigmaY: 70,
                  ),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            PageView.builder(
              itemCount: introScreenCarousel.length,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemBuilder: (context, index) => Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top: defaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RotationTransition(
                                  turns: AlwaysStoppedAnimation(40 / 360),
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      border: GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          neonPink,
                                          bgColor.withOpacity(0.1),
                                          bgColor.withOpacity(0.1),
                                          neonGreen,
                                        ]),
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(300),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(300),
                                      child: Container(
                                        width: 275,
                                        height: 275,
                                        child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 180,
                                              top: 40,
                                              bottom: 50,
                                            ),
                                            child: RotationTransition(
                                              turns: AlwaysStoppedAnimation(
                                                325 / 360,
                                              ),
                                              child: Image.asset(
                                                introScreenCarousel[index],
                                                scale: 0.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: titleVerticalPadding,
                        bottom: defaultPadding,
                      ),
                      child: Text(
                        'Watch movies in Virtual Reality',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: titleLargeText,
                          fontWeight: textWeightBold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: defaultPadding,
                        bottom: 30,
                      ),
                      child: Text(
                        '''Download and watch offline 
wherever you are''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: introSubtitleText,
                          fontWeight: textWeightDefault,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: neonGreen,
                            blurRadius: 40,
                            spreadRadius: -18,
                            offset: const Offset(30, 0),
                          ),
                          BoxShadow(
                            color: neonPink,
                            blurRadius: 40,
                            spreadRadius: -18,
                            offset: const Offset(-30, 0),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                              neonPink,
                              neonGreen,
                            ]),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(300),
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0))),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 30,
                            ),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textColor,
                                fontSize: movieSubtitleText,
                                fontWeight: textWeightDefault,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                children: List.generate(
                    introScreenCarousel.length,
                    (index) => Padding(
                          padding:
                              const EdgeInsets.only(left: defaultPadding / 4),
                          child: IndicatorDot(isActive: index == _currentPage),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: isActive ? neonGreen : Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
