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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.1/cuotai-0.87.1-aarch64-apple-darwin.tar.gz"
      sha256 "d77072bef8fc1cf44d4506adf13e1e137eccf95e1133d42af3f36be79f8a2683"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.1/cuotai-0.87.1-x86_64-apple-darwin.tar.gz"
      sha256 "0a52307d8c39415b5405404ee8f0edffade77c69b3003b33fb665ed4a4c64e70"
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
