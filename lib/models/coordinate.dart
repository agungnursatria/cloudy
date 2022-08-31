import 'package:equatable/equatable.dart';

class Coordinate extends Equatable {
  final double? lat;
  final double? lon;

  const Coordinate({
    this.lat,
    this.lon,
  });

  static Coordinate? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Coordinate(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
