import AppKit

final class KeyboardCapture {

    static let shared = KeyboardCapture()

    private var monitor: Any?

    func start() {

        monitor = NSEvent.addLocalMonitorForEvents(
            matching: [.keyDown]
        ) { event in

            print("Tecla: \(event.keyCode)")

            return event
        }
    }

    func stop() {

        if let monitor {
            NSEvent.removeMonitor(monitor)
        }
    }
}
