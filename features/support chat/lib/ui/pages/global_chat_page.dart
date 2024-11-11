import 'package:core_ui/core_ui.dart';

class GlobalChatPage extends StatelessWidget {
  final String message;
  final String time;
  final String senderName;
  final bool isAdmin;
  const GlobalChatPage(
      {super.key,
      required this.message,
      required this.time,
      required this.senderName,
      required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.size_10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: Dimensions.size_10,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(Dimensions.size_10),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(Dimensions.size_16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '[$senderName]',
                  style: const TextStyle(
                      color: AppColors.dark,
                      fontWeight: FontWeight.w800,
                      package: 'core_ui'),
                ),
                const SizedBox(
                  height: Dimensions.size_5,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: Dimensions.size_16,
                    package: 'core_ui',
                  ),
                ),
                const SizedBox(height: Dimensions.size_10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: const TextStyle(
                        fontSize: Dimensions.size_10,
                        color: Colors.grey,
                        package: 'core_ui'),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
