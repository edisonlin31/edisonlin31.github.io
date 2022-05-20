import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/app_text_styles.dart';
import '../../widgets/app_text_form_field.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Address')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Contact',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const AppTextFormField(
                  hintText: 'Full Name',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                const AppTextFormField(
                  hintText: 'Phone Number',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                const AppTextFormField(
                  hintText: 'Email',
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Address',
                  style: AppTextStyles.medium(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const AppTextFormField(
                  hintText: 'Line 1',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                const AppTextFormField(
                  hintText: 'Line 2 (e.g: apartment / unit no)',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                const AppTextFormField(
                  hintText: 'Postal Code',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: AppTextStyles.bold(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
