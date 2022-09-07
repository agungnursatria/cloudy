import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  final double? speed;
  final int? degree;
  final double? gust;

  const Wind({
    this.speed,
    this.degree,
    this.gust,
  });

  static Wind? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Wind(
      speed: (json['speed'] as num?)?.toDouble(),
      degree: json['deg'],
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        speed,
        degree,
        gust,
      ];
}
