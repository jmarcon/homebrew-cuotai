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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.1/cuotai-0.86.1-aarch64-apple-darwin.tar.gz"
      sha256 "bcae5a21156d3f45d56879143edba75e03d60f9ba0b574a18f870d0cdce4d1f6"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.1/cuotai-0.86.1-x86_64-apple-darwin.tar.gz"
      sha256 "f86f9eb89c4eb5b873b8030c132f92eb2d8ff83554c5c6ba3138eff6d656fcf7"
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
