import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class DonationPag extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPag>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  String donorName = '';
  String donationAmount = '';

  @override
  void initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_scaleAnimationController);
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  void _playTickAnimation() {
    _scaleAnimationController.reset();
    _scaleAnimationController.forward();
    Vibrate.feedback(FeedbackType.success);
  }

  void _showConfirmationDialog() async {
    await showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Confirm Donation',
          contentText: 'Name: $donorName\nDonation Amount: \$ $donationAmount',
          onPositiveClick: () {
            Navigator.of(context).pop();
            _playTickAnimation();
          },
          positiveText: 'Confirm',
          negativeText: 'Cancel',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Thank you for choosing to donate!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Your donation will be used to support our organization and its activities. Please provide your details below:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 32.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  donorName = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Donor Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  donationAmount = value;
                });
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'Donation Amount',
                prefixText: '\$ ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: const EdgeInsets.all(16.0),
              ),
              onPressed: () {
                _showConfirmationDialog();
              },
              child: const Text(
                'Submit Donation',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 32.0),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const Icon(
                Icons.check_circle,
                size: 48.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
