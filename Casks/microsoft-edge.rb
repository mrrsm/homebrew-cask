cask "microsoft-edge" do
  folder = on_arch_conditional arm:   "03adf619-38c6-4249-95ff-4a01c0ffc962",
                               intel: "C1297A47-86C4-4C1F-97FA-950631F94777"
  linkid = on_arch_conditional arm: "2093504", intel: "2069148"

  version "109.0.1518.78"
  sha256 arm:   "20a15bf4a76b3078f99146abb315c7f28882530d659c9b322eff7ad6cd3dda30",
         intel: "a5d59232a411f0d90fe080f739cd2cc14bc5bcea02d86250f9d5df84e32dd162"

  url "https://officecdn-microsoft-com.akamaized.net/pr/#{folder}/MacAutoupdate/MicrosoftEdge-#{version}.pkg",
      verified: "officecdn-microsoft-com.akamaized.net/"
  name "Microsoft Edge"
  desc "Web browser"
  homepage "https://www.microsoft.com/edge"

  livecheck do
    url "https://go.microsoft.com/fwlink/?linkid=#{linkid}"
    strategy :header_match
  end

  auto_updates true

  pkg "MicrosoftEdge-#{version}.pkg",
      choices: [
        {
          "choiceIdentifier" => "com.microsoft.package.Microsoft_AutoUpdate.app", # Office16_all_autoupdate.pkg
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
      ]

  uninstall pkgutil: "com.microsoft.edgemac"

  zap trash: [
        "~/Library/Application Scripts/com.microsoft.edgemac.wdgExtension",
        "~/Library/Application Support/Microsoft Edge",
        "~/Library/Application Support/Microsoft/EdgeUpdater",
        "~/Library/Caches/com.microsoft.edgemac",
        "~/Library/Caches/com.microsoft.EdgeUpdater",
        "~/Library/Caches/Microsoft Edge",
        "~/Library/Containers/com.microsoft.edgemac.wdgExtension",
        "~/Library/HTTPStorages/com.microsoft.edgemac",
        "~/Library/HTTPStorages/com.microsoft.edgemac.binarycookies",
        "~/Library/HTTPStorages/com.microsoft.EdgeUpdater",
        "~/Library/LaunchAgents/com.microsoft.EdgeUpdater.update.plist",
        "~/Library/LaunchAgents/com.microsoft.EdgeUpdater.update-internal.*.plist",
        "~/Library/LaunchAgents/com.microsoft.EdgeUpdater.wake.*.plist",
        "~/Library/Microsoft/EdgeUpdater",
        "~/Library/Preferences/com.microsoft.edgemac.plist",
        "~/Library/Saved Application State/com.microsoft.edgemac.app.*.savedState/",
        "~/Library/Saved Application State/com.microsoft.edgemac.savedState",
        "~/Library/WebKit/com.microsoft.edgemac",
      ],
      rmdir: "/Library/Application Support/Microsoft"
end
