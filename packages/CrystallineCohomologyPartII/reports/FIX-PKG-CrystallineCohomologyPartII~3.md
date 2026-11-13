# Repair of CrystallineCohomologyPartII (package, round 3)

This round answers the round-2 package review (`reports/REV-PKG-CrystallineCohomologyPartII~2.md`, nine findings R01–R09) and the gate failure `statement-hygiene=5`. All nine findings were checked against the cached sources, the supplier heads and the pins. All nine are correct and have been applied. Edited files: `packages/CrystallineCohomologyPartII/README.md`, `Suggested.lean`, `sources.toml` (two locator fields), and the top-level `gaps` list of `design/plan.json` (one entry removed).

## R01 (P1) — applied

§5.12: the unshifted Wω isomorphism (⊕_{i>0} on both sides) → (ii) R^if_*Wω_{X,ℚ} ≅ H^{i−r}(WS_{dim Y,Y}) for every i ≥ 0, r = dim X − dim Y, grading raised by r. For Witt-rational Y the groups vanish for i ≠ r. Proof steps 2–6 carry the shift. New Checks: P¹ → Spec k, the identity, P^n_Y.

Evidence: ı_* is twisted by (−r) at CR12 line 4645; lines 4656–4665 drop the twist; the projector factors in every degree at lines 4245–4250.

## R02 (P1) — applied

§4.6: "acts by a bounded-torsion map on ⊕_q R^qf_*WO_X" → new item (iii): the projection to the target WO-part is killed; source WO is killed only for degree-zero [Z]; source Wω is killed at any degree. Added the point-inclusion Check (1 ↦ ĉl(x), trace 1). §5.4 step 3 now says its error cycles have degree 0.

## R03 (P1) — applied

§3.2 API: the rational "specialization of functions on the tube" bullet → an integral bullet: P(J_n) → W_nO_X → O_X is the divided-power augmentation (proved in step 2). Added the Check for Spec F_p ⊂ Spf ℤ_p: 1 ↦ 1, p ↦ 0, the tube map on ℚ_p is the identity, and O_X ⊗ ℚ = 0.

## R04 (P2) — applied

§0.1 step 5 now proves the surjective-tower criterion itself (CR12 Lemma 1.5.1) instead of citing §0.7. The proper-scheme agreement of the two rationalizations moved from §0.2 to §0.8, and citations in §§5.5, 5.10, 6.5, 6.13 were updated. Same pattern elsewhere: the supported Chow groups moved §4.4 → §4.3, and forward API bullets in §§5.5, 6.10 became consumer pointers. The Needs graph is now acyclic.

## R05 (P2) — applied

`gap:h-descent-formalism` → ordinary contracts: ArcTopologyAndDescent §§1.1, 1.3, 1.6 and PrismaticCohomology §2.0 (Rydh refinement, new contract section). Both were read at their heads and both come earlier in the merge order. Removed from the README contracts, §1.5, the Layer 1 dependencies and the plan's `gaps` list. `gap:qcqs-frobenius-factorization` is kept.

## R06 (P2) — applied

§3.1 now starts from the E_λ decomposition of CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*), and keeps the cutoff, exactness and determinant factor. §3.2 imports s_φ from §CR.4.4 (*Witt lifting from a torsion-free Frobenius lift*). The duplicate API bullets were deleted. Both owners are stated under Scope and ownership and in the contracts.

## R07 (P3) — applied

§4.1: "for X normal, W_1ω_X ≅ ω_X (SchemeAndStackFoundations §2.20)" → "W_1ω_X = H^{−d}(π^!k) =: ω_X for every X" (dualizing complex from §2.21). §2.20 is cited only for Cohen–Macaulay X; j_*Ω^d_U is given for normal X (CR12 Prop. 4.1.4 (1), (4)). Added a Check for the non-Cohen–Macaulay cone over an abelian surface.

## R08 (P3) — applied

§6.14 negative control: "an elliptic curve" → "an ordinary elliptic curve", e.g. y² = x³ + x + 1 over F₅ (point counts 2, 0, 2, 2, 2, plus ∞ gives 9 ≡ 4). Added the note that supersingular y² = x³ − x over F₃ has 4 ≡ 1 points, so the congruence does not imply the hypothesis. §§6.1, 6.4, 6.6 already say "ordinary".

## R09 (P3) — applied

§6.9: added an API list for `IsThetaDivisor` in four prose bullets:
- the effective Cartier ideal, its dual O_A(Θ) and the canonical section;
- h⁰ = 1 holds exactly when the polarization is principal (AbelianSchemesAndArithmeticModuli §A2.4);
- stability under field extension;
- stability under rational translation.

