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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.3/cuotai-0.82.3-aarch64-apple-darwin.tar.gz"
      sha256 "8b6a1e6e0fa431014ce234956bbbf511be71a943b1b65bb31a3cd8c9854c87f5"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.3/cuotai-0.82.3-x86_64-apple-darwin.tar.gz"
      sha256 "6da3b788c7f70ab4e65c09b680b174820fe108c426285509dcdb7e8c8282d4ac"
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
