import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/auth.dart';
import '../../gen/assets.gen.dart';
import '../../helpers/string.dart';
import '../../repositories/auth_repository.dart';
import '../../router/router.gr.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/logger.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  Future<UserCredential?> signInWithCredential({
    required AuthCredential credential,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    try {
      return await ref
          .read(firebaseAuthProvider)
          .signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Login failed"),
            content: Text(e.message ?? ""),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return null;
  }

  Future<UserCredential?> signInWithGoogle(
    WidgetRef ref,
    BuildContext context,
  ) async {
    print('asdad');
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return signInWithCredential(
        credential: credential,
        ref: ref,
        context: context,
      );
    }
  }

  Future<UserCredential?> signInWithFacebook(
    WidgetRef ref,
    BuildContext context,
  ) async {
    // final LoginResult result = await FacebookAuth.instance.login();
    // if (result.status == LoginStatus.success) {
    //   final AccessToken accessToken = result.accessToken!;
    //   final credential = FacebookAuthProvider.credential(accessToken.token);
    //   return signInWithCredential(
    //     credential: credential,
    //     ref: ref,
    //     context: context,
    //   );
    // }
  }

  Future<UserCredential?> signInWithApple(
    WidgetRef ref,
    BuildContext context,
  ) async {
    // final rawNonce = StringHelper.generateNonce();
    // final nonce = StringHelper.sha256ofString(rawNonce);
    // try {
    //   final appleIDCredential = await SignInWithApple.getAppleIDCredential(
    //     scopes: [
    //       AppleIDAuthorizationScopes.email,
    //       AppleIDAuthorizationScopes.fullName,
    //     ],
    //     nonce: nonce,
    //   );
    //   if (appleIDCredential.identityToken != null) {
    //     final credential = OAuthProvider("apple.com").credential(
    //       idToken: appleIDCredential.identityToken,
    //       rawNonce: rawNonce,
    //     );
    //     return signInWithCredential(
    //       credential: credential,
    //       ref: ref,
    //       context: context,
    //     );
    //   }
    // } on SignInWithAppleAuthorizationException catch (e) {
    //   logger.e(e);
    // }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var linkStyle = Theme.of(context).textTheme.caption?.copyWith(
          color: Color(0xff4285f4),
        );
    return ProviderListener(
      onChange: ((context, previous, state) {
        if (state == AuthState.authenticated) {
          var router = AutoRouter.of(context);
          router.pushAndPopUntil(DashboardRoute(), predicate: (_) => false);
        }
      }),
      provider: authControllerProvider,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const Spacer(),
              Expanded(
                child: Center(
                  child: Text(
                    'Logo',
                    style: AppTextStyles.bold(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: kIsWeb ? false : Platform.isIOS,
                child: ElevatedButton.icon(
                  onPressed: () => signInWithApple(ref, context),
                  icon: SvgPicture.asset(
                    Assets.images.apple,
                    height: 20,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Sign in with Apple",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              ElevatedButton.icon(
                onPressed: () => signInWithGoogle(ref, context),
                icon: SvgPicture.asset(Assets.images.google, height: 20),
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
              const SizedBox(height: 6.0),
              ElevatedButton.icon(
                onPressed: () => signInWithFacebook(ref, context),
                icon: const Icon(
                  Icons.facebook,
                ),
                label: const Text(
                  "Sign in with Facebook",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3b5998),
                ),
              ),
              const SizedBox(height: 6.0),
              ElevatedButton.icon(
                onPressed: () {
                  context.pushRoute(const LoginPhoneRoute());
                },
                icon: const Icon(
                  Icons.phone,
                ),
                label: const Text(
                  "Sign in with phone",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff02bd7e),
                ),
              ),
              const SizedBox(height: 12.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.white,
                      ),
                  children: <TextSpan>[
                    const TextSpan(
                      text:
                          'By continuing, you are indicating that you accept our\n',
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          const linkUrl =
                              "https://esseplore.com/general-terms-of-use";
                          canLaunch(linkUrl).then((value) => launch(linkUrl));
                        },
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          const linkUrl =
                              "https://esseplore.com/privacy-policy";
                          canLaunch(linkUrl).then((value) => launch(linkUrl));
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
