// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/services.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraVideoCallWidget extends StatefulWidget {
  const AgoraVideoCallWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<AgoraVideoCallWidget> createState() => _AgoraVideoCallWidgetState();
}

class _AgoraVideoCallWidgetState extends State<AgoraVideoCallWidget> {
  AgoraClient? _client;
  bool _loading = true;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initAgoraClient();
  }

  Future<void> _initAgoraClient() async {
    try {
      // Wait briefly to ensure resources are ready
      await Future.delayed(const Duration(milliseconds: 500));

      // Check permissions first
      final permissionsGranted = await _checkPermissions();
      if (!permissionsGranted) {
        throw Exception('Camera and microphone permissions are required');
      }

      final client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "ef765920bdaf49acb817117f3dbf2df1",
          channelName: "healinguper",
          tempToken: '007eJxTYEh8ujpl2WLH/8HSV3q8N5jcOnp1+sUVEtVH7O9GmTjNVXiowJCaZm5mamlkkJSSmGZimZicZGFobmhonmackpRmlJJm2G9Tnt4QyMgw7cEbRkYGCATxuRkyUhNzMvPSSwtSixgYAAOGJSc=',
          uid: 0, // Set to 0 for auto-assignment
        ),
        enabledPermission: [
          Permission.camera,
          Permission.microphone,
        ],
      );

      // Configure client options
      await client.initialize();

      if (mounted) {
        setState(() {
          _client = client;
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('Error initializing Agora: $e');
      if (mounted) {
        setState(() {
          _loading = false;
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  Future<bool> _checkPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    
    return statuses.values.every((status) => status.isGranted);
  }

  @override
  void dispose() {
    _client?.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_hasError) {
      return Center(
        child: Text(
          _errorMessage ?? 'An error occurred',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (_client == null) {
      return const Center(
        child: Text('Failed to initialize video call'),
      );
    }

    return Stack(
      children: [
        AgoraVideoViewer(
          client: _client!,
          layoutType: Layout.grid,
          enableHostControls: true,
          showNumberOfUsers: true,
          disabledVideoWidget: const Center(
            child: Icon(Icons.videocam_off, size: 40),
          ),
        ),
        AgoraVideoButtons(
          client: _client!,
          enabledButtons: const [
            BuiltInButtons.toggleCamera,
            BuiltInButtons.switchCamera,
            BuiltInButtons.toggleMic,
            BuiltInButtons.callEnd,
          ],
        ),
      ],
    );
  }
}
