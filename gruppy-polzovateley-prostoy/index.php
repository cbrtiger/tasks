<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Группы пользователей простой");
?><?$APPLICATION->IncludeComponent(
	"tasks:groups.of.users",
	"",
	Array(
		"CACHE_TIME" => "36000000",
		"CACHE_TYPE" => "A",
		"HEADING_OF_PAGE" => "Кастомный заголовок страницы"
	)
);?><br><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>