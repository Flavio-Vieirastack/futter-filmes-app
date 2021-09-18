import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 148,
      height: 280,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                      "https://br.web.img3.acsta.net/pictures/19/04/03/18/23/2539612.jpg",
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                      ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Coringa",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "2019",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            right: -11,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 30,
                child: IconButton(
                  iconSize: 14,
                  onPressed: () {},
                  icon: Icon(
                    FilmesAppIcons.heart, color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
