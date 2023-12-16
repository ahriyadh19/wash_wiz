import 'package:flutter/material.dart';
import 'package:wash_wiz/widgets/no_data.dart';

class HistorySubPage extends StatefulWidget {
  const HistorySubPage({super.key});

  @override
  State<HistorySubPage> createState() => _HistorySubPageState();
}

class _HistorySubPageState extends State<HistorySubPage> {
  @override
  Widget build(BuildContext context) {
    return const NoData(msg: 'No History', op: 1);
  }
}
