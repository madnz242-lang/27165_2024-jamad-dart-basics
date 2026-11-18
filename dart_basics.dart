// Student: Jamad NZIKOU MIERE
// Reg no: 27165_2024
const String regNo = '27165';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part B2
int countVowels(String text) {
  // by JNM
  String lower = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}

// Part B3
String initials(String fullName) {
  // by JNM
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';
  List<String> parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (String part in parts) {
    result += '${part[0].toUpperCase()}.';
  }
  return result;
}

// Part C5
void drawTriangle(int height) {
  // by JNM
  if (height <= 0) return;
  for (int row = 1; row <= height; row++) {
    String spaces = ' ' * (height - row);
    String symbol = row.isOdd ? '*' : '#';
    String chars = symbol * row;
    print('$spaces$chars');
  }
}

// Part D2 - 1
int momoFee(int amount) {
  // by JNM
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// Part D2 - 2
String maskPhone(String phone) {
  // by JNM
  if (phone.length != 10) return 'INVALID';
  String firstThree = phone.substring(0, 3);
  String lastTwo = phone.substring(8, 10);
  String stars = '';
  int i = 0;
  while (i < 5) {
    stars += '*';
    i++;
  }
  return '$firstThree$stars$lastTwo';
}

void main() {
  // by JNM
  print('Reg no: $regNo | D=$d | T=$t');

  // --- B2 Test ---
  print('\n--- B2 ---');
  String myName = 'Jamad NZIKOU MIERE';
  print('$myName has ${countVowels(myName)} vowels');

  // --- B3 Test ---
  print('\n--- B3 ---');
  print(initials(myName));
  print(initials('  ana   uwase  '));
  print("'${initials('   ')}'");

  // --- C5 Test ---
  print('\n--- C5 ---');
  drawTriangle(d + 3); // height = 8
  drawTriangle(0);
  drawTriangle(-2);

  // --- D2 Test ---
  print('\n--- D2 ---');
  int i = 1;
  int totalFees = 0;
  String recipient = maskPhone('0788123456');
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i: $amount RWF | fee $fee RWF | to $recipient');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
