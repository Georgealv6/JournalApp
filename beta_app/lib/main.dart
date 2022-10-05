import 'package:journalapp/UI/journal.dart';
import 'package:journalapp/UI/profile.dart';
//import 'package:journalapp/bloc/blocs/user_bloc.dart';
//import 'package:journalapp/bloc/resources/repository.dart';
import 'package:journalapp/colors/constants.dart';
import 'package:journalapp/UI/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              color: mHeaderColor,
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          headline5: TextStyle(
              color: Colors.brown,
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          headline6: TextStyle(
              color: Colors.brown,
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          headline4: TextStyle(
              color: Colors.brown,
              fontFamily: 'LibreBaskerville',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
          button: TextStyle(color: kPrimaryColor),
          headline1:
              TextStyle(color: Colors.brown, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown),
          ),
        ),
      ),
      home: const Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _Welcome createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  String apiKey = "";
  // final Repository _respository = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApiKey(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          apiKey = snapshot.data;
          // tasksBloc = TaskBloc(apiKey);
          print(apiKey);
        } else {
          print("nodata");
        }
        return apiKey.isNotEmpty
            ? welcomepage()
            : LoginSignupScreen(
                login: login,
              );
      },
    );
  }

  void login() {
    setState(() {
      build(context);
    });
  }

  Future getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("API_Token");
  }

  Widget welcomepage() {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/journal.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\nJOURNAL'D\n",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      TextSpan(
                        text: "IT STARTS WITH YOU",
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return WrittenNotes();
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kPrimaryColor,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "START JOURNALING ",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          "Profile",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage();
                            },
                          ));
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "Logout?",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          logout();
                        },
                      ),
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

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("API_Token", "");
    setState(() {
      build(context);
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
