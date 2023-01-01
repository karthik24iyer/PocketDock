import 'package:flutter/material.dart';
import 'package:pocket_dock/tag/placeStatus.dart';

import '../util/TagIcon.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  Color tagTextColor = Colors.white;
  TagIcon tagIcon = const TagIcon();
  bool displayFront = true;


  Widget getTagContainer(String item) {

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70,width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(
              20.0)
          ),
          color: Colors.black
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70,width: 1.0),
                  color: Colors.black
              ),
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      item.replaceAll("_", " "),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(color: tagTextColor, fontSize: 20)
                  ),
                  tagIcon.getIcon(item)
                ],
              ),
            ),
            onTap: () {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Dialog(
              //       backgroundColor: Colors.black54,
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //       elevation: 16,
              //       insetPadding: const EdgeInsets.all(20),
              //       child: const SizedBox(
              //         height: 400,
              //         child: Status(currentPlace: "Desk"),
              //       ),
              //     );
              //   },
              // );
            },
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  //border: Border.all(color: Colors.white70,width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(
                      20.0)
                  ),
                  color: Colors.black
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      item.replaceAll("_", " "),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(color: tagTextColor, fontSize: 20)
                  ),
                  tagIcon.getIcon(item)
                ],
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 16,
                    insetPadding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 300,
                      child: PlaceStatus(tag: item),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        getTagContainer("Power_Bank"),
        getTagContainer("Bottle"),
        getTagContainer("Charger"),
        getTagContainer("Kindle"),
        getTagContainer("Mask"),
        getTagContainer("Keys"),
        getTagContainer("Earphone"),
        getTagContainer("Watch"),
      ],
    );
  }

  // Widget getTagContainerOld(String item, int num) {
  //
  //   return Container(
  //     decoration: BoxDecoration(
  //         border: Border.all(color: Colors.white70,width: 2.0),
  //         borderRadius: const BorderRadius.all(Radius.circular(
  //             20.0)
  //         ),
  //         color: Colors.black
  //     ),
  //     padding: const EdgeInsets.all(8),
  //     child: GestureDetector(
  //       onTap: () => setState(() => displayFront = !displayFront),
  //       child: AnimatedSwitcher(
  //           duration: const Duration(milliseconds: 600),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: <Widget>[
  //               Text(
  //                 //num.toString(),
  //                   displayFront == true ? item.replaceAll("_", " ") : "Dummy",
  //                   textAlign: TextAlign.center,
  //                   softWrap: true,
  //                   style: TextStyle(color: tagTextColor, fontSize: 20)
  //               ),
  //               displayFront == true ? tagIcon.getIcon(item) : tagIcon.getIcon("Select")
  //             ],
  //           )
  //       ),
  //     ),
  //   );
  // }
}
