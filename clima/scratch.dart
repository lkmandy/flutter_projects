import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();

  //(i) Prints Instance of 'Future<String>' because task2 hasn't completed
  // execution yet due to no await keyword
  print(task2());

  //(ii) Solves the problem in (i)
  String testData = await task2();

  //(iii) Prints exact value returned by task2()
  task3(testData);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2()  async{
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  // sleep(threeSeconds);
  await Future.delayed(threeSeconds, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}