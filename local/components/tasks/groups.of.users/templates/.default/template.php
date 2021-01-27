<? if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Название группы</th>
            <th>Описание группы</th>
        </tr>
    </thead>
    <tbody>
        <? foreach($arResult['GROUPS_FOUND'] as $group): ?>
            <tr>
                <td><?= $group['ID'] ?></td>
                <td><?= $group['NAME'] ?></td>
                <td><?= $group['DESCRIPTION'] ?></td>
            </tr>
        <? endforeach; ?>
    </tbody>

</table>
