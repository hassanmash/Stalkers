import 'package:gsheets/gsheets.dart';
import 'package:stalkers/model/user.dart';

class UsersDataApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheets-324812",
  "private_key_id": "302d945b5926b468f865465f520a25249a842906",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxuGjY9/cJr+Z3\n8kaO7v1MooaoAHSggpzFs60ZmcfM356DuBqB9+3p1+s7Bp6A6kkOsKU9tlYLMzIF\n66E3fyCWFWYn6sVnBdhajHEq3+8oZTrtwamC4nlOBT5GqvX2jgMoJf/XMKR4m3dR\nOsgyMA8L6H5i2DqrN+wA2RXA1poNzfq1x+1KOdYjSQQxR3MAvfIp4PiaRY6N/u1R\neBtWyu2ob7R6aC9x/L/nyYGI9kgMMND8hUFlCuNtG1iwQYQpA3JUL42A7T8aAPLH\nKyMnWX+oYaVDhQ4dMCramY9EdClVxYKEZR1na9MLwESkxOCOtKviJo2H0JihufJn\niW2+YvXvAgMBAAECggEASe3jG8LHDs4QCvyLcoEjeMIxTujlmzHKQonUa85naafq\nenPW/xLicwEBlyvROuJ7IrPEAXB8yarx17ml9n6ZUSW0uc01cf5h+oTqvMGr7Ltz\nsJz7xXktqhGPTvlmWTrJQGXSUDOpb4yIrY9M4WfRkowUK0001q3sLIwhuvbq3euM\nsaSkK9vR/lAQ3qmJfqa9qAMGDFF6RQ5VnPkKRMpBWmhIuTRuaZZZ9adjgaBlzrmK\npYUSu9dOax5y4oAe3ESWNyTgv/GzM3ORS/6jdTpuHVWBioq4DQcPzBvAEijihQ98\nQNpXxZTsPMDr/W1Sp6YDRGYft6hxtIB0zn9nWftkdQKBgQDYQR2O59d/Ywc9lnYR\np7vDiKzeVAPdy2XHe0ck26mBlwPX0bMQwAEpTy4lXTqjc1IM/afXbvgB8UG7BezW\neLfD7Bwn3cenhSQ5gOCLUkdiFgiBU5B1Hdf12SQ//dQ6hsqk0IWeaaGeYn95xPbl\npwtb9+6bC6cx9vvBNJBmI40rRQKBgQDSYj+Jy48bpKnO165nsGHLeyS2KGGole7N\nso8KdJvdORWONXNsz+Iivp/dpujgSOQC4FqnNaPntc67jNOmMkLSYND3lgF4rU1m\nIh3E/Hy0e80ddShTy0xi7ndU4fZbw2zejdBOZw1S4vHmBc73HcLpHd2X/mqL+FGG\nqhI9NIDVowKBgQDWYic1Zq2CQeAJtEG0Wv6PZ81IUy3KETwDODldVs6CA/3xVJga\nQN5l33M142igZVCwRD7CGeaPtmadS9BxBhfXiRiYhQrLDfjNcPAp7hWKLaGc5ATP\nthhER1HihnaA1uPJ5FayprFsXOVXCGZjYOin8fB/kFvd8qW98ag9OX1XqQKBgAdj\nyBORAN/ZstU/IjMmMOky1CFJ3dRMH+09vmSBoA/vN2CdZAaIbssFoxvoBvoJ1Wh8\ndPK2oaE7850G31BRJ6O4Ht7zd+3DOJrDzAPlUoQMbTIBsX7v/yjic3KZ1Ut329Ud\nahm26PLmYdTQk2p+sx/5GpWCLD/qYwK16poXxAa9AoGAfqBTZRWoh7/8H0+mYIQs\nJ6yCGRNNA3UV7syxNoc4zYUfz6PCLS6MQ0edBljEHqpciYzR38mChl6BANv79eqW\n+jMqfG7qIVZl0gK0H7BrtUf55cA/pgDmLcoaVGLVfWv2sd7IoPYTo5qIptxVGxWx\ngafa6VU1PTNg2cfTz04/01g=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-324812.iam.gserviceaccount.com",
  "client_id": "103222120353136106356",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-324812.iam.gserviceaccount.com"
}
''';
  static final _spreadsheetId = '1X0FIwTIxBAHT_tYuVANTR8dLupwTlT2yjbYjxtxByno';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<User?> getByName(int userName) async {
    if (_userSheet == null) return null;

    final json = await _userSheet!.values.map.rowByKey(userName, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  static Future<List<User>> getAll() async {
    if (_userSheet == null) return <User>[];

    final users = await _userSheet!.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;

    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }
}
