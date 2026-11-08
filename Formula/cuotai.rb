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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.1/cuotai-0.84.1-aarch64-apple-darwin.tar.gz"
      sha256 "c65ea0fa405ac569abd439db36bd2298317c2612d392a6aa96cc8b2703c28123"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.1/cuotai-0.84.1-x86_64-apple-darwin.tar.gz"
      sha256 "4d0f11580e5ff02f0e786f2f9706bf34ff27303d56492555f02e3407fdad9fbd"
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
