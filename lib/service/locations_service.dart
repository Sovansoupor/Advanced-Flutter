

import '../dummy_data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../repository/locations_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  static LocationsService? _instance;
  final LocationsRepository repository;

  LocationsService._internal(this.repository);
  

  // get the list of locations
  List<Location> getLocations() {
    return repository.getLocations();
  }
  
  // The list of available locations
  static const List<Location> availableLocations = fakeLocations; 


  // initialize the service
   static void initialize(LocationsRepository repository) {
    _instance ??= LocationsService._internal(repository);
  }

  // get the instance of the service
  static LocationsService get instance{
    if (_instance == null) {
      throw Exception('You should initialize your service first. Please call the initialize');
    }
    return _instance!;
  }

  
  
}