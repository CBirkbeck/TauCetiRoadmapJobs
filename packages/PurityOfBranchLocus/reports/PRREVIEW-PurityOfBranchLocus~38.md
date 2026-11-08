# Review of PurityOfBranchLocus (pull request #1808 at c9403e2)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since a3b1e14. `TauCetiRoadmap/PurityOfBranchLocus/README.md`, `Suggested.lean` and `metadata.toml` are byte-identical to the files the previous review read (md5 `b15ec1a8…`, `88030381…`, `6a3b076b…`). `git diff --stat a3b1e14 HEAD -- TauCetiRoadmap/PurityOfBranchLocus` is empty, and the folder's last commit is still fd065fbe. `lake-manifest.json` and `lean-toolchain` are unchanged. Since a3b1e14 the branch changed only `TauCetiRoadmap/CharacteristicClasses/{README.md,Suggested.lean}`, `TauCetiRoadmap/ClassifyingSpaces/README.md` and `TauCetiRoadmap/ComplexKahlerGeometry/{README.md,Suggested.lean}`. These folders belong to the pull request and are reviewed separately. None of the five diffs mentions purity, the branch or ramification locus, or 0BMB (`git diff a3b1e14 HEAD | grep -i` for those terms returns nothing). The single finding is the previous report's R01, still unrepaired. It concerns the pull request's branch, not this folder's text.

## R01 (P3) — gate: two files outside the pull request's named roadmap folders

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 (commit e591d103) and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (commit 61e5385e). The worker's gate at c9403e2 reports `outside-folder=2` with verdict `FAIL`.
- **Claim.** The brief names fifteen folders as the pull request's own. An edit outside them is a finding, and no acceptance is possible while the gate fails.
- **Witness.** `git diff --stat origin/main...HEAD` (main at 7bf4638) excluding the fifteen folders: exactly these two files, one changed line each. Both lines reword "supplies" as "consumes", and neither line exists on main. `git log origin/main..HEAD` on the two files lists the two commits above.
- **Repair.** Either drop the two one-line commits from the branch, or list `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` in the pull request as its own folders. The finding is unchanged since the previous six reports (their R01).

## Previous findings

- R01 — not repaired: at c9403e2 the two files are still in the diff against `origin/main`, with commits e591d103 and 61e5385e on the branch. The worker's gate still reports `outside-folder=2 … FAIL` (see R01 above).

## Verified sound

**Gate.** The worker's gate at c9403e2:

`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`

I re-ran the gate by hand with `--base origin/main` and got the same scanner values, except `outside-folder=26`. The hand run does not know the pull request's other fourteen named folders, so it counts their 24 files as well; the remaining two are the files of R01. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and nothing else.

**Dependency check at this head:**

```text
depcheck: 238 roadmaps, 2345 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. PurityOfBranchLocus is a roadmap on main and is not listed in the merge order; the check places it after its suppliers without complaint.

**Elaboration.** I ran `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` at the pins at this head. It exits 0 with 16 `declaration uses 'sorry'` warnings, one for each of the 16 theorems (lines 48, 57, 89, 97, 102, 107, 114, 122, 141, 158, 173, 194, 211, 220, 232, 247), and nothing else. The following earlier checks still hold because the file is byte-identical:

- the worker's `signatures.md`: 19 elaborated types, no lost binder;
- the binder-by-binder comparison with the README;
- the one-tactic padding probe, where no declaration closes in one tactic.

I re-read the headline `exists_etale_of_formallyUnramified_stalk_codimOne` (lines 141–150) against the five hypotheses of 0BMB (stacks-0BMB lines 2524–2533). Each hypothesis has its binder:

- (1) normal source stalk: `IsDomain` + `IsIntegrallyClosed`;
- (2) regular target stalk: `IsRegularLocalRing`;
- (3) quasi-finite at `x`: `hqf`;
- (4) equal dimensions `≥ 1`: `hdim` + `hpos`;
- (5) unramified at the generizations `x' ⤳ x` with one-dimensional stalk: `hunr`.

The conclusion is an open `U ∋ x` with `U.ι ≫ f` étale. This matches the source.

**Sources.** I re-opened these locators in the cache at this head. Each is at the line the earlier reports cite.

