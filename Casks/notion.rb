cask "notion" do
  arch = Hardware::CPU.intel? ? "" : "-arm64"
  livecheck_folder = Hardware::CPU.intel? ? "mac" : "apple-silicon"

  if Hardware::CPU.intel?
    version "2.0.24"
    sha256 "aedd3ba982d8f98937cb5a1bf2f5ad5c92a28ad03ed45c6af93bf5cf43628350"
  else
    version "2.1.1"
    sha256 "87157b2a4521fd1b3aa7ec980794a609a0413b850f04f87c6677c21b579c77ce"
  end

  url "https://desktop-release.notion-static.com/Notion-#{version}#{arch}.dmg",
      verified: "desktop-release.notion-static.com/"
  name "Notion"
  desc "App to write, plan, collaborate, and get organized"
  homepage "https://www.notion.so/"

  livecheck do
    url "https://www.notion.so/desktop/#{livecheck_folder}/download"
    strategy :header_match
    regex(/Notion[._-]v?(\d+(?:\.\d+)*?)[^.]*?\.dmg/i)
  end

  auto_updates true

  app "Notion.app"

  zap trash: [
    "~/Library/Application Support/Caches/notion-updater",
    "~/Library/Application Support/Notion",
    "~/Library/Caches/notion.id",
    "~/Library/Logs/Notion",
    "~/Library/Preferences/notion.id.helper.plist",
    "~/Library/Preferences/notion.id.plist",
    "~/Library/Saved Application State/notion.id.savedState",
    "~/Library/WebKit/notion.id",
  ]
end
