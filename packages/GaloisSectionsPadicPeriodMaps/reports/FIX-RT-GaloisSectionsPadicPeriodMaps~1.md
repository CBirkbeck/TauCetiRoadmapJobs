# Repair report: red-team round 1 of GaloisSectionsPadicPeriodMaps

There were two reviews. The first six headings, F01–F06, are the findings of review r1a; the last three headings, F01–F03 again, are the findings of review r1b, in that order (r1b.F01, r1b.F02, r1b.F03). Findings r1a.F04 and r1b.F01 describe the same defect. Both are settled by one repair, and each still has its own section below. Only `packages/GaloisSectionsPadicPeriodMaps/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged, and no gap was added.

## F01 (P1) — applied

The witness holds. Take K = ℚ(√5, ζ₁₁+ζ₁₁⁻¹). At every place, 5 and 11 both divide q_v(q_v²−1). So q = 11 fails (2) and q = 23 fails (2°) at every place. bs line 2801 gives no field. §8.6 (III) changed from "for g = 3 the least q … is 23 … allow q = 11" to "for curves of genus 3 over ℚ … not asserted for an arbitrary number field". Two Checks were added: the ℚ computation (exclusion list 3, 7, 11, 19 and the (3°)/(3) values) and the K-witness. §6.6 was already restricted to ℚ.

## F02 (P2) — applied

The witness holds. InverseGaloisAndArithmeticFundamentalGroups §IG.0.3 (lines 792–807 of its README) has three parts:
- integral local systems correspond to finite free ℤₚ-representations;
- the isogeny category corresponds to ℚₚ-representations;
- the comparison with all rational local systems needs a normal Noetherian base.

Changes:
- The supplier contract now names the integral and isogeny categories and says the normal Noetherian comparison is not used.
- §1.1: the category is now the isogeny category on a connected scheme.
- §1.3: the justification was "Y normal and connected, so ℚₚ-local systems are representations". It now goes through the lisse ℤₚ-lattice (R^iπ_*ℤ/pⁿ)ₙ given by smooth proper base change, plus a negative control (the nodal line with monodromy p).
- §1.5: 𝕃 is now an object of the isogeny category.

The family construction keeps its generality.

## F03 (P3) — applied

In §1.4, the bullets "pair of κ(y) is the fibre pair" and "conjugate sections give isomorphic pairs" repeated the API. They were replaced by the two Checks the reviewer proposed:
- the family E×E → E → E with multiplication by 2, for E: y²=x³−x;
- at 0: dim `A_s^{G_ℚ}` = 4;
- at P = (0,0): dim `A_s^{G_ℚ}` = 2.

I recomputed the values. x(2Q) = (x²+1)²/(4x(x²−1)) vanishes at x = ±i. (1−i)² = −2i = i³−i, and (1+i)² = 2i = (−i)³+i. Complex conjugation swaps the points in two pairs.

## F04 (P1) — applied differently

The witness holds. At the head of HeightsRationalPointsAndObstructions, §3.17d (its README line 1826) uses modified adeles only for A-torsors and builds no general carrier. A search by object found no general owner: ArithmeticGaloisDuality's "Local torus evaluation and modified adelic points" covers tori only. So the carrier is now this roadmap's target in §0.4, as in r1b.F01, rather than a new gap.

The reasons:
- The carrier is a finite product of Mathlib `ConnectedComponents` quotients, taken on the local topologies HeightsRationalPointsAndObstructions §§2.4, 2.11 already provides.
- This roadmap already owns the f-cov locus built on it.
- A gap would ask another roadmap to plan an object that only this roadmap consumes.

The construction is stated with hypotheses (X smooth projective geometrically connected over a number field), the locator stoll §2 p. 4 (stoll lines 118, 131) and an API bullet (surjective, natural projection). §0.4 already had three Checks: P¹, Spec K, and the elliptic curve with two real components, whose archimedean factor has 2 elements.

The same edit went into Scope, the supplier contract, the §0.4 *Needs* and the Layer 0 Dependencies. Every mention of §3.17d as a supplier is gone. One sentence in Scope says what §3.17d does cover.

## F05 (P3) — applied

- §6.2: the two bullets that repeated the API were replaced by computed Checks:
  - the conic x²+y²+z²=0 at v = 2 has empty locus (a sum of squares mod 4 counts the odd coordinates);
  - for the two-copy constant family, the algebra ℚₚ×ℚₚ has 4 idempotents, while a quadratic field has 2 and so interpolates nothing.
  
  The bullet about dropping the pairing now points to §6.6's separating instance, the nonsquare c.
- §1.7: the Check that restated the projection was deleted.
- §4.5: the Check that restated the diagram was deleted; the content is still in the target text.
- §6.5: the descriptive line became a computed Check, with dimensions (1, 2 dim A₀) and (2, 4 dim A₀).
- §9.3: the definitional line became a computed ℚ(i) Check: (3) and (1+i) are covered, (2±i) are not.

## F06 (P3) — applied

In §1.2, three bullets were replaced: "#Σ = deg", "non-isomorphic fibres" (which named no fibres) and "orbits are closed points". These facts remain as API. The new Checks are:
- split base: E⊔E over Spec(F×F), with dim `(H⁰)^{G_F}` = 2 and dim H¹ = 4;
- non-split base: E′ over Spec L for L/F quadratic, with dim `(H⁰)^{G_F}` = 1 and H¹ = `Ind_{G_L}^{G_F} H¹(E′)`.

The non-split Check notes that it holds for ramified and unramified L and for p = 2.

## F01 (P2) — applied

This is the same defect as r1a.F04, with the same repair: §0.4 now defines `X(A_K)_•` with `ConnectedComponents` and the projection. The projection is surjective and satisfies f_•(P_•) = (f(P))_•. The proof sketch says why f_• exists. All the places the reviewer listed (lines 9, 65, 237, 261) and the Layer 0 Dependencies no longer cite §3.17d.

## F02 (P3) — applied differently

The witness holds: with Y′ = Y⊔Y and relative dimensions 1 and 2, dim V = 6 but 2d₁δ = 4. bs Definition 6.11 (bs line 2472) itself uses dᵢ per component. So I did not narrow to constant relative dimension. Instead §7.1 defines B := `dim_{K_v} H¹_dR(X_{y₀}/K_v) = Σ_j 2d_j[L_{w_j}:K_v]`, the total rank. This equals 2dδ when d is constant, and 2d_i ≤ B always holds.

Where it was applied:
- §7.1 statement and proof paragraph: the integer polynomial has degree dim V = B;
- the inclusion paragraph, which now also carries the witness;
- §7.2.

The δ = 1 Check (B = 2dᵢ) still holds. The bound B in the symplectic-faltings gap is arbitrary, so the gap is unchanged.

## F03 (P3) — applied

HeightsRationalPointsAndObstructions §2.3a is "Function-field models and products of local rings" (its README line 907). The number-field results are §2.4 (`restrictedProductHomeomorph`) and §2.11 (`homeomorph_pi_of_proper`). "§§2.3a, 2.11" became "§§2.4, 2.11" in the supplier contract, in §6.3 *Needs* and in the Layer 6 Dependencies (a third place, not listed by the reviewer).

## Gate failures repaired

- Report headings: each section now starts with the review's own finding id (`## F01 (P1) — …`), not `a.F01`/`b.F01`. The opening paragraph says which headings belong to r1a and which to r1b.
- Formula markup: in README §7.1 (the definition of B) and in the §8.6 (III) Check over ℚ, the subscript and superscript expressions with braces (`Σ_j 2d_j·[L_{w_j} : K_v]` and `q_v·∏_{i≤7}(q_v^i − 1)`) now sit in code spans. The mathematics is unchanged. Expressions of the same kind in this report are also in code spans now.

