import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/gen/fonts.gen.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';
import 'package:hnk_ask_ai/src/features/photo/domain/photo_model.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/controllers/photo_screen_controller.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../core/common/network_images/network_image.dart';
import '../../../../../core/common/widgets/svg_icon.dart';
import '../../../../../core/constants/constant.dart';

part 'widgets/photo_app_bar.dart';
part 'widgets/photo_body.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PhotoAppBar(),
      body: PhotoBody(),
    );
  }
}
