import 'package:flutter/material.dart';
import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/presentation/widgets/tab_item_widget.dart';

class TabContainerWidget extends StatefulWidget {
  const TabContainerWidget({super.key, required this.categories, this.onTap});
  final List<CategoryEntity> categories;
  final void Function(int)? onTap;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            onTap: widget.onTap,
            tabs: widget.categories
                .map((source) => TabItemWidget(category: source))
                .toList(),
          
          ),
        ],
      ),
    );
  }
}
