SwipeItem(content: {
            Text("Exhibit 1")
         },
         left: {
            ZStack {
                Rectangle()
                    .fill(Color.orange)
                
                Image(systemName: "pencil.circle")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
         },
         right: {
            ZStack {
                Rectangle()
                    .fill(Color.red)
                
                Image(systemName: "trash.circle")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
         }, itemHeight: 50)
