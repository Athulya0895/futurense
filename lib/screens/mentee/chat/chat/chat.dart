import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/more_button/more_button.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat/chat_vm.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with BasePage<ChatVm> {
  Widget _chatComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[500],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your message ...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
        appBar: AppBar(
          // title: const Text(
          //   "Messaging",
          //   style: TextStyle(
          //       color: const Color(0xffFDBA2F),
          //       fontSize: 18,
          //       fontWeight: FontWeight.bold),
          // ),
          leading: const BackButtonCustom(),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 15,
              ),
              const Text(
                "pro. Bellamy Nich…",
                style: TextStyle(color: Color(0xff222B45), fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xff6EBFC3).withOpacity(0.2),
                    shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(40)
                    ),
                child: SvgPicture.asset(
                  "assets/myaccount.svg",
                  width: 25,
                ),
              ),
            ],
          ),
        ),
         // body: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: 145,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(30),
        //           bottomRight: Radius.circular(30),
        //         ),
        //       ),
        //       child: Column(
        //         children: [
        //           const SizedBox(height: 10),
        //           Row(
        //             children: [
        //               const SizedBox(width: 10),
        //               SizedBox(
        //                 width: 60,
        //                 height: 60,
        //                 child: Stack(
        //                   children: <Widget>[
        //                     const SizedBox(
        //                       width: 60,
        //                       height: 60,
        //                       child: CircleAvatar(
        //                         backgroundColor: Colors.orange,
        //                         child: Icon(
        //                           Icons.person,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                     ),
        //                     Align(
        //                       alignment: Alignment.bottomRight,
        //                       child: Container(
        //                         height: 15,
        //                         width: 15,
        //                         decoration: const BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           color: Colors.green,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               const SizedBox(width: 5),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     provider.venueslist?.venueName ?? "Name",
        //                     // widget.orderData.venueName ?? "Name",
        //                     style: const TextStyle(
        //                       color: Colors.black,
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                   ),
        //                   Text(
        //                     provider.venueslist?.address ?? "葵興華星街",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const Spacer(),
        //               Text(
        //                 // "300",
        //                 "\$ ${provider.venueslist?.capacity ?? 300}/小時",
        //                 style: const TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               const SizedBox(width: 10)
        //             ],
        //           ),
        //           const SizedBox(height: 10),
        //           Visibility(
        //             visible: false,
        //             child: Row(
        //               children: const [
        //                 SizedBox(width: 20),
        //                 Text(
        //                   "預訂日期",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.w500,
        //                     color: Color(0xff2B3D5F),
        //                   ),
        //                 ),
        //                 SizedBox(width: 30),
        //                 Text(
        //                   "人數",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.w500,
        //                     color: Color(0xff2B3D5F),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             replacement: Row(
        //               children: [
        //                 const SizedBox(width: 20),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "預訂日期",
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w500,
        //                         color: Color(0xff2B3D5F),
        //                       ),
        //                     ),
        //                     SizedBox(height: 2),
        //                     Text(
        //                       // "21 Dec, 2021\n18:00-20:00",
        //                       //  " ${DateFormat().format(DateTime.tryParse(provider.items[index]['order_date']) ?? DateTime.now())}",
        //                       widget.orderData.orderDate!.isNotEmpty
        //                           ? DateFormat.jm().format(DateTime.parse(
        //                               widget.orderData.orderDate.toString()))
        //                           : "",
        //                       style: TextStyle(
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w400,
        //                         color: Color(0xff9295A3),
        //                       ),
        //                     ),
        //                     SizedBox(height: 5),
        //                   ],
        //                 ),
        //                 const SizedBox(width: 30),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [
        //                     Text(
        //                       "人數",
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w500,
        //                         color: Color(0xff2B3D5F),
        //                       ),
        //                     ),
        //                     SizedBox(height: 2),
        //                     Text("6 - 10 人",
        //                         style: TextStyle(
        //                           fontSize: 14,
        //                           fontWeight: FontWeight.w400,
        //                           color: Color(0xff9295A3),
        //                         ))
        //                   ],
        //                 ),
        //                 const Spacer(),
        //                 Container(
        //                   height: 40,
        //                   margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        //                   width: 120,
        //                   child: MaterialButton(
        //                     child: const Text("前往帳單"),
        //                     onPressed: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => const BookingDetails(),
        //                         ),
        //                       );
        //                     },
        //                     color: Theme.of(context).primaryColor,
        //                     textColor: Colors.white,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(15),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         width: double.infinity,
        //         child: ListView.separated(
        //           separatorBuilder: (context, index) {
        //             // For date //
        //             if (provider.todayStartIndex == index + 1) {
        //               // DateTime.da
        //               // if(provider.messages[index].date!.){}
        //               return SizedBox(
        //                 child: Center(
        //                   child: Container(
        //                     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        //                     padding: const EdgeInsets.fromLTRB(30, 4, 30, 4),
        //                     decoration: BoxDecoration(
        //                         color: const Color.fromARGB(110, 255, 255, 255),
        //                         borderRadius: BorderRadius.circular(50)),
        //                     child: const Text("Today"),
        //                   ),
        //                 ),
        //               );
        //             }
        //             return Container();
        //           },
        //           controller: provider.scrollController,
        //           itemCount: provider.messages.length,
        //           itemBuilder: (context, index) {
        //             return Align(
        //               alignment: provider.messages[index].isUser == true
        //                   ? Alignment.centerRight
        //                   : Alignment.centerLeft,
        //               child: Message(message: provider.messages[index]),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.all(10),
        //       width: double.infinity,
        //       // height: 70,
        //       decoration: const BoxDecoration(color: Color(0xffC4C4C4)),
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: InputField(
        //               textInputType: TextInputType.visiblePassword,
        //               validation: Validators.basic,
        //               hintText: "輸入留言言",
        //               controller: provider.messageController,
        //               suffixIcon: Container(
        //                 height: 40,
        //                 margin: const EdgeInsets.fromLTRB(0, 0, 10, 3),
        //                 width: 50,
        //                 child: MaterialButton(
        //                   child: SvgPicture.asset("assets/send_button.svg"),
        //                   onPressed: () {
        //                     provider.sendMessage();
        //                   },
        //                   color: Theme.of(context).primaryColor,
        //                   textColor: Colors.white,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: Container(
        //               height: 60,
        //               margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //               width: 60,
        //               child: Container(
        //                 child: SvgPicture.asset(
        //                   "assets/send_media.svg",
        //                   height: 80,
        //                   width: 80,
        //                 ),
        //                 // onPressed: () {
        //                 //   // provider.sendMessage();
        //                 // },
        //                 padding: const EdgeInsets.all(7),
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10)),
        //                 // textColor: Colors.white,
        //                 // shape: RoundedRectangleBorder(
        //                 //   borderRadius: BorderRadius.circular(10),
        //                 // ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),
        )));
  }

  @override
  ChatVm create() => ChatVm();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}


