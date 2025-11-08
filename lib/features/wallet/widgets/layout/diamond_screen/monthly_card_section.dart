import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/monthly_card_option.dart';
import 'package:jt291_flutter_mobile/components/ui/handle_bar.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/monthly_card_provider.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/core/utils/currency_formatter.dart';

class MonthlyCardSection extends ConsumerStatefulWidget {
  const MonthlyCardSection({super.key});

  @override
  ConsumerState<MonthlyCardSection> createState() => _MonthlyCardSectionState();
}

class _MonthlyCardSectionState extends ConsumerState<MonthlyCardSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final monthlyCardsAsync = ref.watch(monthlyCardProvider);

    return Container(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          const VerticalSection(spacing: 12, child: HandleBar()),

          // Title
          const VerticalSection(
            spacing: 20,
            child: Text(
              'Monthly card',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // **Chuyển when xuống chỉ bọc phần card options**
          monthlyCardsAsync.when(
            data: (monthlyCards) => Column(
              children: monthlyCards.asMap().entries.map((entry) {
                int index = entry.key;
                MonthlyCardModel card = entry.value;

                return VerticalSection(
                  spacing: 16,
                  child: MonthlyCardOption(
                    isSelected: selectedIndex == index,
                    diamonds: (card.diamondsDaily * 30).toString(),
                    dailyReward: card.diamondsDaily.toString(),
                    onTap: () => setState(() => selectedIndex = index),
                  ),
                );
              }).toList(),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
          ),

          // Purchase button
          VerticalSection(
            spacing: 20,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => print('Purchase button pressed'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE65983),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  monthlyCardsAsync.maybeWhen(
                    data: (cards) =>
                        '${CurrencyFormatter.format(cards[selectedIndex].price)} / per month',
                    orElse: () => '--',
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
