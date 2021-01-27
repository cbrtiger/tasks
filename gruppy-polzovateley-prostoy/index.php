<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Группы пользователей простой");
?><?$APPLICATION->IncludeComponent(
	"tasks:group.of.users", 
	"templates", 
	array(
		"COMPONENT_TEMPLATE" => "templates",
		"CACHE_TYPE" => "A",
		"CACHE_TIME" => "36000000",
		"HEADING_OF_PAGE" => "КАСТОМНЫЙ ЗАГОЛОВОК"
	),
	false
);?><br><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>