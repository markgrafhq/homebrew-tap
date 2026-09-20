cask "markgraf" do
  version "0.0.42"
  sha256 "42dd22c75d088a057aa2dd47e6ac6473009abf9ef45b984456e67aa4a229b777"

  url "https://github.com/markgrafhq/homebrew-tap/releases/download/v0.0.42/markgraf-darwin-arm64.tar.gz"
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
