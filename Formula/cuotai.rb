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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.4/cuotai-0.87.4-aarch64-apple-darwin.tar.gz"
      sha256 "bff523161141ed309812a7ebfe64341c44108233de0bc4eadbe9d915d11621e4"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.4/cuotai-0.87.4-x86_64-apple-darwin.tar.gz"
      sha256 "9f552cab30e0191ce15c5f62968920a53f446367f6303adb1a32258abaa287f0"
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
