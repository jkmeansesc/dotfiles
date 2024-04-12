return {
    init_options = {
        installVale = false,
        configPath = os.getenv "HOME" .. "/.config/vale/.vale.ini",
        syncOnStartup = false,
    },
}
