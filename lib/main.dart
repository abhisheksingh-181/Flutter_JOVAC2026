import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Information",

      // Named Route
      routes: {
        "/edit": (context) => const EditCourseScreen(),
      },

      home: const HomeScreen(),
    );
  }
}

// ---------------- HOME SCREEN ----------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Controllers
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController rollController =
      TextEditingController();

  // Default Course
  String selectedCourse = "Flutter";

  // Updated Course
  String updatedCourse = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Information"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Student Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Name",
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Roll Number",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Roll Number",
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Select Course",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            DropdownButtonFormField<String>(

              value: selectedCourse,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),

              items: const [

                DropdownMenuItem(
                  value: "Flutter",
                  child: Text("Flutter"),
                ),

                DropdownMenuItem(
                  value: "Java",
                  child: Text("Java"),
                ),

                DropdownMenuItem(
                  value: "Python",
                  child: Text("Python"),
                ),

                DropdownMenuItem(
                  value: "AI",
                  child: Text("AI"),
                ),

              ],

              onChanged: (value) {

                setState(() {

                  selectedCourse = value!;

                });

              },

            ),

            const SizedBox(height: 25),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton.icon(

                icon: const Icon(Icons.visibility),

                label: const Text("View Details"),

                onPressed: () async {

                  final result =
                      await Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) =>
                          StudentDetailsScreen(

                        name: nameController.text,

                        rollNo:
                            rollController.text,

                        course:
                            selectedCourse,

                      ),

                    ),

                  );

                  if (result != null) {

                    setState(() {

                      updatedCourse = result;

                    });

                  }

                },

              ),

            ),

            const SizedBox(height: 20),

            if (updatedCourse.isNotEmpty)

              Card(

                color: Colors.green.shade50,

                child: Padding(

                  padding:
                      const EdgeInsets.all(12),

                  child: Text(

                    "Updated Course : $updatedCourse",

                    style: const TextStyle(

                      fontWeight:
                          FontWeight.bold,

                      color: Colors.green,

                    ),

                  ),

                ),

              ),

          ],

        ),

      ),

    );

  }

}
// ---------------- STUDENT DETAILS SCREEN ----------------

class StudentDetailsScreen extends StatelessWidget {
  final String name;
  final String rollNo;
  final String course;

  const StudentDetailsScreen({
    super.key,
    required this.name,
    required this.rollNo,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            Card(
              elevation: 5,

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Center(
                      child: Text(
                        "Student Details",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Name"),
                      subtitle: Text(name),
                    ),

                    ListTile(
                      leading: const Icon(Icons.badge),
                      title: const Text("Roll No"),
                      subtitle: Text(rollNo),
                    ),

                    ListTile(
                      leading: const Icon(Icons.school),
                      title: const Text("Course"),
                      subtitle: Text(course),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(

              icon: const Icon(Icons.edit),

              label: const Text("Edit Course"),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),

              onPressed: () async {

                final updatedCourse =
                    await Navigator.pushNamed(
                  context,
                  "/edit",
                  arguments: course,
                );

                if (updatedCourse != null) {

                  Navigator.pop(
                    context,
                    updatedCourse,
                  );

                }

              },

            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(

              icon: const Icon(Icons.arrow_back),

              label: const Text("Go Back"),

              onPressed: () {

                Navigator.pop(context);

              },

            ),

          ],
        ),
      ),
    );
  }
}

// ---------------- EDIT COURSE SCREEN ----------------

class EditCourseScreen extends StatefulWidget {
  const EditCourseScreen({super.key});

  @override
  State<EditCourseScreen> createState() =>
      _EditCourseScreenState();
}

class _EditCourseScreenState
    extends State<EditCourseScreen> {

  String selectedCourse = "Flutter";

  @override
  Widget build(BuildContext context) {

    // Receive current course
    final String currentCourse =
        ModalRoute.of(context)!.settings.arguments
            as String;

    selectedCourse = currentCourse;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Course"),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Center(
              child: Text(
                "Select New Course",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            RadioListTile<String>(
              title: const Text("Flutter"),
              value: "Flutter",
              groupValue: selectedCourse,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("Java"),
              value: "Java",
              groupValue: selectedCourse,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("Python"),
              value: "Python",
              groupValue: selectedCourse,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("AI"),
              value: "AI",
              groupValue: selectedCourse,
              onChanged: (value) {
                setState(() {
                  selectedCourse = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save Changes"),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),

                onPressed: () {

                  // Return updated course
                  Navigator.pop(
                    context,
                    selectedCourse,
                  );

                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}