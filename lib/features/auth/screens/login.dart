import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/features/auth/controllers/auth_controller.dart';
import 'package:flutter_boilerplate/features/auth/widgets/login_header.dart';
import 'package:flutter_boilerplate/features/auth/widgets/auth_actions.dart';
import '../../../data/models/user_model.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<UserModel?>>(authControllerProvider, (
      previous,
      next,
    ) {
      // When phải thực hiện cả 3, còn whenOrNull chỉ check vài cái cần thiết
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            context.go('/user-profile');
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Lỗi đăng nhập: $error')));
        },
      );
    });

    // Trạng thái loading
    if (authState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Nếu có lỗi
    if (authState.hasError) {
      return Scaffold(
        body: Center(
          child: Text(
            authState.error.toString(),
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Các hành động login
    final buttons = [
      {
        'icon': Icons.apple,
        'text': 'Tiếp tục bằng Apple',
        'color': Colors.black,
        'onPressed': () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Apple login chưa được hỗ trợ')),
          );
        },
      },
      {
        'icon': Icons.g_mobiledata,
        'text': 'Tiếp tục bằng Google',
        'color': Colors.red,
        'onPressed': () async {
          try {
            await ref.read(authControllerProvider.notifier).signInWithGoogle();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đăng nhập Google thành công!')),
            );
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Lỗi Google login: $e')));
          }
        },
      },
      {
        'icon': Icons.facebook,
        'text': 'Tiếp tục bằng Facebook',
        'color': Colors.blue,
        'onPressed': () async {
          try {
            await ref
                .read(authControllerProvider.notifier)
                .signInWithFacebook();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đăng nhập Facebook thành công!')),
            );
          } catch (e) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Lỗi Facebook login: $e')));
          }
        },
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg-image.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-0.6, 0.9),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(child: LoginHeader()),
              AuthActions(buttons: buttons),
            ],
          ),
        ),
      ),
    );
  }
}
