class Pbak < Formula
  desc "Photo backup utility: SD card -> SSD -> Immich via immich-go"
  homepage "https://github.com/timschmolka/photo-backup"
  url "https://github.com/timschmolka/photo-backup/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "45a5d0e5df2c1f12bfd3515c97eb484601e0f100830d71afc2ab161c224bf728"
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
