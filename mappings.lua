-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- jj escape mapping
    vim.keymap.set("i", "jj", "<Esc>"),

    ["<leader>a"] = { "<cmd>echo 'Hello World!'<cr>", desc = "Say hello world" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,

    -- 推奨設定ではjkをマッピングしているがjjの方が慣れているので
    vim.keymap.set("t", "jj", "<C-\\><C-n>", { silent = true }),

    -- Astronvimのmapping(/lua/astronvim/mappings.lua )で定義されているtoggleterm pluginのキーマップを無効化
    -- MEMO:Astronvimのデフォルトキーマッピングを書き換えるのではなく、
    -- ここのユーザー定義ファイルで書き換えてリポジトリで管理することで自身の環境を管理している。
    ["<C-l>"] = false,
    ["<C-k>"] = false,
  },
}
