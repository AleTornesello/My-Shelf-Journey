import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  const BookModel({
    this.id,
    this.title,
    this.imageUri,
    this.categoryId,
  });

  final int? id;
  final String? title;
  final String? imageUri;
  final int? categoryId;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        imageUri,
        categoryId,
      ];
}
