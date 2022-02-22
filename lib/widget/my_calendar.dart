import 'package:beauti_calendar_widget/helper/datetime_caculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey<_MyCalendarState> calendarKey = GlobalKey<_MyCalendarState>();

class MyCalendar extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<List<DateTime>> onChange;
  const MyCalendar({Key key, this.initialDate, this.onChange}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  Size size;
  DateTime activeDate1;
  DateTime activeDate2;
  List<List<DateTime>> listDateTime;
  List<String> dateTitleName = ["T2","T3","T4","T5","T6","T7","CN"];
  DateTime initialDate;
  bool isDate1Choose = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialDate = widget.initialDate;
    activeDate1 = initialDate;
    activeDate2 = DateTime(initialDate.year, initialDate.month, initialDate.day + 1);
    listDateTime = getDateTimeForCalendar(initialDate);

  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(size.width * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(DateTime.now().year - 5, 1, 1),
                      maxTime: DateTime(DateTime.now().year + 1, 1, 1), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.vi);
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.015),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.05),
                      // color: Colors.blue.withOpacity(.4)
                  ),
                  child: Row(
                    children: [
                      Text("Tháng ${initialDate.month} Năm ${initialDate.year}", style:  GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.04
                      ),),
                      Icon(Icons.keyboard_arrow_down_sharp, size: size.width * 0.05,)
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                     setState(() {
                       initialDate = DateTime(initialDate.year, initialDate.month - 1, 1);
                       listDateTime = getDateTimeForCalendar(initialDate);
                     });
                    },
                    child: Icon(Icons.arrow_back_ios_outlined, size: size.width * 0.05, color: Colors.blue.shade700,),
                  ),
                  SizedBox(width: size.width * 0.04,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        initialDate = DateTime(initialDate.year, initialDate.month + 1, 1);
                        listDateTime = getDateTimeForCalendar(initialDate);
                      });
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined, size: size.width * 0.05, color: Colors.blue.shade700),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: size.height * 0.02,),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: dateTitleName.map((e) =>
                      Container(
                    width: (size.width - size.width * 0.02) / 8,
                    child: Center(
                      child: InkWell(
                        child: Text('${e}', style:  GoogleFonts.sourceSansPro(color: Colors.grey, fontSize: size.width * 0.045, fontWeight: FontWeight.w600),),
                      ),
                    ),
                  )).toList(),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: listDateTime.map((e){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: e.map((e){
                        return InkWell(
                          onTap: (){
                            setState(() {
                             if(isDate1Choose){
                               activeDate1 = e;

                             } else{
                               activeDate2 = e;
                             }
                             isDate1Choose = !isDate1Choose;
                            });
                            widget.onChange([activeDate1, activeDate2]);
                          },
                          child: Container(
                            decoration: isInDate(e, activeDate1, activeDate2)? BoxDecoration(
                              color: isTheSameDate(e, activeDate1, activeDate2) ? Colors.blueAccent.withOpacity(.8) : Colors.blueAccent.withOpacity(.1),
                              shape: isTheSameDate(e, activeDate1, activeDate2) ? BoxShape.circle : BoxShape.rectangle,
                            ) :  BoxDecoration(
                              
                            ),
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
                            margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
                            width: (size.width - size.width * 0.02) / 8,
                            child: Center(
                              child: Text(e == null ? "" : e.day.toString(), style:
                              GoogleFonts.sourceSansPro(color: Colors.black, fontSize: size.width * 0.047, fontWeight: FontWeight.w700),),
                            ),
                          ),
                        );
                      }
                      ).toList(),
                    );
                  }
                  ).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isInDate(DateTime d1, DateTime d2, DateTime d3){
    if(d1 == null){
      return false;
    }
    if(d2.difference(d3).inSeconds > 0){
       DateTime t = d2;
       d2 = d3;
       d3 = t;
    }
    return d1.difference(d2).inDays >= 0 && d1.difference(d3).inDays <= 0;
  }

  bool isTheSameDate(DateTime d1, DateTime d2, DateTime d3){

    return (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year) || (d1.day == d3.day && d1.month == d3.month && d1.year == d3.year)  ;
  }
}
