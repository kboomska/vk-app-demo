import 'package:flutter/material.dart';

import '/widgets/provider/post_data_provider.dart';
import '/theme/app_colors.dart';

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final model = PostDataModel();

  @override
  Widget build(BuildContext context) {
    return PostDataProvider(
      model: model,
      child: const ColoredBox(
        color: AppColors.mainBackgroundColor,
        child: PostList(),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('PostList build');
    return ListView.builder(
      itemCount: PostDataProvider.watch(context)?.posts.length ?? 0,
      itemBuilder: (context, index) {
        return PostCard(index: index);
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final int index;

  const PostCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final post = PostDataProvider.read(context)!.posts[index];

    print('PostCard build: $index');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.appBackgroundColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            PostHeader(
              avatar: post.avatar,
              author: post.author,
              date: post.date,
            ),
            PostText(text: post.text),
            PostMedia(media: post.media),
            PostFooter(
              index: index,
            ),
          ],
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
  final int index;

  const PostFooter({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final post = PostDataProvider.read(context)!.posts[index];
    print('PostFooter build');
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        children: [
          PostLikeButton(
            index: index,
          ),
          const SizedBox(
            width: 8,
          ),
          PostBottomButton(
            buttonCounter: post.replies,
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
            buttonCounter: post.share,
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
                post.views,
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
  final int index;

  const PostLikeButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final post = PostDataProvider.read(context)!.posts[index];
    final int reactions = post.reactions;
    final bool isLiked = post.isLiked;

    print('PostLikeButton build');
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () =>
            PostDataProvider.watch(context)?.onTapLikeButton(index: index),
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
                  '$reactions',
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
