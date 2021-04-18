import SwiftUI

func generateRepeatStringArray(size: Int, string: String) -> [String] {
    var array = [String]()
    
    for _ in 0 ..< size {
        array.append(string)
    }
    
    return array
}

struct Crossword: View {
    @State var blockText = generateRepeatStringArray(size: 6, string: " ")
    @State var selectedIndex = 0
    
    var selectedBinding: Binding<String> {
        Binding<String>(
            get: {
                blockText[selectedIndex]
            },
            set: {
                blockText[selectedIndex] = $0
            }
        )
    }
    
    var body: some View {
        ZStack {
            CrosswordKeyboard(text: selectedBinding)
            
            VStack {
                ZStack {
                    createBlock(0)
                    createBlock(5, tip: 1)
                }
                
                HStack {
                    createBlock(1, tip: 2)
                    createBlock(2)
                    createBlock(3)
                }
                
                createBlock(4)
            }
        }
    }
    
    func txtBind(index: Int) -> Binding<String> {
        Binding<String>(
            get: {
                blockText[index]
            },
            set: {
                blockText[index] = $0
            }
        )
    }
    
    func createBlock(_ index: Int, tip: Int = -1) -> CrosswordBlock {
        CrosswordBlock(index: index, tip: tip, selectedIndex: $selectedIndex, text: txtBind(index: index))
    }
}

struct CrosswordBlock: View {
    var index: Int
    var tip = -1
    
    @Binding var selectedIndex: Int
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(tip == -1 ? " " : String(tip))
                    .font(.caption)
                    .position()
                
                Spacer()
            }
            
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        .foregroundColor(.white)
        .frame(width: 60, height: 60)
        .background(selectedIndex == index ? Color.blue : Color.red)
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                selectedIndex = index
            }
        }
    }
}

