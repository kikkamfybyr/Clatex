# LaTeX Project Portal

このプロジェクトは、$\text{up}\LaTeX$ と $\text{Lua}\LaTeX$ を併用できる自動ビルド環境です。

## 環境

- **Engine**: TeX Live 2025
- **Toolchain**: `latexmk`
- **Editor**: VSCode (LaTeX Workshop)

## ビルド方法

ファイルの1行目に以下の **Magic Comment** を記述することで、保存時に適切なエンジンで自動ビルドされます。

- **$\text{up}\LaTeX$ を使う場合:**
  `% !TEX program = uplatex`

- **$\text{Lua}\LaTeX$ を使う場合:**
  `% !TEX program = lualatex`

生成物はすべて `out/` ディレクトリに格納されます。

## ディレクトリ構成

- `.latexmkrc`: ビルドエンジンの自動判定ロジック
- `.vscode/settings.json`: VSCode用のビルド設定
- `out/`: ビルド生成物(Git管理外)
