if status is-interactive
    # Commands to run in interactive sessions can go here
end

#set -x http_proxy http://127.0.0.1:7897
#set -x https_proxy http://127.0.0.1:7897
set -x no_proxy localhost,127.0.0.1,::1

set -x ANDROID_HOME /home/cilxry/Android/Sdk
set -x CHROME_EXECUTABLE /usr/bin/google-chrome-stable

# DeepSeek API Key
if test -f ~/.local/share/secrets/deepseek.key
    set -gx DEEPSEEK_API_KEY (cat ~/.local/share/secrets/deepseek.key)
end

fish_add_path /home/cilxry/.flutter/bin
fish_add_path /$HOME/.pub-cache/bin

# ===== 环境变量 =====
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx BROWSER firefox-developer-edition
set -gx LANG zh_CN.UTF-8
set -gx LC_ALL ""

# ===== Fish 自身行为 =====
# 自动建议颜色（灰色）
#set -g fish_color_autosuggestion 888888

# 补全选中高亮
#set -g fish_color_selection --reverse --bold

# 历史搜索（↑↓ 模糊匹配）
set -g fish_history_max 10000

# 启动时不显示欢迎语（可选）
set -g fish_greeting ""

function mkcd
    mkdir -p $argv && cd $argv
end

abbr gst 'git status'
abbr gaa 'git add -A'
abbr gc 'git commit -m'
abbr gp 'git push'
abbr gl 'git pull'
abbr gs 'git switch'
abbr gd 'git diff'
abbr la 'eza -lha --icons --git'
abbr lt 'eza --tree --icons'
