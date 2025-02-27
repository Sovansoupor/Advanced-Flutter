import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_location_picker.dart';
// import 'package:week_3_blabla_project/model/ride/locations.dart';

import '../../model/ride_pref/ride_pref.dart';
import '../../utils/animations_util.dart';

class RideScreen extends StatefulWidget {
  final RidePref? initialRidePref;

  const RideScreen({super.key, this.initialRidePref});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  onRidePrefSelected(RidePref ridePref) {
    // 1 - Navigate to the rides screen (with a buttom to top animation)
    Navigator.of(context).push(AnimationUtils.createBottomToTopRoute(
        RideScreen(initialRidePref: ridePref)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlaLocationPicker(),

        ],
      ),
    );
  }
}


class RideTiles extends StatelessWidget {
  const RideTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
