import 'package:flutter/material.dart';

import 'package:vk_app/ui/widgets/message_form/message_form_widget.dart';
import 'package:vk_app/ui/widgets/messages/messages_widget_model.dart';
import 'package:vk_app/theme/app_colors.dart';

class MessagesWidget extends StatefulWidget {
  final int chatKey;

  const MessagesWidget({super.key, required this.chatKey});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  late MessagesWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = MessagesWidgetModel(chatKey: widget.chatKey);
  }

  @override
  Widget build(BuildContext context) {
    return MessagesWidgetModelProvider(
      model: _model,
      child: const _MessagesWidgetBody(),
    );
  }
}

class _MessagesWidgetBody extends StatelessWidget {
  const _MessagesWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = MessagesWidgetModelProvider.noticeOf(context)?.model;
    final chatName = model?.chat?.name ?? 'DELETED';
    final chatKey = model?.chatKey;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.iconBlue),
        elevation: 0,
        title: Text(
          chatName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              print('Search message');
            },
            child: const Icon(
              Icons.search,
              color: AppColors.chatActionIcon,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ColoredBox(
        color: AppColors.appBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(),
            MessageFormWidget(chatKey: chatKey),
          ],
        ),
      ),
    );
  }
}
