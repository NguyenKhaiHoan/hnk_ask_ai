import '../data/dtos/photo_dto.dart';

class PhotoModel {
  final String id;
  final String author;
  final String url;
  final String downloadUrl;

  PhotoModel({
    required this.id,
    required this.author,
    required this.url,
    required this.downloadUrl,
  });

  PhotoModel copyWith({
    String? id,
    String? author,
    String? url,
    String? downloadUrl,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      author: author ?? this.author,
      url: url ?? this.url,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }
}

extension PhotoModelMapper on PhotoModel {
  PhotoDto modelMapperToDto(PhotoModel model) => PhotoDto(
        id: model.id,
        author: model.author,
        url: model.url,
        downloadUrl: model.downloadUrl,
      );
}
