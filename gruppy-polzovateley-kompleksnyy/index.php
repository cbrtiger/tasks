<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Группы пользователей комплексный");
?><?$APPLICATION->IncludeComponent(
	"tasks:groups.complex", 
	".default", 
	array(
		"SEF_FOLDER" => "/gruppy-polzovateley-kompleksnyy/",
		"SEF_MODE" => "Y",
		"COMPONENT_TEMPLATE" => ".default",
		"SEF_URL_TEMPLATES" => array(
			"groupslist" => "",
			"groupdetail" => "#GROUP_ID#/",
		)
	),
	false
);?><br><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>