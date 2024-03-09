return {
    {'vitalk/vim-simple-todo',
    init = function()
        vim.cmd("let g:simple_todo_map_keys=0")
        vim.cmd("let g:simple_todo_map_insert_mode_keys=0")
        vim.cmd("let g:simple_todo_map_normal_mode_keys=0")
        vim.cmd("let g:simple_todo_map_visual_mode_keys=0")
    end
    }
}
