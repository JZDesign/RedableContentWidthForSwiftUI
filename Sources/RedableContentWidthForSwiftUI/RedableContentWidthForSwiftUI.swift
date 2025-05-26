import SwiftUI

#if canImport(UIKit)
import UIKit

// Credit https://mathijsbernson.nl/posts/using-readable-content-guides-in-swiftui/

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

#else
struct ReadableContentWidth: ViewModifier {
    @ScaledMetric var scale = 1
    
    var scalableContentWidth: CGFloat {
        guard scale <= 1 else {
            return 624
        }
        return min(468 + (156 * scale), 900)
    }

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: scalableContentWidth)
    }
}
#endif

public extension View {
    func readableContentWidth() -> some View {
        modifier(ReadableContentWidth())
    }
}
