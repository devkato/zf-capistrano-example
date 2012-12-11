<?php

class IndexControllerTest extends Zend_Test_PHPUnit_ControllerTestCase {

  public function setUp() {
    $this->bootstrap = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
    parent::setUp();
  }


  /**
   * application/controllers/IndexController.php#indexAction
   *
   */
  public function testHelloPHPUnit() {
    // '/'にリクエストを投げる
    $this->dispatch('/');

    $this->assertAction('index');
    $this->assertNotAction('hello');
    $this->assertQueryContentContains('a.brand', "Zend Framework meets Takenaga!");
  }


  /**
   * わざとエラーになる
   *
   */
  public function testSetupAction() {
    $this->dispatch('/setup');

    $this->assertAction('error');
  }
}

?>
