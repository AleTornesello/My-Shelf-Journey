import 'package:equatable/equatable.dart';

enum BookVolumeStatus {
  read(0),
  notRead(1);

  final int value;
  const BookVolumeStatus(this.value);
}

class BookVolumeModel extends Equatable {
  const BookVolumeModel({
    this.id,
    this.name,
    this.orderIndex,
    this.status,
    this.bookId,
  });

  final int? id;
  final String? name;
  final int? orderIndex;
  final BookVolumeStatus? status;
  final int? bookId;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        orderIndex,
        bookId,
      ];
}
