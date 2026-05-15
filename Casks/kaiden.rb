cask "kaiden" do
  version "0.2.1"
  sha256 "69c32666e69991de3eba4c9d2c58ea3c34d5918df0a2abf98abdef97ee5191f9"

  url "https://github.com/openkaiden/kaiden/releases/download/v#{version}/kaiden-#{version}-arm64.dmg",
      verified: "github.com/openkaiden/kaiden/"
  name "Kaiden"
  desc "Desktop app for agentic development"
  homepage "https://openkaiden.ai"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: "kaiden@next"
  depends_on arch: :arm64

  app "Kaiden.app"

  zap trash: [
    "~/Library/Application Support/kaiden",
    "~/Library/Caches/kaiden",
    "~/Library/Preferences/kaiden.plist",
    "~/Library/Saved Application State/kaiden.savedState",
  ]
end
