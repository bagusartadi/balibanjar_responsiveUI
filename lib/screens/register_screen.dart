import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/artadot.dart';
import 'package:flutter_facebook_responsive_ui/screens/zscreens.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _checkKotakAll1 = false;
  bool _checkKotakFam1 = false;
  bool _checkKotakAll2 = false;
  bool _checkKotakFam2 = false;
  bool _checkKotakAll3 = false;
  bool _checkKotakFam3 = false;
  bool _checkKotakAll4 = false;
  bool _checkKotakFam4 = false;
  bool _checkKotakAll5 = false;
  bool _checkKotakFam5 = false;
  DateTime date;
  String getTextDate() {
    if (date == null) {
      return ('tanggal lahir');
    } else {
      return DateFormat('dd - MMM - yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WarnaArtadi.warnadasar,
        elevation: 0,
        title: Text(
          "Registration",
          style:
              TextStyle(fontSize: 25, color: Colors.white, letterSpacing: 1.3),
        ),
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                WarnaArtadi.warnadasar,
                WarnaArtadi.warnadua,
                Colors.white10
              ], stops: [
                0.3,
                0.5,
                0.7
              ], begin: Alignment.topLeft, end: Alignment.bottomRight))),
          Container(
            height: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  _kotakInput(text: "name", textType: TextInputType.name),
                  _checkBoxName(),
                  _kotakInput(
                      text: "tempat lahir", textType: TextInputType.text),
                  _checkBoxtmptlahir(),
                  _kotakInput(
                      text: getTextDate(),
                      textType: TextInputType.datetime,
                      press: () => pilihTanggal(context)),
                  _checkBoxtgllahir(),
                  _kotakInput(
                      text: "alamat rumah", textType: TextInputType.text),
                  _checkBoxalamat(),
                  _kotakInput(
                      text: "alamat email",
                      textType: TextInputType.emailAddress),
                  _checkBoxemail(),
                  _kotakInput(
                      text: "keahlian/bakat", textType: TextInputType.text),
                  _kotakInput(text: "pekerjaan", textType: TextInputType.text),
                  _kotakInput(text: "user ID", textType: TextInputType.text),
                  _kotakInput(
                      text: "password",
                      textType: TextInputType.text,
                      obscure: true),
                  _kotakInput(
                      text: "re-type password",
                      textType: TextInputType.text,
                      obscure: true),
                  _registrationButton(),
                  _alreadyhvLogin(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pilihTanggal(BuildContext context) async {
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now());
    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  GestureDetector _alreadyhvLogin(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("login");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 50.0),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "already have an account?  ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic)),
          TextSpan(
              text: "LOGIN HERE",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic))
        ])),
      ),
    );
  }

  Container _registrationButton() {
    return Container(
      height: 70.0,
      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
      decoration: BoxDecoration(
          color: WarnaArtadi.warnaempat,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 6.0, offset: Offset(0, 6))
          ]),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        minWidth: double.infinity,
        textColor: Colors.white,
        child: Text(
          "* * Registration * *",
          style: TextStyle(fontSize: 25, letterSpacing: 1.5),
        ),
      ),
    );
  }

  Widget _checkBoxemail() {
    return Row(
      children: [
        Checkbox(
          value: _checkKotakAll5,
          onChanged: (valueName) {
            setState(() {
              _checkKotakAll5 = valueName;
              _checkKotakFam5 = valueName;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "Hide from all",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(width: 10.0),
        Checkbox(
          value: _checkKotakFam5,
          onChanged: (valueFam) {
            setState(() {
              _checkKotakFam5 = valueFam;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "only for family",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _checkBoxalamat() {
    return Row(
      children: [
        Checkbox(
          value: _checkKotakAll4,
          onChanged: (valueName) {
            setState(() {
              _checkKotakAll4 = valueName;
              _checkKotakFam4 = valueName;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "Hide from all",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(width: 10.0),
        Checkbox(
          value: _checkKotakFam4,
          onChanged: (valueFam) {
            setState(() {
              _checkKotakFam4 = valueFam;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "only for family",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _checkBoxtmptlahir() {
    return Row(
      children: [
        Checkbox(
          value: _checkKotakAll2,
          onChanged: (valueName) {
            setState(() {
              _checkKotakAll2 = valueName;
              _checkKotakFam2 = valueName;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "Hide from all",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(width: 10.0),
        Checkbox(
          value: _checkKotakFam2,
          onChanged: (valueFam) {
            setState(() {
              _checkKotakFam2 = valueFam;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "only for family",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _checkBoxtgllahir() {
    return Row(
      children: [
        Checkbox(
          value: _checkKotakAll3,
          onChanged: (valueName) {
            setState(() {
              _checkKotakAll3 = valueName;
              _checkKotakFam3 = valueName;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "Hide from all",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(width: 10.0),
        Checkbox(
          value: _checkKotakFam3,
          onChanged: (valueFam) {
            setState(() {
              _checkKotakFam3 = valueFam;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "only for family",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _checkBoxName() {
    return Row(
      children: [
        Checkbox(
          value: _checkKotakAll1,
          onChanged: (valueName) {
            setState(() {
              _checkKotakAll1 = valueName;
              _checkKotakFam1 = valueName;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "Hide from all",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        SizedBox(width: 10.0),
        Checkbox(
          value: _checkKotakFam1,
          onChanged: (valueFam) {
            setState(() {
              _checkKotakFam1 = valueFam;
            });
          },
          activeColor: Colors.white,
          checkColor: Colors.red,
          visualDensity: VisualDensity.comfortable,
        ),
        Text(
          "only for family",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _kotakInput(
      {String text,
      TextInputType textType,
      bool obscure = false,
      Function press}) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: WarnaArtadi.warnadua,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 6.0, offset: Offset(0, 5))
          ]),
      child: TextFormField(
        onTap: press,
        style: TextStyle(fontSize: 25.0, color: Colors.white),
        cursorHeight: 25.0,
        autocorrect: false,
        keyboardType: textType,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: text,
          labelStyle: TextStyle(color: Colors.white60),
        ),
      ),
    );
  }
}
