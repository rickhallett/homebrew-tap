class Nuke < Formula
  desc "Quit every running macOS app from the command line"
  homepage "https://github.com/rickhallett/nuke"
  url "https://github.com/rickhallett/nuke/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "030a20a30b9b605aa24127ae4cedc11c1fd87173a56d61300314bd5183c56a5c"
  license "MIT"
  head "https://github.com/rickhallett/nuke.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nuke --version")
    # --list only reads the workspace; safe in a sandbox with no GUI session.
    system bin/"nuke", "--list"
  end
end
