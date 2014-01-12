# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RailsTest::Application.initialize!

DB_STRING_MAX_LENGTH = 255

HTML_TEXT_FIELD_SIZE = 18

DB_TEXT_MAX_LENGTH = 40000

TEXT_ROWS = 5
TEXT_COLS = 40