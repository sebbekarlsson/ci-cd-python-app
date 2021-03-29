from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Table, create_engine, MetaData
from sqlalchemy.orm import sessionmaker


engine = create_engine('mysql+pymysql://pyapp:abc123@localhost/pyapp', echo=True)

Base = declarative_base()

Session = sessionmaker(bind=engine)


class WallPost(Base):
    __tablename__ = 'wall_posts'

    id = Column(Integer, primary_key=True)
    text = Column(String(360))


if not engine.dialect.has_table(engine, 'wall_posts'):
    metadata = MetaData(engine)
    Table('wall_posts', metadata,
          Column('id', Integer, primary_key=True, nullable=False),
          Column('text', String(360))),
    metadata.create_all()


def create_wallpost(text):
    session = Session()
    post = WallPost(text=text)
    session.add(post)
    session.commit()
    session.flush()


def get_all_wallposts():
    session = Session()
    return list(session.query(WallPost).all())
