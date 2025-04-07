<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
	// include file
	include('../layouts/header.php');
	include('../layouts/topbar.php');
	include('../layouts/sidebar.php');

	if (isset($_GET['id'])) {
		$id = $_GET['id'];
		// show data
		$showData = "SELECT id, ma_cong_viec, ten_cong_viec, mo_ta, tien_do FROM cong_viec WHERE id = $id";
		$result = mysqli_query($conn, $showData);
		$arrShow = array();
		$row = mysqli_fetch_array($result);
	}

	// delete record
	if (isset($_POST['save'])) {
		// create array error
		$error = array();
		$success = array();
		$showMess = false;

		// get id in form
		$titleLevel = $_POST['titleLevel'];
		$description = $_POST['description'];
		$trangThai = $_POST['trangThai'];

		// validate
		if (empty($titleLevel))
			$error['titleLevel'] = 'Vui lòng nhập <b> tên công việc </b>';

		if (!$error) {
			$showMess = true;
			$update = " UPDATE cong_viec SET 
                  ten_cong_viec = '$titleLevel',
                  mo_ta = '$description',
				  tien_do = '$trangThai'
                  WHERE id = $id";
			mysqli_query($conn, $update);
			$success['success'] = 'Lưu lại thành công';
			echo '<script>setTimeout("window.location=\'sua-cong-viec.php?p=todolist&a=todolist&id=' . $id . '\'",1000);</script>';
		}
	}

?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Công việc
			</h1>
			<ol class="breadcrumb">
				<li><a href="index.php?p=index&a=statistic"><i class="fa fa-dashboard"></i> Tổng quan</a></li>
				<li><a href="trinh-do.php?p=staff&a=level">Công việc</a></li>
				<li class="active">Chỉnh sửa công việc</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Chỉnh sửa công việc</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
								<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
							</div>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<?php
							// show error
							if (isset($error)) {
								if ($showMess == false) {
									echo "<div class='alert alert-danger alert-dismissible'>";
									echo "<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>";
									echo "<h4><i class='icon fa fa-ban'></i> Lỗi!</h4>";
									foreach ($error as $err) {
										echo $err . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<?php
							// show success
							if (isset($success)) {
								if ($showMess == true) {
									echo "<div class='alert alert-success alert-dismissible'>";
									echo "<h4><i class='icon fa fa-check'></i> Thành công!</h4>";
									foreach ($success as $suc) {
										echo $suc . "<br/>";
									}
									echo "</div>";
								}
							}
							?>
							<form action="" method="POST">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="exampleInputEmail1">Mã công viêc: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" name="positionCode" value="<?php echo $row['ma_cong_viec']; ?>" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Tên công việc: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên công việc" name="titleLevel" value="<?php echo $row['ten_cong_viec']; ?>">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Mô tả: </label>
											<textarea id="editor1" rows="10" cols="80" name="description"><?php echo $row['mo_ta']; ?>
                      </textarea>
										</div>
										<div class="form-group">
											<label>Trạng thái <span style="color: red;">*</span>: </label>
											<select class="form-control" name="trangThai">
												<?php
												if ($row['tien_do'] == 1) {
													echo "<option value='2' selected>Hoàn thành</option>";
													echo "<option value='1' selected>Đang tiến hành</option>";
													echo "<option value='0'>Nhận việc </option>";
												} else {
													echo "<option value='2' selected>Hoàn thành</option>";
													echo "<option value='1' selected>Đang tiến hành</option>";
													echo "<option value='0'>Nhận việc </option>";
												}
												?>


											</select>
											<small style="color: red;"><?php if (isset($error['trangThai'])) {
																			echo "Vui lòng chọn trạng thái";
																		} ?></small>
										</div>

										<!-- /.form-group -->
										<?php
										echo "<button type='submit' class='btn btn-warning' name='save'><i class='fa fa-save'></i> Lưu lại</button>";
										?>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</form>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>

<?php
	// include
	include('../layouts/footer.php');
} else {
	// go to pages login
	header('Location: dang-nhap.php');
}

?>
