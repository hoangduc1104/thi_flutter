import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phuoc_duc_baithi/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/models/user.dart';
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
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getMe();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    String _name = userProvider.user.name;
    String _email = userProvider.user.email;
    String _phone = userProvider.user.phone;

    void _changeName(String name) {
      _name = name;
    }

    void _changeEmail(String email) {
      _email = email;
    }

    void _changePhone(String phone) {
      _phone = phone;
    }

    return Scaffold(
      body: Column(
        children: [
          ItemAppBar(
            name: "Profile",
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Container(
              child: Container(
                  child: Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(64, 105, 225, 1),
            ),
          ))),
          InkWell(
              onTap: () {
                navigateSecondPage(EditImagePage());
              },
              child: DisplayImage(
                imagePath:
                    'https://www.shutterstock.com/image-vector/vector-icon-human-10-eps-600w-778054297.jpg',
                onPressed: () {},
              )),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        onChanged: _changeName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: SvgPicture.asset('assets/icons/user.svg'),
                          hintText: "Name",
                        ),
                        controller: TextEditingController(text: _name),
                      )),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      onChanged: _changeEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset('assets/icons/email.svg'),
                        hintText: 'Email ID',
                      ),
                      controller: TextEditingController(text: _email),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      onChanged: _changePhone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: SvgPicture.asset('assets/icons/user.svg'),
                        hintText: 'Phone',
                      ),
                      controller: TextEditingController(text: _phone),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50, left: 50),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      ApiClient().updateUser(
                          name: _name, email: _email, phone: _phone);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Update success')));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid information')));
                    }
                  },
                  child: Text('Update')),
            ),
          )
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
