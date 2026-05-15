cask "kaiden@next" do
  version "0.2.0-next.202605151229-eedd4f2a2"
  sha256 "63621c370bb95cfa824b62f95940cba5efe06c1f379373ff35f1bb5f73c8bd26"

  url "https://github.com/openkaiden/prereleases/releases/download/v#{version}/kaiden-#{version}-arm64.dmg",
      verified: "github.com/openkaiden/prereleases/"
  name "Kaiden (Development)"
  desc "Desktop app for agentic development (development build)"
  homepage "https://openkaiden.ai"

  livecheck do
    url "https://github.com/openkaiden/prereleases/releases"
    regex(/v?(\d+(?:\.\d+)+-next\.\d+-\h+)/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  auto_updates true
  conflicts_with cask: "kaiden"
  depends_on arch: :arm64

  app "Kaiden.app"

  zap trash: [
    "~/Library/Application Support/kaiden",
    "~/Library/Caches/kaiden",
    "~/Library/Preferences/kaiden.plist",
    "~/Library/Saved Application State/kaiden.savedState",
  ]
end
