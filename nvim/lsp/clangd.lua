return {
    cmd = {
        "clangd",

        -- Keep an index of your project in the background
        "--background-index",

        -- Run clang-tidy diagnostics
        "--clang-tidy",

        -- Richer completion items
        "--completion-style=detailed",

        -- Insert missing includes using IWYU heuristics
        "--header-insertion=iwyu",

        -- Show function argument placeholders
        "--function-arg-placeholders",

        -- More informative completion results
        "--all-scopes",

        -- Pretty diagnostics
        "--pretty",
    },
}
