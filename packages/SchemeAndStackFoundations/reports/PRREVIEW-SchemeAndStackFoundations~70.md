# Review of SchemeAndStackFoundations (pull request #1276 at 90139a9)

**Verdict:** needs changes

This is an incremental re-review of the 17 lines changed since 125e33d. All 17 are in `README.md`:

- the Tau Ceti contract (`:501`);
- §3.2's *Needs:* line (`:4747–4749`) and its old-name parenthetical (`:4775–4776`);
- §3.3's `_add_of_shortExact` route (`:4793–4795`) and its *Needs:* line (`:4825`).

`Suggested.lean` and every file outside the folder are unchanged.

- r69's R03 and R04 are repaired, and the repairs introduce no new defect.
- R01 (the pins) and R02 (the description) are not repaired and are carried below.

One finding is blocking (P2): R01. One is P3.

## R01 (P2) — The manifest pins a Tau Ceti without the declarations the README cites, and `Suggested.lean` still restates Tau Ceti definitions

Carried from r69 R01 (r67 R01, r64 R01, r61 R01/R03). Not repaired.

**Location.**

- `lake-manifest.json` at 90139a9 pins Tau Ceti `358314d4` and Mathlib `f6090c70`. `README.md:422` and `:463` say "`1b1ccf4b`, the pin in `lake-manifest.json`" and "`2fd255d9`, the pin in `lake-manifest.json`".
- `Suggested.lean` is unchanged. It still declares definitions that Tau Ceti builds at `2fd255d9`:
  - `:75, 82, 126, 133, 155, 162, 168, 173, 268, 276, 281, 288, 554, 760, 765, 929, 1114, 1126, 1140`;
  - the theorems `Ring.IsJapanese.of_complete_local` (`:137`) and `Ring.IsNagata.of_complete_local` (`:143`) on the restated carriers;
  - `Curve.isFiniteLocallyFreeOfRank` (`:692`), `Curve.vectorBundleDegree` (`:697`) and `vectorBundleDegree_pullback` (`:704`) on the restated degree.
- This head adds two more citations that resolve only at `2fd255d9`:
  - `:4748`: "`Curves/HighDegree.lean` `:73`, `:88`";
  - `:4825`: "`FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree_add_of_shortExact`".

**Claim.** The two pin sentences are false at this head. Every Tau Ceti citation added by the last six review rounds resolves at `2fd255d9` but not at the manifest's `358314d4`, including the two this head adds.

**Witness.** At `358314d4` (the head's `.lake/packages/TauCeti`):

- `AlgebraicGeometry/Curves/HighDegree.lean` and `AlgebraicGeometry/VectorBundle/Degree.lean` do not exist;
- `grep -r vectorBundleDegree_add_of_shortExact` finds nothing;
- `origin/main` (3090489) pins `2fd255d9`/`1b1ccf4b` and is not an ancestor of this head (merge base `a0ad405`).

**Repair.** The repair is unchanged from r69.

1. Merge `origin/main`. `git merge-tree --write-tree HEAD origin/main` still exits 0, with no conflict.
2. Replace the restated definitions with Tau Ceti's:
   - `TauCeti.Ring.IsJapanese`/`IsNagata` and `TauCeti.Excellence.*`;
   - `AlgebraicSpace/Basic.lean:68, 74, 113, 195`, `Limits/Replete.lean:91`, `Morphisms/Thickening.lean:69, 147`, `Scheme/Regular/Scheme.lean:68` and `Chow/Basic.lean:86, 257, 295`.

   Restate the theorems that use them on those carriers.
3. Delete `Curve.isFiniteLocallyFreeOfRank` and `Curve.vectorBundleDegree`. Restate `vectorBundleDegree_pullback` on `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean:82`).
4. Change the *Lean:* lines of §0.5, §0.20, §0.21, §1.3, §2.17, §3.3, §4.1, §4.13 and §5.1 to match.

**Tested.**

- The two new citations open at `2fd255d9`: `HighDegree.lean:73`, `:88` and `VectorBundle/Degree.lean:150`, in namespace `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.FixedRank` (`:62`, `:64`, `:70`).
- Pull-request CI ("build") passes at 90139a9, so the file still elaborates after the merge. The duplication and the false pin sentences remain.

## R02 (P3) — The pull-request description describes a §4.10A this head lacks and states no order with the four conflicting heads

Carried from r69 R02 (r67 R02, r64 R02, r61 R04, r57 R04, r54 R02). Not repaired.

**Location.** The pull-request description.

**Witness.**

- The description still says "New section 4.10A … from a compatible polarized adic system" and "This README-only addition changes no Lean declarations".
- `grep -c '4\.10A' README.md` is 0, and `### 4.10` (`:5617`) is Grothendieck existence.
- Against `origin/main` the folder diff is `2 files changed, 2605 insertions(+), 3843 deletions(-)`.
- `scratch/overlaps.md` still lists #1656, #1807, #1808 and #1854 as conflicting with this head.

