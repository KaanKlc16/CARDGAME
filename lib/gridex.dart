import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_444/login_screen.dart';

class GridEx extends StatefulWidget {
  const GridEx({super.key});

  @override
  State<GridEx> createState() => _GridExState();
}

class _GridExState extends State<GridEx> {
  List<int> imageIndx = [];
  List<String> imageList = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/6.jpg',
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/6.jpg',
  ];

  List<bool> imageControl = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> isImageVisible = [];
  //Random _random = Random();
  int selectedContainerIndex = -1;
  String backCardValue = '';
  String selectedFirstImage = '';
  String selectedSecondImage = '';

  int selectedFirstIndex = -1;
  int selectedSecondIndex = -1;

  int allimagecount = 12;
  int score = 0;

  void increaseScore() {
    setState(() {
      score += 10;
    });
  }

  void resetGame() {
    setState(() {
      imageControl = List<bool>.filled(12, false);
      selectedFirstImage = '';
      selectedSecondImage = '';
      selectedFirstIndex = -1;
      selectedSecondIndex = -1;
      imageList.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 138, 47, 154),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: Icon(Icons.login),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 119, 51, 132),
          elevation: 5,
          flexibleSpace: const Image(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
          title: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.gamepad, color: Colors.white),
                SizedBox(width: 20),
                Text('Game Time'),
                SizedBox(width: 8),
                Icon(Icons.timer, color: Colors.white),
              ],
            ),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bodybackground.jpg'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeatX),
            ),
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 70,
                mainAxisExtent: 125,
              ),
              itemBuilder: (context, index) {
                backCardValue = (index + 1).toString();
                //int randomImageSelection = _random.nextInt(allimagecount) + 1;

                return GestureDetector(
                  onTap: () {
                    if (selectedFirstImage == '') {
                      setState(() {
                        selectedFirstIndex = index;
                        selectedFirstImage = imageList[index];
                        imageControl[index] = true;
                      });
                    } else {
                      setState(() {
                        selectedSecondImage = imageList[index];
                        selectedSecondIndex = index;
                        imageControl[index] = true;
                      });

                      if (selectedFirstImage == selectedSecondImage) {
                        setState(() {
                          selectedFirstIndex = -1;
                          selectedSecondIndex = -1;
                          selectedFirstImage = '';
                          selectedSecondImage = '';
                          increaseScore();
                        });
                      } else {
                        setState(() {
                          selectedFirstImage = '';
                          selectedSecondImage = '';
                          Timer(Duration(seconds: 1), () {
                            imageControl[selectedFirstIndex] = false;
                            imageControl[selectedSecondIndex] = false;
                            selectedFirstIndex = -1;
                            selectedSecondIndex = -1;
                            setState(() {});
                          });
                          // imageControl[selectedFirstIndex] = false;
                          //  imageControl[selectedSecondIndex] = false;
                        });
                      }
                    }
                    //
                  },
                  child: Visibility(
                    visible: imageControl[index],
                    replacement: Container(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      child: Center(
                        child: Text(
                          backCardValue,
                          style: const TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: 1,
                      child: Container(
                        color: const Color.fromARGB(255, 10, 10, 10),
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              imageList[index],
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(1),
          height: 50,
          color: Colors.black,
          child: Center(
            child: Container(
              color: const Color.fromARGB(1, 1, 1, 1),
              child: Text(
                ' Skor: $score',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resetGame();
          },
          backgroundColor: const Color.fromARGB(255, 1, 1, 1),
          child: const Icon(
            Icons.refresh,
          ),
        ));
  }
}
