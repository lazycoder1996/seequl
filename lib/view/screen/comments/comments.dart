import 'package:flutter/material.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/utils/images.dart';
import 'package:seequl/view/screen/comments/comment_field.dart';
import 'package:seequl/view/screen/comments/comment_tile.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height - 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
                color: Color.fromRGBO(95, 99, 104, 1),
              ),
              child: Text(
                '45k Comments',
                style: Fonts.robotoLight.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                CommentTile(
                  imagePath: AppImages.user1,
                  comment:
                      'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper  amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                  comments: '15',
                  likes: '7k',
                  hours: '3',
                  replies: '15',
                  user: const {
                    'fullname': 'Kerry Johns',
                    'username': 'Kerryjo'
                  },
                ),
                CommentTile(
                  imagePath: AppImages.user5,
                  comment:
                      'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                  comments: '',
                  hours: '8',
                  likes: '7k',
                  replies: '15',
                  user: const {
                    'fullname': 'Kerry Johns',
                    'username': 'Kerryjo'
                  },
                ),
                CommentTile(
                  imagePath: AppImages.user4,
                  comment:
                      'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                  comments: '15',
                  hours: '3',
                  likes: '7k',
                  replies: '15',
                  user: const {
                    'fullname': 'Kerry Johns',
                    'username': 'Kerryjo'
                  },
                ),
                CommentTile(
                  imagePath: AppImages.user2,
                  comment:
                      'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      amet justo quisque          ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
                  comments: '15',
                  likes: '7k',
                  hours: '8',
                  replies: '15',
                  user: const {
                    'fullname': 'Kerry Johns',
                    'username': 'Kerryjo'
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: ReplyField(),
          ) // const Spacer(),
        ],
      ),
    );
  }
}
