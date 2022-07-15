//
//  PastOrders.swift
//  GroceryHandler
//
//  Created by Victor Micha on 6/22/22.
//

import SwiftUI

struct PastOrders: View {
    @State var userName:String
    var body: some View {
        let orders = getAllOrdersForUserName(userName: userName).orders.sorted(by:{$0.time.compare($1.time) == .orderedDescending})//sorts so that newer orders are at the top
        //dont need orders to be @state var because its value wont change in this view
        //if user goes back to signed in and posts an order when he comes back the getAllOrdersForUserName func will be called again so this page will be updated
        VStack{
            if (orders.count==1){
                Text("1 order for \(userName)")
                    .padding(.bottom, 40)
                    .font(.title)
                    .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            } else {
                Text("\(orders.count) orders for \(userName)")
                    .padding(.bottom, 40)
                    .font(.title)
                    .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            }
            ScrollView{
                Text("")
                //ignore warning for the ForEach loop: Non-constant range: argument must be an integer literal
                //because orders.count is constant in this view
                ForEach(0 ..< orders.count) { value in
                    Text(getOrderAsString(order:orders[value]))
                        .multilineTextAlignment(.center)
                }
            }
            .frame(width: 350, height:550)
            .background(Color(red: 0.3, green: 0.6, blue: 0.8))
            .cornerRadius(15)
            .font(.callout)
            .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.9))
        }
        .frame(width: 400, height: 800)
        .background(Color(red: 0.67, green: 0.87, blue: 0.9))
    }
}

struct PastOrders_Previews: PreviewProvider {
    static var previews: some View {
        PastOrders(userName:"userName")
    }
}
