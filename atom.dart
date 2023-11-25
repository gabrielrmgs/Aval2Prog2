import 'dart:convert';
import 'dart:io';

class Atom {
    final String _symbol;

    Atom(this._symbol);
    @override
    String toString() {
        return _symbol;
    }
}