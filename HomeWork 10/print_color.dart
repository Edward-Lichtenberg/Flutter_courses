//Замена цвета принта
void printRed(String text) {
  print('❌ \x1B[31m$text\x1B[0m');
}

void printGreen(String text) {
  print('😁 🙌 \x1B[32m$text\x1B[0m');
}

void printYellow(String text) {
  print('😝 \x1B[33m$text\x1B[0m');
}

void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
}

void printMagenta(String text) {
  print('\x1B[35m$text\x1B[0m');
}

void printCyan(String text) {
  print('\x1B[36m$text\x1B[0m');
}
// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m
// Smile: Win + .