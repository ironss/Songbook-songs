
tup.creategitignore()

patterns = { 
   'Songs/*.pro',
   'Worship/*.pro',
   'Jazz/*.pro',
}

transpositions = 
{
   ['Worship/Here On The Earth.pro']={ '+8' },
   ['Worship/Overcome.pro']={ '+7' },
   ['Worship/Great Are You Lord.pro']={ '-2' },
   ['Worship/How Can I Keep From Singing.pro']={ '-5' },
   ['Worship/You Are My Strength.pro']={ '+2' },
   ['Worship/Wairua Tapu.pro']={ '+3' },
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
          --print(f_in, f_pdf)
          tup.definerule{
             inputs={ f_in },
             outputs={ f_pdf },
             command=table.concat({
                'chordpro',
                '--config=modern3',
                '--diagrams=none',
                '--define=pdf.papersize=a4',
                '--define=pdf.margintop=60',
                '--define=pdf.headspace=40',
--                '--define=pdf.showlayout=true',
                '"'..f_in..'"',
                tcmd,
                '-o "' .. f_pdf .. '"',
             }, ' ')
          }
       end
   end
end

