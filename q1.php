<?php

$con = mysqli_connect(/*Removed for safety*/);



if(mysqli_connect_errno())
     {die("failed to connect to MYSQL:".mysqli_connect_error());}
else
     {echo "established database connection";}



$sandate = mysqli_real_escape_string($con, $_POST["form_q1"]);
$sandatee = mysqli_real_escape_string($con, $_POST["form_q1_e"]);
$santype = mysqli_real_escape_string($con, $_POST["form_q1_2"]);



$sql = "SELECT o.id1, sum(m.price) AS Total
FROM orders AS o
JOIN menu AS m ON o.menu_id=m.id
WHERE o.d BETWEEN '$sandate' AND '$sandatee'
GROUP BY o.id1
ORDER BY Total $santype
LIMIT 1";


$result = mysqli_query($con, $sql);


if (mysqli_num_rows($result) > 0 ) {
     echo "<table>";
          echo "<tr>";
               echo "<th>ID</th>";
               echo "<th>Total</th>";
          echo "</tr>";

   while($row = mysqli_fetch_assoc($result)){
          echo "<tr>";
               echo "<td>" . $row['id1'] . "</td>";
               echo "<td>" . $row['Total'] . "</td>";
          echo "</tr>";
     echo "</table>";

   }
    
} else {echo "No Results!";}

mysqli_free_result($result);
mysqli_close($con)
?>
