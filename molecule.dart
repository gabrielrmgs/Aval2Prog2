import 'dart:io'; 
import 'dart:convert';
import 'periodic_table.dart';
class Molecule implements Comparable<Molecule> {

  final String formula;
  final String name;
  
  Molecule({
    required String formula,
    required String name,
  })  : name = name,
        formula = formula;
  double formulaWeightAsInt(formula) {
    double finalWeight = 0.0;
    RegExp exp = RegExp(r'([A-Z][a-z]?[0-9]*)');
    String formulaToReg = formula;
    Iterable<RegExpMatch> matches = exp.allMatches(formulaToReg);
    List dividedFormulaList = [];
    for (final m in matches) {
      dividedFormulaList.add(m[0]);
    }
    RegExp exp2 = RegExp(r'([A-Z][a-z]?)');
    Iterable<RegExpMatch> matches2 = exp2.allMatches(dividedFormulaList.join());
    var atomSymbol = [];
    for (final v in matches2){
      atomSymbol.add(v[0]);
    };
    RegExp exp3 = RegExp(r'([0-9])+');
    Iterable<RegExpMatch> matches3 = exp3.allMatches(dividedFormulaList.join());
    var atomNumbers = [];
    for (final v in matches3){
      atomNumbers.add(v[0]);
    };
    PeriodicTable.elements.forEach(
    (_, element) {
      for (int i = 0; i < atomSymbol.length; i++){
        if(atomSymbol[i] == element.symbol){         
          finalWeight = finalWeight + element.weight;
        }         
        if(atomNumbers.length > i){
          int qnt = int.parse(atomNumbers[i]) - 1;        
          if(atomSymbol[i] == element.symbol){
            finalWeight += element.weight * qnt;
          } 
        }
      }
    });
    return finalWeight;
  }

  double get weight => formulaWeightAsInt(formula);

  @override
  int compareTo(Molecule other) {
    return this.weight.compareTo(other.weight);
  }
}

