import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatefulWidget {
  @override
  LoginAppState createState() {
    return new LoginAppState();
  }
}

class LoginAppState extends State<LoginApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) =>
    MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
    );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

  AnimationController iconAnimationController;
  Animation<double> iconAnimation;

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
      super.initState();
      iconAnimationController = AnimationController(
       vsync: this,
       duration: Duration(milliseconds: 300)         
      );
      iconAnimation = CurvedAnimation(
        parent: iconAnimationController,
        curve: Curves.easeOut
      );
      iconAnimation.addListener(() => this.setState((){}));
      iconAnimationController.forward();
    }

  @override
  Widget build(BuildContext context) =>
  Scaffold(
    backgroundColor: Colors.black,
    body: loginBody(),
    );
}

Widget loginBody() =>
  Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Image(
        image: AssetImage("fire.jpg"),
        fit: BoxFit.scaleDown,
        color: Colors.black54,
        colorBlendMode: BlendMode.darken,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(
            size: iconAnimation.value * 100,
          ),
          Form(
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.pink,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Colors.pink,
                    fontSize: 20.0,
                  )
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(40.0), 
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter password",
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                    ),
                    MaterialButton(
                      height: 40.0,
                      minWidth: 120.0,
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text('Login'), // Icon(Icons.arrow_right)
                      onPressed: () => {},
                      splashColor: Colors.pinkAccent[100],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );