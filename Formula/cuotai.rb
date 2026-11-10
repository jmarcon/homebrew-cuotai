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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.9/cuotai-0.84.9-aarch64-apple-darwin.tar.gz"
      sha256 "4b00a5ab52d696fafb5a6d2f2edc22d1b4a4c1030eb761eaf50738cc1cba09e7"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.9/cuotai-0.84.9-x86_64-apple-darwin.tar.gz"
      sha256 "096ef07ba21c715888f8ae18f5bae862d92a4a3b908cfebd50491e67f03edaf2"
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
