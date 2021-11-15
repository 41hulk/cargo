import 'dart:convert';
import 'package:cargo/utils/authToken.dart';
import 'package:cargo/utils/colors.dart';
import 'package:cargo/views/dashboard/dash.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  Future<dynamic> logIn(
    String email,
    String pass,
  ) async {
    Map data = {
      'email': email,
      'password': pass,
    };

    if (validateAndSave()) {
      var response = await http.post(
        Uri.parse("$apiUrl/api/auth/login"),
        body: data,
      );

      var convertedDatatoJson = json.decode(response.body);
      if (convertedDatatoJson['success'] == true) {
        await storeUserData(convertedDatatoJson);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardScreen()),
            (Route<dynamic> route) => false);
      }
      if (convertedDatatoJson['success'] == false) {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: "Incorect Username or Password",
          ),
        );
      }
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 120.0,
        child: Image.asset('assets/images/cargologo.jpeg'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onChanged: (val) => _email = val,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Slow down,partner. We need your Email first';
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
          return 'Invalid Username';
        }
      },
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: GoogleFonts.poppins(fontSize: 15),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onChanged: (val) => _password = val,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Slow down,partner. We need your Password first';
        }
      },
    );
    final forgotpassword = Container(
      padding: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Text('Don\'t have an Account? '),
          InkWell(
            onTap: () async {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => SetPhoneScreen(),
              //   ),
              // );
            },
            child: new Text(
              "Forgot password ?",
              style: GoogleFonts.poppins(
                  color: cargoBlue, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 19.0),
      child: ElevatedButton(
        onPressed: () async {
          if (validateAndSave()) {
            logIn(_email, _password);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          primary: cargoDarkBlue,
          fixedSize: Size(200, 60),
        ),
        child: Text('LOGIN',
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
    );

    final signup = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an Account? ',
            style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
          ),
          InkWell(
            onTap: () async {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => SignUpScreen(),
              //   ),
              // );
            },
            child: new Text("Sign up",
                style: GoogleFonts.poppins(color: cargoBlue)),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  logo,
                  SizedBox(height: 40.0),
                  email,
                  SizedBox(height: 15.0),
                  password,
                  forgotpassword,
                  SizedBox(height: 12.0),
                  loginButton,
                  signup
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
