import wso2healthcare/healthcare.hl7v23;
import wso2healthcare/healthcare.hl7;
import ballerina/log;

public function main() {
    hl7v23:ADT_A01 adt_a01 = {
        msh: {
                msh3: {hd1: "ADT1"},
                msh4: {hd1: "MCM"},
                msh5: {hd1: "LABADT"},
                msh6: {hd1: "MCM"},
                msh8: "SECURITY",
                msh9: {cm_msg1: "ADT", cm_msg2: "A01"},
                msh10: "MSG00001",
                msh11: {pt1: "P"},
                msh12: "2.3"
            },
            pid: {
                pid1: "00001",
                pid5: {
                    xpn1: "Doe",
                    xpn2: "John"
                }
            }
    };

    hl7:HL7Encoder encoder = new ();
    do {
        byte[] encodedQRYA19 = check encoder.encode(hl7v23:VERSION, adt_a01);
        string stringResult = check string:fromBytes(encodedQRYA19);
        log:printInfo("String: " + stringResult);
    } on fail var e {
        log:printError("error occured: ", e);
    }
}
