class JikanMangaModel {
  const JikanMangaModel({this.data, this.pagination});

  final List<JikanMangaModelData>? data;
  final JikanMangaModelPagination? pagination;
}

class JikanMangaModelData {
  final JikanMangaModelImages? images;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final int? volumes;

  const JikanMangaModelData({
    this.images,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.volumes,
  });
}

class JikanMangaModelPagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final JikanMangaModelItems? items;

  const JikanMangaModelPagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.items,
  });
}

class JikanMangaModelItems {
  final int? count;
  final int? total;
  final int? perPage;

  const JikanMangaModelItems({this.count, this.total, this.perPage});
}

class JikanMangaModelImages {
  final JikanMangaModelJpg? jpg;
  final JikanMangaModelJpg? webp;

  const JikanMangaModelImages({this.jpg, this.webp});
}

class JikanMangaModelJpg {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const JikanMangaModelJpg(
      {this.imageUrl, this.smallImageUrl, this.largeImageUrl});
}
