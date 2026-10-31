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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.2/cuotai-0.82.2-aarch64-apple-darwin.tar.gz"
      sha256 "924143acb728102b727b97ca976f12ac705842458e4371bd779033434f982035"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.2/cuotai-0.82.2-x86_64-apple-darwin.tar.gz"
      sha256 "0887dcd67ce9caea0f7f2d890ff21a95abd10494136c1ad385291d62582f5707"
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
