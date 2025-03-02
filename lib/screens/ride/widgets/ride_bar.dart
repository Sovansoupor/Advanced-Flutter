
import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class RideBar extends StatefulWidget {
  final RidePref ridePref;
  final VoidCallback onFilterPressed;

  const RideBar({  required this.ridePref,required this.onFilterPressed,super.key});

  @override
  State<RideBar> createState() => _RideBarState();
}

class _RideBarState extends State<RideBar> {

  //// onRidePrefPressed method
  void onBackButtonPressed() {
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: BlaColors.backgroundAccent,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
      ),

          child: Row(
            children: [
              // 1- Back button
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: onBackButtonPressed,
              ),

              
              // 2- Filter button
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: widget.onFilterPressed,
              ),
            ],
            ),
    );
  }
}

