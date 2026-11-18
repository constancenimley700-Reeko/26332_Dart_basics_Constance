// ================================================================
// DART BASICS ASSIGNMENT
// Variables, Strings, Control Flow & Functions
// Registration Number: 26332
// D = 2 | T = 32
// Student: Constance B Nimley
// Initials: CBN
// Dart 3
//
// Complete executable answers for Parts A, B, C, D and E.
// Run: dart run 26332_dart_basics_all_questions.dart
//
// B1 NOTE: The original expression city * 2 is invalid in Dart.
// It is shown as a comment so this complete program can compile.
// ================================================================

// ----------------------- PART A: VARIABLES ------------------------

void answerA1() {
  // by CBN
  print('\n================ PART A1: VARIABLES AND OPERATORS ================');
  int a = 17;
  int b = 5;

  print(a / b);                 // 3.4: normal division
  print(a ~/ b);                // 3: integer division
  print(a % b);                 // 2: remainder
  print(-a % b);                // 3: remainder with positive divisor
  print(-a ~/ b);               // -3: truncates toward zero
  print(-17.abs());             // -17: negative of absolute value
  print(0.1 + 0.2 == 0.3);      // false: floating-point precision
  print(10 == 10.0);            // true: numerically equal
}

void answerA2() {
  // by CBN
  print('\n================ PART A2: PERSONAL NUMBERS ======================');
  int x = 2; // D: last digit of registration number 26332
  int y = 32; // T: last two digits of registration number 26332

  var z = x * 2 + y ~/ 4;
  z += x;

  print(z);                     // 14
  print(z.isEven);              // true
  print('$z' + '$x');           // 142

  // z is int. Dart infers its type from the integer initializer expression.
}

// --------------------------- PART B: STRINGS -----------------------

void answerB1() {
  // by CBN
  print('\n================ PART B1: STRINGS ===============================');
  String city = 'Kigali';

  print(city.length);                   // 6
  print(city[city.length - 1]);         // i
  print(city.substring(2, 4));          // ga
  print(city.toUpperCase().indexOf('A')); // 3
  print(city.contains('k'));            // false
  print('$city.length');                // Kigali.length
  print('${city.length}');              // 6

  // Original assignment line: print(city * 2);
  // Compile-time error: Dart does not support String * int.

  city.toUpperCase();                  // Returns a new String; city is unchanged.
  print(city);                         // Kigali
  print(city.replaceAll('i', '!'));    // K!gal!
  print('5' + 5.toString());            // 55
  print(int.parse('5') + 5);            // 10
}

int countVowels(String text) {
  // by CBN
  String lowerText = text.toLowerCase();
  int count = 0;
  int i = 0;

  while (i < lowerText.length) {
    if ('aeiou'.contains(lowerText[i])) {
      count++;
    }
    i++;
  }
  return count;
}

void answerB2() {
  // by CBN
  print('\n================ PART B2: COUNT VOWELS ==========================');
  String fullName = 'Constance B Nimley';
  int numberOfVowels = countVowels(fullName);
  print('$fullName has $numberOfVowels vowels');

  // toLowerCase() makes capital vowels count as well.
}

// ----------------------- PART C: CONTROL FLOW ----------------------

void answerC1() {
  // by CBN
  print('\n================ PART C1: CONTINUE AND BREAK ====================');
  for (int i = 0; i < 6; i++) {
    if (i == 2) continue;
    if (i == 4) break;
    print(i);
  }
}

void answerC2() {
  // by CBN
  print('\n================ PART C2: SWITCH (DAY = 2) ======================');
  int day = 2;

  switch (day) {
    case 1:
    case 2:
      print('Early week');
    case 3:
      print('Midweek');
    default:
      print('Weekend soon');
  }

  print('\nC2 with day = 1:');
  day = 1;

  switch (day) {
    case 1:
    case 2:
      print('Early week');
    case 3:
      print('Midweek');
    default:
      print('Weekend soon');
  }

  // Dart 3 prevents implicit fall-through. Empty adjacent labels
  // (case 1 and case 2) share the same body.
}

