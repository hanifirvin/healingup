import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'calling_pages_model.dart';
export 'calling_pages_model.dart';
import '/custom_code/widgets/agora_video_call.dart';

class CallingPagesWidget extends StatefulWidget {
  const CallingPagesWidget({super.key});

  @override
  State<CallingPagesWidget> createState() => _CallingPagesWidgetState();
}

class _CallingPagesWidgetState extends State<CallingPagesWidget> with WidgetsBindingObserver {
  late CallingPagesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _hasPermissions = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _model = createModel(context, () => CallingPagesModel());
    _initializeCall();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermissions();
    }
  }

  Future<void> _initializeCall() async {
    try {
      await _checkPermissions();
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error initializing call: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
        context.pushNamed('error_page');
      }
    }
  }

  Future<void> _checkPermissions() async {
    try {
      final statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();
      
      final allGranted = statuses.values.every((status) => status.isGranted);
      
      if (mounted) {
        setState(() {
          _hasPermissions = allGranted;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error checking permissions: $e');
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_hasPermissions) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Camera and microphone permissions are required'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _initializeCall(),
                child: const Text('Grant Permissions'),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: AgoraVideoCallWidget(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
