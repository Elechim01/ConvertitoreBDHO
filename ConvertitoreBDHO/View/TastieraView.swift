//
//  TastieraView.swift
//  ConvertitoreBDHO
//
//  Created by Michele Manniello on 25/07/21.
//

import SwiftUI

struct TastieraView: View {
    @EnvironmentObject var gestione : Convertitore
    @Binding var testo : String 
    var arrayTastiera : [String]
    var tipoCalcolo : Tipo
//    Gestione tastiera
    @Binding var mostratastiera : Bool
    let colunms = [
        GridItem(.adaptive(minimum: 50))
    ]
    var body: some View {
        VStack {
            LazyVGrid(columns: colunms,spacing:40, content: {
                ForEach(arrayTastiera, id: \.self){ text in
                    ButtonTastiera(StringText: $testo, grandezza: 50,testo: text)
                }
            })
            .padding()
            HStack{
            Button(action: {
//                calcolovalori decimali:
                if tipoCalcolo == .D{
                    gestione.CalcolaDaDecimale(valore: testo)
                    
                }
                if tipoCalcolo == .B{
                    gestione.CalcolaDaBinario(valore: testo)
                }
                if tipoCalcolo == .O{
                    gestione.CalcolaDaOttale(valore: testo)
                }
                if tipoCalcolo == .H{
                    gestione.CalcolaDaEsadecimale(valore: testo)
                }
                
                withAnimation{
                self.mostratastiera.toggle()
                }
            }, label: {
                Text("Calcola")
            })
            .disabled(testo == "" ? true : false)
//            Button(action: {
//                if testo.count != 0{
//                testo.removeLast()
//                }
//            }, label: {
//
//                Image(systemName: "delete.left")
//                    .foregroundColor(.black)
//                    .frame(width: 60, height: 60)
//                    .background( ZStack{
//
//                        Circle()
//                            .frame(width: 50 , height: 50)
//                            .foregroundColor(.black)
//                        Circle()
//                            .frame(width:  48, height: 48)
//                            .foregroundColor(.white)
//                    })
//            })
            .padding()
            }
            Spacer()
        }
//        .frame(height: UIScreen.main.bounds.height / 2)
        .transition(.move(edge: .bottom))
    }
}

struct TastieraView_Previews: PreviewProvider {
    @State static var testo : String = ""
    @State static var mtesto : Bool = false
    static var previews: some View {
        TastieraView( testo: $testo, arrayTastiera: ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","Del"], tipoCalcolo: .D, mostratastiera: $mtesto)
    }
}

struct ButtonTastiera: View {
    @Binding var StringText : String
    var grandezza : CGFloat
    var testo : String
    var body: some View {
        if testo == "Del"{
            Button(action: {
                if StringText.count != 0{
                    self.StringText.removeLast()
                }
            }, label: {
                
                Image(systemName: "delete.left")
                    .foregroundColor(.black)
                    .background( ZStack{
                        Circle()
                            .frame(width: grandezza , height: grandezza)
                            .foregroundColor(.black)
                        Circle()
                            .frame(width:  grandezza - 2, height: grandezza - 2)
                            .foregroundColor(.white)
                    })
            })
        }else{
        Button(action: {
            self.StringText += testo
            
        }, label: {
            //                cambiare il testo con la prorpietà
            Text("\(testo)")
                .foregroundColor(.black)
                .background(
                    ZStack{
                        Circle()
                            .frame(width: grandezza , height: grandezza)
                            .foregroundColor(.black)
                        Circle()
                            .frame(width:  grandezza - 2, height: grandezza - 2)
                            .foregroundColor(.white)
                    }
                )
        })
        }
    }
}
