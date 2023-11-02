import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seequl/utils/fonts.dart';
import 'package:seequl/utils/icons.dart';
import 'package:seequl/utils/images.dart';
import 'package:seequl/view/screen/home/caption.dart';
import 'package:seequl/view/screen/comments/comments.dart';
import 'dart:math' as math;

import 'fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomItems = [
    {'label': 'Apps', 'icon': AppIcons.apps},
    {'label': 'Queen', 'icon': AppIcons.queen},
    {'label': 'Zaddy', 'icon': AppIcons.zaddy},
    {'label': 'Organize', 'icon': AppIcons.organize},
    {'label': 'Profile', 'icon': Icons.person},
  ];

  bool hideMenus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, 5),
              child: FAB(
                onTap: () {},
                fileName: AppIcons.leading,
                height: 25,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text('SeeQul'),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ],
        ),
        actions: [
          FAB(
            onTap: () {},
            fileName: AppIcons.search,
            height: 20,
            offset: const Offset(0, 5),
          ),
          const SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FAB(
              onTap: () {},
              fileName: AppIcons.filter,
              offset: const Offset(0, 5),
              height: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: hideMenus
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Fixed
              backgroundColor: Colors.black, // <-- This works for fixed
              unselectedItemColor: Colors.white,
              selectedItemColor: const Color.fromRGBO(255, 221, 94, 1),
              items: bottomItems.map((item) {
                return BottomNavigationBarItem(
                  icon: item['label'] == 'Profile'
                      ? Icon(
                          item['icon'] as IconData,
                          color: Colors.white,
                          size: 35,
                        )
                      : SvgPicture.asset(
                          item['icon'] as String,
                        ),
                  label: item['label'] as String,
                );
              }).toList(),
            ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bg,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            if (hideMenus)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Transform.rotate(
                    angle: math.pi,
                    child: FAB(
                        onTap: () {
                          setState(() {
                            hideMenus = false;
                          });
                        },
                        fileName: AppIcons.navigation),
                  ),
                ),
              ),
            Padding(
              padding: !hideMenus
                  ? EdgeInsets.zero
                  : const EdgeInsets.fromLTRB(25, 0, 0, 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Caption(
                  caption: caption,
                ),
              ),
            ),
            if (!hideMenus)
              Positioned(
                top: 5,
                left: 5,
                child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  itemBuilder: (context) {
                    return [
                      menuItem('Post a Seequl', AppIcons.add),
                      menuItem('View your likes', AppIcons.likes),
                      menuItem('Your Seequl posts', AppIcons.posts),
                      menuItem('Reference contribution', AppIcons.reference),
                      menuItem('Hashtag challenges', AppIcons.hashtag),
                      menuItem('Notifications', AppIcons.notification),
                      menuItem('About SeeQul', AppIcons.about),
                    ];
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.menu),
                  ),
                ),
              ),
            if (!hideMenus)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Image.asset(
                        AppImages.profile,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                    FAB(onTap: () {}, fileName: AppIcons.book),
                    FAB(
                        // key: const Key('sheet'),
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: const CommentSection(),
                              );
                            },
                          );
                        },
                        fileName: AppIcons.comments),
                    FAB(onTap: () {}, fileName: AppIcons.like),
                    FAB(onTap: () {}, fileName: AppIcons.share),
                    FAB(
                      onTap: () {
                        setState(() {
                          hideMenus = !hideMenus;
                        });
                      },
                      fileName: AppIcons.navigation,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  PopupMenuItem<dynamic> menuItem(String title, String iconPath) {
    return PopupMenuItem(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Fonts.robotoThin.copyWith(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
