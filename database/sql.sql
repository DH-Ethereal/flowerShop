drop database if exists flowers;
create database flowers charset=gbk;
use flowers;
drop table if exists users;

drop table if exists flower;

drop table if exists cart;

drop table if exists orders;

drop table if exists orderlist;

create table if not exists admin
(
    ad_id    varchar(20) not null,
    ad_name  varchar(20) not null,
    ad_pwd   varchar(50) not null,
    end_time datetime    not null,
    constraint `PRIMARY`
    primary key (ad_id)
    );

create table if not exists flower
(
    flowercode  varchar(100)                not null,
    type        varchar(100)                not null,
    flower_name varchar(100)                not null,
    material    varchar(255)                not null,
    pack        varchar(100)                not null,
    descs       varchar(255)                not null,
    price       decimal(10, 2)              not null,
    discount    decimal(10, 2) default 1.00 not null,
    image       varchar(255)                not null,
    deliverarea varchar(100)                not null,
    amount      int                         not null,
    createtime  datetime                    not null,
    remark      text                        not null,
    constraint `PRIMARY`
    primary key (flowercode)
    );

create table if not exists users
(
    user_id     int auto_increment
    primary key,
    user_name   varchar(100)  not null,
    password    varchar(100)  not null,
    sex         varchar(20)   not null,
    birthday    date          not null,
    tel         varchar(50)   not null,
    mail        varchar(70)   not null,
    grade       int default 1 not null,
    record_date datetime      null,
    constraint users_mail_uindex
    unique (mail),
    constraint users_tel_uindex
    unique (tel)
    );

create table if not exists cart
(
    cart_id    int auto_increment
    primary key,
    user_id    int            not null,
    flowercode varchar(100)   not null,
    count      int            not null,
    totalprice decimal(10, 2) not null,
    constraint cart_ibfk_1
    foreign key (user_id) references users (user_id),
    constraint cart_ibfk_2
    foreign key (flowercode) references flower (flowercode)
    );

create index flowercode
    on cart (flowercode);

create index userid
    on cart (user_id);

create table if not exists orders
(
    order_id       varchar(100)   not null,
    user_id        int            not null,
    touser_name    varchar(100)   not null,
    touser_tel     varchar(100)   not null,
    touser_address varchar(100)   not null,
    totalprice     decimal(10, 2) not null,
    od_createtime  datetime       not null,
    status         int default 0  not null,
    od_remark      varchar(100)   null,
    constraint `PRIMARY`
    primary key (order_id),
    constraint orders_ibfk_1
    foreign key (user_id) references users (user_id)
    );

create table if not exists orderlist
(
    od_id      int auto_increment
    primary key,
    order_id   varchar(100)   not null,
    flowercode varchar(100)   not null,
    count      int            not null,
    summary    decimal(10, 2) not null,
    constraint orderlist_ibfk_1
    foreign key (order_id) references orders (order_id),
    constraint orderlist_ibfk_2
    foreign key (flowercode) references flower (flowercode)
    );

create index flowercode
    on orderlist (flowercode);

create index orderid
    on orderlist (order_id);

create index userid
    on orders (user_id);

