import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/badge_filters.dart';
import 'package:flutter_recipe/core/presentation/components/button.dart';
import 'package:flutter_recipe/presentation/search/filter_state.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class SearchFilterSheet extends StatefulWidget {
  final FilterState state;
  final void Function(FilterState state) onChangeFilter;

  const SearchFilterSheet({
    super.key,
    required this.state,
    required this.onChangeFilter,
  });

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 31),
          // NOTE: Horizontal Expanded Box Example
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Filter Search',
              style: TextStyles.smallTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          const Text('Time', style: TextStyles.smallTextBold),
          const SizedBox(height: 10),
          BadgeFilters(
            items: const ['All', 'Newest', 'Oldest', 'Popularity'],
            selectedItem: _state.time,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(time: item);
              });
            },
          ),
          const SizedBox(height: 20),
          const Text('Rate', style: TextStyles.smallTextBold),
          const SizedBox(height: 10),
          BadgeFilters(
            items: const ['5', '4', '3', '2', '1'],
            selectedItem: _state.rate.toString(),
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(rate: int.parse(item));
              });
            },
          ),
          const SizedBox(height: 20),
          const Text('Category', style: TextStyles.smallTextBold),
          const SizedBox(height: 10),
          BadgeFilters(
            items: const [
              'All',
              'Cereal',
              'Vegetables',
              'Dinner',
              'Chinese',
              'Local Dish',
              'Fruit',
              'BreadFast',
              'Spanish',
              'Lunch',
            ],
            selectedItem: _state.category,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(category: item);
              });
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 174,
                child: Button(
                  'Filter',
                  onPressed: () => widget.onChangeFilter(_state),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
