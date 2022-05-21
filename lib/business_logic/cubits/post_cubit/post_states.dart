abstract class PostStates {}

class PostInitState extends PostStates {}

class CreatePostLoadingState extends PostStates {}

class CreatePostSuccessState extends PostStates {
  final String id;

  CreatePostSuccessState(this.id) {
    print('create post id $id');
  }
}

class CreatePostErrorState extends PostStates {
  final String error;

  CreatePostErrorState(this.error) {
    print('create post error $error');
  }
}

class PickedPostImageSuccessState extends PostStates {}

class PickedPostImageErrorState extends PostStates {}

class RemovePickedPostImageState extends PostStates {}
