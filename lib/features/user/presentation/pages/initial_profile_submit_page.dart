import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone_flutter/features/app/const/app_const.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';
import 'package:whatsapp_clone_flutter/features/home/home_page.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/widgets/account/next_button.dart';

import '../../../app/global/widgets/profile_widget.dart';

class InitialProfileSubmitPage extends StatefulWidget {
  final String phoneNumber;

  const InitialProfileSubmitPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<InitialProfileSubmitPage> createState() =>
      _InitialProfileSubmitPageState();
}

class _InitialProfileSubmitPageState extends State<InitialProfileSubmitPage> {
  File? _image;
  final TextEditingController _usernameController = TextEditingController();

  Future selectImage() async {
    try {
      final pickedFile = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          debugPrint("NO IMAGE HAS BEEN SELECTED");
        }
      });
    } catch (e) {
      toast("SOME ERROR OCCURRED $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Profile Info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please provide your name and an optional profile photo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: textColor),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: selectImage,
              child: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: profileWidget(image: _image),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 1.5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: tabColor,
                    width: 1.5,
                  ),
                ),
              ),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: textColor),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NextButton(
              onPressed: () {
                /*Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false,
                );*/
              },
              title: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
