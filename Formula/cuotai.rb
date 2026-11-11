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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.1/cuotai-0.85.1-aarch64-apple-darwin.tar.gz"
      sha256 "d7250aaf480c5fcb088560cf7bf22f2aff0b345ed46c93c7a91768f64f2901d5"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.1/cuotai-0.85.1-x86_64-apple-darwin.tar.gz"
      sha256 "2b0f150da2b716d278db42d3c30e94ae036b0009c5f799b2ce799348c9b91766"
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
