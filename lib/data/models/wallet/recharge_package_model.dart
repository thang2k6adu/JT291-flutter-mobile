import 'package:freezed_annotation/freezed_annotation.dart';

part 'recharge_package_model.freezed.dart';
part 'recharge_package_model.g.dart';

@freezed
abstract class RechargePackageModel with _$RechargePackageModel {
  const factory RechargePackageModel({
    required int packageId,
    required int diamonds,
    required int price, // Giá tiền VNĐ hoặc theo đơn vị bạn muốn
  }) = _RechargePackageModel;

  factory RechargePackageModel.fromJson(Map<String, dynamic> json) =>
      _$RechargePackageModelFromJson(json);
}
