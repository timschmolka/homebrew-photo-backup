class Pbak < Formula
  desc "Photo backup utility: SD card -> SSD -> Immich via immich-go"
  homepage "https://github.com/timschmolka/photo-backup"
  url "https://github.com/timschmolka/photo-backup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1c5c3d68419eae8ec5fc23867cc0019c265b2dc80405d0e359b6a7d192475750"
  license "MIT"

  depends_on "immich-go"
  depends_on "exiftool"

  def install
    bin.install "bin/pbak"
    lib.install Dir["lib/pbak"]
    zsh_completion.install "completions/pbak.zsh" => "_pbak"
  end

  test do
    assert_match "pbak #{version}", shell_output("#{bin}/pbak --version")
  end

  def caveats
    <<~EOS
      Run 'pbak setup' to configure your Immich server and default volumes.

      Configuration is stored at:
        ~/.config/pbak/config
    EOS
  end
end
