
//  PinterestGridView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.


//import SwiftUI
//
//struct GridItem: Identifiable {
//    let id = UUID()
//    let height: CGFloat
//    let title: String
//}
//
//struct PinterestGridView: View {
//    
//    struct Column: Identifiable {
//        let id = UUID()
//        var gridItems = [GridItem]()
//    }
//    
//    let columns: [Column]
//    
//    let spacing: CGFloat
//    let horizontalPadding: CGFloat
//    
//    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20){
//        self.spacing = spacing
//        self.horizontalPadding = horizontalPadding
//        
//        var columns = [Column]()
//        for _ in 0..<numOfColumns {
//            columns.append(Column())
//        }
//        
//        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
//        
//        for gridItem in gridItems {
//            var smallestColumnIndex = 0
//            var smallestHeight = columnsHeight.first!
//            for i in 1..<columnsHeight.count {
//                let curHeight = columnsHeight[i]
//                if curHeight < smallestHeight {
//                    smallestHeight = curHeight
//                    smallestColumnIndex = i
//                }
//            }
//            columns[smallestColumnIndex].gridItems.append(gridItem)
//            columnsHeight[smallestColumnIndex] += gridItem.height
//        }
//        
//        self.columns = columns
//
//    }
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: spacing) {
//            ForEach(columns) { column in
//                LazyVStack(spacing: spacing) {
//                    ForEach(column.gridItems) { gridItem in
//                        
//                        getItemView(gridItem: gridItem)
//                        
//                    }
//                }
//            }
//        }
//        .padding(.horizontal, horizontalPadding)
//    }
//    
//    func getItemView(gridItem: GridItem) -> some View {
//        VStack {
//            GeometryReader { reader in
//                Image(systemName: "person")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
//                    .background(Color.red)
//            }
//        }
//        .frame(height: gridItem.height)
//        .frame(maxWidth: .infinity)
//        .clipShape(RoundedRectangle(cornerRadius: 13))
//    }
//}
//
//#Preview {
//    var gridItems = [GridItem]()
//    for i in 0..<30 {
//        let randomHeight = CGFloat.random(in: 200...300)
//        gridItems.append(GridItem(height: randomHeight, title: String(i)))
//    }
//    
//   return NavigationStack {
//        ScrollView {
//            PinterestGridView(gridItems: gridItems, numOfColumns: 2, spacing: 13, horizontalPadding: 10)
//        }
//    }
//    .navigationTitle("Pinterest Grid")
//}



//  PinterestGridView.swift
//  PokemonApp
//
//  Created by Goncalves Higino on 21/03/24.


/*import SwiftUI

struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let title: String
}

struct PinterestGridView: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
    }
    
    let columns: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20){
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0..<numOfColumns {
            columns.append(Column())
        }
        
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1..<columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.height
        }
        
        self.columns = columns
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        
                        Rectangle()
                            .foregroundStyle(.blue)
                            .frame(height: gridItem.height)
                            .overlay(
                                Text(gridItem.title)
                                    .font(.system(size: 30, weight: .bold))
                            )
                        
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    var gridItems = [GridItem]()
    for i in 0..<30 {
        let randomHeight = CGFloat.random(in: 100...400)
        gridItems.append(GridItem(height: randomHeight, title: String(i)))
    }
    
    return ScrollView {
        PinterestGridView(gridItems: gridItems, numOfColumns: 2, spacing: 20, horizontalPadding: 20)
    }
}*/
