//
//  ContentView.swift
//  GrandCentralDispatch
//
//  Created by ramil on 08.04.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                self.doItInGlobalAsync()
            }) {
                Text("GCD async")
            }
            Button(action: {
                self.doItInGlobalSync()
            }) {
                Text("GCD sync")
            }
        }.padding()
    }
    
    func doItInGlobalAsync() {
        // High
        DispatchQueue.global(qos: .userInteractive).async {
            print("1 - High: .userInteractive")
        }
        
        // Default
        DispatchQueue.global(qos: .userInitiated).async {
            print("2 - Default: .userInitiated")
        }
        
        DispatchQueue.global(qos: .default).async {
            print(".default")
        }
        
        // Low
        DispatchQueue.global(qos: .utility).async {
            print("3 - Low: .utility")
        }
        
        // Background
        DispatchQueue.global(qos: .background).async {
            print("4 - In Background: .background")
        }
        
        DispatchQueue.global(qos: .unspecified).async {
            print(".unspecified")
        }
    }
    
    func doItInGlobalSync() {
        // High
        DispatchQueue.global(qos: .userInteractive).sync {
            print("1 - High: .userInteractive")
        }
        
        // Default
        DispatchQueue.global(qos: .userInitiated).sync {
            print("2 - Default: .userInitiated")
        }
        
        DispatchQueue.global(qos: .default).sync {
            print(".default")
        }
        
        // Low
        DispatchQueue.global(qos: .utility).sync {
            print("3 - Low: .utility")
        }
        
        // Background
        DispatchQueue.global(qos: .background).sync {
            print("4 - In Background: .background")
        }
        
        DispatchQueue.global(qos: .unspecified).sync {
            print(".unspecified")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
