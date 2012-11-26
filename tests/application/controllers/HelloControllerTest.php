<?php

class HelloControllerTest extends Zend_Test_PHPUnit_ControllerTestCase {

  public function setUp() {
    $this->bootstrap = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
    parent::setUp();
  }

  public function testWorld() {
    $this->dispatch('/hello/world');

    $this->assertAction('world');
    $this->assertQueryContentContains('h2.title', "全米が泣いた");
  }

  public function testEveryone() {
    $this->dispatch('/hello/everyone');

    $this->assertAction('everyone');
  }
}

?>
