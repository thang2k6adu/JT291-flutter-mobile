import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';

class AddHashtagScreen extends StatefulWidget {
  const AddHashtagScreen({super.key});

  @override
  State<AddHashtagScreen> createState() => _AddHashtagScreenState();
}

class _AddHashtagScreenState extends State<AddHashtagScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Danh sách hot hashtags
  final List<String> _hotHashtags = [
    'Sayhi2025',
    'Kaiya Torff',
    'Lydia Herwitz',
    'Martin Dorwart',
    'Ann Gouse',
    'Davis Press',
    'Marcus Geidt',
    'Tatiana Rhiel Madsen',
    'Nolan Culhane',
    'Jaylon Westervelt',
    'Zaire Levin',
    'Davis Dias',
  ];

  // Lọc hashtags dựa trên search query
  List<String> get _filteredHashtags {
    if (_searchQuery.isEmpty) {
      return _hotHashtags;
    }
    return _hotHashtags
        .where(
          (hashtag) =>
              hashtag.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add hashtag'),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Field
              AppSearchField(
                controller: _searchController,
                hintText: 'Search for trending hashtags',
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),

              // Content based on search state
              Expanded(
                child: _searchQuery.isEmpty
                    ? _buildHotHashtagsList()
                    : _buildSearchResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Màn hình 1: Hot hashtag list
  Widget _buildHotHashtagsList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const Text(
          'Hot hashtag',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ..._hotHashtags.map((hashtag) => _buildHashtagItem(hashtag)),
      ],
    );
  }

  // Màn hình 2: Search results
  Widget _buildSearchResults() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        // Option to create new hashtag
        _buildCreateNewHashtagItem(_searchQuery),

        const SizedBox(height: 8),

        // Filtered results
        ..._filteredHashtags.map((hashtag) => _buildHashtagItem(hashtag)),

        // Show "no results" if nothing found
        if (_filteredHashtags.isEmpty && _searchQuery.isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Text(
                'Không tìm thấy hashtag',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
      ],
    );
  }

  // Widget for creating new hashtag
  Widget _buildCreateNewHashtagItem(String query) {
    return InkWell(
      onTap: () {
        // Handle create new hashtag
        print('Create new hashtag: $query');
        Navigator.pop(context, query);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              query,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '+ Gắn thẻ chủ đề mới',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for hashtag item
  Widget _buildHashtagItem(String hashtag) {
    return InkWell(
      onTap: () {
        // Handle hashtag selection
        print('Selected hashtag: $hashtag');
        Navigator.pop(context, hashtag);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFF5F5F5), width: 1),
          ),
        ),
        child: Text(
          hashtag,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }
}
