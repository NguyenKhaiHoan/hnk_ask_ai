part of '../welcome_screen.dart';

class AnimatedTexts extends StatelessWidget {
  const AnimatedTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.heading1().copyWith(fontFamily: FontFamily.me);
    const cursor = "\u2B24"; // A solid circle symbol.

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(
            left: AppSizes.p20, right: AppSizes.p20, bottom: AppSizes.p64),
        child: AnimatedTextKit(
          animatedTexts: [
            _buildTypewriterText('Ask AI'.hardcoded, cursor, textStyle),
            _buildTypewriterText(
                'Let\'s brainstorm'.hardcoded, cursor, textStyle),
            _buildTypewriterText('Let\'s go'.hardcoded, cursor, textStyle),
          ],
        ),
      ),
    );
  }

  TypewriterAnimatedText _buildTypewriterText(
      String text, String cursor, TextStyle textStyle) {
    return TypewriterAnimatedText(
      text,
      cursor: cursor,
      textAlign: TextAlign.center,
      speed: const Duration(milliseconds: 300),
      textStyle: textStyle,
    );
  }
}