**Repair.** Rewrite the description to say what the branch does against main:

- the README rewrite that cites Tau Ceti's Layer 0–5 packages;
- the reduction of `Suggested.lean` to headline theorems;
- the move of henselization and the curve degree bounds to Tau Ceti.

Add one line per conflicting pull request saying which side rebases. No file change is needed.

**Tested.** A description that names the four pull requests with an order, and mentions no §4.10A, matches this head.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `README.md:463` still says "`2fd255d9`, the pin in `lake-manifest.json`"; `Suggested.lean:126` `def Ring.IsJapanese`, `:288` `def IsAlgebraicSpace`, `:697` `def vectorBundleDegree`, `:1140` `def ChowGroup` remain.
- R02 — not repaired: the description still says "New section 4.10A …" and "This README-only addition changes no Lean declarations", and names no order with #1656, #1807, #1808 or #1854.
- R03 — repaired.
  - `README.md:4793–4795`: "by §2.6: `proper_fibreDimension_vanishing` for `X → Spec k` with `d = 1` gives `H²(E₁) = 0`, and the finiteness … cited there".
  - `:4825` adds the Tau Ceti `FixedRank.vectorBundleDegree_add_of_shortExact`.
  - `:501` reads "3.1, 3.2, 3.3".
- R04 — repaired: `README.md:4775–4776` reads "(the vanishing `H¹(L) = 0` and `h⁰(L) = deg L + 1 − g` for `deg L > 2g − 2`)".

## Verified sound

### Gate, dependency check, elaboration

