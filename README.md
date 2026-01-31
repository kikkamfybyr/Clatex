# LaTeX Project Portal

このプロジェクトは、Windowsで $\text{up}\LaTeX$ と $\text{Lua}\LaTeX$ を併用できる自動ビルド環境です。

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

## 使用方法

1. **リポジトリをクローンする**
    `git clone https://github.com/kikkamfybyr/Clatex.git` を実行し、任意のディレクトリ（例：`D:\Clatex`）にプロジェクトを取得します。
2. **TeX Live 2025 をインストールする**
    インストーラーの詳細設定（Advanced）から `small scheme` を選択し、容量削減のため `Install font/macro doc tree` と `Install font/macro source tree` のチェックを外してインストールを完了させます。
    ![option](<225928.png>)
3. **不足パッケージとツールを個別に導入する**
    ターミナル（PowerShell等）で以下のコマンドを実行し、ビルドに必須となるツールと依存パッケージを一括で導入します。

    ```powershell
    tlmgr install latexmk simplekv
    ```

4. **環境変数を設定して VSCode を再起動する**
    インストール先にある `bin\windows` フォルダをシステム環境変数の **Path** に追加します。その後、VSCodeを再起動して設定を反映させてください。
5. **Magic Comment を記述してビルドする**
    `.tex` ファイルの 1 行目に以下の Magic Comment を記述して保存（`Ctrl + S`）すると、エンジンが自動判定され `out/` フォルダに PDF が生成されます。
    - **upLaTeX:** `% !TEX program = uplatex`
      ※ `\documentclass[uplatex, dvipdfmx, ...]{jlreq}` のように **`dvipdfmx`** を指定してください。
    - **LuaLaTeX:** `% !TEX program = lualatex`
