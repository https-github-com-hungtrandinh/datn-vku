
import 'package:clean_architecture/data/models/firebase/user.dart';

import 'match.dart';

class ChatUser{
  final MatchUser match;
  final UserModel user;

  ChatUser({required this.match, required this.user});

}