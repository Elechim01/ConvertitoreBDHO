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
            Button {
//                mostrare tastiera
                withAnimation{
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
                    RisutatiView(valori: gestione.valori)
                        .padding()
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
