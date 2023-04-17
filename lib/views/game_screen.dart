import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/provider/random_word_provider.dart';
import 'package:classquest/views/dashboard_screen.dart';
import 'package:classquest/widgets/levels/level_one.dart';
import 'package:classquest/widgets/levels/maze_widget_1.dart';
import 'package:classquest/widgets/levels/maze_widget_2.dart';
import 'package:classquest/widgets/levels/maze_widget_3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/levels/level_two.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LevelOne(),
    );
  }
}
