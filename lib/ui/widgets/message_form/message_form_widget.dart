import 'package:flutter/material.dart';

import 'package:vk_app/ui/widgets/message_form/message_form_widget_model.dart';
import 'package:vk_app/theme/app_text_field.dart';
import 'package:vk_app/theme/app_colors.dart';

class MessageFormWidget extends StatefulWidget {
  final chatKey;

  const MessageFormWidget({super.key, required this.chatKey});

  @override
  State<MessageFormWidget> createState() => _MessageFormWidgetState();
}

class _MessageFormWidgetState extends State<MessageFormWidget> {
  late MessageFormWidgetModel _model;

  @override
  void initState() {
    super.initState();
    _model = MessageFormWidgetModel(chatKey: widget.chatKey);
  }

  @override
  Widget build(BuildContext context) {
    return MessageFormWidgetModelProvider(
      model: _model,
      child: const _MessageFormWidgetBody(),
    );
  }
}

class _MessageFormWidgetBody extends StatelessWidget {
  const _MessageFormWidgetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final messageTextController = TextEditingController();
    final model = MessageFormWidgetModelProvider.readOnly(context)?.model;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: messageTextController,
              autofocus: true,
              cursorColor: AppColors.logoBlue,
              cursorHeight: 20,
              maxLines: 8,
              minLines: 1,
              decoration: AppTextField.messageDecoration(
                hintText: 'Сообщение',
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (value) => model?.messageText = value,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              model?.saveMessage(context);
              messageTextController.text = '';
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.chatActionIcon,
              child: Icon(
                Icons.arrow_upward_rounded,
                size: 24,
                color: AppColors.appBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
