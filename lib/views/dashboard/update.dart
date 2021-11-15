import 'package:avatars/avatars.dart';
import 'package:cargo/services/orders.dart';
import 'package:cargo/utils/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cargoBlue,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Update status',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Brazil"),
            )
          ],
        ),
      ),
    );
  }
}
