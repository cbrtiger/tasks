<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>
<?$APPLICATION->IncludeComponent(
    "tasks:single.group.of.users",
    "",
    Array(
        "CACHE_TIME" => "36000000",
        "CACHE_TYPE" => "A",
        "GROUP_IDENTIFIER" => $arResult['VARIABLES']['GROUP_ID']
    )
);?>
