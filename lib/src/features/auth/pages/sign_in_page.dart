import 'package:chattify/src/assets/asset_icons.dart';
import 'package:chattify/src/core/ui/widgets/button.dart';
import 'package:chattify/src/core/ui/widgets/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Welcome to '),
                  TextSpan(
                    text: 'Chattify',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              style: theme.textTheme.headlineSmall,
            ),
            const Gap(20),
            Button(
              icon: const SvgImage(
                AssetIcons.google,
                width: 32,
              ),
              appearance: ButtonAppearance.outlined,
              label: 'Continue with Google',
              onTap: () async {
                context.go('/messages');
              },
            ),
          ],
        ),
      ),
    );
  }
}
