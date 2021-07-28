//
//  DecimalView.swift
//  ConvertitoreBDHO
//
//  Created by Michele Manniello on 25/07/21.
//

import SwiftUI

struct DecimalView: View {
    @EnvironmentObject var gestione : Convertitore
    @State var tastiera : Bool = false
    @State var testo : String = ""
    //    var valori = ["Binario":"101010","Ottale":"26","Esadecimale":"34"]
    var body: some View {
        VStack{
            Text("Converti il tuo valore decimale")
                .font(.title2)
                .padding()
            ButtonText(tastiera: $tastiera, testo: $testo)
    //            mostrare la tastera o i risultati
            ZStack{
                if tastiera == true{
                    TastieraView(testo: $testo ,arrayTastiera: gestione.tastieraDecimale, tipoCalcolo: .D,mostratastiera: $tastiera)
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

struct DecimalView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
