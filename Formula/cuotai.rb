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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.81.0/cuotai-0.81.0-aarch64-apple-darwin.tar.gz"
      sha256 "a9021fe9f6c0490ba1d51f9b1081dee29d3d771a2c1d9a17743044ca1be65445"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.81.0/cuotai-0.81.0-x86_64-apple-darwin.tar.gz"
      sha256 "c5868c494fffb28bff1901db90178130a5fb8cab5feea5ba440a4aea28dadf52"
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
