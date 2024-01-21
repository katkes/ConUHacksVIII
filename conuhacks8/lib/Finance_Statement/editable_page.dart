import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conuhacks8/Finance_Statement/ServerExpense.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'data/users.dart';
import 'model/userModel.dart';
import 'utils.dart';
import 'scrollable_widget.dart';
import 'text_dialog_widget.dart';
import 'package:flutter/material.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users = [];
  late double totalExpense = 0;

  List<Map<String, dynamic>> data = [];

  void addData(String nameOfFood, String price) {
    setState(() {
      data.add({'name': nameOfFood, 'price': price});
    });
  }

  @override
  void initState() {
    super.initState();
    GetAiDataFromDb();
    getUsersStatementInfo();
  }

  void GetAiDataFromDb() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference statementCollection = firestore.collection('expenses');

    try {
      QuerySnapshot querySnapshot = await statementCollection.get();

      List<ServerExpense> dbExpenses = [];

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Access data from each document
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        String expense = data['nameOfFood'];
        String priceString = data['price'];

        int price = double.parse(priceString).round();

        setState(() {
          users.add(User(firstName: expense, lastName: "Weekly", age: price));
        });

        print(price);
        print(expense);
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ScrollableWidget(child: buildDataTable()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addRow(),
          child: Icon(Icons.add),
        ),
      );

  double CalculateReport(int freq) {
    double expenseTotal = 0;
    if (freq == 0) {
      for (User user in users) {
        if (user.lastName == "Weekly") {
          expenseTotal += user.age;
        }
      }
    }

    if (freq == 1) {
      for (User user in users) {
        if (user.lastName == "Montly") {
          expenseTotal += user.age;
        }
      }
    }

    if (freq == 2) {
      for (User user in users) {
        expenseTotal += user.age;
      }
    }
    return expenseTotal;
  }

  Widget buildDataTable() {
    final columns = ['Expense', 'Occurrence', 'Price'];

    return Column(
      children: [
        DataTable(
          columns: getColumns(columns),
          rows: getRows(users),
        ),
        if (users.isNotEmpty) SizedBox(height: 16),
        if (users.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    double result = CalculateReport(0);
                    setState(() {
                      totalExpense = result;
                    });
                  },
                  child: Text('Weekly'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  double result = CalculateReport(1);
                  setState(() {
                    totalExpense = result;
                  });
                },
                child: Text('Montly'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    double result = CalculateReport(2);
                    setState(() {
                      totalExpense = result;
                    });
                  },
                  child: Text('All'),
                ),
              ),
            ],
          ),
        if (users.isNotEmpty) SizedBox(height: 16),
        if (users.isNotEmpty)
          Text(
            'Expense Total: $totalExpense\$',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(user);
                    break;
                  case 1:
                    editLastName(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Expense',
      value: editUser.firstName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }

  Future editLastName(User editUser) async {
    final lastName = await showTextDialog(
      context,
      title: 'Frequency',
      value: editUser.lastName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(lastName: lastName) : user;
        }).toList());
  }

  Future<void> getUsersStatementInfo() async {
    try {
      CollectionReference userStatementInfo =
          FirebaseFirestore.instance.collection('StatementInfo');

      QuerySnapshot querySnapshot = await userStatementInfo.get();

      List<User> userList = [];

      for (QueryDocumentSnapshot snap in querySnapshot.docs) {
        // Assuming 'firstName', 'lastName', and 'age' are fields in your Firestore documents
        String firstName = snap['firstName'];
        String lastName = snap['lastName'];
        int age = snap['age'];

        User user = User(firstName: firstName, lastName: lastName, age: age);
        userList.add(user);
      }

      setState(() {
        users = userList;
      });
    } catch (e) {
      print('Error retrieving users from Firestore: $e');
      throw e;
    }
  }

  void addRow() async {
    final firstName =
        await showTextDialog(context, title: 'Enter Expense', value: '');
    final lastName =
        await showTextDialog(context, title: 'Enter Frequency', value: '');
    final age = await showTextDialog(context, title: 'Enter Price', value: '');

    if (firstName != null && lastName != null && age != null) {
      final newUser =
          User(firstName: firstName, lastName: lastName, age: int.parse(age));
      setState(() => users = [...users, newUser]);

      WriteToDb(newUser);
    }
  }
}

void WriteToDb(User newUser) async {
  Auth.FirebaseAuth _auth = Auth.FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Auth.User? user = _auth.currentUser;
  String userId = "";
  if (user != null) {
    userId = user.uid;
  }

  CollectionReference statementCollection =
      firestore.collection('StatementInfo');

  await statementCollection.add({
    'firstName': newUser.firstName,
    'lastName': newUser.lastName,
    'age': newUser.age,
  });
}

void GetDataFromDb() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference statementCollection =
      firestore.collection('StatementInfo');

  for (User user in allUsers) {
    await statementCollection.add({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'age': user.age,
    });
  }
}

Future<List<ServerExpense>> getDataFromCollection(String collectionName) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collection = firestore.collection(collectionName);

  try {
    QuerySnapshot querySnapshot = await collection.get();

    List<ServerExpense> dbExpenses = [];

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // Access data from each document
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      dbExpenses.add(
          ServerExpense(nameOfFood: data['nameOfFood'], price: data['price']));
    }

    return dbExpenses;
  } catch (error) {
    print("Error fetching data from collection $collectionName: $error");
    throw error; // Re-throw the error to handle it in the calling code
  }
}
// ignore_for_file: prefer_const_constructors

final allUsers = <User>[
  User(firstName: 'Emma', lastName: 'Field', age: 37),
];
