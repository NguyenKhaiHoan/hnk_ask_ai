import 'package:hnk_ask_ai/src/core/enums/ai_type.dart';

class AiModel {
  final AiType type;
  final String name;
  final String iconPath;

  AiModel({required this.type, required this.name, required this.iconPath});
}
