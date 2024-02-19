bring cloud;
bring sim;
bring util;
bring fs;
bring "./vite-types.w" as vite_types;
bring "./vite.sim.w" as vite_sim;
bring "./vite.tf-aws.w" as vite_tf_aws;

pub class Vite {
  pub url: str;

  new(props: vite_types.ViteProps) {
    let target = util.env("WING_TARGET");
    if target == "sim" {
      let implementation = new vite_sim.Vite_sim(props);
      this.url = implementation.url;
    } elif target == "tf-aws" {
      let implementation = new vite_tf_aws.Vite_tf_aws(props);
      this.url = implementation.url;
    } else {
      throw "Unsupported WING_TARGET ${target}";
    }
  }
}
