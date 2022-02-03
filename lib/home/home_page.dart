

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/app_provider.dart';
import 'package:gallery/cubit/photo_cubit.dart';
import 'package:gallery/cubit/photo_state.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/logger/Log.dart';
import 'package:gallery/utils/page_constant.dart';
import 'package:gallery/values/app_colors.dart';
import 'package:gallery/values/font_styles.dart';

import 'details/details_page.dart';

class HomePage extends StatefulWidget {
  static const String PATH ='/';
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  bool isLoading = false;
  List<ImageDTO> photos = <ImageDTO>[];
  final ScrollController _scrollController = ScrollController();
  PhotoCubit? _bloc;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !isLoading){
        isLoading = true;
        Log.d("Current Pgae",currentPage);
        _bloc?.fetchPost(currentPage, pageLimit);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<PhotoCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.darkPrimaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget> [
            const SizedBox(height: 40,),
            Center(child: Text('Gallery',style: FontStyles.m50024KWhite,),),
            const SizedBox(height: 40,),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    decoration: const BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: BlocConsumer<PhotoCubit, PhotoState>(
                      builder: (BuildContext context, state) {
                        if (state is PhotosLoadedState) {
                        if(state.photos!= null){
                          if(state.photos!.isNotEmpty){
                            currentPage = state.currentPage == null ? 0 : state.currentPage! + 1;
                            photos.addAll(state.photos!);
                          }
                        }
                        isLoading = false;
                        return _buildPhotos();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 8.0,
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                      },
                      listener: (BuildContext context, state) {
                        if (state is PhotoErrorState) {
                          isLoading = false;
                        }
                        if (state is PhotoInitialState) {
                          var snackBar = const SnackBar(content: Text('Please wait...'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    )))
          ],
        ),
      ),
    );
  }

  Widget _buildPhotos(){
    return  GridView.builder(
        shrinkWrap: true,
        key: const PageStorageKey<String>('scrollPosition'),
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: photos.length,
        itemBuilder: (context, index) {
            return RawMaterialButton(
              onPressed: () {
                String data = json.encode(photos[index]).toString();
                AppProvider.getRouter(context)?.navigateTo(
                    context, DetailsPage.generatePath(details: data));
              },
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                imageUrl: photos[index].downloadUrl ?? "",
                // placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            );
        });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
