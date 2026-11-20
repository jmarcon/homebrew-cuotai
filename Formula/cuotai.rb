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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.7/cuotai-0.87.7-aarch64-apple-darwin.tar.gz"
      sha256 "defa23050ef008c1f622d004e90d142ce180a082ca10b22abdf1d2d0ed43ca63"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.7/cuotai-0.87.7-x86_64-apple-darwin.tar.gz"
      sha256 "42e6796b9f0a4e285366a1bc5ca25df9fe86582bd52fea394764724a59804491"
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
