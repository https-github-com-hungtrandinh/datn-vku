import 'package:clean_architecture/data/models/token.dart';
import 'package:clean_architecture/data/models/user.dart';

class Account{
  final User user;
  final Tokens tokens;

  Account({required this.user,required this.tokens});
  factory Account.fromJson(Map<String,dynamic> json){
    return Account(user: User.fromJson(json['user']), tokens: Tokens.fromJson(json['tokens']));
  }

}