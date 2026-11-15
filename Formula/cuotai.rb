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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.12/cuotai-0.85.12-aarch64-apple-darwin.tar.gz"
      sha256 "828653905662c1af30b34ede59872fce4816e51febdf72d4cdef89fccc2a8db2"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.85.12/cuotai-0.85.12-x86_64-apple-darwin.tar.gz"
      sha256 "fd37da100c8a7df0f2a9b81265b4cb0b62f1b79f6d27e59a0f00943834fc7c1e"
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
