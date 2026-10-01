cask "markgraf" do
  version "0.0.44"
  sha256 "0b86f06b600c879a19998b4660881b882053aecd65323c5c7f0d90c16b33b466"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.44/markgraf-darwin-arm64.tar.gz"
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
