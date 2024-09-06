part of '../../chat_screen.dart';

class ListMessage extends GetView<ListMessageController> {
  final authController = Get.find<AuthController>();

  ListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.messagesStateChanges(
          userId: FirebaseAuth.instance.currentUser?.uid ?? 'id'),
      builder:
          (BuildContext context, AsyncSnapshot<List<MessageModel>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.dark,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          final data = snapshot.data;
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
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
