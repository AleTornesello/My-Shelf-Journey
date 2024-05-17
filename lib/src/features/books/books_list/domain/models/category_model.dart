import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  const CategoryModel({
    this.id,
    this.name,
    this.translationKey,
  });

  final int? id;
  final String? name;
  final String? translationKey;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        translationKey,
      ];
}
