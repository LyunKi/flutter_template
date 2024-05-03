import 'package:freezed_annotation/freezed_annotation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

@Freezed(
  genericArgumentFactories: true,
)
class Paginated<T> with _$Paginated<T> {
  const factory Paginated({
    required int page,
    required int pageSize,
    required int totalNum,
    required int totalPage,
    required List<T> items,
  }) = _Paginated;

  factory Paginated.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$PaginatedFromJson(json, fromJsonT);
}