//  appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "查詢對話",
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: const BackButtonCustom(),
//           actions: [
//             // SizedBox(width: 50),
//             PopupMenuButton(
//               child: const MoreButtonCustom(),
//               onSelected: (item) {
//                 setState(() {});
//               },
//               itemBuilder: (BuildContext context) => [
//                 const PopupMenuItem(
//                   value: "Item2",
//                   child: ListTile(
//                     leading: Icon(Icons.restart_alt),
//                     title: Text("更新狀態"),
//                   ),
//                 ),
//                 const PopupMenuItem(
//                   value: "Item2",
//                   child: ListTile(
//                     leading: Icon(
//                       Icons.delete,
//                       color: Colors.red,
//                     ),
//                     title: Text(
//                       "刪除對話",
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
        // body: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: 145,
        //       decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(30),
        //           bottomRight: Radius.circular(30),
        //         ),
        //       ),
        //       child: Column(
        //         children: [
        //           const SizedBox(height: 10),
        //           Row(
        //             children: [
        //               const SizedBox(width: 10),
        //               SizedBox(
        //                 width: 60,
        //                 height: 60,
        //                 child: Stack(
        //                   children: <Widget>[
        //                     const SizedBox(
        //                       width: 60,
        //                       height: 60,
        //                       child: CircleAvatar(
        //                         backgroundColor: Colors.orange,
        //                         child: Icon(
        //                           Icons.person,
        //                           color: Colors.white,
        //                         ),
        //                       ),
        //                     ),
        //                     Align(
        //                       alignment: Alignment.bottomRight,
        //                       child: Container(
        //                         height: 15,
        //                         width: 15,
        //                         decoration: const BoxDecoration(
        //                           shape: BoxShape.circle,
        //                           color: Colors.green,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               const SizedBox(width: 5),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     provider.venueslist?.venueName ?? "Name",
        //                     // widget.orderData.venueName ?? "Name",
        //                     style: const TextStyle(
        //                       color: Colors.black,
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.w500,
        //                     ),
        //                   ),
        //                   Text(
        //                     provider.venueslist?.address ?? "葵興華星街",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.w400,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const Spacer(),
        //               Text(
        //                 // "300",
        //                 "\$ ${provider.venueslist?.capacity ?? 300}/小時",
        //                 style: const TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 18,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //               const SizedBox(width: 10)
        //             ],
        //           ),
        //           const SizedBox(height: 10),
        //           Visibility(
        //             visible: false,
        //             child: Row(
        //               children: const [
        //                 SizedBox(width: 20),
        //                 Text(
        //                   "預訂日期",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.w500,
        //                     color: Color(0xff2B3D5F),
        //                   ),
        //                 ),
        //                 SizedBox(width: 30),
        //                 Text(
        //                   "人數",
        //                   style: TextStyle(
        //                     fontWeight: FontWeight.w500,
        //                     color: Color(0xff2B3D5F),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             replacement: Row(
        //               children: [
        //                 const SizedBox(width: 20),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       "預訂日期",
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w500,
        //                         color: Color(0xff2B3D5F),
        //                       ),
        //                     ),
        //                     SizedBox(height: 2),
        //                     Text(
        //                       // "21 Dec, 2021\n18:00-20:00",
        //                       //  " ${DateFormat().format(DateTime.tryParse(provider.items[index]['order_date']) ?? DateTime.now())}",
        //                       widget.orderData.orderDate!.isNotEmpty
        //                           ? DateFormat.jm().format(DateTime.parse(
        //                               widget.orderData.orderDate.toString()))
        //                           : "",
        //                       style: TextStyle(
        //                         fontSize: 14,
        //                         fontWeight: FontWeight.w400,
        //                         color: Color(0xff9295A3),
        //                       ),
        //                     ),
        //                     SizedBox(height: 5),
        //                   ],
        //                 ),
        //                 const SizedBox(width: 30),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: const [
        //                     Text(
        //                       "人數",
        //                       style: TextStyle(
        //                         fontWeight: FontWeight.w500,
        //                         color: Color(0xff2B3D5F),
        //                       ),
        //                     ),
        //                     SizedBox(height: 2),
        //                     Text("6 - 10 人",
        //                         style: TextStyle(
        //                           fontSize: 14,
        //                           fontWeight: FontWeight.w400,
        //                           color: Color(0xff9295A3),
        //                         ))
        //                   ],
        //                 ),
        //                 const Spacer(),
        //                 Container(
        //                   height: 40,
        //                   margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        //                   width: 120,
        //                   child: MaterialButton(
        //                     child: const Text("前往帳單"),
        //                     onPressed: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => const BookingDetails(),
        //                         ),
        //                       );
        //                     },
        //                     color: Theme.of(context).primaryColor,
        //                     textColor: Colors.white,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(15),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         width: double.infinity,
        //         child: ListView.separated(
        //           separatorBuilder: (context, index) {
        //             // For date //
        //             if (provider.todayStartIndex == index + 1) {
        //               // DateTime.da
        //               // if(provider.messages[index].date!.){}
        //               return SizedBox(
        //                 child: Center(
        //                   child: Container(
        //                     margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        //                     padding: const EdgeInsets.fromLTRB(30, 4, 30, 4),
        //                     decoration: BoxDecoration(
        //                         color: const Color.fromARGB(110, 255, 255, 255),
        //                         borderRadius: BorderRadius.circular(50)),
        //                     child: const Text("Today"),
        //                   ),
        //                 ),
        //               );
        //             }
        //             return Container();
        //           },
        //           controller: provider.scrollController,
        //           itemCount: provider.messages.length,
        //           itemBuilder: (context, index) {
        //             return Align(
        //               alignment: provider.messages[index].isUser == true
        //                   ? Alignment.centerRight
        //                   : Alignment.centerLeft,
        //               child: Message(message: provider.messages[index]),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: const EdgeInsets.all(10),
        //       width: double.infinity,
        //       // height: 70,
        //       decoration: const BoxDecoration(color: Color(0xffC4C4C4)),
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: InputField(
        //               textInputType: TextInputType.visiblePassword,
        //               validation: Validators.basic,
        //               hintText: "輸入留言言",
        //               controller: provider.messageController,
        //               suffixIcon: Container(
        //                 height: 40,
        //                 margin: const EdgeInsets.fromLTRB(0, 0, 10, 3),
        //                 width: 50,
        //                 child: MaterialButton(
        //                   child: SvgPicture.asset("assets/send_button.svg"),
        //                   onPressed: () {
        //                     provider.sendMessage();
        //                   },
        //                   color: Theme.of(context).primaryColor,
        //                   textColor: Colors.white,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: Container(
        //               height: 60,
        //               margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //               width: 60,
        //               child: Container(
        //                 child: SvgPicture.asset(
        //                   "assets/send_media.svg",
        //                   height: 80,
        //                   width: 80,
        //                 ),
        //                 // onPressed: () {
        //                 //   // provider.sendMessage();
        //                 // },
        //                 padding: const EdgeInsets.all(7),
        //                 decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(10)),
        //                 // textColor: Colors.white,
        //                 // shape: RoundedRectangleBorder(
        //                 //   borderRadius: BorderRadius.circular(10),
        //                 // ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),