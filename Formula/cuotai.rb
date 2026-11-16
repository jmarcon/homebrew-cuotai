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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.4/cuotai-0.86.4-aarch64-apple-darwin.tar.gz"
      sha256 "40914ff2b064965bca0d15fe1491f5964c5093b4126bd4f5de9a11c493c42dff"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.4/cuotai-0.86.4-x86_64-apple-darwin.tar.gz"
      sha256 "1fff3082af6a6bb65a6c4c30d7e7d8ffe05056f796e947fb2a015137a57488e5"
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
