class BookEntity {
  const BookEntity({
    this.id,
    this.title,
    this.imageUri,
    this.categoryId,
  });

  final int? id;
  final String? title;
  final String? imageUri;
  final int? categoryId;
}
