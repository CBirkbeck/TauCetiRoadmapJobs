# Review of SchemeAndStackFoundations (pull request #1276 at 125e33d)

**Verdict:** needs changes

This is an incremental re-review of the 96 lines changed since ff215c5. The changes are 76 lines in `README.md` (the scope list, §0.17, §3.2 and §3.3) and 20 deleted lines in `Suggested.lean` (`Curve.vectorBundleDegree_add_of_shortExact` and `Curve.cohomologyDim_one_eq_zero_of_degree_gt`). Nothing changed outside the folder.

- r67's R03 (the §0.17 locators) is repaired.
- R01 is partly repaired: the two degree theorems that duplicate Tau Ceti are gone. The manifest still pins Tau Ceti `358314d4`, and four of the five Tau Ceti files this head newly cites do not exist there.
- R02 (the description) is not repaired.
- The change introduces two small P3 defects: a dependency the new §3.3 route names but no *Needs:* line lists (R03), and a parenthetical in §3.2 that now describes a case the narrowed target no longer has (R04).

One finding is blocking (P2): R01. Three are P3.

## R01 (P2) — The manifest pins a Tau Ceti without the declarations the README cites, and `Suggested.lean` still restates Tau Ceti definitions

Carried from r67 R01 (and r64 R01, r61 R01/R03). Partly repaired.

**Location.**

- `lake-manifest.json` at 125e33d pins Tau Ceti `358314d4` and Mathlib `f6090c70`. `README.md:422` and `:463` say "`1b1ccf4b`, the pin in `lake-manifest.json`" and "`2fd255d9`, the pin in `lake-manifest.json`".
- `Suggested.lean` still declares the following definitions, which Tau Ceti builds at `2fd255d9`. Lines are at this head; those after Layer 3 have moved up 20 lines.
  - `75, 82, 126, 133, 155, 162, 168, 173, 268, 276, 281, 288, 554, 760, 765, 929, 1114, 1126, 1140`;
  - the theorems `Ring.IsJapanese.of_complete_local` (`:137`) and `Ring.IsNagata.of_complete_local` (`:143`) on the restated carriers;
  - in Layer 3, `Curve.isFiniteLocallyFreeOfRank` (`:692`), `Curve.vectorBundleDegree` (`:697`) and `vectorBundleDegree_pullback` (`:704`) on the restated degree.
- This head adds README citations that are true only at `2fd255d9`:
  - `:281–284`, the scope list: "the degree bounds of line bundles on smooth proper curves cited in §3.2 … the degree of vector bundles … cited in §3.3";
  - `:4737–4746` (§3.2): `Curves/HighDegree.lean:73`, `:88`, `LineBundle/Effective.lean:57`, `WeilDivisor/Scheme/RiemannRoch/Basic.lean:181` and `Curves/GlobalGeneration.lean:48`;
  - `:4786–4789` (§3.3): `VectorBundle/Degree.lean:150`, `:168`.

**Claim.** The pin sentences are false at this head. Every Tau Ceti citation added by the last five review rounds resolves at `2fd255d9` but not at the manifest's `358314d4`, including the six new locators of this head. The deletion of `cohomologyDim_one_eq_zero_of_degree_gt` is right after the merge, because Tau Ceti then proves it. At the head's own pins, however, the bound is now stated neither here nor in Tau Ceti.

**Witness.** The following files are absent at `358314d4`:

- `Curves/HighDegree.lean`, `LineBundle/Effective.lean`, `Curves/GlobalGeneration.lean` and `VectorBundle/Degree.lean`;
- `IntersectionNumber/`, `LineBundle/Ample.lean`, `RingTheory/Japanese.lean`, `AlgebraicSpace/` and `Chow/`.

At `358314d4`, `finrank_cohomology_zero_sheaf_eq_zero_of_relativeDegree_neg` is at `RiemannRoch/Basic.lean:174`, not `:181`. `origin/main` (1bea835) pins `2fd255d9`/`1b1ccf4b`, and it is not an ancestor of this head.

**Repair.** The repair is unchanged from r67, minus the two deletions this head made.

