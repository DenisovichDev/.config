return {
    settings = {
        texlab = {
            build = {
                executable = "latexmk",
                args = {
                    "-pdf",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f",
                },
                onSave = false,
                forwardSearchAfter = false,
            },

            forwardSearch = {
                executable = "zathura",
                args = {
                    "--synctex-forward",
                    "%l:1:%f",
                    "%p",
                },
            },

            chktex = {
                onOpenAndSave = true,
                onEdit = false,
            },

            diagnosticsDelay = 300,

            formatterLineLength = 80,
        },
    },
}
