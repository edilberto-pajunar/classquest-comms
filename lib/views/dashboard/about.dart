import 'package:classquest/constants/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.purple.shade200.withOpacity(0.3),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              25.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: GoogleFonts.pressStart2p(
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              child: Text(
                "ClassQuest is a student portal program that will help students to have an enjoyable learning experience to satisfy their boredom in education. With this adventure, they will be able to expand their English grammar skills and vocabulary in an interesting and exciting way.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
