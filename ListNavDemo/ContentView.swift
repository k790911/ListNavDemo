//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 김재훈 on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var carStore: CarStore = CarStore(cars: carData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(carStore.cars) { car in
                    ListCell(car: car) // HStack
                } // ForEach
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            } // List
            .navigationTitle(Text("EV cars"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewCar(carStore: self.carStore)) {
                Text("Add").foregroundColor(.blue)
            }, trailing: EditButton())
        } // Navigation View
    } // body
    
    func deleteItems(at offets: IndexSet) {
        carStore.cars.remove(atOffsets: offets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}

struct ListCell: View {
    var car: Car
    
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)) {
            HStack {
                Image(car.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(car.name)
            } // HStack
        } // Navigation Link
    } // body
}
