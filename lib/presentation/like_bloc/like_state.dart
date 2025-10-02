import 'package:equatable/equatable.dart';

class LikeState extends Equatable {
  final List<String>? likedIds;

  const LikeState({required this.likedIds});

  @override
  List<Object?> get props => [likedIds];

  LikeState copyWith({List<String>? likedIds }) => LikeState(likedIds: likedIds ?? this.likedIds);
}