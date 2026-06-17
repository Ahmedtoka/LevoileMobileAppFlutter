@echo off
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
start coverage/html/index.html