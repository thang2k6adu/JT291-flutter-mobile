import 'package:flutter/material.dart';

class MenuSection extends StatelessWidget {
  final List<(IconData, String)> items;
  const MenuSection({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: items
            .map(
              (item) => ListTile(
                leading: Icon(item.$1, color: Colors.black87),
                title: Text(
                  item.$2,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
                onTap: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
