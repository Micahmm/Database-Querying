<?php

$con = mysqli_connect(/*Removed for safety*/);



if(mysqli_connect_errno())
     {die("failed to connect to MYSQL:".mysqli_connect_error());}
else
     {echo "established database connection";}

$sandate = mysqli_real_escape_string($con, $_POST["form_q5"]);
$sandatee = mysqli_real_escape_string($con, $_POST["form_q5_e"]);


$sql = "SELECT CONCAT(e.fname,' ',e.lname) AS Name, o.id1
FROM orders AS o
JOIN employee as e ON e.id=o.driver_id
WHERE NOT EXISTS (
     SELECT *
     FROM orders AS o1
     WHERE o1.d BETWEEN '$sandate' AND '$sandatee'
     AND e.job = 'Driver'
)
GROUP BY Name
ORDER BY o.d";


$result = mysqli_query($con, $sql);


if (mysqli_num_rows($result) > 0 ) {
     echo "<table>";
          echo "<tr>";
               echo "<th>Name</th>";
               echo "<th>Order ID</th>";
          echo "</tr>";


   while($row = mysqli_fetch_assoc($result)){
          echo "<tr>";
               echo "<td>" . $row['Name'] . "</td>";
               echo "<td>" . $row['id1'] . "</td>";
          echo "</tr>";

   }
     echo "</table>";
} else {echo "No Results!";}

mysqli_free_result($result);
mysqli_close($con)
?>
