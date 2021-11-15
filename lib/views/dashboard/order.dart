import 'package:avatars/avatars.dart';
import 'package:cargo/services/orders.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cargoBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Orders',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
            future: getAllOrders(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          _transactionCart(
                            snapshot.data[index]['bill_lading'],
                            snapshot.data[index]['shipping_line'],
                            snapshot.data[index]['destination'],
                            snapshot.data[index]['eta'],
                            snapshot.data[index]['client_name'],
                          )
                        ],
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  Widget _transactionCart(billLoading, line, dest, eta, client) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE0E0E0))),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spacB,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.only(right: 50),
            // padding: EdgeInsets.only(right: 50),
            child: Avatar(
              name: '$billLoading',
              placeholderColors: [cargoGreen],
              backgroundColor: cargoGreen,
              textStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 32),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$billLoading',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  'Shipping Line: $line',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Destination: $dest',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Date: $eta',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Client: $client',
                  style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
