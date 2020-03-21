//
//  UploadAdsView.swift
//  e-learning
//
//  Created by hussein abed on 2/5/20.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI

struct UploadAdsView: View {
    
    @State var isShowingImagePicker = false
    @State var showImage = UIImage()
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width:120, height: 140)
                            .foregroundColor(Color(.lightGray))
                        
                        Image(uiImage: showImage)
                        .resizable()
                        .scaledToFill()
                            .frame(width:120, height: 140)
                            .clipped()
                            
                        
                    }.shadow(radius: 7)
                        .padding(.leading)
                        .padding(.trailing)
                        .sheet(isPresented: $isShowingImagePicker) {
                            ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$showImage)
                        }.onTapGesture {
                            self.isShowingImagePicker.toggle()
                        }
                    
                    ZStack {
                        Rectangle()
                            .frame(width:120, height: 140)
                            .foregroundColor(Color(.lightGray))
                        
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        
                        }.shadow(radius: 7)
                            .padding(.leading)
                            .padding(.trailing)
                    
                }.padding(.bottom)
                
            }
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {

    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                self.parent.selectedImage = selectedImageFromPicker
                if let image = selectedImageFromPicker.jpegData(compressionQuality: 0.2) {
                    print("djfjdhf")
                    APIHandler.uploadImage(imageData: image)
                }
            }
            self.parent.isPresented = false
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.isPresented = false
            print("ddf")
        }
    }
    
    
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
}

struct UploadAdsView_Previews: PreviewProvider {
    static var previews: some View {
        UploadAdsView()
    }
}
