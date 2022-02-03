
import 'package:flutter/material.dart';
import 'package:gallery/data/model/photos_dto.dart';

@immutable
abstract class PhotoState {}

class PhotoInitialState extends PhotoState {}

class PhotosLoadedState extends PhotoState {

  final List<ImageDTO>? photos;
  final int? currentPage;

  PhotosLoadedState({this.photos,this.currentPage});

}

class PhotoErrorState extends PhotoState {
  final message;
  PhotoErrorState({this.message});
}
