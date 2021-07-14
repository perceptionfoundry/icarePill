//
//  DoctorsView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DoctorsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
//    @State var count = 1
    @State var docArray = [Doctor]()
    
   
    
    @State var isNext = false
    
    var body: some View {
        VStack{
            
            if docArray.count == 0{
                NoRecordView(imageName: "no_doctor")
            }
            else{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack(content: {
                        ForEach(docArray) { value in
                            
                            DoctorCellView(imageString: value.image, name: value.name)
                                .onTapGesture {
                                    selectedDocInfo = value
                                    presentationMode.wrappedValue.dismiss()
                                }
                            
                        }.padding(.horizontal)
                        .padding(.vertical, 7)
                    })
                    
                }
                
                
                
                
                
            }
            Spacer()
            //MARK: Done Button
            
            NavigationLink(
                destination: AddDoctorView(),
                isActive: $isNext,
                label: {
                    Button(action: {
                        
                        isNext.toggle()
                        
                        
                    }, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                .frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            Text("Add Doctor")
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Medium", size: 16))
                            
                        }
                        
                    })
                })
            
            
        }.preferredColorScheme(.light)
        .onAppear(){
            let firebaseVM = FirebaseViewModel()
            
            firebaseVM.GetCollection(collectionTitle: "Doctors", subCollectionTitle: "Physicians") { (status, details: [Doctor], err) in
                
                if status{
                    
                    docArray = details
                    
                    let sortedNames = details.sorted { $0.name < $1.name }
                    
                    docArray = sortedNames

                }else{
                    
                    print(err!)
                }
            }
        }
        
        .padding()
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image("back")
                                        .imageScale(.large)
                                }
                            
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Doctors")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.accentColor)
                    
                }
            }
        }
    }
        
}

struct DoctorsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsView()
    }
}

struct DoctorCellView: View {
    
    var imageString : String
    var name : String
    
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                
                HStack {
                    
                    let imageurl  = URL(string: imageString)
                    
                    WebImage(url: imageurl)
                        .placeholder(Image(uiImage: UIImage(named: "dp")!
                        ))
                        .resizable()
                        .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.leading)
                    Text(name)
                        .foregroundColor(.accentColor)
                        .font(.custom("Poppins-Medium", size: 14))
                        .padding()
                    Spacer()
                    
                }
                
                
                
                
            }
            
            
            
        }
    }
}




