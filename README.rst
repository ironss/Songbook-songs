Various songs in Chordpro format for Songbook and ChordPro.


Policies
========

1. Store chordpro files on Dropbox so that SongBook (Android) can synchronise 
   these files.

2. Use Chordii 4.5.3 and ps2pdf to generate PDF charts.

3. Use tup to generate new PDF charts when source file changes.

4. Do not synchronise pdf outputs, because the Dropbox synchronisation 
   conflicts with the change detection of tup so that tup always generates
   all PDF files.

5. Do not synchronise .git or .tup directories on Dropbox, because they are
   not needed elsewhere.

6. You can do a git checkout anywhere, but then you lose the Dropbox sync
   with SongBook.

7. Note that there are slight differences in the way that SongBook and Chordii 
   understand chordpro format, but nothing too serious.
   


Notes
=====

Some files are text files in a format with separate lines of chords
and words. Chordii does not handle these properly.

Some files are text files in a format with comments written in square
brackets rather than curlies.

