//
//  ContentView.swift
//  GrandCentralDispatch
//
//  Created by ramil on 08.04.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var myArray = [String]()
    
    var body: some View {
        VStack {
            Button(action: {
                self.myArray = []
                self.doItInGlobalAsync()
            }) {
                Text("GCD async")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .padding()
            }
            Button(action: {
                self.myArray = []
                self.doItInGlobalSync()
            }) {
                Text("GCD sync")
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .padding()
            }
            if self.myArray != [] {
                ForEach(self.myArray, id: \.self) { item in
                    Text(item)
                }.padding()
            }
            Button(action: {
                self.myArray = []
            }) {
                Image(systemName: "arrow.uturn.left.circle")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .padding()
            }
        }.padding()
    }
    
    func doItInGlobalAsync() {
        // High
        DispatchQueue.global(qos: .userInteractive).async {
            let out = "1 - High: .userInteractive"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Default
        DispatchQueue.global(qos: .userInitiated).async {
            let out = "2 - Default: .userInitiated"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        DispatchQueue.global(qos: .default).async {
            let out = ".default"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Low
        DispatchQueue.global(qos: .utility).async {
            let out = "3 - Low: .utility"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Background
        DispatchQueue.global(qos: .background).async {
            let out = "4 - In Background: .background"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        DispatchQueue.global(qos: .unspecified).async {
            let out = ".unspecified"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
    }
    
    func doItInGlobalSync() {
        // High
        DispatchQueue.global(qos: .userInteractive).sync {
            let out = "1 - High: .userInteractive"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Default
        DispatchQueue.global(qos: .userInitiated).sync {
            let out = "2 - Default: .userInitiated"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        DispatchQueue.global(qos: .default).sync {
            let out = ".default"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Low
        DispatchQueue.global(qos: .utility).sync {
            let out = "3 - Low: .utility"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        // Background
        DispatchQueue.global(qos: .background).sync {
            let out = "4 - In Background: .background"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
        
        DispatchQueue.global(qos: .unspecified).sync {
            let out = ".unspecified"
            print(out)
            DispatchQueue.main.async {
                self.myArray.append(out)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
