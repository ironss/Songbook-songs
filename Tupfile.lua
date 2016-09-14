
tup.creategitignore()

patterns = { 
   '*.txt',
   '*.pro',
   'Worship/*.txt',
   'Worship/*.pro',
}


for _, pattern in pairs(patterns) do
   files = tup.glob(pattern)
   for _, f_in in pairs(files) do
      local f_ps = 'pdf/' .. f_in .. '.ps'
      local f_pdf = 'pdf/' .. f_in .. '.pdf'
      print(f_in, f_ps, f_pdf)
      
      tup.definerule{
         inputs={ f_in },
         outputs={ f_pdf },
         command=table.concat({
            'chordii',
            '-c 12',
            --'-C LiberationSans-Bold',
            --'-C FreeSansBold',
            '-C Helvetica-Bold',
            '-t 12',
            --'-T LiberationSans',
            --'-T FreeSans',
            '-T Helvetica',
            '-G',
            '-P a4',
            '-a',
            '-w6',
            -- ' -o "'..f_ps..'"',
            '"'..f_in..'"',
            '|',
            'ps2pdf',
            '-',
            '"' .. f_pdf .. '"',
         }, ' ')
      }
   end
end

