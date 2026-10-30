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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.0/cuotai-0.82.0-aarch64-apple-darwin.tar.gz"
      sha256 "202a476058b4ae2fbbf6f8c090fc4c354ccda7e40393ef1ebce03840e6993442"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.82.0/cuotai-0.82.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b75d89007650d09db131ab54d76ce805931e7f995babdacda181718b8ece1d3"
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
