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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.4/cuotai-0.84.4-aarch64-apple-darwin.tar.gz"
      sha256 "95d4fa5853857045a92a3cc72f3624abc708182e39fbf037a248d7a18f114219"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.4/cuotai-0.84.4-x86_64-apple-darwin.tar.gz"
      sha256 "b738e2f3e887d3b1cdcea1f24f5e0daf3a48204a4c25f9e5f1ec9b666dc88c7e"
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
