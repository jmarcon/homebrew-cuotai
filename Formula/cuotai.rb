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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.6/cuotai-0.85.6-aarch64-apple-darwin.tar.gz"
      sha256 "c22a715a0182777d4fce69dd3f55f5316d980db8aeedc4ffc20bf89989d3fc9c"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.6/cuotai-0.85.6-x86_64-apple-darwin.tar.gz"
      sha256 "5dcbfee73f154baec8e5e93f62ef6d4ae9c5181068f373254bbdd906a92cbdb3"
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
