// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_new_card": MessageLookupByLibrary.simpleMessage("+ add new card"),
        "electronic_payment_card":
            MessageLookupByLibrary.simpleMessage("Electronic payment card"),
        "electronic_wallet":
            MessageLookupByLibrary.simpleMessage("Electronic wallet"),
        "general_consultation_type":
            MessageLookupByLibrary.simpleMessage("General Consultation Type"),
        "payment": MessageLookupByLibrary.simpleMessage("Payment"),
        "payment_confirmation":
            MessageLookupByLibrary.simpleMessage("payment confirmation"),
        "receipt_details":
            MessageLookupByLibrary.simpleMessage("Receipt Details"),
        "sub_type_of_consultation":
            MessageLookupByLibrary.simpleMessage("Sub-type of consultation"),
        "wallet_balance": MessageLookupByLibrary.simpleMessage("Wallet balance")
      };
}
