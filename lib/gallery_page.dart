import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/cubit/photo_cubit.dart';
import 'package:gallery/service/photo_service.dart';

import 'home/home_page.dart';
import 'utils/page_constant.dart';

class GalleryApp extends StatelessWidget {
  GalleryApp({Key? key, this.photoService}) : super(key: key);
  final PhotoService? photoService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) =>
              PhotoCubit(service: photoService)..fetchPost(1, pageLimit),
          child: HomePage()),
    );
  }
}
