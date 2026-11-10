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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.11/cuotai-0.84.11-aarch64-apple-darwin.tar.gz"
      sha256 "8cb5b21acfd0618cf24f11049dbbfdce7118d6a0f7a85f43485c810cb6a90be6"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.84.11/cuotai-0.84.11-x86_64-apple-darwin.tar.gz"
      sha256 "5d3455413ad2ae711d95ed03f729f0ba65ba89d9e68f61da42734ac7e79f67fe"
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
