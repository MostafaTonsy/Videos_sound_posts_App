import 'package:flutter/material.dart';
import 'package:share_it/share_it.dart';
import 'package:videos_sounds_app/core/utils/custom_text_field.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/models/POST_MODEL.dart';

class POST_DETAILS_PAGE extends StatefulWidget {
  final controller;
  final textcontroller;
  final VoidCallback setstate;
  final POST_MODEL post;
  const POST_DETAILS_PAGE(
      {super.key,
      required this.setstate,
      required this.controller,
      required this.textcontroller,
      required this.post});

  @override
  State<POST_DETAILS_PAGE> createState() => _POST_DETAILS_PAGEState();
}

class _POST_DETAILS_PAGEState extends State<POST_DETAILS_PAGE> {
  TextEditingController comment_controller = TextEditingController();
  bool is_comment = false;

  @override
  void dispose() {
    comment_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size_config.screen_height! * 0.2,
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: size_config.screen_width!,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 204, 247, 48)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/write.jfif'),
                  ),
                ),
                Positioned(
                  top: -50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/user.png'),
                    radius: 30,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(widget.post.post_content)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () async {},
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.thumb_up_alt_sharp,
                              size: 20,
                              color: Color.fromARGB(255, 54, 57, 241),
                            ),
                          )),
                      GestureDetector(
                          onTap: () async {
                            setState(() {
                              is_comment = !is_comment;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.comment,
                              size: 20,
                              color: Color.fromARGB(255, 211, 214, 3),
                            ),
                          )),
                      GestureDetector(
                          onTap: () async {
                            ShareIt.text(content: '');
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.share,
                              size: 18,
                              color: Color.fromARGB(255, 124, 0, 0),
                            ),
                          )),
                      GestureDetector(
                          onTap: () async {
                            await widget.controller.DELETE_DATA(
                                post_id: widget.post.post_id, context: context);
                            widget.setstate();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: Color.fromARGB(255, 0, 4, 236),
                            ),
                          )),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          widget.post.post_time,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          (is_comment == true)
              ? Container(
                  height: size_config.screen_height! * 0.2,
                  width: size_config.screen_width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: CUSTOM_TEXT_FORM_FIELD(
                      VALIDATOR: null,
                      input_type: TextInputType.multiline,
                      label: '',
                      suffix_icon: IconButton(
                        onPressed: () {},
                        icon: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Text(
                                'حفظ التعليق',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                        ),
                      ),
                      maxlines: 4,
                      editingController: widget.textcontroller,
                      obscure_text: false,
                      on_changed: null),
                )
              : Container(
                  height: 1,
                )
        ],
      ),
    );
  }
}
