import 'package:flutter/material.dart';

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
  bool isLiked;

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

class PostDataModel extends ChangeNotifier {
  var _posts = [
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

  List<Post> get posts => _posts;

  void onTapLikeButton({required int index}) {
    print('Tap like button');

    _posts[index].isLiked = !_posts[index].isLiked;
    if (_posts[index].isLiked) {
      _posts[index].reactions += 1;
    } else {
      _posts[index].reactions -= 1;
    }
    notifyListeners();
  }
}

class PostDataModelProvider extends InheritedNotifier<PostDataModel> {
  final PostDataModel model;

  const PostDataModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static PostDataModel? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PostDataModelProvider>()
        ?.model;
  }

  static PostDataModel? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<PostDataModelProvider>()
        ?.widget;
    return widget is PostDataModelProvider ? widget.notifier : null;
  }
}
