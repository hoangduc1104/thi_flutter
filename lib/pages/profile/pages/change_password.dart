import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phuoc_duc_baithi/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/models/user.dart';
import 'package:phuoc_duc_baithi/pages/HomePage.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/edit_description.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/edit_email.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/edit_image.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/edit_name.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/edit_phone.dart';
import 'package:phuoc_duc_baithi/provider/user_provider.dart';
import 'package:phuoc_duc_baithi/widgets/ItemAppBar.dart';
import 'package:provider/provider.dart';
import '../widgets/display_image_widget.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _oldPassword = "";
    String _newPassword = "";
    String _confirmPassword = "";

    void _changeOldPassword(String oldpassword) {
      _oldPassword = oldpassword;
    }

    void _changeNewPassword(String newPassword) {
      _newPassword = newPassword;
    }

    void _changeConfirmPassword(String confirmPassword) {
      _confirmPassword = confirmPassword;
    }

    return Scaffold(
      body: Column(
        children: [
          ItemAppBar(
            name: "Change password",
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Padding(
              padding: EdgeInsets.only(top: 20, right: 50, left: 50),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: _changeOldPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset('assets/icons/password.svg'),
                        hintText: 'Old Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: _changeNewPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset('assets/icons/password.svg'),
                        hintText: 'New Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: _changeConfirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset('assets/icons/password.svg'),
                        hintText: 'Confirm password',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (_newPassword == _confirmPassword) {
                        try {
                          ApiClient().changePassword(
                              oldpassword: _oldPassword,
                              newPassword: _newPassword);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Change password success')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid information')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid information')));
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromRGBO(255, 185, 5, 1)),
                        alignment: Alignment.center,
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Change password',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(User user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
