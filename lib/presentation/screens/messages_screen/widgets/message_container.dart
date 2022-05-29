import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.isMe,
    required this.messageText,
    required this.image,
  }) : super(key: key);
  final String messageText;
  final bool isMe;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              isMe
                  ? CircleAvatar(
                      radius: 15.0,
                      backgroundImage: MemoryImage(
                        base64Decode(
                          image!,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                child: Text(messageText),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                margin: const EdgeInsets.all(
                  5.0,
                ),
                decoration: BoxDecoration(
                  color: isMe
                      ? ColorManager.kLightPrimaryColor.withOpacity(
                          0.5,
                        )
                      : ColorManager.kLightPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: isMe
                        ? const Radius.circular(
                            15.0,
                          )
                        : Radius.zero,
                    bottomRight: isMe
                        ? const Radius.circular(
                            15.0,
                          )
                        : Radius.zero,
                    topRight: isMe
                        ? Radius.zero
                        : const Radius.circular(
                            15.0,
                          ),
                    bottomLeft: isMe
                        ? Radius.zero
                        : const Radius.circular(
                            15.0,
                          ),
                  ),
                ),
              ),
              !isMe
                  ? CircleAvatar(
                      radius: 15.0,
                      backgroundImage: MemoryImage(
                        base64Decode(
                          image!,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
