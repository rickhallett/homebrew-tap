cask "nuke-menu" do
  version "0.2.0"
  sha256 "a85437dc050c06bd27294c37876d0d3d509105e1ec4af18411cda6c5ccaab238"

  url "https://github.com/rickhallett/nuke/releases/download/v#{version}/Nuke-#{version}-macos-universal.zip"
  name "Nuke"
  desc "Menu bar app that quits every running macOS app"
  homepage "https://github.com/rickhallett/nuke"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Nuke.app"

  # Ad-hoc signed; no Developer ID, so Gatekeeper needs a nudge once.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nuke.app"],
                   sudo: false
  end

  zap trash: "~/.config/nuke"
end
