import 'package:json_annotation/json_annotation.dart';

part 'movieList.g.dart';

@JsonSerializable()
class MovieList {
    MovieList();

    List list;
    
    factory MovieList.fromJson(Map<String,dynamic> json) => _$MovieListFromJson(json);
    Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
