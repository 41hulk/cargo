import 'package:cargo/utils/colors.dart';
import 'package:cargo/views/auth/loginScreen.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:avatars/avatars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfilecreenState createState() => _UserProfilecreenState();
}

class _UserProfilecreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Avatar(
                  name: 'Demo',
                  placeholderColors: [cargoLightBlue],
                  backgroundColor: Colors.black,
                  textStyle:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 32),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infocard('Name:', 'Ntare Guy'),
                    _infocard('User ID:', '424'),
                    _infocard('Phone:', '07802341234'),
                    _infocard('Email', 'demo@mikumifreight.com'),
                    SizedBox(height: 30),
                    _logout()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infocard(String label, String info) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: cargoDarkBlue),
          ),
          Text(
            info,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _logout() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.green[200],
      ),
      onPressed: () async {
        SharedPreferences storage = await SharedPreferences.getInstance();
        storage.remove('authtoken');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
            (Route<dynamic> route) => false);
      },
      child: Row(
        children: [
          SizedBox(width: 20),
          Expanded(
              child: Text(
            'Logout',
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.bold),
          )),
          Icon(
            Icons.logout,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
