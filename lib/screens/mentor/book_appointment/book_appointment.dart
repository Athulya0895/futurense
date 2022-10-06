import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/book_appointment/appointment_successful.dart';
import 'package:futurensemobileapp/screens/mentor/book_appointment/book_appointment_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentMentor extends StatefulWidget {
  const BookAppointmentMentor({super.key});

  @override
  State<BookAppointmentMentor> createState() => _BookAppointmentMentorState();
}

class _BookAppointmentMentorState extends State<BookAppointmentMentor>
    with BasePage<BookAppointmentMentorVM> {
  late Color slotcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
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
                title: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child:
                            Image.asset("assets/profile.png", fit: BoxFit.fill),
                      ),
                    ).p(8),
                    Column(
                      children: const [
                        Text(
                          "Pro.B. Nicholas",
                          style: TextStyle(
                              color: Color(0xffFDBA2F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Data Scientist in Information Tech...",
                          style: TextStyle(
                              color: Color(0xff6B779A),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // _header(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Schedule your meeting with Pro. B. Nicholas",
                        style:
                            TextStyle(color: Color(0xff202020), fontSize: 18),
                      ),
                    ),
                    _calander(),
                    _bookingslot(),
                    _meetingdetails(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0xffFDBA2F),
                          child: const Text(
                            "Request Appointment",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AppointmentSuccess();
                                });
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // _topmentorsList()
            ],
          ),
        )));
  }

//calander
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  Widget _calander() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: const Color(0xffE8E8E8)),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(4, 2),
                blurRadius: 3,
                color: const Color(0xffA0A2B3).withOpacity(0.5),
              )
            ],
          ),
          child: TableCalendar(
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: focusedDay,
            // initialCalendarFormat: CalendarFormat.month,

            startingDayOfWeek: StartingDayOfWeek.monday,

            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print("${focusedDay}focused day");
              // provider.venueBookings(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                  color: Color(0xff6EBFC3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)),
              selectedTextStyle: const TextStyle(color: Colors.white),
            ),
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: true),

            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Color(0xff3B3B3B)),
                  )),
              todayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffFDBA2F),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            //  calendarController: controller,
          ),
        ),
      ],
    );
  }

  //booking slot
  Widget _bookingslot() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available Time",
                style: TextStyles.title.bold,
              ),
              const Text(
                "swipe ->",
                style: TextStyle(color: Color(0xffFDBA2F)),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 4 / 6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
                itemCount: provider.timeslote.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    child: Container(
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: slotcolor,
                        border: Border.all(
                            color: Color(0xff6B779A).withOpacity(0.10)),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurStyle: BlurStyle.outer,
                            blurRadius: 6,
                            color: Color(0xffffd680),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        provider.timeslote[index]["timeslot1"],
                      )),
                    ),
                    onTap: () {
                      setState(() {});
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  //Meeting details
  Widget _meetingdetails() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Meeting Details",
            style: TextStyles.title.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Meeting Mode",
            style: TextStyle(
              color: Color(0xff9295A3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DropDownMenuMode(
            borderRadius: 10,
            selectedItem: "Videocall",
            hinttext: "	",
            validationText: "Please Select your currency type",
            items: const [
              "Videocall",
              "audio Call",
              "messasge",
            ],
            setdata: (val) {
              // provider.selectedCurrency = val;
              // print(provider.selectedCurrency);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Meeting Duration",
            style: TextStyle(
              color: Color(0xff9295A3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DropDownMenuMode(
            borderRadius: 10,
            selectedItem: "1 Hour",
            hinttext: "	",
            validationText: "Please Select Meeting duration",
            items: const [
              "half and hour",
              "1 hour ",
              "more than 1 hour",
            ],
            setdata: (val) {
              // provider.selectedCurrency = val;
              // print(provider.selectedCurrency);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Write Your Problem",
            style: TextStyle(
              color: Color(0xff9295A3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
              hintText: "Write your Problem",
              maxline: 5,
              controller: provider.problemDetail,
              // prefixIcon: const Icon(Icons.person),
              validation: Validators.basic),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  BookAppointmentMentorVM create() => BookAppointmentMentorVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
