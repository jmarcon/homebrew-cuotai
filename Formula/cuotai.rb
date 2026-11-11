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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.5/cuotai-0.85.5-aarch64-apple-darwin.tar.gz"
      sha256 "119cb4803fac8e659442fa5a7654d6274b8ceb4212fd063dcbc22da218bb54be"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.5/cuotai-0.85.5-x86_64-apple-darwin.tar.gz"
      sha256 "617061aaa08f9a5bb9285ea970e67c411bb47dd4a11e31eaa8d0b4b72e69be74"
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
