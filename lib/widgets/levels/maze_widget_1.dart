import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/views/dashboard/home.dart';
import 'package:classquest/views/dashboard_screen.dart';
import 'package:classquest/widgets/controls_widget.dart';
import 'package:classquest/widgets/levels/level_one.dart';
import 'package:classquest/widgets/levels/level_two.dart';
import 'package:classquest/widgets/levels/maze_widget_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/random_word_provider.dart';

int _indexLevel = 1;

class MazeLevelOne extends StatefulWidget {
  @override
  _MazeLevelOneState createState() => _MazeLevelOneState();
}

class _MazeLevelOneState extends State<MazeLevelOne> {
  final List<List<dynamic>> _maze = [
    [true, true, true, true, true, true, true, true],
    [true, false, false, false, true, false, false, true],
    [true, true, true, false, true, true, false, true],
    [true, false, false, false, false, false, false, true],
    [false, false, false, false, false, false, false, false],
    [true, false, false, false, false, false, false, true],
    [true, true, true, true, true, true, true, true],
  ];

  int _playerX = 1;
  int _playerY = 1;

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: _maze[0].length,
        ),
        itemCount: _maze.length * _maze[0].length,
        itemBuilder: (BuildContext context, int index) {
          int x = index % _maze[0].length;
          int y = index ~/ _maze[0].length;
          if (_maze[y][x] == true) {
            return Container(
              color: Colors.black,
            );
          } else if (x == _playerX && y == _playerY) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  tAvatar,
                ),
              )),
            );
          } else {
            return Container(
              color: Colors.white,
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ControlsWidget(
              icon: Icons.arrow_drop_up,
              onPressed: () {
                // Move player up
                if (_playerY > 0 && !_maze[_playerY - 1][_playerX]) {
                  setState(
                    () {
                      _playerY--;
                    },
                  );
                } else {
                  finish();
                }
              }),
          ControlsWidget(
              icon: Icons.arrow_right,
              onPressed: () {
                // Move player right
                if (_playerX < _maze[0].length - 1 &&
                    !_maze[_playerY][_playerX + 1]) {
                  setState(() {
                    _playerX++;
                  });
                } else {
                  finish();
                }
              }),
          ControlsWidget(
              icon: Icons.arrow_drop_down,
              onPressed: () {
                // Move player down
                if (_playerY < _maze.length - 1 &&
                    !_maze[_playerY + 1][_playerX]) {
                  setState(
                    () {
                      _playerY++;
                    },
                  );
                } else {
                  finish();
                }
              }),
          ControlsWidget(
            icon: Icons.arrow_left,
            onPressed: () {
              // Move player left
              if (_playerX > 0 && !_maze[_playerY][_playerX - 1]) {
                setState(() {
                  _playerX--;
                });
              } else {
                finish();
              }
            },
          ),
        ],
      ),
    );
  }

  void finish() async {
    if (_playerX == 0 && _playerY == 4) {
      try {
        audioPlayer.play(UrlSource(tCorrectAudio));
      } catch (e) {
        print("error: $e");
        audioPlayer.play(UrlSource(tCorrectAudio));
      }
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          final provider =
              Provider.of<RandomWordProvider>(context, listen: false);
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check),
                ),
              ],
            ),
            content: Text('${provider.explanationWord}'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  // Reset player position

                  if (provider.number < 5) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LevelOne()));
                    provider.addNumber();
                    provider.generateRandomWord();
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LevelTwo()));
                  }
                },
              ),
            ],
          );
        },
      );
    } else if (_playerX == 7 && _playerY == 4) {
      try {
        audioPlayer.play(UrlSource(tWrongAudio));
      } catch (e) {
        print("error: $e");
        audioPlayer.play(UrlSource(tWrongAudio));
      }
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          final provider =
              Provider.of<RandomWordProvider>(context, listen: false);
          return AlertDialog(
            content: Text('${provider.explanationWord}'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You are wrong!',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close),
                ),
              ],
            ),
            actions: <Widget>[
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('Game over'),
                  onPressed: () {
                    // Reset player position
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  },
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
