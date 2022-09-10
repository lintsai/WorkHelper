import 'package:flutter/material.dart';
import 'package:navigation_bar/constants/page_constants.dart';
import 'package:navigation_bar/dao/db_factory.dart';
import 'package:navigation_bar/dao/model/user_profile.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    Future<UserProfile?> userProfileFuture =DbFactory.getUserProfile();
    userProfileFuture.then((value) {
      if(value != null){
        setState(() {
          phoneNumber = value.phoneNumber;
        });
      }
    });
    return Column(
      children: [
        Row(
          children: [
            Text(phoneNumber)
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                DbFactory.deleteUserProfile();
                Navigator.popAndPushNamed(context, PageConstants.loginPage);
              },
              child: const Text("登出"),
            )
          ],
        )
      ],
    );
  }
}

