import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

class MicrophonePermissionDialog extends StatelessWidget {
  final VoidCallback onAllow;
  final VoidCallback onCancel;

  const MicrophonePermissionDialog({
    Key? key,
    required this.onAllow,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 12,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Allow Micro Phone",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Allow Microphone to access your voice..",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onAllow,
              child: Text(
                "Allow",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.black54,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: onCancel,
              child: const Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
