//
//  launchscreenController.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/13.
//

import SwiftUI

struct launchScreenController: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
            
        } else {
            VStack {
                VStack{
//                    Text("TODOList....")
//                        .font(.custom("American Typewriter", size: 29))
//                        .fontWeight(.bold)
//                    .padding(.bottom)
                    Image("lotus")
                        .frame(width: 300, height: 300)
                        .clipped()
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 4.0)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation{
                        self.isActive = true
                    }
                   
                }
            }
        }
    }
    struct launchScreenController_Previews: PreviewProvider {
        static var previews: some View {
            launchScreenController()
        }
        
    }
}
