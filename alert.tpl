{{#is_alert}}
${alert_message}
{{/is_alert}}
{{#is_recovery}}
${recovery_message}
{{/is_recovery}}
${ note == "" ? "" : "\nNote: ${note}"}${ docs == "" ? "" : "\nDocs: ${docs}"}
${notification_channel}