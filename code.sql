create table if not exists genre(id serial primary key, name varchar(50));
create table if not exists artist(id serial primary key, name varchar(50));
create table if not exists artist_genre(
	id serial,
	genre_id integer not null,
	artist_id integer not null,
	primary key (genre_id, artist_id),
	foreign key (genre_id) references genre(id),
	foreign key (artist_id) references artist(id)
);
create table if not exists album(id serial primary key, name varchar(100), year_of_release date);
create table if not exists artist_album(
	id serial,
	artist_id integer not null,
	album_id integer not null,
	primary key (artist_id, album_id),
	foreign key (artist_id) references artist(id),
	foreign key (album_id) references album(id)
);
create table if not exists collection(id serial primary key, name varchar(50), year_of_release date);
create table if not exists track(
	id serial primary key,
	name varchar(50) not null,
	duration text not null,
	album_id integer not null,
	collection_id integer,
	foreign key (album_id) references album(id),
	foreign key (collection_id) references collection(id)
);
