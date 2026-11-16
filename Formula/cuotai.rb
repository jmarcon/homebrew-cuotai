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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.2/cuotai-0.86.2-aarch64-apple-darwin.tar.gz"
      sha256 "850ffe16547a405918fcd16de7999906e37b0be25d859c9a1b9c597bc270252d"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.2/cuotai-0.86.2-x86_64-apple-darwin.tar.gz"
      sha256 "ab1c08d2e1108d15a1dd6ebcb81ab1d83b86971ac033eb7259e8b6514f786eb0"
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
