import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

class EditBioScreen extends ConsumerStatefulWidget {
  const EditBioScreen({super.key});

  @override
  ConsumerState<EditBioScreen> createState() => _EditBioScreenState();
}

class _EditBioScreenState extends ConsumerState<EditBioScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userGeneralProvider).valueOrNull;
    _controller = TextEditingController(text: user?.bio ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userGeneralProvider).isLoading;

    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Bio', actions: [
        TextButton(
          onPressed: isLoading ? null : _save,
          child: const Text('Save'),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              maxLines: 6,
              maxLength: 200,
              decoration: const InputDecoration(
                labelText: 'Bio',
                alignLabelWithHint: true,
              ),
            ),
            if (isLoading) const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: LinearProgressIndicator(minHeight: 2),
            ),
          ],
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


