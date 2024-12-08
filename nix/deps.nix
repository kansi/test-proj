{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bcrypt_elixir = buildMix rec {
      name = "bcrypt_elixir";
      version = "2.3.1";

      src = fetchHex {
        pkg = "bcrypt_elixir";
        version = "${version}";
        sha256 = "42182d5f46764def15bf9af83739e3bf4ad22661b1c34fc3e88558efced07279";
      };

      beamDeps = [ comeonin elixir_make ];
    };

    bunt = buildMix rec {
      name = "bunt";
      version = "1.0.0";

      src = fetchHex {
        pkg = "bunt";
        version = "${version}";
        sha256 = "dc5f86aa08a5f6fa6b8096f0735c4e76d54ae5c9fa2c143e5a1fc7c1cd9bb6b5";
      };

      beamDeps = [];
    };

    cachex = buildMix rec {
      name = "cachex";
      version = "3.6.0";

      src = fetchHex {
        pkg = "cachex";
        version = "${version}";
        sha256 = "ebf24e373883bc8e0c8d894a63bbe102ae13d918f790121f5cfe6e485cc8e2e2";
      };

      beamDeps = [ eternal jumper sleeplocks unsafe ];
    };

    castore = buildMix rec {
      name = "castore";
      version = "1.0.10";

      src = fetchHex {
        pkg = "castore";
        version = "${version}";
        sha256 = "1b0b7ea14d889d9ea21202c43a4fa015eb913021cb535e8ed91946f4b77a8848";
      };

      beamDeps = [];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.12.0";

      src = fetchHex {
        pkg = "certifi";
        version = "${version}";
        sha256 = "ee68d85df22e554040cdb4be100f33873ac6051387baf6a8f6ce82272340ff1c";
      };

      beamDeps = [];
    };

    comeonin = buildMix rec {
      name = "comeonin";
      version = "5.5.0";

      src = fetchHex {
        pkg = "comeonin";
        version = "${version}";
        sha256 = "6287fc3ba0aad34883cbe3f7949fc1d1e738e5ccdce77165bc99490aa69f47fb";
      };

      beamDeps = [];
    };

    cors_plug = buildMix rec {
      name = "cors_plug";
      version = "3.0.3";

      src = fetchHex {
        pkg = "cors_plug";
        version = "${version}";
        sha256 = "3f2d759e8c272ed3835fab2ef11b46bddab8c1ab9528167bd463b6452edf830d";
      };

      beamDeps = [ plug ];
    };

    cowboy = buildErlangMk rec {
      name = "cowboy";
      version = "2.12.0";

      src = fetchHex {
        pkg = "cowboy";
        version = "${version}";
        sha256 = "8a7abe6d183372ceb21caa2709bec928ab2b72e18a3911aa1771639bef82651e";
      };

      beamDeps = [ cowlib ranch ];
    };

    cowboy_telemetry = buildRebar3 rec {
      name = "cowboy_telemetry";
      version = "0.4.0";

      src = fetchHex {
        pkg = "cowboy_telemetry";
        version = "${version}";
        sha256 = "7d98bac1ee4565d31b62d59f8823dfd8356a169e7fcbb83831b8a5397404c9de";
      };

      beamDeps = [ cowboy telemetry ];
    };

    cowlib = buildRebar3 rec {
      name = "cowlib";
      version = "2.13.0";

      src = fetchHex {
        pkg = "cowlib";
        version = "${version}";
        sha256 = "e1e1284dc3fc030a64b1ad0d8382ae7e99da46c3246b815318a4b848873800a4";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.7.10";

      src = fetchHex {
        pkg = "credo";
        version = "${version}";
        sha256 = "71fbc9a6b8be21d993deca85bf151df023a3097b01e09a2809d460348561d8cd";
      };

      beamDeps = [ bunt file_system jason ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.7.0";

      src = fetchHex {
        pkg = "db_connection";
        version = "${version}";
        sha256 = "dcf08f31b2701f857dfc787fbad78223d61a32204f217f15e881dd93e4bdd3ff";
      };

      beamDeps = [ telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.2.0";

      src = fetchHex {
        pkg = "decimal";
        version = "${version}";
        sha256 = "af8daf87384b51b7e611fb1a1f2c4d4876b65ef968fa8bd3adf44cff401c7f21";
      };

      beamDeps = [];
    };

    dialyxir = buildMix rec {
      name = "dialyxir";
      version = "1.4.5";

      src = fetchHex {
        pkg = "dialyxir";
        version = "${version}";
        sha256 = "b0fb08bb8107c750db5c0b324fa2df5ceaa0f9307690ee3c1f6ba5b9eb5d35c3";
      };

      beamDeps = [ erlex ];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.12.5";

      src = fetchHex {
        pkg = "ecto";
        version = "${version}";
        sha256 = "6eb18e80bef8bb57e17f5a7f068a1719fbda384d40fc37acb8eb8aeca493b6ea";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.12.1";

      src = fetchHex {
        pkg = "ecto_sql";
        version = "${version}";
        sha256 = "aff5b958a899762c5f09028c847569f7dfb9cc9d63bdb8133bff8a5546de6bf5";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.9.0";

      src = fetchHex {
        pkg = "elixir_make";
        version = "${version}";
        sha256 = "db23d4fd8b757462ad02f8aa73431a426fe6671c80b200d9710caf3d1dd0ffdb";
      };

      beamDeps = [];
    };

    erlex = buildMix rec {
      name = "erlex";
      version = "0.2.7";

      src = fetchHex {
        pkg = "erlex";
        version = "${version}";
        sha256 = "3ed95f79d1a844c3f6bf0cea61e0d5612a42ce56da9c03f01df538685365efb0";
      };

      beamDeps = [];
    };

    erlexec = buildRebar3 rec {
      name = "erlexec";
      version = "2.0.7";

      src = fetchHex {
        pkg = "erlexec";
        version = "${version}";
        sha256 = "af2dd940bb8e32f5aa40a65cb455dcaa18f5334fd3507e9bfd14a021e9630897";
      };

      beamDeps = [];
    };

    esbuild = buildMix rec {
      name = "esbuild";
      version = "0.8.2";

      src = fetchHex {
        pkg = "esbuild";
        version = "${version}";
        sha256 = "558a8a08ed78eb820efbfda1de196569d8bfa9b51e8371a1934fbb31345feda7";
      };

      beamDeps = [ castore jason ];
    };

    eternal = buildMix rec {
      name = "eternal";
      version = "1.2.2";

      src = fetchHex {
        pkg = "eternal";
        version = "${version}";
        sha256 = "2c9fe32b9c3726703ba5e1d43a1d255a4f3f2d8f8f9bc19f094c7cb1a7a9e782";
      };

      beamDeps = [];
    };

    ex_aws = buildMix rec {
      name = "ex_aws";
      version = "2.5.7";

      src = fetchHex {
        pkg = "ex_aws";
        version = "${version}";
        sha256 = "2c3c577550bfc4d0899e9fed9aeef91bc6a2aedd0177b1faa726c9b20d005074";
      };

      beamDeps = [ hackney jason mime sweet_xml telemetry ];
    };

    ex_aws_s3 = buildMix rec {
      name = "ex_aws_s3";
      version = "2.5.5";

      src = fetchHex {
        pkg = "ex_aws_s3";
        version = "${version}";
        sha256 = "ac34af1e9b3974168dda798d2fded5d12d52a1b5cf52abfeffed2a63d2eb5443";
      };

      beamDeps = [ ex_aws sweet_xml ];
    };

    ex_machina = buildMix rec {
      name = "ex_machina";
      version = "2.8.0";

      src = fetchHex {
        pkg = "ex_machina";
        version = "${version}";
        sha256 = "79fe1a9c64c0c1c1fab6c4fa5d871682cb90de5885320c187d117004627a7729";
      };

      beamDeps = [ ecto ecto_sql ];
    };

    expo = buildMix rec {
      name = "expo";
      version = "0.4.1";

      src = fetchHex {
        pkg = "expo";
        version = "${version}";
        sha256 = "2ff7ba7a798c8c543c12550fa0e2cbc81b95d4974c65855d8d15ba7b37a1ce47";
      };

      beamDeps = [];
    };

    faker = buildMix rec {
      name = "faker";
      version = "0.17.0";

      src = fetchHex {
        pkg = "faker";
        version = "${version}";
        sha256 = "a7d4ad84a93fd25c5f5303510753789fc2433ff241bf3b4144d3f6f291658a6a";
      };

      beamDeps = [];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "0.2.10";

      src = fetchHex {
        pkg = "file_system";
        version = "${version}";
        sha256 = "41195edbfb562a593726eda3b3e8b103a309b733ad25f3d642ba49696bf715dc";
      };

      beamDeps = [];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.19.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "fc5324ce209125d1e2fa0fcd2634601c52a787aff1cd33ee833664a5af4ea2b6";
      };

      beamDeps = [ mime mint nimble_options nimble_pool telemetry ];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.37.0";

      src = fetchHex {
        pkg = "floki";
        version = "${version}";
        sha256 = "516a0c15a69f78c47dc8e0b9b3724b29608aa6619379f91b1ffa47109b5d0dd3";
      };

      beamDeps = [];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "0.22.3";

      src = fetchHex {
        pkg = "gettext";
        version = "${version}";
        sha256 = "935f23447713954a6866f1bb28c3a878c4c011e802bcd68a726f5e558e4b64bd";
      };

      beamDeps = [ expo ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.20.1";

      src = fetchHex {
        pkg = "hackney";
        version = "${version}";
        sha256 = "fe9094e5f1a2a2c0a7d10918fee36bfec0ec2a979994cff8cfe8058cd9af38e3";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "1.0.1";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "4e2d5a4f76ae1e3048f35ae7adb1641c36265510a2d4638157fbcb53dda38445";
      };

      beamDeps = [];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "1.8.2";

      src = fetchHex {
        pkg = "httpoison";
        version = "${version}";
        sha256 = "2bb350d26972e30c96e2ca74a1aaf8293d61d0742ff17f01e0279fef11599921";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "idna";
        version = "${version}";
        sha256 = "92376eb7894412ed19ac475e4a86f7b413c1b9fbb5bd16dccd57934157944cea";
      };

      beamDeps = [ unicode_util_compat ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.4";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "c5eb0cab91f094599f94d55bc63409236a8ec69a21a67814529e8d5f6cc90b3b";
      };

      beamDeps = [ decimal ];
    };

    jumper = buildMix rec {
      name = "jumper";
      version = "1.0.2";

      src = fetchHex {
        pkg = "jumper";
        version = "${version}";
        sha256 = "9b7782409021e01ab3c08270e26f36eb62976a38c1aa64b2eaf6348422f165e1";
      };

      beamDeps = [];
    };

    logger_file_backend = buildMix rec {
      name = "logger_file_backend";
      version = "0.0.14";

      src = fetchHex {
        pkg = "logger_file_backend";
        version = "${version}";
        sha256 = "071354a18196468f3904ef09413af20971d55164267427f6257b52cfba03f9e6";
      };

      beamDeps = [];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "metrics";
        version = "${version}";
        sha256 = "69b09adddc4f74a40716ae54d140f93beb0fb8978d8636eaded0c31b6f099f16";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.6";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "c9945363a6b26d747389aac3643f8e0e09d30499a138ad64fe8fd1d13d9b153e";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.3.0";

      src = fetchHex {
        pkg = "mimerl";
        version = "${version}";
        sha256 = "a1e15a50d1887217de95f0b9b0793e32853f7c258a5cd227650889b38839fe9d";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.6.2";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "5ee441dffc1892f1ae59127f74afe8fd82fda6587794278d924e4d90ea3d63f9";
      };

      beamDeps = [ castore hpax ];
    };

    nimble_options = buildMix rec {
      name = "nimble_options";
      version = "1.1.1";

      src = fetchHex {
        pkg = "nimble_options";
        version = "${version}";
        sha256 = "821b2470ca9442c4b6984882fe9bb0389371b8ddec4d45a9504f00a66f650b44";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "1.1.0";

      src = fetchHex {
        pkg = "nimble_pool";
        version = "${version}";
        sha256 = "af2e4e6b34197db81f7aad230c1118eac993acc0dae6bc83bac0126d4ae0813a";
      };

      beamDeps = [];
    };

    oban = buildMix rec {
      name = "oban";
      version = "2.18.3";

      src = fetchHex {
        pkg = "oban";
        version = "${version}";
        sha256 = "36ca6ca84ef6518f9c2c759ea88efd438a3c81d667ba23b02b062a0aa785475e";
      };

      beamDeps = [ ecto_sql jason postgrex telemetry ];
    };

    octo_fetch = buildMix rec {
      name = "octo_fetch";
      version = "0.4.0";

      src = fetchHex {
        pkg = "octo_fetch";
        version = "${version}";
        sha256 = "cf8be6f40cd519d7000bb4e84adcf661c32e59369ca2827c4e20042eda7a7fc6";
      };

      beamDeps = [ castore ssl_verify_fun ];
    };

    open_api_spex = buildMix rec {
      name = "open_api_spex";
      version = "3.21.2";

      src = fetchHex {
        pkg = "open_api_spex";
        version = "${version}";
        sha256 = "f42ae6ed668b895ebba3e02773cfb4b41050df26f803f2ef634c72a7687dc387";
      };

      beamDeps = [ decimal jason plug ];
    };

    paginator = buildMix rec {
      name = "paginator";
      version = "1.0.4";

      src = fetchHex {
        pkg = "paginator";
        version = "${version}";
        sha256 = "9d79d21c0192d8d1fc562e5c99b5ebf7e0bb443c671e256b41fd709170730b91";
      };

      beamDeps = [ ecto ecto_sql plug_crypto postgrex ];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.4.1";

      src = fetchHex {
        pkg = "parse_trans";
        version = "${version}";
        sha256 = "620a406ce75dada827b82e453c19cf06776be266f5a67cff34e1ef2cbb60e49a";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.6.16";

      src = fetchHex {
        pkg = "phoenix";
        version = "${version}";
        sha256 = "e15989ff34f670a96b95ef6d1d25bad0d9c50df5df40b671d8f4a669e050ac39";
      };

      beamDeps = [ castore jason phoenix_pubsub phoenix_view plug plug_cowboy plug_crypto telemetry ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.6.3";

      src = fetchHex {
        pkg = "phoenix_ecto";
        version = "${version}";
        sha256 = "909502956916a657a197f94cc1206d9a65247538de8a5e186f7537c895d95764";
      };

      beamDeps = [ ecto phoenix_html plug postgrex ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "3.3.4";

      src = fetchHex {
        pkg = "phoenix_html";
        version = "${version}";
        sha256 = "0249d3abec3714aff3415e7ee3d9786cb325be3151e6c4b3021502c585bf53fb";
      };

      beamDeps = [ plug ];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.6.5";

      src = fetchHex {
        pkg = "phoenix_live_dashboard";
        version = "${version}";
        sha256 = "ef4fa50dd78364409039c99cf6f98ab5209b4c5f8796c17f4db118324f0db852";
      };

      beamDeps = [ ecto mime phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.4.1";

      src = fetchHex {
        pkg = "phoenix_live_reload";
        version = "${version}";
        sha256 = "9bffb834e7ddf08467fe54ae58b5785507aaba6255568ae22b4d46e2bb3615ab";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "0.17.14";

      src = fetchHex {
        pkg = "phoenix_live_view";
        version = "${version}";
        sha256 = "afeb6ba43ce329a6f7fc1c9acdfc6d3039995345f025febb7f409a92f6faebd3";
      };

      beamDeps = [ jason phoenix phoenix_html telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.1.3";

      src = fetchHex {
        pkg = "phoenix_pubsub";
        version = "${version}";
        sha256 = "bba06bc1dcfd8cb086759f0edc94a8ba2bc8896d5331a1e2c2902bf8e36ee502";
      };

      beamDeps = [];
    };

    phoenix_template = buildMix rec {
      name = "phoenix_template";
      version = "1.0.4";

      src = fetchHex {
        pkg = "phoenix_template";
        version = "${version}";
        sha256 = "2c0c81f0e5c6753faf5cca2f229c9709919aba34fab866d3bc05060c9c444206";
      };

      beamDeps = [ phoenix_html ];
    };

    phoenix_view = buildMix rec {
      name = "phoenix_view";
      version = "2.0.4";

      src = fetchHex {
        pkg = "phoenix_view";
        version = "${version}";
        sha256 = "4e992022ce14f31fe57335db27a28154afcc94e9983266835bb3040243eb620b";
      };

      beamDeps = [ phoenix_html phoenix_template ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.16.1";

      src = fetchHex {
        pkg = "plug";
        version = "${version}";
        sha256 = "a13ff6b9006b03d7e33874945b2755253841b238c34071ed85b0e86057f8cddc";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_cowboy = buildMix rec {
      name = "plug_cowboy";
      version = "2.7.2";

      src = fetchHex {
        pkg = "plug_cowboy";
        version = "${version}";
        sha256 = "245d8a11ee2306094840c000e8816f0cbed69a23fc0ac2bcf8d7835ae019bb2f";
      };

      beamDeps = [ cowboy cowboy_telemetry plug ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "1.2.5";

      src = fetchHex {
        pkg = "plug_crypto";
        version = "${version}";
        sha256 = "26549a1d6345e2172eb1c233866756ae44a9609bd33ee6f99147ab3fd87fd842";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.19.3";

      src = fetchHex {
        pkg = "postgrex";
        version = "${version}";
        sha256 = "d31c28053655b78f47f948c85bb1cf86a9c1f8ead346ba1aa0d0df017fa05b61";
      };

      beamDeps = [ db_connection decimal jason ];
    };

    prom_ex = buildMix rec {
      name = "prom_ex";
      version = "1.9.0";

      src = fetchHex {
        pkg = "prom_ex";
        version = "${version}";
        sha256 = "01f3d4f69ec93068219e686cc65e58a29c42bea5429a8ff4e2121f19db178ee6";
      };

      beamDeps = [ ecto finch jason oban octo_fetch phoenix phoenix_live_view plug plug_cowboy telemetry telemetry_metrics telemetry_metrics_prometheus_core telemetry_poller ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.8.0";

      src = fetchHex {
        pkg = "ranch";
        version = "${version}";
        sha256 = "49fbcfd3682fab1f5d109351b61257676da1a2fdbe295904176d5e521a2ddfe5";
      };

      beamDeps = [];
    };

    recon = buildMix rec {
      name = "recon";
      version = "2.5.6";

      src = fetchHex {
        pkg = "recon";
        version = "${version}";
        sha256 = "96c6799792d735cc0f0fd0f86267e9d351e63339cbe03df9d162010cefc26bb0";
      };

      beamDeps = [];
    };

    reverse_proxy_plug = buildMix rec {
      name = "reverse_proxy_plug";
      version = "2.4.1";

      src = fetchHex {
        pkg = "reverse_proxy_plug";
        version = "${version}";
        sha256 = "9a2dff0250968a62a34330c6a88fcf9fbbba110966d84340f250b5156f0d59f9";
      };

      beamDeps = [ httpoison plug tesla ];
    };

    scrivener = buildMix rec {
      name = "scrivener";
      version = "2.7.2";

      src = fetchHex {
        pkg = "scrivener";
        version = "${version}";
        sha256 = "7866a0ec4d40274efbee1db8bead13a995ea4926ecd8203345af8f90d2b620d9";
      };

      beamDeps = [];
    };

    scrivener_ecto = buildMix rec {
      name = "scrivener_ecto";
      version = "2.7.0";

      src = fetchHex {
        pkg = "scrivener_ecto";
        version = "${version}";
        sha256 = "e809f171687806b0031129034352f5ae44849720c48dd839200adeaf0ac3e260";
      };

      beamDeps = [ ecto scrivener ];
    };

    sleeplocks = buildRebar3 rec {
      name = "sleeplocks";
      version = "1.1.3";

      src = fetchHex {
        pkg = "sleeplocks";
        version = "${version}";
        sha256 = "d3b3958552e6eb16f463921e70ae7c767519ef8f5be46d7696cc1ed649421321";
      };

      beamDeps = [];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.7";

      src = fetchHex {
        pkg = "ssl_verify_fun";
        version = "${version}";
        sha256 = "fe4c190e8f37401d30167c8c405eda19469f34577987c76dde613e838bbc67f8";
      };

      beamDeps = [];
    };

    sweet_xml = buildMix rec {
      name = "sweet_xml";
      version = "0.7.4";

      src = fetchHex {
        pkg = "sweet_xml";
        version = "${version}";
        sha256 = "e7c4b0bdbf460c928234951def54fe87edf1a170f6896675443279e2dbeba167";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.17.3";

      src = fetchHex {
        pkg = "swoosh";
        version = "${version}";
        sha256 = "14ad57cfbb70af57323e17f569f5840a33c01f8ebc531dd3846beef3c9c95e55";
      };

      beamDeps = [ cowboy ex_aws finch hackney jason mime plug plug_cowboy telemetry ];
    };

    tailwind = buildMix rec {
      name = "tailwind";
      version = "0.2.4";

      src = fetchHex {
        pkg = "tailwind";
        version = "${version}";
        sha256 = "c6e4a82b8727bab593700c998a4d98cf3d8025678bfde059aed71d0000c3e463";
      };

      beamDeps = [ castore ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.3.0";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "7015fc8919dbe63764f4b4b87a95b7c0996bd539e0d499be6ec9d7f3875b79e6";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "0.6.2";

      src = fetchHex {
        pkg = "telemetry_metrics";
        version = "${version}";
        sha256 = "9b43db0dc33863930b9ef9d27137e78974756f5f198cae18409970ed6fa5b561";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_metrics_prometheus_core = buildMix rec {
      name = "telemetry_metrics_prometheus_core";
      version = "1.2.1";

      src = fetchHex {
        pkg = "telemetry_metrics_prometheus_core";
        version = "${version}";
        sha256 = "5e2c599da4983c4f88a33e9571f1458bf98b0cf6ba930f1dc3a6e8cf45d5afb6";
      };

      beamDeps = [ telemetry telemetry_metrics ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.1.0";

      src = fetchHex {
        pkg = "telemetry_poller";
        version = "${version}";
        sha256 = "9eb9d9cbfd81cbd7cdd24682f8711b6e2b691289a0de6826e58452f28c103c8f";
      };

      beamDeps = [ telemetry ];
    };

    tesla = buildMix rec {
      name = "tesla";
      version = "1.13.2";

      src = fetchHex {
        pkg = "tesla";
        version = "${version}";
        sha256 = "960609848f1ef654c3cdfad68453cd84a5febecb6ed9fed9416e36cd9cd724f9";
      };

      beamDeps = [ castore finch hackney jason mime mint telemetry ];
    };

    typed_ecto_schema = buildMix rec {
      name = "typed_ecto_schema";
      version = "0.4.1";

      src = fetchHex {
        pkg = "typed_ecto_schema";
        version = "${version}";
        sha256 = "85c6962f79d35bf543dd5659c6adc340fd2480cacc6f25d2cc2933ea6e8fcb3b";
      };

      beamDeps = [ ecto ];
    };

    typed_struct = buildMix rec {
      name = "typed_struct";
      version = "0.3.0";

      src = fetchHex {
        pkg = "typed_struct";
        version = "${version}";
        sha256 = "c50bd5c3a61fe4e198a8504f939be3d3c85903b382bde4865579bc23111d1b6d";
      };

      beamDeps = [];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "unicode_util_compat";
        version = "${version}";
        sha256 = "25eee6d67df61960cf6a794239566599b09e17e668d3700247bc498638152521";
      };

      beamDeps = [];
    };

    unsafe = buildMix rec {
      name = "unsafe";
      version = "1.0.2";

      src = fetchHex {
        pkg = "unsafe";
        version = "${version}";
        sha256 = "b485231683c3ab01a9cd44cb4a79f152c6f3bb87358439c6f68791b85c2df675";
      };

      beamDeps = [];
    };
  };
in self

