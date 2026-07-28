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
      title: "Settings UI",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // Switch
  bool notifications = true;

  // Toggle Buttons
  List<bool> selectedTheme = [false, true];
  String currentTheme = "Dark";

  // Radio
  String gender = "Female";

  // Checkbox
  bool accepted = true;

  // Slider
  double fontSize = 20;

  // Choice Chip
  String selectedInterest = "Flutter";

  // Stepper
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Switch

            const Row(
              children: [
                Icon(Icons.notifications,color: Colors.deepPurple),
                SizedBox(width:10),
                Text(
                  "Enable Notifications",
                  style: TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SwitchListTile(
              value: notifications,
              activeColor: Colors.deepPurple,
              title: Text(
                notifications
                    ? "Notifications : Enabled"
                    : "Notifications : Disabled",
              ),
              onChanged: (value){
                setState(() {
                  notifications=value;
                });
              },
            ),

            const Divider(),

            // Theme

            const Text(
              "Choose Theme",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                isSelected: selectedTheme,
                onPressed: (index){
                  setState(() {

                    for(int i=0;i<selectedTheme.length;i++){
                      selectedTheme[i]=i==index;
                    }

                    currentTheme=index==0?"Light":"Dark";

                  });
                },
                children: const [

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:25,
                        vertical:10),
                    child: Row(
                      children: [
                        Icon(Icons.light_mode),
                        SizedBox(width:5),
                        Text("Light"),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:25,
                        vertical:10),
                    child: Row(
                      children: [
                        Icon(Icons.dark_mode),
                        SizedBox(width:5),
                        Text("Dark"),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height:10),

            Text(
              "Selected Theme : $currentTheme",
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),
                        // Radio Buttons

            const Text(
              "Select Gender",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              value: "Male",
              groupValue: gender,
              title: const Text("Male"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile<String>(
              value: "Female",
              groupValue: gender,
              title: const Text("Female"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile<String>(
              value: "Other",
              groupValue: gender,
              title: const Text("Other"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            Text(
              "Selected Gender : $gender",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const Divider(),

            // Checkbox

            CheckboxListTile(
              value: accepted,
              title: const Text("Accept Terms & Conditions"),
              activeColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  accepted = value!;
                });
              },
            ),

            Text(
              accepted
                  ? "Terms Accepted"
                  : "Terms Not Accepted",
              style: TextStyle(
                color: accepted ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),

            // Slider

            const Text(
              "Adjust Font Size",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: fontSize,
              min: 10,
              max: 40,
              divisions: 30,
              label: fontSize.round().toString(),
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),

            Center(
              child: Text(
                "Flutter is Awesome!",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(),

            // Choice Chips

            const Text(
              "Choose Your Interests",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [

                ChoiceChip(
                  label: const Text("Flutter"),
                  selected: selectedInterest == "Flutter",
                  onSelected: (value) {
                    setState(() {
                      selectedInterest = "Flutter";
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text("AI"),
                  selected: selectedInterest == "AI",
                  onSelected: (value) {
                    setState(() {
                      selectedInterest = "AI";
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text("Web"),
                  selected: selectedInterest == "Web",
                  onSelected: (value) {
                    setState(() {
                      selectedInterest = "Web";
                    });
                  },
                ),

                ChoiceChip(
                  label: const Text("Game Dev"),
                  selected: selectedInterest == "Game Dev",
                  onSelected: (value) {
                    setState(() {
                      selectedInterest = "Game Dev";
                    });
                  },
                ),

              ],
            ),

            const SizedBox(height: 10),

            Text(
              "Selected Interest : $selectedInterest",
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),
                        // Action Chips

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [

                ActionChip(
                  avatar: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  onPressed: () {
                    setState(() {
                      notifications = true;
                      selectedTheme = [false, true];
                      currentTheme = "Dark";
                      gender = "Female";
                      accepted = true;
                      fontSize = 20;
                      selectedInterest = "Flutter";
                      currentStep = 0;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Settings Reset Successfully"),
                      ),
                    );
                  },
                ),

                ActionChip(
                  avatar: const Icon(Icons.save),
                  label: const Text("Save"),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Settings Saved Successfully"),
                      ),
                    );
                  },
                ),

              ],
            ),

            const Divider(),

            // Stepper

            const Text(
              "Profile Setup",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Stepper(
              currentStep: currentStep,

              onStepContinue: () {
                if (currentStep < 2) {
                  setState(() {
                    currentStep++;
                  });
                }
              },

              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                  });
                }
              },

              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },

              steps: const [

                Step(
                  title: Text("Account"),
                  content: Text("Setup your account"),
                  isActive: true,
                ),

                Step(
                  title: Text("Profile"),
                  content: Text("Complete your profile"),
                  isActive: true,
                ),

                Step(
                  title: Text("Finish"),
                  content: Text("All Done!"),
                  isActive: true,
                ),

              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Settings Saved Successfully!",
                      ),
                    ),
                  );

                },

                child: const Text(
                  "Save Settings",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}