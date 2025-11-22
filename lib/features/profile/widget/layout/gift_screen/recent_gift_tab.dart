import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/recent_gifts_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/recent_gifts_controller.dart';

class RecentGiftsTabWidget extends ConsumerWidget {
  final ScrollController scrollController;
  final VoidCallback onCheckLoadMore;
  final Widget Function(List<dynamic>, dynamic) buildRecentGiftsList;

  const RecentGiftsTabWidget({
    Key? key,
    required this.scrollController,
    required this.onCheckLoadMore,
    required this.buildRecentGiftsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentGiftsAsync = ref.watch(myRecentGiftsProvider);
    final controller = ref.read(recentGiftsControllerProvider.notifier);
    final notifier = ref.read(myRecentGiftsProvider.notifier);

    return recentGiftsAsync.when(
      data: (transactions) {
        if (transactions.isEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await controller.refresh();
              onCheckLoadMore();
            },
            child: ListView(
              controller: scrollController,
              children: const [
                SizedBox(height: 200),
                Center(
                  child: Text(
                    'Chưa có quà tặng gần đây',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.refresh();
            onCheckLoadMore();
          },
          child: buildRecentGiftsList(transactions, notifier),
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(color: Colors.pink)),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lỗi: $error',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.refresh();
              },
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}