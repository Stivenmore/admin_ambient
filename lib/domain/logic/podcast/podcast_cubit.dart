import 'dart:core';

import 'package:admin_ambient/data/datasource/podcast_datasource.dart';
import 'package:admin_ambient/domain/models/podcast_model.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'podcast_state.dart';

class PodcastCubit extends Cubit<PodcastState> {
  final PodCastDataSource podCastDataSource;
  PodcastCubit(this.podCastDataSource) : super(PodcastState());

  late String img;
  late String audio;

  Future getImageGallery() async {
    emit(state.copyWith(isSuccessImage: PodCastImg.loading));
    try {
      final FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
      );
      if (result != null && result.files.single.bytes != null) {
        String file = result.files.single.name;
        Uint8List fileBytes = result.files.single.bytes!;
        img =
            await podCastDataSource.setImage(fileBytes: fileBytes, name: file);
        if (img.isNotEmpty) {
          print(img);
          emit(state.copyWith(isSuccessImage: PodCastImg.success));
        } else {
          emit(state.copyWith(isSuccessImage: PodCastImg.error));
        }
      } else {
        img = "";
        emit(state.copyWith(isSuccessImage: PodCastImg.error));
      }
    } catch (e) {
      emit(state.copyWith(isSuccessImage: PodCastImg.error));
    }
  }

  void reloadedParameter() {
    audio = "";
    img = "";
    emit(state.copyWith(
        isSuccessAudio: PodCastAudio.none,
        podCastEnum: PodCastEnum.none,
        isSuccessImage: PodCastImg.none));
  }

  Future getAudioGallery() async {
    emit(state.copyWith(isSuccessAudio: PodCastAudio.loading));
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'm4a'],
      );
      if (result != null && result.files.single.bytes != null) {
        String file = result.files.single.name;
        Uint8List fileBytes = result.files.single.bytes!;
        audio =
            await podCastDataSource.setAudio(fileBytes: fileBytes, name: file);
        if (audio.isNotEmpty) {
          emit(state.copyWith(isSuccessAudio: PodCastAudio.success));
        } else {
          emit(state.copyWith(isSuccessAudio: PodCastAudio.error));
        }
      } else {
        audio = "";
        emit(state.copyWith(isSuccessAudio: PodCastAudio.error));
      }
    } catch (e) {
      emit(state.copyWith(isSuccessAudio: PodCastAudio.error));
    }
  }

  Future setPodcast(String namePodcast, String author) async {
    emit(state.copyWith(podCastEnum: PodCastEnum.loading));
    try {
      if (audio.isNotEmpty && img.isNotEmpty) {
        final bool resp = await podCastDataSource.setPodCast(
            name: namePodcast, urlImage: img, urlAudio: audio, author: author);
        if (resp) {
          getAllPodcast();
          reloadedParameter();
          emit(state.copyWith(podCastEnum: PodCastEnum.success));
        }
      } else {
        emit(state.copyWith(podCastEnum: PodCastEnum.error));
      }
    } catch (e) {
      emit(state.copyWith(podCastEnum: PodCastEnum.error));
    }
  }

  Future getAllPodcast() async {
    emit(state.copyWith(podLoadingCast: PodLoadingCast.loading));
    try {
      final resp = await podCastDataSource.getAllPodcast();
      List<PodcastModel> list = resp.map((e) {
        Map<String, dynamic> map = e.data();
        map.addAll({"id": e.id});
        return PodcastModel.fromJson(map);
      }).toList();
      emit(state.copyWith(
          podcastList: list, podLoadingCast: PodLoadingCast.success));
    } catch (e) {
      emit(state.copyWith(podLoadingCast: PodLoadingCast.error));
    }
  }

  Future deletePodcast(
      String id, List<PodcastModel> list, PodcastModel delete) async {
    emit(state.copyWith(podLoadingDelete: PodLoadingDelete.loading));
    emit(state.copyWith(podLoadingCast: PodLoadingCast.loading));
    try {
      final bool resp = await podCastDataSource.deletePodcast(id);
      if (resp) {
        emit(state.copyWith(podLoadingCast: PodLoadingCast.loading));
        List<PodcastModel> newlist = list;
        newlist.remove(delete);
        List<PodcastModel> output = newlist;
        emit(state.copyWith(
            podcastList: output, podLoadingCast: PodLoadingCast.success));
        emit(state.copyWith(podLoadingDelete: PodLoadingDelete.success));
      }
    } catch (e) {
      emit(state.copyWith(podLoadingDelete: PodLoadingDelete.loading));
    }
  }
}
