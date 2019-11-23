import 'package:flutter/material.dart';

import 'package:baloo/ui/components/Inputs/Search/filter_row_item.dart';


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
    widget.search(widget.filters[activeFilterIdx], searchQuery);
    setState(() => {});
  }

  void setActiveFilter(idx) {
    if (idx != activeFilterIdx) {
      activeFilterIdx = idx;
      setState(() => {});
    }
  }

  void setSearchFocused() {
    isSearchFocused = !isSearchFocused;
    if (isSearchFocused) {
      searchQuery = "";
      widget.search(widget.filters[activeFilterIdx], searchQuery);
    }
    setState(() => {});
  }

  Widget _searchBox() {
    if (isSearchFocused) {
      return Row(
        children: <Widget> [
          Expanded(
            child: TextField(
              onChanged: updateQueryVal,
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffix: GestureDetector(
                  onTap: setSearchFocused,
                  behavior: HitTestBehavior.translucent,
                  child: SizedBox(
                    height: 40,
                    width: 48,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          Icons.close,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Hero(
      tag: 'search-box',
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: new EdgeInsets.fromLTRB(20.0, 4.0, 20.0, 12.0),
      child: _searchBox(),
    );
  }
}
