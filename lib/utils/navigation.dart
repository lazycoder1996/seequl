import 'package:flutter/material.dart';

toScreen(BuildContext context, page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
replaceScreen(BuildContext context, page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
}
