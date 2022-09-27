import SwiftUI
import RefdsUI
import RefdsIcons

struct IconsView {
    static var icons: [RefdsSFSymbol] = RefdsSFSymbol.allCases

    @ViewBuilder static func storybook(filter: String = "") -> some View {
        LazyVStack(alignment: .leading, spacing: .xSmall) {
            stackContent(filter: filter)
        }
    }

    @ViewBuilder static func stackContent(filter: String) -> some View {
        ForEach(0 ... icons(filter: filter).count / 3, id: \.self) { rowIndex in
            HStack(alignment: .top, spacing: .xSmall) {
                icon(index: rowIndex * 3, filter: filter)
                icon(index: rowIndex * 3 + 1, filter: filter)
                icon(index: rowIndex * 3 + 2, filter: filter)
            }
        }
    }

    @ViewBuilder static func icon(index: Int, filter: String) -> some View {
        if let icon = iconSymbol(index: index, filter: filter) {
            VStack(spacing: .small) {
                Image(symbol: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text(icon.rawValue, size: .custom(15), isSelectable: true)
                    .padding(.horizontal, .xSmall)
                    .overlay(
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: .hairline, lineCap: .round, dash: [.xxSmall]))
                            .foregroundColor(Color.inkLighter)
                    )
            }
            .padding(.horizontal, .xSmall)
            .padding(.vertical, .small)
            .frame(maxWidth: .infinity)
            .background(Color.whiteDarker)
            .tileBorder(.plain)
        } else {
            Color.whiteLighter
                .frame(height: 1)
                .padding(.horizontal, .xxSmall)
                .padding(.vertical, .xSmall)
                .frame(maxWidth: .infinity)
        }
    }

    static func icons(filter: String) -> [RefdsSFSymbol] {
        icons.filter { filter.isEmpty || $0.name.localizedCaseInsensitiveContains(filter) }
    }

    static func iconSymbol(index: Int, filter: String) -> RefdsSFSymbol? {
        let filteredIcons = icons(filter: filter)
        guard filteredIcons.indices.contains(index) else {
            return nil
        }
        return filteredIcons[index]
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            IconsView.storybook()
        }
    }
}


