class Nuke < Formula
  desc "Quit every running macOS app from the command-line"
  homepage "https://github.com/rickhallett/nuke"
  url "https://github.com/rickhallett/nuke/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ffe3bc5158713cd15bd329569b284c6e97b34995364722ce3ea6efa7e797ce34"
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
