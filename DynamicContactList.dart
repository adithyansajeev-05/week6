import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Dynamic contact list
  List<String> contacts = [];

  // Text controller
  TextEditingController controller =
      TextEditingController();

  // Category list
  List<String> categories = [
    "Family",
    "Friends",
    "Work",
    "College",
    "VIP",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xFFF3F6FD),

      appBar: AppBar(

        backgroundColor: Color(0xFF4A6CF7),

        title: Text(
          "Contacts",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(

        padding: EdgeInsets.all(15),

        child: Column(

          children: [

            // INPUT FIELD
            TextField(

              controller: controller,

              decoration: InputDecoration(

                filled: true,

                fillColor: Colors.white,

                hintText: "Enter contact name",

                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF4A6CF7),
                ),

                border: OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 15),

            // ADD CONTACT BUTTON
            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor:
                      Color(0xFF4A6CF7),

                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {

                  // CHECK EMPTY INPUT
                  if (controller.text.isNotEmpty) {

                    setState(() {

                      // ADD CONTACT
                      contacts.add(controller.text);

                      // CLEAR FIELD
                      controller.clear();
                    });
                  }
                },

                child: Text(

                  "Add Contact",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 18,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // CATEGORY GRID
            SizedBox(

              height: 170,

              child: CategoryGrid(
                categories: categories,
              ),
            ),

            SizedBox(height: 20),

            // DYNAMIC CONTACT LIST
            Expanded(

              child: ListView.builder(

                itemCount: contacts.length,

                itemBuilder: (context, index) {

                  return Card(

                    elevation: 3,

                    margin: EdgeInsets.only(bottom: 12),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: ListTile(

                      leading: CircleAvatar(

                        backgroundColor:
                            Color(0xFF4A6CF7),

                        child: Text(

                          contacts[index][0]
                              .toUpperCase(),

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      title: Text(

                        contacts[index],

                        style: TextStyle(
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),

                      subtitle: Text(
                        "Saved Contact",
                      ),

                      trailing: IconButton(

                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () {

                          setState(() {

                            // REMOVE CONTACT
                            contacts.removeAt(index);
                          });
                        },
                      ),
                    ),
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


// CATEGORY GRID WIDGET
class CategoryGrid extends StatelessWidget {

  final List<String> categories;

  CategoryGrid({
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.builder(

      itemCount: categories.length,

      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 3,

        crossAxisSpacing: 10,

        mainAxisSpacing: 10,
      ),

      itemBuilder: (context, index) {

        return Container(

          decoration: BoxDecoration(

            gradient: LinearGradient(

              colors: [
                Color(0xFF4A6CF7),
                Color(0xFF6A8DFF),
              ],
            ),

            borderRadius:
                BorderRadius.circular(15),
          ),

          child: Center(

            child: Text(

              categories[index],

              style: TextStyle(

                color: Colors.white,

                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}