// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final String? pod;

  const Sys({
    this.pod,
  });

  static Sys? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Sys(
      pod: json['pod'],
    );
  }

  @override
  List<Object?> get props => [
        pod,
      ];
}
