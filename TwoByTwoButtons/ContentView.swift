//
//  ContentView.swift
//  TwoByTwoButtons
//
//  Created by hiraoka on 2021/12/14.
//

import SwiftUI

// MARK: ContentView
struct ContentView: View {
    var body: some View {
        VStack {
            Section("iOS13+") {
                IOS13_TwoByTwoButtonsView()
            }

            Section("iOS14+") {
                IOS14_TwoByTwoButtonsView()
            }
        }
        .padding(.horizontal)
    }
}

// MARK: ButtonType
enum ButtonType: CaseIterable, Identifiable {
    var id: Int { self.hashValue }

    case a
    case b
    case c
    case d

    var text: String {
        switch self {
        case .a:
            return "A"
        case .b:
            return "BBBBB"
        case .c:
            return "C\nCCCCC"
        case .d:
            return "DDDDDDDDDDDDDDD"
        }
    }

    var color: Color {
        switch self {
        case .a:
            return .red
        case .b:
            return .green
        case .c:
            return .yellow
        case .d:
            return .cyan
        }
    }

    var icon: Image {
        switch self {
        case .a:
            return Image(systemName: "1.circle")
        case .b:
            return Image(systemName: "2.circle")
        case .c:
            return Image(systemName: "3.circle")
        case .d:
            return Image(systemName: "4.circle")
        }
    }
}

// MARK: IOS13_TwoByTwoButtonsView
struct IOS13_TwoByTwoButtonsView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    ButtonContentView(type: .a)
                }

                Button(action: {}) {
                    ButtonContentView(type: .b)
                }
            }

            HStack {
                Button(action: {}) {
                    ButtonContentView(type: .c)
                }

                Button(action: {}) {
                    ButtonContentView(type: .d)
                }
            }
        }
    }

    private struct ButtonContentView: View {
        let type: ButtonType

        var body: some View {
            HStack {
                type.icon
                    .resizable()
                    .frame(width: 20, height: 20)

                Text(type.text)
                    .font(.headline)
                    .minimumScaleFactor(0.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)

            }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .padding(.horizontal, 8)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(type.color)
                    .shadow(color: .gray, radius: 2, x: .zero, y: 2)
            )
        }
    }
}

// MARK: IOS14_TwoByTwoButtonsView
struct IOS14_TwoByTwoButtonsView: View  {
    let gridLayout: [GridItem] = [
        .init(.flexible(minimum: 100, maximum: .infinity)),
        .init(.flexible(minimum: 100, maximum: .infinity)),
    ]

    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(ButtonType.allCases) { type in
                Button(action: {}) {
                    HStack {
                        type.icon
                            .resizable()
                            .frame(width: 20, height: 20)

                        Text(type.text)
                            .font(.headline)
                            .minimumScaleFactor(0.9)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)

                    }
                    .frame(minHeight: 50, maxHeight: 50)
                    .padding(.horizontal, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(type.color)
                            .shadow(color: .gray, radius: 2, x: .zero, y: 2)
                    )
                }
            }
        }
    }
}

// MARK: ContentView_Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
