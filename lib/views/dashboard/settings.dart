import 'dart:io';

import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/widgets/button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Uint8List webImage = Uint8List(8);
  File? _pickedImage;

  Future pickImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File("a");
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // try {

    // } on PlatformException catch (e) {
    //   print("Failed to pick Image: $e");
    // }

    return Container(
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
            "Profile",
            style: GoogleFonts.secularOne(
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Profile Picture",
                    style: GoogleFonts.pressStart2p(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      _pickedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.memory(
                                webImage,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                tProfilePic,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonWidget(
                          label: "Change", onPressed: () => pickImage()),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "New Username",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonWidget(
                        label: "Submit",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
