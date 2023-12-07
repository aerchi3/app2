import 'package:app2/utils/dialog_box.dart';
import 'package:flutter/material.dart';

class BuildCard extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String dateNtime;
  final String machine;
  final String status;
  final String event;
  //final String comments;

  const BuildCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.dateNtime,
    required this.machine,
    required this.status,
    required this.event,
    //required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        width: screenHeight * 0.8, // Adjust width if needed
        height: screenHeight * 0.4, // Adjust height if needed
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoWidget(
                  dateNtime: dateNtime,
                  machine: machine,
                  status: status,
                  event: event,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String dateNtime;
  final String machine;
  final String status;
  final String event;

  const InfoWidget({
    Key? key,
    required this.dateNtime,
    required this.machine,
    required this.status,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            dateNtime,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 108, 129),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          machine,
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 108, 129),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Status: ',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                status,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Event: ',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                event,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
