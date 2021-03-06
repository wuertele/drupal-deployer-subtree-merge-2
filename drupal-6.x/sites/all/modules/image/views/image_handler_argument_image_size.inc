<?php
// $Id$

/**
 * @file
 * Views argument handler for image size argument.
 */

/**
 * Argument handler for image size.
 *
 * Converts given image size argument to a human-readable name.
 */
class image_handler_argument_image_size extends views_handler_argument_string {

  /**
   * Get the human-readable label for the image size.
   */
  function title() {
    $image_sizes = image_get_sizes();
    return check_plain($image_sizes[$this->argument]['label']);
  }
}

