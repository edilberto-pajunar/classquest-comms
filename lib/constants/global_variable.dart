import 'package:flutter/material.dart';

// colors
Color tBgColor = Colors.purple.shade200.withOpacity(0.3);

// image
const String tBg = "assets/images/bg.png";
const String tLogo = "assets/images/logo.png";
const String tAvatar = "assets/images/avatar.png";
const String tProfilePic = "assets/images/avatar_dp.png";

// audio
const String tCorrectAudio = "assets/audio/correct.ogg";
const String tWrongAudio = "assets/audio/wrong.ogg";

showSnackBar(String content, BuildContext context, bool isCorrect) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      content: Text(content),
      duration: Duration(seconds: 2),
    ),
  );
}