1. Merge `origin/main`. `git merge-tree --write-tree HEAD origin/main` reports no conflict: since the merge base `a0ad405`, main changed only `STATUS.md`, `PROGRESS.md` and `lake-manifest.json` in this area.
2. Replace the definitions in r67's table with Tau Ceti's: `TauCeti.Ring.IsJapanese`/`IsNagata`, `TauCeti.Excellence.*`, `AlgebraicSpace/Basic.lean:68, 74, 113, 195`, `Limits/Replete.lean:91`, `Morphisms/Thickening.lean:69, 147`, `Scheme/Regular/Scheme.lean:68` and `Chow/Basic.lean:86, 257, 295`. Restate the theorems that use them on those carriers.
3. Delete `Curve.isFiniteLocallyFreeOfRank` and `Curve.vectorBundleDegree`. Restate `vectorBundleDegree_pullback` on `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean:82`).
4. Change the *Lean:* lines of §0.5, §0.20, §0.21, §1.3, §2.17, §3.3, §4.1, §4.13 and §5.1 to match.

**Tested.** I opened every locator this head adds at `2fd255d9`, and each one opens the named declaration (listed under Verified sound). The four new files are absent at `358314d4`. r64 elaborated a post-merge copy on these carriers: exit 0, `sorry` warnings only.

## R02 (P3) — The pull-request description describes a §4.10A this head lacks and states no order with the four conflicting heads

Carried from r67 R02 (r64 R02, r61 R04, r57 R04, r54 R02). Not repaired.

**Location.** The pull-request description.

**Witness.**

