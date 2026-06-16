import SwiftUI

struct ContentView: View {
    @State private var ipAddress = "192.168.1.100"
    @State private var isConnected = false
    @State private var status = "Desconectado"

    var body: some View {
        VStack(spacing: 20) {

            Text("InputRedirectMac")
                .font(.largeTitle)
                .bold()

            Text("Cliente NTR para Nintendo 3DS")
                .foregroundColor(.secondary)

            HStack {
                Text("IP do 3DS:")
                    .frame(width: 80, alignment: .leading)

                TextField("192.168.1.xxx", text: $ipAddress)
                    .textFieldStyle(.roundedBorder)
            }

            Text("Status: \(status)")
                .font(.headline)

            HStack(spacing: 15) {

                Button("Conectar") {
                    connect()
                }
                .disabled(isConnected)

                Button("Desconectar") {
                    disconnect()
                }
                .disabled(!isConnected)
            }

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Text("Controles:")
                    .font(.headline)

                Text("↑ ↓ ← → = D-Pad")
                Text("Z = A")
                Text("X = B")
                Text("A = Y")
                Text("S = X")
                Text("Q = L")
                Text("W = R")
                Text("Enter = Start")
                Text("Space = Select")
            }

            Spacer()
        }
        .padding()
        .frame(minWidth: 500, minHeight: 400)
    }

    func connect() {
        status = "Conectando..."
        
        // NetworkManager.shared.connect(ip: ipAddress)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isConnected = true
            status = "Conectado ao \(ipAddress)"
        }
    }

    func disconnect() {
        // NetworkManager.shared.disconnect()

        isConnected = false
        status = "Desconectado"
    }
}

#Preview {
    ContentView()
}
