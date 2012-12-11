<?php

class OnoController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function heheheAction() {
      $tasks = array(
        "monocheki",
        "SLA",
        "UDS",
        "Crawler",
        "Conference",
        "Ruby on Rails"
      );
      $count = count($tasks);
      for ($i = 0; $i < $count; $i++) {
        $i / $count;
      }
    }

    public function unkoAction() {
      $tasks = array(
        "monocheki",
        "SLA",
        "UDS",
        "Crawler",
        "Conference",
        "Ruby on Rails"
      );
      $count = count($tasks);
      for ($i = 0; $i < $count; $i++) {
        $i / $count;
      }

      $this->view->tasks = $tasks;
    }

    public function geriAction()
    {
    }

    public function convert_string_to_integer($str) {
      return $str;
    }

    /*
    public function xxxAction()
    {
    }
     */
}

