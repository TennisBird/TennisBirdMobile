import 'package:aron_gradient_line/aron_gradient_line.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:chats/ui/components/transparent_message_field.dart';
import 'package:core_ui/core_ui.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final TextEditingController _searchController = TextEditingController();
  // DateTime _selectedDate = DateTime.now();
  final List<Map<String, String>> _chats = [
    {
      'name': 'Ivan',
      'message': 'Hello there!',
      'avatar': 'assets/png/tennisBird.png'
    },
    {
      'name': 'Ivan',
      'message': 'How are you?',
      'avatar': 'assets/png/tennisBird.png'
    },
    {
      'name': 'Ivan',
      'message': 'Good morning!',
      'avatar': 'assets/png/tennisBird.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                "Chats",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'minecraft',
                    package: "core_ui",
                    color: AppColors.grad2Color),
              ),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: AronGradientLine(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.grad1Color,
                  AppColors.text1GradColor,
                  AppColors.text2GradColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TransparentMessageField(
                      hintText: "Find chats...",
                      textEditingController: _searchController)),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  child: FlowTextButton(
                      onPressed: () {}, text: "Or create new chat")),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: LiveList(
                    showItemInterval: const Duration(milliseconds: 100),
                    showItemDuration: const Duration(milliseconds: 300),
                    itemCount: _chats.length,
                    itemBuilder: (context, index, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  _chats[index]['avatar']!,
                                  package: 'chats'),
                            ),
                            title: Text(
                              _chats[index]['name']!,
                              style: const TextStyle(
                                  color: AppColors.dark,
                                  fontFamily: 'minecraft',
                                  package: "core_ui"),
                            ),
                            subtitle: Text(
                              _chats[index]['message']!,
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontFamily: 'minecraft',
                                  package: "core_ui"),
                            ),
                            tileColor: AppColors.grad1Color,
                            iconColor: AppColors.grad1Color,
                            splashColor: AppColors.grad1Color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onTap: () {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
