import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailCompanies extends StatelessWidget {
  final MovieDetailModel? movie;

  const MovieDetailCompanies({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 5),
      child: RichText(
          text: TextSpan(
              text: "Compania(s), Produtora(s): ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff222222)),
              children: [
            TextSpan(
              text: movie?.produtionCompany.join(", ") ?? "",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Color(0xff222222)),
            )
          ])),
    );
  }
}
