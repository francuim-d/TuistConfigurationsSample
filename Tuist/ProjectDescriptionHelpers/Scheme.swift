import ProjectDescription

public extension Scheme {
    static func scheme(
        name: String,
        targetName: String,
        debugSettings: SettingsDictionary = [:],
        releaseSettings: SettingsDictionary = [:],
        xcconfigDebug: Path? = nil,
        xcconfigRelease: Path? = nil
    ) -> (
        scheme: Scheme,
        configurations: [Configuration]
    ) {
        let debugConfiguration = Configuration.debug(
            name: .configuration("\(name)-Debug"),
            settings: debugSettings,
            xcconfig: xcconfigDebug
        )
        let releaseConfiguration = Configuration.release(
            name: .configuration("\(name)-Release"),
            settings: releaseSettings,
            xcconfig: xcconfigRelease
        )
        let targetReference: TargetReference = "\(targetName)"
        let scheme = Scheme(
            name: "\(targetName)-\(name)",
            buildAction: .buildAction(targets: [targetReference]),
            runAction: .runAction(configuration: debugConfiguration.name, executable: targetReference),
            archiveAction: .archiveAction(configuration: releaseConfiguration.name),
            profileAction: .profileAction(configuration: debugConfiguration.name),
            analyzeAction: .analyzeAction(configuration: debugConfiguration.name)
        )
        return (scheme, [debugConfiguration, releaseConfiguration])
    }
}
