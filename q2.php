<?php

$con = mysqli_connect(/*Removed for safety*/);



if(mysqli_connect_errno())
     {die("failed to connect to MYSQL:".mysqli_connect_error());}
else
     {echo "established database connection";}



$sandate = mysqli_real_escape_string($con, $_POST["form_q2"]);
$sandatee = mysqli_real_escape_string($con, $_POST["form_q2_e"]);
$santype = mysqli_real_escape_string($con, $_POST["form_q2_t"]);



$sql = "SELECT c.fname, sum(m.price) AS Total
FROM orders as o
JOIN customer as c ON c.id=o.cust_id
JOIN menu as m ON m.id=o.menu_id
WHERE o.d BETWEEN '$sandate' AND '$sandatee'
GROUP BY c.fname
ORDER BY Total $santype
LIMIT 1";


$result = mysqli_query($con, $sql);


if (mysqli_num_rows($result) > 0 ) {
     echo "<table>";
          echo "<tr>";
               echo "<th>Name</th>";
               echo "<th>Total</th>";
          echo "</tr>";

   while($row = mysqli_fetch_assoc($result)){
          echo "<tr>";
               echo "<td>" . $row['fname'] . "</td>";
               echo "<td>" . $row['Total'] . "</td>";
          echo "</tr>";
     echo "</table>";

   }
    
} else {echo "No Results!";}

mysqli_free_result($result);
mysqli_close($con)
?>
