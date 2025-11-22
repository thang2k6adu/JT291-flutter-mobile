import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

part 'gift_transaction_model.freezed.dart';
part 'gift_transaction_model.g.dart';

/// Gift transaction model for recent gifts history
@freezed
abstract class GiftTransactionModel with _$GiftTransactionModel {
  const factory GiftTransactionModel({
    @JsonKey(name: 'id') required String id,
    required UserModel sender,
    @JsonKey(name: 'gift_info') required GiftModel giftInfo,
     required DateTime timestamp,
  }) = _GiftTransactionModel;

  factory GiftTransactionModel.fromJson(Map<String, Object?> json) =>
      _$GiftTransactionModelFromJson(json);
}

