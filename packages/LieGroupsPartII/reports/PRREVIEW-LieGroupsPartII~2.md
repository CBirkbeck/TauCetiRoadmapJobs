# Review of LieGroupsPartII (pull request #2427 at e515f2a)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: `README.md:90` cites `lieExp`, `TauCeti.Lie.Ad`, `TauCeti.Lie.conj_lieExp`, `LeftInvariantDerivation.Ad_lieExp`, `lieMap`, `TauCeti.Lie.lieSubalgebraOfSubgroup` and `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` at their Tau Ceti files. No *Needs:* or Dependencies line cites LieGroups Layers 0–3.
- R02 — repaired: `README.md:528` reads "(Knapp 2002, Ch. VII §2, and Wallach 1988, Ch. 2 §2.2, for data whose components fix `V`; the general case by the averaging argument below)". `Suggested.lean:359–361` makes the same restriction.
- R03 — repaired: the description now has "Dependencies. The Lean imports no roadmap; the README consumes the following." with the list. It records that RealSemisimpleLieGroups §§2.3, 2.4, 3.1, 4.5 cite AutomorphicFormsOnReductiveGroups §2.3a, and says this roadmap only names AutomorphicFormsOnReductiveGroups and does not consume it.

## Verified sound

| Target | Instances tried | Statement side | Values computed | Result |
|---|---|---|---|---|
| `positiveCharacterKernel_mul_exp` (docstring changed, R02) | swap group `D ⋊ ⟨w⟩ ⊂ GL₂(ℝ)`, `D` diagonal, `w = ((0,1),(1,0))` | unique `g = l·exp X`, `l ∈ ⁰G`, `X ∈ F` | `V` = diagonals, `F = ℝ·1`, `⁰G = {|det| = 1}`; `diag(e³,e) = diag(e,e⁻¹)·exp(2·1)`. Over `V`, every `x + y = 4` factors `diag(e³,e)`, so uniqueness fails | holds; only `F` splits off |
| same, Knapp/Wallach scope | `GL₂(ℝ)`; `O(1,1)`, `Y = ((0,1),(1,0))`, `d = diag(1,−1)` | the cited class has components fixing `V`, so `F = V` | `GL₂`: `F = V = ℝ·1`, `diag(−e²,1) = diag(−e,e⁻¹)·exp(1·1)`. `O(1,1)`: `dYd⁻¹ = −Y`, `F = 0`, `⁰G = G` | holds; `O(1,1)` is outside the cited class |
| §5.1 locator scope (R02) | swap group as `L` | `Lie(⁰L) = [𝔩,𝔩] ⊕ (𝔷(𝔩) ∩ 𝔨_L) ⊕ V₀` | `[𝔩,𝔩] = 0`, `𝔷 ∩ 𝔨 = 0`, `V₀ = ℝ·diag(1,−1)`, which is `Lie({|det| = 1} ∩ D)` | holds |
| §4.1 through `TauCeti.Lie.mem_lieSubalgebraOfSubgroup` | `SL₂`, `H₀ = diag(1,−1)`, `g = ((0,−1),(1,0))`, `g = ((1,0),(1,1))` | `lieExp(tH₀)` fixes `gP` iff `Ad(g⁻¹)H₀ ∈ Lie(P)`, for closed `P` | `Ad(w⁻¹)H₀ = −H₀ ∈ Lie(P)`; `g⁻¹H₀g = ((1,0),(−2,−1)) ∉ Lie(P)`. Fixed points are `P` and `wP`, and `|W_G| = 2` | holds |
| §1.1 through `LeftInvariantDerivation.Ad_lieExp` | `𝔰𝔩₂`, `B = tr(YZ)`, `X = H`, `Y = E`, `Z = F` | differentiating `B(Ad(e^{tX})Y, Ad(e^{tX})Z)` at `0` gives `ad`-invariance | `B(e^{2t}E, e^{−2t}F) = 1` for all `t`; `B([H,E],F) + B(E,[H,F]) = 2 − 2 = 0` | holds |
| §2.5 through `TauCeti.Lie.IsMaximalTorus.eq_lieSubalgebraOfSubgroup_of_isLieAbelian` | `SO(3)`, `T` = rotations about `z`; `G = ℝ` | `Lie(T)` is maximal abelian, under `[CompactSpace G]` | `[L_z, aL_x + bL_y] = aL_y − bL_x ≠ 0` unless `a = b = 0`. For `ℝ`: maximal torus `{0}`, and `0 ⊊ ℝ` is abelian | holds; compactness is needed and is applied to `M⁰` |
| §§3.2, 7.1 through `TauCeti.Lie.conj_lieExp`, `lieExp_eq_expUnit`, `TauCeti.Lie.unitsLieAlgebraEquiv_Ad` | `GL₂`, `g = diag(2,1)`, `X = E₁₂`; `X = (π/2)·((0,−1),(1,0))` | `g·lieExp X·g⁻¹ = lieExp(Ad g X)`, `Ad g X = gXg⁻¹`, `lieExp = exp` | `gE₁₂g⁻¹ = 2E₁₂`; `g·exp(E₁₂)·g⁻¹ = ((1,2),(0,1)) = exp(2E₁₂)`; `exp((π/2)J) = J` | holds |

