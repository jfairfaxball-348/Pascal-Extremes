# Stage 6 — Palomar packaging and registration audit

Date: 2026-09-30

## Gate

**BLOCKED — packaging and full predictive verification are complete, but no real Palomar registration has been created.**

The unresolved issue is operational, not mathematical or Comparator-related: Palomar's ordinary agent intake requires a temporary repository tag and a secret GitHub gist. The authenticated GitHub connector available in this session can edit repository content and branches but exposes neither tag creation/deletion nor gist creation/deletion, and the local shell has no authenticated `gh`. Palomar explicitly forbids substituting a weaker proof of write access. No Palomar ID, version, or entry link is claimed.

## Current contract pins checked

The September 25 predecessor pins were not reused blindly. The current official contract was re-read on 2026-09-30 and the following exact revisions were observed:

- `PalomarRegistry/PalomarPolicy@96b034cc31a72a63d4f4041911dce337a85c9a04` — requires the Lean module system and at most 10,000 lines per committed Lean source.
- `PalomarRegistry/PalomarSubmission@65f0154ed776cd26c224254aa57b379137f28b0d` — current reusable verification workflow and intake contract used by this project.
- `PalomarRegistry/PalomarTemplate@2891de4c48955af824969a263d31b25e7a9a1406` — current starter/package example consulted for layout only.
- Submitted Lean toolchain: `leanprover/lean4:v4.35.0-rc2`.
- Lean commit recorded by the passing mechanical report: `11acb17ec6b07a8f9e9173e6845197929540936b`.
- Mathlib: `bd6c1abe5f55b6c3856172d6a23703e0888f5286`.

Palomar's current judge is the `lake comparator` bundled with the submitted Lean toolchain. Therefore the executable Comparator provenance actually used here is the recorded Lean release/commit above, not an independently guessed head of the historical standalone `leanprover/comparator` repository. The passing report additionally records tool binary digests, including `lean`, `leanexport`, `nanoda_bin`, and `con-ron`.

## Packaging changes

The current Palomar source contract requires every committed Lean source to use the module system. The Stage-5 sources used legacy imports, so Stage 6 mechanically ported the project to modules. Public declarations and definition bodies were placed in `@[expose] public section` where needed so downstream proofs retain the pre-module transparency they relied on. This migration changes source visibility/import packaging only; it does not change theorem statements or mathematical proofs.

The Palomar-facing files are:

- `Challenge.lean`: a 72-line, 2,292-byte Mathlib-only statement surface. Its only direct import is `Mathlib`.
- `Solution.lean`: repeats the exact Challenge declarations and bridges them transparently to the completed `PascalExtremes` theorem layer.
- `comparator.json`: selects the exact advertised theorem surface.
- `formalization.yaml`: v0.4 provenance/review metadata preserving the Stage-4 wording discipline.
- `.github/workflows/palomar-preflight.yml`: reusable full Palomar predictive verification pinned to `PalomarSubmission@65f0154ed776cd26c224254aa57b379137f28b0d`.

The Lake project declares explicit `PascalExtremes`, `Challenge`, and `Solution` libraries and builds all three by default.

## Advertised theorem surface

Comparator checks these declarations:

1. `PascalExtremesPalomar.targetA_attainment`
   - for every prime `p` and `m >= 2` with `p ∤ m`, constructively produces an admissible equality row;
   - it is deliberately stated before the least-extremal-row definition `T`.
2. `PascalExtremesPalomar.targetA`
   - exact `IsGreatest` statement for the maximum of `v_p(G(N;m))` over admissible rows.
3. `PascalExtremesPalomar.targetB`
   - for every prime `p` and `a >= 2`, proves
     `T p (p^a + 1) = p^(3*a) + 1`.

The project-specific definitions in these statements are concrete Challenge definitions: `admissibleIndices`, `G`, `AdmissibleRow`, `rP`, `extremalRows`, and `T`. They are protected through Comparator's theorem-statement dependency comparison. They are intentionally **not** listed in `definition_names`: under the current Comparator contract that field denotes solution-filled definition holes, which these are not. The passing protected configuration therefore correctly reports `definition_names: []`.

The immutable candidate that passed both repository CI and full predictive Palomar verification is:

`3f234e061d44fcd2ececab1280788e7a39c90822`

Relevant hashes from the passing mechanical report:

- Challenge SHA-256: `1feffe53e59feeaaa90adeede955c4afee56193ec74d788ad7ee728aa5fde029`
- canonical Challenge OLean SHA-256: `2f4046df733346e2ba4663895bd842c187982058b035b1fd252c40d86e269b8c`
- Solution SHA-256: `2be501859c0eddb17bd721d038c3131d081f59d0e9db318e0a34797a1a547f81`
- Comparator configuration SHA-256: `4a4763703815b3cbce5a6d48c6ae3a6eadf6bb4bfdae015b5fd48385ad88ee3f`
- `formalization.yaml` SHA-256: `487137d0202ef5bf280216c643355c22588cbd38a624d4c46b65959071ee89d0`

## Commands and workflow configuration

