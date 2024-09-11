import 'package:equatable/equatable.dart';
import 'package:hnk_ask_ai/src/core/enums/ai_type.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

import '../../../../gen/assets.gen.dart';

class AiModel extends Equatable {
  final AiType type;
  final String name;
  final String iconPath;

  const AiModel(
      {required this.type, required this.name, required this.iconPath});

  @override
  List<Object?> get props => [type, name, iconPath];
}

final aiModels = [
  AiModel(
      type: AiType.gemini15Flash,
      name: 'AI-1.5 Flash'.hardcoded,
      iconPath: Assets.images.gpt35.path),
  AiModel(
      type: AiType.gemini15Pro,
      name: 'AI-1.5 Pro'.hardcoded,
      iconPath: Assets.images.gpt4.path),
];
