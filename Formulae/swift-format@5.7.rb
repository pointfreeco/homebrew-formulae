class SwiftFormatAT57 < Formula
  desc "`swift-format` provides the formatting technology for SourceKit-LSP and the building blocks for doing code formatting transformations."
  homepage "https://github.com/apple/swift-format"
  url "https://github.com/apple/swift-format.git", :branch => "release/5.7",
  version "5.7"

  depends_on :xcode => ["14.0.1", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "-Xlinker", "-rpath", "-Xlinker", rpath
    bin.install ".build/release/swift-format"
    if OS.mac?
      deuniversalize_machos ".build/release/lib_InternalSwiftSyntaxParser.dylib"
      lib.install ".build/release/lib_InternalSwiftSyntaxParser.dylib"
    end
  end

  test do
    system "#{bin}/swift-format --version"
  end
end
