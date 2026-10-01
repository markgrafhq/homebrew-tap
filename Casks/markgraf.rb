cask "markgraf" do
  version "0.0.45"
  sha256 "4868c1daff4234d34d7ea9ca632a65cd4585d20e39536d0685114dfecfa2502f"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.45/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagram editor and CLI"
  homepage "https://github.com/markgrafhq/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Markgraf Editor.app"
  binary "#{appdir}/Markgraf Editor.app/Contents/MacOS/markgraf", target: "markgraf"

  # Unsigned + un-notarized: strip quarantine so Gatekeeper
  # doesn't block first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Markgraf Editor.app"],
                   must_succeed: false
  end
end
