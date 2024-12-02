

import SwiftUI

struct ExploreScreen: View {
    
    enum PickerOption: String, CaseIterable{
        case option1 = "Date"
        case option2 = "Plane"
        case option3 = "Star"
        case option4 = "Heart"
        
    }
    
    @State private var pick : PickerOption = .option1
    
    //..Computed Property for switching images on selection
    private var selectedImageName : String {
        switch pick {
        case .option1 :
            return "calendar"
        case .option2 :
            return "airplane"
        case .option3 :
            return "star.fill"
        case .option4 :
            return "heart.fill"
        }
    }
    
    var body: some View {
        ZStack{
            VStack {
                Picker("Select", selection: $pick) {
                    
                    ForEach(PickerOption.allCases, id : \.self){ opt in
                        Text("\(opt.rawValue)")
                    }
                    
                }
                .pickerStyle(.segmented)
                .frame(width: 350, height: 37)
                .background(Color.mint)
                .cornerRadius(10)
                .padding()
                
                Image(systemName:selectedImageName)
                    .resizable()
                    .frame(width: 300, height: 250)
                    .foregroundColor(.red)
                    .padding()
                
                Spacer()
            }
            
        }
    }
}

struct ExploreScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExploreScreen()
    }
}
