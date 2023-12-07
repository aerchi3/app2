import 'package:flutter/material.dart';
import 'package:app2/pages/settings.dart';
import 'package:app2/dbhelper.dart';
import 'package:app2/widgets/buildcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _notificationData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      List<Map<String, dynamic>> data = await DatabaseHelper.getData();
      print("Data from database: $data");
      setState(() {
        _notificationData = data;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  Future<void> _deleteEntry(int index) async {
    try {
      // Assuming your Timestamp is a string
      String entryTimestamp = _notificationData[index]['Timestamp'];

      // Call a method to delete the entry from the database
      await DatabaseHelper.deleteEntry(entryTimestamp);

      // Update the local state to reflect the change
      setState(() {
        _notificationData.removeAt(index);
      });
    } catch (e) {
      print("Error deleting entry: $e");
    }
  }

  // Color _getCardColor(String field5) {
  //   // Customize the logic based on your requirements
  //   if (field5 == 'QA') {
  //     return Colors.green;
  //   } else if (field5 == 'QA') {
  //     return Colors.blue;
  //   } else {
  //     return Colors.black; // Default color or handle other cases
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _notificationData.length,
          itemBuilder: (context, index) {
            var entry = _notificationData[index];

            String field1 = entry['Event'];
            String field2 = entry['Machine'];
            String field3 = entry['Person'];
            String field4 = entry['Timestamp'];
            String field5 = entry['Status'];

            // Build a card with the entry data
            return Dismissible(
              key: Key(entry['id']
                  .toString()), // Assuming 'id' is a unique identifier
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _deleteEntry(index);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              child: BuildCard(
                screenHeight: screenWidth,
                screenWidth: screenWidth,
                dateNtime: field4,
                machine: field2,
                status: field5,
                event: field1,
              ),
            );
          },
        ),
      ),
    );
  }
}
