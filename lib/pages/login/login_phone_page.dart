import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../repositories/auth_repository.dart';
import '../../utils/logger.dart';

class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({Key? key}) : super(key: key);
  @override
  createState() => _LoginPhonePage();
}

class _LoginPhonePage extends State<LoginPhonePage> with AutoRouteAware {
  final GlobalKey<FormState> enterFormKey = GlobalKey<FormState>();

  PhoneNumber _number = PhoneNumber(isoCode: 'SG');
  String? _verificationId;

  TextEditingController? textEditingController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  Future<UserCredential?> signInWithPhoneNumber(WidgetRef ref) async {
    var auth = ref.read(firebaseAuthProvider);
    final verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      print(phoneAuthCredential.providerId);
      await auth.signInWithPhoneNumber(phoneAuthCredential.providerId);
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(authException);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authException.message!),
          duration: Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Copy',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: authException.message));
            },
          ),
        ),
      );
    };
    PhoneCodeSent codeSent = (String verificationId, forceResendingToken) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      setState(() {
        _verificationId = verificationId;
      });
    };

    var validated = enterFormKey.currentState!.validate();
    if (validated) {
      enterFormKey.currentState?.save();
      var phoneNumber = _number.phoneNumber;
      if (phoneNumber != null) {
        if (kIsWeb) {
          final result = await auth.signInWithPhoneNumber(phoneNumber);
          setState(() {
            _verificationId = result.verificationId;
          });
        } else {
          await auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(seconds: 5),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          );
        }
      }
    }
  }

  signInWithSmsCode(WidgetRef ref) {
    var verificationId = _verificationId;
    if (verificationId != null) {
      print(textEditingController!.text);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: textEditingController!.text,
      );

      ref
          .read(firebaseAuthProvider)
          .signInWithCredential(credential)
          .catchError((e) {
        logger.e(e);
        errorController!.add(ErrorAnimationType.shake);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message!),
            duration: Duration(seconds: 10),
            action: SnackBarAction(
              label: 'Copy',
              onPressed: () {
                Clipboard.setData(ClipboardData(text: e.message));
              },
            ),
          ),
        );
      });
    }
  }

  Widget _buildEnterPhoneNumber() {
    return Consumer(builder: ((context, ref, child) {
      return Form(
        key: enterFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your phone number',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 18.0),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print("onInputChanged ${number.phoneNumber}");
              },
              validator: (asd) {
                print(asd);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
                leadingPadding: 10,
                trailingSpace: false,
                setSelectorButtonAsPrefixIcon: true,
                useEmoji: true,
              ),
              ignoreBlank: false,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: _number,
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              onSaved: (PhoneNumber number) {
                print("onSaved ${number.phoneNumber}");
                setState(() {
                  _number = number;
                });
              },
            ),
            const SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () => signInWithPhoneNumber(ref),
              child: Text('Verify'),
            ),
            const SizedBox(height: 18.0),
            Text(
              "By tapping Verify, an SMS may be sent. Message & data rates may apply.",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
    }));
  }

  Widget _buildVerifyPhoneNumber() {
    return Consumer(
      builder: ((context, ref, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify your phone number',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 18.0),
            RichText(
              text: TextSpan(
                  text: "Enter the 6-digit code we sent to ",
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(
                      text: "${_number.phoneNumber}",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color(0xff4285f4),
                          ),
                    ),
                  ]),
            ),
            const SizedBox(height: 18.0),
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.transparent,
                activeColor: Theme.of(context).primaryColor,
                inactiveFillColor: Colors.transparent,
                inactiveColor: Colors.grey,
                selectedFillColor: Colors.transparent,
                selectedColor: Colors.grey,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              onChanged: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 18.0),
            ElevatedButton(
              onPressed: () => signInWithSmsCode(ref),
              child: Text('Continue'),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var linkStyle = Theme.of(context).textTheme.caption?.copyWith(
          color: Color(0xff4285f4),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in with phone'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  _verificationId != null
                      ? _buildVerifyPhoneNumber()
                      : _buildEnterPhoneNumber(),
                  const SizedBox(height: 18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          const linkUrl =
                              "https://esseplore.com/general-terms-of-use";
                          canLaunch(linkUrl).then((value) => launch(linkUrl));
                        },
                        child: Text(
                          'Terms of Service',
                          style: linkStyle,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      GestureDetector(
                        onTap: () {
                          const linkUrl =
                              "https://esseplore.com/privacy-policy";
                          canLaunch(linkUrl).then((value) => launch(linkUrl));
                        },
                        child: Text(
                          'Privacy Policy',
                          style: linkStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