- `stacks-0BMB` line 2524: Lemma 21.4, purity of the branch locus, hypotheses (1)–(5) at lines 2528–2532.
- `stacks-0BMA` line 2503: Lemma 21.3, regular local ring of dimension `≥ 2`.
- `stacks-025P` line 976: Proposition 19.7.
- `stacks-02G4` line 3333: Definition 36.1, unramified at a point.
- `stacks-02GI` line 3528: Definition 37.1, étale at a point.
- `stacks-02LK` line 5984: Lemma 41.1, locally of finite type, `x` isolated in its fibre.
- `sga1` line 8359: X 3.1, Zariski–Nagata purity for a quasi-finite dominant morphism of integral schemes, `X` normal, `Y` regular locally Noetherian.

The seeded sample covers §§0.1, 0.2, 0.3, 1.1, 2.1, 2.2 and 2.3, at README lines 111, 129, 159, 225, 242, 280 and 303. Those sections are unchanged text, so the earlier reports' locator-by-locator verification of every sampled source carries over. That verification covers 0BMB, 0BMA, 02G4, 02GI, 025P, 039S, 02LK, 00OF, 0AFS, 0ECD, sga1 X 3.1, and the remaining Stacks tags and sga1 lines 987–991.

**Cross-roadmap citations resolved at this head.** None of these files changed since a3b1e14.

