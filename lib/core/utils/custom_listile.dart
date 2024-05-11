import 'package:flutter/material.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';

class custom_listile extends StatelessWidget {
  final String title;
  final Widget trailing_widget;
  final Widget? leading_widget;
  final VoidCallback on_pressed;
  const custom_listile({
    super.key,
    required this.title,
    required this.trailing_widget,
    required this.leading_widget,
    required this.on_pressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 219, 60),
        borderRadius: BorderRadius.circular(8),
      ),
      height: size_config.screen_height! * 0.08,
      child: ListTile(
        onTap: on_pressed,
        title: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.start,
                title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 14, 0, 136), fontSize: 12),
              ),
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        trailing: trailing_widget,
        leading: leading_widget,
      ),
    );
  }
}
