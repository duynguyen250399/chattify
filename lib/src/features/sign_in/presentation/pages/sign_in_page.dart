import 'package:chattify/src/assets/asset_icons.dart';
import 'package:chattify/src/core/ui/widgets/button.dart';
import 'package:chattify/src/core/ui/widgets/svg_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final a = FirebaseAuth.instance.currentUser;
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
                await _signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
