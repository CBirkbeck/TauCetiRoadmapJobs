# Review of SchemeAndStackFoundations (pull request #1276 at 618343f)

**Verdict:** needs changes

This is an incremental re-review of the 110 lines changed since 90139a9. In `README.md` they are:

- the scope paragraph (`:87–93`);
- the Mathlib and Tau Ceti contracts (`:423`, `:464–475`) and the AlgebraicVectorBundles contract (`:515–516`);
- §2.6 (`:3490–3493`);
- the Layer 3 conventions (`:4678–4681`);
- §3.2's *Needs:* (`:4750–4759`);
- §3.3 (`:4792–4882`);
- §4.9 (`:5611–5613`).

In `Suggested.lean` the head imports `TauCeti.AlgebraicGeometry.VectorBundle.FixedRank`, deletes `Curve.isFiniteLocallyFreeOfRank` and `Curve.vectorBundleDegree`, and restates `Curve.vectorBundleDegree_pullback` (`:697`). No file outside the folder changed.

The changed passages contain no new defect. Both r70 findings are carried:

- R01 (P2) is partly repaired. It is re-raised against the repair report's H01, and it is the only blocking finding.
- R02 (P3) is not repaired. It is re-raised against H02.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where the README's new citations and 19 Tau Ceti carriers do not exist

Re-raised: H01. The repair report gives the remaining step to the worker: "The merge rewrites `lake-manifest.json` and `lean-toolchain`, which a folder repair may not touch". That is the right owner for the step, but it does not settle the defect. The branch still builds against `358314d4`, and the README cites declarations that do not exist there. No further edit to the two files is requested before the merge.

**What this head repairs.**

- `README.md:423` and `:464` now read "**From Mathlib** (`1b1ccf4b`)" and "**From Tau Ceti** (`2fd255d9`)". The false clause "the pin in `lake-manifest.json`" is gone.
- `Suggested.lean` no longer defines its own rank predicate or degree. `Curve.vectorBundleDegree_pullback` (`:697`) now takes `E : FiniteLocallyFreeSheaf.FixedRank Y r` and `FixedRank.pullback`, which open at the same lines at both pins (`VectorBundle/FixedRank.lean:52`, `:71`, `:106`).

**What remains.**

- **Location.** `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`.
  - `Suggested.lean` still declares 19 definitions that Tau Ceti builds at `2fd255d9`: `:76, 83, 127, 134, 156, 163, 169, 174, 269, 277, 282, 289, 555, 757, 762, 926, 1111, 1123, 1137`. It also states theorems on them, such as `Ring.IsJapanese.of_complete_local` (`:138`).
  - This head adds six citations that resolve only at `2fd255d9`:
    - §3.3 `:4795–4799`: `Degree.lean:82`, `:102`, `:116`, `:132`;
    - §3.2 `:4755`: `FlatBaseChange.lean:173`;
    - §3.2 `:4758`: `Descent/MorphismProperty.lean:165`.
- **Claim.** The README is written against Tau Ceti `2fd255d9`, but the branch builds against `358314d4`. At the pin, eight of the README's file:line citations and the 19 Tau Ceti counterparts of the restated definitions do not exist.
- **Witness.**
  - At `358314d4`, these files are absent: `VectorBundle/Degree.lean`, `Cohomology/FlatBaseChange.lean`, `Descent/MorphismProperty.lean`, `RingTheory/Japanese.lean`, `AlgebraicSpace/Basic.lean`, `Chow/Basic.lean`, `Scheme/Regular/Scheme.lean`.
  - At `2fd255d9`, each opens at the cited line.
  - `git merge-tree --write-tree HEAD origin/main` exits 0.

**Repair.**

1. The worker merges `origin/main`. The merge has no conflicts.
2. A folder repair then makes three changes:
   - swap the 19 definitions for Tau Ceti's: `RingTheory/Japanese.lean:125`, `Nagata.lean:65`, `RegularLocalRing/{GeometricallyRegular:70, RegularAlgebraMap:54, Locus:61, GRing:57}`, `AlgebraicSpace/Basic.lean:68, 74, 113, 195`, `Limits/Replete.lean:91`, `Morphisms/Thickening.lean:69, 147`, `Scheme/Regular/Scheme.lean:68`, `Chow/Basic.lean:86, 257, 295` and `TauCeti.Huber.IsPseudoCoherentOver` (`Algebra/Module/PseudoCoherent/Basic.lean:89`);
   - write `Curve.vectorBundleDegree_pullback`'s conclusion as `FixedRank.vectorBundleDegree k ((FixedRank.pullback f).obj E) = [K(X):K(Y)] * FixedRank.vectorBundleDegree k E`;
   - change the *Lean:* lines of §0.5, §0.20, §0.21, §1.3, §2.17, §3.3, §4.1, §4.13 and §5.1 to match.

