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
      title: 'Student Information Portal',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StudentPortal(),
    );
  }
}

class StudentPortal extends StatefulWidget {
  const StudentPortal({super.key});

  @override
  State<StudentPortal> createState() => _StudentPortalState();
}

class _StudentPortalState extends State<StudentPortal> {

  int currentIndex = 0;

  final Map<String, String> student = {
    "name": "Rahul Sharma",
    "email": "rahul@gmail.com",
    "mobile": "+91 9876543210",
    "roll": "CS202501",
    "website": "www.fluttercollege.com",
  };

  final List<List<String>> marks = [
    ["Mathematics", "100", "95"],
    ["Science", "100", "90"],
    ["English", "100", "88"],
    ["Computer", "100", "98"],
    ["Hindi", "100", "85"],
  ];

  void showStudentActions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 15),

              const Text(
                "Student Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const Divider(),

              buildTile(Icons.email, "Send Email"),
              buildTile(Icons.call, "Call Student"),
              buildTile(Icons.location_on, "View Address"),
              buildTile(Icons.share, "Share Profile"),
              buildTile(Icons.download, "Download Marksheet"),
              buildTile(Icons.close, "Close"),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget buildTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.deepPurple,
      ),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$title Successfully!"),
            action: SnackBarAction(
              label: "UNDO",
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Information Portal"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: Padding(
                padding: const EdgeInsets.all(12),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text(
                          "Student Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 15),

                    infoRow(
                      Icons.person,
                      "Student Name",
                      student["name"]!,
                    ),

                    infoRow(
                      Icons.email,
                      "Email",
                      student["email"]!,
                    ),

                    infoRow(
                      Icons.phone,
                      "Mobile",
                      student["mobile"]!,
                    ),

                    infoRow(
                      Icons.badge,
                      "Roll Number",
                      student["roll"]!,
                    ),

                    infoRow(
                      Icons.language,
                      "College Website",
                      student["website"]!,
                    ),

                    const SizedBox(height: 20),
                                        Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Row(
                              children: [

                                Icon(
                                  Icons.table_chart,
                                  color: Colors.deepPurple,
                                ),

                                SizedBox(width: 10),

                                Text(
                                  "Student Marksheet",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(height: 15),

                            Table(
                              border: TableBorder.all(
                                color: Colors.grey,
                              ),

                              columnWidths: const {
                                0: FlexColumnWidth(2.5),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth(),
                              },

                              children: [

                                const TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                  ),
                                  children: [

                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "Subject",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "Max",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "Marks",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                                ...marks.map(
                                  (row) => TableRow(
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(row[0]),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(row[1]),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                          child: Text(
                                            row[2],
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(height: 20),

                            Row(
                              children: [

                                Expanded(
                                  child: Card(
                                    color: Colors.deepPurple.shade50,
                                    child: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        children: [

                                          Icon(
                                            Icons.assignment,
                                            color: Colors.deepPurple,
                                          ),

                                          SizedBox(height: 5),

                                          Text(
                                            "Total",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          SelectableText(
                                            "456 / 500",
                                            style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Card(
                                    color: Colors.deepPurple.shade50,
                                    child: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        children: [

                                          Icon(
                                            Icons.percent,
                                            color: Colors.orange,
                                          ),

                                          SizedBox(height: 5),

                                          Text(
                                            "Percentage",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          SelectableText(
                                            "91.2%",
                                            style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Card(
                                    color: Colors.deepPurple.shade50,
                                    child: const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        children: [

                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),

                                          SizedBox(height: 5),

                                          Text(
                                            "Grade",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 5),

                                          SelectableText(
                                            "A+",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(height: 20),
                              SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                ),
                                onPressed: showStudentActions,
                                icon: const Icon(
                                  Icons.list,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Show Student Actions",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ),
        ]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget infoRow(
    IconData icon,
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 20,
          ),

          const SizedBox(width: 10),

          SizedBox(
            width: 110,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}