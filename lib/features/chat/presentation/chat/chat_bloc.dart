import 'package:bloc/bloc.dart';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState().init());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<ChatState> init() async {
    return state.clone();
  }
}
