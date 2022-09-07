import 'package:equatable/equatable.dart';

class Rain extends Equatable {
  final double? threeH;

  const Rain({
    this.threeH,
  });

  static Rain? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Rain(
      threeH: (json['3h'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [threeH];
}