- LocalPurity (a folder of the pull request's own):
  - Lines 20, 39 and 98 name PurityOfBranchLocus as the consumer of §2.1.
  - `Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, cited at this README's line 57, is stated at LocalPurity README lines 43, 265 and 359 and declared at its `Suggested.lean` line 115.
- SchemeAndStackFoundations (same pull request): lines 5915 and 7695 still name PurityOfBranchLocus as a consumer of 0AFS and of the regular-local-ring package of §4.13.

The worker's citation scan found 12 names nowhere:

- Seven are this roadmap's own declarations, each declared in `Suggested.lean`: `ramificationLocus_eq_stacks` line 89, `exists_etale_of_formallyUnramified_stalk_codimOne` 141, `etaleAt_of_unramifiedAt_codimOne` 158, `isEtaleAt_of_purity` 173, `etale_of_etaleAt_codimOne` 194, `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` 232, `ringKrullDim_stalk_eq_one_of_maximal_branchLocus` 247.
- One is the LocalPurity target above.
- Four are the `Pcf.*` names of the provenance table, README 415–416. Earlier reports resolved them at commit `d28f90d` of the cited repository, and the table is unchanged.

The scan found no cross-roadmap citation unresolved.

**Overlaps and ownership.** The overlap scan (main 7bf4638) lists:

- no id this README cites that an open pull request drops;
- no id that only an open revision defines;
- no id this pull request drops that others cite.

#1807 and #1854 (same author) conflict with this pull request only in other folders (AlgebraicCurves, AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, RigidAnalyticGeometry), not in this one. The pull request's merge-order paragraph places #1807 before it.

The closest roadmaps in vocabulary each own something different, and none states the branch, ramification or non-étale locus of a morphism of schemes:

- LocalPurity (0.28) owns local purity for finite étale covers.
- SchemeAndStackFoundations (0.11) owns the regular-local-ring package.
- PurityForFlatCohomology (0.11) owns purity for flat cohomology.

There are no declared gaps: no readable `design/plan.json`, and no `gap:` contract in the README.

**Library declarations.** The pins and the file are unchanged, so the previous report's list of 21 opened declarations stands (Mathlib `RingTheory/Etale/Locus.lean`, `RingTheory/Unramified/Locus.lean`, `RingTheory/QuasiFinite/Basic.lean`, `AlgebraicGeometry/Morphisms/QuasiFinite.lean`, …; Tau Ceti `RingTheory/RegularLocalRing/{Basic,Flat}.lean`). The clean elaboration at this head confirms that every name the file uses still resolves at the pins.

**Adversarial table.** Every statement is untouched since 0439c6d. Every row carries forward the values of the previous report (PRREVIEW-PurityOfBranchLocus~30, *Adversarial table*, itself carrying ~25's, ~19's, ~15's, ~12's and ~10's rows). The diff adds no statement, so there is no new row. Notation: `k` is a field; "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`; "square map" is `(x,y) ↦ (x², y)` on `𝔸²` in characteristic `≠ 2`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.3 Check 1 (closed immersion `Spec k → 𝔸¹_k` at `0`) | the one point `x` of `Spec k`; its image | ramification locus `∅` (`Ω = 0`); non-étale locus `{x}` (`k` has `t`-torsion over `k[t]_(t)`, not flat); branch locus `f '' ∅ = ∅`; `f '' {x} = {0}` | the wrong model `branchLocus = f '' nonEtaleLocus` gives `{0} ≠ ∅` and is excluded (~30) | none |
| §0.3 Check 2 (Frobenius) | `Ω_{k[t]/k[tᵖ]}`; freeness; lying over | `Ω = k[t]dt ≠ 0` at every prime: ramification locus `𝔸¹`; free of rank `p`: non-étale locus `𝔸¹`; integral: branch locus `𝔸¹`; `hne` of §2.3 fails | correct negative control for `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus` (~30) | none |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` against the Frobenius | finite, dominant, `X` normal, `Y` regular | both loci `= 𝔸¹` | theorem and Check agree (~30) | none |
| Provenance rows 2.1 and 0.3/2.3 | the six qualified names at commit `d28f90d` | three `Pcf.Stacks.*` purity names; `Pcf.nonEtaleLocus := (Algebra.etaleLocus R S)ᶜ`, `Pcf.isClosed_nonEtaleLocus`, `Pcf.codim_eq_one_of_algebra` | correct (~30) | none |
| `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | immersion, `L = K(t^{1/p})`, `𝔸¹ → Spec k` | iff holds both ways in each (~30) | sound | none |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | Frobenius, square map, immersion | `𝔸¹/𝔸¹/𝔸¹`; `V(x)/V(x)/V(u)`; `∅/{0}/∅` (~30) | sound | none |
| `ramificationLocus_eq_stacks`, `isClosed_ramificationLocus`, `isClosed_branchLocus`, the three `_spec` comparisons | pointwise; `Spec K[x₁, x₂, …]`; open immersion; standard étale and `R[x]`; `comap '' V(x)` | pointwise agreement; closed anyway; `∅`; `Ω_{S_𝔮/R_𝔭} = Ω_{S_𝔮/R}`; `V(u)` (~30) | sound | none |
| §0.1–0.2 README-only targets and Convention 5 | DVR `B = C_𝔮` over `k[t]_(t)`; `k → k[t]_(t)`; the cusp with its étale cover; `A → A/(x,y)`; completion | `1 = 1`; `0 ≠ 1`, not étale; both non-regular; not flat, so 00OF's flatness stays; completion excluded (~30) | sound | none |
| §1.1 *exists_elementaryEtale_finite_of_isolated* (02LK), *etale_of_etale_comp_surjective* (036W) | `t ↦ t²` at the origin; `k[x,y]/(xy) → 𝔸¹`; `g = id` with a Zariski cover | `U = S`, `V = X`; not quasi-finite at the origin; holds (~30) | sound | none |
| `exists_etale_of_formallyUnramified_stalk_codimOne`, `etaleAt_of_unramifiedAt_codimOne`, `isEtaleAt_of_purity` (0BMB) | `d = 1` DVRs; constant map; quotient; square map and Frobenius; affine `𝔮 = (x,y)` vs `(x − 1, y)` | étale; fails hypothesis (3); fails (2); fails (5); the right prime (~30) | sound | none |
| `etale_of_etaleAt_codimOne` (§2.2) | purely inseparable `L/K`; square map; `id` | RHS vacuous and `hgen` false; both sides false at the generic point of `V(x)`; true (~30) | sound | none |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, `ramificationLocus_eq_nonEtaleLocus`, `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `…_branchLocus` (§2.3) | square map; cusp; generic point of `V(x)`; generic point `w` of `V(u)`; quotient | `2 = 2`; `1 = 1` without normality of `X`; `d = 1`; `dim 𝒪_{Y,w} = 1`; excluded by regularity of `Y` (~30) | sound | none |

## Not verifiable

- none. The provenance repository was read at commit `d28f90d` by the earlier reviews, and the table is unchanged. Nagata 1959 and Zariski 1958 are cited only as the origin of the theorem, with no claim that carries a locator.

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212 (line 8367): the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
