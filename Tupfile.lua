
tup.creategitignore()

patterns = { 
   '*.pro',
   'Worship/*.pro',
}


for _, pattern in pairs(patterns) do
   files = tup.glob(pattern)
   for _, f_in in pairs(files) do
      local f_pdf = 'pdf/' .. f_in .. '.pdf'
      --print(f_in, f_pdf)
      
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
            '"'..f_in..'"',
            '|',
            'ps2pdf',
            '-',
            '"' .. f_pdf .. '"',
         }, ' ')
      }
   end
end

