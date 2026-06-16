import AppKit

enum KeyMapping {

    static func button(for key: String) -> String? {

        switch key.lowercased() {

        case "z":
            return "A"

        case "x":
            return "B"

        case "a":
            return "Y"

        case "s":
            return "X"

        case "q":
            return "L"

        case "w":
            return "R"

        default:
            return nil
        }
    }
}
