import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class bottomSelectedValues extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;
  bottomSelectedValues({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().day.toString();
   
    print(startDate?.day);
    // if(startDate ==null || endDate==null){
    //   startDate= DateTime.now();
    //   endDate= DateTime.now();
    // }
//  int differenceInDays = endDate!.difference(startDate!).inDays ;
//  print("difffff");
//     print(differenceInDays);

    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return  Container(
            height: 90,
            margin: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 5,
                  ),
                ),
                // Gap(10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      startDate?.day.toString() ?? today,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'December',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Gap(10),
                WeekInnerWidget(
                    subCategory: 'HRD',
                    Count: '5',
                    avatharColor: Colors.lightBlueAccent),
                Gap(5),
                WeekInnerWidget(
                    subCategory: 'Tech1',
                    Count: '3',
                    avatharColor: Colors.lightBlueAccent),
                Gap(5),
                WeekInnerWidget(
                    subCategory: 'Follow',
                    Count: '2',
                    avatharColor: Colors.lightBlueAccent),
                Gap(5),
                WeekInnerWidget(
                    subCategory: 'Total',
                    Count: '10',
                    avatharColor: Colors.black),
              ],
            ));
      },
    );
  }
}

class WeekInnerWidget extends StatelessWidget {
  final String subCategory;
  final String Count;
  final Color avatharColor;
  const WeekInnerWidget({
    Key? key,
    required this.subCategory,
    required this.Count,
    required this.avatharColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: avatharColor,
          child: Center(
            child: Text(Count),
          ),
        ),
        Gap(5),
        Text(
          subCategory,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class DayInnerWidget extends StatelessWidget {
  
  const DayInnerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
   
       
      ],
    );
  }
}