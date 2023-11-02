import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/view/screen/comments/reply.dart';

import '../../../utils/icons.dart';

class CommentTile extends StatefulWidget {
  final String imagePath;
  final String comment;
  final String hours;
  final String likes;
  final String comments;
  final String replies;
  final Map user;
  final bool? reply;
  const CommentTile({
    super.key,
    required this.imagePath,
    required this.comment,
    required this.comments,
    required this.likes,
    required this.replies,
    required this.hours,
    required this.user,
    this.reply = false,
  });

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Image.asset(widget.imagePath),
        title: Row(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: widget.user['fullname'],
                      style: Fonts.robotoMedium.copyWith(
                        fontSize: 14,
                      )),
                  TextSpan(
                    text: '\t   @${widget.user['username']}',
                    style: Fonts.robotoLight.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '${widget.hours} hours ago',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.comment,
                style: const TextStyle(
                  fontSize: 12.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (!widget.reply!)
                Row(
                  children: [
                    CommentAction(
                      iconPath: AppIcons.comment,
                      value: widget.comments,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: const ReplySection(),
                              );
                            });
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CommentAction(
                      iconPath: AppIcons.favorite,
                      value: widget.likes,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CommentAction(
                      iconPath: AppIcons.flag,
                      value: '',
                      onTap: () {},
                    ),
                  ],
                ),
              const SizedBox(
                height: 5,
              ),
              if (widget.comments.isNotEmpty && !widget.reply!)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('View ${widget.comments} replies'),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: Color.fromRGBO(189, 101, 101, 1),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentAction extends StatelessWidget {
  final String iconPath;
  final String value;
  final void Function() onTap;
  const CommentAction(
      {super.key,
      required this.onTap,
      required this.iconPath,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(
            width: 5,
          ),
          Text(value),
        ],
      ),
    );
  }
}
