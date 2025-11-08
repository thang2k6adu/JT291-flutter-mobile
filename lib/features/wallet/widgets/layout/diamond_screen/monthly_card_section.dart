import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/monthly_card_option.dart';
import 'package:jt291_flutter_mobile/components/ui/handle_bar.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';

class MonthlyCardData {
  final String diamonds;
  final String dailyReward;

  MonthlyCardData({
    required this.diamonds,
    required this.dailyReward,
  });
}

final List<MonthlyCardData> cardOptions = [
  MonthlyCardData(
    diamonds: '465',
    dailyReward: '15',
  ),
  MonthlyCardData(
    diamonds: '987',
    dailyReward: '25',
  ),
];

class MonthlyCardSection extends StatefulWidget {
  const MonthlyCardSection({super.key});

  @override
  State<MonthlyCardSection> createState() => _MonthlyCardSectionState();
}

class _MonthlyCardSectionState extends State<MonthlyCardSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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

          // Card options
          Column(
            children: cardOptions.asMap().entries.map((entry) {
              int index = entry.key;
              MonthlyCardData data = entry.value;

              return VerticalSection(
                spacing: 16,
                child: MonthlyCardOption(
                  isSelected: selectedIndex == index,
                  diamonds: data.diamonds,
                  dailyReward: data.dailyReward,
                  onTap: () => setState(() => selectedIndex = index),
                ),
              );
            }).toList(),
          ),

          // Purchase button
          VerticalSection(
            spacing: 20,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  print('Purchase button pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE65983),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  '5.79 USD/per month',
                  style: TextStyle(
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
