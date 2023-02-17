import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_history.dart';
import '../widgets/card_item.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final historiesData = Provider.of<Histories>(context, listen: false);
    final allHistory = historiesData.allHistory;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allHistory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1.2),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: allHistory[index],
          child: CardItem(),
        );
      },
    );
  }
}
