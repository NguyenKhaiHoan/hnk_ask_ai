import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/exceptions/failure.dart';
import '../../domain/message_model.dart';

part 'list_message_state.freezed.dart';

@freezed
class ListMessageState with _$ListMessageState {
  const factory ListMessageState.loading() = _Loading;
  const factory ListMessageState.data({List<MessageModel>? messages}) = _Data;
  const factory ListMessageState.error({required Failure failure}) = _Error;
}
