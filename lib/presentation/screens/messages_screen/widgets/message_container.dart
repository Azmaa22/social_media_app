import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.isMe,
    required this.messageText,
  }) : super(key: key);
  final String messageText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: isMe
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd,
          child: Container(
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
        ),
      ],
    );
  }
}
