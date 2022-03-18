//
//  ContentView.swift
//  SharinganSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 14/03/22.
//
//  MARK: The App Wizard
//  Instagram :
//  MARK: @theappwizard2408


import SwiftUI

struct ContentView: View {
    var body: some View {
        ItachiUchiha()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
















struct ItachiUchiha: View {
    
    @State private var sharingan = false
    var body: some View {
        ZStack{
            Color.red.opacity(1).edgesIgnoringSafeArea(.all)
            
           
            
            
            Image("sharingan")
                .resizable()
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(sharingan ? 180 : -180))
            
                .offset(x: 0, y: -180)
                .opacity(0.6)
                .onAppear() {
                              withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                                      {
                                  sharingan.toggle()
                                          }
                                     }
            
            Image("itachi")
                .resizable()
                .offset(x: 0, y: -30)
            
            Circle()
                .foregroundColor(.black)
                .frame(width: 500, height: 500)
                .offset(x: 0, y: 470)
            
            Text("Welcome To Uchiha's")
                .font(.title2)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .offset(x: 0, y: 280)
            
           
            
            ParticleSystem()
            
            ZStack{
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80)
                    .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                                }
                
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .foregroundColor(.white).opacity(0.4)
            }
            .offset(x: 0, y: 360)
            
            
                
        }
    }
}
//

struct ParticleSystem: UIViewRepresentable {
   
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 0.05, height: 0.05)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))

        let particlesLayer = CAEmitterLayer()
        
        particlesLayer.frame = CGRect(x: 2, y: 2, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        
        particlesLayer.emitterShape = .circle
        
        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast
        let imageParticle = UIImage(named: "snowflake")?.cgImage
        let snowParticles = CAEmitterCell()
        snowParticles.contents = imageParticle
        snowParticles.name = "Snow"
        snowParticles.birthRate = 92.0
        snowParticles.lifetime = 30
        snowParticles.velocity = 59.0
        snowParticles.velocityRange = -15.0
        snowParticles.xAcceleration = 5.0
        snowParticles.yAcceleration = 40.0
        snowParticles.emissionRange = 180.0 * (.pi / 45)
        snowParticles.spin = -28.6 * (.pi / 180.0)
        snowParticles.spinRange = 57.2 * (.pi / 180.0)
        snowParticles.scale = 0.002
        snowParticles.scaleRange = 0.05
        snowParticles.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        particlesLayer.emitterCells = [snowParticles]
        return host
    }
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    typealias UIViewType = UIView
}
