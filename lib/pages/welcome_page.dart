import 'package:book_tickets/controller/movie_controller.dart';
import 'package:book_tickets/models/Movie.model.dart';
import 'package:book_tickets/widgets/movie_view_widget.dart';
import 'package:book_tickets/pages/ticktet_view.dart';
import 'package:book_tickets/repositories/movie_repository_imp.dart';
import 'package:book_tickets/services/dio_service_imp.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageSatate();
}

class _WelcomePageSatate extends State<WelcomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImp(DioServiceImp()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          /*
            Welcome and search parts
          */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome", style: Styles.headLineStyle3),
                        const Gap(5),
                        Text("Buy Tickets", style: Styles.headLineStyle1),
                      ],
                    ),
                    Container(
                      height: AppLayout.getHeight(50),
                      width: AppLayout.getWidth(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color.fromRGBO(201, 173, 146, 1)),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const AppDoubleTextWidget(
                    bigText: 'Upcoming', smallText: 'View All'),
              ],
            ),
          ),
          const Gap(15),
          /*
            Your Tickts part
          */
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: ticketList
                  .map((singleTicket) => TicketView(
                        ticket: singleTicket,
                        isColor: null,
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Movies",
                    style: Styles.headLineStyle2,
                  ),
                ],
              ),
            ),
          ),
           ValueListenableBuilder<Movie?>(
                    valueListenable: _controller.movies,
                    builder: (_, movies, __) {
                      return movies != null
                          ? SizedBox(
                              height: AppLayout.getHeight(380),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: movies.movies.length,
                                itemBuilder: (_, idx) =>
                                    MovieScreen(movie: movies.movies[idx]),
                              ),
                            )
                          : Container();
                    },
                  ),
        ],
      ),
    );
  }
}
