<?php echo $data["title"]; ?>

<a href="<?= URLROOT; ?>/lessen/create">Nieuwe les toevoegen</a>

<table class="table">
  <thead>
    <th>Datum</th>
    <th>Tijd</th>
    <th>Naam Leerling</th>
    <th>Lesinfo</th>
    <th>Onderwerp</th>
    <th>update</th>
    <th>delete</th>
  </thead>
  <tbody>
    <?= $data['lessen'] ?>
  </tbody>
</table>
<a href="<?= URLROOT; ?>/homepages/index">terug</a>