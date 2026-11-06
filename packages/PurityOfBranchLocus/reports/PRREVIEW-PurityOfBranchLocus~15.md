# Review of PurityOfBranchLocus (pull request #1808 at 1b0434e)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0439c6d: `TauCetiRoadmap/PurityOfBranchLocus/README.md` and `Suggested.lean` are byte-identical to the files the previous review read (md5 `b15ec1a8…` and `88030381…`; `git diff --stat 0439c6d...HEAD -- TauCetiRoadmap/PurityOfBranchLocus` is empty), and the branch changed only `TauCetiRoadmap/AlgebraicCurves/` since then, a folder of the pull request's own with its own review. The pins are the ones the previous review used (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). The single finding is the previous report's R01, unrepaired; it concerns the pull request's branch, not this folder's text.

## R01 (P3) — gate: two files outside the pull request's named roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 (commit e591d103) and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (commit 61e5385e); the worker's gate at 1b0434e: `outside-folder=2`, verdict `FAIL`.
- **Claim.** The brief names fifteen folders as the pull request's own; an edit outside them is a finding, and there is no acceptance while the gate fails.
- **Witness.** `git diff --stat origin/main...HEAD` excluding the fifteen folders at 1b0434e: exactly these two files, one changed line each ("supplies" reworded to "consumes"). `git log origin/main..HEAD` on the two files: the two commits above, still on the branch. Every other gate scanner is 0, `build=0`, `depcheck=0`.
- **Repair.** List the two folders in the pull request as its own, or drop the two one-line commits from the branch. Unchanged since the previous two reports (their R01).

## Previous findings

- R01 — not repaired: the two files outside the named folders are still in the diff against `origin/main` at 1b0434e, and the worker's gate reports `outside-folder=2 … FAIL` (R01 above).

## Verified sound

**Gate.** The worker's gate at 1b0434e: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`. My dependency check at this head:

```text
depcheck: 242 roadmaps, 2365 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The twelve names the worker's citation scan found nowhere are, as before, six of this roadmap's own `Suggested.lean` declarations (each declared in the file: `exists_etale_of_formallyUnramified_stalk_codimOne` line 37 of the README, `etale_of_etaleAt_codimOne` 38, `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` 39, `ramificationLocus_eq_stacks` 187, `etaleAt_of_unramifiedAt_codimOne` 250, `isEtaleAt_of_purity` 254, `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` 342), the LocalPurity target `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (README 57; resolved below) and the four `Pcf.*` names of the provenance table (README 415–416; resolved by the previous report at commit `d28f90d` of the cited repository, the table unchanged).

**Elaboration.** `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` at the pins: exit 0, 16 `declaration uses 'sorry'` warnings (the 16 theorems), nothing else. The file is byte-identical to the one the previous two reviews read, so the worker's `signatures.md` (19 elaborated types, no lost binder) and the previous report's binder-by-binder comparison with the README stand; so does its one-tactic padding probe at these pins (16 errors, no close).

