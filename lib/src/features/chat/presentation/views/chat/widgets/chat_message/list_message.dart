part of '../../chat_screen.dart';

class ListMessage extends StatelessWidget {
  const ListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = sl<FirebaseAuth>().currentUser?.uid ?? 'userId';
    return BlocProvider(
      create: (context) => ListMessageController(sl<ChatService>())
        ..subscribeToMessages(userId: userId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: BlocBuilder<ListMessageController, ListMessageState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.dark,
                ),
              ),
              data: (messages) {
                return Column(
                  children: [
                    Expanded(
                      child: messages == null || messages.isEmpty
                          ? const Center(
                              child: LogoAndSloganText(),
                            )
                          : ListView.separated(
                              padding: defaultSmallPadding,
                              itemBuilder: (context, index) {
                                return ListMessageItem(
                                    message: messages[index]);
                              },
                              separatorBuilder: (context, index) => gapH26,
                              itemCount: messages.length,
                            ),
                    ),
                    if (messages == null || messages.isEmpty)
                      const Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: PromptExamples()),
                    BlocProvider(
                      create: (context) =>
                          ChatFieldController(sl<ChatService>()),
                      child: const ChatField(),
                    ),
                  ],
                );
              },
              error: (error) => Center(child: Text('Error: ${error.message}')),
            );
          },
        ),
      ),
    );
  }
}
