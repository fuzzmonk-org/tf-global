


/*


# log groups are automatically created

resource "aws_cloudwatch_log_group" "syslog" {
  name = "/var/log/syslog"
  retention_in_days = "7"
}





resource "aws_cloudwatch_log_stream" "foo" {
  name           = "SampleLogStream1234"
  log_group_name = "${aws_cloudwatch_log_group.yada.name}"
}

*/