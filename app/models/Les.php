<?php
class Les
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLessen()
    {
        $this->db->query("SELECT Les.DatumTijd
                                ,Les.Id AS LesId
                                ,Leerling.Id AS LeerlingId
                                ,Leerling.Naam AS LENA
                                ,Instructeur.Naam AS INNA
                          FROM  `Les`
                          INNER JOIN `Leerling` 
                          ON Les.LeerlingId = Leerling.Id
                          INNER JOIN `Instructeur`
                          ON Les.InstructeurId = Instructeur.Id
                          WHERE Les.InstructeurId = :Id;");

        $this->db->bind(':Id', 2, PDO::PARAM_INT);

        $result = $this->db->resultSet();

        return $result;
    }

    public function getTopics($LessenId)
    {
        $this->db->query("SELECT Les.DatumTijd
                                ,Onderwerp.Onderwerp
                                ,Les.Id
                          FROM  `Les`
                          INNER JOIN `Onderwerp`
                          ON Les.Id = Onderwerp.LesId
                          WHERE Les.Id = :LesId;");

        $this->db->bind(':LesId', $LessenId, PDO::PARAM_INT);

        $result = $this->db->resultSet();

        return $result;
    }
}
