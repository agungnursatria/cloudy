import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  static Weather? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
