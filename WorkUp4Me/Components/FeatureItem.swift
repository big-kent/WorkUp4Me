//
//  FeatureItem.swift
//  WorkUp4UI
//
//  Created by Võ Phúc Duy Nhật on 15/09/2023.
//

import SwiftUI

struct FeatureItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0.8){
            Spacer()
            Text("SwiftUI for WorkOut4UI")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            Text("20 sections - 3 hours".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("Build an WorkOut4UI App for assignment 3 in ip 14, 14 pro, 14 promax and ipad 11 and 12.9 inch")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial,in:
                RoundedRectangle(cornerRadius: 30,style: .continuous))
        .shadow(color: Color(.black).opacity(0.3), radius: 10, x: 0, y: 10)
        .padding(.horizontal, 20)
    }
}

struct FeatureItem_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItem()
    }
}
