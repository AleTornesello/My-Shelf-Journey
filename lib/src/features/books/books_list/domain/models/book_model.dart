import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  const BookModel({
    this.id,
    this.title,
    this.imageUri,
  });

  final int? id;
  final String? title;
  final String? imageUri;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        imageUri,
      ];
}