**Tested.**

- The body of `Degree.lean:82` at `2fd255d9` is `eulerCharBelow k X E.obj.obj 2 − r * eulerCharBelow k X (InvertibleSheaf.trivial X).obj 2`. These are the two sides of `Suggested.lean:706–711`, so the restatement after the merge does not change the theorem's meaning.
- Pull-request CI (`build`) passes at 618343f, and the pull request is `MERGEABLE`.

## R02 (P3) — The pull-request description describes a §4.10A this head lacks, and states no order with the four conflicting heads

Re-raised: H02. The repair report answers that the description is pull-request text, which the author rewrites. That is the right owner for the edit, but the defect is unchanged.

- **Location.** The pull-request description.
- **Witness.**
  - The description still says "New section 4.10A constructs that scheme …" and "This README-only addition changes no Lean declarations".
  - `grep -c '4\.10A' README.md` returns 0.
  - This round alone changes `Suggested.lean` by 29 lines.
  - `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting with this head.
- **Repair.** Rewrite the description to say what the branch does against main:
  - the README that cites the Layer 0–5 declarations Tau Ceti builds;
  - `Suggested.lean` reduced to headline theorems;
  - henselization, the curve degree bounds and the vector-bundle degree moved to Tau Ceti citations.

  Add one line per conflicting pull request saying which side rebases. H02's proposed order is one option: #1854 first; this branch merges main and rebases onto #1854; #1807 and #1808 rebase onto this branch; and one of this branch and #1656 is rebased onto the other or closed. No file change is needed.
- **Tested.** A description that names the four pull requests with an order, and mentions no §4.10A, matches this head.

## Previous findings

- R01 — partly repaired: `README.md:464` reads "**From Tau Ceti** (`2fd255d9`)"; `lake-manifest.json` still pins `358314d4`; `Suggested.lean:127` `def Ring.IsJapanese`, `:289` `def IsAlgebraicSpace`, `:1137` `def ChowGroup` remain; `Curve.vectorBundleDegree` is gone.
- R02 — not repaired: the description still opens "The existing coherent-module existence theorem … New section 4.10A …" and names no order with #1656, #1807, #1808 or #1854.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.**
  - The worker's gate at 618343f reports every counter 0, including `build=0`, and `OK`.
  - My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 (`dropped=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `readme-ids-missing=0`, …) and `OK`, exit 0.
- **Dependency check.** The output of `gate --depcheck … --movable`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
  ```

  It exited 0 and printed no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` at the branch pins exited 0 in 56 s, with 44 "declaration uses `sorry`" warnings and no other diagnostic.
- **Pull-request CI.** Read-only: head `618343f`, `build` SUCCESS, `MERGEABLE`.

### Signatures and the padding probe

I ran a scratch copy of `Suggested.lean` with `#check @vectorBundleDegree_pullback`, `@FixedRank.pullback` and `@isConstantRank`, and a duplicate of `vectorBundleDegree_pullback` closed by `first | rfl | simp | infer_instance`.

- The elaborated type keeps every hypothesis the README states:
  - `[IsIntegral X]`, `[IsIntegral Y]`;
  - `[IsProper]` over `k`;
  - `topologicalKrullDim = 1` for both;
  - `[IsDominant f]`, `hf`, `hφ`;
  - `{r}` and `E : FixedRank Y r`.

  It agrees with `scratch/signatures.md`, which lists 115 entries and 0 dropped binders.
