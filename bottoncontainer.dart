import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  final String? text1;
  final String? text2;

  const BottomContainer({
    super.key,
     this.text1,
     this.text2,
  });

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'widget.text1',
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'widget.text2',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.3,
            indent: 0,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
