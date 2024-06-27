import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/widgets/account/next_button.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';

//import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:whatsapp_clone_flutter/features/user/presentation/pages/otp_page.dart';

import '../widgets/account/phone_number.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  static Country _selectedFilteredDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode("242");
  static String _countryCode = _selectedFilteredDialogCountry.phoneCode;

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Verify your phone number",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: tabColor,
                    ),
                  ),
                  const Text(
                    "WhatsApp Clone will send you SMS message (carrier charges may apply) to verify your phone number. Enter the country code and phone number",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                    onTap: _openFilteredCountryPickerDialog,
                    title: _buildDialogItem(_selectedFilteredDialogCountry),
                  ),
                  //TODO PHONE NUMBER
                  PhoneNumber(
                      phoneController: _phoneController,
                      phoneCode: _selectedFilteredDialogCountry.phoneCode),
                ],
              ),
            ),

            //TODO NEXT BUTTON FOR NAVIGATE TO OTP SCREEN
            NextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OtpPage()));
              },
              title: "Next",
            ),
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
            data: Theme.of(context).copyWith(
              primaryColor: tabColor,
            ),
            child: CountryPickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: tabColor,
              searchInputDecoration: const InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: greyColor),
                //fillColor: textColor
              ),
              isSearchable: true,
              title: const Text(
                "Select your phone code",
                style: TextStyle(color: textColor),
              ),
              onValuePicked: (Country country) {
                setState(() {
                  _selectedFilteredDialogCountry = country;
                  _countryCode = country.phoneCode;
                });
              },
              itemBuilder: _buildDialogItem,
            )));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: tabColor, width: 1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Text(" +${country.phoneCode}",
              style: const TextStyle(color: textColor)),
          Expanded(
            child: Text(
              " ${country.name}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: textColor),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_drop_down,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
