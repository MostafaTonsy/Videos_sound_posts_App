import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/home_page/home_page.dart';
import 'package:videos_sounds_app/FEATURES/posts/CONTROLLER/posts_controller.dart';
import 'package:videos_sounds_app/FEATURES/posts/VIEWS/POST_DETAILS_PAGE.dart';
import 'package:videos_sounds_app/core/utils/CUSTOM_BUTTON.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/handling_DAta_view.dart/handlind_data_view.dart';
import 'package:videos_sounds_app/models/POST_MODEL.dart';

class POSTS_PAGE extends StatefulWidget {
  const POSTS_PAGE({super.key});

  @override
  State<POSTS_PAGE> createState() => _AUDIOS_PAGEState();
}

class _AUDIOS_PAGEState extends State<POSTS_PAGE> {
  TextEditingController post_content_controller = TextEditingController();
  TextEditingController comment_controller = TextEditingController();

  POSTS_CONTROLLER posts_controller = Get.put(POSTS_CONTROLLER());

  var backgroundcolor = Color.fromARGB(255, 24, 23, 23);

  ScrollController scrollController = ScrollController();

  var posts_stream_controller = StreamController<List<POST_MODEL>>.broadcast();

  Timer? timer;

  get_POSTS_data() async {
    List<POST_MODEL> POSTS_LIST = await posts_controller.view_data();
    posts_stream_controller.add(POSTS_LIST);
  }

  @override
  void initState() {
    get_POSTS_data();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      return get_POSTS_data();
    });

    // scrollController.addListener(() {
    //   if (scrollController.offset == 200) {
    //     print(scrollController.offset);
    //     setState(() {
    //       backgroundcolor = Colors.blue;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    comment_controller.dispose();
    post_content_controller.dispose();
    scrollController.dispose();
    if (timer!.isActive) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(POSTS_CONTROLLER());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: AnimatedContainer(
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 3),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    'الخواطر',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  TextField(
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 227, 244, 247),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    keyboardType: TextInputType.multiline,
                    controller: post_content_controller,
                    maxLines: 5,
                    enableSuggestions: false,
                  ),
                  Positioned(
                    bottom: -10,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                      height: size_config.screen_height! * 0.06,
                      child: CUSTOM_BUTTON(
                        ON_PRESSED: () async {
                          await posts_controller.ADD_DATA(
                              post_content: post_content_controller.text,
                              context: context);
                          post_content_controller.clear();
                          //   setState(() {});
                        },
                        Background_color: Colors.blue,
                        foreground_color:
                            const Color.fromARGB(255, 255, 255, 255),
                        text: 'اضافة ',
                      ),
                    ),
                  ),
                  Positioned(
                      right: 20,
                      left: 20,
                      top: -80,
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset('assets/user_s.png'),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.do_not_disturb_on_sharp,
                    color: Color.fromARGB(255, 180, 162, 2),
                    size: 15,
                  ),
                  Icon(
                    Icons.do_not_disturb_on_sharp,
                    color: Colors.blue,
                    size: 15,
                  ),
                  Icon(
                    Icons.do_not_disturb_on_sharp,
                    color: Color.fromARGB(255, 180, 162, 2),
                    size: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              StreamBuilder<List<POST_MODEL>>(
                stream: posts_stream_controller.stream,
                builder: (context, snapshot) => handling_request_view(
                  status_request: posts_controller.statusRequest,
                  widget: (posts_controller.POSTS_LIST.isEmpty)
                      ? Image.asset('assets/write.jfif')
                      : Container(
                          height: size_config.screen_height! * 0.9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 66, 43, 0),
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.all(2),
                          width: size_config.screen_width!,
                          child: ListView.builder(
                              itemCount: posts_controller.POSTS_LIST.length,
                              itemBuilder: (context, index) {
                                final postsList = posts_controller.POSTS_LIST;
                                final post = postsList[index];

                                return POST_DETAILS_PAGE(
                                  setstate: () {
                                    setState(() {});
                                  },
                                  textcontroller: comment_controller,
                                  post: post,
                                  controller: posts_controller,
                                );
                              }),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: size_config.screen_height! * 0.08,
        width: size_config.screen_width! * 0.15,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 179, 192),
            borderRadius: BorderRadius.circular(15)),
        child: GestureDetector(
            onTap: () async {
              Get.to(() => const HOME_PAGE());
            },
            child: const Icon(
              color: Color.fromARGB(255, 251, 253, 98),
              Icons.home,
              size: 25,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
