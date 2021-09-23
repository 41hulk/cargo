import 'package:cargo/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackScreen extends StatefulWidget {
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //     Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => ConfirmScreen(),
              //   ),
              // );
            },
            child: Text('Track by bill of Loading '),
            style: ElevatedButton.styleFrom(
                primary: cargoDarkBlue,
                fixedSize: Size(260, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              // Respond to button press
            },
            child: Text('Track by chassis no/container no'),
            style: ElevatedButton.styleFrom(
                primary: cargoDarkBlue,
                fixedSize: Size(260, 80),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          )
        ],
      ),
    );
  }
}
