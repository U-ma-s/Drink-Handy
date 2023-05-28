import SwiftUI
import PhotosUI

struct SelectPhoto: View {
    @State private var photoPickerItems: [PhotosPickerItem] = []
    @Binding var imageData: Data
    
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $photoPickerItems,
                maxSelectionCount: 1,
                selectionBehavior: .ordered,
                matching: .images,
                preferredItemEncoding: .current,
                photoLibrary: .shared()) {
                        if imageData.isEmpty {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .foregroundColor(.gray)
                        } else {
                            Image(uiImage: UIImage(data: imageData)!)
                                .resizable()
                                .scaledToFit()
                        }
                }
                .onChange(of: photoPickerItems) { newPhotoPickerItems in
                    Task {
                        do {
                            for photoPickerItem in newPhotoPickerItems {
                                if let data = try await photoPickerItem.loadTransferable(type: Data.self) {
                                        imageData = data
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
