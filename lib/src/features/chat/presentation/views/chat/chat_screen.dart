import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/enums/ai_type.dart';
import 'package:hnk_ask_ai/src/core/extensions/scroll_controller_extension.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/core/utils/system_util.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/ai_model.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../../core/common/widgets/markdown_viewer.dart';
import '../../../../../core/common/widgets/svg_icon.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/enums/message_sender.dart';
import '../../../domain/message_model.dart';

part 'widgets/app_bar/chat_app_bar.dart';
part 'widgets/app_bar/chat_app_bar_title.dart';

part 'widgets/chat_message/chat_field.dart';
part 'widgets/chat_message/list_message.dart';
part 'widgets/chat_message/list_message_item.dart';
part 'widgets/chat_message/prompt_examples.dart';

part 'widgets/drawer/chat_drawer_bottom.dart';
part 'widgets/drawer/chat_drawer.dart';

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
        Expanded(child: isChat ? const ListMessage() : _buildLogoAndSlogan()),
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
