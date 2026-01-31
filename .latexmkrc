#!/usr/bin/env perl

# --- 1. デフォルト設定 ---
$pdf_mode = 3; # デフォルトは uplatex

# --- 2. 判定ロジックの強化 (Windowsパス対応) ---
my $target = $ARGV[-1];
if (defined $target) {
    # 拡張子がない場合は .tex を補完
    my $fname = $target;
    $fname .= '.tex' unless $fname =~ /\.tex$/;
    
    if (-e $fname && open(my $fh, '<', $fname)) {
        while (<$fh>) {
            if (/% !?\s*TEX\s+program\s*=\s*(lualatex|uplatex)/i) {
                $pdf_mode = 4 if lc($1) eq 'lualatex';
                last;
            }
            last if $. > 20; # 20行目まで探索
        }
        close($fh);
    }
}

# --- 3. コマンド設定 ---
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$latex    = 'uplatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
$dvipdf   = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex -U %O -o %D %S';

$out_dir  = 'out';
$ENV{"LANG"} = "C.UTF-8";
$ENV{'LC_ALL'} = 'C.UTF-8';