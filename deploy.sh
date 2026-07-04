#!/usr/bin/env bash
set -e
mkdir -p deploy
cp index.html deploy/
cp aram.html deploy/
cp komitas.html deploy/
cp gallery.html deploy/
cp media.html deploy/
cp archive.html deploy/
cp styles.css deploy/
cp -R assets deploy/
cp -R media deploy/
