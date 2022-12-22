import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';



import 'package:futurensemobileapp/screens/mentee/chat/chat/chat.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat_home/chat_home_vm.dart';
import 'package:futurensemobileapp/screens/mentor/coming_soon/coming_soon.dart';
import 'package:intl/intl.dart';

class ChatHome extends StatefulWidget {
  final jumbToindex;
  const ChatHome({super.key, this.jumbToindex});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> with BasePage<ChatHomeVM> {
  String notReadMessage = "";
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
                      blurRadius: 10,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: AppBar(
                centerTitle: true,
                title: const Text(
                  "Messages",
                  style: TextStyle(
                      color:  Color(0xffFDBA2F),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                // leading: const BackButtonCustom(),
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                )),
              ),
            ),
          ),

          body: const ComingSoon(
              text1: "Messaging Feature Coming\n Soon!",
              text2:
                  "You will be able to start\n messaging your mentors\n directly!"),
          //  ListView.builder(
          //   itemCount: 7,
          //   itemBuilder: (context, index) => chatTile(index),
          // ),
        )));
  }

  Widget chatTile(int index) {
    // return StreamBuilder(
    //   stream: provider.getPendingMessageStream(index),
    //   builder: (context, snapshot) {
    //     List<ChatModel>? chats;
    //     String notReadMessage = "";
    //     if (snapshot.data != null) {
    //       final QuerySnapshot data = snapshot.data as QuerySnapshot;
    //       chats = data.docs.map((e) => ChatModel.fromJson(e)).toList();
    //       notReadMessage = chats
    //           .where((element) =>
    //               element.isUser == false && element.isRead == false)
    //           .toList()
    //           .length
    //           .toString();
    //       print(chats.last.message);
    //     } else {
    //       Container();
    //     }
    //  else {
    //   FirebaseFirestore.instance
    //       .collection('chat')
    //       .doc(provider.orderlistcus[index].orderId)
    //       .set({});

    //   CollectionReference ref =
    //       FirebaseFirestore.instance.collection('chat');
    //   ref
    //       .doc(provider.orderlistcus[index].orderId)
    //       .collection('messages')
    //       .add(ChatModel(
    //         date: DateTime.now(),
    //         message: "hi",
    //         isUser: true,
    //       ).toJSON());
    //   setState(() {});
    // }
    return Container(
      // height: 82,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 2),
            blurStyle: BlurStyle.outer,
            blurRadius: 4,
            color: Color(0xffffd680),
          )
        ],
      ),
      child: ListTile(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>
          //         Chat(orderData: provider.orderlistcus[index]),
          //   ),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const Chat(),
            ),
          );
        },
        leading: SizedBox(
          height: 60,
          width: 60,
          child: Stack(
            children: <Widget>[
              // const SizedBox(
              //   width: 65,
              //   height: 65,
              //   child: CircleAvatar(
              //     backgroundColor: Colors.orange,
              //     child: Icon(
              //       Icons.person,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: const Color(0xff6EBFC3).withOpacity(0.2),
                    shape: BoxShape.circle
                    // borderRadius: BorderRadius.circular(40)
                    ),
                child: SvgPicture.asset(
                  "assets/myaccount.svg",
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        title:const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              'Name',
            )),
        subtitle: Row(
          children: [
            SvgPicture.asset(
              'assets/message.svg',
              color:const Color(0xff6FBEC2),
            ),
            const SizedBox(
              width: 5,
            ),
            // Text(chats?.last.message ?? "")
           const Text("lastmsg ..")
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: notReadMessage.isNotEmpty,
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xff06AFF2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      notReadMessage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                // DateFormat.jm().format(chats?.last.date ?? DateTime.now()
                DateFormat.jm().format(DateTime.now()),
                style: const TextStyle(
                  color: Color(0xff7D8087),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // },
    // );
  }

  @override
  ChatHomeVM create() => ChatHomeVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
  }
}
