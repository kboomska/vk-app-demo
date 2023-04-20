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
  final _model = PostDataModel();

  @override
  void initState() {
    super.initState();
    _model.reactions = widget.post.reactions;
    _model.isLiked = widget.post.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    print('PostCard build');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: PostDataProvider(
          model: _model,
          child: Column(
            children: [
              PostHeader(
                avatar: widget.post.avatar,
                author: widget.post.author,
                date: widget.post.date,
              ),
              PostText(text: widget.post.text),
              PostMedia(media: widget.post.media),
              PostFooter(
                replies: widget.post.replies,
                share: widget.post.share,
                views: widget.post.views,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String avatar;
  final String author;
  final String date;

  const PostHeader({
    super.key,
    required this.avatar,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    print('PostHeader build');
    return Padding(
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
              avatar,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              Text(
                author,
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
                date,
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
    );
  }
}

class PostText extends StatelessWidget {
  final String text;

  const PostText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    print('PostText build');
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.postAuthor,
        ),
      ),
    );
  }
}

class PostMedia extends StatelessWidget {
  final String media;

  const PostMedia({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    print('PostMedia build');
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Image.asset(
        media,
      ),
    );
  }
}

class PostFooter extends StatelessWidget {
  final int replies;
  final int share;
  final String views;

  const PostFooter({
    super.key,
    required this.replies,
    required this.share,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    print('PostFooter build');
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          const PostLikeButton(),
          const SizedBox(
            width: 8,
          ),
          PostBottomButton(
            buttonCounter: replies,
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
            buttonCounter: share,
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
                views,
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
    );
  }
}

class PostLikeButton extends StatelessWidget {
  const PostLikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int buttonCounter = PostDataProvider.of(context)?.reactions ?? 0;
    final bool isLiked = PostDataProvider.of(context)?.isLiked ?? false;

    print('PostLikeButton build');
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => PostDataProvider.of(context)?.onTapLikeButton(),
        borderRadius: BorderRadius.circular(16),
        child: Container(
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

class PostDataModel extends ChangeNotifier {
  int? _reactions;
  int? replies;
  int? share;
  String? views;
  bool? _isLiked;

  set reactions(int value) => _reactions = value;
  set isLiked(bool value) => _isLiked = value;

  int get reactions {
    return _reactions ?? 0;
  }

  bool get isLiked {
    return _isLiked ?? false;
  }

  void onTapLikeButton() {
    if (_reactions != null && _isLiked != null) {
      isLiked = !_isLiked!;

      if (_isLiked!) {
        _reactions = _reactions! + 1;
      } else {
        _reactions = _reactions! - 1;
      }
    } else {
      _reactions = null;
      _isLiked = null;
    }
    print('Tap like button');

    notifyListeners();
  }
}

class PostDataProvider extends InheritedNotifier<PostDataModel> {
  final PostDataModel model;

  const PostDataProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static PostDataModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PostDataProvider>()
        ?.model;
  }
}
