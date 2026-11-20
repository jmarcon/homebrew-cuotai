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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.6/cuotai-0.87.6-aarch64-apple-darwin.tar.gz"
      sha256 "33dc157ce77a94d8f098310328365433de6dd512f109761984bcea50022c6e64"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.6/cuotai-0.87.6-x86_64-apple-darwin.tar.gz"
      sha256 "db912a0df3e51e55dc59312cc3f944953ede6a4f8727cc7e9658943eb2bd02f9"
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
