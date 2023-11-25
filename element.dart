import 'dart:io';
import 'dart:convert';
import 'atom.dart';
const String FILEPATH = "elements.json";
class Element {

	final String _symbol;
	final String _name;
	final String _latinName;
	final int _weight;

	Element({
    required String symbol,
    required String name,
    required String latinName,
    required int weight,
  })  : _weight = weight,
        _latinName = latinName,
        _name = name,
        _symbol = symbol;


	String get symbol => Atom(_symbol).toString();
  	String get name => _name;
  	String get latinName => _latinName;
  	int get weight => _weight;
}