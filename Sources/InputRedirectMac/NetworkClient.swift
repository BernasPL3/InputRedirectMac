import Foundation
import Network

final class NetworkClient: ObservableObject {

    static let shared = NetworkClient()

    @Published var connected = false

    private var connection: NWConnection?

    func connect(ip: String, port: UInt16 = 4950) {

        let host = NWEndpoint.Host(ip)

        guard let nwPort = NWEndpoint.Port(rawValue: port) else {
            return
        }

        connection = NWConnection(
            host: host,
            port: nwPort,
            using: .tcp
        )

        connection?.stateUpdateHandler = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .ready:
                    self?.connected = true
                case .failed(_):
                    self?.connected = false
                case .cancelled:
                    self?.connected = false
                default:
                    break
                }
            }
        }

        connection?.start(queue: .global())
    }

    func disconnect() {
        connection?.cancel()
        connection = nil
        connected = false
    }

    func send(data: Data) {
        connection?.send(
            content: data,
            completion: .contentProcessed { _ in }
        )
    }
}
