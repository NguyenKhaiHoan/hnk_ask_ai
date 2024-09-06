import '../data/dtos/photo_dto.dart';

class PhotoModel {
  final String id;
  final String author;
  final double width;
  final double height;
  final String url;
  final String downloadUrl;

  PhotoModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

  PhotoModel copyWith({
    String? id,
    String? author,
    double? width,
    double? height,
    String? url,
    String? downloadUrl,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      author: author ?? this.author,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }
}

extension PhotoModelMapper on PhotoModel {
  PhotoDto modelMapperToDto(PhotoModel model) => PhotoDto(
        id: model.id,
        author: model.author,
        width: model.width,
        height: model.height,
        url: model.url,
        downloadUrl: model.downloadUrl,
      );
}
