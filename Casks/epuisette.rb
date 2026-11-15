cask "epuisette" do
  version "0.1.0"
  sha256 "efb660d7807fb3861cc1ca8c88481516ac36501a3ea7a80dbf41509f734c54a2"

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
