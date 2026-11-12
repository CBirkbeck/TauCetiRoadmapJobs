# FIX-DESIGN-EllipticCurveModularityTotallyReal~3

The review has four findings. I checked each against the cached sources, the roadmaps concerned (at main or at their open heads, read with `roadmaps show`) and the pinned libraries. All four are correct.
- F02, F03 and F04 are applied as asked.
- F01 is applied differently. The repair is the one the review asks for: drop the owned construction and declare an upstream supplier gap. The supplier differs: the gap is placed at ComplexMultiplicationAndExplicitReciprocity rather than ShimuraVarieties, for the reasons below.

Files edited:
- `packages/EllipticCurveModularityTotallyReal/design/README.md`
- `packages/EllipticCurveModularityTotallyReal/design/plan.json`
- `packages/EllipticCurveModularityTotallyReal/sources.toml`

This is the design stage, so there is no `Suggested.lean`. Nothing was elaborated, and the `#check @name` pass does not apply. The Tau Ceti declarations newly named in the README were read in the source files at the pin (`2fd255d9`).

## F01 (P2) — applied differently

**Verified.** The general field-of-definition statement had more than one owner:
- AdelicImagesAndModularCurves §3.4 states the criterion that all endomorphisms are K-rational exactly when the CM field lies in K, by the same differential argument.
- EllipticCurveModularityImaginaryQuadratic §8.6 asserts "the endomorphisms are defined over KM" with no supplier.
- CMRankZeroConverse already asks ComplexMultiplicationAndExplicitReciprocity for its special case, `gap:cube-sum-full-cm`: j = 0 over a field containing ζ₃.
- At the pin, Tau Ceti has `WeierstrassCurve.GeometricEnd` and differential pullback, but no Galois action on geometric endomorphisms (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean`, `.../Hom/Differential.lean`).

**Change.** Old: §4.3 proved the `[·]` field statement for every number field K; the scope listed it as owned. New: §4.3 consumes `gap:cm-elliptic-endomorphism-field`, placed at ComplexMultiplicationAndExplicitReciprocity, Layer 1, a section before §1.1, stated over every characteristic-zero field. The supporting argument appears in the contract as a route only. The plan has the gap entry, the supplier entry and the 4.3 prerequisite.

**Why not ShimuraVarieties §5.3.** Its §5.3 works over ℂ and has no Galois action. Placing the gap there would leave the same object with two suppliers, because the j = 0 case already sits at ComplexMultiplicationAndExplicitReciprocity. That roadmap also already uses the Galois-equivariant Lie-scalar identification without an owner (§1.1 proof; §4.2 "Unramified CM residual Cartan normalizer"), and it imports EllipticCurves Layers 1–5.

**Merge order.** Both candidates (positions 106 and 168) come before EllipticCurveModularityImaginaryQuadratic (195). Its §8.6 can therefore cite the same contract, and so can AdelicImagesAndModularCurves (357).

**Why not cite AdelicImagesAndModularCurves §3.4 directly.** That would place this design after position 357. Its downstream consumers ModularityAndLanglandsExtensions (196) and its Part II (284) would then sit above it in the order.

## F02 (P3) — applied

Verified. For k = ℚ(ζ₃) and n = 3, M = L, so induction has rank 2 and the rotations are already L-rational. For n = 45, d = 3, the degree is 15.

Changes:
- §1.3 Check: "rank four" becomes `W_θ ⊕ W_θ⊗δ`, of rank `2[M:L]`: four for δ nontrivial, two at M = L (positive control).
- §1.2 rotation-cocycle Check: now prefixed "δ nontrivial", with a trivial-δ remark.
- §1.6 Check: "3 or p" becomes `n/d` (and n for `B^δ_t`), with values 15, p and 3.
- Plan tests "induction", "rotation cocycle fails" and "rational only" are updated to match.
- Same pattern, also repaired: the §1.2 matrix-witness Check (it presumes some g with δ(g) = −1) and the trivial-character Check, in both README and plan.

## F03 (P3) — applied

Verified. Over ℚ, the determinant mod 3 is surjective, so the arithmetic monodromy is `GL₂(𝔽₃)` (order 48). It acts transitively, and the smooth connected P is integral but not geometrically integral.

Change. Old: "not an integral Hilbert datum". New:
- P has two geometric components (one per Weil-pairing value).
- If ζ₃ ∉ K, P is integral and `P₀ = P`. If ζ₃ ∈ K, P has two K-components of degree 24.
- Hilbert irreducibility needs integrality over K only.

The §2.3 proof sketch now says "(all of P when ζ₃ ∉ K)". The plan test "all frames" is updated.

## F04 (P3) — applied

Verified. At p = 2, `2y = 0`. The native denominator is `2y + a₁x + a₃` (`WeierstrassCurve.Affine.invariantDifferentialDenom`, `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:77`).

Change. Old: "over 𝔽_p … `dx/(2y)` … `= 0`". New, for p = 2 and p = 3:
- The general differential is `dx/(2y+a₁x+a₃)`.
- Over 𝔽₂, `y²+y=x³` has Δ = −27 ≡ 1 and ω = dx, and Frobenius gives `d(x²) = 0`.
- Over 𝔽₃, `y²=x³−x` has Δ = 64 ≡ 1, and Frobenius gives `d(x³)/(2y³) = 0`.
- `dx/(2y)` is meaningless in characteristic 2.

The Check now illustrates the char-0 hypothesis of the imported contract. The plan test "characteristic p" is updated.

## Checks run

Dependency check: the exact command from the brief, run on the final files. Full output:

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2151 edges, 0 problem(s)
```

- There is no UPWARD and no CYCLE line.
- The one new edge (2150 → 2151) is to ComplexMultiplicationAndExplicitReciprocity, position 168. The placement after EllipticCurveModularityImaginaryQuadratic is unchanged.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The tool did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this host"). I checked the four new Tau Ceti names in the source files at the pin instead:
  - `TauCeti.Isogeny.Hom.pullbackDifferential`, `TauCeti.Isogeny.Hom.pullbackDifferential_comp` and `TauCeti.Isogeny.Hom.pullbackDifferential_add_invariantDifferential`: `.../Isogeny/Hom/Differential.lean:79`, `:102` and `:137`, namespace `TauCeti.Isogeny.Hom`.
  - `WeierstrassCurve.Affine.invariantDifferentialDenom`: `.../Affine/InvariantDifferential.lean:77`.
- Gate failures: none were listed in the brief.
- `plan.json` parses, and `sources.toml` parses.
- Every gap slug occurs in its README "What … must provide" line, in its consuming *Needs:* line, and in the plan's `gaps` and `prerequisites`.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Gap: `[·]` is an injective ring hom | `y²=x³−x`/ℚ, `[i]`, `[−1]` | `[i]^*(dx/2y) = d(−x)/(2iy) = i·ω`; `[−1]^*ω = −ω`; `[[i]]² = −1 = [[−1]]` | Holds; multiplicative because the target is commutative |
| Gap: `[ᵍα] = g([α])` | c on `[i]`; g with g(ζ₃) = ζ₃² on `[ζ₃](x,y) = (ζ₃x,y)` of `y²=x³+1` | `ᶜ[i] = [−i]`, c(i) = −i; `[[ζ₃]] = ζ₃`, `ᵍ[ζ₃] = [ζ₃²]` | Holds; `|Gal(KT/K)| ≤ 2`, so g vs g⁻¹ is immaterial (stated in the contract) |
| Gap: kernel = `G_{KT}` | K = ℚ, ℚ(√2), ℚ(i); `y²=x³+1` over ℚ(i) | `G_{ℚ(i)}`, `G_{ℚ(ζ₈)}`, `G_K`; KT = ℚ(ζ₁₂), index 2 | Matches the review's repair test and the §8.6 Checks |
| Gap: char 0 needed | 𝔽₂: `y²+y=x³`; 𝔽₃: `y²=x³−x` | Δ = −27 ≡ 1 (mod 2), 3 points, `Frob^*dx = 0`; Δ = 64 ≡ 1 (mod 3), 4 points, `Frob^*ω = 0` | Hypothesis kept; negative control is the §4.3 Check |
| Gap: degenerate End = ℤ | non-CM curve | T would be ℚ, KT = K | Excluded by the "order in imaginary quadratic field" hypothesis |
| §4.3: T ⊄ K, `[KT:K] = 2` | K = ℚ, ℚ(√2) | T imaginary, K real: no embedding; KT = ℚ(i), ℚ(ζ₈) | Holds; traces `a₃ = 0` (4 pts over 𝔽₃), `a₅ = −2` (8 pts), `x³+1` at 5: 6 pts, `a₅ = 0` |
| §1.3 induction Check | k = ℚ, n = 3; k = ℚ(√−3), n = 3 | `[M:L] = 2` → rank 4; `[M:L] = 1` → rank 2 | Restated as `2[M:L]` |
| §1.2 matrix witness | R, W | `WRW = [[−1,1],[−1,0]] = R²`, `R³ = I`, `WR²W = R` | Holds; now guarded by δ(g) = −1 |
| §1.2 rotation cocycle | δ trivial vs δ(Frob₂) = −1 (k = ℚ, n = 3) | Rotations commute: `u_c u_{ζ⁻¹} u_c⁻¹ = u_{ζ⁻¹} ≠ u_ζ` | Guarded by "δ nontrivial" |
| §1.6 pullback–norm | n = 45, d = 3; n = 303, d = 3, 101; d = 1 | 15; 101, 3; n | Restated as `n/d` |
| §2.3 frames Check | K = ℚ; K = ℚ(√−3) | `|GL₂(𝔽₃)| = 48`, `|SL₂(𝔽₃)| = 24`; 1 vs 2 K-components | Corrected; the proof sketch is unchanged except "P₀ = P when ζ₃ ∉ K" |

## Notes for the maintainer

- **Ownership of the CM endomorphism field.** No roadmap name cited elsewhere changed. AdelicImagesAndModularCurves §3.4, EllipticCurveModularityImaginaryQuadratic §8.6 and CMRankZeroConverse (`gap:cube-sum-full-cm`) can all cite the one contract `gap:cm-elliptic-endomorphism-field` at ComplexMultiplicationAndExplicitReciprocity Layer 1. The later AdelicImagesAndModularCurves is not named in this README, to keep its prose free of edges to later roadmaps; this relocation is recorded here and in the plan's gap detail.
- **Ownership search.** I searched by object (Galois action on geometric CM endomorphisms, the differential embedding, the endomorphism field), using `roadmaps grep` over main and all 439 open heads, and the pinned libraries. The hits were:
  - AdelicImagesAndModularCurves §3.4 and EllipticCurveModularityImaginaryQuadratic §8.6, as above.
  - AbelianSchemesAndArithmeticModuli A6.20, which covers only the n-torsion field.
  - SatoTateGroups, which has a bibliography mention only.
  - ArithmeticStatisticsPartVII, which assumes the endomorphisms are defined.
- **Not checked.** The board package LawrenceVenkateshMethod was not consulted; its objects are unrelated.
- **Supplier contracts.** EllipticCurves Layer 1 is no longer a route input here. It moved into the new contract's route, and it is dropped from this roadmap's EllipticCurves contract and plan supplier entry.
- **Sources.** No fetch was needed, and `needs-references.toml` was not created. Manifest edits to OpenAI26:
  - The locator "Section 9.4 p.27" becomes "pp.27-28".
  - A `cited_for` entry was added for the new contract.
- **Untrusted text.** The review and the fetched roadmaps contained no instruction to run commands or change the workflow.
