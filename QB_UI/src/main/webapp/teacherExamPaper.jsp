<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- 강사 시험감독 페이지 -->

<div id='ans0'
	style='display: none; width: 100%; height: 100%; padding-left: 0px;'>
	<table width='100%' height='30' align='center' cellspacing='0'
		cellpadding='2'>
		<tr>
			<td align='center'
				style='color: green; font-weight: bold; border: solid 1px #ccc; border-bottom: none'>1과목</td>
		</tr>
	</table>
	<table style='width: 100%; text-align: center;' cellspacing='0'
		cellpadding='0' border='0px'>
		<tr style='height: 25px;'>
			<td id='ans_num1'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(0)' style='color: #008000;'>1</a></td>
			<td id='ans_td11' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(1, 1)'><img id='answer11'
					src='./img/num1.gif'></td>
			<td id='ans_td12' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(1, 2)'><img id='answer12'
					src='./img/num2.gif'></td>
			<td id='ans_td13' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(1, 3)'><img id='answer13'
					src='./img/num3.gif'></td>
			<td id='ans_td14' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(1, 4)'><img id='answer14'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num2'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(1)' style='color: #008000;'>2</a></td>
			<td id='ans_td21' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(2, 1)'><img id='answer21'
					src='./img/num1.gif'></td>
			<td id='ans_td22' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(2, 2)'><img id='answer22'
					src='./img/num2.gif'></td>
			<td id='ans_td23' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(2, 3)'><img id='answer23'
					src='./img/num3.gif'></td>
			<td id='ans_td24' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(2, 4)'><img id='answer24'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num3'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(2)' style='color: #008000;'>3</a></td>
			<td id='ans_td31' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(3, 1)'><img id='answer31'
					src='./img/num1.gif'></td>
			<td id='ans_td32' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(3, 2)'><img id='answer32'
					src='./img/num2.gif'></td>
			<td id='ans_td33' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(3, 3)'><img id='answer33'
					src='./img/num3.gif'></td>
			<td id='ans_td34' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(3, 4)'><img id='answer34'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num4'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(3)' style='color: #008000;'>4</a></td>
			<td id='ans_td41' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(4, 1)'><img id='answer41'
					src='./img/num1.gif'></td>
			<td id='ans_td42' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(4, 2)'><img id='answer42'
					src='./img/num2.gif'></td>
			<td id='ans_td43' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(4, 3)'><img id='answer43'
					src='./img/num3.gif'></td>
			<td id='ans_td44' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(4, 4)'><img id='answer44'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num5'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(4)' style='color: #008000;'>5</a></td>
			<td id='ans_td51' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(5, 1)'><img id='answer51'
					src='./img/num1.gif'></td>
			<td id='ans_td52' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(5, 2)'><img id='answer52'
					src='./img/num2.gif'></td>
			<td id='ans_td53' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(5, 3)'><img id='answer53'
					src='./img/num3.gif'></td>
			<td id='ans_td54' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(5, 4)'><img id='answer54'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num6'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(5)' style='color: #008000;'>6</a></td>
			<td id='ans_td61' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(6, 1)'><img id='answer61'
					src='./img/num1.gif'></td>
			<td id='ans_td62' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(6, 2)'><img id='answer62'
					src='./img/num2.gif'></td>
			<td id='ans_td63' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(6, 3)'><img id='answer63'
					src='./img/num3.gif'></td>
			<td id='ans_td64' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(6, 4)'><img id='answer64'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num7'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(6)' style='color: #008000;'>7</a></td>
			<td id='ans_td71' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(7, 1)'><img id='answer71'
					src='./img/num1.gif'></td>
			<td id='ans_td72' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(7, 2)'><img id='answer72'
					src='./img/num2.gif'></td>
			<td id='ans_td73' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(7, 3)'><img id='answer73'
					src='./img/num3.gif'></td>
			<td id='ans_td74' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(7, 4)'><img id='answer74'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num8'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(7)' style='color: #008000;'>8</a></td>
			<td id='ans_td81' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(8, 1)'><img id='answer81'
					src='./img/num1.gif'></td>
			<td id='ans_td82' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(8, 2)'><img id='answer82'
					src='./img/num2.gif'></td>
			<td id='ans_td83' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(8, 3)'><img id='answer83'
					src='./img/num3.gif'></td>
			<td id='ans_td84' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(8, 4)'><img id='answer84'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num9'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(8)' style='color: #008000;'>9</a></td>
			<td id='ans_td91' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(9, 1)'><img id='answer91'
					src='./img/num1.gif'></td>
			<td id='ans_td92' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(9, 2)'><img id='answer92'
					src='./img/num2.gif'></td>
			<td id='ans_td93' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(9, 3)'><img id='answer93'
					src='./img/num3.gif'></td>
			<td id='ans_td94' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(9, 4)'><img id='answer94'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num10'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(9)' style='color: #008000;'>10</a></td>
			<td id='ans_td101' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(10, 1)'><img id='answer101'
					src='./img/num1.gif'></td>
			<td id='ans_td102' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(10, 2)'><img id='answer102'
					src='./img/num2.gif'></td>
			<td id='ans_td103' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(10, 3)'><img id='answer103'
					src='./img/num3.gif'></td>
			<td id='ans_td104' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(10, 4)'><img id='answer104'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num11'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(10)' style='color: #008000;'>11</a></td>
			<td id='ans_td111' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(11, 1)'><img id='answer111'
					src='./img/num1.gif'></td>
			<td id='ans_td112' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(11, 2)'><img id='answer112'
					src='./img/num2.gif'></td>
			<td id='ans_td113' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(11, 3)'><img id='answer113'
					src='./img/num3.gif'></td>
			<td id='ans_td114' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(11, 4)'><img id='answer114'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num12'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(11)' style='color: #008000;'>12</a></td>
			<td id='ans_td121' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(12, 1)'><img id='answer121'
					src='./img/num1.gif'></td>
			<td id='ans_td122' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(12, 2)'><img id='answer122'
					src='./img/num2.gif'></td>
			<td id='ans_td123' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(12, 3)'><img id='answer123'
					src='./img/num3.gif'></td>
			<td id='ans_td124' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(12, 4)'><img id='answer124'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num13'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(12)' style='color: #008000;'>13</a></td>
			<td id='ans_td131' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(13, 1)'><img id='answer131'
					src='./img/num1.gif'></td>
			<td id='ans_td132' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(13, 2)'><img id='answer132'
					src='./img/num2.gif'></td>
			<td id='ans_td133' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(13, 3)'><img id='answer133'
					src='./img/num3.gif'></td>
			<td id='ans_td134' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(13, 4)'><img id='answer134'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num14'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(13)' style='color: #008000;'>14</a></td>
			<td id='ans_td141' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(14, 1)'><img id='answer141'
					src='./img/num1.gif'></td>
			<td id='ans_td142' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(14, 2)'><img id='answer142'
					src='./img/num2.gif'></td>
			<td id='ans_td143' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(14, 3)'><img id='answer143'
					src='./img/num3.gif'></td>
			<td id='ans_td144' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(14, 4)'><img id='answer144'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num15'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(14)' style='color: #008000;'>15</a></td>
			<td id='ans_td151' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(15, 1)'><img id='answer151'
					src='./img/num1.gif'></td>
			<td id='ans_td152' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(15, 2)'><img id='answer152'
					src='./img/num2.gif'></td>
			<td id='ans_td153' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(15, 3)'><img id='answer153'
					src='./img/num3.gif'></td>
			<td id='ans_td154' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(15, 4)'><img id='answer154'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num16'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(15)' style='color: #008000;'>16</a></td>
			<td id='ans_td161' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(16, 1)'><img id='answer161'
					src='./img/num1.gif'></td>
			<td id='ans_td162' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(16, 2)'><img id='answer162'
					src='./img/num2.gif'></td>
			<td id='ans_td163' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(16, 3)'><img id='answer163'
					src='./img/num3.gif'></td>
			<td id='ans_td164' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(16, 4)'><img id='answer164'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num17'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(16)' style='color: #008000;'>17</a></td>
			<td id='ans_td171' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(17, 1)'><img id='answer171'
					src='./img/num1.gif'></td>
			<td id='ans_td172' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(17, 2)'><img id='answer172'
					src='./img/num2.gif'></td>
			<td id='ans_td173' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(17, 3)'><img id='answer173'
					src='./img/num3.gif'></td>
			<td id='ans_td174' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(17, 4)'><img id='answer174'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num18'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(17)' style='color: #008000;'>18</a></td>
			<td id='ans_td181' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(18, 1)'><img id='answer181'
					src='./img/num1.gif'></td>
			<td id='ans_td182' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(18, 2)'><img id='answer182'
					src='./img/num2.gif'></td>
			<td id='ans_td183' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(18, 3)'><img id='answer183'
					src='./img/num3.gif'></td>
			<td id='ans_td184' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(18, 4)'><img id='answer184'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num19'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_common_qpass'><a
				href='javascript:move2question(18)' style='color: #008000;'>19</a></td>
			<td id='ans_td191' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(19, 1)'><img id='answer191'
					src='./img/num1.gif'></td>
			<td id='ans_td192' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(19, 2)'><img id='answer192'
					src='./img/num2.gif'></td>
			<td id='ans_td193' width='24px' align='center' valign='middle'
				class='td_border_common_qpass'><a
				href='javascript:answer_check(19, 3)'><img id='answer193'
					src='./img/num3.gif'></td>
			<td id='ans_td194' width='24px' align='center' valign='middle'
				class='td_border_right_qpass'><a
				href='javascript:answer_check(19, 4)'><img id='answer194'
					src='./img/num4.gif'></td>
		</tr>
		<tr style='height: 25px;'>
			<td id='ans_num20'
				style='font-weight: bold; color: #008000; text-align: center;'
				class='td_border_bottom_qpass'><a
				href='javascript:move2question(19)' style='color: #008000;'>20</a></td>
			<td id='ans_td201' width='24px' align='center' valign='middle'
				class='td_border_bottom_qpass'><a
				href='javascript:answer_check(20, 1)'><img id='answer201'
					src='./img/num1.gif'></td>
			<td id='ans_td202' width='24px' align='center' valign='middle'
				class='td_border_bottom_qpass'><a
				href='javascript:answer_check(20, 2)'><img id='answer202'
					src='./img/num2.gif'></td>
			<td id='ans_td203' width='24px' align='center' valign='middle'
				class='td_border_bottom_qpass'><a
				href='javascript:answer_check(20, 3)'><img id='answer203'
					src='./img/num3.gif'></td>
			<td id='ans_td204' width='24px' align='center' valign='middle'
				class='td_border_bottomright_qpass'><a
				href='javascript:answer_check(20, 4)'><img id='answer204'
					src='./img/num4.gif'></td>
		</tr>
	</table>
	<p id='btnFinish0' align='center'
		style='display: block; margin: 10px 0px 0px 0px;'>
		<input type='button' value='답안제출' onclick='finish_exam(0);'
			class='btn01_qpass' style='width: 70px;'>
	</p>
	<p id='resultDisplay0' align='center' style='margin: 10px 0px 0px 0px;'></p>
</div>