import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/custom_text_form_field.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';
import 'package:hnk_ask_ai/src/core/constants/constant.dart';
import 'package:hnk_ask_ai/src/core/extensions/string_extenstion.dart';

import '../../../../../../gen/assets.gen.dart';

class ChatDrawer extends StatefulWidget {
  const ChatDrawer({super.key});

  @override
  State<ChatDrawer> createState() => _ChatDrawerState();
}

class _ChatDrawerState extends State<ChatDrawer> {
  bool isCollapse = true;
  late TextEditingController _searchTextController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      if (_focusNode.hasFocus && isCollapse) {
        isCollapse = false;
      } else {
        isCollapse = true;
      }
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCollapse ? 1.sw * 0.8 : 1.sw,
      duration: const Duration(milliseconds: 300),
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: SizedBox(
              height: 38,
              child: CustomTextFormField(
                  textController: _searchTextController,
                  focusNode: _focusNode,
                  onChanged: (value) {},
                  hintText: 'Search'.hardcoded),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: defaultSmallPadding,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgIcon(
                  iconPath: Assets.images.askAiDarkIcon.path,
                  notNeedColorFilter: true,
                  iconSize: 32,
                ),
                title: Text(
                  'Ask AI',
                  style: AppStyles.paragraph1Bold(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgIcon(
                  iconPath: Assets.images.explore.path,
                  colorFilter:
                      const ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
                  iconSize: 32,
                ),
                title: Text(
                  'Explore Ask AI'.hardcoded,
                  style: AppStyles.paragraph1Bold(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const Divider(
                height: 1,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: defaultBigPadding,
          height: 50,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              decoration: BoxDecoration(borderRadius: defaultRoundedCorners),
              child: SvgIcon(
                iconPath: Assets.images.darkLogo.path,
                notNeedColorFilter: true,
                iconSize: 42,
              ),
            ),
            title: Text(
              'Nguyễn Khải Hoàn',
              style: AppStyles.paragraph1Bold(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: SvgIcon(
              iconPath: Assets.images.ellipsis.path,
              notNeedColorFilter: true,
            ),
          ),
        ),
      ),
    );
  }
}