create definer = root@localhost view order_orderlist as
select `flowers`.`orderlist`.`od_id`       AS `od_id`,
       `flowers`.`orderlist`.`order_id`    AS `order_id`,
       `flowers`.`orderlist`.`flowercode`  AS `flowercode`,
       `flowers`.`orderlist`.`count`       AS `count`,
       `flowers`.`orderlist`.`summary`     AS `summary`,
       `flowers`.`orders`.`user_id`        AS `user_id`,
       `flowers`.`orders`.`touser_name`    AS `touser_name`,
       `flowers`.`orders`.`touser_tel`     AS `touser_tel`,
       `flowers`.`orders`.`touser_address` AS `touser_address`,
       `flowers`.`orders`.`totalprice`     AS `totalprice`,
       `flowers`.`orders`.`od_createtime`  AS `od_createtime`,
       `flowers`.`orders`.`status`         AS `status`,
       `flowers`.`orders`.`od_remark`      AS `od_remark`,
       `flowers`.`users`.`user_name`       AS `user_name`,
       `flowers`.`users`.`password`        AS `password`,
       `flowers`.`users`.`sex`             AS `sex`,
       `flowers`.`users`.`birthday`        AS `birthday`,
       `flowers`.`users`.`tel`             AS `tel`,
       `flowers`.`users`.`mail`            AS `mail`,
       `flowers`.`users`.`grade`           AS `grade`,
       `flowers`.`users`.`record_date`     AS `record_date`,
       `flowers`.`flower`.`type`           AS `type`,
       `flowers`.`flower`.`flower_name`    AS `flower_name`,
       `flowers`.`flower`.`material`       AS `material`,
       `flowers`.`flower`.`pack`           AS `pack`,
       `flowers`.`flower`.`descs`          AS `descs`,
       `flowers`.`flower`.`price`          AS `price`,
       `flowers`.`flower`.`discount`       AS `discount`,
       `flowers`.`flower`.`image`          AS `image`,
       `flowers`.`flower`.`deliverarea`    AS `deliverarea`,
       `flowers`.`flower`.`amount`         AS `amount`,
       `flowers`.`flower`.`createtime`     AS `createtime`,
       `flowers`.`flower`.`remark`         AS `remark`
from `flowers`.`orderlist`
         join `flowers`.`orders`
         join `flowers`.`users`
         join `flowers`.`flower`
where ((`flowers`.`orderlist`.`order_id` = `flowers`.`orders`.`order_id`) and
       (`flowers`.`orders`.`user_id` = `flowers`.`users`.`user_id`) and
       (`flowers`.`orderlist`.`flowercode` = `flowers`.`flower`.`flowercode`));

create definer = root@localhost view user_cart as
select `flowers`.`cart`.`user_id`       AS `user_id`,
       `flowers`.`users`.`user_name`    AS `user_name`,
       `flowers`.`users`.`password`     AS `password`,
       `flowers`.`users`.`sex`          AS `sex`,
       `flowers`.`users`.`birthday`     AS `birthday`,
       `flowers`.`users`.`tel`          AS `tel`,
       `flowers`.`users`.`mail`         AS `mail`,
       `flowers`.`users`.`grade`        AS `grade`,
       `flowers`.`users`.`record_date`  AS `record_date`,
       `flowers`.`cart`.`flowercode`    AS `flowercode`,
       `flowers`.`flower`.`type`        AS `type`,
       `flowers`.`flower`.`flower_name` AS `flower_name`,
       `flowers`.`flower`.`material`    AS `material`,
       `flowers`.`flower`.`pack`        AS `pack`,
       `flowers`.`flower`.`descs`       AS `descs`,
       `flowers`.`flower`.`price`       AS `price`,
       `flowers`.`flower`.`discount`    AS `discount`,
       `flowers`.`flower`.`image`       AS `image`,
       `flowers`.`flower`.`deliverarea` AS `deliverarea`,
       `flowers`.`flower`.`amount`      AS `amount`,
       `flowers`.`flower`.`createtime`  AS `createtime`,
       `flowers`.`flower`.`remark`      AS `remark`,
       `flowers`.`cart`.`cart_id`       AS `cart_id`,
       `flowers`.`cart`.`count`         AS `count`,
       `flowers`.`cart`.`totalprice`    AS `totalprice`
from `flowers`.`cart`
         join `flowers`.`flower`
         join `flowers`.`users`
where ((`flowers`.`cart`.`user_id` = `flowers`.`users`.`user_id`) and
       (`flowers`.`cart`.`flowercode` = `flowers`.`flower`.`flowercode`));

create definer = root@localhost view user_order as
select `flowers`.`orders`.`user_id`        AS `user_id`,
       `flowers`.`users`.`user_name`       AS `user_name`,
       `flowers`.`users`.`password`        AS `password`,
       `flowers`.`users`.`sex`             AS `sex`,
       `flowers`.`users`.`birthday`        AS `birthday`,
       `flowers`.`users`.`tel`             AS `tel`,
       `flowers`.`users`.`mail`            AS `mail`,
       `flowers`.`users`.`grade`           AS `grade`,
       `flowers`.`users`.`record_date`     AS `record_date`,
       `flowers`.`orders`.`order_id`       AS `order_id`,
       `flowers`.`orders`.`touser_name`    AS `touser_name`,
       `flowers`.`orders`.`touser_tel`     AS `touser_tel`,
       `flowers`.`orders`.`touser_address` AS `touser_address`,
       `flowers`.`orders`.`totalprice`     AS `totalprice`,
       `flowers`.`orders`.`od_createtime`  AS `od_createtime`,
       `flowers`.`orders`.`status`         AS `status`,
       `flowers`.`orders`.`od_remark`      AS `od_remark`