- The description says "New section 4.10A … from a compatible polarized adic system" and "This README-only addition changes no Lean declarations".
- `grep -c '4\.10A' README.md` is 0, and `### 4.10` at `README.md:5612` is Grothendieck existence.
- Against `origin/main` the folder diff is `2 files changed, 2599 insertions(+), 3842 deletions(-)`, so `Suggested.lean` changes too.
- `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting with this head. #1656's head makes the same §3.2/§3.3 moves (its `README.md:5342`).

**Repair.** Rewrite the description to say what the branch does against main: the README rewrite that cites Tau Ceti's Layer 0–5 packages, the reduction of `Suggested.lean` to headline theorems, and the move of henselization and the curve degree bounds to Tau Ceti. Add one line per conflicting pull request saying which side rebases. No file change is needed.

**Tested.** A description that names #1656, #1807, #1808 and #1854 with an order, and mentions no §4.10A, matches this head.

## R03 (P3) — §3.2's new Tau Ceti citations and §3.3's new route are missing from the supplier contract and the dependency lines

New: a defect in the changed passages.

**Location.**

- `README.md:4791`: "the target is the discharge of those hypotheses on a proper `X` of dimension `≤ 1` by §2.5's vanishing and §2.6's finiteness".
- `:4818–4820`, §3.3's *Needs:* line: "§2.6, §2.20; AlgebraicVectorBundles L0B–L0C; Tau Ceti `eulerCharBelow`, `finrank_cohomology_zero_sub_one_eq_add`, `InvertibleSheaf.eulerDegree`; …".
- `:5108`, Layer 3 Dependencies: "Layer 2: §2.6 (quasi-coherent cohomology), §2.11 (Hilbert 90), §2.20 (duality)".
- `:500–501`, the Tau Ceti contract: "the declarations cited by name, file and line in §§0.1–0.5, … 2.17, 3.1, 3.3, 4.1, 4.11, 4.13 and 5.1".

**Claim.**

- The `_add_of_shortExact` route now runs through §2.5 (`noetherianSpace_vanishing`, `README.md:3432`) and Tau Ceti's `FixedRank.vectorBundleDegree_add_of_shortExact`. Neither §3.3's *Needs:* line nor Layer 3's Dependencies lists either of them.
- §3.2 now cites four Tau Ceti declarations by name, file and line. §3.2 is missing from the contract's list of sections.

**Witness.** `grep -n '§2.5'` between `:4651` (Layer 3) and `:5115` finds only `:4791`. The contract list at `:500–501` jumps from "3.1" to "3.3".

**Repair.** Make three edits:

1. Append "§2.5 (`noetherianSpace_vanishing`); Tau Ceti `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree_add_of_shortExact`" to §3.3's *Needs:*.
2. Add "§2.5 (Grothendieck vanishing)" to Layer 3's Dependencies.
3. Insert "3.2," after "3.1," at `:501`.

Alternatively, route `H²(E₁) = 0` through §2.6's `proper_fibreDimension_vanishing` (`:3492`; `X → Spec k` proper with fibres of dimension `≤ 1`), which §3.3 already needs. Then only the Tau Ceti item and "3.2," are added.

**Tested.** On `X = ℙ¹_{k[ε]}` (proper, dimension 1, nonreduced), `H²(X, O_X(−1)) = 0` is exactly the hypothesis `:150` asks for. Both §2.5 (Noetherian space of dimension 1) and §2.6's `proper_fibreDimension_vanishing` (`d = 1`) give it.

## R04 (P3) — §3.2's old-name mapping calls the `deg L > 2g − 2` bound a case of `lineBundle_degree_bounds`, which no longer has that case

New: text the change makes wrong.

**Location.** `README.md:4772–4774`: "Citations of *Curve.cohomologyDim_one_eq_zero_of_degree_gt* (the case `deg L > 2g − 2` of `lineBundle_degree_bounds`) to §3.2 resolve to Tau Ceti's …".

**Claim.** The same change narrowed `lineBundle_degree_bounds` (`:4731–4734`) to "`deg L ≥ 2g` ⇒ globally generated" and "`deg L ≥ 2g + 1` ⇒ very ample". The `deg L > 2g − 2` bound is now Tau Ceti's, cited separately at `:4735–4740`, so the parenthetical points at a case the target does not have.

**Witness.** On an elliptic curve, `L = O(O)` has `deg L = 1 > 0 = 2g − 2`, so the old theorem applies (`H¹ = 0`, `h⁰ = 1`). But `1 < 2g = 2`, so no clause of the narrowed `lineBundle_degree_bounds` covers it.

**Repair.** Replace the parenthetical with "(the vanishing `H¹(L) = 0` and `h⁰(L) = deg L + 1 − g` for `deg L > 2g − 2`)".

**Tested.** The replacement describes exactly what `HighDegree.lean:73` and `:88` state at `2fd255d9`.

## Previous findings

- R01 — partly repaired: `Suggested.lean` no longer declares `vectorBundleDegree_add_of_shortExact` or `cohomologyDim_one_eq_zero_of_degree_gt`. `lake-manifest.json` still pins Tau Ceti `358314d4`, and `:126` `def Ring.IsJapanese`, `:288` `def IsAlgebraicSpace`, `:697` `def vectorBundleDegree` and `:1140` `def ChowGroup` remain.
- R02 — not repaired: the description still says "New section 4.10A …" and "This README-only addition changes no Lean declarations", and names no order with #1656, #1807, #1808 or #1854.
- R03 — repaired: `README.md:1291–1295` reads "`satisfiesSerreS_one_iff` (`:144`; …) … `TauCeti.isReduced_iff_…` (`:258`; …), all in `SerreCondition/Basic.lean`, and `TauCeti.Ring.isCohenMacaulay_iff_forall_satisfiesSerreS` (`TauCeti/RingTheory/CohenMacaulay/Ring.lean:59`)".

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's gate at 125e33d reports every counter 0, including `build=0`, and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` on this head also printed every counter 0 and `OK`, with exit 0.
- **Dependency check.** `gate --depcheck … --movable` printed `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)` and exit 0, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not listed in `ORDER.txt`. The diff adds no cross-roadmap supplier.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` at the head's pins: exit 0 in 53 s, 44 "declaration uses `sorry`" warnings (46 − 2), no other diagnostic.
- **Signatures and padding.** The diff only deletes declarations. `scratch/signatures.md` has 117 entries (119 − 2) and 0 dropped binders. The remaining Layer 3 declarations still use every definition they need: `cohomologyDim` is used by `genus_baseChange` (`:682`) and `genus_of_finite_etale` (`:724`), and `isFiniteLocallyFreeOfRank` by `vectorBundleDegree_pullback` (`:712`), so the deletions orphan nothing. No new declaration needs the one-tactic probe, and r64's probe stands for the 44 that remain.

### The changed passages, checked at Tau Ceti `2fd255d9` (the pin the README names)

- **`Curves/HighDegree.lean`** (100 lines).
  - `:73` is `subsingleton_cohomology_one_of_smooth_of_two_mul_genus_sub_two_lt_eulerDegree` and `:88` is `finrank_cohomology_zero_eq_eulerDegree_add_one_sub_genus_of_smooth`, in `namespace TauCeti.AlgebraicGeometry.InvertibleSheaf` (`:39`).
  - The variables at `:43–45` are `[IsProper] [SmoothOfRelativeDimension 1] [GeometricallyConnected]` over any field. The genus is `finrank k H¹(O)`, and there is no rational point. This matches "over every field".
- **`LineBundle/Effective.lean:57`** is `exists_isEffective_iso_sheaf_of_genus_le_eulerDegree`. It concludes an effective `D` with `L ≅ O(D)` and the same degree.
  - Its hypotheses (`:44–51`) are an integral scheme, DVR stalks at codimension-one points, properness, coheight `≤ 1`, finite `H¹(O)` and `k ↠ Γ(O)`.
  - A smooth proper geometrically connected curve meets all of them. Every hypothesis except the last comes from `high_degree_hypotheses_of_smooth` (`HighDegree.lean:50`). The last comes from `baseRingToGlobalSections_bijective_of_geometricallyIntegral`, which §3.3 cites.
- **`WeilDivisor/Scheme/RiemannRoch/Basic.lean:181`** is `finrank_cohomology_zero_sheaf_eq_zero_of_relativeDegree_neg`. It carries `omit hs`, so no rational point is used, matching the README's "a divisor `D` of negative degree has `h⁰(O(D)) = 0`".
- **`Curves/GlobalGeneration.lean:48`** is `isGloballyGenerated_of_smooth_of_two_mul_genus_le_eulerDegree`, with `[IsAlgClosed k]` at `:41`, as the README says. Tau Ceti at `2fd255d9` has no very-ample criterion for curves: `grep -ri 'veryample\|very ample'` over `TauCeti/` finds only this file's docstring. So both clauses kept in `lineBundle_degree_bounds` (every field; very ample) are not in Tau Ceti.
- **`VectorBundle/Degree.lean`.**
  - `:150` is `vectorBundleDegree_add_of_shortExact`, with `[FiniteDimensional]` on `H¹(E₁)`, `H⁰(E₂)` and `H¹(E₂)` and `Subsingleton H²(E₁)`.
  - `:168` is `…_of_isCurveOver`, with `[X.IsCurveOver k]` (integral, proper, `topologicalKrullDim X = 1`; `Curves/Basic.lean:37`) and DVR stalks.
  - The README's description matches both. The extension to every proper `X` of dimension `≤ 1` is a real difference: Tau Ceti's vanishing and finiteness (`Curves/Cohomology.lean:91`, `:128`) both assume `IsCurveOver`.
- **§0.17 (`:1288–1295`).** `SerreCondition/Basic.lean` lines 85, 102, 112, 118, 144, 175, 199, 211 and 258 open the named declarations (`namespace TauCeti` at `:253` for `:258`). `CohenMacaulay/Ring.lean:59` is `isCohenMacaulay_iff_forall_satisfiesSerreS [IsNoetherianRing R]`.
- **Citations of the deleted names.** `roadmaps grep 'cohomologyDim_one_eq_zero_of_degree_gt|vectorBundleDegree_add_of_shortExact'` finds them only in this roadmap: on main, at this head, and in its revisions #1656, #1808 and #1854. No other roadmap cites them, so the two "Citations of … resolve to …" sentences are enough as an old→new map. `scratch/overlaps.md` lists no dropped id.

### The seeded sample where it falls in the changed passages

- **§3.3 (Degrees of vector bundles, Riemann–Roch and Serre duality on curves).** I checked these against the cached Stacks varieties chapter text:
  - 0AYS is Lemma 33.44.3 (`stacks-project` varieties line 4419, p. 95): a proper `X` of dimension `≤ 1` over `k`, with locally free sheaves of finite constant rank. This supports "every proper `X` of dimension `≤ 1`, reducible and nonreduced included".
  - 0AYR is Definition 33.44.1 (line 4401). 0B59 is 33.44.2 (4412), 0AYX 33.44.7 (4509), 0DJ5 33.44.8 (4514), 0AYY 33.44.9 (4525) and 0AYZ 33.44.11 (4552, "nonconstant morphism of proper curves").
  - 0BUG is Lemma 33.9.3 (line 903). Its item (7) gives `H⁰ = k` for geometrically reduced and connected `X`, and (8) for geometrically integral `X`.
  - In the curves chapter text, 0BS2/0BS3/0BS4/0C1A are Lemma 53.4.1, Lemma 53.4.2 (items (3)–(4) at lines 319–322), Remark 53.4.3 and Lemma 53.8.4 (lines 282, 314, 327, 696).
- **The §3.2 locators the diff adds** (curves chapter text):
  - Situation 53.6.2 (line 496) is `X` proper of dimension 1 over `k` with `H⁰(X, O_X) = k`.
  - 0B5E is Lemma 53.6.3 (line 502). 0E3A and 0E3B are Lemmas 53.22.1 and 53.22.2 (lines 2454, 2477; pp. 55–56).
  - 0E3C is Lemma 53.22.3 (line 2490, p. 56): `X` integral, `deg L ≥ 2g` ⇒ globally generated, over any `k`.
  - 0E3D is Lemma 53.22.4 (line 2503). 0H2V is Lemma 53.22.5 (line 2511, p. 57): `X` geometrically integral, `deg L ≥ 2g + 1` ⇒ very ample.
  - A smooth proper geometrically connected curve is geometrically integral and has `H⁰ = k`, so the narrowed target holds over every field as stated.
- The other sampled targets (0.4, 0.20, 1.1, 1.23, 2.4, 2.8, 2.16, 2.19, 2.21, 3.8, 4.2, 4.4, 5.8, 5.12) lie in text the diff does not touch.

### Adversarial table

These rows cover the changed statements. Each value was computed this round.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §3.2 `lineBundle_degree_bounds`, `deg L ≥ 2g` ⇒ globally generated, every field (0E3C) | elliptic `E`: `O(O)`, `O(2O)`; real conic `C`: `O_C`, `O_C(1)`; `ℙ¹`: `O(−1)` | `O(O)`: `1 < 2`, `h⁰ = 1`, the section vanishes at `O`, not g.g. (boundary); `O(2O)`: `2 ≥ 2`, sections `1, x` have no common zero, g.g.; `C`: `0 ≥ 0` and `2 ≥ 0`, both g.g. (`h⁰ = 1`, `3`); `ℙ¹`: `−1 < 0`, `h⁰ = 0`, hypothesis fails | Pass |
| same, `deg L ≥ 2g + 1` ⇒ very ample (0E3D, 0H2V) | `E`: `O(2O)`, `O(3O)`; genus-2 `X`: `ω^2`; `C`: `O_C(1)` | `O(2O)`: `2 < 3`, `h⁰ = 2`, `E → ℙ¹` of degree 2, not an embedding; `O(3O)`: `h⁰ = 3`, plane cubic; `ω^2`: `deg 4 = 2g < 5`, `h⁰ = 4 + 1 − 2 = 3`, `|2K|` factors through the hyperelliptic double cover onto a conic, not very ample (sharp for `g = 2`); `O_C(1)`: `2 ≥ 1`, image is `C ⊂ ℙ²_ℝ` | Pass |
| Target vs `GlobalGeneration.lean:48` ("differs by allowing every field") | `C/ℝ` | `[IsAlgClosed ℝ]` fails, so `:48` does not apply to `C`; the target applies (`deg O_C = 0 ≥ 0`). Global generation descends along `ℝ → ℂ` because `H⁰` commutes with flat base change, and genus and degree are invariant (0BY9, 0B59), so the target follows from `:48` by descent and is a genuine extension | Pass |
| `HighDegree.lean:73`, `:88` (cited) | `ℙ¹`: `O(−1)`; `E`: `O`, `O(O)`; genus `g`: `K` | `−1 > −2`: `h¹ = 0`, `h⁰ = −1 + 1 − 0 = 0`; `E`, `O`: `0 > 0` fails (`h¹(O) = 1`); `O(O)`: `h⁰ = 1 + 1 − 1 = 1`; `K`: `2g − 2 > 2g − 2` fails (`h¹(K) = 1`) | Pass |
| `Effective.lean:57` (cited, `deg ≥ g` ⇒ effective) | `ℙ¹`: `O`; `E`: `O(P − O)`, `P ≠ O`; genus 2, degree 2 | `0 ≥ 0`, `D = 0`; `0 < 1` is excluded, and `h⁰ = 0` (otherwise `P ~ O` on `g = 1`), so the bound is sharp; `h⁰ ≥ 2 + 1 − 2 = 1` | Pass |
| `RiemannRoch/Basic.lean:181` (cited) | `ℙ¹`: `D = −[∞]`; `C`: `D = −x`, `[κ(x):ℝ] = 2`; `D = 0` | `h⁰(O(−1)) = 0`; `deg = −2 < 0`, `h⁰ = 0`; `deg 0` is not `< 0` and `h⁰ = 1`, so strictness is needed | Pass |
| §3.3 `_add_of_shortExact`, every proper `X` of dimension `≤ 1` (0AYS) | Euler sequence on `ℙ¹`; the same pulled back to `X = ℙ¹_{k[ε]}`; `ℙ¹ ⊔ ℙ¹` | `ℙ¹`: `−1 + 1 = 0`; `X`: `χ(O_X(n)) = 2(n + 1)`, degrees `−2`, `0`, `2`, and `−2 + 2 = 0`, with `X` not integral so `:168` does not apply while `:150`'s hypotheses hold (`H² = 0`); `ℙ¹ ⊔ ℙ¹`, `O(a,b)`: `(a + 1) + (b + 1) − 2 = a + b` | Pass |
| §3.2 Check: real conic | `C : x² + y² + z² = 0` | `ω_C = O_C(−1)`; `χ(O_C(1)) = χ(O_ℙ²(1)) − χ(O_ℙ²(−1)) = 3 − 0 = 3`, `χ(O_C) = 1`, so `deg = 2 = −(2g − 2)`; `h⁰ = 2 + 1 − 0 = 3` | Pass |
| §3.2 Check: elliptic | `O(O)`, `O(2O)`, `O(3O)` | as in rows 1–2 | Pass |
| §3.2 old-name parenthetical | `E`, `O(O)` | `deg 1 > 2g − 2 = 0` (old theorem applies); `1 < 2g = 2`, so the narrowed target has no clause covering it | **R04** |
| §3.3 route vs *Needs:* | `:4791` vs `:4818`, `:5108` | §2.5 is named in the route and absent from both lists | **R03** |
| §0.17 locators | `:144`, `:175`, `:211`, `:258` | now attributed to `SerreCondition/Basic.lean`, and each line opens its declaration | Pass |
| Pins | `HighDegree`, `Effective`, `GlobalGeneration`, `VectorBundle/Degree`; `RiemannRoch:181` | present at `2fd255d9`, absent at `358314d4`; at `358314d4` the declaration is at `:174` | **R01** |

The following rows are carried from r67's table, because the diff leaves these statements untouched. The values are r67's, or r64's where r67 carried them.

| Statement (r67) | Instances | Values | Result |
|---|---|---|---|
| §5.10 docstring, Euler-characteristic form | `ℙ¹ × ℙ¹`, `D = (1,−1)`, `H = (1,1)` | `D·H = 0`, `D² = −2` | Pass |
| §5.10/§5.11 `intersectionNumber` is one class against one map | `{pt} × ℙ¹ ↪ ℙ¹ × ℙ¹` | `O(a,b) ↦ b`; `D·O(1,0) = −1` | Pass |
| §2.6 `exists_subsingleton_cohomology_of_isAffine` / `exists_isZero_higherDirectImage` | `ℙⁿ_A`, affine, `A = 0` | `N = n + 1`, `1`, `0` | Pass |
| §0.5 `of_isNoetherianRing`, `finitePresentation` | `k[x₁, x₂, …]/(x₁, …)`; `k[x]`, `k` | not finitely presented; `0 → R → R → k → 0` | Pass |
| §0.17 031Q, 031R | `k[x,y]/(x², xy)`; `k[x]/(x²)`, `k[x,y]/(xy)` | both sides false; not reduced; reduced | Pass |
| §0.29 `SchemeCharP` | `∅`, `Spec(𝔽₂ × 𝔽₃)`, `Spec 𝔽₂[t]` | holds, fails, holds | Pass |
| §2.9 `bigSheaf_fullyFaithful` (0GN7) | `Spec 𝔽_p`, `x ↦ x^p` | `O`-linear Hom is `𝔽_p`; Frobenius is not `O`-linear | Pass |
| `flat_over_dedekind` (0AUW) | `S ⊔ 𝔸¹_S`; `Spec k[t]/(t)` | flat; `t`-torsion | Pass |
| §0.8, §0.15, §0.16, §0.17 (0FCC, Hartogs), §0.30 | as in r64 | as in r64 | Pass |
| §1.7, §1.8, §1.14, §2.1, §2.3, §2.17 | as in r64 | as in r64 | Pass |
| §3.2 `genus_of_finite_etale` | `z ↦ z²`; étale double cover of genus 2 | not étale; `g = 3` | Pass |
| §4.4, §5.2, §5.6, `artinBootstrap`, `grothendieck_existence`, alterations, `node_local_structure_dvr`, `isAzumaya_iff_…`, `weil_bound`, Castelnuovo–Severi | as in r64/r67 | as in r64/r67 | Pass |

r67's row for `cohomologyDim_one_eq_zero_of_degree_gt` is retired with the declaration. Its content (`h¹(K) = 1` excluded) is now the `HighDegree.lean` row above.

### Remarks on untouched text (no change requested)

- §3.2's Check at `README.md:4759` ("`K` has degree `2g − 2` and `h⁰(K) = g`, so the bound `deg > 2g − 2` is sharp") now checks the cited Tau Ceti bound rather than a clause of `lineBundle_degree_bounds`. It is still true.
- The sibling review of #1808 (report ~68, its R05) holds that `hodge_index` is statable at `2fd255d9` on `Scheme.Modules.eulerCharBelow` with `LineBundleClass.IsAmple`. r67 judged the §5.10 docstring bullet consistent. That bullet is worth re-reading after R01's merge.

## Not verifiable

- **Seeded targets outside the changed passages** (0.4, 0.20, 1.1, 1.23, 2.4, 2.8, 2.16, 2.19, 2.21, 3.8, 4.2, 4.4, 5.8, 5.12). This incremental review does not re-read them.
- **Post-merge elaboration.** The brief's Lean command runs at the head's pins only. R01's post-merge test is r64's, together with the locators I opened at `2fd255d9`.
- **de Jong 1996, Hartshorne 1977.** The manifest settles both as uncertified. No changed passage cites them.
- **Ownership against open pull requests.** I checked it through `scratch/overlaps.md` and `roadmaps grep` for the moved names and for very-ample criteria, not through every open README. The diff adds no owned object; it narrows one target.

## Source issues

- **Misprint** in stacks-project at Lemma 53.4.2 (0BS3), proof, curves chapter p. 8: the source spells the Cohen–Macaulay property with transposed letters ("Macualay"); it should read "Macaulay"; affects nothing.
