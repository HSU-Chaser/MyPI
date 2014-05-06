<?php
// 예 외 처 리
if(!strpos($fmail,'@')) {   echo("<script>
window.alert('메일 주소를 다시 입력해 주세요.')
history.go(-1)
</script>
");
exit ;
}
/*
 echo("yy");
 exit;
 */
if(strlen($fname)<2||strlen($fname)>10) {   echo("<script>
window.alert('이름을 다시 입력해 주세요.')
history.go(-1)
</script>
");
exit ;
}
if(strlen($message)<3) {   echo(" <script>
window.alert('내용을 다시 입력해 주세요.')
history.go(-1)
</script>
");
exit ;
}
// 메일 제목 고정
$title="홈페이지 E-mail";
//메일 주소
$mailheaders.="from: ".$fmail." \r\n";
$mailheaders.="Content-type : text/html; charset =utf-8 \r\n";
// 한줄에 40글자
$message=wordwrap($message,40);
// - 이름
$message.=' - '.$fname;
//보낸다! - 받는 아이디 고정 (hsuteamchaser@gmail.com)
$wcard=mail('hsuteamchaser@gmail.com',$title,$message,$mailheaders);
//성공시
if($wcard) {
// 아래 두 줄이 전송 시 mail_reaction_success 부분을 켜주는 부분.
header("location:mail_reaction.html");
return;
} else {
header("location:index.html");
return;
}
exit ;
?>
