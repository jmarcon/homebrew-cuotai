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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.10/cuotai-0.85.10-aarch64-apple-darwin.tar.gz"
      sha256 "70d0b663e9c2167f4d5d53a5b8c77bced80e0764f2b22cc848cc7f3b03e05157"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.10/cuotai-0.85.10-x86_64-apple-darwin.tar.gz"
      sha256 "f4c53feade20a295d56965bbcd7f50381e7fef10fc426a50adacd23bf667107f"
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
