import 'package:flutter/material.dart';

import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/dropdown/dropdown_menu_mode.dart';
import 'package:futurensemobileapp/components/input/input_field.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';

import 'package:futurensemobileapp/screens/mentee/book_appointment/book_appointment_vm.dart';
import 'package:futurensemobileapp/utils/validators.dart';

import 'package:table_calendar/table_calendar.dart';

class BookAppointment extends StatefulWidget {
  MentorModel? topmentor;
  String? channelName;
  String? cancelReason;
  String? cancelDetail;
  bool? resheduleStatus;
  BookAppointment(
      {super.key,
      required this.topmentor,
      this.cancelDetail,
      this.cancelReason,
      this.channelName,
      this.resheduleStatus});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment>
    with BasePage<BookAppointmentVM> {
  late Color slotcolor = Colors.white;
  bool onclick = false;

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
              centerTitle: true,
              title: const Text(
                "Schedule Meeting",
                style: TextStyle(
                    color: Color(0xffFDBA2F),
                    fontSize: 20,
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
        body: SingleChildScrollView(
          child: Form(
            key: provider.formKey,
            child: Column(
              children: [
                // _calander(),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 15),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: const Color(0xffE8E8E8)),
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: const Offset(4, 2),
                            blurRadius: 3,
                            color: const Color(0xffA0A2B3).withOpacity(0.5),
                          )
                        ],
                      ),
                      child: TableCalendar(
                        // currentDay: DateTime.now(),

                        firstDay: DateTime.now(),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: provider.focusedDay,
                        // initialCalendarFormat: CalendarFormat.month,

                        startingDayOfWeek: StartingDayOfWeek.monday,

                        onDaySelected: (DateTime selectDay, DateTime focusDay) {
                          setState(() {
                            provider.selectedDay = selectDay;
                            provider.focusedDay = focusDay;
                          });

                          // after selecting date cll the api for getting timeslot
                          provider.getTimeSlots(provider.focusedDay);
                        },
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(provider.selectedDay, date);
                        },
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                              color: const Color(0xff6EBFC3),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10)),
                          selectedTextStyle:
                              const TextStyle(color: Colors.white),
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
                                style:
                                    const TextStyle(color: Color(0xff3B3B3B)),
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
                ),
                // _bookingslot(),
                Padding(
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
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 100,
                                    childAspectRatio: 4 / 6,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10),
                            itemCount: provider.availableTimeSlots.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                child: Container(
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: provider.availableTimeSlots[index]
                                                    ["time"] ==
                                                provider.selectedTimeslot &&
                                            provider.availableTimeSlots[index]
                                                    ["isAvailable"] ==
                                                true
                                        ? const Color(0xffFDBA2F)
                                        : slotcolor,
                                    border: Border.all(
                                        color: const Color(0xff6B779A)
                                            .withOpacity(0.10)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    provider.availableTimeSlots[index]["time"],
                                    style: TextStyle(
                                        color: provider.availableTimeSlots[
                                                    index]['isAvailable'] ==
                                                false
                                            ? const Color(0xff6B779A)
                                                .withOpacity(0.5)
                                            : provider.availableTimeSlots[index]
                                                            ["time"] ==
                                                        provider
                                                            .selectedTimeslot &&
                                                    provider.availableTimeSlots[
                                                                index]
                                                            ["isAvailable"] ==
                                                        true
                                                ? Colors.white
                                                : const Color(0xff202020)),
                                  )),
                                ),
                                onTap:
                                    // provider.availableTimeSlots.contains(index)?null:
                                    () {
                                  setState(() {
                                    onclick = true;
                                    provider.selectedTimeslot = provider
                                        .availableTimeSlots[index]["time"];
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                // _meetingdetails(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                        enabledValidation: true,
                        borderRadius: 10,
                        selectedItem: provider.selectedMeetingMode,
                        hinttext: "",
                        validationText: "Please Select your Meeting Mode",
                        items: const [
                          "Video Call",
                          "Audio Call",
                        ],
                        setdata: (val) {
                          provider.selectedMeetingMode = val;
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
                        enabledValidation: true,
                        borderRadius: 10,
                        selectedItem: provider.meetingDuration,
                        hinttext: "	",
                        validationText: "Please Select Meeting duration",
                        items: const ["15 min", "30 min", "45 min"],
                        setdata: (val) {
                          provider.meetingDuration = val;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Meeting Agenda",
                        style: TextStyle(
                          color: Color(0xff9295A3),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InputField(
                          textInputType: TextInputType.multiline,
                          hintText: "Write down the meeting agenda",
                          maxline: 5,
                          controller: provider.problemDetail,
                          // prefixIcon: const Icon(Icons.person),
                          validation: Validators.basic),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: const Color(0xffFDBA2F),
                    child: const Text(
                      "Send Request",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    onPressed: () {
                      //to remove keyboard in popup
                      FocusManager.instance.primaryFocus?.unfocus();
                      // provider.postSheduleMeeting(provider.focusedDay, context);
                      widget.resheduleStatus != true
                          ? provider.postSheduleMeeting(
                              provider.focusedDay, context)
                          : provider.rescheduleMeeting(
                              widget.channelName.toString(),
                              widget.cancelDetail.toString(),
                              widget.cancelReason.toString(),
                              context);
                    }),
                const SizedBox(
                  height: 50,
                ),
                // Padding(
                //     padding: EdgeInsets.only(
                //         bottom: MediaQuery.of(context).viewInsets.bottom)),
              ],
            ),
          ),
        ))));
  }

