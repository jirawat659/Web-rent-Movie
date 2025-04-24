<?php
include('db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $movie_ID = isset($_POST['movie_ID']) ? intval($_POST['movie_ID']) : 0;
    $movie_name = isset($_POST['movie_name']) ? trim($_POST['movie_name']) : '';
    $movie_price = isset($_POST['movie_price']) ? floatval($_POST['movie_price']) : 0;
    $type_ID = isset($_POST['type_ID']) ? intval($_POST['type_ID']) : 0;
    $movie_Status = isset($_POST['movie_Status']) ? intval($_POST['movie_Status']) : 1;
    $movievideo_Path = isset($_POST['movievideo_Path']) ? trim($_POST['movievideo_Path']) : '';

    if ($movie_ID == 0 || empty($movie_name) || $movie_price <= 0 || $type_ID == 0 || empty($movievideo_Path)) {
        die("❌ ข้อมูลไม่ครบถ้วน กรุณากรอกข้อมูลให้ครบ");
    }

    // ดึงข้อมูลโปสเตอร์เก่า (เผื่อไม่ได้อัปโหลดใหม่)
    $stmt = $conn->prepare("SELECT movie_Path FROM movie WHERE movie_ID = ?");
    $stmt->bind_param("i", $movie_ID);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows === 0) {
        die("❌ ไม่พบข้อมูลหนัง");
    }
    $row = $result->fetch_assoc();
    $old_movie_path = $row['movie_Path'];

    // ตรวจสอบว่ามีการอัปโหลดไฟล์โปสเตอร์ใหม่หรือไม่
    if (isset($_FILES['movie_path']) && $_FILES['movie_path']['error'] == UPLOAD_ERR_OK) {
        $upload_dir = "photo/";
        $tmp_name = $_FILES['movie_path']['tmp_name'];
        $filename = basename($_FILES['movie_path']['name']);
        $target_file = $upload_dir . $filename;

        // ย้ายไฟล์ไปยังโฟลเดอร์ photo
        if (!move_uploaded_file($tmp_name, $target_file)) {
            die("❌ เกิดข้อผิดพลาดในการอัปโหลดไฟล์ภาพโปสเตอร์");
        }

        $movie_Path = $target_file;
    } else {
        // ใช้โปสเตอร์เดิม
        $movie_Path = $old_movie_path;
    }

    // อัพเดตข้อมูลหนัง
    $stmt = $conn->prepare("UPDATE movie SET movie_name=?, movie_price=?, type_ID=?, movie_Status=?, movie_Path=?, movievideo_Path=? WHERE movie_ID=?");
    $stmt->bind_param("sdiissi", $movie_name, $movie_price, $type_ID, $movie_Status, $movie_Path, $movievideo_Path, $movie_ID);

    if ($stmt->execute()) {
        echo "<div style='text-align:center; margin-top:50px; color:#4CAF50; font-weight:bold;'>✅ แก้ไขข้อมูลหนังเรียบร้อยแล้ว</div>";
        echo "<div style='text-align:center; margin-top:20px;'><a href='manage_movie.php' style='text-decoration:none; color:#007BFF;'>🔙 กลับไปหน้าจัดการหนัง</a></div>";
    } else {
        echo "<div style='text-align:center; margin-top:50px; color:#dc3545; font-weight:bold;'>❌ เกิดข้อผิดพลาด: " . $stmt->error . "</div>";
    }

    $stmt->close();
    $conn->close();
} else {
    die("❌ ไม่สามารถเข้าถึงไฟล์นี้โดยตรง");
}
?>
