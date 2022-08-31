import 'package:equatable/equatable.dart';

class Cloud extends Equatable {
  final int? all;

  const Cloud({
    this.all,
  });

  static Cloud? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Cloud(
      all: json['all'],
    );
  }

  @override
  List<Object?> get props => [
        all,
      ];
}
