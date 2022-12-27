import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phuoc_duc_baithi/pages/auth/login_page.dart';
import 'package:phuoc_duc_baithi/api_clients/api_client.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 223,
                width: double.infinity,
                child: Image.asset('assets/images/signPage.webp'),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Link(
                          image: 'assets/icons/google.svg',
                          scale: 29,
                        ),
                        Link(
                          image: 'assets/icons/facebook.svg',
                          scale: 20,
                        ),
                        Link(
                          image: 'assets/icons/apple.svg',
                          scale: 35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text('Or register with email...',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    _SignField(),
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromRGBO(255, 185, 5, 1)),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}

class _SignField extends StatefulWidget {
  const _SignField({Key? key}) : super(key: key);

  @override
  __SignFieldState createState() => __SignFieldState();
}

class __SignFieldState extends State<_SignField> {
  final _formSignKey = GlobalKey<FormState>();
  String _email = '';
  String _name = '';
  String _password = '';
  String _confirmPassword = '';
  String _phonenumber = '';

  void _changeEmail(String email) {
    _email = email;
  }

  void _changeName(String name) {
    _name = name;
  }

  void _changePassword(String password) {
    _password = password;
  }

  void _changePhonenumber(String phonenumber) {
    _phonenumber = phonenumber;
  }

  void _changeConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formSignKey,
        child: Column(
          children: [
            Container(
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
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: TextFormField(
                onChanged: _changeName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset('assets/icons/user.svg'),
                  hintText: 'Name',
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
                onChanged: _changePhonenumber,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset('assets/icons/user.svg'),
                  hintText: 'Phonenumber',
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
                onChanged: _changePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset('assets/icons/password.svg'),
                  hintText: 'Password',
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
                if (_formSignKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  if (_password == _confirmPassword) {
                    try {
                      await ApiClient().register(
                          name: _name,
                          phone: _phonenumber,
                          email: _email,
                          password: _password);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Register success')));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid information')));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid information')));
                  }
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
                        'Sign up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
