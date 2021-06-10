//
//  Main.swift
//  PetFood
//
//  Created by Sofi on 10.06.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct Main: View {
    @State var selection = 1
    @StateObject var model = ViewModel()
    var body: some View {
        ZStack{
            VStack(spacing:0){
                Text("Pet Food").foregroundColor(Color("te")).font(.system(size: 20, weight: .bold, design: .default)).padding(.bottom,16)
                Divider()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 6).strokeBorder(Color("te"), lineWidth: 0.5).frame(width: 343, height: 32, alignment: .center).foregroundColor(Color("te"))
                    HStack(spacing:0){
                        Button(action: {
                            selection = 1
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 6).strokeBorder(Color("te"), lineWidth: 0.5).frame(width: 172, height: 32, alignment: .center).background(RoundedRectangle(cornerRadius: 6).foregroundColor( Color.init(#colorLiteral(red: 0.1804058254, green: 0.5030173659, blue: 0.9273634553, alpha: 1)))).opacity(selection == 1 ? 1 : 0)
                                Text("Cats (\(model.modelCat.count)").foregroundColor(selection == 1 ? Color.white : Color("te")).font(.system(size: 14, weight: .regular, design: .default))
                            }
                        })
                        Button(action: {
                            selection = 2
                        }, label: {
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 6).strokeBorder(Color("te"), lineWidth: 0.5).frame(width: 172, height: 32, alignment: .center).background(RoundedRectangle(cornerRadius: 6).foregroundColor(Color.init(#colorLiteral(red: 0.1804058254, green: 0.5030173659, blue: 0.9273634553, alpha: 1)))).opacity(selection == 2 ? 1 : 0)
                                Text("Dogs (\(model.model.count)").foregroundColor(selection == 2 ? Color.white : Color("te")).font(.system(size: 14, weight: .regular, design: .default))
                            }
                        })
                     
                    }
                }.padding(.top,24)
                if selection == 1 {
                VStack(spacing:32){
                    ForEach(0..<model.modelCat.count, id:\.self){ i in
                    HStack{
                        WebImage(url: URL(string: "https://foodpets.madskill.ru/up/images/\(model.modelCat[i].image)")).resizable().frame(width: 55, height: 55, alignment: .center).mask(RoundedRectangle(cornerRadius: 12)).background( RoundedRectangle(cornerRadius:  12).strokeBorder(Color("te"),lineWidth: 0.5).frame(width: 56, height: 56, alignment: .center))
                       
                        VStack(alignment:.leading){
                            Text("\(model.modelCat[i].FoodName)").foregroundColor(Color("te")).font(.system(size: 16, weight: .semibold, design: .default))
                            Text("\(model.modelCat[i].BrandName)").foregroundColor(Color("gr")).font(.system(size: 14, weight: .regular, design: .default))
                        }
                        Spacer()
                        Text("\(model.modelCat[i].price) $").foregroundColor(Color("gr")).font(.system(size: 16, weight: .bold, design: .default))
                        
                    }.frame(width: 343, alignment: .center)
                }
                }.padding(.top,40)
                }else{
                    VStack(spacing:32){
                        ForEach(0..<model.model.count, id:\.self){ i in
                        HStack{
                            WebImage(url: URL(string: "https://foodpets.madskill.ru/up/images/\(model.model[i].image)")).resizable().frame(width: 55, height: 55, alignment: .center).mask(RoundedRectangle(cornerRadius: 12)).background( RoundedRectangle(cornerRadius:  12).strokeBorder(Color("te"),lineWidth: 0.5).frame(width: 56, height: 56, alignment: .center))
                           
                            VStack(alignment:.leading){
                                Text("\(model.model[i].FoodName)").foregroundColor(Color("te")).font(.system(size: 16, weight: .semibold, design: .default))
                                Text("\(model.model[i].BrandName)").foregroundColor(Color("gr")).font(.system(size: 14, weight: .regular, design: .default))
                            }
                            Spacer()
                            Text("\(model.model[i].price) $").foregroundColor(Color("gr")).font(.system(size: 16, weight: .bold, design: .default))
                            
                        }.frame(width: 343, alignment: .center)
                    }
                    }.padding(.top,40)
                }
                Spacer()
            }.offset( y: 50)
            VStack{
                
                Spacer()
                BottomMenu()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

struct BottomMenu:View {
    var body: some View{
        ZStack{
            VStack(spacing:0){
                Divider()
                HStack(spacing:0){
                Button(action: {}, label: {
                    VStack{
                        Image("rehome")
                        Text("Home").foregroundColor(Color.init(#colorLiteral(red: 0.1804058254, green: 0.5030173659, blue: 0.9273634553, alpha: 1))).font(.system(size: 12, weight: .regular, design: .default))
                    }
                }).frame(width: 125, height: 80, alignment: .center)
                    Button(action: {}, label: {
                        VStack{
                            Image("search")
                            Text("Explore").foregroundColor(Color("te")).font(.system(size: 12, weight: .regular, design: .default))
                        }
                    }).frame(width: 125, height: 80, alignment: .center)
                    Button(action: {}, label: {
                        VStack{
                            Image("pro")
                            Text("Home").foregroundColor(Color("te")).font(.system(size: 12, weight: .regular, design: .default))
                        }
                    }).frame(width: 125, height: 80, alignment: .center)
            }.frame(width: UIScreen.main.bounds.width, height: 80, alignment: .center)
            }
        }
    }
}
