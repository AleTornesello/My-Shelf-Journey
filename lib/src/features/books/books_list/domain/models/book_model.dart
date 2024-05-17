import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  const BookModel({
    this.id,
    this.title,
  });

  final int? id;
  final String? title;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
      ];
}
