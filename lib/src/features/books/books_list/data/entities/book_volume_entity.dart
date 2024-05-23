class BookVolumeEntity {
  const BookVolumeEntity({
    this.id,
    this.name,
    this.orderIndex,
    this.status,
    this.bookId,
  });

  final int? id;
  final String? name;
  final int? orderIndex;
  final int? status;
  final int? bookId;
}
