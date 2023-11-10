//
//  Created by Alex.M on 20.06.2022.
//

import Foundation
import Combine

public typealias ChatPaginationClosure = (Message) -> Void

public final class ChatViewModel: ObservableObject {
    
    @Published public private(set) var fullscreenAttachmentItem: Optional<Attachment> = nil
    @Published public var fullscreenAttachmentPresented = false
    
    @Published var messageMenuRow: MessageRow?
    
    public var didSendMessage: (DraftMessage) -> Void = {_ in}
    
    public let textDidChangePublisher = PassthroughSubject<String, Never>()
    
    // Call this method whenever the text changes.
    public func textDidChange(_ newText: String) {
        textDidChangePublisher.send(newText)
    }
    
    public func presentAttachmentFullScreen(_ attachment: Attachment) {
        fullscreenAttachmentItem = attachment
        fullscreenAttachmentPresented = true
    }
    
    public func dismissAttachmentFullScreen() {
        fullscreenAttachmentPresented = false
        fullscreenAttachmentItem = nil
    }
    
    public func sendMessage(_ message: DraftMessage) {
        didSendMessage(message)
    }
}
