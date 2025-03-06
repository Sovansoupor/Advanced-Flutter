

import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

import '../../model/ride/ride.dart';
import '../../model/user/user.dart';
import '../rides_repository.dart';

class MockRidesRepository extends RideRepository{

  DateTime time = DateTime.now();
  late Ride r1, r2, r3, r4, r5;

  MockRidesRepository(){
    r1 = Ride(
      departureLocation: Location(name: 'Battambong', country: Country.cambodia), 
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 30),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 7, 30),
      driver: User(
        firstName: 'Kannika',
        lastName: 'Sok',
        email: 'sok@gmail.com',
        phone: '12345654',
        profilePicture: '',
        verifiedProfile: false,
        ), 
      availableSeats: 2, 
      pricePerSeat: 20.0,
      acceptPets: false,
    );

    r2 = Ride(
      departureLocation: Location(name: 'Battambong', country: Country.cambodia), 
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 8, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 10, 0),
      driver: User(
        firstName: "Chaylim",
        lastName: 'Yim',
        email: 'yim@gmgail.com',
        phone: '12345432',
        profilePicture: '',
        verifiedProfile: false,
        ), 
      availableSeats: 0, 
      pricePerSeat: 20.0,
      acceptPets: false,
    );

    r3 = Ride(
      departureLocation: Location(name: 'Battambong', country: Country.cambodia), 
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 8, 0),
      driver: User(
        firstName: "Rajana",
        lastName: 'Pov',
        email: 'pov@gmail.com',
        phone: '12342232',
        profilePicture: '',
        verifiedProfile: false,
        ), 
      availableSeats: 1, 
      pricePerSeat: 20.0,
      acceptPets: false,
    );

    r4 = Ride(
      departureLocation: Location(name: 'Battambong', country: Country.cambodia), 
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 8, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 10, 0),
      driver: User(
        firstName: "Limhao",
        lastName: 'Yen',
        email: 'yen@gmail.com',
        phone: '12412322',
        profilePicture: '',
        verifiedProfile: false,
        ), 
      availableSeats: 2, 
      pricePerSeat: 20.0,
      acceptPets: true,
    );

    r5 = Ride(
      departureLocation: Location(name: 'Battambong', country: Country.cambodia), 
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 8, 0),
      driver: User(
        firstName: "Sovanda",
        lastName: 'Ban',
        email: 'ban@gmail.com',
        phone: '12223121',
        profilePicture: '',
        verifiedProfile: false,
        ), 
      availableSeats: 1, 
      pricePerSeat: 20.0,
      acceptPets: false,
    );

  }


  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return [r1, r2, r3, r4, r5];
  }

  


}