import 'package:flutter/material.dart';
import 'package:wash_wiz/app/widgets/no_data.dart';

class NewsSubPage extends StatefulWidget {
  const NewsSubPage({super.key});

  @override
  State<NewsSubPage> createState() => _NewsSubPageState();
}

class _NewsSubPageState extends State<NewsSubPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: NoData(msg: 'No News', op: 2),
    );
  }
}
