class GoogleBookDetailModel {
  const GoogleBookDetailModel({this.volumeInfo});

  final VolumeInfoModel? volumeInfo;
}

class VolumeInfoModel {
  String? title;
  ImageLinksModel? imageLinks;

  VolumeInfoModel({
    this.title,
    this.imageLinks,
  });
}

class ImageLinksModel {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinksModel({
    this.smallThumbnail,
    this.thumbnail,
  });
}
