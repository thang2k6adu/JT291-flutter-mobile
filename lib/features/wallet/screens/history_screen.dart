import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/transaction_model.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/transaction_history_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _setupScrollListener();

    // Load initial data and check if need to load more
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(transactionHistoryProvider.notifier).fetchData(reset: true).then((_) {
        _checkLoadMoreIfListNotFull();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        // Load more when near bottom (200px before end)
        final notifier = ref.read(transactionHistoryProvider.notifier);
        notifier.loadMore();
      }
    });
  }

  void _checkLoadMoreIfListNotFull() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent <=
              _scrollController.position.viewportDimension) {
        // If list doesn't fill the screen, load more
        final notifier = ref.read(transactionHistoryProvider.notifier);
        if (notifier.hasNext) {
          notifier.loadMore().then((_) {
            // After loading, check again if need more
            _checkLoadMoreIfListNotFull();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionHistoryProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(title: 'History', bottomBorder: true),
      body: transactionsAsync.when(
        data: (transactions) {
          if (transactions.isEmpty) {
            return _buildEmptyState();
          }
          return _buildTransactionList(transactions);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorState(error),
      ),
    );
  }

  Widget _buildEmptyState() {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(transactionHistoryProvider.notifier).refresh();
        _checkLoadMoreIfListNotFull();
      },
      child: ListView(
        controller: _scrollController,
        children: [
          const SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.history, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'No transaction history',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(transactionHistoryProvider.notifier).refresh();
      },
      child: ListView(
        controller: _scrollController,
        children: [
          const SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                const SizedBox(height: 16),
                Text(
                  'Failed to load transactions',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(transactionHistoryProvider.notifier).refresh();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<TransactionModel> transactions) {
    final notifier = ref.read(transactionHistoryProvider.notifier);
    
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(transactionHistoryProvider.notifier).refresh();
        _checkLoadMoreIfListNotFull();
      },
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: transactions.length + (notifier.isLoadingMore ? 1 : 0),
        separatorBuilder: (context, index) {
          if (index < transactions.length - 1) {
            return const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0));
          }
          return const SizedBox.shrink();
        },
        itemBuilder: (context, index) {
          if (index < transactions.length) {
            return TransactionItem(transaction: transactions[index]);
          } else {
            // Loading indicator
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transaction type and status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transaction type and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _getTransactionTitle(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: _getStatusColor(),
                              height: 1.4,
                            ),
                          ),
                        ),
                        if (transaction.status !=
                            TransactionStatus.completed) ...[
                          const SizedBox(width: 8),
                          _buildStatusBadge(),
                        ],
                      ],
                    ),
                    if (transaction.relatedUser != null) ...[
                      const SizedBox(height: 8),
                      _buildUserInfo(),
                    ],
                    if (transaction.note != null &&
                        transaction.note!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        transaction.note!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // Amount badge
              _buildAmountBadge(),
            ],
          ),
          const SizedBox(height: 8),

          // Timestamp and reference code
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDateTime(transaction.timestamp),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              if (transaction.referenceCode != null) ...[
                Text(
                  'Ref: ${transaction.referenceCode}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ],
          ),

          // Balance after transaction
          // if (transaction.balanceAfter != null) ...[
          //   const SizedBox(height: 6),
          //   Text(
          //     'Balance: ${transaction.balanceAfter!.toInt()} 💎',
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: Colors.grey[600],
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ],
        ],
      ),
    );
  }

  String _getTransactionTitle() {
    switch (transaction.type) {
      case TransactionType.deposit:
        return 'Deposit diamonds from the app';
      case TransactionType.withdrawal:
        return 'Withdraw diamonds';
      case TransactionType.exchange:
        final exchange = transaction.exchange;
        if (exchange != null) {
          return 'Exchange ${exchange.fromAmount.toInt()} VEX for ${exchange.toAmount.toInt()} Diamonds';
        }
        return 'Exchange';
      case TransactionType.giftReceived:
        final item = transaction.item;
        if (item != null) {
          return 'Received from Live: ${item.name} x${item.quantity}';
        }
        return 'Received gift from live';
      case TransactionType.giftSent:
        final item = transaction.item;
        if (item != null) {
          return 'Gift sent: ${item.name} x${item.quantity}';
        }
        return 'Gift sent';
      case TransactionType.reward:
        return transaction.description;
      case TransactionType.refund:
        return transaction.description;
    }
  }

  Widget _buildUserInfo() {
    final user = transaction.relatedUser;
    if (user == null) return const SizedBox.shrink();

    final hasAvatar = user.avatar.isNotEmpty;

    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundImage: hasAvatar ? NetworkImage(user.avatar) : null,
          backgroundColor: Colors.grey[300],
          child: hasAvatar
              ? null
              : Text(
                  user.displayName.isNotEmpty
                      ? user.displayName[0].toUpperCase()
                      : '?',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            user.displayName,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (user.isVerified != null && user.isVerified!) ...[
          const SizedBox(width: 4),
          const Icon(Icons.verified, size: 14, color: Color(0xFF1DA1F2)),
        ],
      ],
    );
  }

  Color _getStatusColor() {
    switch (transaction.status) {
      case TransactionStatus.completed:
        return const Color(0xFF1A1A1A);
      case TransactionStatus.pending:
        return const Color(0xFFFF9500);
      case TransactionStatus.failed:
        return const Color(0xFFFF3B30);
      case TransactionStatus.cancelled:
        return Colors.grey;
    }
  }

  Widget _buildStatusBadge() {
    String label;
    Color backgroundColor;
    Color textColor;

    switch (transaction.status) {
      case TransactionStatus.pending:
        label = 'Pending';
        backgroundColor = const Color(0xFFFFF3CD);
        textColor = const Color(0xFFFF9500);
        break;
      case TransactionStatus.failed:
        label = 'Failed';
        backgroundColor = const Color(0xFFFFF0F0);
        textColor = const Color(0xFFFF3B30);
        break;
      case TransactionStatus.cancelled:
        label = 'Cancelled';
        backgroundColor = const Color(0xFFF0F0F0);
        textColor = Colors.grey;
        break;
      case TransactionStatus.completed:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildAmountBadge() {
    final isPositive = transaction.amount > 0;
    final isNegative = transaction.amount < 0;

    Color textColor;
    String sign;

    if (isPositive) {
      textColor = const Color(0xFF34C759);
      sign = '+';
    } else if (isNegative) {
      textColor = const Color(0xFFFF3B30);
      sign = '-';
    } else {
      textColor = Colors.grey;
      sign = '';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$sign${transaction.amount.abs().toInt()}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        const SizedBox(width: 4),
        Image.asset(AppIcons.diamondPng, width: 16, height: 16),
      ],
    );
  }

  String _formatDateTime(String timestamp) {
    try {
      final dateTime = DateTime.parse(timestamp);
      final formatter = DateFormat('yyyy-MM-dd hh:mm a');
      return formatter.format(dateTime);
    } catch (e) {
      return timestamp;
    }
  }
}
