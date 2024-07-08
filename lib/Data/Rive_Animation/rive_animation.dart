import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveHappySad extends StatefulWidget {
  @override
  _RiveHappySadState createState() => _RiveHappySadState();
}

class _RiveHappySadState extends State<RiveHappySad> {
  Artboard? _artboard; // Make _artboard nullable
  StateMachineController? _stateMachineController;
  SMIInput<bool>? _isHappyInput;
  SMIInput<double>? _eyeMovementXInput;
  SMIInput<double>? _eyeMovementYInput;

  @override
  void initState() {
    super.initState();
    _initializeRive();
  }

  Future<void> _initializeRive() async {
    await RiveFile.initialize(); // Initialize the Rive runtime
    _loadRiveFile();
  }

  void _loadRiveFile() async {
    final data = await rootBundle.load('assets/Rive/sprout.riv');
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;

    final controller = StateMachineController.fromArtboard(
      artboard,
      'sad_happy_machine', // Replace with your actual state machine name
    );

    if (controller != null) {
      artboard.addController(controller);
      _isHappyInput = controller.findInput<bool>('IsHappy');
      _eyeMovementXInput = controller.findInput<double>('eye_movementX');
      _eyeMovementYInput = controller.findInput<double>('eye_movementY');
    }

    setState(() => _artboard = artboard);
  }

  void _toggleIsHappy() {
    if (_isHappyInput != null) {
      _isHappyInput!.value = !_isHappyInput!.value;
    }
  }

  void _updateEyeMovement(Offset position) {
    if (_eyeMovementXInput != null && _eyeMovementYInput != null) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final localPosition = renderBox.globalToLocal(position);
      final normalizedX = localPosition.dx / renderBox.size.width;
      final normalizedY = localPosition.dy / renderBox.size.height;

      setState(() {
        _eyeMovementXInput!.value = normalizedX;
        _eyeMovementYInput!.value = normalizedY;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Listener(
          onPointerMove: (PointerEvent details) {
            _updateEyeMovement(details.position);
          },
          child: _artboard == null
              ? CircularProgressIndicator() // Show a progress indicator while loading
              : Rive(
                  artboard: _artboard!,
                  fit: BoxFit.contain,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleIsHappy,
        child: Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }
}
