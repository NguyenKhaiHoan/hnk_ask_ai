part of '../../chat_screen.dart';

class ListMessage extends ConsumerWidget {
  const ListMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId =
        (ref.watch(authStateChangesProvider).value ?? UserModel.empty).id;
    final messageAsync =
        ref.watch(messagesStateChangesProvider(userId: userId));
    return messageAsync.when(
        data: (data) {
          if (data == null || data.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: LogoAndSloganText(),
                )),
                PromptExamples(),
                gapH16,
                ChatField()
              ],
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: defaultSmallPadding,
                  itemBuilder: (context, index) {
                    return ListMessageItem(message: data[index]);
                  },
                  separatorBuilder: (context, index) => gapH26,
                  itemCount: data.length,
                ),
              ),
              const ChatField(),
            ],
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColors.dark,
              ),
            ));
  }
}
