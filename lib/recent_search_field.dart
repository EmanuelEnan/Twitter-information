import 'package:flutter/material.dart';
import 'package:twitter_api_1/recent_search_info.dart';

import 'location_page.dart';

class RecentSearchField extends StatelessWidget {
  RecentSearchField({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Column(
        children: [
          const Text('Write the term you want to search'),
          TextField(
            controller: _searchController,
          ),
          ElevatedButton(
            onPressed: () {
              var search = _searchController.text;

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RecentSearchInfo(searchInfo: search),
                ),
              );
            },
            child: const Text('search'),
          ),
        ],
      ),
    );
  }
}
