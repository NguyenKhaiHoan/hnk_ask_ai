import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/enums/ai_type.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/core/utils/system_util.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/ai_model.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/chat/widgets/chat_drawer.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/chat/widgets/chat_message.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/chat/widgets/prompt_examples.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../core/common/widgets/svg_icon.dart';
import '../../../../core/constants/constant.dart';

part 'widgets/field_chat.dart';
part 'widgets/chat_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUtil.setSystemUIOverlayStyle();
    bool isChat = Random().nextBool();
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: ChatAppBar(isChat: isChat),
      extendBodyBehindAppBar: true,
      drawer: const ChatDrawer(),
      body: _buildBody(isChat),
    );
  }

  SafeArea _buildBody(bool isChat) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: isChat ? const ChatMessage() : _buildLogoAndSlogan()),
        _buildBottomChat(isChat)
      ],
    ));
  }

  Align _buildLogoAndSlogan() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'A'.hardcoded,
            style: AppStyles.heading1().copyWith(
              fontFamily: FontFamily.me,
              fontSize: 72,
              height: 1.0,
            ),
          ),
          Text(
            'Ask Ai Anything'.hardcoded,
            style: AppStyles.heading2().copyWith(fontFamily: FontFamily.me),
          ),
          gapH64,
        ],
      ),
    );
  }

  Widget _buildBottomChat(bool isChat) {
    return isChat
        ? const FieldChat()
        : const Column(
            children: [PromptExamples(), gapH16, FieldChat()],
          );
  }
}
