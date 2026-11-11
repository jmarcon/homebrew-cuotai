# typed: strict
# frozen_string_literal: true

# Rendered by `cargo xtask package-manifests` from
# packaging/homebrew/Casks/cuotai-app.rb.tmpl. Do not edit by hand (PRD 0021 RF5.6).
cask "cuotai-app" do
  version "0.85.5"
  sha256 "0e50c532d64d938682db9b0e5d6d50acb6b1baac1b2410bb2bdd8771c2b64f59"

  url "https://github.com/jmarcon/cuotai/releases/download/v0.85.5/Cuotai_#{version}_universal.dmg"
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
