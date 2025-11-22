import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_wall_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/gift_wall_controller.dart';

class GiftWallTabWidget extends ConsumerWidget {
  final ScrollController scrollController;
  final VoidCallback onCheckLoadMore;
  final Widget Function(List<GiftModel>, MyGiftWallNotifier) buildGiftGrid;

    const GiftWallTabWidget({
      super.key,
    required this.scrollController,
    required this.onCheckLoadMore,
    required this.buildGiftGrid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final giftWallAsync = ref.watch(myGiftWallProvider);
    final controller = ref.read(giftWallControllerProvider.notifier);
    final notifier = ref.read(myGiftWallProvider.notifier);

    return giftWallAsync.when(
      data: (gifts) {
        if (gifts.isEmpty) {
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
                    'Chưa có quà tặng nào',
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
          child: buildGiftGrid(gifts, notifier),
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