## Checks run

- Elaboration: `lake env lean packages/GaloisSectionsPadicPeriodMaps/Suggested.lean`, run from the content checkout, printed nothing and reported no errors. The file is unchanged and has 0 declarations, so the `#check @name` comparison has no rows.
- Dependency check: `depcheck: 56 roadmaps, 656 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: "Lean names found nowhere: None."

## Adversarial pass on new or changed statements

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| §0.4 `X(A_K)_•` | P¹/ℚ; Spec K; E/ℚ with two real components | real factor sizes 1, 1, 2; product of one-point sets is a point | holds |
| §0.4 naturality | identity map; constant map X′ → point x | f_• is the identity; the image is the single point (x)_• | holds |
| §1.3 lattice justification | Legendre R¹; nodal line with monodromy p | rank-2 lattice exists; p·pᵃℤₚ ≠ pᵃℤₚ, so no lattice | first included, second excluded |
| §1.2 split vs non-split | F×F base; L/F quadratic base | invariant dimensions 2 and 1; H¹ dimension 4 in both | separated |
| §1.4 [2]-family | sections at 0 and at (0,0) | dim A^G 4 vs 2; dim V 8 vs 8 | not isomorphic |
| §6.2 conic | primitive 2-adic triple | sum mod 4 ∈ {1,2,3}, never 0 | empty locus |
| §6.2 idempotents | ℚₚ×ℚₚ vs `ℚ_{p²}` | 4 vs 2 idempotents | no interpolation |
| §6.5 constant families | Y′ = Y; Y′ = Y⊔Y | (1, 2g) and (2, 4g) for g = dim A₀ | holds |
| §7.1 B | constant d, δ = 2; dims (1,2) over Y⊔Y; δ = 1 | B = 4d; B = 6; B = 2dᵢ | covers every fibre |
| §8.6 (III) over ℚ | q = 3, 7, 11, 19, 23 | (3°) at q=3: 4.07 > 1/6; 7, 11, 19 excluded; at q=23: 0.0031 < 0.0179; (3) at q=11: 0.0163 < 0.0385 | 23 and 11 |
| §8.6 (III) over the witness K | q = 11, 23 | 5 and 11 divide q_v(q_v²−1) at every v | both fail; the scoping is needed |
| §9.3 ℚ(i) Check | (3), (1+i), (2±i) | fixed, fixed, exchanged | 2 covered, 1 pair not |

## For the maintainer

- No name of this roadmap changed; Suggested.lean has no declarations.
- HeightsRationalPointsAndObstructions is not asked to provide anything new: §3.17d is no longer cited as a supplier, and the modified-adele carrier is owned here.
- Ownership was checked by object in the open roadmaps through `roadmaps grep`; the only other modified-adele construction is for tori (ArithmeticGaloisDuality).
- Both reviews also list source issues in bs; these are errata matters, not edits to this package. The README already uses the corrected forms (#Σ_A, T⁻¹ transport, root-degree bound), and §8.6 (III) now carries the field restriction.
- No suspicious instructions were found in the reviews.
