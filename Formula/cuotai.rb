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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.0/cuotai-0.87.0-aarch64-apple-darwin.tar.gz"
      sha256 "ae3ef455f6cf5e885993610e3c4c740ea96631d9722cae569d793bb9ea3c023d"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.87.0/cuotai-0.87.0-x86_64-apple-darwin.tar.gz"
      sha256 "7f9db7a252f4ff3bb7c78c3a424babfb98f8e10056296c96804c01e64d411409"
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