The rows for the statements this change leaves untouched stand as in the previous review, of `aa066e2`.

- **Newly cited Tau Ceti declarations: all 18 elaborate by `#check` at the pin, with the hypotheses the README states.** They are in `Exponential/Basic.lean:140, 187`, `Adjoint/Derivation.lean:62`, `Adjoint/Exponential/Basic.lean:110`, `Adjoint/Exponential/Formula.lean:292, 353`, `Functor.lean:184, 315`, `Subgroup/LieAlgebra.lean:277, 318`, `Subgroup/Embedded.lean:157`, `Exponential/Units/Compatibility.lean:125` and `Adjoint/Units/Basic.lean:160`. `Subgroup/Torus.lean:337` carries `[CompactSpace G]`, and `mem_lieSubalgebraOfSubgroup` carries `IsClosed`.
- **Cross-roadmap citations resolved: 19.**
  - LieGroups (main): `isConj_of_isMaximalTorus` and `weylGroup` (`Suggested.lean:266, 286`), Layers 6, 7 and 9.
  - RealSemisimpleLieGroups at the head of #2229: §§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5 and 5.4.
  - AutomorphicFormsOnReductiveGroups §2.3a, cited in RealSemisimpleLieGroups §§2.3, 2.4, 3.1 and 4.5.
  - No LieGroups Layer 0–3 citation remains.
- **Gate: every check OK at e515f2a.** Depcheck: `depcheck: 245 roadmaps, 2296 edges, 0 problem(s)`.
- **Elaboration of `Suggested.lean`: 13 `sorry` warnings and nothing else.** All 26 `#check @` types are unchanged, since no Lean statement changed. The one-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) fails on `positiveCharacterKernel_mul_exp`.
- **Source locators in the changed passages: 2** (README §5.1 and the `positiveCharacterKernel_mul_exp` docstring). Both point to knapp2002 and wallach1988, which are uncertified and unread.
- **Remark on untouched text, no change asked.** The clause "Layer 7: the complexification `𝔤 ⊗_ℝ ℂ`" (`README.md:108`) is carried over verbatim. The bare carrier it names is Mathlib's `LieAlgebra.ExtendScalars.instLieAlgebra` (`Mathlib/Algebra/Lie/BaseChange.lean:108`).

Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, SurfaceGroupCharacterVarieties, BallQuotientsAndComplexHyperbolicLattices, ShimuraData, LieGroups, FlagVarieties and ReductiveGroups.
- **`P = MAN`:** AutomorphicFormsOnReductiveGroups §2.3a owns it for real points, and RealSemisimpleLieGroups §3.1 for connected groups with finite centre.
- **Conjugate parabolics and the Bruhat decomposition:** FlagVarieties §2.3 and ReductiveGroups Layer 7 own them for algebraic groups.
- **Here:** the variants for every datum and for any Tits system, as before.
- **SurfaceGroupCharacterVarieties** consumes §§7.1 and 8.1, which this change leaves unaltered.
- **Nothing is shared** with BallQuotientsAndComplexHyperbolicLattices or ShimuraData.

Source independence: changed passages only. Two changed passages carry locators, both to knapp2002 and wallach1988, which are uncertified and unread, so their wording could not be compared. The rest of the 63 changed lines are citations of Tau Ceti declarations, not source text. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share is knapp2002, 22 of 41 README locators, unchanged.

## Not verifiable

- knapp2002 Ch. VII §2 and wallach1988 Ch. 2 §2.2: the restriction "for data whose components fix `V`" (README §5.1; `Suggested.lean:359`). Both are settled as uncertified and have no text in the sources cache.
- knapp2002, warner1972 and bourbaki-lie4-6 locators of the sampled targets 2.4, 2.5, 3.1–3.4, 4.2, 6.3 and 7.1, whose *Needs:* lines changed: all settled as uncertified, with no text.

## Source issues

- none

## For the human reviewers

- Not tested: knapp2002 supplies 22 of 41 README locators and is uncertified and unread. Wording (part 1) was not compared with it, and contents (part 2) only against the section titles the README cites.
- Not tested: warner1972, wallach1988 and bourbaki-lie4-6 (11 locators) are also uncertified and unread, so the README's wording was not compared with them. This includes the new Knapp/Wallach scope clauses in README §5.1 and `Suggested.lean:359`.
