import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/ride_pref_tile.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_location_picker.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../ride/ride_screen.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    final ridePref = widget.initRidePref;

    // if have values, set them
    if (ridePref != null) {
      departure = ridePref.departure;
      arrival = ridePref.arrival;
      departureDate = ridePref.departureDate;
      requestedSeats = ridePref.requestedSeats;

      // if no values, set default values
    } else {
      departure = null;
      arrival = null;
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  //// 1 - Handle the selection of the departure location

  // when the user taps on the departure tile, navigate to the RideScreen
  void onDepartureSelected() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: departure),
      ),
    );
    // if a location is selected, update the state
    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  //// 2 - Handle the selection of the arrival location
  void onArrivalSelected() async {
    final Location? selectedLocation = await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: arrival),
      ),
    );
    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  //// 3 - Handle the submission of the form
  void onSubmit() {
    if (departure != null && arrival != null) {
      // Only create the RidePref if both departure and arrival are selected
      RidePref newRidePref = RidePref(
        departure: departure!, 
        departureDate: departureDate,
        arrival: arrival!, 
        requestedSeats: requestedSeats,
      );

      // navigate to the RideScreen
      Navigator.of(context).push(
        AnimationUtils.createBottomToTopRoute(
          RideScreen(initialRidePref: newRidePref), // Passing the RidePref
        ),
      );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //         content:
    //             Text("Please select both departure and arrival locations.")),
    //   );
    }
  }

  //// 4- Handle the swap of the locations
  void onSwapLocations() {
    setState(() {
      Location? temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }


  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  String get departureName =>
      departure != null ? departure!.name : "Leaving from";

  bool get showDepartureInput => departure != null;
  bool get showArrivalInput => arrival != null;

  String get arrivalName => arrival != null ? arrival!.name : "Going to";

  String get departureDateLabel => DateTimeUtils.formatDateTime(departureDate);

  String get seatNumber => requestedSeats.toString();

  /// Enable swapping locations when both are set
  bool get swapEnabled => arrival != null && departure != null;



  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1- Departure location
            RidePrefTile(
              isInput:  showDepartureInput,
              title: departureName,
              iconLeft: Icons.circle_outlined,
              onTap: onDepartureSelected,
             iconRight: swapEnabled ? Icons.swap_vert : null,
             onRightTap: swapEnabled ? onSwapLocations : null,
             
            ),
            BlaDivider(),

            // 2- Arrival location
            RidePrefTile(
              isInput: showArrivalInput,
                title: arrivalName,
                iconLeft: Icons.circle_outlined,
                onTap: onArrivalSelected),
            BlaDivider(),

            // 3- Departure date
            RidePrefTile(
                title: departureDateLabel,
                iconLeft: Icons.calendar_month_rounded,
                isInput: true,
                onTap: () {}),
            BlaDivider(),

            // 4- Number of seats
            RidePrefTile(
                title: seatNumber,
                iconLeft: Icons.person_2_outlined,
                isInput: true,
                onTap: () {}),

            // 5- Search button
            BlaButton(text: "Search", onPressed: onSubmit),
          ]),
    );
  }
}
