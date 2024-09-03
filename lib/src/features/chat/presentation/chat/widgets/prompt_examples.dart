import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';

class PromptExamples extends StatelessWidget {
  const PromptExamples({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> promptExamples = {
      'Design a database schema': 'for an online merch store',
      'Explain airplain': 'to someone 5 years old',
    };

    return SizedBox(
      height: 76,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: defaultSmallPadding,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              color: AppColors.wildSand,
              borderRadius: defaultRoundedCorners,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      promptExamples.keys.elementAt(index),
                      style: AppStyles.heading4(),
                    ),
                    Text(
                      promptExamples.values.elementAt(index),
                      style: AppStyles.paragraph1Regular()
                          .copyWith(color: AppColors.shipGray),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => gapW12,
        itemCount: promptExamples.length,
      ),
    );
  }
}
