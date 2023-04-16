import 'dart:html';
import 'dart:io';
import 'dart:typed_data';

import 'package:classquest/constants/global_variable.dart';
import 'package:classquest/provider/image_data.dart';
import 'package:classquest/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<Uint8List> getImageBytes() async {
    final input = FileUploadInputElement();
    input.accept = 'image/*';
    input.click();
    await input.onChange.first;
    final file = input.files!.first;
    final reader = FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoad.first;
    return Uint8List.fromList(reader.result as List<int>);
  }

  @override
  Widget build(BuildContext context) {
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
                  Consumer<ImageDataProvider>(
                    builder: (context, imageData, child) => Row(
                      children: [
                        (imageData.imageBytes != null)
                            ? ClipOval(
                                child: Image.memory(
                                  imageData.imageBytes,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              )
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
                            label: "Change",
                            onPressed: () async {
                              final bytes = await getImageBytes();
                              context.read<ImageDataProvider>().imageBytes =
                                  bytes;
                            }),
                      ],
                    ),
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
