cask "markgraf" do
  version "0.0.41"
  sha256 "dc04abc995836330840963af83733d559e2ac375329944e58f547adb99a46bf9"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.41/markgraf-darwin-arm64.tar.gz"
  name "markgraf"
  desc "Animated graph diagrams CLI"
  homepage "https://github.com/markgrafhq/homebrew-tap"

  binary "markgraf-darwin-arm64", target: "markgraf"

  # Unsigned + un-notarized: strip quarantine so Gatekeeper
  # doesn't block first launch.
  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/markgraf-darwin-arm64"],
                   must_succeed: false
  end
end
