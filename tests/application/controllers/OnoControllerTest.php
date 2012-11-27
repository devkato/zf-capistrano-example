<?php

class OnoControllerTest extends Zend_Test_PHPUnit_ControllerTestCase {

  public function setUp() {
    $this->bootstrap = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
    parent::setUp();
  }

  public function testHehehe() {
    $this->dispatch('/ono/hehehe');
    $this->assertAction('hehehe');
  }

  public function testUnko() {
    $this->dispatch('/ono/unko');

    $this->assertAction('unko');
    $this->assertQueryContentContains('div.result', "出たー");
  }

  public function testGeri() {
    $this->dispatch('/ono/geri');
    $this->assertAction('geri');
  }
/*
  public function testXXX() {
    $this->dispatch('/');

    $this->assertAction('');
    $this->assertQueryContentContains('selector', "values");
  }

  public function testEveryone() {
  }
*/
}

?>
