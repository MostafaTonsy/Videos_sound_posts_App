import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/utils/loading_page.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';

class handling_request_view extends StatelessWidget {
  final StatusRequest status_request;
  final Widget widget;
  const handling_request_view(
      {super.key, required this.status_request, required this.widget});

  @override
  Widget build(BuildContext context) {
    return (status_request == StatusRequest.loading)
        ? const LOADING_Container()
        : (status_request == StatusRequest.internet_failure)
            ? Container(
                height: size_config.screen_height! * 0.6,
                width: size_config.screen_width! * 0.5,
                color: Colors.white,
                child: Center(
                  child: Column(children: [
                    LottieBuilder.asset(
                      'assets/lottie_animations/internet_error.json',
                      reverse: true,
                      animate: true,
                    ),
                    SizedBox(
                      width: size_config.screen_width! * 0.6,
                      child: const Center(
                        child: Text(
                          'Internet Connection Error',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      ),
                    )
                  ]),
                ),
              )
            : (status_request == StatusRequest.server_failure)
                ? Center(
                    child: Container(
                      height: size_config.screen_height! * 0.75,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      margin: const EdgeInsets.only(top: 35),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(150)),
                      child: LottieBuilder.asset(
                          'assets/lottie_animations/no_data.json'),
                    ),
                  )
                : widget;
  }
}
