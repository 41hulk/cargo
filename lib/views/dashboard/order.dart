import 'package:avatars/avatars.dart';
import 'package:cargo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'ORDERS',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: cargoDarkBlue),
                ),
              ),
              ListView.separated(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return _transactionCart();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionCart() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 50),
            // padding: EdgeInsets.only(right: 50),
            child: Avatar(
              name: 'NGNRI3132341',
              placeholderColors: [cargoGreen],
              backgroundColor: cargoGreen,
              textStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 32),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NGNRI3132341',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(
                'Shipping Line: Pacific International',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Destination: Bukavu',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                'Date: 2021-09-23',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                'Client: TR GENERAL SUPPLY',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
