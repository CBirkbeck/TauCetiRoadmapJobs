# FIX-PKG-ShimuraVarietiesPartII~6

Review settled: `REV-PKG-ShimuraVarietiesPartII~5` (two findings, F01 P1 and F02 P3). Only `packages/ShimuraVarietiesPartII/README.md` changed (4 lines). `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P1) — applied

**Verified.** The standing convention (Conventions, paragraph on abelian fibres over F_q) writes F_D=ρ∨(δ)σ in a dual tensor frame. Take G=G_m acting on V by the identity character and δ=ζ, with ζ the Teichmüller unit of order 24 in W(F₂₅) and σ(ζ)=ζ⁵. Then ρ∨(δ)=ζ⁻¹, F_D²=ζ⁻¹·ζ⁻⁵=ζ⁻⁶=ζ¹⁸. The group norm is δσ(δ)=ζ⁶. These differ by ζ¹²=−1. So the old Check's claim that "the length-2 norm ζ⁶ is the crystalline linear F₂₅-Frobenius" was wrong.

**Change** (Conventions, third Check): old: "δ=ζ … the length-2 norm ζ⁶ is the crystalline linear F₂₅-Frobenius". New: δ=ζ is the standard element of G_m (identity character). Its group norm is ζ⁶ and realizes γ_x on V. F_D=ζ⁻¹σ, so the crystalline linear Frobenius is ρ∨(ζ⁶)=ζ⁻⁶=ζ¹⁸ and realizes π_x on D. The two differ by ζ¹²=−1. This agrees with §4.9's Check applied to δ_D=ζ⁻¹. The elliptic sentence is kept.

**Pattern.** I searched every place where a group element is identified with its crystalline matrix (`δ`, `δ_D`, `ρ∨`, `b_x`, `N_(rm₀)`, "crystalline linear"):
- Conventions paragraph (line 29), §4.9 Construction, API and both δ_D Checks (ζ, and [[0,−1],[5,0]]): these are consistent. In §4.9, δ_D=ζ gives crystalline ζ⁶ and standard ζ⁻⁶. In the GL₂ Check, δ_D²=−5 and (δ_D⁻ᵀ)²=−1/5.
- §4.1 Construction (ρ∨(b_x)σ) is consistent. Its first Check said "slopes {0,1} in the standard contravariant realization". That can be read as describing b_x in the standard representation, where the slopes are {0,−1}. I made it explicit: the slopes are {0,1} on D, whose Frobenius is ρ∨(b_x)σ, and hence {0,−1} for b_x in the standard representation. This matches the Conventions Check (intrinsic GL₂ ordinary slopes (0,−1)).

## F02 (P3) — applied

**Verified.** GL₀ is the trivial group. Its cocharacter and coroot lattices are both 0, so π₁(GL₀)=0, not ℤ. Its H¹ is still trivial, so the framing conclusion m₀=1 survives. The supplier PadicHodgeTheory §5.5 restricts the ℤ computation to n≥1 in the same way and treats GL₀ as trivial.

**Change** (§4.9, norm-one-torus Check): old: "For GL_n and GSp_(2g), π₁ is Z …". New: "For GL_n with n≥1 and GSp_(2g) with g≥1, π₁ is Z …". I added the boundary control: for GL₀=1 both lattices are 0, so π₁=0; H¹(Q_q,G) is still trivial and m₀=1.

**Pattern.** The §2 Examples paragraph also said "For GSp_(2g), Z_G^c=μ₂" with no rank restriction. For g=0 the similitude group degenerates (to G_m or to 1, depending on convention), and neither has Z_G^c=μ₂. I added "g≥1" there, which matches the §2.1 Check that already has it. Line 1298 (GL_n characteristic-polynomial coordinates) also holds at n=0: det(T−g)=1 and (−1)⁰det(g)=1≠0. It needed no change.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions Check, G_m norm (new text) | ζ of order 24 in W(F₂₅), σ(ζ)=ζ⁵, δ=ζ, r=2, m₀=1 | Norm exponent 1+5=6. Dual exponent −1−5=−6≡18 mod 24. Plain square exponent 2. Ratio ζ⁶/ζ¹⁸=ζ¹²=−1≠1. Check: γ_x=ζ⁶ on V and π_x=ζ⁻⁶ on D, so γ_x=π_x⁻¹ holds. | Correct; replaces the false identification |
| Same, compared with §4.9 Check | δ_D=ζ there, so δ=ζ⁻¹ | §4.9: crystalline ζ⁶, standard ζ⁻⁶. With ζ↦ζ⁻¹: crystalline ζ⁻⁶, standard ζ⁶. This equals the new Conventions Check. | Consistent |
| Same, elliptic tail (unchanged, recomputed) | E: y²=x³+x over F₂₅ | H¹: α+β=2, αβ=5. α²+β²=4−10=−6 and α²β²=25, giving T²+6T+25. Tower: sum −6/25, product 1/25, giving T²+(6/25)T+1/25. | Kept |
| Hilbert 90 framing for G_m | H¹(Q₂₅,G_m) | 1 | m₀=1 kept |
| §4.1 Check (clarified) | Ordinary and supersingular elliptic fibres | D: slopes (0,1), so b_x on V has slopes (0,−1) (contragredient negates). μ_h on H₁ is diag(z,1), so μ_h⁻¹ has exponents (−1,0) and average (0,−1). Supersingular: D slopes (1/2,1/2), b_x slopes (−1/2,−1/2). | Consistent with §4.2 (b_x∈B(G,{μ_h⁻¹})) and the Conventions Check |
| §4.9 π₁ Check, n≥1 | GL₁, GL₂, GSp₂, GSp₄ | GL_n: ℤⁿ modulo the sum-zero coroot lattice is ℤ, coinvariants ℤ, torsion 0. GSp_(2g): Sp_(2g) is simply connected, so π₁ is X_*(G_m)=ℤ via the multiplier, torsion 0. | H¹=1, m₀=1 |
| §4.9 π₁ Check, boundary | GL₀=1 | X_*=0, coroots 0, π₁=0, torsion 0, H¹=1 | Added as control |
| Same, negative control (unchanged) | Norm-one torus of Q₂₅/Q₅, N(z)=5 | v₅(N(z))=2v(z) is even, but v₅(5)=1. Over Q₂₅, uv=5 has the point (5,1). | Kept |
| §2 Examples, GSp centre | g=1 (GSp₂=GL₂), g=2 | Centre G_m, so Z_G^c=μ₂ (order 2, dimension 0), not a torus. | g≥1 added |

## Checks run

- `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean` (run from the content checkout): **exit 0, no output**. No Tau Ceti module had to be built. The file is unchanged and has 0 declarations. So the mechanical `#check @name` comparison has nothing to compare (0 own signatures), and no signature changed.
- Dependency check (`gate --depcheck … --movable`): exit 0, output exactly:

```text
depcheck: 245 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Notes for the maintainer

- No Lean names, section numbers, target ids or supplier gaps changed. Other roadmaps' citations are unaffected.
- No new citations or sources were added. The `gaps` list in `design/plan.json` is unchanged. Nothing was added to `needs-references.toml`.
- Ownership: no new construction was introduced. The edits are corrections to existing Checks only.
- The review's "Source issues" list (misprints in KZ, HT and KP) and its verification tables raise no finding. The README already handles each of those source issues, so nothing was changed for them.
