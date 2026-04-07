import Cocoa
import WebKit
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    func applicationDidFinishLaunching(_ n: Notification) {
        window = NSWindow(contentRect: NSMakeRect(0,0,1200,800),
                          styleMask: [.titled,.closable,.resizable,.miniaturizable],
                          backing: .buffered, defer: false)
        window.title = "Taller de Traducción"
        window.center()
        let wv = WKWebView(frame: window.contentView!.bounds)
        wv.autoresizingMask = [.width,.height]
        wv.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        let html = Bundle.main.url(forResource: "taller-de-traduccion", withExtension: "html")!
        wv.loadFileURL(html, allowingReadAccessTo: html.deletingLastPathComponent())
        window.contentView!.addSubview(wv)
        window.makeKeyAndOrderFront(nil)
    }
}
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
