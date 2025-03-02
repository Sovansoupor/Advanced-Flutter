import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride/widgets/ride_tiles.dart';
import 'package:week_3_blabla_project/screens/ride/widgets/ride_bar.dart';

import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';

class RideScreen extends StatefulWidget {
  final RidePref initialRidePref;

  const RideScreen({super.key, required this.initialRidePref});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  List<Ride> get matchingRides =>
      RidesService.getRidesFor(widget.initialRidePref);

      

  void onFilterPressed() {
    //("onFilterPressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            // 1. search bar
            RideBar(
              ridePref: widget.initialRidePref,
              onFilterPressed: onFilterPressed,
            ),

            // 2. display ride tiles
            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder:
                    (ctx, index) =>
                        RideTiles(ride: matchingRides[index], onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
