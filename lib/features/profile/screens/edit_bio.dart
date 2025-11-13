import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

class EditBioScreen extends ConsumerStatefulWidget {
  const EditBioScreen({super.key});

  @override
  ConsumerState<EditBioScreen> createState() => _EditBioScreenState();
}

class _EditBioScreenState extends ConsumerState<EditBioScreen> {
  late final TextEditingController _controller;
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userGeneralProvider).valueOrNull;
    _controller = TextEditingController(text: user?.bio ?? '');
    _charCount = _controller.text.length;
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _charCount = _controller.text.length;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userGeneralProvider).isLoading;

    return Scaffold(
      // AppBar like the screenshot: centered title and simple back button
      appBar: AppBarWithBack(title: 'Edit Bio'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Rounded, light-gray box containing the text field
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6), // light gray
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 120),
                    child: TextField(
                      controller: _controller,
                      autofocus: true,
                      maxLines: 6,
                      maxLength: 200,
                      // We hide the default counter and render a custom one below
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: '',
                      ),
                      style: const TextStyle(color: Colors.black87, height: 1.4),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Action button aligned to the right, pink rounded like screenshot
                Row(
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: isLoading ? null : _save,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE95B7A), // pink
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withOpacity(0.15),
                      ),
                      child: const Text('Xác nhận', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),

                // small loading indicator if saving
                if (isLoading) ...[
                  const SizedBox(height: 12),
                  const LinearProgressIndicator(minHeight: 2),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    final text = _controller.text.trim();
    await ref.read(userGeneralProvider.notifier).updateProfile({'bio': text});
    await ref.read(userGeneralProvider.notifier).refreshProfile();
    if (mounted) Navigator.pop(context);
  }
}