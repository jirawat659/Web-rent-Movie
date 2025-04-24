<?php
include('db.php');

if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("❌ ไม่พบรหัสหนังที่ต้องการแก้ไข");
}

$movie_ID = intval($_GET['id']);

// ดึงข้อมูลหนังจากฐานข้อมูล
$stmt = $conn->prepare("SELECT * FROM movie WHERE movie_ID = ?");
$stmt->bind_param("i", $movie_ID);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("❌ ไม่พบหนังที่ต้องการแก้ไข");
}

$movie = $result->fetch_assoc();

// ดึงประเภทหนังทั้งหมดสำหรับเลือกในฟอร์ม
$type_result = mysqli_query($conn, "SELECT * FROM type_movie");
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>แก้ไขข้อมูลหนัง</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1e1e1e;
            color: white;
            padding: 20px;
            text-align: center;
        }
        form {
            background-color: #2e2e2e;
            padding: 20px;
            border-radius: 12px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            color: #ccc;
            text-align: left;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 25px;
            background-color: #007BFF;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a.back-btn {
            display: inline-block;
            margin-top: 15px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }
        a.back-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>แก้ไขข้อมูลหนัง</h2>

    <form method="POST" action="update_movie.php" enctype="multipart/form-data">
        <input type="hidden" name="movie_ID" value="<?= $movie['movie_ID'] ?>">

        <label>ชื่อหนัง:</label>
        <input type="text" name="movie_name" value="<?= htmlspecialchars($movie['movie_name']) ?>" required>

        <label>ราคา:</label>
        <input type="text" name="movie_price" value="<?= htmlspecialchars($movie['movie_price']) ?>" required>

        <label>ประเภท:</label>
        <select name="type_ID" required>
            <option value="">-- เลือกประเภท --</option>
            <?php while($type = mysqli_fetch_assoc($type_result)) : ?>
                <option value="<?= $type['type_ID'] ?>" <?= $type['type_ID'] == $movie['type_ID'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($type['type_name']) ?>
                </option>
            <?php endwhile; ?>
        </select>

        <label>สถานะ:</label>
        <select name="movie_Status" required>
            <option value="1" <?= $movie['movie_Status'] == 1 ? 'selected' : '' ?>>ขายอยู่</option>
            <option value="0" <?= $movie['movie_Status'] == 0 ? 'selected' : '' ?>>หยุดขาย</option>
        </select>

        <label>จำนวนคงเหลือ:</label>
        <input type="number" name="movie_stock" value="<?= htmlspecialchars($movie['movie_stock']) ?>" required>

        <label>โปสเตอร์ (ถ้าต้องการเปลี่ยน):</label>
        <input type="file" name="movie_path" accept="image/*"><br>
        <small>ไฟล์ปัจจุบัน: <?= htmlspecialchars(basename($movie['movie_Path'])) ?></small>

        <label>ลิ้งค์วิดีโอ:</label>
        <input type="text" name="movievideo_Path" value="<?= htmlspecialchars($movie['movievideo_Path']) ?>" required>

        <input type="submit" value="บันทึกการแก้ไข">
    </form>

    <a href="manage_movie.php" class="back-btn">🔙 กลับไปหน้าจัดการหนัง</a>
</body>
</html>
