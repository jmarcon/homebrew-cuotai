# Rendered by `cargo xtask package-manifests` from
# packaging/homebrew/Formula/cuotai.rb.tmpl. Do not edit by hand (PRD 0021 RF5.6).
class Cuotai < Formula
  desc "Terminal dashboard and JSON CLI for AI-provider usage, quotas and costs"
  homepage "https://github.com/jmarcon/cuotai"
  # No `version` stanza: Homebrew scans it from the release URLs below
  # (`brew audit --strict` rejects a redundant version).
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.4/cuotai-0.82.4-aarch64-apple-darwin.tar.gz"
      sha256 "cabaae2bf9c77eee2a3f84836532c2ea45f36ba4094dd3303323de3bf03a28bf"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.4/cuotai-0.82.4-x86_64-apple-darwin.tar.gz"
      sha256 "0d18b9bb65ddad713b058891bc3fd615d85144860afcd0d7d3c08e25837924f0"
    end
  end

  def install
    bin.install "cuotai"
    # PRD 0031 RF3: `cuotai --completions SHELL`, installed for bash, zsh and fish.
    generate_completions_from_executable(bin/"cuotai", "--completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cuotai --version")
  end
end