**Sources (the seeded sample's locators re-opened in the cache at this head).** `stacks-02G4` Morphisms line 3333 (Definition 36.1, unramified at a point) and lines 3345–3347 (the unramified points form an open set), `stacks-02GI` line 3528 (Definition 37.1, étale at a point), `stacks-01WM` line 4879 (Lemma 45.7), `stacks-0BJH` Fundamental Groups line 2479 (Lemma 21.2), `stacks-0BMA` line 2503 (Lemma 21.3, regular local ring of dimension `≥ 2`), `stacks-0BMB` line 2524 (Lemma 21.4, purity of branch locus, attributed to Nagata and SGA 1), `stacks-0EA4` line 3019 (Lemma 28.3, purity of ramification locus), `stacks-0ECD` line 3119 (Theorem 29.3), `stacks-0BJF` Discriminants line 269 (Lemma 3.1), `sga1` lines 8359–8362 (X 3.1: quasi-finite dominant, `X` normal, `Y` regular locally Noetherian, `Z` the non-étale set, `Z ≠ X` ⇒ codimension one). Each is at the line the previous reports cite and supports the sentence that cites it; the sampled sections' text is unchanged, so the previous reports' hypothesis-by-hypothesis comparison carries.

**Cross-roadmap citations resolved at this head.** LocalPurity on main (`ffac5139`, its README unchanged since #1102): §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` at lines 41, 262 and 356, and PurityOfBranchLocus named as its consumer at line 20. LocalPurity at the pull request's head (a folder of the pull request's own): lines 20, 39 and 98 name PurityOfBranchLocus as the consumer of §2.1, and its revised dependency paragraph (lines 36–39) states the order SchemeAndStackFoundations §4.13 → LocalPurity §2.1 → PurityOfBranchLocus §2.1, which is the order this README's lines 12–20 and 56–65 state (0AFS owned by SchemeAndStackFoundations §4.13, consumed here in §0.2 and §2.1); the stale arrow "PurityOfBranchLocus §0.3 (0AFS) → Layer 2 §2.1" that LocalPurity's diagram carries on main (line 33) is gone at the pull request's head. SchemeAndStackFoundations at the pull request's head: §0.17 heading at line 1275, §4.13 heading at line 5836. Notes outside this folder, unchanged from the previous report: SchemeAndStackFoundations lines 5915 and 7695 say "PurityOfBranchLocus §§0.3 and 2.1 consume" 0AFS and the regular-local-ring package, where the consumers are §§0.2 and 2.1 after this folder's renumbering (that folder has its own review in this pull request); AbhyankarLemma on main (lines 31, 80, 363, 375) cites "PurityOfBranchLocus §0.3 (0AFS)", now the loci section, the owner being SchemeAndStackFoundations §4.13 (outside this pull request).

**Ownership against open work.** Unchanged since the previous report (the folder adds no object): the three loci, étale localization of a quasi-finite morphism and 0BMB are stated by no other roadmap on main or at the open heads of the index of 2026-11-06. Declared gaps: none (no readable `design/plan.json`, no `gap:` contract in the README).

**Adversarial table.** Every statement is untouched since 0439c6d, so every row carries forward the values of the previous report (PRREVIEW-PurityOfBranchLocus~12, *Adversarial table*, itself carrying ~10's rows). `k` is a field; "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`; "square map" is `(x,y) ↦ (x², y)` on `𝔸²` in characteristic `≠ 2`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.3 Check 1 (closed immersion `Spec k → 𝔸¹_k` at `0`) | the one point `x` of `Spec k`; its image | ramification locus `∅` (`Ω = 0`); non-étale locus `{x}` (`k` has `t`-torsion over `k[t]_(t)`, not flat); branch locus `f '' ∅ = ∅`; `f '' {x} = {0}` | the wrong model `branchLocus = f '' nonEtaleLocus` gives `{0} ≠ ∅` and is excluded (~12) | none |
| §0.3 Check 2 (Frobenius) | `Ω_{k[t]/k[tᵖ]}`; freeness; lying over | `Ω = k[t]dt/(p tᵖ⁻¹ dt) = k[t]dt ≠ 0` at every prime: ramification locus `𝔸¹`; free of rank `p`, so étale ⇔ unramified: non-étale locus `𝔸¹`; integral, so branch locus `𝔸¹`; `hne` of §2.3 fails | correct negative control for `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` (`Suggested.lean` line 236) (~12) | none |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` against the Frobenius | finite, dominant, `X` normal, `Y` regular | both loci `= 𝔸¹` | theorem and Check agree (~12) | none |
| Provenance rows 2.1 and 0.3/2.3 | the six qualified names at commit `d28f90d` | `Pcf.Stacks.zariskiNagataPurity`, `…isStacksEtaleAt_of_zariskiNagataPurity`, `…exists_etale_of_zariskiNagataPurity` in `library/Pcf/Stacks/Purity/`; `Pcf.nonEtaleLocus := (Algebra.etaleLocus R S)ᶜ`, `Pcf.isClosed_nonEtaleLocus [FinitePresentation R S]`, `Pcf.codim_eq_one_of_algebra` with `hloc` the local form of 0BMB | correct (~12) | none |
| `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | immersion, `L = K(t^{1/p})`, `𝔸¹ → Spec k` | iff holds both ways in each (~10 rows 1–2) | sound | none |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | Frobenius, square map, immersion | `𝔸¹/𝔸¹/𝔸¹`; `V(x)/V(x)/V(u)`; `∅/{0}/∅` (~10 rows 3–4) | sound | none |
| `ramificationLocus_eq_stacks`, `isClosed_ramificationLocus`, `isClosed_branchLocus`, the three `_spec` comparisons | pointwise; `Spec K[x₁, x₂, …]`; open immersion; standard étale and `R[x]`; `comap '' V(x)` | pointwise agreement; closed anyway; `∅`; `Ω_{S_𝔮/R_𝔭} = Ω_{S_𝔮/R}`; `V(u)` (~10 rows 5–10) | sound | none |
| §0.1–0.2 README-only targets and Convention 5 | DVR `B = C_𝔮` over `k[t]_(t)`; `k → k[t]_(t)`; the cusp with its étale cover; `A → A/(x,y)`; completion | `1 = 1`; `0 ≠ 1`, not étale; both non-regular; not flat, so 00OF's flatness stays; completion excluded (~10 rows 11–15) | sound | none |
| §1.1 *exists_elementaryEtale_finite_of_isolated* (02LK), *etale_of_etale_comp_surjective* (036W) | `t ↦ t²` at the origin; `k[x,y]/(xy) → 𝔸¹`; `g = id` with a Zariski cover | `U = S`, `V = X`; not quasi-finite at the origin; holds (~10 rows 17–18) | sound | none |
| `exists_etale_of_formallyUnramified_stalk_codimOne`, `etaleAt_of_unramifiedAt_codimOne`, `isEtaleAt_of_purity` (0BMB) | `d = 1` DVRs; constant map; quotient; square map and Frobenius; affine `𝔮 = (x,y)` vs `(x − 1, y)` | étale; fails hypothesis (3); fails (2); fails (5); the right prime (~10 rows 19–21) | sound | none |
| `etale_of_etaleAt_codimOne` (§2.2) | purely inseparable `L/K`; square map; `id` | RHS vacuous and `hgen` false; both sides false at the generic point of `V(x)`; true (~10 row 22) | sound | none |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, `ramificationLocus_eq_nonEtaleLocus`, `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `…_branchLocus` (§2.3) | square map; cusp; generic point of `V(x)`; generic point `w` of `V(u)`; quotient | `2 = 2`; `1 = 1` without normality of `X`; `d = 1`; `dim 𝒪_{Y,w} = 1`; excluded by regularity of `Y` (~10 rows 23–26) | sound | none |

## Not verifiable

- none. (The provenance repository was read at commit `d28f90d` by the previous review and the table is unchanged; Nagata 1959 and Zariski 1958 are cited only as the origin of the theorem with no locator-bearing claim.)

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212: the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
