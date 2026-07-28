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
      title: "Student Registration",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StudentRegistration(),
    );
  }
}

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() =>
      _StudentRegistrationState();
}

class _StudentRegistrationState
    extends State<StudentRegistration> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  String? selectedCourse;

  final List<String> courses = [
    "B.Tech Computer Science",
    "B.Tech AI",
    "BCA",
    "MCA",
    "MBA",
    "B.Com",
  ];

  void resetForm() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    rollController.clear();
    cityController.clear();

    setState(() {
      selectedCourse = null;
    });
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 35,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Student Registered Successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                buildRow(
                    "Name",
                    nameController.text),

                buildRow(
                    "Email",
                    emailController.text),

                buildRow(
                    "Mobile",
                    mobileController.text),

                buildRow(
                    "Roll No",
                    rollController.text),

                buildRow(
                    "Course",
                    selectedCourse!),

                buildRow(
                    "City",
                    cityController.text),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.pop(context);

                    },
                    child: const Text("OK"),
                  ),
                )

              ],
            ),
          );
        },
      );
    }
  }

  Widget buildRow(
      String title,
      String value,
      ) {

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 4),
      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          SizedBox(
            width: 70,
            child: Text(
              "$title :",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(value),
          )

        ],
      ),
    );
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              const CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffEDE7F6),
                child: Icon(
                  Icons.school,
                  color: Colors.deepPurple,
                  size: 40,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Student Registration",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Please fill in the details to register",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your full name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!value.contains("@")) {
                    return "Enter valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Mobile Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter mobile number";
                  }

                  if (value.length != 10) {
                    return "Enter 10 digit mobile number";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: rollController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Roll Number",
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter roll number";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: selectedCourse,

                decoration: const InputDecoration(
                  labelText: "Course",
                  prefixIcon: Icon(Icons.menu_book),
                  border: OutlineInputBorder(),
                ),

                items: courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },

                validator: (value) {
                  if (value == null) {
                    return "Please select course";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: "City",
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter city";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),
                            Row(
                children: [

                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: resetForm,
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      onPressed: submitForm,
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    rollController.dispose();
    cityController.dispose();
    super.dispose();
  }
}