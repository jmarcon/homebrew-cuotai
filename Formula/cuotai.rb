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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.2/cuotai-0.84.2-aarch64-apple-darwin.tar.gz"
      sha256 "6c3c55768657562ef845a0e7abbcbc41029cf4d8ba7d56562fd280e5325bd384"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.2/cuotai-0.84.2-x86_64-apple-darwin.tar.gz"
      sha256 "ad5274b385bc7419ddb23f5754c40e96340f52ff11d6c5970bc90c86d504db0f"
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
