
<html>
<head>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
thead, td {
  padding: 5px;
}
th {
  text-align: left;
}
</style>

<script src='/queryPreset.js' defer>
</script>

<script>
function dispQuery(text)
{
document.getElementById('textField').value = text;
}
</script>


</head>
	<body onload='updateOptions();'>

<form id="queryForm" action="/home.php" method = "POST">
  Execute Query:<br>
  <input id="textField" type="text" name="query" placeholder="Query" size= 100 height = 10>
  <br>

  <input type="submit" value="Submit">
</form>

<form id="presetQueryForm" action="/home.php" method = "POST">
    <select name="query" id="presetQuery">
        <option onclick="dispQuery(this.value);">QI (Create)</option>
        <option onclick="dispQuery(this.value);">QI (Delete)</option>
	    <option onclick="dispQuery(this.value);">QI (Edit)</option>
	    <option onclick="dispQuery(this.value);">QI (Display)</option>
	    <option onclick="dispQuery(this.value);">QII (Create)</option>
        <option onclick="dispQuery(this.value);">QII (Delete)</option>
	    <option onclick="dispQuery(this.value);">QII (Edit)</option>
	    <option onclick="dispQuery(this.value);">QII (Display)</option>
	    <option onclick="dispQuery(this.value);">QIII (Create)</option>
        <option onclick="dispQuery(this.value);">QIII (Delete)</option>
	    <option onclick="dispQuery(this.value);">QIII (Edit)</option>
	    <option onclick="dispQuery(this.value);">QIII (Display)</option>
	    <option onclick="dispQuery(this.value);">QIV</option>
        <option onclick="dispQuery(this.value);">QV</option>
        <option onclick="dispQuery(this.value);">QVI</option>
        <option onclick="dispQuery(this.value);">QVII</option>
        <option onclick="dispQuery(this.value);">QVIII</option>
        <option onclick="dispQuery(this.value);">QIX</option>
        <option onclick="dispQuery(this.value);">QX</option>
        <option onclick="dispQuery(this.value);">QXI</option>
        <option onclick="dispQuery(this.value);">QXII</option>
        <option onclick="dispQuery(this.value);">QXIII</option>
        <option onclick="dispQuery(this.value);">QXIV</option>
        <option onclick="dispQuery(this.value);">QXV</option>
        <option onclick="dispQuery(this.value);">QXVI</option>
        <option onclick="dispQuery(this.value);">QXVII</option>
        <option onclick="dispQuery(this.value);">QXVIII</option>
        <option onclick="dispQuery(this.value);">QXIX</option>
        <option onclick="dispQuery(this.value);">QXX</option>
        <option onclick="dispQuery(this.value);">QXXI</option>
        <option onclick="dispQuery(this.value);">QXXII</option>        
    </select>
    <input type="submit" value="Submit">
</form>

<table class="gridtable" id="table1" border="1">
<?php
include "connect.php";


if (!empty ($_POST) ):

  $query = $_POST["query"];
  $queryDisp = str_replace("FROM", "<br>From", $query);
  $queryDisp = str_replace("INNER", "<br>&nbsp&nbsp&nbsp&nbsp&nbspINNER", $queryDisp);
  $queryDisp = str_replace("LEFT", "<br>&nbsp&nbsp&nbsp&nbsp&nbspLEFT", $queryDisp);
  $queryDisp = str_replace("WHERE", "<br>WHERE", $queryDisp);
  $queryDisp = str_replace("GROUP", "<br>GROUP", $queryDisp);
  $queryDisp = str_replace("SELECT", "<br>SELECT", $queryDisp);
  echo "Inputted Query: ";
  echo "<br><strong>".$queryDisp."</strong><br>";

  //Get Result
  $result = mysqli_query($con, $query);

  if (!$result) {
      printf("Error: %s\n", mysqli_error($con));
      exit();
  }

  if(gettype($result)=="object")
  //Fetch Data
  $posts = mysqli_fetch_all($result, MYSQLI_ASSOC);
  
  if (!empty($posts)):

  echo "<br><br>";

  echo 'Query Results:';
  echo '<th>';
  echo implode ('</th><th>', array_keys(current($posts)));
  echo '</th>';
  
  echo "<tbody>";

  foreach ($posts as $row):
    array_map('htmlentities', $row);
    echo'<tr>'.
    '<td>'.implode('<td>',$row);
    echo '</td>'.
    '</tr>';
  endforeach;

  else:
    echo ("No results are returned from the query");
  endif;
endif;
?>

</tbody> 
</table>
</body>
</html>

