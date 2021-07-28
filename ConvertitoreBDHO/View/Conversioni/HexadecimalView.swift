//
//  HexadecimalView.swift
//  ConvertitoreBDHO
//
//  Created by Michele Manniello on 25/07/21.
//

import SwiftUI

struct HexadecimalView: View {
    @EnvironmentObject var gestione : Convertitore
    @State var tastiera : Bool = false
    @State var testo : String = ""
    var body: some View {
        VStack{
            Text("Converti il tuo valore esadecimale")
                .font(.title2)
                .padding()
            ButtonText(tastiera: $tastiera, testo: $testo)
    //            mostrare la tastera o i risultati
            ZStack{
                if tastiera == true{
                    TastieraView(testo: $testo ,arrayTastiera: gestione.tastieraEsadecimale, tipoCalcolo: .H,mostratastiera: $tastiera)
                        .environmentObject(gestione)
                        //                    .background(Color.red)
                        .padding(.top)
                    Spacer()
                    Spacer()
                }else{
                    if testo != ""{
                    RisutatiView(valori: gestione.valori)
                        .padding()
                    }
                }
            }
        }
        .transition(.slide)
    }
}

struct HexadecimalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
