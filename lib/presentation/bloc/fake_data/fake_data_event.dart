import 'package:equatable/equatable.dart';

abstract class FakeDataEvent extends Equatable{}
class CreateDataFake extends FakeDataEvent{
  @override
  List<Object?> get props => [];

}