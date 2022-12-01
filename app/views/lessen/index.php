<h1><?= $data["title"]; ?></h1>
<h4><?= 'Instructeur naam: ' . $data['instructeurName'] ?></h4>

<a href="<?= URLROOT; ?>/lessen/create">Nieuwe les toevoegen</a>

<table class="table">
  <thead>
    <th>Datum</th>
    <th>Tijd</th>
    <th>Leerling</th>
    <th>Lesinfo</th>
    <th>Onderwerp</th>
    <th>Update</th>
    <th>Delete</th>
  </thead>
  <tbody>
    <?= $data['lessen'] ?>
  </tbody>
</table>
<a href="<?= URLROOT; ?>/homepages/index">Terug</a>