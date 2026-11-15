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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.7/cuotai-0.85.7-aarch64-apple-darwin.tar.gz"
      sha256 "995fea9d213eec767e1e7569b3096a051cd7bda4745443228d268715a2f6b3b7"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.7/cuotai-0.85.7-x86_64-apple-darwin.tar.gz"
      sha256 "6b475a96b7db4324af66e0e4309eb6534652d1835d3d13286765f54989f661dd"
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
