import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/hashtag_search_provider.dart';

class AddHashtagScreen extends ConsumerStatefulWidget {
  const AddHashtagScreen({super.key});

  @override
  ConsumerState<AddHashtagScreen> createState() => _AddHashtagScreenState();
}

class _AddHashtagScreenState extends ConsumerState<AddHashtagScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isCreatingHashtag = false;
  Timer? _debounce;

  // Danh sách hot hashtags (có thể giữ lại hoặc load từ API)
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

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Update search query ngay lập tức để hiển thị text trong TextField
    setState(() {
      _searchQuery = value;
    });

    // Cancel timer trước đó nếu có
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Nếu query rỗng, reset debounced query ngay lập tức
    if (value.trim().isEmpty) {
      ref.read(hashtagSearchQueryProvider.notifier).state = '';
      return;
    }

    // Tạo timer mới để debounce - chỉ update debounced query sau 500ms
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Update debounced query provider - điều này sẽ trigger hashtagSearchProvider
      ref.read(hashtagSearchQueryProvider.notifier).state = value.trim();
    });
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
                onChanged: _onSearchChanged,
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
    if (_searchQuery.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    // Watch debounced search provider
    final searchState = ref.watch(hashtagSearchProvider);
    final debouncedQuery = ref.watch(hashtagSearchQueryProvider);

    // Nếu query hiện tại khác với debounced query, hiển thị loading
    if (_searchQuery.trim() != debouncedQuery) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    return searchState.when(
      data: (searchResponse) {
        final hashtags = searchResponse.result;
        final canCreate = searchResponse.canCreate;

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            // Option to create new hashtag (chỉ hiện khi canCreate = true)
            if (canCreate) _buildCreateNewHashtagItem(_searchQuery),
            if (canCreate) const SizedBox(height: 8),

            // Search results from API
            ...hashtags.map((hashtag) => _buildHashtagItem(hashtag.name)),

            // Show "no results" if nothing found
            if (hashtags.isEmpty && !canCreate)
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
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lỗi khi tìm kiếm: ${error.toString()}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(hashtagSearchProvider);
                },
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for creating new hashtag
  Widget _buildCreateNewHashtagItem(String query) {
    return InkWell(
      onTap: _isCreatingHashtag ? null : () => _createHashtag(query),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Expanded(
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
            if (_isCreatingHashtag)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _createHashtag(String name) async {
    if (name.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập tên hashtag'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isCreatingHashtag = true;
    });

    try {
      final socialFeedService = ref.read(socialFeedServiceProvider);
      final response = await socialFeedService.createHashtag(name.trim());

      if (response.error || response.data == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // Navigate back với hashtag đã tạo
        if (mounted) {
          Navigator.pop(context, name.trim());
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi tạo hashtag: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCreatingHashtag = false;
        });
      }
    }
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
