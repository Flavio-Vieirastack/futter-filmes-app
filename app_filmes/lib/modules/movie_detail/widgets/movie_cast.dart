import 'package:app_filmes/application/ui/theme_extension.dart';
import 'package:app_filmes/models/cast_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCast extends StatelessWidget {
  final CastModel? castModel;

  const MovieCast({Key? key, this.castModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              castModel?.image ?? "",
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            castModel?.name ?? "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          
          ),

         Text(
            castModel?.character ?? "",
            style: TextStyle(
              fontSize: 12,
              color: context.fontThemeGray,
            ),
          
          )

        ],
      ),
    );
  }
}
