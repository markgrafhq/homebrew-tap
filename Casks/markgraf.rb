cask "markgraf" do
  version "0.0.46"
  sha256 "c442c6dd97c1e24f165b258bd4d71095aded579e672f15a090dacbc50689fc0b"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.46/markgraf-darwin-arm64.tar.gz"
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
