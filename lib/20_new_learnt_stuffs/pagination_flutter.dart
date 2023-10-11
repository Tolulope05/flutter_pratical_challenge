import 'dart:async';

import 'package:flutter/material.dart';

class PaginationExample extends StatefulWidget {
  @override
  _PaginationExampleState createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  final int _defaultPageSize = 10;
  final int _totalItems = 100;
  int _currentPage = 1;
  bool _isLoading = false;
  final List<String> _items = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadMoreItems();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

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

  Future<void> _refreshItems() async {
    setState(() {
      _isLoading = true;
      _items.clear();
      _currentPage = 1;
    });

    await _loadMoreItems();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination in Flutter"),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshItems,
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _items.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _items.length) {
                    if (_isLastPage()) {
                      return const Center(
                        child: Text("End of List"),
                      );
                    } else {
                      _loadMoreItems();
                      return const Center(
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
      ),
    );
  }
}
