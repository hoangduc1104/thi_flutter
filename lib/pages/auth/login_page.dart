import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phuoc_duc_baithi/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/pages/HomePage.dart';
import 'package:phuoc_duc_baithi/pages/auth/sign_page.dart';
import 'package:phuoc_duc_baithi/token/token.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              child: Image.asset('assets/images/loginPage.jpg'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  _LoginField(),
                  SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: Text(
                      'Or login with...',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
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
                    height: 24,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to WannaShop? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Register',
                          style:
                              TextStyle(color: Color.fromRGBO(255, 185, 5, 1)),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 24,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _LoginField extends StatefulWidget {
  const _LoginField({Key? key}) : super(key: key);

  @override
  __LoginFieldState createState() => __LoginFieldState();
}

class __LoginFieldState extends State<_LoginField> {
  String _Email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  void _changeEmail(String Email) {
    _Email = Email;
  }

  void _changePassword(String password) {
    _password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid Email';
                  }
                  return null;
                },
                onChanged: _changeEmail,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset('assets/icons/user.svg'),
                  hintText: 'Email',
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
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  try {
                    await ApiClient()
                        .getToken(email: _Email, password: _password)
                        .then((String result) {
                      if (result != null) {
                        Token().writeToken(value: result);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    });
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('email or password are incorrect')));
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
                        'Login',
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

class LoginButton extends StatelessWidget {
  final String label;
  final String Email;
  final String password;
  const LoginButton(
      {Key? key,
      required this.label,
      required this.Email,
      required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //ApiClient().getToken();
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
                label,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}

class Link extends StatelessWidget {
  final double scale;
  final String image;
  const Link({Key? key, required this.scale, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: 80,
        height: 40,
        child: Container(
          color: Colors.transparent,
          width: 25,
          height: 25,
          child: SvgPicture.asset(
            image,
          ),
        ));
  }
}
