import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiService {
  Future<Either<Exception, T>> handleApiCall<T>({
    required Future<HttpResponse> Function() apiCall,
    required T Function(dynamic data) dtoToModel,
  }) async {
    try {
      final httpResponse = await apiCall();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final dto = httpResponse.data;
        final entity = dtoToModel(dto);
        return Right(entity);
      }
      return Left(Exception('API call failed'));
    } catch (e) {
      return Left(e as Exception);
    }
  }

  Future<Either<Exception, List<T>>> handleApiCallWithList<T>({
    required Future<HttpResponse> Function() apiCall,
    required List<T> Function(List<dynamic> data) dtoToModel,
  }) async {
    try {
      final httpResponse = await apiCall();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final dtos = httpResponse.data as List<dynamic>;
        final models = dtoToModel(dtos);
        return Right(models);
      }
      return Left(Exception('API call failed'));
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
