<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>
<table>
    <tr>
        <td>ID</td><td> <b><?= $arResult['USERS_GROUP_INFO']['ID'] ?></b></td>
    </tr>
    <tr>
        <td>Наименование:</td><td> <b><?= $arResult['USERS_GROUP_INFO']['NAME'] ?></b></td>
    </tr>
    <tr>
        <td>Описание группы:</td><td> <b><?= $arResult['USERS_GROUP_INFO']['DESCRIPTION'] ?></b></td>
    </tr>
</table>
