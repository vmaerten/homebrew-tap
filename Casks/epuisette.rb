cask "epuisette" do
  version "0.2.0"
  sha256 "b6135e4bc6523d1e7aeb2e86b1648cb8f5717d790405648a448334dfdf2c2fd1"

  url "https://github.com/vmaerten/epuisette/releases/download/v#{version}/epuisette_#{version}_darwin_arm64.zip"
  name "Épuisette"
  desc "Download videos from YouTube, X and other sites with yt-dlp"
  homepage "https://github.com/vmaerten/epuisette"

  depends_on arch: :arm64
  depends_on formula: ["yt-dlp", "ffmpeg", "deno"]
  depends_on macos: :monterey

  app "Épuisette.app"

  # Ad hoc signature, no notarisation: without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Épuisette.app"]
  end

  zap trash: [
    "~/Library/Caches/fr.vmaerten.epuisette",
    "~/Library/Preferences/fr.vmaerten.epuisette.plist",
    "~/Library/WebKit/fr.vmaerten.epuisette",
  ]
end
