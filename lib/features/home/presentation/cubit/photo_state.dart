
import 'package:flutter/material.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/features/home/domain/entity/photo.dart';

@immutable
abstract class PhotoState {}

class PhotoInitialState extends PhotoState {}

class PhotosLoadedState extends PhotoState {

  final List<Photo>? photos;
  final int? currentPage;

  PhotosLoadedState({this.photos,this.currentPage});

}

class PhotoErrorState extends PhotoState {
  final message;
  PhotoErrorState({this.message});
}
