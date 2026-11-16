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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.0/cuotai-0.86.0-aarch64-apple-darwin.tar.gz"
      sha256 "352b1428081c71a26e1a20db5a7e55e808166ec7884070c58c89106c049b9d6f"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.0/cuotai-0.86.0-x86_64-apple-darwin.tar.gz"
      sha256 "f148b72d4b098e34591badb9da7aaa7c9287291739c35561a4792c3a682e0f6b"
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
