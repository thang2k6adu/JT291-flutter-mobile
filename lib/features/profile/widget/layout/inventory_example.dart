import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/inventory_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/inventory_controller.dart';

/// Example widget demonstrating how to use the inventory system
/// 
/// This shows:
/// - How to fetch and display user inventory
/// - How to send gifts from inventory
/// - How to handle pagination
class InventoryExample extends ConsumerWidget {
  const InventoryExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch inventory state for current user
    final inventoryState = ref.watch(myInventoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gift Bag'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh inventory
              ref.read(inventoryControllerProvider.notifier).refresh();
            },
          ),
        ],
      ),
      body: inventoryState.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Text('Túi quà trống'),
            );
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: Image.network(
                  item.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.card_giftcard);
                  },
                ),
                title: Text(item.name),
                subtitle: Text('${item.price} coins × ${item.quantity}'),
                trailing: item.isEvent
                    ? const Chip(
                        label: Text('Event'),
                        backgroundColor: Colors.orange,
                      )
                    : null,
                onTap: () {
                  _showSendGiftDialog(context, ref, item.id, item.quantity);
                },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(inventoryControllerProvider.notifier).refresh();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Show dialog to send gift
  void _showSendGiftDialog(
    BuildContext context,
    WidgetRef ref,
    int itemId,
    int maxQuantity,
  ) {
    final quantityController = TextEditingController(text: '1');
    final recipientIdController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Gửi quà'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: recipientIdController,
              decoration: const InputDecoration(
                labelText: 'Recipient ID',
                hintText: 'Enter user ID',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                hintText: 'Max: $maxQuantity',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final recipientId = int.tryParse(recipientIdController.text);
              final quantity = int.tryParse(quantityController.text);

              if (recipientId == null || quantity == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid input')),
                );
                return;
              }

              if (quantity > maxQuantity) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Maximum quantity is $maxQuantity')),
                );
                return;
              }

              Navigator.pop(dialogContext);

              // Send gift
              await ref.read(inventoryControllerProvider.notifier).sendGift(
                context,
                recipientId: recipientId,
                itemId: itemId,
                quantity: quantity,
              );
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
