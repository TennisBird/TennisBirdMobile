import 'dart:developer';

import 'package:core_ui/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  StateMachineController? _controller;
  SMITrigger? _aTrigger;
  SMITrigger? _bTrigger;
  SMITrigger? _cTrigger;
  SMITrigger? _dTrigger;
  SMITrigger? _centerTrigger;
  SMITrigger? _centerCloseTrigger;

  SMIBool? _aHover;
  SMIBool? _bHover;
  SMIBool? _cHover;
  SMIBool? _dHover;
  bool _isExpanded = false;
  void _toggleButtons() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _onRiveInit(Artboard artboard) {
    _controller =
        StateMachineController.fromArtboard(artboard, 'Toolbar State Machine');
    artboard.addController(_controller!);
    for (var input in _controller!.inputs) {
      log('Input: ${input.name}, Type: ${input.runtimeType}');
    }

    _centerTrigger = _controller?.getTriggerInput('Open');
    _centerCloseTrigger = _controller?.getTriggerInput('Close');
    _aTrigger = _controller?.getTriggerInput('A-Click');
    _bTrigger = _controller?.getTriggerInput('B-Click');
    _cTrigger = _controller?.getTriggerInput('C-Click');
    _dTrigger = _controller?.getTriggerInput('D-Click');

    if (_controller != null) {
      _aHover = _controller?.getBoolInput('A-Hover');
      _bHover = _controller?.getBoolInput('B-Hover');
      _cHover = _controller?.getBoolInput('C-Hover');
      _dHover = _controller?.getBoolInput('D-Hover');
      if (_aHover == null) {
        log('Error: A-Hover input not found!');
      } else {
        log('A-Hover input initialized successfully.');
      }
      _aHover?.value = false;
      _bHover?.value = false;
      _cHover?.value = false;
      _dHover?.value = false;
    }
  }

  // void _simulateButtonPress(String buttonName) {
  //   switch (buttonName) {
  //     case 'A-Click':
  //       _aTrigger?.fire();
  //       log('Button pressed: A');
  //       break;
  //     case 'B-Click':
  //       _bTrigger?.fire();
  //       log('Button pressed: B');
  //       break;
  //     case 'C-Click':
  //       _cTrigger?.fire();
  //       log('Button pressed: C');
  //       break;
  //     case 'D-Click':
  //       _dTrigger?.fire();
  //       log('Button pressed: D');
  //       break;
  //     case 'Home Button - Hover':
  //       _centerTrigger?.fire();
  //       log('Button pressed: Home');
  //       break;
  //     default:
  //       log('Unknown button pressed');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 90,
      color: Colors.transparent,
      child: Stack(
        children: [
          RiveAnimation.asset(
            'packages/core_ui/assets/rive/appbar.riv',
            stateMachines: const ['Toolbar State Machine'],
            fit: BoxFit.cover,
            onInit: _onRiveInit,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_isExpanded) ...[
                const SizedBox(
                  height: Dimensions.size_70,
                  width: Dimensions.size_20,
                ),
                GestureDetector(
                  onTap: () {
                    _aHover?.value = true;
                    _aTrigger?.fire();
                    log('Button pressed A');
                    if (_aHover?.value != null) {
                      log(_aHover?.value.toString() ?? 'Null');
                    }

                    _aHover?.value = false;
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.size_70,
                  width: Dimensions.size_10,
                ),
                GestureDetector(
                  onTap: () {
                    _bHover?.value = true;
                    _bTrigger?.fire();
                    log('Button pressed B');
                    if (_bHover?.value != null) {
                      log(_bHover?.value.toString() ?? 'Null');
                    }

                    _bHover?.value = false;
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.transparent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _centerCloseTrigger?.fire();
                    log('Button pressed close');
                    _toggleButtons();
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    color: Colors.transparent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _cHover?.value = true;
                    _cTrigger?.fire();
                    log('Button pressed C');
                    if (_cHover?.value != null) {
                      log(_cHover?.value.toString() ?? 'Null');
                    }

                    _cHover?.value = false;
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.size_70,
                  width: Dimensions.size_10,
                ),
                GestureDetector(
                  onTap: () {
                    _dHover?.value = true;
                    _dTrigger?.fire();
                    log('Button pressed D');
                    if (_dHover?.value != null) {
                      log(_dHover?.value.toString() ?? 'Null');
                    }
                    _dHover?.value = false;
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    color: Colors.transparent,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.size_70,
                  width: 22,
                ),
              ] else ...[
                GestureDetector(
                  onTap: () {
                    _centerTrigger?.fire();
                    log('Button pressed open');
                    _toggleButtons();
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    color: Colors.transparent,
                  ),
                ),
              ]
            ],
          )
        ],
      ),
    );
  }
}
