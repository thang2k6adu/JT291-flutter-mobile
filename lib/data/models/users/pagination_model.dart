import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
abstract class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    int? limit, // số lượng item trên mỗi trang
    int? offset,
    int? total,
    bool? hasNext,
    @Default(false) bool isPending,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
