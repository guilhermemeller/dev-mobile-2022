// ignore_for_file: depend_on_referenced_packages

import 'package:book_tickets/pages/ticktet_view.dart';
import 'package:book_tickets/services/ticket_service.dart';
import 'package:book_tickets/utils/app_info_list.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/column_layout.dart';
import 'package:book_tickets/widgets/ticket_tabs.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../utils/app_layout.dart';
import '../widgets/layout_builder.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);
  @override
  State<TicketsPage> createState() => _TicketsPage();
}

class _TicketsPage extends State<TicketsPage> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final ticketcode = TextEditingController();
  final studentid = TextEditingController();
  final room = TextEditingController();
  final seat = TextEditingController();
  final date = TextEditingController();
  final sessiontime = TextEditingController();

  final loadingTick = true.obs;

  String ticket = '';

  final tickets = [].obs;

  final TicketService ticketService = TicketService();

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancel",
      false,
      ScanMode.QR,
    );
    setState(() => ticket = code != '-1' ? code : 'Not validated');
  }

  @override
  void initState() {
    ticketService.getTickets().then((e) {
      tickets(e);
      loadingTick(false);
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(20),
                vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text(
                "Tickets",
                style: Styles.headLineStyle1,
              ),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Outdated"),
              Gap(AppLayout.getHeight(20)),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text(
                              'Add Your Ticket',
                              style: Styles.headLineStyle3,
                            ),
                            content: Padding(
                              padding: EdgeInsets.all(AppLayout.getHeight(8)),
                              child: Form(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: title,
                                      decoration: const InputDecoration(
                                        labelText: 'Movie name',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: ticketcode,
                                      decoration: const InputDecoration(
                                        labelText: 'E-Ticket Code',
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: studentid,
                                      decoration: const InputDecoration(
                                        labelText: 'Studant ID',
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: room,
                                      decoration: const InputDecoration(
                                        labelText: 'Room',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: seat,
                                      decoration: const InputDecoration(
                                        labelText: 'Seat',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: date,
                                      decoration: const InputDecoration(
                                        labelText: 'Date',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: sessiontime,
                                      decoration: const InputDecoration(
                                        labelText: 'Session Time',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // ignore: unnecessary_this
                                    this.ticketService.insertTicket(
                                        title.text,
                                        ticketcode.text,
                                        int.parse(studentid.text),
                                        int.parse(room.text),
                                        seat.text,
                                        date.text,
                                        sessiontime.text);
                                    final snackBar = SnackBar(
                                      content: const Text('Ticket Added!'),
                                      backgroundColor: (Colors.grey),
                                      action: SnackBarAction(
                                        label: '',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(201, 173, 146, 1)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(FluentSystemIcons
                                          .ic_fluent_checkbox_checked_filled),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Styles.darkBorwnColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(FluentSystemIcons.ic_fluent_add_filled),
                    ],
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(
                  onPressed: readQRCode,
                  icon: const Icon(Icons.qr_code),
                  label: const Text('Validate'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Styles.darkBorwnColor),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(0)),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
                width: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(15),
                    vertical: AppLayout.getHeight(20)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          firstText: 'Gustavo',
                          secondText: 'Studant',
                          alignment: CrossAxisAlignment.start,
                        ),
                        AppColumnLayout(
                          firstText: '2317516',
                          secondText: 'Studant ID',
                          alignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 15),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(
                          firstText: '4555 7888 6222',
                          secondText: 'E-Ticket Number',
                          alignment: CrossAxisAlignment.start,
                        ),
                        AppColumnLayout(
                          firstText: 'B227H7',
                          secondText: 'Confrimation Code',
                          alignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 15),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/visa.png",
                                  scale: 11,
                                ),
                                Text(
                                  " *** 7516",
                                  style: Styles.headLineStyle3
                                      .copyWith(color: Colors.black),
                                )
                              ],
                            ),
                            Gap(AppLayout.getHeight(5)),
                            Text(
                              "Payment Method",
                              style: Styles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnLayout(
                          firstText: 'R\$ 20,00',
                          secondText: 'Price',
                          alignment: CrossAxisAlignment.end,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                      width: 5,
                    ),
                  ],
                ),
              ),
              /*
                Bar code 
              */
              const SizedBox(
                height: 1,
                width: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppLayout.getHeight(21)),
                      bottomLeft: Radius.circular(AppLayout.getHeight(21))),
                ),
                padding: EdgeInsets.only(
                    top: AppLayout.getHeight(15),
                    bottom: AppLayout.getHeight(15)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(10),
                      vertical: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https:/github.com',
                      color: Styles.textColor,
                      drawText: false,
                      height: AppLayout.getHeight(70),
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(0)),
                  child: Obx(() => loadingTick.value
                      ? Column()
                      : Column(
                          // ignore: invalid_use_of_protected_member
                          children: tickets.value.map<Widget>((e) {
                          Map<String, dynamic> gambi = {
                            "id": e.id,
                            "title": e.title,
                            "ticket_code": e.ticketcode,
                            "student_id": e.studentid,
                            "room": e.room,
                            "seat": e.seat,
                            "runtime": '2h:30min',
                            "date": e.date,
                            "session_time": e.sessiontime
                          };

                          return TicketView(
                            ticket: gambi,
                          );
                        }).toList())))
            ],
          ),
        ],
      ),
    );
  }
}
