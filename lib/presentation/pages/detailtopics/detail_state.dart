import 'package:equatable/equatable.dart';

class DetailState extends Equatable {
  final bool onClick;
  final bool showDownload;

  const DetailState({required this.onClick, required this.showDownload});

  factory DetailState.initial() {
    return const DetailState(onClick: true, showDownload: true);
  }

  DetailState copyWith({bool? onClick, bool? showDownload}) {
    return DetailState(
        onClick: onClick ?? this.onClick,
        showDownload: showDownload ?? this.showDownload);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [onClick, showDownload];
}