- **Gate.**
  - The worker's gate at 90139a9 reports every counter 0, including `build=0`, and `OK`.
  - My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 (`dropped=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, …) and `OK`, exit 0.
- **Dependency check.** The output of `gate --depcheck … --movable`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
  ```

  Exit 0, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` at the head's pins: exit 0 in 51 s, 44 "declaration uses `sorry`" warnings, no other diagnostic.
- **Pull-request CI.** Read-only `gh pr view 1276`: head `90139a9`, `build` SUCCESS, `MERGEABLE`.
- **Signatures and padding.** `Suggested.lean` is byte-identical to 125e33d. `scratch/signatures.md` has 117 entries and 0 dropped binders. r64's one-tactic probe and r69's check of the remaining Layer 3 declarations stand.

### The changed passages, checked against Tau Ceti `2fd255d9` (main's pin, the one the README names)

**§3.2 *Needs:* (`:4747–4749`).**

- `HighDegree.lean:73` and `:88` take `L : InvertibleSheaf X` under the variables at `:43–45`: a field `k`, `[IsProper]`, `[SmoothOfRelativeDimension 1]`, `[GeometricallyConnected]`. The hypothesis is `2g − 2 < L.eulerDegree k`.
- On a smooth curve every `0`-dimensional `Z` is an effective Cartier divisor, so `I_Z ⊗ L` is invertible with `eulerDegree = deg L − deg Z`. The hypothesis then reads `deg L > 2g − 2 + deg Z`, which is exactly the hypothesis of Stacks Lemmas 53.22.1–53.22.2 (0E3A, 0E3B; `stacks-project`, curves chapter, lines 2454, 2477).
- 0E3C's proof (lines 2492–2502) uses `H¹(L) = 0` and `h⁰(L) = deg L + 1 − g` (the case `Z = ∅`), the duality map of Lemma 53.4.2 and `h⁰(ω) = g`. Both of the last two come from §3.3, which the line lists.
- 0E3D (line 2503) and 0H2V (line 2511) use the `I_Z ⊗ L` case after base change to `k̄`.
- `InvertibleSheaf.eulerDegree` is `LineBundle/Degree.lean:74` (`:70` at `358314d4`).

**§3.3 route (`:4793–4795`).**

- §2.6's `proper_fibreDimension_vanishing` (`:3492`) needs `f` proper, `Y` locally Noetherian and fibres of dimension `≤ d`. For `X → Spec k` the only fibre is `X`, so `d = 1` covers every proper `X` of dimension `≤ 1`.
- §2.6 identifies `R^q f_*` over an affine base with `H^q` (`qcoh_higherDirectImages`, `:3473`).
- The finiteness "cited there" is §2.6's JacobianChallenge citation (`:3488–3489`). JacobianChallenge on main lists "finite-dimensionality for proper `X/k`" and "`H² = 0` on a curve" in Layer B (its `README.md:136–138`), and §3.3's *Needs:* lists "JacobianChallenge Layers A–B".
- `VectorBundle/Degree.lean:150` asks exactly for `[FiniteDimensional]` on `H¹(E₁)`, `H⁰(E₂)`, `H¹(E₂)` and `Subsingleton H²(E₁)`.
- `:168` (`_of_isCurveOver`) and `Curves/Cohomology.lean`'s finiteness assume `IsCurveOver`, so the target's extension to nonreduced and reducible `X` is real.

**Remaining changed lines.**

- **§3.3 *Needs:* (`:4825`) and Layer 3 Dependencies (`:5113–5116`).** The Dependencies line lists "Layer 2: §2.6 …", "Mathlib and Tau Ceti as listed" and "JacobianChallenge Layers A–F", which cover every input the new route names. §2.5 no longer appears in §3.3.
- **Contract (`:500–501`).** §3.2 now cites four Tau Ceti declarations by file and line, and the list contains it.
- **Old-name parenthetical (`:4775–4776`).** The deleted declaration (`Suggested.lean:740–748` at ff215c5) concluded `cohomologyDim … 1 = 0 ∧ h⁰ = deg + 1 − g` under `2g − 2 < deg`. That is what the parenthetical now says, and what `HighDegree.lean:73`, `:88` prove.
- **Other cited lines reopened at `2fd255d9`.** `LineBundle/Effective.lean:57`, `WeilDivisor/Scheme/RiemannRoch/Basic.lean:181` and `Curves/GlobalGeneration.lean:48` each open the named declaration.
- **Dependants.** The sampled targets that cite §3.3 still resolve, because the diff changes only a route and a *Needs:* line, not the definition of the degree or `vectorBundle_riemann_roch`:
  - §5.8's Check "`χ(E) = deg E + r(1 − g)` on a curve (§3.3)" (`:7294`);
  - §5.10's "§3.3's residue-weighted Euler degree" (`:7308`, `:7326`, `:7353`) and `hodge_index`'s *Needs:* (`:7426`).
- **Overlaps.** `scratch/overlaps.md`: no id dropped either way, and no id that only an open revision defines. The diff adds no owned object, so no new ownership question arises.

### Adversarial table

New rows, for the changed statements, computed this round:

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §3.2 *Needs:*, `HighDegree.lean:73` applied to `I_Z ⊗ L` | elliptic `E`, `L = O(3O)`, `Z = {P, Q}`; `L = O(2O)`, `Z` a fibre of `x`; real conic `C`, `L = O_C`, `x` of degree 2 | `deg I_Z L = 1 > 0`, so `H¹ = 0` and `H⁰(L)` (dim 3) maps onto `L\|_Z` (dim 2). `deg = 0`, not `> 0`: `I_Z L ≅ O`, `h¹ = 1`, and the restriction (dim 2 → 2) has kernel of dim 1, so the bound is sharp. `deg I_x O_C = −2`, not `> −2`: there global generation comes from `Z = ∅` (`h¹ = 0`, `h⁰ = 1`) and 0E3C's duality step (§3.3) | Pass |
| same, the equivalence with 0E3A/0E3B | `g`, `deg L`, `deg Z` | `deg L − deg Z > 2g − 2 ⇔ deg L > 2g − 2 + deg Z` | Pass |
| §3.3 route: §2.6 `proper_fibreDimension_vanishing`, `d = 1` | `ℙ¹_{k[ε]}`, `E₁ = O(−1)`; `ℙ¹ ⊔ ℙ¹`; `Spec k`; negative control `ℙ²_k`, `O(−3)` | `H² = 0`, `h⁰(O_X(n)) = 2(n + 1)` finite. `H² = 0`. `H^{≥1} = 0`, `deg E = r − r = 0`. Fibre dimension `2 > 1` and `H²(O(−3)) = k ≠ 0`, so the dimension hypothesis is needed | Pass |
| §3.3 `_add_of_shortExact` through `:150` | `0 → O(−2) → O(−1)² → O → 0` on `ℙ¹` | `H²(O(−2)) = 0`; `−2 = −2 + 0` | Pass |
| §3.3 *Needs:*, Tau Ceti `FixedRank.vectorBundleDegree_add_of_shortExact` | `2fd255d9` vs `358314d4` | present at `Degree.lean:150` / file absent | **R01** |
| §3.2 old-name parenthetical | `E`, `O(O)`; `ℙ¹`, `O(−1)` | `1 > 0`, `h¹ = 0`, `h⁰ = 1 = 1 + 1 − 1`; `−1 > −2`, `h¹ = 0`, `h⁰ = 0 = −1 + 1 − 0` | Pass |
| Contract `:501` | §3.2's four Tau Ceti citations | "3.2" is in the list | Pass |
| Pins | `:422`, `:463` vs `lake-manifest.json` | `1b1ccf4b`/`2fd255d9` claimed; `f6090c70`/`358314d4` pinned | **R01** |

Rows carried from r69's report (PRREVIEW-SchemeAndStackFoundations~69), whose statements the diff leaves untouched. The values are r69's, or r67's and r64's where r69 carried them.

| Statement | Instances | Values | Result |
|---|---|---|---|
| §3.2 `lineBundle_degree_bounds`, globally generated (0E3C) | `E`: `O(O)`, `O(2O)`; `C`: `O_C`, `O_C(1)`; `ℙ¹`: `O(−1)` | `1 < 2`, not g.g.; `2 ≥ 2`, g.g.; `C`: `h⁰ = 1`, `3`; `h⁰ = 0` | Pass (r69) |
| same, very ample (0E3D, 0H2V) | `E`: `O(2O)`, `O(3O)`; genus 2 `ω^2`; `C`: `O_C(1)` | degree-2 map; plane cubic; `h⁰ = 3`, factors through a conic; `C ⊂ ℙ²_ℝ` | Pass (r69) |
| Target vs `GlobalGeneration.lean:48` | `C/ℝ` | `[IsAlgClosed ℝ]` fails; target applies, `deg O_C = 0 ≥ 0` | Pass (r69) |
| `HighDegree.lean:73`, `:88` | `ℙ¹`: `O(−1)`; `E`: `O`, `O(O)`; `K` | `h⁰ = 0`; `0 > 0` fails; `h⁰ = 1`; `2g − 2 > 2g − 2` fails | Pass (r69) |
| `Effective.lean:57`; `RiemannRoch/Basic.lean:181` | `E`, `O(P − O)`; `ℙ¹`, `D = −[∞]`; `D = 0` | `h⁰ = 0` (sharp); `h⁰ = 0`; `h⁰ = 1` (strictness needed) | Pass (r69) |
| §3.3 `_add_of_shortExact`, 0AYS | Euler sequence; `ℙ¹_{k[ε]}`; `ℙ¹ ⊔ ℙ¹` | `−1 + 1 = 0`; `−2 + 2 = 0`; `a + b` | Pass (r69) |
| §3.2 Checks: real conic, elliptic | `x² + y² + z² = 0`; `O(nO)` | `deg = 2`, `h⁰ = 3`; as above | Pass (r69) |
| §0.17 locators | `:144`, `:175`, `:211`, `:258` | each opens its declaration | Pass (r69) |
| §5.10 docstring; `intersectionNumber` | `ℙ¹ × ℙ¹`, `D = (1,−1)`, `H = (1,1)`; `{pt} × ℙ¹` | `D·H = 0`, `D² = −2`; `O(a,b) ↦ b` | Pass (r67) |
| §2.6 uniform vanishing | `ℙⁿ_A`, affine, `A = 0` | `N = n + 1`, `1`, `0` | Pass (r67) |
| §0.5, §0.17 (031Q/031R), §0.29, §2.9 (0GN7), `flat_over_dedekind` | as in r67 | as in r67 | Pass (r67) |
| §0.8, §0.15, §0.16, §0.30, §1.7, §1.8, §1.14, §2.1, §2.3, §2.17 | as in r64 | as in r64 | Pass (r64) |
| §3.2 `genus_of_finite_etale` | `z ↦ z²`; étale double cover of genus 2 | not étale; `g = 3` | Pass (r67) |
| §4.4, §5.2, §5.6, `artinBootstrap`, `grothendieck_existence`, alterations, `node_local_structure_dvr`, `isAzumaya_iff_…`, `weil_bound`, Castelnuovo–Severi | as in r64/r67 | as in r64/r67 | Pass |

### Remarks on untouched text (no change requested)

- §2.6 (`:3488–3489`) names the supplier of finiteness as "JacobianChallenge `Cohomology/Proper.lean`". That file is absent at Tau Ceti `2fd255d9`; it is the location JacobianChallenge Layer C plans (its `README.md:152–153`). The layer name would be a more stable citation.
- §3.2's very-ample clause reduces to `k̄` by descent of closed immersions (0H2V's proof). §3.2's *Needs:* does not name a descent input.

## Not verifiable

- **Seeded targets.** 0.4, 0.11, 0.18, 0.20, 0.23a, 1.11, 2.4, 2.8, 2.9, 2.14, 2.19, 5.5, 5.6, 5.8 and 5.10 all lie in text the diff does not touch, and this incremental review does not re-read their locators. §5.8's and §5.10's citations of §3.3 were checked, as above. The README flags no locator as unverified.
- **Post-merge elaboration.** The brief's Lean command runs at the head's pins only. The post-merge evidence is the pull-request CI result and the locators opened at `2fd255d9`.
- **de Jong 1996, Hartshorne 1977.** The manifest settles both as uncertified. No changed passage cites them.
- **Ownership against open pull requests.** I checked it through `scratch/overlaps.md`. The diff adds no owned object.

## Source issues

- none
