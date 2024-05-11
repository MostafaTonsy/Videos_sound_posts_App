import 'package:flutter/material.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';

class bottom_appbar_item extends StatelessWidget {
  final VoidCallback on_pressed;
  final IconData iconData;
  final String label;
  final bool is_active;
  final Color color;
  const bottom_appbar_item(
      {super.key,
      required this.on_pressed,
      required this.label,
      required this.iconData,
      required this.is_active,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: size_config.screen_width! * 0.179,
      child: TextButton(
        onPressed: on_pressed,
        child: Center(
          child: Column(
            children: [
              Icon(
                iconData,
                color: is_active ? Colors.yellow : Colors.white,
              ),
              Text(
                label,
                style: TextStyle(
                    color: is_active ? Colors.yellow : Colors.white,
                    fontSize: 9),
              )
            ],
          ),
        ),
      ),
    );
  }
}
