//
//  CalculatorView.swift
//  StockPriceCalculator
//
//  Created by Alistair Fraser on 2023-02-08.
//

import SwiftUI

struct CalculatorView: View {
    //MARK: Stored Properties
    @State  var stockPrice: Double?
    @State  var numberOfShares: Double?
    var result: String
    
    //MARK: Computed Properties
    var totalValue: Double {
        return Int(stockPrice) * Int(numberOfShares) !
    }
    
    @State var priorResults: [Result] = []
    @Binding var history: [Result]
    //UI
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Image("Sphere")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
            }
            Group {
                //Stock Price
                Text("Stock Price")
                    .font(.title2)
                    .bold()
                //Use string interpolation \() to display within
                Text("\(stockPrice?!.formatted(.number.precision(.fractionLength(Int()))))")
                
                //Number of Shares
                Group {
                    Text("Number of Shares")
                        .font(.title2)
                        .bold()
                    //Use string interpolation \() to display within
                    Text("\(numberOfShares?!.formatted(.number.precision(.fractionLength(Int()))))")
                }
                
                Group {
                    Button(action: {
                        let latestResult = Result(stockPrice: stockPrice ??, numberOfShares: numberOfShares ??, totalValue: totalValue)
                        priorResults.append(latestResult)
                    }, label: {
                        Text("Save Result")
                    })
                    .buttonStyle(.bordered)
                    .padding()
                }
                Group {
                    //History
                    HStack {
                        Text("History")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                Group {
                    //The List of Results
                    List(priorResults.reversed()) {  currentResult in
                        HStack {
                            Spacer()
                            ResultView(somePriorResult: currentResult)
                            Spacer()
                        }
                    }
                    Spacer()
                }
                
                .padding()
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(stockPrice: 10, numberOfShares: 10, result: "")
    }
}
