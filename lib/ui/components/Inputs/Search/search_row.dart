import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Inputs/filter_row_item.dart';


class SearchRow extends StatefulWidget {
  // should take in filter options
  // search callback
  final List<String> filters;
  final Function search;

  SearchRow({
    @required this.search,
    @required this.filters,
  });

  _SearchRowState createState() => _SearchRowState();
}

class _SearchRowState extends State<SearchRow> {
  String searchQuery = "";
  int activeFilterIdx = 0;
  bool isSearchFocused = false;

  void updateQueryVal(v) {
    searchQuery = v;
  }

  void setActiveFilter(idx) {
    print('set active filter = ' + idx.toString());

    if (idx != activeFilterIdx) {
      activeFilterIdx = idx;
      setState(() => {});
    }
  }

  void setSearchFocused() {
    print('set search focused');
    isSearchFocused = !isSearchFocused;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: new EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.filters.length,
              itemBuilder: (BuildContext context, int index) =>
                Center(
                  child: FilterRowItem(
                    widget.filters[index],
                    onPressed: () => setActiveFilter(index),
                    isActive: (index == activeFilterIdx),
                  ),
                ),
            ),
          ),
          GestureDetector(
            onTap: setSearchFocused,
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              height: 40,
              width: 48,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 21,
                  width: 20,
                  child: Image(
                    image: AssetImage('assets/images/Icons/search_default.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
