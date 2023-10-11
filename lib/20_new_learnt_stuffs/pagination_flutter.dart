import 'dart:async';

import 'package:flutter/material.dart';

class PaginationExample extends StatefulWidget {
  const PaginationExample({super.key});

  @override
  _PaginationExampleState createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  final int _defaultPageSize = 10;
  final int _totalItems = 100;
  int _currentPage = 1;
  bool _isLoading = false;
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    List<String> newItems = List.generate(
      _defaultPageSize,
      (index) => "Item ${_items.length + index + 1}",
    );

    setState(() {
      _isLoading = false;
      _items.addAll(newItems);
      _currentPage++;
    });
  }

  bool _isLastPage() {
    return _currentPage * _defaultPageSize >= _totalItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination Example"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  if (_isLastPage()) {
                    return Center(
                      child: Text("End of List"),
                    );
                  } else {
                    _loadMoreItems();
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return ListTile(
                    title: Text(_items[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
