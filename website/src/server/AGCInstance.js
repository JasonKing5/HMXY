import agconnect from "@hw-agconnect/api";
import "@hw-agconnect/auth";
import "@hw-agconnect/instance";
import { agConnectConfig } from "../config/agconnect-services";

agconnect.instance().configInstance(agConnectConfig);

export default agconnect;
