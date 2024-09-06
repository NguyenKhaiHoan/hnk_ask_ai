import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/markdown_viewer.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/list_message_controller.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hnk_ask_ai/env/env.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/core/utils/system_util.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_drawer_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_field_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_screen_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/states/chat_field_state.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/states/chat_screen_state.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/common/widgets/logo_and_slogan_text.dart';
import '../../../../../core/common/widgets/svg_icon.dart';
import '../../../../../core/constants/constant.dart';
import '../../../../../core/enums/message_sender.dart';
import '../../../../auth/domain/user_model.dart';
import '../../../domain/ai_model.dart';
import '../../../domain/message_model.dart';
import '../../states/chat_drawer_state.dart';

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
    return const Scaffold(
      backgroundColor: AppColors.light,
      appBar: ChatAppBar(),
      drawer: ChatDrawer(),
      body: ListMessage(),
    );
  }
}
