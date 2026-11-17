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
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.8/cuotai-0.86.8-aarch64-apple-darwin.tar.gz"
      sha256 "218a1bf2f2e8689c3f5d0988765c997c2070100e76f69fc6871d885a3ed23aa7"
    end
    on_intel do
      url "https://github.com/jmarcon/cuotai/releases/download/v0.86.8/cuotai-0.86.8-x86_64-apple-darwin.tar.gz"
      sha256 "4be0e6ddba401b5af9359fa73a1cf5dc72ed1b9ae91e7de8120e7f5b50219d3e"
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
