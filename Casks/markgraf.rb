cask "markgraf" do
  version "0.0.53"
  sha256 "dd049808f0a590cf834999ff808ee01640136e99324ba6a04a93480054d6bb79"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.53/markgraf-darwin-arm64.tar.gz"
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
