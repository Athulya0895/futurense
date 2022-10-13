import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/screens/mentee/myappointments_mentee/cancelled_appointments_mentee/cancelled_appointments_mentee_vm.dart';

class CancelledAppointmentsMentee extends StatefulWidget {
  const CancelledAppointmentsMentee({super.key});

  @override
  State<CancelledAppointmentsMentee> createState() =>
      _CancelledAppointmentsMenteeState();
}

class _CancelledAppointmentsMenteeState
    extends State<CancelledAppointmentsMentee>
    with BasePage<CancelledAppointmentsMenteeVM> {
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffFFD680),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: AppBar(
                title: const Text(
                  "Cancelled Appointments",
                  style: TextStyle(
                      color: const Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),
          body: Center(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color(0xffF5F5F5), width: 1)),
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          leading:
                              // Image.network(provider
                              //                 .couponlist[index]
                              //             ['coupon_image'] !=
                              //         null
                              //     ? provider.couponlist[index]['coupon_image']
                              //     : ""),
                              Image.asset("assets/profile.png"),
                          //     SvgPicture.asset(
                          //   "assets/profile.svg",
                          //   color: Theme.of(context).primaryColor,
                          //   height: 50,
                          //   width: 50,
                          // ),
                          trailing: IconButton(
                              onPressed: (() {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         CouponIndividual(
                                //       coupondetail:
                                //           provider.couponlist[index],
                                //     ),
                                //   ),
                                // );
                              }),
                              icon: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffFFC02D),
                                    borderRadius: BorderRadius.circular(10)),
                                child: SvgPicture.asset(
                                  "assets/close.svg",
                                  color: Colors.white,
                                ),
                              )),
                          title: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Klimisch J",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff202020)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Voice Call ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Cancelled by you",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffFF7901))),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("View details",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xffFD2FE2)))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // height:
                          //     MediaQuery.of(context).size.height *
                          //         0.06,
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 250, right: 10),
                          decoration: BoxDecoration(
                              color: Color(0xffEBF6F7),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                              minWidth: 30,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              textColor: Colors.white,
                              color: const Color(0xff6EBFC3),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                "Reschdule",
                                style: TextStyle(fontSize: 12),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  );
                }),
          ),
        )));
  }

  @override
  CancelledAppointmentsMenteeVM create() => CancelledAppointmentsMenteeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
