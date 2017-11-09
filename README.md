mtime from EXIF
===============

Reads EXIF creation date from the specified file and sets the file's mtime to match.

Requires [`exiftool`](https://www.sno.phy.queensu.ca/~phil/exiftool/index.html). E.g.,

```
brew install exiftool
```

Usage
-----

```
./mtime-from-exif.sh FILE 
# OR
./mtime-from-exif.sh DIR
```

In the latter case, it looks at every file in the directory.

Todo? (ha)
----------

* It should probably accept expanded globs, but it doesn't.
