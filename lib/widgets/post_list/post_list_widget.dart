import 'package:flutter/material.dart';
import 'package:vk_app/theme/app_colors.dart';

import '/resources/resources.dart';

class Post {
  final String author;
  final String avatar;
  final String date;
  final String text;
  final String media;
  final int reactions;
  final int replies;
  final int share;
  final String views;

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
  });
}

class PostListWidget extends StatelessWidget {
  PostListWidget({super.key});

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
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
    Post(
      author: 'Другое кино',
      avatar: AppImages.postAvatar,
      date: '15 апр в 11:05',
      text:
          'Thomas Duke путешествует по миру в поисках локаций из любимых фильмов и сериалов',
      media: AppImages.postMedia,
      reactions: 120,
      replies: 2,
      share: 28,
      views: '13K',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mainBackgroundColor,
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              // height: 450,
              decoration: BoxDecoration(
                color: AppColors.appBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
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
                            post.avatar,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            Text(
                              post.author,
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
                              post.date,
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
                      post.text,
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
                      post.media,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.postBottomButtonsBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.postBottomButtons,
                                  size: 24,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${post.reactions}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.postBottomButtons,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
