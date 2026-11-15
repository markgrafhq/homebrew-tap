cask "markgraf" do
  version "0.0.57"
  sha256 "1d352d1319f07e8d636d25c46bf2432628b862a740f3b6714a1ed9906fe74efe"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.57/markgraf-darwin-arm64.tar.gz"
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
