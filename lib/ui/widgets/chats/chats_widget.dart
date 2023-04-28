import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:vk_app/ui/navigation/main_navigation.dart';
import 'package:vk_app/resources/resources.dart';
import 'package:vk_app/theme/app_colors.dart';

class ChatsWidget extends StatefulWidget {
  const ChatsWidget({super.key});

  @override
  State<ChatsWidget> createState() => _ChatsWidgetState();
}

class _ChatsWidgetState extends State<ChatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.iconBlue),
        elevation: 1,
        shadowColor: AppColors.mainAppBarShadowColor,
        title: const Text(
          'Мессенджер',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [ChatsActionsWidget()],
      ),
      body: const ColoredBox(
        color: AppColors.appBackgroundColor,
        child: ChatListWidget(),
      ),
    );
  }
}

class ChatsActionsWidget extends StatelessWidget {
  const ChatsActionsWidget({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.chatsForm);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            print('Add a new contact');
          },
          child: const Icon(
            Icons.add_call,
            color: AppColors.chatActionIcon,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => showForm(context),
          child: const Icon(
            Icons.create,
            color: AppColors.chatActionIcon,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  print('Delete chat');
                },
                backgroundColor: AppColors.chatDeleteAction,
                foregroundColor: AppColors.appBackgroundColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              print('Tap on chat');
            },
            child: SizedBox(
              height: 75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(AppImages.chatAvatar),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: AppColors.postTextTitle,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Last message from user',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColors.chatTextSubtitle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
