//
//  ContentView.swift
//  ConvertitoreBDHO
//
//  Created by Michele Manniello on 25/07/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gestione = Convertitore()
    @State var testo : String = ""
    
    var valori = ["Binario":"101010","Ottale":"26","Esadecimale":"34"]
    
    @State var visualeCorrente : String = "Vista10"
    var body: some View {
        VStack{
            Text("Convertitore")
                .font(.title)
                .padding()
            if visualeCorrente == "Vista10"{
                DecimalView()
                    .environmentObject(gestione)
            }
            if visualeCorrente == "Vista2"{
                BinaryView()
                    .environmentObject(gestione)
            }
            if visualeCorrente == "Vista8"{
                OctalView()
                    .environmentObject(gestione)
            }
            if visualeCorrente == "Vista16"{
               HexadecimalView()
                .environmentObject(gestione)
            }
            Spacer()
            //            Menù di selezione
            MenuSelezione(elementoSelezionato: $visualeCorrente)
                .environmentObject(gestione)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct RisutatiView : View {
    var valori : [String:String] = [:]
    var body: some View{
        VStack(alignment: .leading){
            ForEach(valori.sorted(by: <),id: \.key){ key,value in
                VStack(alignment: .leading){
                    Text("Valore: \(key)")
                        .font(.title2)
                    Text("\(value)")
                        .font(.title2)
                }
                .padding()
            }
        }
        .transition(.scale)
    }
}

struct MenuSelezione: View {
    @EnvironmentObject var gestione : Convertitore
    @Binding var elementoSelezionato : String
    var elencoicone = ["Vista10","Vista2","Vista8","Vista16"]
    var body: some View {
        HStack{
            ForEach(elencoicone, id: \.self) { icona in
                Button(action: {
                    gestione.valori = [:]
                    withAnimation{
                        self.elementoSelezionato = icona
                    }
                }, label: {
                    ZStack {
                        if elementoSelezionato == icona{
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 55, height: 55)
                        }else{
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 55, height: 55)
                        }
                        Image(icona)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding(10)
                    }
                })
                //                    Divider()
            }
        }.frame(height: 100)
    }
}


struct ButtonText: View {
    @Binding var tastiera: Bool
    @Binding var testo : String
    var body: some View{
        Button {
            //                mostrare tastiera
            withAnimation{
                self.testo = ""
                self.tastiera.toggle()
            }
        } label: {
            ZStack{
                Capsule()
                    .frame(width: 300, height: 30)
                    //                        .border(Color.black)
                    .foregroundColor(.black)
                Capsule()
                    .frame(width: 298, height: 28)
                    .foregroundColor(.white)
                
                Text(testo)
                    .foregroundColor(.black)
                    .frame(width: 290, height: 30)
            }
        }
    }
}
