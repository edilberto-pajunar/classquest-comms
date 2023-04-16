import 'package:audioplayers/audioplayers.dart';
import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/widgets/levels/level_three.dart';
import 'package:classquest/widgets/levels/maze_widget_3.dart';
import 'package:flutter/material.dart';

import '../../views/dashboard_screen.dart';
import '../controls_widget.dart';

class MazeLevelTwo extends StatefulWidget {
  @override
  _MazeLevelTwoState createState() => _MazeLevelTwoState();
}

class _MazeLevelTwoState extends State<MazeLevelTwo> {
  final List<List<dynamic>> _maze = [
    [
      true,
      true,
      true,
      true,
      true,
      false,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      true,
      true,
      true,
      true,
      false,
      false,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      true,
      true,
      true,
      true,
      false,
      true,
      true,
      false,
      true,
      true,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false
    ],
    [
      true,
      false,
      false,
      true,
      true,
      true,
      true,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      true
    ],
    [
      true,
      false,
      false,
      true,
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
      true
    ],
    [
      true,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      true,
      true,
      false,
      false,
      false,
      true
    ],
    [
      true,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true
    ],
    [
      true,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true
    ],
    [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true
    ],
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

  void finish() async {
    if (_playerX == 5 && _playerY == 0) {
      await audioPlayer.play(UrlSource(tCorrectAudio));
      showDialog(
        context: context,
        builder: (BuildContext context) {
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
            content: Text("You can now move to Level 3',"),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LevelThree()));
                  // Reset player position
                },
              ),
            ],
          );
        },
      );
    } else if (_playerX == 14 && _playerY == 8) {
      await audioPlayer.play(UrlSource(tCorrectAudio));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
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
                fit: BoxFit.cover,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
}
