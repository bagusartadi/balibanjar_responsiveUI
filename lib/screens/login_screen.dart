import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/artadot.dart';
import 'package:flutter_facebook_responsive_ui/screens/nav_homescreen.dart';
import 'package:flutter_facebook_responsive_ui/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [WarnaArtadi.warnadasar, Colors.white10],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.6, 1.0])),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 25.0),
              child: Column(
                children: [
                  Text('Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 40),
                  _setBoxLogin(text: "Email", icon: Icons.email_outlined),
                  _setBoxLogin(
                      text: "Password",
                      icon: Icons.vpn_key_outlined,
                      obscureText: true),
                  _forgotPassword(),
                  _rememberME(),
                  _loginButton(),
                  _alternativeSignIN(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _alternativeSignIN(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Text(
            "--OR--",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Text(
            "Sign in with",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _logoSignIn("FB"),
              _logoSignIn("BB"),
            ],
          ),
        ),
        _signUP(context),
      ],
    );
  }

  Widget _signUP(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationScreen()));
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "Don\'t have an account?   ",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          TextSpan(
              text: "Sign Up here",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  Widget _logoSignIn(String huruf) {
    return Container(
      height: 60.0,
      width: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5.0, color: Colors.black, offset: Offset(0, 5))
          ]),
      child: Text(
        huruf,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 55.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: WarnaArtadi.warnadua,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 6.0, offset: Offset(0, 5))
          ]),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavHomeScreen()));
        },
        textColor: Colors.white,
        child: Text(
          "Login",
          style: TextStyle(letterSpacing: 2.0, fontSize: 25.0),
        ),
      ),
    );
  }

  Widget _rememberME() {
    return Container(
      height: 25.0,
      child: Row(
        children: [
          Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: WarnaArtadi.warnadua,
              visualDensity: VisualDensity.comfortable,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              }),
          Text(
            "remember ME",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }

  Widget _forgotPassword() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 25,
        alignment: Alignment.centerRight,
        child: MaterialButton(
          onPressed: () {
            print('password');
          },
          child: Text(
            "forgot password",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
        ));
  }

  Widget _setBoxLogin({String text, IconData icon, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 20)),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              height: 60,
              decoration: BoxDecoration(
                  color: WarnaArtadi.warnadasar,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 6.0,
                        offset: Offset(0, 5))
                  ]),
              child: TextFormField(
                style: TextStyle(fontSize: 30, color: Colors.white70),
                // textInputAction: TextInputAction.search,
                keyboardType: TextInputType.emailAddress,
                obscureText: obscureText,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