No Lean was added; the five existing Checks discriminate the direction and normalization.

## Gate failure: statement-hygiene=5

All five theorems of `Suggested.lean` now take `[Finite K]` instead of `[Fintype K]` beside `[Field K]`, and the modulus is `Nat.card K` in place of `Fintype.card K`. The five theorems are:
- `card_rationalPoints_modEq_of_cohomologyPullback_bijective`
- `card_projectiveZeroLocus_modEq_one`
- `card_dvd_card_solutions_of_sum_lt`
- `card_thetaDivisor_modEq`
- `card_rationalPoints_modEq_one_of_universallyCH0Trivial`

In `card_dvd_card_solutions_of_sum_lt` the variable type also moved from `[Fintype σ]`/`Fintype.card σ` to `[Finite σ]`/`Nat.card σ`, so that every cardinality uses `Nat.card`. The mathematics is unchanged. No `Fintype` remains in the file.

## Gate failure: tex=1

The worker's check flagged README line 70, the CrystallineCohomology supplier contract. The TeX-only syntax was `F_{p^r}` in the clause on the isocrystal slope decomposition. It sat outside a code span. It is now a code span: "over `F_{p^r}` the slopes are …". No other text changed. The gate's TeX scan, run again on the README, finds no hits.

## Checks run

**Elaboration.** `lake env lean packages/CrystallineCohomologyPartII/Suggested.lean`, run from the content checkout, exited 0. It produced exactly five `declaration uses 'sorry'` warnings, at lines 74, 90, 102, 124 and 157, and no other warning or error. No build was needed.

**Signatures.** A scratch copy with `#check @name` for all eight declarations elaborated, and each type was compared with its README statement:
- The five theorems now show `[Finite K]` and `[MOD Nat.card K]`; the affine theorem also shows `[Finite σ]` and `< Nat.card σ`.
- Every other binder survives: both `IsProper` instances and `f ≫ πY = πX`; homogeneity, `1 ≤ d j` and `∑ d j ≤ n`; both `IsThetaDivisor` hypotheses; `X.Over`, `IsProjectiveOver K`, `Smooth`, `GeometricallyConnected` and `UniversallyCH0Trivial`.
- `IsThetaDivisor`, `zeroCycleDegree` and `UniversallyCH0Trivial` are unchanged; the explicit `[IsProper π]` is kept.

All eight names appear in the README.

**Dependency check.** Exact output:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The one new edge is the PrismaticCohomology contract.

