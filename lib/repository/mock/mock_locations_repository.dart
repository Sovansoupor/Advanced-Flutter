import 'package:week_3_blabla_project/repository/locations_repository.dart';

import '../../model/ride/locations.dart';

// 
class MockLocationsRepository extends LocationsRepository{
  final Location phnompenh = Location(name: 'Phnom Penh', country: Country.cambodia);
  final Location siemreap = Location(name: 'Siem Reap', country: Country.cambodia);
  final Location battambong = Location(name: 'Battambong', country: Country.cambodia);
  final Location sihanoukville = Location(name: 'Sihanoukville', country: Country.cambodia);
  final Location kampot = Location(name: 'Kampot', country: Country.cambodia);

  
  @override
  List<Location> getLocations() {
   return [phnompenh, siemreap, battambong, sihanoukville, kampot];
  }
}