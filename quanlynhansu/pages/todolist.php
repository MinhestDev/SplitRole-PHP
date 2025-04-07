<?php

// create session
session_start();

if (isset($_SESSION['username']) && isset($_SESSION['level'])) {
	// include file
	include('../layouts/header.php');
	include('../layouts/topbar.php');
	include('../layouts/sidebar.php');

	if (isset($_POST['edit'])) {
		$id = $_POST['idLevel'];
		echo "<script>location.href='sua-cong-viec.php?p=todolist&a=level&id=" . $id . "'</script>";
	}

	// show data
	$showData = "SELECT id, ma_cong_viec, ten_cong_viec, mo_ta, tien_do FROM cong_viec ORDER BY id DESC";
	$result = mysqli_query($conn, $showData);
	$arrShow = array();
	while ($row = mysqli_fetch_array($result)) {
		$arrShow[] = $row;
	}

	// create code room
	$levelCode = "MTD" . time();

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
			$insert = "INSERT INTO cong_viec(ma_cong_viec, ten_cong_viec, mo_ta, tien_do) 
			VALUES('$levelCode','$titleLevel', '$description', $trangThai)";

			mysqli_query($conn, $insert);
			$success['success'] = 'Thêm công việc thành công';
			echo '<script>setTimeout("window.location=\'todolist.php?p=staff&a=level\'",1000);</script>';
		}
	}

	// delete record
	if (isset($_POST['delete'])) {
		$showMess = true;

		$id = $_POST['idLevel'];
		$delete = "DELETE FROM cong_viec WHERE id = $id";
		mysqli_query($conn, $delete);
		$success['success'] = 'Xóa công việc thành công.';
		echo '<script>setTimeout("window.location=\'todolist.php?p=todolist&a=level\'",1000);</script>';
	}

?>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form method="POST">
					<div class="modal-header">
						<span style="font-size: 18px;">Thông báo</span>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="idLevel">
						Bạn có thực sự muốn xóa công việc này?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
						<button type="submit" class="btn btn-primary" name="delete">Xóa</button>
					</div>
				</form>
			</div>
		</div>
	</div>

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
				<li class="active">Danh sách công việc</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Thêm công việc</h3>
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
											<label for="exampleInputEmail1">Mã công việc<span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" name="positionCode" value="<?php echo $levelCode; ?>" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Tên công việc<span style="color: red;">*</span>: </label>
											<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên công việc" name="titleLevel">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Mô tả<span style="color: red;">*</span>: </label>
											<textarea id="editor1" rows="10" cols="80" name="description">
                      </textarea>
										</div>
										<div class="form-group">
											<label>Trạng thái <span style="color: red;">*</span>: </label>
											<select class="form-control" name="trangThai">
												<option value="chon">--- Chọn trạng thái ---</option>
												<option value="2">Hoàn thành</option>
												<option value="1">Đang tiến hành</option>
												<option value="0">Nhận việc</option>
											</select>
											<small style="color: red;"><?php if (isset($error['trangThai'])) {
																			echo "Vui lòng chọn trạng thái";
																		} ?></small>
										</div>
										<!-- /.form-group -->
										<?php
										echo "<button type='submit' class='btn btn-primary' name='save'><i class='fa fa-plus'></i> Thêm việc cần làm</button>";
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
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Danh sách công việc</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>STT</th>
											<th>Mã công việc</th>
											<th>Tên công việc</th>
											<th>Mô tả</th>
											<th>Tiến độ</th>
											<th>Sửa</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<?php
										$count = 1;
										foreach ($arrShow as $arrS) {
										?>
											<tr>
												>
												<td><?php echo $count; ?></td>
												<td><?php echo $arrS['ma_cong_viec']; ?></td>
												<td><?php echo $arrS['ten_cong_viec']; ?></td>
												<td><?php echo $arrS['mo_ta']; ?></td>
												<td>
													<?php
													if ($arrS['tien_do'] == 2) {
														echo '<span class="badge bg-blue"> Hoàn thành </span>';
													} else if ($arrS['tien_do'] == 1) {
														echo '<span class="badge bg-orange"> Đang tiến hành </span>';
													} else {
														echo '<span class="badge bg-red"> Nhận việc </span>';
													}
													?>
												</td>
												<th>
													<?php
													echo "<form method='POST'>";
													echo "<input type='hidden' value='" . $arrS['id'] . "' name='idLevel'/>";
													echo "<button type='submit' class='btn bg-orange btn-flat'  name='edit'><i class='fa fa-edit'></i></button>";
													echo "</form>";
													?>

												</th>
												<th>
													<?php
													echo "<button type='button' class='btn bg-maroon btn-flat' data-toggle='modal' data-target='#exampleModal' data-whatever='" . $arrS['id'] . "'><i class='fa fa-trash'></i></button>";
													?>
												</th>
											</tr>
										<?php
											$count++;
										}
										?>
									</tbody>
								</table>
							</div>
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
