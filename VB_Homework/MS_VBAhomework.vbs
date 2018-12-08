Sub Multiple_year_stock_data()
'***********************************************************************************
'Stock market analyst

'INSTRUCTIONS
'Create a script that will loop through each year of stock data and grab
'   the total amount of volume each stock had over the year.
'You will also need to display the ticker symbol to coincide with the total volume.

'***********************************************************************************

    ' --------------------------------------------
    ' LOOP THROUGH ALL SHEETS IN THE WORKBOOK
    ' --------------------------------------------
    For Each ws In Worksheets
    
            '****************************************************************************
        '* Application.ScreenUpdating is a setting within Excel that                *
        '* – when turned on – will visibly update the Excel worksheet on            *
        '* your screen any time there is a change that happens within the worksheet.*
        '* This can dramatically increase the speed of your code                    *
        '****************************************************************************
        
        ' First turn off Application.ScreenUpdating so we won’t refresh the screen
        ' constantly until the work is completed
        Application.ScreenUpdating = False
    
    
    
        ' --------------------------------------------
        ' CREATE TICKER AND TOTAL VOLUME COLUMNS
        ' --------------------------------------------
        
        ' Determine the Last Column Number
        lastColumn = ws.Cells(1, Columns.Count).End(xlToLeft).Column
        
        ' 2 columns after the last column add the word Ticker to the Column Header
        ws.Cells(1, lastColumn + 2).Value = "Ticker2"
        
        ' 3 columns after the last column add the words Total Volume to the Column Header
        ws.Cells(1, lastColumn + 3).Value = "Total Volume"
        
        ' Determine the new Last Column Number
        lastColumn = ws.Cells(1, Columns.Count).End(xlToLeft).Column
        
        
        '------------------------------------------------
        '   loop through each year of stock data
        '------------------------------------------------
        
        Dim myTickerValue As Variant
        Dim myTickerCol As Integer
        Dim myTickerRow As Integer
        Dim TotalVolumeValue As Long
        
        
        'Which column to look at?
        myTickerCol = 1
        'Which row to look at first?
        myTickerRow = 2
        ' Determine the Last Row
        lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
        
        'where the first ticker value is stored
        myTickerValue = Cells(myTickerRow, myTickerCol)
        startRow = 2
        
       'initiate total volume
        acumTotal = 0
        
        For i = myTickerRow To lastRow
            'check if next row has the same ticker value as current ticker value
            If ws.Cells(i + 1, myTickerCol).Value = myTickerValue Then
                
                'Get the value in the volume column
                RowVol = ws.Cells(i, lastColumn - 3).Value
                
                'Total volume
                acumTotal = acumTotal + RowVol
                
                'MsgBox (acumTotal)
                
            'check if next row has a different ticker value than the current ticker value
            ElseIf ws.Cells(i + 1, myTickerCol).Value <> myTickerValue Then
            
                'get the last volume in the current ticker group
                'and then adding it to the total volume before moving to the next ticker group
                RowVol = ws.Cells(i, lastColumn - 3).Value
                acumTotal = acumTotal + RowVol
            
                
                'insert current ticker group into the Ticker2 column before moving to the next ticker group
                ws.Cells(startRow, lastColumn - 1).Value = myTickerValue
                
                'insert the Total volume into total volume column before moving to the next ticker group
                ws.Cells(startRow, lastColumn).Value = acumTotal
                
                startRow = startRow + 1
                
                '*******************
                '* New group begins*
                '*******************
                
                'initiate total volume of the next group
                acumTotal = 0
                
                'set current ticker value to the next ticker value
                myTickerValue = ws.Cells(i + 1, myTickerCol).Value
                
                'MsgBox (myTickerValue)
                
            End If
             
       Next i   'next row
       
       Application.ScreenUpdating = True

    Next ws 'worksheet
                

End Sub
