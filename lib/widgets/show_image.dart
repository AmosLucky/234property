import 'package:cached_network_image/cached_network_image.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class showNetworImage extends StatelessWidget {
  String url;
  showNetworImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: MColors.primaryColor,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
