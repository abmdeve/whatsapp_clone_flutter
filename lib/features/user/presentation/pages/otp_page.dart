import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/pages/initial_profile_submit_page.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/widgets/account/next_button.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/widgets/account/pin_code_widget.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "Verify your OTP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: tabColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Enter your OTP for the WhatsApp Clone. Verification (so that you will be moved for further steps to complete)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PinCodeWidget(
                      otpController: _otpController, onComplete: (pinCode) {}),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            NextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const InitialProfileSubmitPage(),
                    ),
                );
              },
              title: "Next",
            ),
          ],
        ),
      ),
    );
  }
}
