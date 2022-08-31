import 'package:cloudy/models/coordinate.dart';
import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int? id;
  final String? name;
  final Coordinate? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  static City? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return City(
      id: json['id'],
      name: json['name'],
      coord: Coordinate.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
        sunrise,
        sunset,
      ];
}