Repository CI at the final candidate ran:

```sh
lake update
lake exe cache get
lake build
test "$(grep -R -E '\b(sorry|admit)\b' --include='*.lean' PascalExtremes PascalExtremes.lean | wc -l)" -eq 0
```

The pinned predictive Palomar workflow uses:

```yaml
uses: PalomarRegistry/PalomarSubmission/.github/workflows/submission.yml@65f0154ed776cd26c224254aa57b379137f28b0d
with:
  repository: ${{ github.repository }}
  commit: ${{ github.sha }}
  pipeline_commit: 65f0154ed776cd26c224254aa57b379137f28b0d
  request_id: pascalxtrm06
  mode: full
  execution_profile: palomar-standard-v1
  options: '{"comparator_config_path":"comparator.json","authorization_relationship":"I am a responsible author or maintainer"}'
```

The 12-character lowercase alphanumeric `request_id` is required by the pinned verifier contract.

## Verification record

Final repository Lean CI:

- run: https://github.com/jfairfaxball-348/Pascal-Extremes/actions/runs/36690939241
- result: **success**

Final full predictive Palomar preflight:

- run: https://github.com/jfairfaxball-348/Pascal-Extremes/actions/runs/36690939932
- immutable source: `3f234e061d44fcd2ececab1280788e7a39c90822`
- mechanical report: `status: pass`, `stage: complete`
- warnings: none
- errors: none
- Comparator exit: success
- Lean default kernel: accepted
- NanoDa kernel: accepted
- con-ron kernel: accepted
- Comparator tail: `Your solution is okay!`

The report records Mathlib as the only trusted Challenge dependency and reports no untrusted Challenge sources.

### Earlier packaging diagnostics

Two early predictive runs, 36689272216 and 36689919617, stopped during preparation. Their finalizer surfaced `palomar.reporting_failed` / retryable diagnostics because the report could not bind to the workflow inputs. Root-cause inspection of the pinned verifier contract showed that the original `request_id: pascalextremesstage6` violated the exact twelve-lowercase-alphanumeric requirement. This was a packaging error, not a mathematical or Comparator failure; it was corrected to `pascalxtrm06`.

An early repository build, run 36689271330, also exposed a module-migration transparency issue in `Kummer.lean`; replacing ordinary `public section` with `@[expose] public section` restored the legacy definitional transparency. Subsequent repository CI passed.

## Provenance / novelty wording preserved

`formalization.yaml` explicitly treats formalisation and Palomar verification as verification/provenance facts, not novelty evidence. It preserves:

- Wu's exact selected-binomial-GCD family as prior art;
- McTague's `p ≡ 1 (mod m)` Target-A subcase;
- McTague's known `(p,m,N)=(2,3,6)` example and resulting `T_2(3)=6`;
- Kummer's theorem as classical proof infrastructure;
- the Chung–Yang 2026 residual caveat, because its full theorem text was not openly inspectable during the Stage-4 audit.

No claim of uniqueness, historical priority, or novelty is inferred from Lean verification or Palomar preflight.

## Registration attempt and exact blocker

After the full predictive preflight passed, the current Palomar agent protocol at `https://submit.palomar-registry.org/llms.txt` was checked. Ordinary agent intake requires, in one sitting:

1. `POST /api/submit` with the immutable repository/commit/config and authorization relationship;
2. creation of `refs/tags/palomar-verify-CHALLENGE` at that commit;
3. creation of a **secret** GitHub gist whose `palomar.txt` contains the exact challenge;
4. `POST /api/verify` with the pending secret and gist id;
5. deletion of both temporary artifacts.

The user explicitly confirmed the four intake values:

- repository: `jfairfaxball-348/Pascal-Extremes`
- commit: `3f234e061d44fcd2ececab1280788e7a39c90822`
- Comparator configuration: `comparator.json`
- authorization relationship: `I am a responsible author or maintainer` / API value `maintainer`

This session could not perform steps 1–5 because:

- the available authenticated GitHub connector exposes no tag-creation/deletion operation;
- it exposes no secret-gist creation/deletion operation;
- the shell has no `gh` executable/authenticated GitHub session;
- the web-search tool cannot make authenticated state-changing Palomar/GitHub API calls.

Palomar explicitly says not to substitute a weaker proof such as a commit status or declared login. Accordingly, no intake was fabricated. A registry search found no existing Pascal Extremes entry, and no Palomar submission ID, access token, registry ID, version, or entry URL is recorded.

## Next Stage-6 action

Use an authenticated `gh` environment with repository-write and gist capability, re-read the live agent protocol, and perform the exact five-step/six-call proof against the immutable candidate `3f234e061d44fcd2ececab1280788e7a39c90822`. Do not change that commit unless the contract changes and requires a new package.

After mechanical verification and editorial review, fetch the private review with the submission access token. Palomar's protocol requires showing that review to the user and obtaining a fresh explicit decision before `POST /register`, because registration publishes the review and creates the permanent registry record.

Do not begin Stage 7 until a real registry response supplies the Palomar ID and version.
