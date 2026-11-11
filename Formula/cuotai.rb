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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.4/cuotai-0.85.4-aarch64-apple-darwin.tar.gz"
      sha256 "34710dde605e9fafaf3d0dd6a86ca1e4a9ab10556d5ae87df75c348504207008"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.4/cuotai-0.85.4-x86_64-apple-darwin.tar.gz"
      sha256 "5d36e38aa53ae37981e444d713fa8c8f652042e29c818552eb5306a031392736"
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
