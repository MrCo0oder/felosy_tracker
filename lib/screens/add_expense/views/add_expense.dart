import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';
import 'gradiant_text.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  int? _selectedCategoryId;
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(_selectedCategoryId);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Expenses',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '\$ ',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                GradientText(
                                  '20',
                                  style: const TextStyle(
                                      fontSize: 46,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.tertiary,
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).colorScheme.primary,
                                    ],
                                    transform: const GradientRotation(pi / 4),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return ListTile(
                          contentPadding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 15, vertical: 10),
                          tileColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onTap:() {
                            _chooseAnAction(index, context);
                          },
                          dense: false,
                          leading:
                              Stack(alignment: Alignment.center, children: [
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        Theme.of(context).colorScheme.outline)),
                            const Icon(
                              Icons.category_rounded,
                              color: Colors.white,
                            )
                          ]),
                          title: Text(
                            mainData[0]['name'],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20, vertical: 40),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.tertiary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.primary
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(17),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _chooseAnAction(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          _showSelectableDialog(context);
        }
      case 1:
        {

        }
      case 2:
        {

        }
    }
  }

  Future<void> _showSelectableDialog(BuildContext context) async {
    final int? selectedCatId =await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Category'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: mainData.length, // Set the number of items in your list
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(mainData[index]['category']),
                  leading: Stack(alignment: Alignment.center, children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mainData[index]['color']),
                    ),
                    mainData[index]['icon']
                  ]),
                  onTap: () {
                    if (kDebugMode) {
                      print(_selectedCategoryId);
                    }
                    Navigator.of(context)
                        .pop(index); // Return selected index when tapped
                  },
                );
              },
            ),
          ),
        );
      },
    );
    if (selectedCatId != null) {
      setState(() {
        _selectedCategoryId =selectedCatId;

      });
    }
  }
}


