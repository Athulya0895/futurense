import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/back_button/backbutton.dart';
import 'package:futurensemobileapp/components/theme/extension.dart';
import 'package:futurensemobileapp/components/theme/text_styles.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat/chat.dart';
import 'package:futurensemobileapp/screens/mentee/chat/chat_home/chat_home_vm.dart';
import 'package:intl/intl.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> with BasePage<ChatHomeVM> {
  String notReadMessage = "";
  @override
  Widget build(BuildContext context) {
    return builder((() => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Messaging",
              style: TextStyle(
                  color: const Color(0xffFDBA2F),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: const BackButtonCustom(),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) => chatTile(index),
          ),
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
              builder: (context) => Chat(),
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
        title: Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              'Name',
            )),
        subtitle: Row(
          children: [
            SvgPicture.asset(
              'assets/message.svg',
              color: Color(0xff6FBEC2),
            ),
            const SizedBox(
              width: 5,
            ),
            // Text(chats?.last.message ?? "")
            Text("lastmsg ..")
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
