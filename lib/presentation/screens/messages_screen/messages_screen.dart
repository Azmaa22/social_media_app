import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/message_cubit/message_cubit.dart';
import 'package:social_media_app/business_logic/cubits/message_cubit/message_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/data/models/message_model.dart';
import 'package:social_media_app/data/models/user_model.dart';
import 'package:social_media_app/helpers/shared_constants/shared_constants.dart';
import 'package:social_media_app/presentation/screens/messages_screen/widgets/message_container.dart';
import 'package:intl/intl.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({
    Key? key,
    required this.friend,
  }) : super(key: key);
  static const String id = 'MessagesScreen';

  final UserModel friend;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: MemoryImage(
                  base64Decode(
                    friend.image!,
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(friend.username),
            ],
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                context,
              );
            },
            child: const Icon(
              IconBroken.Arrow___Left_2,
              color: ColorManager.kOffWhiteColor,
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            MessageCubit.get(context).getMessages(
              receiverId: friend.userId!,
            );
            return BlocBuilder<MessageCubit, MessageStates>(
              builder: (context, state) {
                MessageCubit myCubit = MessageCubit.get(context);
                if (state is SendMessageErrorState) {
                  return const Center(
                    child: Text('Something is error while sending message'),
                  );
                }
                if (state is GetMessageSuccessState ||
                    state is SendMessageSuccessState) {
                  return Column(children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: myCubit.messages.length,
                          itemBuilder: (context, index) {
                            MessageModel message = myCubit.messages[index];
                            bool isMe = message.senderId == SharedConstants.uId;
                            return MessageContainer(
                              isMe: isMe,
                              messageText: message.messageText!,
                            );
                          }),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              style: const TextStyle(
                                color: ColorManager.kBlackColor,
                              ),
                              controller: _messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                hintText: 'write your message here....',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('message: ${_messageController.text}');
                              myCubit.sendNewMessage(
                                receiverId: friend.userId!,
                                message: _messageController.text,
                                dateTime: DateTime.now().toLocal().toString(),
                              );
                              _messageController.clear();
                            },
                            child: const CircleAvatar(
                              radius: 20.0,
                              backgroundColor: ColorManager.kPrimaryColor,
                              child: Icon(
                                IconBroken.Send,
                                color: ColorManager.kOffWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 60.0,
                      padding: const EdgeInsets.all(
                        5.0,
                      ),
                      margin: const EdgeInsets.all(
                        5.0,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.kSecondaryColor.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ]);
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.kPrimaryColor,
                  ),
                );
              },
            );
          },
        ));
  }
}
