<?php
include('db.php');

$rent_ID = isset($_GET['rent_ID']) ? intval($_GET['rent_ID']) : 0;

if ($rent_ID) {
    $sql = "UPDATE rent SET pickup_status = 'รับแล้ว' WHERE rent_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $rent_ID);
    $stmt->execute();
}

// กลับหน้า admin
header("Location: customer_detail.php?customer_id=" . $_GET['customer_id']);
exit();
?>
