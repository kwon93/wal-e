## APIs
```
POST /api/v1/wal/parse/upload
- WAL 파일 업로드 및 파싱 작업 시작

GET /api/v1/wal/parse/jobs
- 파싱 작업 목록

GET /api/v1/wal/parse/jobs/{job_id}/status
- 파싱 진행 상황

GET /api/v1/wal/parse/jobs/{job_id}/summary
- 전체 요약 통계 (wal_summary)

GET /api/v1/wal/parse/jobs/{job_id}/tables
- 테이블별 통계 (table_statistics)

GET /api/v1/wal/parse/jobs/{job_id}/timeline
- 시간대별 트랜잭션 그래프 (transaction_timeline)

