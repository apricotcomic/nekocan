import 'package:freezed_annotation/freezed_annotation.dart';

part 'cats.freezed.dart';
part 'cats.g.dart';

@freezed
abstract class Cats with _$Cats {
  const factory Cats(
    {required int id,
    required String name,
    required String gender,
    required String birthday,
    required String memo,
    required DateTime createdAt}) = _Cats;
  factory Cats.fromJson(Map<String, dynamic> json) => _$CatsFromJson(json);
}
