-- V1__create_wal_transaction_and_operation_tables.sql

-- 트랜잭션 테이블
CREATE TABLE wal_transaction (
    id BIGSERIAL PRIMARY KEY,
    xid BIGINT NOT NULL,
    status VARCHAR(20) CHECK (status IN ('COMMIT', 'ABORT')),
    commit_time TIMESTAMP,
    start_lsn VARCHAR(50),
    end_lsn VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 작업 테이블
CREATE TABLE wal_operation (
    id BIGSERIAL PRIMARY KEY,
    transaction_id BIGINT NOT NULL REFERENCES wal_transaction(id) ON DELETE CASCADE,
    operation_type VARCHAR(20) CHECK (operation_type IN ('INSERT', 'UPDATE', 'DELETE')),
    table_oid BIGINT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 코멘트
COMMENT ON TABLE wal_transaction IS 'WAL 파싱 결과 - 트랜잭션 정보';
COMMENT ON TABLE wal_operation IS 'WAL 파싱 결과 - 트랜잭션 내 작업 정보';