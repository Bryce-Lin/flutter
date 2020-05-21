// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieList _$MovieListFromJson(Map<String, dynamic> json) {
  return MovieList()
    ..code = json['code'] as num
    ..data = json['data'] as Map<String, dynamic>
    ..message = json['message'] as String;
}

Map<String, dynamic> _$MovieListToJson(MovieList instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };
