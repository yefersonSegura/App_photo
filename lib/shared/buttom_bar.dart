import 'package:flutter/material.dart';

class ButtonBarWidget extends StatefulWidget {
  const ButtonBarWidget({super.key});

  @override
  State<ButtonBarWidget> createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  int nameSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item(Icons.grid_view_rounded, 0, false),
            item(Icons.search, 1, false),
            item(Icons.bookmark_outlined, 3, true),
            item(Icons.bookmark_outlined, 4, false),
            item(Icons.person, 5, false),
          ],
        ),
      ),
    );
  }

  InkWell item(IconData icon, int index, bool isUpload) {
    return InkWell(
      onTap: () {
        setState(() {
          nameSelected = index;
        });
      },
      child: !isUpload
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(
                    icon,
                    color: nameSelected == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.2),
                  ),
                ),
                if (nameSelected == index)
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 4
                    ),
                  )
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.5),
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.5),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
