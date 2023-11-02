import 'package:flutter/material.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/view/screen/comments/comment_field.dart';

import '../../../utils/images.dart';
import 'comment_tile.dart';

class ReplySection extends StatefulWidget {
  const ReplySection({super.key});

  @override
  State<ReplySection> createState() => _ReplySectionState();
}

class _ReplySectionState extends State<ReplySection> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height - 120,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Reply',
                    style: Fonts.robotoBold.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CommentTile(
                reply: true,
                imagePath: AppImages.user1,
                comment:
                    'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                comments: '15',
                hours: '3',
                likes: '7k',
                replies: '15',
                user: const {'fullname': 'Kerry Johns', 'username': 'Kerryjo'},
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Replying to '),
                    TextSpan(
                      text: 'John Doe@JohntheD',
                      style: Fonts.robotoMedium.copyWith(
                        color: const Color.fromRGBO(255, 187, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ReplyField(),
            ],
          ),
        ),
      ),
    );
  }
}
