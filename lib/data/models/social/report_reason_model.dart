import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_reason_model.freezed.dart';
part 'report_reason_model.g.dart';

/// Report reason model
@freezed
abstract class ReportReasonModel with _$ReportReasonModel {
  const factory ReportReasonModel({
    required int id,
    required String label,
  }) = _ReportReasonModel;

  factory ReportReasonModel.fromJson(Map<String, dynamic> json) =>
      _$ReportReasonModelFromJson(json);
}

