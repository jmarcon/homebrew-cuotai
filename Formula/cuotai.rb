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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.9/cuotai-0.85.9-aarch64-apple-darwin.tar.gz"
      sha256 "03e94514a152e498b8f23e2fdfb7aa7a9d5583d87965554f0b0ac6e2ee777d90"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.9/cuotai-0.85.9-x86_64-apple-darwin.tar.gz"
      sha256 "4ec8493ad45ba8a070d0121ef03bbc0e85e191ab004c5aeded4c4b4c36b0e0dd"
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
