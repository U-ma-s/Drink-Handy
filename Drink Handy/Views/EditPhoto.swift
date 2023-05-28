import SwiftUI
import PhotosUI

struct EditPhoto: View {
    @State private var photoPickerItems: [PhotosPickerItem] = []
//    @State private var images: [UIImage] = []
    
    //@Binding var imageData: [Data]
    @Binding var imageData: Data
    
    
    var body: some View {
        VStack {
            //if images.isEmpty {
            //if !imageData.isEmpty {
                PhotosPicker(
                    selection: $photoPickerItems,
                    maxSelectionCount: 1,
                    selectionBehavior: .ordered,
                    matching: .images,
                    preferredItemEncoding: .current,
                    photoLibrary: .shared()) {
                        VStack {
                            //Image(systemName: "photo")
                            Image(uiImage: UIImage(data: imageData) ?? UIImage(systemName: "photo")!)
                                .resizable()
                                //.frame(width: 130, height: 100)
                                .scaledToFit()
                                .foregroundColor(.gray)
                        }
                    }
                    .onChange(of: photoPickerItems) { newPhotoPickerItems in
                        Task {
                            print("imageData: \(imageData)")
                            print("enmptyData: \(Data.init())")
                            print("imageData.count: \(imageData.count)")
                            print("imageData.isEmpty: \(imageData.isEmpty)")
                            do {
                                for photoPickerItem in newPhotoPickerItems {
                                    if let data = try await photoPickerItem.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            //images.append(uiImage)
                                            //imageData.append(data)
                                            imageData = data
                                        }
                                    }
                                }
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
//            } else {
//                VStack {
//                    //Image(uiImage: images[0])
//                    Image(uiImage: UIImage(data: imageData)!)
//                        .resizable()
//                        .scaledToFit()
//                        .padding(5)
////                    Button {
////                        images.removeAll()
////                    } label: {
////                        Text("写真を再選択")
////                            .frame(width: 300, height: 10)
////                    }
//                }
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
