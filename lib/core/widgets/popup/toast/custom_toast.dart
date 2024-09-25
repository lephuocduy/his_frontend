import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';
import 'package:his_frontend/core/utils/spaces.dart';

import 'toast_enum.dart';

class CustomToast extends StatefulWidget {
  final String message;
  final ToastEnum type;
  final Duration duration;

  const CustomToast({
    super.key,
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 3),
  });

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast>
    with TickerProviderStateMixin {
  // FIELD
  late AnimationController _controller;
  bool _isHovered = false;
  late Duration _remainingDuration;

  //METHOD
  void _pauseTimer() {
    if (!_isHovered) {
      setState(() {
        _isHovered = true;
      });
      _controller.stop();
      _remainingDuration = _controller.duration! * _controller.value;
    }
  }

  void _resumeTimer() {
    if (_isHovered) {
      setState(() {
        _isHovered = false;
      });
      _controller.duration = _remainingDuration;
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pop();
        }
      });

    _remainingDuration = widget.duration;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width * 0.4;

    return MouseRegion(
      onEnter: (_) => _pauseTimer(),
      onExit: (_) => _resumeTimer(),
      child: Material(
        color: AppColor.transparent,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: widget.type.backgroundColor,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widget.type.leading,
                                  spaceW16,
                                  Expanded(
                                    child: Text(
                                      widget.message,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _remainingDuration = Duration.zero;
                                      if (_isHovered) {
                                        _isHovered = false;
                                        _controller.duration =
                                            _remainingDuration;
                                        _controller.forward();
                                      }
                                    });
                                  },
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.close,
                                      size: 10,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              value: 1 - _controller.value,
                              backgroundColor: Colors.transparent,
                              valueColor:
                                  AlwaysStoppedAnimation(widget.type.timeColor),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void showCustomToast({
  required BuildContext context,
  required String message,
  required ToastEnum type,
  Alignment? alignment,
}) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) => Align(
      alignment: alignment ?? Alignment.bottomRight,
      child: CustomToast(
        message: message,
        type: type,
      ),
    ),
    context: context,
  );
}
