import SwiftUI

#if canImport(UIKit)
import UIKit

// Found on this blog https://mathijsbernson.nl/posts/using-readable-content-guides-in-swiftui/

struct ReadableContentWidth: ViewModifier {
    private let measureViewController = UIViewController()

    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: readableWidth(for: orientation))
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }

    private func readableWidth(for _: UIDeviceOrientation) -> CGFloat {
        measureViewController.view.frame = UIScreen.main.bounds
        let readableContentSize = measureViewController.view.readableContentGuide.layoutFrame.size
        return readableContentSize.width
    }
}

public extension View {
    func readableContentWidth() -> some View {
        modifier(ReadableContentWidth())
    }
}
#else

public extension View {
    // TODO: Figure out how to best handle this on non-UIKit platforms
    func readableContentWidth() -> some View {
        self.frame(maxWidth: 624)
    }
}
#endif

