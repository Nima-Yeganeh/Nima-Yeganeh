
# You are given a DOM tree and have to find the table with the largest number of cells within it. A
# table is represented by the <table> tag, a table row is represented by <tr> and a single cell is
# represented by <td>.

# For example, given an HTML document with the following contents within the <body> tag:

# <div>
#     <p>First table</p>
#     <table>
#         <tr>
#             <td>First</td>
#             <td>row</td>
#         </tr>
#         <tr>
#             <td>and</td>
#             <td>second</td>
#             <td>row</td>
#         </tr>
#         <tr>
#             <td>and</td>
#             <td>the</td>
#             <td>third</td>
#             <td>one</td>
#        </tr>
#    </table>
# </div>

# <p>Second table</p>
# <table>
#     <tr>
#        <td>t</td>
#        <td>t1</td>
#     </tr>
#     <tr>
#        <td>td3</td>
#        <td>td4</td>
#     </tr>
#  </table>

# there are two tables in the DOM tree. The first table consists of nine cells and the second table consists of four cells. Thus, the correct answer is 9.
	


from bs4 import BeautifulSoup

def dom_tree(html):
    soup = BeautifulSoup(html, 'html.parser')
    all_tables = soup.select("table")
    # print(all_tables)
    rows = []
    for table in all_tables:
        row = table.select("td")
        rows.append(len(row))
    return max(rows)
    
print(dom_tree("<div> <p>First table</p> <table> <tr> <td>First</td> <td>row</td></tr><tr><td>and</td><td>second</td><td>row</td></tr><tr><td>and</td><td>the</td><td>third</td><td>one</td></tr></table></div><p>Second table</p><table><tr><td>t</td><td>t1</td></tr><tr><td>td3</td><td>td4</td></tr></table>"))  

