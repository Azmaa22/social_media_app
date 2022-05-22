import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app/business_logic/cubits/user_cubit/user_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/presentation/screens/chats_screen/widgets/user_container.dart';
import 'package:social_media_app/presentation/screens/messages_screen/messages_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: BlocBuilder<UserCubit, UserStates>(builder: (context, state) {
        UserCubit myCubit = UserCubit.get(context);
        if (state is GetAllUserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.kPrimaryColor,
            ),
          );
        }
        if (state is GetAllUserErrorState) {
          return const Center(
            child: Text('No Users Found -_- '),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => MessagesScreen(
                      friend: myCubit.users[index],
                    ),
                  ),
                );
              },
              child: UserContainer(
                userImage: myCubit.users[index].image!,
                userName: myCubit.users[index].username,
                lastMessage: 'lastMessage',
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: ColorManager.kLightPrimaryColor,
              ),
            );
          },
          itemCount: myCubit.users.length,
        );
      }),
    );
  }
}
