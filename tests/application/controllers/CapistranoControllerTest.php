<?php

class CapistranoControllerTest extends Zend_Test_PHPUnit_ControllerTestCase {

  public function setUp() {
    $this->bootstrap = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
    parent::setUp();
  }


  /**
   * application/controllers/CapistranoController.php#installAction
   *
   */
  public function testInstallAction() {
    $this->dispatch('/capistrano/install');

    $this->assertAction('install');
  }


  /**
   * application/controllers/CapistranoController.php#configurationAction
   *
   */
  public function testConfigurationAction() {
    $this->dispatch('/capistrano/configuration');

    $this->assertAction('configuration');
  }


  /**
   * application/controllers/CapistranoController.php#serverAction
   *
   */
  public function testServerAction() {
    $this->dispatch('/capistrano/server');

    $this->assertAction('server');
  }
}

?>
