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

この環境を構築するには、必ず以下の手順を順番に進めてください。**特にターミナル操作は、すべて VSCode 内のターミナルで行うことを推奨します。**

### 1. **VSCode と拡張機能をインストールする**
   - [VSCode](https://code.visualstudio.com/) をダウンロードしてインストールします。
   - VSCode を開き、拡張機能タブ（`Ctrl+Shift+X`）から **LaTeX Workshop** を検索してインストールします。
   - **Japanese Language Pack** をインストールしてVSCodeを日本語化しておくとよいでしょう。

### 2. **リポジトリをクローンする**
   - VSCode のメニューから `ターミナル > 新しいターミナル` を開きます。
   - 以下のコマンドを入力し、プロジェクトを取得します。
     ```bash
     git clone [https://github.com/kikkamfybyr/Clatex.git](https://github.com/kikkamfybyr/Clatex.git)
     ```
   - クローン後、`ファイル > フォルダを開く` で `Clatex` フォルダを開き直してください。

### 3. **TeX Live 2025 をインストールする**
   - [TeX Live 公式](https://www.tug.org/texlive/acquire-netinstall.html) からインストーラーをダウンロードします。
   - **重要:** インストーラーを起動したら **「Advanced（詳細設定）」** をクリックしてください。
   - **Selected Scheme:** `small scheme` を選択します。
   - **Directories (TEXDIR)**: **`C:\texlive\2025`** （インフラ用フォルダ）に設定してください。
   - **Options:** `Install font/macro doc tree` と `Install font/macro source tree` の**チェックを外します**（容量を数GB節約できます）。
   - そのままインストールを完了させます。
   ![option](<225928.png>)

### 4. **不足パッケージとツールを導入する (VSCodeターミナルを使用)**
   - VSCode のターミナルを再度開き、以下のコマンドをコピー＆ペーストして実行してください。
   - ビルドに必須な `latexmk` と、化学構造式の描画に必要なパッケージを導入します。
     ```powershell
     tlmgr install latexmk simplekv
     ```

### 5. **環境変数（Path）の設定と VSCode の再起動**

   Windowsに「LaTeXのプログラムがどこにあるか」を教えるための最も重要なステップです。
    
   #### ① インストール先のパス（住所）をコピーする
   - エクスプローラーでインストール先の `bin\windows` フォルダ（例: `C:\texlive\2025\bin\windows`）を開きます。
   - 画面上部のアドレスバーをクリックし、青く反転したパスを右クリックして「コピー」します。
    
   #### ② 設定画面を開く
   - キーボードの **Windowsキー** を押し、そのまま「**env**」または「**環境変数**」と入力します。
   - 検索結果に表示される「**システム環境変数の編集**」をクリックして開きます。
    
   #### ③ Path（パス）を編集する
   - 開いた画面の右下にある **[環境変数...]** ボタンをクリックします。
   - 下側の「システム環境変数」という枠の中から **`Path`** という項目を探してクリックし、**[編集...]** を押します。
   - 右側の **[新規]** ボタンを押し、一番下にできた空欄に、先ほどコピーしたパスを貼り付けます。
   - 開いているすべてのウィンドウで **[OK]** を押して閉じます。
   
   #### ④ VSCode を「完全に」再起動する
   - VSCode のウィンドウ右上にある **「×」ボタン** を押して、一度完全に終了させます。
   - 再度 VSCode を起動します。これにより、先ほど設定した Path の情報が VSCode 内に反映されます。
   
   #### ⑤ 動作確認（重要）
   - VSCode のターミナル（`Ctrl + @`）を開き、以下のコマンドを入力して Enter を押してください。
     ```powershell
     latexmk -v

### 6. **Magic Comment を記述してビルドする**
   - `.tex` ファイルの 1 行目に以下の **Magic Comment** を記述して保存（`Ctrl + S`）してください。
   - **upLaTeX を使う場合:** `% !TEX program = uplatex`
     ※ `\documentclass[uplatex, dvipdfmx, ...]{jlreq}` のように **`dvipdfmx`** を必ず指定してください。
   - **LuaLaTeX を使う場合:** `% !TEX program = lualatex`
