------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },

            configuration = {
                updateBuildConfiguration = "interactive",
            },

            maven = {
                downloadSources = true,
            },

            implementationsCodeLens = {
                enabled = true,
            },

            referencesCodeLens = {
                enabled = true,
            },

            references = {
                includeDecompiledSources = true,
            },

            inlayHints = {
                parameterNames = {
                    enabled = "all",
                },
            },

            signatureHelp = {
                enabled = true,
            },

            contentProvider = {
                preferred = "fernflower",
            },

            completion = {
                favoriteStaticMembers = {
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Collections.*",
                    "java.util.stream.Collectors.*",
                },
            },
        },
    },
}
