Sub AllClearForward()

' This code was created to cleanse a database of invoices, removing cleared invoices based on another sheet.
' For this code to work, the sheets must be named "ALL" and "CLEAR" based on their contents.
' In this particular code iteration, the key columns between the sheets are:
' ALL   = Column #13 / "M"
' CLEAR = Column #02 / "B"


        Dim fullCounter As Integer
        Dim nomatchCounter As Long
        Dim i As Integer
        
        Dim all As String
        Dim clear As String
        

                ' ALL sheet contains the list of all values with duplicates.
                ' CLEAR sheet contains the list of duplicates which will be deleted from the ALL sheet.
                
                all = "ALL"
                clear = "CLEAR"
        
                        ' 1st Loop - Loop through each value in the CLEAR sheet column.
                        ' 2nd Loop - Loop through each value in the ALL sheet column.
                        ' fullCounter is the maximum loop # which will decrease by "1" until it reaches "1".
                        ' "1 Step -1" prevents the loop from accessing the header column.
                        ' "i" is the interval between the loops.
                        ' "x" is one cell for each cell in the CLEAR sheet colum.
                        
                        fullCounter = Sheets(all).Cells(Rows.Count, 13).End(xlUp).Row
                        matchList = Sheets(clear).Cells(Rows.Count, 2).End(xlUp).Row
                        
                        
                        For Each x In Sheets(clear).Range("B1:B" & Sheets(clear).Cells(Rows.Count, 2).End(xlUp).Row)
                        
                              With x
                                      .NumberFormat = "0"
                                      .Value = .Value
                              End With
                                
                           For i = fullCounter To 1 Step -1

                              If x.Value = Sheets(all).Cells(i, 13).Value Then
                                      Sheets(all).Cells(i, 13).EntireRow.Interior.ColorIndex = 6

                              End If
                           Next i
                          
                        Next
                    


End Sub

Sub AllClearReverse()

' This code was created to cleanse a database of invoices, removing cleared invoices based on another sheet.
' For this code to work, the sheets must be named "ALL" and "CLEAR" based on their contents.
' In this particular code iteration, the key columns between the sheets are:
' ALL   = Column #13 / "M"
' CLEAR = Column #02 / "B"


        Dim fullCounter As Integer
        Dim nomatchCounter As Long
        Dim i As Integer
        
        Dim all As String
        Dim clear As String
        Dim boo As Boolean

        
                all = "ALL"
                clear = "CLEAR"
        
                        
                        fullCounter = Sheets(clear).Cells(Rows.Count, 2).End(xlUp).Row
                        matchList = Sheets(all).Cells(Rows.Count, 13).End(xlUp).Row
                        
                        
                        For Each x In Sheets(all).Range("M1:M" & Sheets(all).Cells(Rows.Count, 13).End(xlUp).Row)
                        
                              With x
                                      .NumberFormat = "0"
                                      .Value = .Value
                              End With
                                
                           For i = fullCounter To 1 Step -1

                              If x.Value = Sheets(clear).Cells(i, 2).Value Then
                              Sheets(clear).Cells(i, 2).EntireRow.Interior.ColorIndex = 6
                                End If
                            
                           Next i
                           
                        Next



End Sub

Sub ListAllClear()
Application.ScreenUpdating = False

Dim answer As Integer
answer = MsgBox("Highlight matching rows?", vbYesNo + vbQuestion, "All Clear Macro:")

If answer = vbYes Then
        
    Call AllClearForward
    Call AllClearReverse
    
Else
' Do Nothing

End If

MsgBox "Success."
Application.ScreenUpdating = True
End Sub
