import 'dart:ui';

import 'package:chats/ui/components/transparent_message_field.dart';
import 'package:core_ui/core_ui.dart';
import 'package:swipe_to/swipe_to.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final List<Map<String, dynamic>> messages = [
    {"text": "Привет!", "replyTo": null, "isMine": false},
    {"text": "Как дела?", "replyTo": null, "isMine": false},
    {"text": "Чем занят?", "replyTo": null, "isMine": false},
  ];

  final TextEditingController _controller = TextEditingController();
  String? repliedMessage;
  final ScrollController _scrollController = ScrollController();

  void sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      messages.add({
        "text": text,
        "replyTo": repliedMessage,
        "isMine": true,
      });
      repliedMessage = null;
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.text1GradColor,
                AppColors.text2GradColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.dark,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/png/tennisBird.png', package: 'core_ui'),
            ),
            const SizedBox(width: 10),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Text(
                "Ivan",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'minecraft',
                    package: "core_ui",
                    color: AppColors.grad2Color),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.text1GradColor,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/jpg/images.jpg',
                  package: 'chats',
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              if (repliedMessage != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 13.0),
                  color: AppColors.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Answer to: $repliedMessage",
                          style: const TextStyle(
                              color: AppColors.dark,
                              fontFamily: 'minecraft',
                              package: "core_ui"),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.dark,
                        ),
                        onPressed: () {
                          setState(() {
                            repliedMessage = null;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMine = message["isMine"] as bool? ?? false;
                    return SwipeTo(
                      onRightSwipe: (details) {
                        if (isMine) return;
                        setState(() {
                          repliedMessage = message["text"];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        alignment: isMine
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isMine
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (message["replyTo"] != null)
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  message["replyTo"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'minecraft',
                                    package: "core_ui",
                                  ),
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isMine
                                    ? AppColors.grad1Color
                                    : AppColors.grad2Color,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(10),
                                  topRight: const Radius.circular(10),
                                  bottomLeft: isMine
                                      ? const Radius.circular(10)
                                      : const Radius.circular(0),
                                  bottomRight: isMine
                                      ? const Radius.circular(0)
                                      : const Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                message["text"]!,
                                style: const TextStyle(
                                  color: AppColors.dark,
                                  fontFamily: 'minecraft',
                                  package: "core_ui",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TransparentMessageField(
                          hintText: "Type something",
                          textEditingController: _controller),
                    ),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                      focusColor: AppColors.backgroundColor,
                      hoverColor: AppColors.backgroundColor,
                      splashColor: AppColors.backgroundColor,
                      backgroundColor: AppColors.grad1Color,
                      onPressed: () => sendMessage(_controller.text),
                      mini: true,
                      child: const Icon(
                        Icons.send,
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
