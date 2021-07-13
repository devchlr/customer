
class AdressLocalisation{
  final double? lat;
  final double? long;
  final String? description;

  AdressLocalisation({this.lat,this.long,this.description});
  AdressLocalisation.fromJson(Map<String, dynamic> json)
      :lat=json['lat'],
      long=json['long'],
      description=json['description'];
  Map<String, dynamic> toJson() =>{
    'lat':lat,
    'long':long,
    'description':description
  };

}