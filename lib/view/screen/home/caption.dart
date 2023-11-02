import 'package:flutter/material.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/utils/images.dart';
import 'dart:math' as math;

class Caption extends StatefulWidget {
  final String caption;
  const Caption({
    super.key,
    required this.caption,
  });

  @override
  State<Caption> createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  bool get longer => widget.caption.length > 150;
  bool showing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 60, 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(76, 66, 67, 0.66),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: 0.9,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showing)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [readMoreLess('Less')],
              ),
            Text(
              longer && showing
                  ? widget.caption
                  : longer
                      ? widget.caption.substring(0, 150)
                      : widget.caption,
              style: Fonts.robotoLight.copyWith(
                color: Colors.white,
                fontSize: showing ? 15 : 13.5,
                fontWeight: FontWeight.w400,
                height: 1.46,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '27 Oct, 2020 @5:23pm',
                  style: Fonts.robotoMedium.copyWith(
                    color: const Color.fromRGBO(229, 165, 165, 1),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                if (longer && !showing) readMoreLess('More')
              ],
            )
          ],
        ),
      ),
    );
  }

  Container readMoreLess(String title) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(44, 43, 43, 0.8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 2,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            showing = !showing;
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '... $title',
              style: Fonts.robotoMedium.copyWith(
                color: const Color.fromRGBO(44, 202, 160, 1),
                fontSize: 15,
              ),
            ),
            Transform.rotate(
                angle: title == 'Less' ? math.pi : 0,
                child: Image.asset(AppImages.more)),
          ],
        ),
      ),
    );
  }
}

String caption =
    'Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.';