void answerC3() {
  // by CBN
  print('\n================ PART C3: NULL AND DO-WHILE =====================');
  int? bonus;

  print(bonus ?? 50); // 50
  bonus ??= 70;
  bonus ??= 90;
  print(bonus);       // 70

  int n = 10;
  do {
    print(n);         // do-while runs at least once
    n += 3;
  } while (n < 10);
}

void answerC4() {
  // by CBN
  print('\n================ PART C4: PERSONAL CONTROL FLOW ================');
  int x = 2; // D = 2
  String result = '';

  while (x > 0) {
    if (x % 2 == 0) {
      result += 'E';
    } else {
      result += 'O';
    }
    x -= 3;
  }

  print(result); // E
  print(result.length); // 1
  print(result.isEmpty ? 'nothing' : result[0]); // E
}

// --------------------------- PART D: FUNCTIONS ---------------------

int globalCount = 1;

void bump() {
  // by CBN
  int count = 10;
  count++;
  // This local count does not change globalCount.
}

void doubleIt(int value) {
  // by CBN
  value = value * 2;
  // Only the local parameter changes; v in main remains unchanged.
}

int addVat(int price, {int rate = 18}) {
  // by CBN
  return price + price * rate ~/ 100;
}

void answerD1() {
  // by CBN
  print('\n================ PART D1: FUNCTIONS =============================');
  bump();
  print(globalCount); // 1

  int v = 5;
  doubleIt(v);
  print(v); // 5

  print(addVat(1000)); // 1180
  print(addVat(999)); // 1178
  print(addVat(1000, rate: 0)); // 1000

  // 18% of 999 = 179.82; ~/ truncates this to 179.
  // Therefore 999 + 179 = 1178.
}

int momoFee(int amount) {
  // by CBN
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  // by CBN
  if (phone.length != 10) {
    return 'INVALID';
  }
  return phone.substring(0, 3) + '*****' + phone.substring(8);
}

void answerD2() {
  // by CBN
  print('\n================ PART D2: MOMO RECEIPT PRINTER =================');
  String phone = '0788123456';
  int i = 1;
  int totalFees = 0;

  while (i <= 2 + 3) {
    int amount = i * 4000 + 32 * 100;
    int fee = momoFee(amount);
    totalFees += fee;

    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }

  print('Total fees: $totalFees RWF');
  // Receipt 2 is the first receipt in the 250 RWF fee band.
}

// ----------------------- PART E: FIND AND FIX ----------------------

String grade(int mark) {
  // by CBN
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }
  return 'F';
}

bool isPalindrome(String word) {
  // by CBN
  word = word.toLowerCase();
  int i = 0;

  while (i < word.length ~/ 2) {
    if (word[i] != word[word.length - 1 - i]) {
      return false;
    }
    i++;
  }
  return true;
}

void answerE() {
  // by CBN
  print('\n================ PART E: FIND AND FIX ===========================');
  print('grade(85) = ${grade(85)}'); // A
  print("isPalindrome('level') = ${isPalindrome('level')}"); // true
  print("isPalindrome('Level') = ${isPalindrome('Level')}"); // true
  print("isPalindrome('hello') = ${isPalindrome('hello')}"); // false

  // Original grade(85) returned C because >= 50 was tested first.
  // Original palindrome indexing used word.length - i, which can
  // access an index outside the String. Correct index is length - 1 - i.
}

// ----------------------------- MAIN --------------------------------

void main() {
  // by CBN
  print('==============================================================');
  print('DART BASICS ASSIGNMENT — REGISTRATION NUMBER 26332');
  print('D = 2 | T = 32 | STUDENT: CONSTANCE B NIMLEY');
  print('==============================================================');

  answerA1();
  answerA2();
  answerB1();
  answerB2();
  answerC1();
  answerC2();
  answerC3();
  answerC4();
  answerD1();
  answerD2();
  answerE();

  print('\n================ ASSIGNMENT COMPLETED =======================');
}
