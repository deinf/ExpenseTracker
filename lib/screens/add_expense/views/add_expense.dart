import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myCategoryIcon = ['entertainment', 'food', 'home', 'pet', 'shopping', 'tech', 'travel'];

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Add Expenses",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: expenseController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          FontAwesomeIcons.dollarSign,
                          size: 16,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: categoryController,
                  readOnly: true,
                  onTap: () {},
                  decoration: InputDecoration(
                      hintText: "Category",
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.list,
                        size: 16,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              bool isExpanded = false;
                              String selectedIcon = '';
                              Color categoryColor = Colors.white;
                              return StatefulBuilder(builder: (context, setState) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey.shade100,
                                  title: const Text("Create a Category"),
                                  content: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          // controller: dateController,
                                          onTap: () {
                                            setState(() {
                                              if (isExpanded == true) {
                                                isExpanded = false;
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                              isDense: true,
                                              hintText: "Name",
                                              hintStyle: const TextStyle(color: Colors.grey),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          // controller: dateController,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              hintText: "Icon",
                                              hintStyle: const TextStyle(color: Colors.grey),
                                              fillColor: Colors.white,
                                              filled: true,
                                              suffixIcon: const Icon(
                                                CupertinoIcons.chevron_down,
                                                size: 12,
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: isExpanded
                                                      ? const BorderRadius.vertical(top: Radius.circular(12))
                                                      : BorderRadius.circular(12),
                                                  borderSide: BorderSide.none)),
                                        ),
                                        !isExpanded
                                            ? Container()
                                            : Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: 200,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: GridView.builder(
                                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
                                                    itemCount: myCategoryIcon.length,
                                                    shrinkWrap: true,
                                                    itemBuilder: (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedIcon = myCategoryIcon[index];
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                width: 3,
                                                                color: selectedIcon == myCategoryIcon[index]
                                                                    ? Colors.green
                                                                    : Colors.grey,
                                                              ),
                                                              borderRadius: BorderRadius.circular(12),
                                                              image: DecorationImage(
                                                                  image: AssetImage("assets/${myCategoryIcon[index]}.png"))),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          // controller: dateController,
                                          readOnly: true,
                                          onTap: () {
                                            setState(() {
                                              if (isExpanded == true) {
                                                isExpanded = false;
                                              }
                                            });

                                            showDialog(
                                                context: context,
                                                builder: (ctx2) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        ColorPicker(
                                                          pickerColor: categoryColor,
                                                          onColorChanged: (value) {
                                                            setState(() {
                                                              categoryColor = value;
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(
                                                          width: double.infinity,
                                                          height: 50,
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(ctx2);
                                                              },
                                                              style: TextButton.styleFrom(
                                                                  backgroundColor: Colors.black,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(12))),
                                                              child: const Text(
                                                                'Save Color',
                                                                style: TextStyle(fontSize: 22, color: Colors.white),
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          decoration: InputDecoration(
                                              isDense: true,
                                              hintText: "Color",
                                              hintStyle: const TextStyle(color: Colors.grey),
                                              fillColor: categoryColor,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: kToolbarHeight,
                                          child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                            child: const Text(
                                              "Save",
                                              style: TextStyle(color: Colors.white, fontSize: 22),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          );
                        },
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)));

                    if (newDate != null) {
                      setState(() {
                        dateController.text = DateFormat("dd/MM/yyyy").format(newDate);
                        selectDate = newDate;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Date",
                      hintStyle: const TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.clock,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  height: kToolbarHeight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
