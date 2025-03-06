import 'package:week_3_blabla_project/repository/mock/mock_rides_repository.dart';
import 'package:week_3_blabla_project/repository/rides_repository.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides;

  // Singleton instance of RidesService (ensures only one instance exists)
  static RidesService? _instance;
  final RideRepository repository;

  // Private named constructor (prevents direct instantiation from outside the class)
  // ensuring only one instance is used
  RidesService._internal(this.repository);


  ///
  /// Initialize the service with a RideRepository implementation.
  ///
  static void initialize(RideRepository repository) {
    _instance ??= RidesService._internal(repository);
  }

  static RidesService get instance{
    _instance ??= RidesService._internal(MockRidesRepository());
    return _instance!;
  }

  // Fetches a list of rides based on user preferences and an optional filter.
  // Calls the `_repository` to retrieve data.
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }
  
  ///
  /// Returns a list of rides that match the given user preferences.
  /// This method filters rides based on departure and arrival locations.
  ///
  static List<Ride> getRidesFor(RidePreference preferences) {
    // For now, just a test
    return availableRides
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival,
        )
        .toList();
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
