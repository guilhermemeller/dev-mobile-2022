import 'package:book_tickets/models/Movie.model.dart';
import 'package:book_tickets/utils/api.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(left: 20, right: 17, top: 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(201, 173, 146, 1),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: AppLayout.getHeight(250),
            width: AppLayout.getWidth(169),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(201, 173, 146, 1),
              image: DecorationImage(
                image: NetworkImage(
                  API.REQUEST_IMG(movie.posterPath),
                ),
              ),
            ),
          ),
          const Gap(5),
          Text(
            movie.title.toString(),
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          const Gap(10),
          InkWell(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Styles.darkBorwnColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 600,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(AppLayout.getHeight(15)),
                            child: Column(
                              children: [
                                Text(movie.title.toString(),
                                    style: Styles.headLineStyle1
                                        .copyWith(color: Colors.white)),
                                Gap(AppLayout.getHeight(40)),
                                Text(movie.overview.toString(),
                                    style: Styles.headLineStyle3
                                        .copyWith(color: Colors.white)),
                                Gap(AppLayout.getHeight(40)),
                                Text("IMDB: ${movie.voteAverage}",
                                    style: Styles.headLineStyle3
                                        .copyWith(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text("Learn More",
                  style: Styles.headLineStyle4.copyWith(color: Colors.white))),
          // Text("Learn More",
          //     style: Styles.headLineStyle4.copyWith(color: Colors.white))
        ],
      ),
    );
  }
}
