// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sasing_prelims/constants.dart';
import 'package:sasing_prelims/image_data.dart';
import 'package:sasing_prelims/screens/components/movie_posters.dart';
import 'package:sasing_prelims/screens/components/search_bar.dart';
import 'package:sasing_prelims/screens/movie_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlaceholderIcon = Opacity(
      opacity: 0,
      child: IconButton(onPressed: () {}, icon: Icon(Icons.no_cell)));
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(40 / 360),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: neonBlue.withOpacity(0.15),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: neonBlue.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  neonPink,
                  neonBlue,
                ]),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(300),
            ),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(321 / 360),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: Image(
                  image: AssetImage("assets/plus-icon.png"),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(-200, -10),
              color: neonGreen.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 100,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
                neonGreen.withOpacity(0.1),
                Color.fromARGB(0, 0, 0, 0),
              ]),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              BottomAppBar(
                shape: CircularNotchedRectangle(),
                clipBehavior: Clip.none,
                notchMargin: 4,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: bgColor,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/home-icon.png"),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/watch-icon.png"),
                      label: 'test',
                    ),
                    BottomNavigationBarItem(
                      icon: PlaceholderIcon,
                      label: 'test1',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/file-icon.png"),
                      label: 'test1',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/download-icon.png"),
                      label: 'test1',
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration:
                      BoxDecoration(color: Colors.transparent, boxShadow: [
                    BoxShadow(
                      color: neonGreen.withOpacity(0.35),
                      blurRadius: 60,
                      spreadRadius: -15,
                      offset: const Offset(-60, 10),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: neonGreen,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
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
            left: 250,
            top: 200,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: neonPink,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 60,
                  sigmaY: 60,
                ),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: titleVerticalPadding,
                    ),
                    child: Text(
                      'What would you\n like to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: titleMediumText,
                        fontWeight: textWeightBold,
                      ),
                    ),
                  ),
                  SearchBar(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: titleVerticalPadding,
                      left: defaultPadding,
                      bottom: titleVerticalPadding,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'New Movies',
                        style: TextStyle(
                          color: textColor,
                          fontSize: homeSubtitleText,
                          fontWeight: textWeightDefault,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = firstMovie;
                        } else if (index == newMovies.length - 1) {
                          mask = lastMovie;
                        } else {
                          mask = centerMovie;
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                            ),
                            height: 160,
                            width: 142,
                            child: MoviePosters(
                              asset: newMovies[index],
                              mask: mask,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: titleVerticalPadding,
                      left: defaultPadding,
                      bottom: titleVerticalPadding,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                          color: textColor,
                          fontSize: homeSubtitleText,
                          fontWeight: textWeightDefault,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingMovies.length,
                      itemBuilder: (context, index) {
                        String mask;
                        if (index == 0) {
                          mask = firstMovie;
                        } else if (index == upcomingMovies.length - 1) {
                          mask = lastMovie;
                        } else {
                          mask = centerMovie;
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: index == 0 ? 20 : 0,
                            ),
                            height: 160,
                            width: 142,
                            child: MoviePosters(
                              asset: upcomingMovies[index],
                              mask: mask,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
