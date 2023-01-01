import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../util/data.dart';

class ItemStatus extends StatefulWidget {

  final tag;
  const ItemStatus({Key? key, required this.tag}) : super(key: key);

  @override
  State<ItemStatus> createState() => _ItemStatusState();
}

class _ItemStatusState extends State<ItemStatus> {

  Color tagTextColor = Colors.white;
  //String currentPlace = "";

  Widget getTagContainer(String item) {
    final mem = GetStorage();

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70,width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(
              15.0)
          ),
          color: Colors.black
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              mem.write(item, widget.tag);
              Navigator.pop(context);
            },
            child: Text(
                item.replaceAll("_", " "),
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(color: tagTextColor, fontSize: 20)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final mem = GetStorage();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Change to:",
          style: TextStyle(color: tagTextColor, fontSize: 25)
        ),
        //const SizedBox(width: 5),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 10,
          runAlignment: WrapAlignment.spaceEvenly,
          children: [
            for(int i=0; i< AppData.tagList.length; i++)
              getTagContainer(AppData.tagList[i]),
          ],
        )
      ],
    );
  }
}
