import SwiftUI

public extension RefdsSFSymbol {
    var name:String { return self.rawValue }

    @available(iOS 13.4, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    var image:Image { return Image(systemName:self.rawValue) }
}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public extension Image {
    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    init(systemName symbol: RefdsSFSymbol){
        self = Image(systemName: symbol.name)
    }

    @available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
    init(symbol: RefdsSFSymbol){
        self = Image(systemName: symbol.name)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public func Label(_ title: LocalizedStringKey, systemImage symbol: RefdsSFSymbol) -> Label<Text, Image> {
    return Label(title,systemImage:symbol.name)
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public func Label(_ title: LocalizedStringKey, symbol: RefdsSFSymbol) -> Label<Text, Image> {
    return Label(title,systemImage:symbol.name)
}
