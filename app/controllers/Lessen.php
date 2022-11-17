<?php
class Lessen extends Controller
{

  public function __construct()
  {
    $this->lesModel = $this->model('Les');
  }

  public function index()
  {
    $lessen = $this->lesModel->getLessen();

    // Maak de inhoud voor de tbody in de view
    $rows = '';
    foreach ($lessen as $value) {
      $rows .= "<tr>
                  <td>$value->DatumTijd</td>
                  <td>$value->Tijd</td>
                  <td>$value->Naam</td>
                  <td>$value->Lesinfo</td>
                  <td>$value->Onderwerp</td>
                  <td><a href='" . URLROOT . "/lessen/update/$value->Id'>update</a></td>
                  <td><a href='" . URLROOT . "/lessen/delete/$value->Id'>delete</a></td>
                </tr>";
    }

    $data = [
      'title' => '<h1>Lesrooster overzicht</h1>',
      'lessen' => $rows
    ];
    $this->view('lessen/index', $data);
  }

  public function update($id = null)
  {
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
      try {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $this->lesModel->updateLes($_POST);
        header('Location: ' . URLROOT . '/lessen/index');
      } catch (PDOException $e) {
        echo 'Er is iets misgegaan tijdens het bewerken van een les';
        header('Refresh: 2; url=' . URLROOT . '/lessen/index');
      }
    } else {
      $row = $this->lesModel->getSingleLes($id);

      $data = [
        'title' => '<h1>Lesrooster bijwerken</h1>',
        'row' => $row
      ];

      $this->view('lessen/update', $data);
    }
  }

  public function delete($id)
  {
    $this->lesModel->deleteLes($id);

    $data = ['deleteStatus' => "De les met id $id is verwijderd"];

    $this->view('lessen/delete', $data);

    header('Refresh: 2; URL=' . URLROOT . '/lessen/index');
  }

  public function create()
  {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
      try {
        $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $this->lesModel->createLes($_POST);

        header('Location: ' . URLROOT . '/lessen/index');
      } catch (PDOException $e) {
        echo 'Er is iets misgegaan tijdens het aanmaken van de les';
        header('Refresh: 2; url=' . URLROOT . '/lessen/index');
      }
    } else {
      $data = [
        'title' => '<h1>Nieuwe les toevoegen</h1>'
      ];

      $this->view('lessen/create', $data);
    }
  }
}
