import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/svg_icon.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../gen/assets.gen.dart';
import '../../constants/constant.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final Function(String value) onSubmited;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<XFile>? images;

  const CustomTextFormField(
      {super.key,
      required this.textController,
      required this.focusNode,
      required this.onChanged,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.onSubmited,
      this.images});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 40,
        maxHeight: (widget.images != null && widget.images!.isNotEmpty)
            ? 70 + 40 + 12
            : 40,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.masala)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.images == null || widget.images!.isEmpty)
            const SizedBox()
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          SizedBox(
                            height: 65,
                            child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Image.file(
                                File(widget.images![index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 0,
                            child: Transform.rotate(
                              angle: math.pi / 4,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                  color: AppColors.wildSand,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgIcon(
                                  iconPath: Assets.images.plus.path,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.shipGray, BlendMode.srcIn),
                                  iconSize: 16,
                                  onPressed: () {
                                    setState(() {
                                      widget.images != null &&
                                              widget.images!.isNotEmpty
                                          ? widget.images!.removeAt(index)
                                          : null;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => gapW12,
                    itemCount: (widget.images ?? []).length),
              ),
            ),
          SizedBox(
            height: 38,
            child: TextFormField(
              controller: widget.textController,
              focusNode: widget.focusNode,
              onChanged: (value) => widget.onChanged(value),
              onFieldSubmitted: (value) => widget.onSubmited(value),
              style: AppStyles.paragraph1Regular(),
              decoration: InputDecoration(
                suffix: widget.suffixIcon,
                prefix: widget.prefixIcon,
                hintText: widget.hintText,
                hintStyle: AppStyles.paragraph1Regular()
                    .copyWith(color: AppColors.masala),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
