List<List<DateTime>> getDateTimeForCalendar(DateTime initialDate) {
  var date = new DateTime(initialDate.year, initialDate.month + 1, 0);
  //get lastday of month
  int lastdate = date.day;
  List<DateTime> t2 = new List<DateTime>();
  List<DateTime> t3 = new List<DateTime>();
  List<DateTime> t4 = new List<DateTime>();
  List<DateTime> t5 = new List<DateTime>();
  List<DateTime> t6 = new List<DateTime>();
  List<DateTime> t7 = new List<DateTime>();
  List<DateTime> cn = new List<DateTime>();

  //count item in each kind
  int count = 0;
  for (var i = 1; i <= lastdate; i++) {
    var date = new DateTime(initialDate.year, initialDate.month, i);
    print("weekday ${date.weekday}");
    if (date.weekday == 1) {
      t2.add(date);
    }
    if (date.weekday == 2) {
      t3.add(date);
    }
    if (date.weekday == 3) {
      t4.add(date);
    }
    if (date.weekday == 4) {
      t5.add(date);
    }
    if (date.weekday == 5) {
      t6.add(date);
    }
    if (date.weekday == 6) {
      t7.add(date);
    }
    if (date.weekday == 7) {
      cn.add(date);
    }
    //check downline
    if (date.weekday == 7) {
      count++;
      if (t2.length < count) {
        t2.add(null);
      }
      if (t3.length < count) {
        t3.add(null);
      }
      if (t4.length < count) {
        t4.add(null);
      }
      if (t5.length < count) {
        t5.add(null);
      }
      if (t6.length < count) {
        t6.add(null);
      }
      if (t7.length < count) {
        t7.add(null);
      }
      if (cn.length < count) {
        cn.add(null);
      }
    }
  }
  if (t2.length > count) {
    count++;
  } else
  if (t3.length > count) {
    count++;
  } else
  if (t4.length > count) {
    count++;
  } else
  if (t5.length > count) {
    count++;
  } else
  if (t6.length > count) {
    count++;
  } else
  if (t7.length > count) {
    count++;
  } else
  if (cn.length > count) {
    count++;
  }

  if (t2.length < count) {
    t2.add(null);
  }
  if (t3.length < count) {
    t3.add(null);
  }
  if (t4.length < count) {
    t4.add(null);
  }
  if (t5.length < count) {
    t5.add(null);
  }
  if (t6.length < count) {
    t6.add(null);
  }
  if (t7.length < count) {
    t7.add(null);
  }
  if (cn.length < count) {
    cn.add(null);
  }
  print("count ${count}");
  print("t2 ${t2.toString()}");
  print("t3 ${t3.toString()}");
  print("t4 ${t4.toString()}");
  print("t5 ${t5.toString()}");
  print("t6 ${t6.toString()}");
  print("t7 ${t7.toString()}");
  print("cn ${cn.toString()}");
  return [t2, t3, t4, t5, t6, t7, cn];
}


