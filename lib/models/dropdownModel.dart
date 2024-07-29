import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropdownKategori {
  // final String label;
  final IconData icon;

  const DropdownKategori({required this.icon});
}

class DropdownKategoriWidget {
  static const List<DropdownKategori> listItems = [item1, item2, item3, item4];

  static const item1 = DropdownKategori(icon: FontAwesomeIcons.bottleWater);
  static const item2 = DropdownKategori(icon: FontAwesomeIcons.carrot);
  static const item3 = DropdownKategori(icon: FontAwesomeIcons.soap);
  static const item4 = DropdownKategori(icon: FontAwesomeIcons.listUl);

  static Widget buildList(DropdownKategori item, lebel) {
    return ClipRRect(
      child: SizedBox(
        height: 50.0,
        // child: Icon(item.icon),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  item.icon,
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(lebel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
