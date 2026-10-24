cask "ghl" do
  version "0.3.1"
  sha256 "3632528debd85bd2493add36b0840fc7305f4e6812f1538a5a9c9285bea693b9"

  url "https://github.com/vmaerten/ghl/releases/download/v#{version}/ghl_#{version}_darwin_arm64.zip"
  name "ghl"
  desc "Review the PR you are about to open, without opening it"
  homepage "https://github.com/vmaerten/ghl"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ghl.app"
  binary "#{appdir}/ghl.app/Contents/MacOS/ghl"

  # Ad hoc signature, no notarisation: without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ghl.app"]
  end

  zap trash: [
    "~/Library/Application Support/ghl",
    "~/Library/Application Support/ghl Desktop",
  ]
end
