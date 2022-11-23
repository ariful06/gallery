import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/features/di/injection_container.dart';
import 'package:gallery/service/photo_service.dart';

import 'features/home/presentation/cubit/photo_cubit.dart';
import 'features/home/presentation/home_page.dart';
import 'utils/page_constant.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({Key? key, this.photoService}) : super(key: key);
  final PhotoService? photoService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) => sl<PhotoCubit>()..fetchPost(1, pageLimit),
          child: const HomePage()),
    );
  }
}
