// To parse this JSON data, do
//
//     final movieCollectionModel = movieCollectionModelFromJson(jsonString);

import 'dart:convert';

MovieCollectionModel movieCollectionModelFromJson(String str) => MovieCollectionModel.fromJson(json.decode(str));

String movieCollectionModelToJson(MovieCollectionModel data) => json.encode(data.toJson());

class MovieCollectionModel {
    MovieCollectionModel({
        this.id,
        this.name,
        this.description,
        this.auth,
        this.events,
        this.variables,
        this.order,
        this.foldersOrder,
        this.protocolProfileBehavior,
        this.folders,
        this.requests,
    });

    String? id;
    String? name;
    String? description;
    dynamic auth;
    dynamic events;
    List<dynamic>? variables;
    List<String>? order;
    List<dynamic>? foldersOrder;
    ProtocolProfileBehavior? protocolProfileBehavior;
    List<dynamic>? folders;
    List<Request>? requests;

    factory MovieCollectionModel.fromJson(Map<String, dynamic> json) => MovieCollectionModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        auth: json["auth"],
        events: json["events"],
        variables: List<dynamic>.from(json["variables"].map((x) => x)),
        order: List<String>.from(json["order"].map((x) => x)),
        foldersOrder: List<dynamic>.from(json["folders_order"].map((x) => x)),
        protocolProfileBehavior: ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
        folders: List<dynamic>.from(json["folders"].map((x) => x)),
        requests: List<Request>.from(json["requests"].map((x) => Request.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "auth": auth,
        "events": events,
        "variables": List<dynamic>.from(variables!.map((x) => x)),
        "order": List<dynamic>.from(order!.map((x) => x)),
        "folders_order": List<dynamic>.from(foldersOrder!.map((x) => x)),
        "protocolProfileBehavior": protocolProfileBehavior!.toJson(),
        "folders": List<dynamic>.from(folders!.map((x) => x)),
        "requests": List<dynamic>.from(requests!.map((x) => x.toJson())),
    };
}

class ProtocolProfileBehavior {
    ProtocolProfileBehavior();

    factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) => ProtocolProfileBehavior(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Request {
    Request({
        this.id,
        this.name,
        this.url,
        this.description,
        this.data,
        this.dataOptions,
        this.dataMode,
        this.headerData,
        this.method,
        this.pathVariableData,
        this.queryParams,
        this.auth,
        this.events,
        this.folder,
        this.currentHelper,
        this.helperAttributes,
        this.collectionId,
        this.headers,
        this.pathVariables,
        this.responses,
    });

    String? id;
    String? name;
    String? url;
    dynamic description;
    dynamic data;
    dynamic dataOptions;
    dynamic dataMode;
    List<dynamic>? headerData;
    String? method;
    List<dynamic>? pathVariableData;
    List<dynamic>? queryParams;
    dynamic auth;
    dynamic events;
    dynamic folder;
    dynamic currentHelper;
    dynamic helperAttributes;
    String? collectionId;
    String? headers;
    ProtocolProfileBehavior? pathVariables;
    List<Response>? responses;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        description: json["description"],
        data: json["data"],
        dataOptions: json["dataOptions"],
        dataMode: json["dataMode"],
        headerData: List<dynamic>.from(json["headerData"].map((x) => x)),
        method: json["method"],
        pathVariableData: List<dynamic>.from(json["pathVariableData"].map((x) => x)),
        queryParams: List<dynamic>.from(json["queryParams"].map((x) => x)),
        auth: json["auth"],
        events: json["events"],
        folder: json["folder"],
        currentHelper: json["currentHelper"],
        helperAttributes: json["helperAttributes"],
        collectionId: json["collectionId"],
        headers: json["headers"],
        pathVariables: ProtocolProfileBehavior.fromJson(json["pathVariables"]),
        responses: json["responses"] == null ? null : List<Response>.from(json["responses"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "description": description,
        "data": data,
        "dataOptions": dataOptions,
        "dataMode": dataMode,
        "headerData": List<dynamic>.from(headerData!.map((x) => x)),
        "method": method,
        "pathVariableData": List<dynamic>.from(pathVariableData!.map((x) => x)),
        "queryParams": List<dynamic>.from(queryParams!.map((x) => x)),
        "auth": auth,
        "events": events,
        "folder": folder,
        "currentHelper": currentHelper,
        "helperAttributes": helperAttributes,
        "collectionId": collectionId,
        "headers": headers,
        "pathVariables": pathVariables!.toJson(),
        "responses": responses == null ? null : List<dynamic>.from(responses!.map((x) => x.toJson())),
    };
}

class Response {
    Response({
        this.id,
        this.name,
        this.status,
        this.mime,
        this.language,
        this.text,
        this.responseCode,
        this.requestObject,
        this.headers,
        this.cookies,
        this.request,
        this.collection,
    });

    String? id;
    String? name;
    dynamic status;
    dynamic mime;
    dynamic language;
    String? text;
    ResponseCode? responseCode;
    RequestObject? requestObject;
    dynamic headers;
    dynamic cookies;
    String? request;
    String? collection;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        mime: json["mime"],
        language: json["language"],
        text: json["text"],
        responseCode: ResponseCode.fromJson(json["responseCode"]),
        requestObject: RequestObject.fromJson(json["requestObject"]),
        headers: json["headers"],
        cookies: json["cookies"],
        request: json["request"],
        collection: json["collection"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "mime": mime,
        "language": language,
        "text": text,
        "responseCode": responseCode!.toJson(),
        "requestObject": requestObject!.toJson(),
        "headers": headers,
        "cookies": cookies,
        "request": request,
        "collection": collection,
    };
}

class RequestObject {
    RequestObject({
        this.data,
        this.dataMode,
        this.dataOptions,
        this.headerData,
        this.method,
        this.pathVariableData,
        this.queryParams,
        this.url,
        this.headers,
        this.pathVariables,
    });

    dynamic data;
    dynamic dataMode;
    dynamic dataOptions;
    List<dynamic>? headerData;
    String? method;
    List<dynamic>? pathVariableData;
    List<dynamic>? queryParams;
    String? url;
    String? headers;
    ProtocolProfileBehavior? pathVariables;

    factory RequestObject.fromJson(Map<String, dynamic> json) => RequestObject(
        data: json["data"],
        dataMode: json["dataMode"],
        dataOptions: json["dataOptions"],
        headerData: List<dynamic>.from(json["headerData"].map((x) => x)),
        method: json["method"],
        pathVariableData: List<dynamic>.from(json["pathVariableData"].map((x) => x)),
        queryParams: List<dynamic>.from(json["queryParams"].map((x) => x)),
        url: json["url"],
        headers: json["headers"],
        pathVariables: ProtocolProfileBehavior.fromJson(json["pathVariables"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "dataMode": dataMode,
        "dataOptions": dataOptions,
        "headerData": List<dynamic>.from(headerData!.map((x) => x)),
        "method": method,
        "pathVariableData": List<dynamic>.from(pathVariableData!.map((x) => x)),
        "queryParams": List<dynamic>.from(queryParams!.map((x) => x)),
        "url": url,
        "headers": headers,
        "pathVariables": pathVariables!.toJson(),
    };
}

class ResponseCode {
    ResponseCode({
        this.code,
        this.name,
    });

    int? code;
    String? name;

    factory ResponseCode.fromJson(Map<String, dynamic> json) => ResponseCode(
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
    };
}
