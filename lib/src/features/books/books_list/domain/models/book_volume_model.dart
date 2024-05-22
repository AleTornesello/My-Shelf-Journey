import 'package:equatable/equatable.dart';

class BookVolumeModel extends Equatable {
  const BookVolumeModel({
    this.id,
    this.name,
    this.orderIndex,
    this.bookId,
  });

  final int? id;
  final String? name;
  final int? orderIndex;
  final int? bookId;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        orderIndex,
        bookId,
      ];
}
