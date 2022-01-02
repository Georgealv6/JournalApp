import 'package:journalapp/bloc/blocs/user_bloc.dart';
import 'package:journalapp/colors/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginSignupScreen extends StatefulWidget {
  final VoidCallback login;
  const LoginSignupScreen({Key? key, required this.login}) : super(key: key);

  @override
  _LoginSignupScreen createState() => _LoginSignupScreen();
}

class _LoginSignupScreen extends State<LoginSignupScreen> {
  String apiKey = "";
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  final TextEditingController _usernameContrl = TextEditingController();
  final TextEditingController _passwordContrl = TextEditingController();
  final TextEditingController _eMailContrl = TextEditingController();
  final TextEditingController _usernameContrllogin = TextEditingController();
  final TextEditingController _passwordContrllogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/journalMain.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 235, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: "Journal'd",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // shadow for sumbit button
          buildbottompos(true),
          //Main Container for login and signup
          Positioned(
            top: 290,
            child: Container(
              height: isSignupScreen ? 370 : 260,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 60,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.brown.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? kPrimaryColor2
                                      : Colors.brown[200]),
                            ),
                            if (!isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.brown,
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Sign-Up",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? kPrimaryColor2
                                      : Colors.brown[200]),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.brown,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  if (isSignupScreen) buildsignupsect(),
                  if (!isSignupScreen) buildloginsect(),
                ],
              ),
            ),
          ),
          // shadow for submit button
          if (isSignupScreen) buildbottompos(false),
          if (!isSignupScreen) buildbottomposLogin(false),
          //facebook & google buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                Text(
                  isSignupScreen ? "Or Signup with" : "or Login with",
                  style: const TextStyle(color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      socialbuttons(
                        Icons.facebook,
                        "Facebook",
                        Colors.blue.withOpacity(.90),
                      ),
                      socialbuttons(
                        Icons.email,
                        "Google",
                        Colors.deepOrange,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildloginsect() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          pagetextfield(Icons.mail_outline, "Username", false, true,
              _usernameContrllogin),
          pagetextfield(CupertinoIcons.lock, "Password", true, false,
              _passwordContrllogin),
          Padding(
            padding: const EdgeInsets.only(left: 170),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildsignupsect() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          pagetextfield(CupertinoIcons.person_2, "User Name", false, false,
              _usernameContrl),
          pagetextfield(
              CupertinoIcons.envelope, "E-Mail", false, false, _eMailContrl),
          pagetextfield(
              CupertinoIcons.lock, "Password", true, false, _passwordContrl),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale ? kPrimaryColor2 : Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color:
                                  isMale ? Colors.transparent : kPrimaryColor2,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          CupertinoIcons.person,
                          color: isMale ? Colors.white : kPrimaryColor,
                        ),
                      ),
                      const Text("Male",
                          style: TextStyle(color: kPrimaryColor2))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isMale ? Colors.transparent : kPrimaryColor,
                            border: Border.all(
                              color:
                                  isMale ? kPrimaryColor : Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          CupertinoIcons.person,
                          color: isMale ? kPrimaryColor : Colors.white,
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: kPrimaryColor2),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 240,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By pressing 'Sumbit' you agree to our ",
                style: TextStyle(color: kPrimaryColor),
                children: [
                  TextSpan(
                    //recognizer:
                    text: "terms & conditions",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// social buttons method
  TextButton socialbuttons(IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: const Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: backgroundColor,
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }

//submit button method for shawdow and container & route to main content
  Positioned buildbottompos(bool showShadow) {
    return Positioned(
      top: isSignupScreen ? 620 : 500,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.brown.withOpacity(.2),
                  spreadRadius: 1.5,
                  offset: const Offset(0, 1),
                )
            ],
          ),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor2.withOpacity(.95),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(.3),
                        spreadRadius: 1.5,
                        offset: const Offset(0, 1),
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                      });
                    },
                    child: MaterialButton(
                      onPressed: () {
                        if (_usernameContrl.text != null ||
                            _eMailContrl.text != null ||
                            _passwordContrl.text != null) {
                          userBloc
                              .registerUser(_usernameContrl.text,
                                  _eMailContrl.text, _passwordContrl.text)
                              .then((_) {
                            widget.login();
                          });
                        }
                        //   if (!isSignupScreen &&
                        //           _usernameContrllogin.text != null ||
                        //       _passwordContrllogin.text != null) {
                        //     userBloc
                        //         .loginUser(
                        //       _usernameContrllogin.text,
                        //       _passwordContrllogin.text,
                        //     )
                        //         .then((_) {
                        //       widget.login();
                        //     });
                        //   }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                )
              : const Center(),
        ),
      ),
    );
  }

  Positioned buildbottomposLogin(bool showShadow) {
    return Positioned(
      top: isSignupScreen ? 620 : 500,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              if (showShadow)
                BoxShadow(
                  color: Colors.brown.withOpacity(.2),
                  spreadRadius: 1.5,
                  offset: const Offset(0, 1),
                )
            ],
          ),
          child: !showShadow
              ? Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor2.withOpacity(.95),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(.3),
                        spreadRadius: 1.5,
                        offset: const Offset(0, 1),
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                      });
                    },
                    child: MaterialButton(
                      onPressed: () {
                        if (_usernameContrllogin.text != null ||
                            _passwordContrllogin.text != null) {
                          userBloc
                              .loginUser(
                            _usernameContrllogin.text,
                            _passwordContrllogin.text,
                          )
                              .then((_) {
                            widget.login();
                          });
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                )
              : const Center(),
        ),
      ),
    );
  }

//textfield for sign up and login
  Widget pagetextfield(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController user) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9.5),
      child: TextField(
        controller: user,
        style: const TextStyle(color: kPrimaryColor2),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        cursorColor: Colors.brown,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: kPrimaryColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor2),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.brown),
        ),
      ),
    );
  }
}
