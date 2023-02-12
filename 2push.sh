#!/bin/bash

echo "Menambahkan semua perubahan ke git..."
git add *

echo "Memasukkan pesan commit..."
read -p "Masukkan pesan commit: " message

echo "Melakukan commit..."
git commit -m "$message"

echo "Memeriksa apakah ada perubahan yang belum diteruskan ke remote repository..."
if git diff --stat origin/master..HEAD | grep -q ".*"; then
  echo "Ada perubahan yang belum diteruskan ke remote repository."
  read -p "Apakah Anda ingin meneruskan perubahan ke remote repository sekarang? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Meneruskan perubahan ke remote repository..."
    git push
  else
    echo "Perubahan tidak diteruskan ke remote repository."
  fi
else
  echo "Tidak ada perubahan yang belum diteruskan ke remote repository."
  echo "Meneruskan perubahan ke remote repository..."
  git push
fi
