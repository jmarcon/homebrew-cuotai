# typed: strict
# frozen_string_literal: true

# Rendered by `cargo xtask package-manifests` from
# packaging/homebrew/Casks/cuotai-app.rb.tmpl. Do not edit by hand (PRD 0021 RF5.6).
cask "cuotai-app" do
  version "0.85.12"
  sha256 "e7c4017dc707a436cb051ea9448774d30e4654a1932b831d7c3a17b44604b18e"

  url "https://github.com/jmarcon/cuotai/releases/download/v0.85.12/Cuotai_#{version}_universal.dmg"
  name "Cuotai"
  desc "All your AI quotas, usage limits and costs in one place"
  homepage "https://github.com/jmarcon/cuotai"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Cuotai.app"

  # Uninstall preservation (PRD 0021 RF8.2): `brew uninstall --cask cuotai-app`
  # removes only the application. The paths below are removed solely by an
  # explicit `brew zap --cask cuotai-app` (never by a plain uninstall or an
  # upgrade). The configuration (`~/Library/Application Support/cuotai/`),
  # the local databases and the macOS Keychain entries (`cuotai.oauth`,
  # `cuotai.serve`) are preserved by both; see docs/releasing.md for the
  # documented purge commands.
  zap trash: [
    "~/Library/Caches/dev.cuotai.desktop",
    "~/Library/HTTPStorages/dev.cuotai.desktop",
    "~/Library/HTTPStorages/dev.cuotai.desktop.binarycookies",
    "~/Library/Preferences/dev.cuotai.desktop.plist",
    "~/Library/Saved Application State/dev.cuotai.desktop.savedState",
    "~/Library/WebKit/dev.cuotai.desktop",
  ]
end
