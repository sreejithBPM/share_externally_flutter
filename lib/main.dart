import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Share Example'),
        ),
        body: Center(
          child: ShareButton(),
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showShareDialog(context);
      },
      child: Text('Share'),
    );
  }

  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Share via:'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildShareOption(
                icon: Icons.facebook,
                label: 'Facebook',
                onTap: () {
                  _shareToFacebook();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16.0),
              _buildShareOption(
                icon: Icons.chat,
                label: 'WhatsApp',
                onTap: () {
                  _shareToWhatsApp();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 8.0),
          Text(label),
        ],
      ),
    );
  }

  void _shareToFacebook() async {
    try {
      await Share.share('Share content to Facebook',
          subject: 'Share to Facebook');
    } catch (e) {
      print(e);
    }
  }

  void _shareToWhatsApp() async {
    try {
      await Share.share('Share content to WhatsApp',
          subject: 'Share to WhatsApp', sharePositionOrigin: Rect.zero);
    } catch (e) {
      print(e);
    }
  }
}