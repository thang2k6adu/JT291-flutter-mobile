import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

/// ============================================
/// ENUMS
/// ============================================

enum TransactionType {
  @JsonValue('deposit')
  deposit,
  @JsonValue('withdrawal')
  withdrawal,
  @JsonValue('exchange')
  exchange,
  @JsonValue('gift_sent')
  giftSent,
  @JsonValue('gift_received')
  giftReceived,
  @JsonValue('refund')
  refund,
  @JsonValue('reward')
  reward,
}

enum TransactionStatus {
  @JsonValue('completed')
  completed,
  @JsonValue('pending')
  pending,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

enum CurrencyType {
  @JsonValue('Diamonds')
  diamonds,
  @JsonValue('VEX')
  vex,
}

/// ============================================
/// NESTED MODELS
/// ============================================

@freezed
abstract class TransactionItem with _$TransactionItem {
  const factory TransactionItem({
    required String name,
    required int quantity,
    String? icon,
    int? value,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemFromJson(json);
}

@freezed
abstract class RelatedUser with _$RelatedUser {
  const factory RelatedUser({
    required String id,
    required String username,
    required String displayName,
    required String avatar,
    bool? isVerified,
  }) = _RelatedUser;

  factory RelatedUser.fromJson(Map<String, dynamic> json) =>
      _$RelatedUserFromJson(json);
}

@freezed
abstract class ExchangeDetails with _$ExchangeDetails {
  const factory ExchangeDetails({
    required CurrencyType fromCurrency,
    required double fromAmount,
    required CurrencyType toCurrency,
    required double toAmount,
    required double rate,
  }) = _ExchangeDetails;

  factory ExchangeDetails.fromJson(Map<String, dynamic> json) =>
      _$ExchangeDetailsFromJson(json);
}

/// ============================================
/// MAIN MODEL
/// ============================================

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required TransactionType type,
    required double amount,
    double? balanceAfter,
    required String timestamp,
    required String description,
    TransactionItem? item,
    RelatedUser? relatedUser,
    ExchangeDetails? exchange,
    required TransactionStatus status,
    String? note,
    String? referenceCode,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

/// ============================================
/// HISTORY RESPONSE
/// ============================================

@freezed
abstract class TransactionHistoryResponse with _$TransactionHistoryResponse {
  const factory TransactionHistoryResponse({
    required List<TransactionModel> data,
    required PaginationModel pagination,
  }) = _TransactionHistoryResponse;

  factory TransactionHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryResponseFromJson(json);
}
