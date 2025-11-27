import 'package:freezed_annotation/freezed_annotation.dart';

part 'vex_package_model.freezed.dart';
part 'vex_package_model.g.dart';

@freezed
abstract class VexPackageModel with _$VexPackageModel {
  const factory VexPackageModel({
    required int packageId,
    @JsonKey(name: 'vexAmount') required int vexAmount,
    @JsonKey(name: 'baseDiamonds') required int baseDiamonds,
    @JsonKey(name: 'bonusDiamonds') required int bonusDiamonds,
    @JsonKey(name: 'totalDiamonds') required int totalDiamonds,
  }) = _VexPackageModel;

  factory VexPackageModel.fromJson(Map<String, dynamic> json) =>
      _$VexPackageModelFromJson(json);
}

