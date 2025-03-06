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
  static final RidesService _instance = RidesService._internal();

  // Late-initialized repository for fetching rides (must be assigned before use)
  static late RideRepository _repository;

  // Private named constructor (prevents direct instantiation from outside the class)
  // ensuring only one instance is used
  RidesService._internal();

  // Fetches a list of rides based on user preferences and an optional filter.
  // Calls the `_repository` to retrieve data.
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _repository.getRides(preference, filter);
  }

  ///
  /// Initialize the service with a RideRepository implementation.
  /// This method must be called before using `getRides()`, as `_repository` is late-initialized.
  ///
  static void initialize(RideRepository repository) {
    _repository = repository;
  }

  ///
  /// Factory constructor to return the singleton instance of RidesService.
  /// Ensures only one instance is used throughout the application.
  ///
  factory RidesService() {
    return _instance;
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
