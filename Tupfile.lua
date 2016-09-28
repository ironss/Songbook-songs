
tup.creategitignore()

patterns = { 
   '*.pro',
   'Worship/*.pro',
}

transpositions = 
{
   ['Worship/Here On The Earth.pro']={ '+8' },
   ['Worship/Overcome.pro']={ '+7' },
   ['Worship/Great Are You Lord.pro']={ '-2' },
   ['Worship/How Can I Keep From Singing.pro']={ '-5' },
}

for _, pattern in pairs(patterns) do
   files = tup.glob(pattern)
   for _, f_in in pairs(files) do
      local tr = transpositions[f_in] or {}
      table.insert(tr, 1, 0)
      
      for _, tpos in pairs(tr) do
          local f_pdf = 'pdf/' .. f_in .. '.pdf'
          local tcmd = ''
          if tpos != 0 then
             f_pdf = 'pdf/' .. f_in .. '.' .. tpos .. '.pdf'
             tcmd = '-x ' .. tpos
          end
          print(f_in, f_pdf)
          
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
                '-w 4',
                '"'..f_in..'"',
                tcmd,
                '|',
                'ps2pdf',
                '-',
                '"' .. f_pdf .. '"',
             }, ' ')
          }
       end
   end
end