**Internal order.** A parse of every `*Needs:*` line of §§0.1–6.14 finds no forward edges and no cycles. Before this round it found 0.2 → 0.8 and 4.3 → 4.4, and the route of §0.1 cited §0.7.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result / change |
| --- | --- | --- | --- |
| §0.1 surjective-tower criterion | X = Spec F_p, I = O; I = 0; tower pⁿℤ_p with inclusions | ℤ/pⁿ, lim ℤ_p, lim¹ 0; zero tower, lim 0; inclusions not surjective, lim 0, lim¹ = ℤ_p/ℤ ≠ 0 | Surjectivity is needed and stated. |
| §0.8 rationalizations agree | P¹; supersingular E; ⊕ℤ/pⁿ on a point | H¹ = 0 in both conventions; H¹ = W(k)² ≠ 0 in both; tensor 0 but isogeny ≠ 0 | The last cannot occur for proper X (bounded torsion); it stays as the §0.2 Check. |
| §0.2 after removal | ⊕ℤ/pⁿ; ℤ/3 at p = 2 | tensor 0, q ≠ 0; ℤ/3 ∈ T(X), no 2-power kills it | Unchanged; Needs no longer contain §0.8. |
| §3.1 cutoff and exactness | E = 0; F = σ; F = pσ; 0 → K(σ) → K(σ)⊕K(pσ) → K(pσ) → 0; ordinary P₁ | 0; E^{<1} = E; E^{<1} = 0; slope 0: K → K → 0, slope 1: 0 → K → K; P^{<1} = 1 − αt | Pass. |
| §3.2 augmentation compatibility | Spec F_p ⊂ Spf ℤ_p, F = id; A = ℤ_p[t], φ(t) = t^p | ℤ/pⁿ → ℤ/pⁿ is the identity, then to F_p: 1 ↦ 1, p ↦ 0; rational: ℚ_p → ℚ_p is the identity, O_X ⊗ ℚ = 0; s_φ(t) = [t], first component t | The integral statement holds; the deleted rational claim fails. |
| §4.1 (1) canonical sheaf | Spec k; smooth curve; P¹; two planes in A⁴; cone over an abelian surface | k; Ω¹; H^{−1}(O(−2)[1]) = O(−2); π^!k not concentrated; normal, non-CM since h¹(O_A) = 2, H^{−3} exists | Defined for all X; §2.20 used only for CM X. |
| §4.3 supported Chow groups | Φ = {∅}; all closed; P¹ with support {∞} | 0; CH(T); ℤ mapping to the degree-1 generator | Pass (moved from §4.4). |
| §4.6 (iii) | Point inclusion Spec k → P¹ (degree 1); P¹×{x} (degree 0); {x}×P¹; {x} ⊂ P¹×Spec k (degree 0, over a source point) | 1 ↦ ĉl(x), trace 1, target-WO projection 0; H⁰(WO) → 0; kills H¹(WO), H⁰(WΩ¹), H¹(WΩ¹), not H⁰(WO); kills H¹(WΩ¹), keeps 1 ↦ 1 on WO | Degree-zero restriction needed for WO; the Wω assertion is degree-free. |
| §5.12 (ii) | P¹ → Spec k (r = 1); identity of smooth Y (r = 0); P^n_Y → Y; P² → Spec k | H⁰(Wω) = 0 = H^{−1}, H¹ = W(k)_ℚ = H⁰(WS₀); Wω_Y = H⁰(WS_d); R^n = Wω_Y(−n), others 0; H² = W(k), H⁰ = H¹ = 0 | The shifted form passes; the unshifted form gives W(k)_ℚ ≅ 0. |
| §5.12 (i) | P¹ → Spec k; P^n_Y → Y | H¹(P¹, WO) = 0 = H¹(WS₀); R^{>0}f_*WO = 0 | Pass (unchanged). |
| §5.12 hypotheses | f not dominant | X_η = ∅, CH₀ ⊗ ℚ = 0 ≠ ℚ | Excluded, so r = dim X_η ≥ 0. |
| §6.9 API | E with Θ = P; O(−P); 2P; translate by a; dim A = 0 | deg 1, h⁰ = 1; h⁰ = 0, not ample; h⁰ = 2 (excluded); 1 = 1 point; unit ideal, h⁰ = 1, 0 = 0 points | Pass. |
| §6.14 negative control | y² = x³ + x + 1 / F₅; y² = x³ − x / F₃ | 2, 0, 2, 2, 2, plus ∞ gives 9 ≡ 4; 3 + 1 = 4 ≡ 1 | Ordinary curve fails the congruence; supersingular satisfies it but not the hypothesis. |
| R05 refinement | P¹_X → X; finite affine cover | identity open, then proper P¹_X → X; the cover, then id_X | Matches PrismaticCohomology §2.0's Checks. |
| Lean `[Finite K]` forms | K = F₂, n = r = 0; σ empty; σ = Fin 1 with f = X; no equations, m ≥ 1 | 1 ≡ 1 mod 2; 0 < 0 false (vacuous); 1 < 1 false; q^m divisible by q | Pass; `Nat.card K` ≥ 2 for a field. |

## Ownership and citations

- **Heads read for this round** (`roadmaps show`): CrystallineCohomology (open), ArcTopologyAndDescent (open), PrismaticCohomology (open), and SchemeAndStackFoundations §§2.20–2.21 on main.
- **Ownership.** This round adds no construction. Two duplicate API obligations were removed and their owners cited (R06). No other roadmap cites this package's sections. No Lean name changed.
- **Sources.** No new text was needed and `needs-references.toml` was not written. In `sources.toml`, CR12's locator now includes §2.4 (for Lemma 2.4.3) and CR11's `cited_for` adds §4.4.
- **Suspicious text.** None was found in the review or the supplier texts.

## For the maintainer

- `design/plan.json` node texts and the plan summary still mention `gap:h-descent-formalism` (lines near 1502, 1507, 1521, 4954, and the summary). This round could only edit the top-level `gaps` list, so the entry was removed there and the README no longer uses the slug.
- **Source error in CR12**, Theorem 4.8.1 and Proposition 4.8.4, pp. 96–98: the Wω half drops the relative-dimension shift. The README states the corrected form and says why in one sentence at §5.12.
- **New supplier edge:** PrismaticCohomology §2.0 (earlier in the merge order).
