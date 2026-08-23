-- ~/.config/nvim/init.lua

local opt = vim.opt
local g = vim.g
local api = vim.api
local keymap = vim.keymap.set

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    opt.guifont = "SauceCodePro Nerd Font:h14"
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_floating_blur_amount_x = 2.0

    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.9
end


-- ============================================================
-- Allgemeine Einstellungen
-- ============================================================

-- Diffs nebeneinander sauber anzeigen
opt.diffopt = { "vertical", "filler" }

-- Immer dunkler Hintergrund
opt.background = "dark"

-- Farbschema
-- Voraussetzung: Das Farbschema "molokai" ist installiert.
local colorscheme_ok = pcall(vim.cmd.colorscheme, "molokai")

if not colorscheme_ok then
    vim.notify(
        'Farbschema "molokai" wurde nicht gefunden; verwende Standardfarben.',
        vim.log.levels.WARN
    )
end

-- Syntax-Highlighting
vim.cmd("syntax enable")

-- Backspace über Einrückung, Zeilenanfang und Zeilengrenzen hinaus
opt.backspace = { "indent", "eol", "start" }

-- Zeilen bei 72 Zeichen umbrechen
opt.textwidth = 72

-- Immer fünf Zeilen vor/nach dem Cursor anzeigen
opt.scrolloff = 5

-- Tabulatorbreite
opt.tabstop = 4

-- Reguläre Ausdrücke "magisch" behandeln
opt.magic = true

-- Suche
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true

-- Keine akustischen Fehlersignale
opt.errorbells = false

-- Lieber visuelles Signal als Piepsen
opt.visualbell = true

-- Cursorposition anzeigen
opt.ruler = true

-- Befehle beim Tippen anzeigen
opt.showcmd = true

-- Verbesserte Befehlsvervollständigung
opt.wildmenu = true

-- Statuszeile immer anzeigen
opt.laststatus = 2

-- Statuszeile
opt.statusline = "%F %m%r%y%=%l-%v/%L"

-- Zeilennummern anzeigen
opt.number = true

-- GPG-Empfänger
g.GPGDefaultRecipients = {
    "GPG_FINGERPRINT_HERE",
}

-- Statt Tabs Leerzeichen verwenden
opt.expandtab = true

-- Länge der Soft-Tabstops
opt.softtabstop = 4

-- Einrückungsbreite
opt.shiftwidth = 4

-- Automatische und intelligente Einrückung
opt.autoindent = true
opt.smartindent = true

-- Schrift für Neovim-GUIs
--opt.guifont = "Monospace:h8"

-- Folding anhand der Syntax
opt.foldmethod = "syntax"
opt.foldenable = false

-- Dateityp-Erkennung und dateitypspezifische Plugins
vim.cmd("filetype plugin on")


-- ============================================================
-- Tastenkombinationen
-- ============================================================

local default_mapping_options = {
    silent = true,
}

-- Mit Strg+Pfeil-nach-unten eine neue Zeile öffnen
keymap("i", "<C-Down>", "<Esc>o", {
    silent = true,
    desc = "Neue Zeile unterhalb öffnen",
})

keymap("n", "<C-Down>", "o", {
    desc = "Neue Zeile unterhalb öffnen",
})

-- Mit Strg+Pfeil-nach-oben eine neue Zeile öffnen
keymap("i", "<C-Up>", "<Esc>O", {
    silent = true,
    desc = "Neue Zeile oberhalb öffnen",
})

keymap("n", "<C-Up>", "O", {
    desc = "Neue Zeile oberhalb öffnen",
})


-- ============================================================
-- Hervorhebungen
-- ============================================================

-- Zugehörige Klammern nur leicht blau färben
api.nvim_set_hl(0, "MatchParen", {
    fg = "blue",
    bg = "NONE",
    bold = false,
    underline = false,
})


-- ============================================================
-- Tabnavigation
-- ============================================================

keymap("n", "<C-t>", "<Cmd>tabnew<CR>", {
    silent = true,
    desc = "Neuen Tab öffnen",
})

keymap("n", "<C-l>", "gt", {
    desc = "Zum nächsten Tab wechseln",
})

keymap("n", "<C-h>", "gT", {
    desc = "Zum vorherigen Tab wechseln",
})

keymap("n", "<C-Right>", "gt", {
    desc = "Zum nächsten Tab wechseln",
})

keymap("n", "<C-Left>", "gT", {
    desc = "Zum vorherigen Tab wechseln",
})


-- ============================================================
-- Quickfix- und Location-List
-- ============================================================

keymap({ "n", "x", "o" }, "<C-j>", "<Cmd>lnext<CR>", {
    silent = true,
    desc = "Nächster Eintrag der Location-List",
})

keymap({ "n", "x", "o" }, "<C-k>", "<Cmd>lprevious<CR>", {
    silent = true,
    desc = "Vorheriger Eintrag der Location-List",
})

keymap({ "n", "x", "o" }, "<C-n>", "<Cmd>cnext<CR>", {
    silent = true,
    desc = "Nächster Quickfix-Eintrag",
})

-- Achtung: <C-m> entspricht im Terminal häufig der Enter-Taste.
keymap({ "n", "x", "o" }, "<C-m>", "<Cmd>cprevious<CR>", {
    silent = true,
    desc = "Vorheriger Quickfix-Eintrag",
})

keymap("n", "<Leader>a", "<Cmd>cclose<CR>", {
    silent = true,
    desc = "Quickfix-Liste schließen",
})


-- ============================================================
-- Rechtschreibprüfung
-- ============================================================

keymap("n", "<Leader>d", function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "de_de"
end, {
    desc = "Deutsche Rechtschreibprüfung aktivieren",
})

keymap("n", "<Leader>e", function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
end, {
    desc = "Englische Rechtschreibprüfung aktivieren",
})

keymap("n", "<Leader>n", function()
    vim.opt_local.spell = false
end, {
    desc = "Rechtschreibprüfung deaktivieren",
})


-- ============================================================
-- Dateitypspezifische Einstellungen
-- ============================================================

local filetype_group = api.nvim_create_augroup(
    "UserFileTypeSettings",
    { clear = true }
)

-- Perl: Kein automatischer Textumbruch
api.nvim_create_autocmd("FileType", {
    group = filetype_group,
    pattern = "perl",
    callback = function()
        vim.opt_local.textwidth = 0
    end,
    desc = "Perl-Einstellungen",
})

-- C: Kein automatischer Textumbruch und automatisches Speichern
api.nvim_create_autocmd("FileType", {
    group = filetype_group,
    pattern = "c",
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.autowrite = true
    end,
    desc = "C-Einstellungen",
})

-- CSV: Kein automatischer Textumbruch und kein visueller Zeilenumbruch
api.nvim_create_autocmd("FileType", {
    group = filetype_group,
    pattern = "csv",
    callback = function()
        vim.opt_local.textwidth = 0
        vim.opt_local.wrap = false
    end,
    desc = "CSV-Einstellungen",
})
