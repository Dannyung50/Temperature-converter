//
//  ContentView.swift
//  Temperature-converter
//
//  Created by Olaleye Daniel Ifeoluwa on 30/08/2022.
//

import SwiftUI
    
 
     
    struct ContentView: View {
            
 let unitType = ["Celcius","Fahrenheit","Kelvin"]
        let celciusUnit = ["Fahrenheit","Kelvin"]
        let fahrenheitUnit = ["Celcius","Kelvin"]
        let kelvinUnit = ["Celcius","Fahrenheit"]
    @State private var selectCelcius = "Fahrenheit"
    @State private var selectFahrenheit = "Celcius"
    @State private var selectKelvin = "Celcius"
    @State private var selectedUnit = "Celcius"
    @State private var userInput = 0
    @FocusState private var UnitFocused:Bool
        var CtoFOutput:Double{
            let grandTotal = 1.8 * Double(userInput)
            return grandTotal
        }
        var CtoKOutput:Double{
            let grandTotal = 273.15 + Double(userInput)
            return grandTotal
        }
        var FtoCOutput:Double{
            let grandTotal = (Double(userInput) - 32) / 0.56
            return grandTotal
        }
        var FtoKOutput:Double{
            let grandTotal = (((Double(userInput) - 32) * 5) / 9) - 273.15
            return grandTotal
        }
        var KtoCOutput:Double{
            let grandTotal = Double(userInput) - 273.15
            return grandTotal
        }
        var KtoFOutput:Double{
            let grandTotal = (1.8 * (Double(userInput)) + 32)
            return grandTotal
        }
            var body: some View {
                
                NavigationView{
                    Form{
                    
                        Section{
                            TextField("Enter temperature value", value: $userInput, format: .number).keyboardType(.decimalPad).focused($UnitFocused)
                            Picker("Select Unit", selection: $selectedUnit){
                                ForEach (unitType, id:\.self){
                                    Text($0)
                                }
                            }
                        }header:{
                            Text("INPUT:")
                        }
                        Section{
                            if selectedUnit == "Celcius"{
                                Picker("Celcius", selection: $selectCelcius){
                                    ForEach(celciusUnit, id:\.self){
                                        Text($0)
                                    }
                                }.pickerStyle(.segmented)
                            }
                           if selectedUnit == "Fahrenheit"{
                                Picker("Fahrenheit", selection: $selectFahrenheit){
                                    ForEach(fahrenheitUnit, id:\.self){
                                        Text($0)
                                    }
                                }.pickerStyle(.segmented)
                            }
                            if selectedUnit == "Kelvin"{
                                 Picker("Fahrenheit", selection: $selectKelvin){
                                     ForEach(kelvinUnit, id:\.self){
                                         Text($0)
                                     }
                                 }.pickerStyle(.segmented)
                             }
                            
                        }header:{
                            Text("CONVERT TO")
                        }
                       Section{
                           if selectedUnit == "Celcius" {
                               Group{
                               if selectCelcius == "Fahrenheit"{
                                   Text("\(CtoFOutput)°F" )
                               }
                               else if selectCelcius == "Kelvin"{
                                   Text("\(CtoKOutput)°K")
                               }
                               }
                           }
                           if selectedUnit == "Fahrenheit"{
                               Group{
                                 if selectFahrenheit == "Celcius"{
                                     Text("\(FtoCOutput)°C")
                                 }
                                 else if selectFahrenheit == "Kelvin"{
                                     Text("\(FtoKOutput)°K")
                                  }
                                     }
                           }
                           if selectedUnit == "Kelvin"{
                               Group{
                                   if selectKelvin == "Celcius"{
                                       Text("\(KtoCOutput)°C")
                                     }
                                     else if selectKelvin == "Fahrenheit"{
                                   Text("\(KtoFOutput)°F")
                                   }
                               }
                         
                           }
                              
                            
                       }header:{
                           Text("OUTPUT")
                       }
                    }
                }.navigationTitle("Temp Converter")
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Done"){
                              UnitFocused = false
                            }
                        }
                
                    }
                
            }
        }
 


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
