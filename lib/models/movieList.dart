import 'package:json_annotation/json_annotation.dart';

part 'movieList.g.dart';

@JsonSerializable()
class MovieList {
    MovieList();

    num code;
    Map<String,dynamic> data;
    String message;
    
    factory MovieList.fromJson(Map<String,dynamic> json) => _$MovieListFromJson(json);
    Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
