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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.83.1/cuotai-0.83.1-aarch64-apple-darwin.tar.gz"
      sha256 "c0cc98b890ec0714bd247178d5d6272ac9c3c2c86feb5b3b42201be72ac2b236"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.83.1/cuotai-0.83.1-x86_64-apple-darwin.tar.gz"
      sha256 "a3aeef805828dc19d76d00acfc3d143aca50923107dfc806deecf3939f49ffb3"
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
