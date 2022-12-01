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

    // Vardumpie
    var_dump($lessen);

    // Maak de inhoud voor de tbody in de view
    $rows = '';
    foreach ($lessen as $les) {
      $dateTimeObj = new DateTimeImmutable($les->DatumTijd, new DateTimeZone('Europe/Amsterdam'));
      $date = $dateTimeObj->format('d-m-Y');
      $time = $dateTimeObj->format('H:i');

      $rows .= "<tr>
                  <td>$date</td>
                  <td>$time</td>
                  <td>$les->LENA</td>
                  <td>$les->Lesinfo</td>
                  <td>$les->Onderwerp</td>
                  <td>
                    <a href='" . URLROOT . "/lessen/update/$les->LesId' class='btn btn-primary'>
                      <img src='" . URLROOT . "/img/b_sbrowse.png' alt='table picture' style='width:20px; height:20px;'>
                    </a>
                  </td>
                  <td>
                    <a href='" . URLROOT . "/lessen/delete/$les->LesId' class='btn btn-primary'>
                      <img src='" . URLROOT . "/img/page_delete.png' alt='cross delete picture' style='width:20px; height:20px;'>
                    </a>
                  </td>
                </tr>";
    }

    $data = [
      'title' => 'Lesrooster overzicht',
      'lessen' => $rows,
      'instructeurName' => $lessen[0]->INNA
    ];
    $this->view('lessen/index', $data);
  }

  public function topicLesson($id = null) {
    $data = [
      'title' => 'Onderwerpen Les'
    ];

    $this->view('lessen/topiclesson', $data);
  }

  // public function update($id = null)
  // {
  //   if ($_SERVER['REQUEST_METHOD'] == "POST") {
  //     try {
  //       $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

  //       $this->lesModel->updateLes($_POST);
  //       header('Location: ' . URLROOT . '/lessen/index');
  //     } catch (PDOException $e) {
  //       echo 'Er is iets misgegaan tijdens het bewerken van een les';
  //       header('Refresh: 2; url=' . URLROOT . '/lessen/index');
  //     }
  //   } else {
  //     $row = $this->lesModel->getSingleLes($id);

  //     $data = [
  //       'title' => '<h1>Lesrooster bijwerken</h1>',
  //       'row' => $row
  //     ];

  //     $this->view('lessen/update', $data);
  //   }
  // }

  // public function delete($id)
  // {
  //   $this->lesModel->deleteLes($id);

  //   $data = ['deleteStatus' => "De les met id $id is verwijderd"];

  //   $this->view('lessen/delete', $data);

  //   header('Refresh: 2; URL=' . URLROOT . '/lessen/index');
  // }

  // public function create()
  // {
  //   if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  //     try {
  //       $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

  //       $this->lesModel->createLes($_POST);

  //       header('Location: ' . URLROOT . '/lessen/index');
  //     } catch (PDOException $e) {
  //       echo 'Er is iets misgegaan tijdens het aanmaken van de les';
  //       header('Refresh: 2; url=' . URLROOT . '/lessen/index');
  //     }
  //   } else {
  //     $data = [
  //       'title' => '<h1>Nieuwe les toevoegen</h1>'
  //     ];

  //     $this->view('lessen/create', $data);
  //   }
  // }
}
