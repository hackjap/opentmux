# opentmux

Oh My Tmux + Custom Settings - 한 줄 설치

## Quick Install

```bash
# curl | bash (한 줄 설치)
curl -fsSL "https://raw.githubusercontent.com/spjang-iotrust/opentmux/main/install.sh" | bash
```

## Alternative Install

```bash
# git clone 후 설치 (심볼릭 링크 방식)
git clone https://github.com/spjang-iotrust/opentmux.git ~/opentmux
cd ~/opentmux && ./install.sh
```

## Features

- [Oh My Tmux](https://github.com/gpakosz/.tmux) 기반
- Powerline 스타일 상태바 (Nerd Font 권장)
- Vim 스타일 pane 이동 (`<prefix> + h/j/k/l`)
- 마우스 지원
- TPM (Tmux Plugin Manager) 자동 설치
- 플러그인: resurrect, continuum, yank, fzf

## Key Bindings

| Key | Description |
|-----|-------------|
| `<prefix> + h/j/k/l` | Pane 이동 (vim style) |
| `<prefix> + H/J/K/L` | Pane 크기 조절 |
| `<prefix> + -` | 수평 분할 |
| `<prefix> + \|` | 수직 분할 |
| `<prefix> + c` | 새 창 |
| `<prefix> + n/p` | 다음/이전 창 |
| `<prefix> + r` | 설정 리로드 |
| `<prefix> + I` | 플러그인 설치 (TPM) |

> Prefix: `Ctrl+b` (또는 `Ctrl+a`)

## Requirements

- tmux 2.4+
- git
- Nerd Font (Powerline 아이콘 표시용, 선택사항)

## Uninstall

```bash
rm -rf ~/.tmux ~/.tmux.conf ~/.tmux.conf.local
```

## License

MIT
