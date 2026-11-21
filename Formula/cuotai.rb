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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.88.0/cuotai-0.88.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb664bdf01ab080ec51ff81d8ca20c2f5fb375d66ee55510180dfc06adc3e893"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.88.0/cuotai-0.88.0-x86_64-apple-darwin.tar.gz"
      sha256 "ee126f2d0975e5ea9fdd9afa1e99f44191a12ad47f113103efc76a38c8136014"
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
