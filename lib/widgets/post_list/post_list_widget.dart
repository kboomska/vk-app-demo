import 'package:flutter/material.dart';
import 'package:vk_app/theme/app_colors.dart';

import '/resources/resources.dart';

class Post {
  final String author;
  final String avatar;
  final String date;
  final String text;
  final String media;
  int reactions;
  final int replies;
  final int share;
  final String views;
  bool isLiked = false;

  Post({
    required this.author,
    required this.avatar,
    required this.date,
    required this.text,
    required this.media,
    required this.reactions,
    required this.replies,
    required this.share,
    required this.views,
    required this.isLiked,
  });
}

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final _posts = [
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: true,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов. Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов.',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
      isLiked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('PostListWidget build');
    return ColoredBox(
      color: AppColors.mainBackgroundColor,
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: _posts[index]);
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void _onTablikebutton() {
    widget.post.isLiked = !widget.post.isLiked;
    if (widget.post.isLiked) {
      widget.post.reactions += 1;
    } else {
      widget.post.reactions -= 1;
    }

    print('Do you like it: ${widget.post.isLiked}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('PostCard build');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: PostDataProviderInherited(
          reactions: widget.post.reactions,
          isLiked: widget.post.isLiked,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        widget.post.avatar,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.post.author,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.postAuthor,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.post.date,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.postDate,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        print('Post actions');
                      },
                      iconSize: 24,
                      constraints: BoxConstraints.tight(const Size(40, 40)),
                      icon: const Icon(
                        Icons.more_horiz,
                        color: AppColors.postActions,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                child: Text(
                  widget.post.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.postAuthor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Image.asset(
                  widget.post.media,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: _onTablikebutton,
                        borderRadius: BorderRadius.circular(16),
                        child: const PostLikeButton(),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    PostBottomButton(
                      buttonCounter: widget.post.replies,
                      buttonIcon: const Icon(
                        Icons.messenger_outline_outlined,
                        color: AppColors.postBottomButtons,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    PostBottomButton(
                      buttonCounter: widget.post.share,
                      buttonIcon: const Icon(
                        Icons.reply_rounded,
                        color: AppColors.postBottomButtons,
                        size: 24,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.visibility,
                          color: AppColors.postBottomViews,
                          size: 16,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.post.views,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.postBottomViews,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostLikeButton extends StatelessWidget {
  const PostLikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int buttonCounter = context
            .dependOnInheritedWidgetOfExactType<PostDataProviderInherited>()
            ?.reactions ??
        0;
    final bool isLiked = context
            .dependOnInheritedWidgetOfExactType<PostDataProviderInherited>()
            ?.isLiked ??
        false;

    print('PostLikeButton build');
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: isLiked
            ? AppColors.postLikedButtonBackground
            : AppColors.postBottomButtonsBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Icon(
              Icons.favorite_outline,
              color: isLiked
                  ? AppColors.postLikedButton
                  : AppColors.postBottomButtons,
              size: 24,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '$buttonCounter',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isLiked
                    ? AppColors.postLikedButton
                    : AppColors.postBottomButtons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostBottomButton extends StatelessWidget {
  final int buttonCounter;
  final Icon buttonIcon;

  const PostBottomButton({
    super.key,
    required this.buttonCounter,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    print('PostBottomButton build');
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: AppColors.postBottomButtonsBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            buttonIcon,
            const SizedBox(
              width: 4,
            ),
            Text(
              '$buttonCounter',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.postBottomButtons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostDataProviderInherited extends InheritedWidget {
  final int reactions;
  final bool isLiked;

  const PostDataProviderInherited({
    super.key,
    required this.reactions,
    required this.isLiked,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(PostDataProviderInherited oldWidget) {
    return reactions != oldWidget.reactions || isLiked != oldWidget.isLiked;
  }
}