- `simp` rewrites the pullback to `(Scheme.Modules.pullback f).obj E.obj.obj` (`FiniteLocallyFree.lean` `pullback_obj_obj`, `rfl` at `358314d4`) and leaves a `finrank`/`eulerCharBelow` goal. The theorem is not padding.
- The two deleted definitions had no other user in the file. `roadmaps grep` finds `Curve.vectorBundleDegree` and `Curve.isFiniteLocallyFreeOfRank` only in copies of this folder (main, #1656, #1807, #1808, #1854), and the README keeps the old → new map (`:4877–4880`).

### The changed passages

- **Scope and contracts (`:87–93`, `:470–475`, `:515–516`).**
  - `isConstantRank` (`:52`), `FixedRank` (`:71`) and `FixedRank.pullback` (`:106`) open at these lines at both pins. The two copies of `FixedRank.lean` differ only by `pullbackId`/`pullbackComp`, added after `:122` at `2fd255d9`.
  - AlgebraicVectorBundles on main (`README.md:147–149`) identifies its L0B predicate `isFiniteLocallyFreeOfRank X r` with Tau Ceti's `isConstantRank X r` read on `X.Modules`. The README's "That predicate is Tau Ceti's …" agrees with it.
- **§2.6 and §4.9 (JacobianChallenge Layer C).**
  - JacobianChallenge on main plans both statements in Layer C (`README.md:145–153`): coherence of `R^q f_*` for proper `f` over a locally Noetherian base (02O5), and finiteness of `H^q` over a Noetherian `A` (02O6).
  - Both open revisions of JacobianChallenge keep them in Layer C: #1892 (§C.1, its `README.md:688–690`) and #1187 (its `:143–148`).
  - In the cached Stacks book, 02O5 is Proposition 30.19.1 and 02O6 is Lemma 30.19.2 (proper `f`, `A` Noetherian, `F` coherent).
- **§3.2 *Needs:* (`:4750–4759`).**
  - `bijective_cohomologyBaseChange_zero` (`FlatBaseChange.lean:173`, `namespace TauCeti.AlgebraicGeometry`) needs `Module.Flat R R'`, `CompactSpace X`, `QuasiSeparatedSpace X` and `M` quasi-coherent.
  - `IsClosedImmersion.descendsAlong_surjective_inf_flat_inf_quasiCompact` (`Descent/MorphismProperty.lean:165`, `namespace AlgebraicGeometry` at `:71`) is an instance of Mathlib's `MorphismProperty.DescendsAlong` (`CategoryTheory/MorphismProperty/Descent.lean:32`).
  - In the cached Stacks book, 02L6 is Lemma 35.23.21, and 0H2V's proof (Lemma 53.22.5) cites exactly that lemma to reduce to `k̄`.
- **§3.3 (`:4792–4882`).**
  - The cited lines open at `2fd255d9`: `Degree.lean:82`, `:102` `vectorBundleDegree_congr`, `:116` `_eq_eulerDegree_toInvertible`, `:132` `_eq_relativeDegree`, `:150`, `:168`.
  - `:132` also assumes `[IsLocallyNoetherian X]`, `coheight ≤ 1` and `[FiniteDimensional k H¹(X, O_X)]`. The Layer 3 definition of a curve (`:4668–4670`) gives the first two. The conventions (`:4675–4676`) supply the third for proper `X` from 02O6. The README's one-line description is therefore accurate.
  - Stacks numbering: 0AYR is Definition 33.44.1, 0AYS Lemma 33.44.3, 0AYY Lemma 33.44.9 (effective Cartier `D`; the Weil-divisor formula follows by additivity), and 0AYZ Lemma 33.44.11 ("nonconstant morphism of proper curves", `E` locally free).
  - Tau Ceti's only other degree-pullback theorems, `InvertibleSheaf`/`LineBundleClass.eulerDegree_pullback` (`LineBundle/BaseChange.lean:54`, `:73`), are field-extension base change, not 0AYZ. The target is not a duplicate.
- **Restated definitions still in `Suggested.lean` (R01).**
  - At `2fd255d9` I opened `Japanese.lean:125` (`class IsJapanese`), `Nagata.lean:65`, `AlgebraicSpace/Basic.lean:195`, `Limits/Replete.lean:91`, `Morphisms/Thickening.lean:69`, `Chow/Basic.lean:295` and `Scheme/Regular/Scheme.lean:68`, and `RegularLocalRing/RegularAlgebraMap.lean:54`.
  - None of these files exists at `358314d4`.
- **Overlaps and ownership.**
  - `scratch/overlaps.md` reports no id dropped in either direction and no id that only an open revision defines.
  - The diff adds no owned object; it removes two definitions in favour of Tau Ceti's.
  - I checked ownership against open pull requests through `scratch/overlaps.md`, `roadmaps grep` for the removed names, and the JacobianChallenge heads above.

### Adversarial table

New rows, for the changed statements, computed this round:

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `Curve.vectorBundleDegree_pullback` on `FixedRank` | `f = 𝟙`; `z ↦ z²` on `ℙ¹`, `E = O(1)`; same `f`, `E = O(1) ⊕ O(−1)` | `deg E = 1·deg E`; `χ(O(2)) − χ(O) = 3 − 1 = 2` / `2·(2 − 1) = 2`; `(3 + (−1)) − 2·1 = 0` / `2·((2 + 0) − 2) = 0` | Pass |
| same, source not geometrically integral | `X = ℙ¹_ℂ` over `k = ℝ`, `Y = ℙ¹_ℝ`, `E = O(1)` | `χ_ℝ(O_X(1)) − χ_ℝ(O_X) = 4 − 2 = 2` / `[ℂ(t):ℝ(t)]·(2 − 1) = 2`. A `χ` taken over `ℂ` would give `1`, so `χ` over `k` is the right normalisation | Pass |
| same, inseparable | `k`-linear Frobenius `ℙ¹_{𝔽_p} → ℙ¹_{𝔽_p}`, `E = O(1)` | `deg O(p) = p` / `[k(t):k(t^p)]·1 = p` | Pass |
| same, no rational point | real conic `C` projected from `(0:0:1)` to `ℙ¹_ℝ`, `E = O(1)` | `χ(O_C(1)) − χ(O_C) = 3 − 1 = 2` / `2·1 = 2` | Pass |
| same, genus one | `x : E → ℙ¹`, `E = O(1)` | `χ(O_E(2O)) − χ(O_E) = 2 − 0 = 2` / `2·1 = 2` | Pass |
| same, controls | `r = 0`; constant `f`; reduced line `ℙ¹ → V(z²) ⊂ ℙ²`, `O(1)` | `0 = n·0`. The constant `f` is excluded by `[IsDominant f]`. The reduced line gives `1` vs `2`, excluded by `[IsIntegral Y]` (README Check) | Pass |
| same, one-tactic probe | `first \| rfl \| simp \| infer_instance` | `simp` leaves an open `finrank`/`eulerCharBelow` goal | Not padding |
| §3.3 degree is Tau Ceti `vectorBundleDegree` (`Degree.lean:82`) | the body at `2fd255d9` vs `Suggested.lean:706–711` | the same two `eulerCharBelow … 2` expressions with `(InvertibleSheaf.trivial _).obj` | Pass |
| §3.3 `_congr` (`:102`), `_eq_eulerDegree_toInvertible` (`:116`) | `O(1) ⊕ O(−1)` vs `O²` on `ℙ¹`; `O(n)` | Both have degree 0 and are not isomorphic, so the isomorphism hypothesis is needed. `deg O(n) = (n + 1) − 1 = n` | Pass |
| §3.3 `_eq_relativeDegree` (`:132`), 0AYY | `ℙ¹`, `D = [0] + [∞] − [1]`; real conic, `x` with `κ(x) = ℂ` on `z = 0`; nodal cubic | `deg O(1) = 1 = 1 + 1 − 1`; `deg O_C(x) = 3 − 1 = 2 = [ℂ:ℝ]`; the node's stalk is not a DVR, so the nodal cubic is excluded | Pass |
| §3.2 very-ample descent inputs | real conic `C`, `O_C(1)`; `E`, `O(3O)`; negative `E`, `O(2O)` | `2 ≥ 2g + 1 = 1`: `H⁰ = ℝ³`, and `⊗ ℂ` gives `H⁰(ℙ¹_ℂ, O(2)) = ℂ³`; the conic embedding over `ℂ` descends by 02L6. `3 ≥ 3`: plane cubic. `2 < 3`: a 2:1 map to `ℙ¹`, outside the clause | Pass |
| same, hypotheses of the two Tau Ceti declarations | `k → k̄`; `X` proper; `L` invertible | `k̄` flat over `k`; `X` compact and quasi-separated (separated); `L` quasi-coherent; `Spec k̄ → Spec k` surjective, flat, quasi-compact | Pass |
| §2.6/§4.9, JacobianChallenge Layer C (02O5, 02O6) | `ℙ¹_ℤ`, `O(−2)`; `ℙ¹_k`, `O(−2)`; negative `𝔸¹_k`, `O` | `H¹ = ℤ`, finite over `ℤ`; `h¹ = 1`; `H⁰ = k[t]` is infinite-dimensional (not proper) | Pass |
| Scope and contracts: `isConstantRank`, `FixedRank` | `X = Spec k ⊔ Spec k`, `E` of rank 1 on one point and 2 on the other; `E = 0` | `E` lies in no `FixedRank X r`; `0 ∈ FixedRank X 0` | Pass |
| Pins `:423`, `:464` vs `lake-manifest.json` | `Degree.lean`, `FlatBaseChange.lean`, `Descent/MorphismProperty.lean` | present at `2fd255d9` / absent at `358314d4` | **R01** |

Rows carried from r70's report (PRREVIEW-SchemeAndStackFoundations~70), for statements this diff leaves untouched. The values are r70's, or those of the reports r70 carried.

| Statement | Instances | Values | Result |
|---|---|---|---|
| §3.2 `HighDegree.lean:73` applied to `I_Z ⊗ L` | `E`, `O(3O)`, `Z = {P, Q}`; `O(2O)`, `Z` a fibre of `x`; real conic, `O_C`, `x` of degree 2 | `deg = 1 > 0`, onto `L\|_Z`; `deg = 0`: kernel of dim 1 (sharp); `−2`: 0E3C's duality step | Pass (r70) |
| §3.3 route: §2.6 `proper_fibreDimension_vanishing`, `d = 1` | `ℙ¹_{k[ε]}`, `O(−1)`; `ℙ¹ ⊔ ℙ¹`; negative `ℙ²`, `O(−3)` | `H² = 0`; `H² = 0`; `H²(O(−3)) = k ≠ 0` | Pass (r70) |
| §3.3 `_add_of_shortExact` through `:150` | `0 → O(−2) → O(−1)² → O → 0` on `ℙ¹` | `H²(O(−2)) = 0`; `−2 = −2 + 0` | Pass (r70) |
| §3.2 old-name parenthetical | `E`, `O(O)`; `ℙ¹`, `O(−1)` | `h⁰ = 1 = 1 + 1 − 1`; `h⁰ = 0 = −1 + 1 − 0` | Pass (r70) |
| §3.2 `lineBundle_degree_bounds` (0E3C, 0E3D, 0H2V) | `E`: `O(O)`, `O(2O)`, `O(3O)`; `C`: `O_C`, `O_C(1)`; genus 2 `ω²` | not g.g.; g.g.; plane cubic; `h⁰ = 1`, `3`; factors through a conic | Pass (r69) |
| `Effective.lean:57`; `RiemannRoch/Basic.lean:181` | `E`, `O(P − O)`; `ℙ¹`, `D = −[∞]`; `D = 0` | `h⁰ = 0`; `h⁰ = 0`; `h⁰ = 1` | Pass (r69) |
| §3.3 `_add_of_shortExact`, 0AYS | Euler sequence; `ℙ¹_{k[ε]}`; `ℙ¹ ⊔ ℙ¹` | `−1 + 1 = 0`; `−2 + 2 = 0`; `a + b` | Pass (r69) |
| §0.17 locators | `:144`, `:175`, `:211`, `:258` | each opens its declaration | Pass (r69) |
| §5.10 docstring; `intersectionNumber` | `ℙ¹ × ℙ¹`, `D = (1,−1)`, `H = (1,1)` | `D·H = 0`, `D² = −2` | Pass (r67) |
| §2.6 uniform vanishing | `ℙⁿ_A`, affine, `A = 0` | `N = n + 1`, `1`, `0` | Pass (r67) |
| §0.5, §0.17 (031Q/031R), §0.29, §2.9 (0GN7), `flat_over_dedekind`; §3.2 `genus_of_finite_etale` | as in r67 | as in r67 (`z ↦ z²` not étale; étale double cover of genus 2 has `g = 3`) | Pass (r67) |
| §0.8, §0.15, §0.16, §0.30, §1.7, §1.8, §1.14, §2.1, §2.3, §2.17 | as in r64 | as in r64 | Pass (r64) |
| §4.4, §5.2, §5.6, `artinBootstrap`, `grothendieck_existence`, alterations, `node_local_structure_dvr`, `isAzumaya_iff_…`, `weil_bound`, Castelnuovo–Severi | as in r64/r67 | as in r64/r67 | Pass |

### Remark on untouched text (no change requested)

- §3.3's `_baseChange` (0B59; `:4813`) follows from Tau Ceti's `finrank_cohomology_pullback_eq_of_isPullback` (`Cohomology/FlatBaseChange.lean:277` at `2fd255d9`), which preserves every `dim Hⁱ` under field extension. `InvertibleSheaf.eulerDegree_pullback` (`LineBundle/BaseChange.lean:54`) uses the same lemma in rank one, so the route could cite it after the merge.

## Not verifiable

- **Seeded targets.** Only §3.3 and §4.9 fall in the changed passages, and their changed locators are verified above. 0.8, 0.17, 0.22, 0.26, 1.6, 1.12, 1.19, 2.1, 2.4, 3.4, 4.11, 5.6 and 5.11 are in untouched text, and this incremental review does not re-read their locators. The README flags no locator as unverified.
- **Post-merge elaboration.** The brief's Lean command runs at the branch pins only. The post-merge evidence is the pull-request CI result, the conflict-free `git merge-tree`, and the declarations opened at `2fd255d9`.
- **de Jong 1996, Hartshorne 1977.** The manifest settles both as uncertified, and no changed passage cites them.

## Source issues

- none
