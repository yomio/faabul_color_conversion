import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:faabul_color_conversion/faabul_color_conversion.dart';

void main() {
  group('ColorWebStringExtension', () {
    test('asWebColor() returns correct web color for Black', () {
      const color = Color(0xff000000);
      expect(color.asWebColor(), '#ff000000');
    });
    test('asWebColor() returns correct web color for White', () {
      const color = Color(0xffffffff);
      expect(color.asWebColor(), '#ffffffff');
    });
    test('asWebColor() returns correct web color for Red', () {
      const color = Color.fromARGB(255, 255, 0, 0);
      expect(color.asWebColor(), '#ffff0000');
    });
    test('asWebColor() returns correct web color for Green', () {
      const color = Color.fromARGB(255, 0, 255, 0);
      expect(color.asWebColor(), '#ff00ff00');
    });
    test('asWebColor() returns correct web color for Blue', () {
      const color = Color.fromARGB(255, 0, 0, 255);
      expect(color.asWebColor(), '#ff0000ff');
    });
    test('asWebColor() returns correct web color for Transparent', () {
      const color = Color(0x00000000);
      expect(color.asWebColor(), '#00000000');
    });
    test('asWebColor() returns correct web color for White with 50% opacity',
        () {
      const color = Color(0x80ffffff);
      expect(color.asWebColor(), '#80ffffff');
    });
  });
  group('StringWebColorExtension', () {
    test('parseAsColor() correctly parses Black with Alpha', () {
      final color = '#ff000000'.parseAsColor();
      expect(color.value, 0xff000000);
    });
    test('parseAsColor() correctly parses White with Alpha', () {
      final color = '#ffffffff'.parseAsColor();
      expect(color.value, 0xffffffff);
    });
    test('parseAsColor() correctly parses Red with Alpha', () {
      final color = '#ffff0000'.parseAsColor();
      expect(color.value, 0xffff0000);
    });
    test('parseAsColor() correctly parses Green with Alpha', () {
      final color = '#ff00ff00'.parseAsColor();
      expect(color.value, 0xff00ff00);
    });
    test('parseAsColor() correctly parses Blue with Alpha', () {
      final color = '#ff0000ff'.parseAsColor();
      expect(color.value, 0xff0000ff);
    });
    test('parseAsColor() correctly parses White with 50% opacity', () {
      final color = '#80ffffff'.parseAsColor();
      expect(color.value, 0x80ffffff);
    });
    test('parseAsColor() correctly parses Black', () {
      final color = '#000000'.parseAsColor();
      expect(color.value, 0xff000000);
    });
    test('parseAsColor() correctly parses White', () {
      final color = '#ffffff'.parseAsColor();
      expect(color.value, 0xffffffff);
    });
    test('parseAsColor() correctly parses Red', () {
      final color = '#ff0000'.parseAsColor();
      expect(color.value, 0xffff0000);
    });
    test('parseAsColor() correctly parses Green', () {
      final color = '#00ff00'.parseAsColor();
      expect(color.value, 0xff00ff00);
    });
    test('parseAsColor() correctly parses Blue', () {
      final color = '#0000ff'.parseAsColor();
      expect(color.value, 0xff0000ff);
    });
    test('parseAsColor() correctly parses Uppercase color', () {
      final color = '#ABCDEF'.parseAsColor();
      expect(color.value, 0xffabcdef);
    });
    test('parseAsColor() correctly parses Mixed case color', () {
      final color = '#AbCdEf'.parseAsColor();
      expect(color.value, 0xffabcdef);
    });
    test('parseAsColor() throws FormatException for Missing or multiple #', () {
      expect(() => '000000'.parseAsColor(), throwsFormatException);
      expect(() => '##000000'.parseAsColor(), throwsFormatException);
    });
    test('parseAsColor() throws FormatException for Invalid characters', () {
      expect(() => '#ff00000g'.parseAsColor(), throwsFormatException);
      expect(() => '#fg000000'.parseAsColor(), throwsFormatException);
      expect(() => '#ff00000.'.parseAsColor(), throwsFormatException);
    });
    test('parseAsColor() throws FormatException for Invalid length', () {
      expect(() => '#ff0000000'.parseAsColor(), throwsFormatException);
      expect(() => '#ff00000'.parseAsColor(), throwsFormatException);
      expect(() => '#ff000.'.parseAsColor(), throwsFormatException);
    });
  });
}
