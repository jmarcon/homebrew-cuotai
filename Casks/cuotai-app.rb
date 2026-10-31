# typed: strict
# frozen_string_literal: true

# Rendered by `cargo xtask package-manifests` from
# packaging/homebrew/Casks/cuotai-app.rb.tmpl. Do not edit by hand (PRD 0021 RF5.6).
cask "cuotai-app" do
  version "0.82.3"
  sha256 "1076a43d02e69a72e7def1ff64a53e0ec214530df72feee16747c797c797611b"

  url "https://github.com/jmarcon/cuotai/releases/download/v0.82.3/Cuotai_#{version}_universal.dmg"
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
