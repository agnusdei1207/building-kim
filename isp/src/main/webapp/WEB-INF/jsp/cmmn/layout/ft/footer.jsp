<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 


	<!-- footer -->
		<footer id="footer">
			<div class="footer_area">
				<div class="footer_box">
					<div class="customer_center" style="top:-1px">
						<table>
							<thead>
								<tr>
									<th colspan="2">고객센터</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>평일</th>
									<td class="r" > 09:00 ~ 18:00</td>
								</tr>
								<tr>
									<th>토요일</th>
									<td class="r" >09:00 ~ 12:00</td>
								</tr>
							</tbody>
						</table>
					</div>  
					<p class="address">주소 : ${ceoVO.ceAdd } </p>
					<ul class="clear">
						<li>대표 : ${ceoVO.ceName }  ㅣ  사업자등록번호 : ${ceoVO.ceNum }</li>
						<li class="li_val"><i class="fa fa-phone"></i>${ceoVO.ceHp }</li>
						<li><i class="fa fa-fax"></i>FAX : ${ceoVO.ceHp }</li>   
						<li><i class="fa fa-envelope"></i> ${ceoVO.ceHp }</li>
					</ul>
					<p class="copy">2022 Copyright by ${ceoVO.ceName } 사무소 &copy; all right reserved.</p>
				</div>
			</div>
		</footer>
		<!-- //footer -->
		
		
<script type="text/javascript">

var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

</script>