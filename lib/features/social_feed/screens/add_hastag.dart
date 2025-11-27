import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/core/mixins/search_with_debounce_mixin.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/hashtag_search_provider.dart';

/// Mode for AddHashtagScreen
enum AddHashtagMode {
  browse, // Browse hashtags (from FeedScreen) - navigate to HashtagScreen on tap
  select, // Select hashtag for post (from CreatePostBottomSheet) - return hashtag on tap
}

class AddHashtagScreen extends ConsumerStatefulWidget {
  final AddHashtagMode mode;

  const AddHashtagScreen({
    super.key,
    this.mode = AddHashtagMode.select, // Default to select mode for backward compatibility
  });

  @override
  ConsumerState<AddHashtagScreen> createState() => _AddHashtagScreenState();
}

class _AddHashtagScreenState extends ConsumerState<AddHashtagScreen>
    with SearchWithDebounceMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isCreatingHashtag = false;

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
    _searchController.dispose();
    super.dispose();
  }

  @override
  void onSearchDebounced(String query) {
    // Update debounced query provider - điều này sẽ trigger hashtagSearchProvider
    ref.read(hashtagSearchQueryProvider.notifier).state = query;
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
                onChanged: handleSearchChanged,
              ),

              // Content based on search state
              Expanded(
                child: currentQuery.isEmpty
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
        ..._hotHashtags.map((hashtag) => _buildHashtagItem(
          hashtag,
          hashtagId: null, // Hot hashtags don't have ID, will need to search
        )),
      ],
    );
  }

  // Màn hình 2: Search results
  Widget _buildSearchResults() {
    if (currentQuery.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    // Watch debounced search provider
    final searchState = ref.watch(hashtagSearchProvider);
    final debouncedQuery = ref.watch(hashtagSearchQueryProvider);

    // Nếu query hiện tại khác với debounced query, hiển thị loading
    if (currentQuery.trim() != debouncedQuery) {
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
            // Option to create new hashtag (chỉ hiện khi canCreate = true và ở select mode)
            if (canCreate && widget.mode == AddHashtagMode.select) _buildCreateNewHashtagItem(currentQuery),
            if (canCreate && widget.mode == AddHashtagMode.select) const SizedBox(height: 8),

            // Search results from API
            ...hashtags.map((hashtag) => _buildHashtagItem(
              hashtag.name,
              hashtagId: hashtag.id,
            )),

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
  Widget _buildHashtagItem(String hashtag, {String? hashtagId}) {
    return InkWell(
      onTap: () async {
        if (widget.mode == AddHashtagMode.browse) {
          // Navigate to HashtagScreen
          if (hashtagId != null && hashtagId.isNotEmpty) {
            context.push('/hashtag/$hashtagId');
          } else {
            // If no ID (from hot hashtags list), search for hashtag to get ID
            try {
              final service = ref.read(socialFeedServiceProvider);
              final searchResponse = await service.searchHashtags(hashtag.replaceFirst('#', ''));
              
              if (!searchResponse.error && 
                  searchResponse.data != null && 
                  searchResponse.data!.result.isNotEmpty) {
                // Find matching hashtag by name
                final matchingHashtag = searchResponse.data!.result.firstWhere(
                  (h) => h.name.toLowerCase() == hashtag.replaceFirst('#', '').toLowerCase(),
                  orElse: () => searchResponse.data!.result.first,
                );
                
                if (matchingHashtag.id.isNotEmpty) {
                  context.push('/hashtag/${matchingHashtag.id}');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not find hashtag')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hashtag not found')),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${e.toString()}')),
              );
            }
          }
        } else {
          // Select mode: return hashtag to parent
        Navigator.pop(context, hashtag);
        }
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
