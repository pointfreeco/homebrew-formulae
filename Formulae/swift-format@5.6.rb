class SwiftFormatAT56 < Formula
    desc "`swift-format` provides the formatting technology for SourceKit-LSP and the building blocks for doing code formatting transformations."
    homepage "https://github.com/apple/swift-format"
    url "https://github.com/apple/swift-format.git", :branch => "release/5.6"
    version "5.6"

    depends_on :xcode => ["13.1", :build]

    def install
        system "swift build -c release --disable-sandbox --build-path '.build'"
        bin.install ".build/release/swift-format"
    end

    test do
        system "#{bin}/swift-format --version"
    end
end
