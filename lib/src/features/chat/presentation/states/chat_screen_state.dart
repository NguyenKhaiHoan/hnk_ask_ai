import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/ai_model.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/enums/ai_type.dart';

class ChatScreenState {
  final bool isNewChat;
  final AiModel currentAiModel;

  ChatScreenState({
    required this.isNewChat,
    required this.currentAiModel,
  });

  static ChatScreenState get defaultState => ChatScreenState(
        isNewChat: false,
        currentAiModel: AiModel(
          type: AiType.gemini15Flash,
          name: 'AI-1.5 Flash'.hardcoded,
          iconPath: Assets.images.gpt35.path,
        ),
      );

  ChatScreenState copyWith({
    bool? isNewChat,
    AiModel? currentAiModel,
  }) {
    return ChatScreenState(
      isNewChat: isNewChat ?? this.isNewChat,
      currentAiModel: currentAiModel ?? this.currentAiModel,
    );
  }
}
