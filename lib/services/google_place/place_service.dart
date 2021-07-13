import 'package:chaliar_delivery_app/models/adress.dart';
import 'package:google_place/google_place.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:geolocator/geolocator.dart';


class GooglePlaceService {
  var googlePlace = GooglePlace('AIzaSyAiQTUGR-d1caKdrGYAA9OT05OzMQxTZko');
  Geolocator geolocator=Geolocator();


  Future<List<String>> getPlaceSugestion(String value)async{
    List<AutocompletePrediction> predictions = [];
    List<String> descriptions=[];
    if(value.length>1){
      var result = await googlePlace.autocomplete.get(value);
      if (result != null && result.predictions != null) {
        predictions = result.predictions!;
        predictions.forEach((element) {
          descriptions.add(element.description!);
        });
      }
    }
    return descriptions;
  }

  Future <Location> getPlaceLatLong(String place)async{
    List<AutocompletePrediction> predictions = [];
    var localisation;
    var placeSearchR = googlePlace.autocomplete.get(place);
    placeSearchR.then((result){
      if(result!=null && result.predictions!=null){
        predictions = result.predictions!;
        predictions.forEach((element) {
          var detail =googlePlace.details.get(element.placeId!);
          detail.then((value){
            if(value!=null){
             localisation= value.result!.geometry!.location;
            }
          });
        });
      }
    });
    return localisation;
  }

  Future <List<Address>> getLocalisation(String place)async{
    var addresses = Geocoder.local.findAddressesFromQuery(place);
    return addresses;
  }

  double getDistance(AdressLocalisation depart,AdressLocalisation arrival){
    double distanceInMeters = Geolocator.distanceBetween(depart.lat!, depart.long!, arrival.lat!, arrival.long!);
    return distanceInMeters/1000;
  }
}