//calander Widget
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
                offset: const Offset(4, 2),
                blurRadius: 3,
                color: const Color(0xffA0A2B3).withOpacity(0.5),
              )
            ],
          ),
          child: TableCalendar(
            // currentDay: DateTime.now(),

            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: provider.focusedDay,
            // initialCalendarFormat: CalendarFormat.month,

            startingDayOfWeek: StartingDayOfWeek.monday,

            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                provider.selectedDay = selectDay;
                provider.focusedDay = focusDay;
              });

              // after selecting date cll the api for getting timeslot
              provider.getTimeSlots(provider.focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(provider.selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                  color: const Color(0xff6EBFC3),
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
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                itemCount: provider.availableTimeSlots.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    child: Container(
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: provider.availableTimeSlots[index]["time"] ==
                                    provider.selectedTimeslot &&
                                provider.availableTimeSlots[index]
                                        ["isAvailable"] ==
                                    true
                            ? Color(0xffFDBA2F)
                            : slotcolor,
                        border: Border.all(
                            color: const Color(0xff6B779A).withOpacity(0.10)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        provider.availableTimeSlots[index]["time"],
                        style: TextStyle(
                            color: provider.availableTimeSlots[index]
                                        ['isAvailable'] ==
                                    false
                                ? const Color(0xff6B779A).withOpacity(0.5)
                                : provider.availableTimeSlots[index]["time"] ==
                                            provider.selectedTimeslot &&
                                        provider.availableTimeSlots[index]
                                                ["isAvailable"] ==
                                            true
                                    ? Colors.white
                                    : const Color(0xff202020)),
                      )),
                    ),
                    onTap:
                        // provider.availableTimeSlots.contains(index)?null:
                        () {
                      setState(() {
                        onclick = true;
                        provider.selectedTimeslot =
                            provider.availableTimeSlots[index]["time"];
                      });
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
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
            enabledValidation: true,
            borderRadius: 10,
            selectedItem: provider.selectedMeetingMode,
            hinttext: "",
            validationText: "Please Select your Meeting Mode",
            items: const [
              "Video Call",
              "Audio Call",
            ],
            setdata: (val) {
              provider.selectedMeetingMode = val;

              // print(provider.selectedMeetingMode);
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
            enabledValidation: true,
            borderRadius: 10,
            selectedItem: provider.meetingDuration,
            hinttext: "	",
            validationText: "Please Select Meeting duration",
            items: const ["15 min", "30 min", "45 min"],
            setdata: (val) {
              provider.meetingDuration = val;
              // print(provider.meetingDuration);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Meeting Agenda",
            style: TextStyle(
              color: Color(0xff9295A3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
              textInputType: TextInputType.multiline,
              hintText: "Write down the meeting agenda",
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
  BookAppointmentVM create() => BookAppointmentVM();

  @override
  void initialise(BuildContext context) {
    provider.topmentor = widget.topmentor;
  }
}
