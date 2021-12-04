import "package:flutter/material.dart";
import 'package:navigation_bar/constants/page_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static TextEditingController phoneTextFieldController = TextEditingController();
  static TextEditingController otpOneTextFieldController = TextEditingController();
  static TextEditingController otpTwoTextFieldController = TextEditingController();
  static TextEditingController otpThreeTextFieldController = TextEditingController();
  static TextEditingController otpFourTextFieldController = TextEditingController();
  static FocusNode otpOneFocusNode = FocusNode();
  static FocusNode otpTwoFocusNode = FocusNode();
  static FocusNode otpThreeFocusNode = FocusNode();
  static FocusNode otpFourFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                width: 70,
                child: const Text("手機號碼"),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: phoneTextFieldController,
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("發送簡訊"),
              ),
            ]),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  width: 70,
                  child: const Text("OTP"),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enableIMEPersonalizedLearning: false,
                    decoration: const InputDecoration(
                      hintText: "",
                      counterText: "",
                    ),
                    controller: otpOneTextFieldController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    focusNode: otpOneFocusNode,
                    onChanged: (value) {
                      otpTwoFocusNode.requestFocus();
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enableIMEPersonalizedLearning: false,
                    decoration: const InputDecoration(
                      hintText: "",
                      counterText: "",
                    ),
                    controller: otpTwoTextFieldController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    focusNode: otpTwoFocusNode,
                    onChanged: (value) {
                      otpThreeFocusNode.requestFocus();
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enableIMEPersonalizedLearning: false,
                    decoration: const InputDecoration(
                      hintText: "",
                      counterText: "",
                    ),
                    controller: otpThreeTextFieldController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    focusNode: otpThreeFocusNode,
                    onChanged: (value) {
                      otpFourFocusNode.requestFocus();
                    },
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    enableIMEPersonalizedLearning: false,
                    decoration: const InputDecoration(
                      hintText: "",
                      counterText: "",
                    ),
                    controller: otpFourTextFieldController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    focusNode: otpFourFocusNode,
                    onChanged: (value) {
                      verifyOptLogin(context);
                    },
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     verifyOptLogin(context);
            //   },
            //   child: Text("登入"),
            // ),
          ],
        ),
      ),
    );
  }

  void verifyOptLogin(BuildContext context) {
    String phoneNum = phoneTextFieldController.text;
    String otpOneStr = otpOneTextFieldController.text;
    String otpTwoStr = otpTwoTextFieldController.text;
    String otpThreeStr = otpThreeTextFieldController.text;
    String otpFourStr = otpFourTextFieldController.text;
    if (phoneNum.trim().isEmpty || otpOneStr.trim().isEmpty || otpTwoStr.trim().isEmpty || otpThreeStr.trim().isEmpty || otpFourStr.trim().isEmpty) {
      return;
    }
    String fullOtp = otpOneStr + otpTwoStr + otpThreeStr + otpFourStr;
    debugPrint("phoneNum $phoneNum \notp $fullOtp");
    Navigator.pushNamed(
      context,
      PageConstants.homePage,
    );
  }
}
