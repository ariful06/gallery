import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery/data/model/photos_dto.dart';
import 'package:gallery/utils/page_constant.dart';
import 'package:photo_view/photo_view.dart';


class DetailsPage extends StatefulWidget {
  static const String PATH = '/details';

  DetailsPage({Key? key,this.details}): super(key: key);

  final String? details ;
  static String generatePath({required String details}) {
    Map<String, dynamic> param = {photoDetails : details};
    Uri uri = Uri(path: PATH, queryParameters: param);
    return uri.toString();
  }

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ImageDTO? imageDTO;

  @override
  Widget build(BuildContext context) {
    if(widget.details!= null) {
      imageDTO =  ImageDTO.fromJson(json.decode(widget.details!));
    }
    return PhotoView(
      imageProvider: CachedNetworkImageProvider(imageDTO?.downloadUrl ?? ""),
    );
  }
}
