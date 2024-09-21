import 'package:flutter/material.dart';
import 'package:his_frontend/core/constants/app_color.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel(this._label, {super.key, this.style});
  final String _label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: Text(
              _label,
              style: style,
            ),
          ),
          const WidgetSpan(
            child: Text(
              ' *',
              style: TextStyle(
                color: AppColor.c_D84226,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
