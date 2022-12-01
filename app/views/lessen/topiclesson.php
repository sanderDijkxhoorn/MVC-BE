<h1><?= $data['title']; ?></h1>

<h5>Datum: <?= $data['date']; ?> Tijd: <?= $data['time']; ?></h5>
<table>
    <thead>
        <th>Onderwerpen</th>
    </thead>
    <tbody>
        <?= $data['rows']; ?>
    </tbody>
</table>