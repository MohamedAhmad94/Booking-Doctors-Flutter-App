import 'package:DoctorsBooking/widgets/customappbar.dart';
import 'package:DoctorsBooking/widgets/doctordata.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>
    with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xff00BBDC),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(0.0, 100.0),
          child: CustomAppBar(
              100,
              "My Appointments",
              TabBar(
                tabs: [
                  Text("Upcoming"),
                  Text("History"),
                ],
                controller: tabController,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.white30,
                unselectedLabelStyle: TextStyle(
                    color: Colors.white30,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.white, width: 1.0),
                ),
              ),
              "Appointments"),
        ),
      ),
      body: TabBarView(
        children: [
          Upcoming(),
          History(),
        ],
        controller: tabController,
      ),
    );
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Map<int, List> previousAppointments = {
    0: [
      "Dr. Ahmed Saber",
      "Dental",
      "Date: 20-Nov-2020",
      "Time: 06:30 PM",
      "https://pulse.doctor/media_/images/photos/doctor4.jpg"
    ],
    1: [
      "Dr. Ahmed Ali",
      "Cardio",
      "Date: 25-Nov-2020",
      "Time: 08:30 PM",
      "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"
    ],
    2: [
      "Dr. Adel Hamed",
      "General",
      "Date: 10-Dec-2020",
      "Time: 03:30 PM",
      "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"
    ],
    3: [
      "Dr. Samia Omar",
      "Therapy",
      "Date: 10-Dec-2020",
      "Time: 10:00 PM",
      "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: previousAppointments.length,
        itemBuilder: (context, index) {
          return Doctors(
            doctorName: previousAppointments[index][0],
            type: previousAppointments[index][1],
            date: previousAppointments[index][2],
            time: previousAppointments[index][3],
            image: previousAppointments[index][4],
            className: "History",
          );
        },
      ),
    );
  }
}

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  Map<int, List> upcomingAppointments = {
    0: [
      "Dr. Ahmed Saber",
      "Dental",
      "Date: 20-Apr-2021",
      "Time: 06:30 PM",
      "https://pulse.doctor/media_/images/photos/doctor4.jpg"
    ],
    1: [
      "Dr. Ahmed Ali",
      "Cardio",
      "Date: 25-Apr-2021",
      "Time: 08:30 PM",
      "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"
    ],
    2: [
      "Dr. Adel Hamed",
      "General",
      "Date: 10-Apr-2021",
      "Time: 03:30 PM",
      "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"
    ],
    3: [
      "Dr. Samia Omar",
      "Therapy",
      "Date: 10-Apr-2021",
      "Time: 10:00 PM",
      "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: upcomingAppointments.length,
        itemBuilder: (context, index) {
          return Doctors(
            doctorName: upcomingAppointments[index][0],
            type: upcomingAppointments[index][1],
            date: upcomingAppointments[index][2],
            time: upcomingAppointments[index][3],
            image: upcomingAppointments[index][4],
            className: "Upcoming",
          );
        },
      ),
    );
  }
}