from `flowers`.`orders`
         join `flowers`.`users`
where (`flowers`.`orders`.`user_id` = `flowers`.`users`.`user_id`);

INSERT INTO flowers.admin (ad_id, ad_name, ad_pwd, end_time) VALUES ('admin', 'admin', 'admin', '2021-03-15 14:30:14');

INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1001', '专业手工花束', '善良', '2奶油洛杉矶百合,2粉红色Bouvardia,3粉红金鱼草,开心果', '精美的编束与花瓶', '美丽的冰冷色调和女性色调', 126.00, 1.00, 'hf01.png,hf011.png,hf012.png,hf013.png,hf014.png,hf015.png', '全市', 20, '2021-01-29 13:02:00', '这种柔和的花朵组合是给爱人的完美惊喜。无论在什么场合，他们一定会欣赏到这些美丽的百合、布瓦迪亚和金鱼草，还有绿叶。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1002', '专业手工花束', '生日快乐', '5朵粉红玫瑰,3 Ammi Majus,3粉红色六出,3粉红金鱼草,3白色翠菊,3桉树', '精美的编束与花瓶', '完美粉红色', 100.00, 1.00, 'hf02.png,hf021.png,hf022.png,hf023.png,hf024.png,hf025.png', '全市', 0, '2021-01-25 10:57:14', '这美丽的安排带我们到了粉红天堂!漂亮的金莲花、檀香花和玫瑰水提供了甜美的淡粉色色调，并与白色的阿美和紫菀的蕾丝簇完美搭配。任何场合都可以使用的花束和礼物。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1003', '专业手工花束', '想着你', '3朵粉红玫瑰,3 Ammi Majus,3白色Alstroemeria,3紫翠菊,3白色Germini,2开心果绿色植物', '精美的编束与花瓶', '柔和色调', 96.89, 1.00, 'hf03.png,hf031.png,hf032.png,hf033.png,hf034.png,hf035.png', '全市', 22, '2021-01-28 10:57:36', '这束花束通过它柔软的纹理和微妙的柔和色调，将夏日的喜悦和舒适带入家中。天鹅绒般的浅粉色玫瑰和美丽的褶边花束与紫丁香紫菀和白色蕾丝状的ami majus花簇相结合，白色的alstroemeria和双子座为装饰带来明亮和新鲜的感觉。这束花是完美的，作为一个美丽和周到的礼物送给朋友或亲戚。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1004', '专业手工花束', '友情', '1粉红东方百合,3朵粉红玫瑰,2白莲子,1白色满天星,3桉树', '精美的编束与花瓶', '完美无瑕的粉色花瓣', 99.99, 1.00, 'hf04.png,hf041.png,hf042.png,hf043.png,hf044.png,hf045.png', '全市', 28, '2021-01-29 08:21:40', '这束美丽的花束全是粉红色的，适宜的玫瑰，桔梗和胚芽各自带出自己的绚丽色调。 大型耀眼的粉红色东方百合不仅给人一种迷人的感觉，而且使布置更加完美-适合任何场合。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1005', '专业手工花束', '完美的混合玫瑰', '6 Fairtrade白玫瑰,6粉红玫瑰,12朵红玫瑰', '精美的编束与花瓶', '用玫瑰说', 199.00, 1.00, 'hf08.png,hf081.png,hf082.png,hf083.png,hf084.png,hf085.png', '全市', 24, '2021-01-29 08:09:09', '用这束经典的玫瑰让对方倾倒，或者只是表示你有多在乎他。诱人的樱桃色，浪漫的红色和纯白色的玫瑰组合在一起，创造出一种具有现代感的传统最爱。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1006', '专业手工花束', '香味四溢双百合', '7粉色东方双百合', '精美的编束与花瓶', '莉莉·爱...', 125.21, 1.00, 'hf09.png,hf091.png,hf092.png,hf093.png,hf094.png,hf095.png', '全市', 45, '2021-01-26 11:11:55', '说到切花，这些双重东方百合是真正的最爱。此花束散发着优雅的花朵，宜人的气味和美丽的覆盆子色彩，令人耳目一新。更重要的是，这些百合花不含花粉，而且100％可养宠物，这意味着您不仅可以享受令人惊艳的百合花，而且还能确保自己所爱的宠物安全。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1007', '专业手工花束', '英国ALSTROEMERIA32', '32种杂色檀香', '精美的编束与花瓶', '万花筒的颜色', 121.34, 1.00, 'hf13.png,hf131.png,hf132.png,hf133.png,hf134.png,hf135.png', '全市', 35, '2021-01-27 08:16:00', '用这束华丽的英国百合，也被称为秘鲁百合，来款待特别的人。我们用了32根令人眼花缭乱的桤木茎，每一根都有精致的花朵，保证无论在什么场合，都能照亮幸运的接受者的日子。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1008', '信箱的花', '信箱专为您', '1 LA粉红百合,3朵红玫瑰,3朵粉红玫瑰,3红桔梗', '干燥包装', '特别是为您准备的', 128.00, 1.00, 'lf01.png,lf011.png,lf012.png,lf013.png,lf014.png,lf015.png', '全市', 0, '2021-01-28 09:25:40', '礼物精美的粉红色和红色花朵，这封信箱礼物可为您带来情人节的纯正喜悦。方便地设计成适合接收者的信箱，他们既可以欣赏您的礼物，又可以观看自己布置的花束的惊人绽放');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1009', '信箱的花', '信箱玫瑰', '5朵白玫瑰,5朵黄玫瑰,1格林贝尔', '干燥包装', '愉悦', 145.00, 1.00, 'lf02.png,lf021.png,lf022.png,lf023.png,lf024.png,lf025.png', '全市', 23, '2021-01-27 08:30:12', '精心挑选的黄色，白色和绿色花朵装在一个适合您信箱的包装盒中！您可以在家中自行布置每朵玫瑰。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1010', '信箱的花', 'letter-box混合玫瑰', '13混合alstroemeria', '干燥包装', '重要', 130.00, 1.00, 'lf03.png,lf031.png,lf032.png,lf033.png,lf034.png,lf035.png', '全市', 56, '2021-01-29 11:34:00', '这些美丽的混合Alstromeria来自英国农场，并在我们专门设计的信箱包装交付。简单的订单，易于交付和包装新鲜，优质的季节性茎，他们作出了一个有意义的姿态，不能忘记。虽然这种秘鲁百合对猫没有致命的毒性，但如果食用，会引起腹部或皮肤的刺激。正因为如此，我们建议把这些花放在毛茸茸的朋友够不着的地方，以防万一。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1011', '信箱的花', 'LETTERBOX甜心红玫瑰', '12朵40厘米的甜心红玫瑰', '干燥包装', '亲爱的人，为您的爱人准备的', 149.99, 1.00, 'lf04.png,lf041.png,lf042.png,lf043.png,lf044.png,lf045.png', '全市', 1, '2021-01-28 07:39:22', '这个体贴的信箱礼物是一个美丽的方式送花惊喜这个情人节。赠送12朵经典的红玫瑰，收礼者不仅能享受将花束的花茎编成自己的花束的乐趣，还能时常想起你发自内心的心意。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1012', '豪华的花', '爱茉莉', '5红罗多斯玫瑰 ,7维多利亚桃玫瑰,5深粉色桔梗,5深粉红色Astilbe,7粉红花,5薰衣草,5白黑黎芦,10片桉树', '精美的编束与花瓶', 'Ti amo', 200.00, 1.00, 'lfs01.png,lfs011.png,lfs012.png,lfs013.png,lfs014.png,lfs015.png', '全市', 28, '2021-01-30 11:43:25', '“Amore”这个词源于意大利语，意为“爱”，它已经是一种非常特别的东西了。在设计中，我们考虑到了浪漫的高度，将一系列美丽的安头菊、蜡菊和hellebores与深粉色的丁香和新妇花搭配在一起，并使用奢华的60厘米红色和维多利亚式的桃红玫瑰来完成布置。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1013', '豪华的花', '繁花似锦', '24勃艮第玫瑰,24 Aqua玫瑰,24雅典娜玫瑰', '精美的编束与花瓶', '使陶醉', 187.00, 1.00, 'lfs02.png,lfs021.png,lfs022.png,lfs023.png,lfs024.png,lfs025.png', '全市', 18, '2021-01-30 08:52:58', '如果一打玫瑰不够，那六打怎么样?不少于72朵红、粉、白玫瑰组成的花束，一定会给你的爱人留下深刻的印象。这是最浪漫的举动。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1014', '豪华的花', '诺丁山', '10诺丁山玫瑰,8覆盆子Scabiosa,3红色Gloriosa,10荚莲,开花螺旋藻', '精美的编束与花瓶', '真心的渴望...', 168.00, 1.00, 'lfs03.png,lfs031.png,lfs032.png,lfs033.png,lfs034.png,lfs035.png', '全市', 33, '2021-01-30 06:59:36', '这款迷人的花束以迷人而浪漫的柔和色诺丁山玫瑰（Notting Hill Rose）命名，具有粉红色，橙色和桃红色的淡淡色调。覆盆子色scabiosa和红色glorioosa带给您迷人的色彩，而桔梗的鲑鱼色调则完美平衡了布置。此花束充满绿色荚vi的气息和spirea grefsheim的火花，描绘出完全的放纵和奢华。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1015', '豪华的花', '浆果粉碎', '10玫瑰Vuvuzela,5 Waxflower粉红色,5 Veronica粉色,5金丝桃可可赌场,5 Astrantia粉色,8 Spray玫瑰Jana,8条铁线莲,6 Leucothoe叶子', '精美的编束与花瓶', '一束柔和的果味', 157.00, 1.00, 'lfs04.png,lfs041.png,lfs042.png,lfs043.png,lfs044.png,lfs045.png', '全市', 35, '2021-01-30 07:02:22', '丰富，豪华的花香令人叹为观止，我们的Berry Crush在各个方面几乎都是完美的。Vuvuzela玫瑰以其大杯形的花朵，艳丽的桃红色中心花和鲑鱼粉色外花瓣而引人注目。我们的花店提供了一系列令人愉悦的浅色和深粉红色色调的Jana喷雾玫瑰，铁线莲，蜡梅和高大的Veronica尖顶，而漏斗形的杂色weigela则增添了优雅气息，并与粉红色astrantia整齐的枕形花朵形成鲜明对比。腮红可可赌场金丝桃属植物浆果使花束充满新鲜色彩。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1016', '情人节鲜花', '混合情人节玫瑰', '4朵红玫瑰,4朵粉红玫瑰,4朵玫瑰', '精美的编束与花瓶', '混合起来！', 188.00, 1.00, 'dk01.png,dk011.png,dk012.png,dk013.png,dk014.png,dk015.png', '全市', 18, '2021-01-29 12:05:55', '在情人节那天，将您挚爱的玫瑰，樱桃红和粉红玫瑰完美融合。每朵玫瑰都提供梦幻般的阴影，描绘出浪漫的高度，完美地互补，营造出您所爱的人所珍惜的豪华布置。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1017', '情人节鲜花', '高级两打红玫瑰', '24朵红杜鹃玫瑰50cm,8 Parvifolia叶子', '精美的编束与花瓶', '令人陶醉的罗多斯', 199.00, 1.00, 'dk02.png,dk021.png,dk022.png,dk023.png,dk024.png,dk025.png', '全市', 45, '2021-01-30 06:10:30', '一打红玫瑰还不够！送出些许魔力，并用这束美丽的24朵红色Rhodos玫瑰与桉木完美搭配，展现您的崇拜。在高海拔地区种植，意味着杜鹃花玫瑰的头更大，花开得更大，这是在情人节那天打动亲人的最好方法。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1018', '情人节鲜花', '纯真的爱情', '6白雪崩玫瑰,3白莲子,5绿色金丝桃,5白色维罗妮卡,5白福禄考,5桉树,6 Leucothoe叶子', '精美的编束与花瓶', '在情人节脱颖而出', 178.00, 1.00, 'dk03.png,dk031.png,dk032.png,dk033.png,dk034.png,dk035.png', '全市', 38, '2021-01-30 08:11:49', '对于这个情人节，有些不同的东西，请用最纯净的白色将您喜欢的那朵美丽的花束对待。雪崩玫瑰，桔梗，维罗妮卡和福禄考都为这种布置带来了自己精致的白色阴影，最后以别致的桉树，金丝桃和白桦树叶装饰，形成了华丽的绿色背景。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1019', '情人节鲜花', '情人节的郁金香', '15粉色郁金香,15红色郁金香', '精美的编束与花瓶', '表达你的爱意', 166.00, 1.00, 'dk04.png,dk041.png,dk042.png,dk043.png,dk044.png,dk045.png', '全市', 67, '2021-01-30 09:10:21', '这些梦幻般的红色和粉红色郁金香是在情人节表达爱慕的完美方式。任何手势的绝佳选择，它们都能使您的特别的人微笑。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1020', '情人节鲜花', '情人节经典礼品套装', '12红罗多斯玫瑰50cm,5 Parvifolia叶子,爱可可粉心覆盆子香槟松露70g', '精美的编束、花瓶和一些礼品', '完美的组合', 222.00, 1.00, 'dk05.png,dk051.png,dk052.png,dk053.png,dk054.png,dk055.png', '全市', 39, '2021-01-30 07:16:42', '玫瑰与巧克力的经典而永恒的组合真的不会出错。这12朵Rhodos玫瑰生长在高海拔地区，意味着更大的头甚至更大的花朵，提供了一个郁郁葱葱的花束，可以欣赏Love Cocoa的美味覆盆子香槟松露。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1021', '特别供应', '晴天', '10朵黄玫瑰,6白色金鱼草,3个单叶艾菊,3一枝黄花,6绿色金丝桃,6 Craspedia,6白色小苍兰', '精美的编束与花瓶', '传递一缕阳光', 168.00, 1.00, 'ss01.png,ss011.png,ss012.png,ss013.png,ss014.png,ss015.png', '全市', 17, '2021-01-30 09:23:56', '以这种艳丽的阳光花束的形式，将一缕阳光传递到亲人的家中。明亮的黄色玫瑰是从一系列花香中选出来的布置的核心，其中包括精美的白色小苍兰。无论何时何地，都是带笑容的完美方式。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1022', '特别供应', '柠檬酒', '6黄色小苍兰,6白雪崩玫瑰,3 Ammi Majus,4白色福禄考 ,4朵黄色喷玫瑰,4白莲子 ,5杂色皮托', '精美的编束与花瓶', '阳光明媚的花卉收藏', 143.00, 1.00, 'ss02.png,ss021.png,ss022.png,ss023.png,ss024.png,ss025.png', '全市', 35, '2021-01-28 09:27:12', '柔和的黄色和白色调相结合，创造出清新的花束，可确保照亮某人的一天。这种豪华的布置是由我们许多花卉的最爱组成的，包括纯白色的雪崩玫瑰和精美的黄色小苍兰-无论何时何地，都是对待特殊人士的完美方式。');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1023', '特别供应', '白色陶瓷锅中的兰花', '1白色“野生”兰花,1个白色陶瓷锅', '精美的编束与花瓶', '美感', 98.00, 1.00, 'ss03.png,ss031.png,ss032.png,ss033.png,ss034.png,ss035.png', '全市', 43, '2021-01-30 08:29:32', '这个名字说明了一切。一朵美丽的野生兰花。兰花“ Wild”具有白色的花朵和黄色的中心，并呈现在白色的陶瓷花盆中，可为任何房间带来异域风情！如果您将其作为礼物送给接收者，那将非常高兴！');
INSERT INTO flowers.flower (flowercode, type, flower_name, material, pack, descs, price, discount, image, deliverarea, amount, createtime, remark) VALUES ('1024', '特别供应', '关怀', '24朵白玫瑰', '精美的编束与花瓶', '无微不至', 121.00, 1.00, 'ss04.png,ss041.png,ss042.png,ss043.png,ss044.png,ss045.png', '全市', 0, '2021-01-30 07:33:01', ' 这些Fairtrade白玫瑰是送花以示关怀的经典选择。这束美丽的手工绑束的24朵纯白玫瑰肯定会很高兴收到。');
