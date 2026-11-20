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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.3/cuotai-0.87.3-aarch64-apple-darwin.tar.gz"
      sha256 "fe31fb6b64acbdbad4fe2e64fcf4ec68cfd545d44e729c4d9793e4a4abeef220"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.3/cuotai-0.87.3-x86_64-apple-darwin.tar.gz"
      sha256 "837217dc652452d8244feae3b59927fb4e802e6257f2114cd4cfaecdb435f044"
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
