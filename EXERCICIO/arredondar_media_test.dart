import 'package:projetonow/exercicio/calculadora.dart';
import 'package:test/test.dart';

import 'arredondar_media.dart';

void main(){

    test('deve arredondar numeros para multiplos de 5', (){
    
 expect(arredondarMedia(84), 85);
 expect(arredondarMedia(57), 57);
 expect(arredondarMedia(58), 60);
 expect(arredondarMedia(59), 60);
 expect(arredondarMedia(60), 60);
 
    test('cenário de alunos',(){

      Map <String, Map<String, List<int>>> alunos ={
        'João':{
            'Matemática':[30,45,67,42],
            'História':[35,37,30,46],
            'Ciencias':[73,65,79,83],
        },
        'Joaquim':{
            'Matemática':[],
            'História':[],
            'Ciencias':[],
        },
        'Helena':{
            'Matemática':[],
            'História':[],
            'Ciencias':[],
        },
      };

       alunos.forEach((key, value){

        value.forEach((d, notas){

        });
        var mediaDiciplina = calcularMedia(value);
 
        int notaFinal = arredondarMedia(mediaDiciplina.values.first);
       });

    });
    
    });

}