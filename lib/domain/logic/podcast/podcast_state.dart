part of 'podcast_cubit.dart';

enum PodCastEnum { success, error, loading, none }

enum PodCastImg { success, error, loading, none }

enum PodCastAudio { success, error, loading, none }

enum PodLoadingCast { success, error, loading, none }

enum PodLoadingDelete { success, error, loading, none }

class PodcastState extends Equatable {
  late final PodLoadingDelete podLoadingDelete;
  late final PodLoadingCast podLoadingCast;
  late final List<PodcastModel> podcastList;
  late final PodCastImg isSuccessImage;
  late final PodCastAudio isSuccessAudio;
  late final PodCastEnum podCastEnum;
  PodcastState({
    PodLoadingDelete? podLoadingDelete,
    List<PodcastModel>? podcastList,
    PodLoadingCast? podLoadingCast,
    PodCastImg? isSuccessImage,
    PodCastAudio? isSuccessAudio,
    PodCastEnum? podCastEnum,
  }) {
    this.podLoadingDelete = podLoadingDelete ?? PodLoadingDelete.none;
    this.isSuccessImage = isSuccessImage ?? PodCastImg.none;
    this.isSuccessAudio = isSuccessAudio ?? PodCastAudio.none;
    this.podCastEnum = podCastEnum ?? PodCastEnum.none;
    this.podcastList = podcastList ?? <PodcastModel>[];
    this.podLoadingCast = podLoadingCast ?? PodLoadingCast.none;
  }

  PodcastState copyWith({
    PodCastImg? isSuccessImage,
    PodCastAudio? isSuccessAudio,
    PodCastEnum? podCastEnum,
    List<PodcastModel>? podcastList,
    PodLoadingCast? podLoadingCast,
    PodLoadingDelete? podLoadingDelete,
  }) {
    return PodcastState(
        podLoadingDelete: podLoadingDelete ?? this.podLoadingDelete,
        isSuccessImage: isSuccessImage ?? this.isSuccessImage,
        isSuccessAudio: isSuccessAudio ?? this.isSuccessAudio,
        podCastEnum: podCastEnum ?? this.podCastEnum,
        podcastList: podcastList ?? this.podcastList,
        podLoadingCast: podLoadingCast ?? this.podLoadingCast);
  }

  @override
  List<Object> get props => [
        isSuccessImage,
        isSuccessAudio,
        podCastEnum,
        podLoadingCast,
        podcastList,
        podLoadingDelete
      ];
}
