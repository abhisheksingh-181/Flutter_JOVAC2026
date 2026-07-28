import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Assignment Portal",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Student Assignment Portal",
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications),
          )
        ],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Card(

              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  children: [

                    const CircleAvatar(
                      radius: 45,
                      child: Icon(
                        Icons.assignment,
                        size: 50,
                      ),
                    ),

                    const SizedBox(height: 20),

                    buildRow(
                      "Assignment",
                      "Flutter UI Widgets",
                    ),

                    buildRow(
                      "Subject",
                      "Mobile App Development",
                    ),

                    buildRow(
                      "Faculty",
                      "Mr. Pankaj Kapoor",
                    ),

                    buildRow(
                      "Due Date",
                      "30 July 2026",
                    ),

                    buildRow(
                      "Marks",
                      "100",
                    ),

                    const SizedBox(height: 20),

                    SizedBox(

                      width: double.infinity,

                      child: ElevatedButton.icon(

                        onPressed: () {

                        },

                        icon: const Icon(Icons.upload),

                        label: const Text(
                          "Submit Assignment",
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(

                      width: double.infinity,

                      child: OutlinedButton.icon(
                        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const SubmitAssignmentScreen(),
    ),
  );
},

                        icon: const Icon(Icons.menu_book),

                        label: const Text(
                          "View Guidelines",
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Submission",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget buildRow(String title, String value) {

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(

        children: [

          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(value),
          ),

        ],
      ),
    );
  }
}
class SubmitAssignmentScreen extends StatefulWidget {
  const SubmitAssignmentScreen({super.key});

  @override
  State<SubmitAssignmentScreen> createState() =>
      _SubmitAssignmentScreenState();
}

class _SubmitAssignmentScreenState extends State<SubmitAssignmentScreen> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> pickDate() async {

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Submit Assignment"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Select Submission Date",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            InkWell(

              onTap: pickDate,

              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(

                  border: Border.all(),

                  borderRadius: BorderRadius.circular(10),

                ),

                child: Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                    ),

                    const Icon(Icons.calendar_today)

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Select Submission Time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            InkWell(

              onTap: pickTime,

              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(

                  border: Border.all(),

                  borderRadius: BorderRadius.circular(10),

                ),

                child: Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      selectedTime.format(context),
                    ),

                    const Icon(Icons.access_time)

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(

              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(

                border: Border.all(),

                borderRadius: BorderRadius.circular(10),

              ),

              child: const Row(

                children: [

                  Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      "assignment_flutter.pdf",
                    ),
                  ),

                  Icon(Icons.close)

                ],
              ),
            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {},

                child: const Text(
                  "Submit Assignment",
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
class UploadingScreen extends StatefulWidget {
  const UploadingScreen({super.key});

  @override
  State<UploadingScreen> createState() => _UploadingScreenState();
}

class _UploadingScreenState extends State<UploadingScreen> {

  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    startUpload();
  }

  void startUpload() async {

    while (progress < 0.65) {

      await Future.delayed(const Duration(milliseconds: 120));

      setState(() {
        progress += 0.01;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Uploading Assignment"),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.cloud_upload,
              size: 100,
              color: Colors.deepPurple,
            ),

            const SizedBox(height: 20),

            const Text(
              "Uploading Assignment...",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            SizedBox(

              width: 220,

              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${(progress * 100).toInt()} %",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SuccessScreen(),
                  ),
                );

              },

              child: const Text("Finish Upload"),
            )

          ],
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {

  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Submission Successful"),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Assignment Submitted Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text("Student : Rahul Sharma"),
            const Text("Assignment : Flutter UI Widgets"),
            const Text("Date : 28 July 2026"),
            const Text("Time : 03:30 PM"),

            const SizedBox(height: 40),

           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RatingScreen(),
      ),
    );
  },
  child: const Text("Back To Home"),

            )

          ],
        ),
      ),
    );
  }
}
class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {

  double rating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rate Your Experience"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "How was your assignment submission?",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                );
              }),
            ),

            const SizedBox(height: 20),

            Text(
              "$rating / 5",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GuidelinesScreen(),
                  ),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Guidelines"),
      ),

      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Assignment Guidelines",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text("• Build UI using Flutter widgets"),
            Text("• Follow good coding practices"),
            Text("• Submit before the last date"),
            Text("• Upload PDF or ZIP file"),

          ],
        ),
      ),
    );
  }
}

class TooltipDemoScreen extends StatelessWidget {
  const TooltipDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Tooltip Demo"),
      ),

      body: Center(

        child: Wrap(

          spacing: 20,
          runSpacing: 20,

          children: [

            Tooltip(
              message: "Select Date",
              child: Icon(Icons.calendar_month, size: 60),
            ),

            Tooltip(
              message: "Select Time",
              child: Icon(Icons.access_time, size: 60),
            ),

            Tooltip(
              message: "Upload File",
              child: Icon(Icons.upload_file, size: 60),
            ),

            Tooltip(
              message: "Rate Experience",
              child: Icon(Icons.star, size: 60),
            ),

            Tooltip(
              message: "Assignment Guidelines",
              child: Icon(Icons.menu_book, size: 60),
            ),

          ],
        ),
      ),
    );
  }
}