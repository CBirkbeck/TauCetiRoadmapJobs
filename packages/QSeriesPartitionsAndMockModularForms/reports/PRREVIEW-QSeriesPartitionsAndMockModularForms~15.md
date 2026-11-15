# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 5fdb342)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in the folder since 5fdb342. The folder's files are settled; this round read the pull request's title and description against the head. Three sentences of the description are contradicted by the head. All three repairs are edits of the description only; no file in the folder changes.

## R01 (P3) — the description extends rank equidistribution to modulus 11

**Location:** pull request description, summary block: "On native partitions it proves the Rogers–Ramanujan identities and counting theorems, rank and crank equidistribution modulo 5, 7 and 11, and the prime-power congruences."

**Claim:** The head proves rank equidistribution only modulo 5 and 7 (`rank_equidistribution_five_seven`); only the crank is equidistributed modulo 11 (`crank_equidistribution_five_seven_eleven`).

**Witness:** `README.md` line 660: "At size 6 there are two partitions of rank 1; rank is not equidistributed modulo 11." Computed: rank classes of size 6 modulo 11 are 1,2,1,1,0,1,1,0,1,1,2.

**Repair:** Replace the clause by "rank equidistribution modulo 5 and 7, crank equidistribution modulo 5, 7 and 11,".

## R02 (P3) — "over arbitrary commutative rings" covers objects the head states over ℂ

**Location:** pull request description, summary block: "Over arbitrary commutative rings, the roadmap develops integer-indexed and formal q-Pochhammer products, basic hypergeometric series, the q-binomial, Euler and Ramanujan ₁ψ₁ summations, and Bailey pairs."

**Claim:** At the head the basic hypergeometric series and the three summations are complex-analytic; only the products, the formal binomial and Euler identities and Bailey pairs are over commutative rings.

**Witness:** `README.md` line 247 (§2.1): "For finite complex lists A,B"; line 333 (§2.5): "If 0<|q|<1, a≠0, |b/a|<|z|<1"; `Suggested.lean` `qBinomial`, `euler_qExponential`, `ramanujanOnePsiOne_hasSum` quantify over `ℂ`; `baileyPair` over `[CommRing K]`.

**Repair:** Replace the sentence by: "Over arbitrary commutative rings, the roadmap develops integer-indexed and formal q-Pochhammer products, the formal q-binomial and Euler identities, and Bailey pairs; over ℂ, on their domains of convergence, it develops basic hypergeometric series and the q-binomial, Euler and Ramanujan ₁ψ₁ summations."

## R03 (P3) — "everything else is on main or is a consumer" omits two open roadmaps and the three extension contracts

**Location:** pull request description, dependencies paragraph: "Everything else the README names is on main or is a consumer."

**Claim:** The README also names two open roadmaps that are neither, and three supplier contracts that no roadmap states yet; the description mentions none of them.

**Witness:** `README.md` line 15: "AutomorphicFormsOnReductiveGroups §4.5 retains …" (open, #1037); line 1770: "QWittVectors remains an independent algebraic producer" (open, #1351); lines 95, 103, 123: `gap:classical-metaplectic-model`, `gap:vector-bundle-dolbeault`, `gap:analytic-elliptic-regularity`.

**Repair:** Replace the sentence by: "AutomorphicFormsOnReductiveGroups (#1037) and QWittVectors (#1351) are open and named only to mark ownership boundaries. Three supplier contracts are extensions that no roadmap states yet, proposed as Part II of their owners: the classical square-root model of the metaplectic cover (MetaplecticAutomorphicForms §§2.4b–2.6), analytic elliptic regularity (PDE Layer 5) and vector-bundle Serre vanishing on compact Riemann surfaces (ModularForms Layer 10B). Everything else the README names is on main or is a consumer."

## Previous findings

- The previous report (of 5fdb342) accepted with no finding; there is none to account for.

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `rank_equidistribution_five_seven` (cited by the summary; R01) | sizes 4, 9, 14 mod 5; 5, 12, 19 mod 7 | every class 1, 6, 27; every class 1, 11, 70 | Keep |
| Rank modulo 11 (the reading R01 refutes) | sizes 6, 17, 28 | classes 1,2,1,1,0,1,1,0,1,1,2; 29,29,28,26,26,25,25,26,26,28,29; 344,344,340,338,333,332,332,333,338,340,344: unequal | Description wrong |
| `crank_equidistribution_five_seven_eleven` (R01) | sizes 4, 9, 14 mod 5; 5, 12, 19 mod 7; 6, 17, 28 mod 11 | every class 1, 6, 27; 1, 11, 70; 1, 27, 338 | Keep |
| Carriers of the Layer 2 headlines (R02) | elaborated types | `qBinomial`, `qBinomial_largeBase`, `euler_qExponential`, `ramanujanOnePsiOne_hasSum`: `ℂ` with `‖q‖ < 1` or `1 < ‖q‖`; `baileyLemma_transform`: `{K} [CommRing K]` | Description wrong |
| Location of every roadmap the README names (R03) | 21 names against main and the open list | on main 9 (two under `Completed/`); open suppliers 5; open consumers 5, with HalfIntegralWeightModularForms; open, neither 2 | Description wrong |

The rows for the other statements stand as in the previous review, of 5fdb342: the folder is unchanged.

- Description sentences confirmed at the head: the five open suppliers (#1172, #925, #851, #1314, #1063) are open and earlier in the merge order (lines 116, 98, 55, 47, 153; this roadmap 252); ModularForms §0.2 "The eta transformation and eta quotients" and the normalized Fricke operator are on main; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; the four consumers of the summary are those of "Downstream consumers"; the Schur recurrence (§3.2), the genus-one basis at 11 (§4.8a) and the cone models (Layer 7) are as the summary says. The title is right: the pull request adds the roadmap (0 headings and 0 declarations removed).
- Gate, run for this review at 5fdb342: every counter 0, `OK`; the worker's run adds `build=0`.
- `gate --depcheck … --movable --pr 1391`: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean`: 19 `declaration uses sorry` warnings, nothing else.
- Outside-folder diff against origin/main: empty. `overlaps.md`: no other pull request changes this roadmap, no cited id dropped, no id defined only by an open revision, no second copy (main at 2248bbb has no such folder).
- Seeded sample: none of the fifteen targets lies in a changed passage (the folder diff is empty); no source locator was re-read this round.
- Remark on untouched text, no change asked: HabiroCohomologyFoundations (`README.md` line 1770) is named as a consumer although its README at its open head does not cite this roadmap.
- Overlap check: not redone, the folder being unchanged since the review of 5fdb342; `overlaps.md` reports nothing shared.
- Source independence: changed passages only; 0 passages changed, none compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "after 3 independent review rounds and 2 red-team rounds on the job board": the job board's history was not read.
- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified and cited by locator only, as in the previous reports.

## Source issues

- none

## For the human reviewers

- none
