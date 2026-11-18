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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.10/cuotai-0.86.10-aarch64-apple-darwin.tar.gz"
      sha256 "88b97b9ff96d056bc2fde0db6bc2649ed4fea4a6c5780b06f55a0a5c6cb37c6a"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.10/cuotai-0.86.10-x86_64-apple-darwin.tar.gz"
      sha256 "fff7d8af46096ee11032602e91f02750e97c804b407c876bb1e14ea2932e5cfc"
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
