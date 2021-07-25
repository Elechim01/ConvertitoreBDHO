//
//  GestioneConvert.swift
//  ConvertitoreBDHO
//
//  Created by Michele Manniello on 25/07/21.
//

import SwiftUI
class Convertitore: ObservableObject {
//    tipidi tasitere
    @Published var tastieraDecimale : [String] =  ["0","1","2","3","4","5","6","7","8","9","Del"]
    @Published var tastieraBinaria : [String] = ["0","1","Del"]
    @Published var tastieraOttale : [String] = ["0","1","2","3","4","5","6","7","Del"]
    @Published var tastieraEsadecimale: [String] = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","Del"]
    @Published var valori: [String:String] = [:]
    
    func CalcolaDaDecimale(valore: String){
        let numero  = Int(valore)!
        let result1 = String(numero,radix: 2)
        print("Da decimale e binario:",result1)
        let result2 = Int(String(numero,radix: 8))
        print( "Da decimale a ottale:",result2!)
        let result3 = String(Int(numero),radix: 16).uppercased()
        print("Da Decimale a Esadecimale:",result3.uppercased())
        //        salvare i valori i valori
        self.valori = ["Binario":result1,"Ottale":String(result2!),"Esadecimale": result3]
    }
    func CalcolaDaBinario(valore: String){
        //4:
        let result4 = String(Int(String(valore),radix: 2)!)
        print("Da Binario a decimale:",result4)
        //5:
        let result5 = String(Int(String(valore),radix: 2)!,radix: 8)
        print("Da binario a ottale:",result5)
        //6:
        let result6 = String(Int(String(valore),radix: 2)!,radix: 16).uppercased()
        print("Da Binario a Esadecimale:",result6.uppercased())
        self.valori = ["Decimale":result4,"Ottale":result5,"Esadecimale": result6]
    }
    func CalcolaDaOttale(valore : String){
        let result7 =  String(Int(String(valore),radix: 8)!)
        print("Da ottale e Decimale:",result7)
        //8
        let result8 = String(Int(String(valore),radix: 8)!,radix: 2)
        print("Da Ottale a Binario:",result8)
        //9:
        let result9 = String(Int(String(valore),radix: 8)!,radix: 16).uppercased()
        print("Da Ottale a Esadecimale:",result9.uppercased())
        self.valori = ["Decimale":result7,"Binario":result8,"Esadecimale":result9]
    }
    func CalcolaDaEsadecimale(valore: String){
        let result10 = String(Int(valore,radix:16)!)
        print("Da Esadecimale a Decimale:",result10)
        //result11
        let result11 = String(Int(String(valore),radix: 16)!,radix: 2)
        print("Da Esadecmale a Binario:",result11)
        //result12
        let result12 = String(Int(String(Int(valore,radix: 16)!,radix: 8))!)
        print("Da Esadecimale a Ottale:",result12)
        self.valori = ["Decimale":result10,"Binario":result11,"Ottale":result12]
    }
    
}
//Per la variabile tipo di calcolo
enum Tipo {
    case D
    case B
    case O
    case H
}
