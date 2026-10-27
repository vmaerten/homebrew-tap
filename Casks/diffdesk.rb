cask "diffdesk" do
  version "0.7.0"
  sha256 "dd9de5e1b56278894c9079a26cc4f482c8c64c73166f9fbd3dee3fe76283753d"

  url "https://github.com/vmaerten/ghl/releases/download/v#{version}/diffdesk_#{version}_darwin_arm64.zip"
  name "Diffdesk"
  desc "Review the PR you are about to open, without opening it"
  homepage "https://github.com/vmaerten/ghl"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Diffdesk.app"
  binary "#{appdir}/Diffdesk.app/Contents/MacOS/diffdesk"
  # The command's name before the app was renamed Diffdesk.
  binary "#{appdir}/Diffdesk.app/Contents/MacOS/diffdesk", target: "ghl"

  # Ad hoc signature, no notarisation: without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Diffdesk.app"]
  end

  zap trash: [
    "~/Library/Application Support/Diffdesk",
    "~/Library/Application Support/ghl Desktop",
    "~/Library/Application Support/ghl",
    "~/Library/Caches/dev.diffdesk.desktop",
    "~/Library/Caches/dev.ghl.desktop",
    "~/Library/Preferences/dev.diffdesk.desktop.plist",
    "~/Library/Preferences/dev.ghl.desktop.plist",
    "~/Library/WebKit/dev.diffdesk.desktop",
    "~/Library/WebKit/dev.ghl.desktop",
  ]
end
