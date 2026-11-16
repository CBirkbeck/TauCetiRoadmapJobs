# FIX-RT-BallQuotientsAndComplexHyperbolicLattices~2

Two red-team reviews: five findings, all P3. All five hold on the mathematics, and all five are repaired. 2a/F01 and 2b/F01 both concern left against right in §5.1. They share one added sentence and get one section each.

## RT-BallQuotientsAndComplexHyperbolicLattices~2a/F01 (P3) — applied

Verified: the supplier uses the right action (its README line 2869 to line 2872), `IsLattice` the left. Added to §5.1: inversion maps left domains s to right domains s⁻¹ and μ to μ ∘ inv, equal to μ by unimodularity, and Γ\G ≅ G/Γ. Plus a "Left against right" Check, the supplier-contract convention and two Lean docstrings (types unchanged).

## RT-BallQuotientsAndComplexHyperbolicLattices~2a/F02 (P3) — applied

Verified: N was both the Heisenberg group and a horoball height. The height is now c at every site: Conventions, §1.5, Layer 2 Examples, §4.2 (horospheres {ρ = c}, {ρ = c′}, distance (1/√2)|log(c′/c)|), the §5.3 Check (H(c), ∫_c^∞), §8.1 (Ω_b(c), Ĝ_b(c), exp(−4πc/τ)), §8.2 and §9.4 (H_b(c)/Γ_b).

## RT-BallQuotientsAndComplexHyperbolicLattices~2b/F01 (P3) — applied

Verified: in S₃ ⊃ {1, s}, representatives {1, r, r²s} of Λ/Γ give overlapping translates; the source's hint (WitteMorris2015 line 2002 to line 2003) uses the right action. §5.1 bullet 2 changed from "F·R, R ⊂ Λ/Γ" to "R·F, R ⊂ Γ\Λ", of measure |R|·μ(F) by left invariance. Added an S₃ Check; the convention sentence is shared with 2a/F01.

## RT-BallQuotientsAndComplexHyperbolicLattices~2b/F02 (P3) — applied

Verified: closedness gives f⁻¹(V) ⊂ U ∪ U′ only when the whole fibre lies in U ∪ U′. §10.5 now takes the whole fibre: k ≥ 2 points of the finite set Y ∖ X_Γ, with pairwise disjoint U_i. Then V ∖ {p} splits into k disjoint open parts, each nonempty because X_Γ is dense. This argument occurs nowhere else.

## RT-BallQuotientsAndComplexHyperbolicLattices~2b/F03 (P3) — applied

Verified: only (a) had a route, and using §10.6 would close a cycle. Added routes. (b) existence: S_Γ = S_Γ₀/(Γ/Γ₀). Uniqueness: (a), quotients in stages (ShimuraVarieties §3.4a), then h: S_Γ → S finite and bijective between normal irreducible varieties, so of degree 1 and an isomorphism. (c) goes through §§7.1–7.2. *Needs:* gains §§5.1, 6.4, 7.1–7.3.

## Checks run

- **Elaboration.** `lake env lean packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean`, run from the content checkout: no errors; seven "declaration uses `sorry`" warnings, at lines 101, 131, 161, 171, 177, 189 and 215 (the seven headlines).
- **Signatures.** A scratch copy with `#check @name` for all 16 declarations was elaborated once. Every type is identical to the signature file of this head: only docstrings changed, and no binder was lost. Each type was compared with its README statement; no difference. The scratch file is deleted.
- **Dependency check.** Output, verbatim:

      depcheck: 234 roadmaps, 2238 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §5.1 conversion sentence | n = 1, Γ = ⟨T_1⟩, F = {0 ≤ Re v < 1}, g = T_(1/10)a_(1/√2); trivial Γ; non-unimodular P_∞ | g·i = 0.1 + 0.5i, g·(1 + i) = 0.6 + 0.5i, both interior to F, so the right translates overlap. (γs)⁻¹ = s⁻¹γ⁻¹, so s⁻¹ tiles on the right. Γg ↦ g⁻¹Γ is well defined: (γg)⁻¹Γ = g⁻¹Γ. On MAN, μ ∘ inv ≠ μ (left da db/a² against right da db/a), so "equals μ" really uses unimodularity. Trivial Γ: infinite on both sides. | holds |
| §5.1 bullet 2 (R·F) | S₃ ⊃ {1, s}; Λ = Γ; Γ = 1 in a finite Λ; 2ℤ ⊂ ℤ ⊂ ℝ; ⟨T_1⟩ ⊂ PSL(2,ℤ) | S₃: {1, r, r²} ⊔ {s, r²s, rs} = S₃, measure 3. Λ = Γ: R·F = F. Γ = 1: R·F = L, measure \|Λ\|μ(F). ℝ: {0, 1} + [0, 1) = [0, 2). Infinite index: \|R\| = ∞ and infinite measure, consistent with ⟨T_1⟩ not being a lattice. | holds |
| Heights renamed to c | §5.3 Check for n = 1, 2; §4.2; §8.1 | n = 1: ∫_c^∞ ρ⁻² dρ = 1/c; n = 2: 1/(2c²). With ω = \|dv\|²/(2y²), the area over ⟨T_1⟩ is 1/(2c), matching §5.1's 1/(2Y). §4.2: ∫_c^{c′} dy/(√2 y) = (1/√2) log(c′/c). §8.1: μ = exp(−4πρ/τ), so ρ > c ⇔ μ < exp(−4πc/τ). | consistent |
| §10.5 injectivity | k = 3; doubled-cusp Y; nodal cubic | k = 3: three nonempty disjoint open parts of a connected set, a contradiction. Doubled cusps: the argument needs disjoint U_i, which this non-Hausdorff Y lacks; this agrees with that Check (six points against three). Nodal cubic: it fails the earlier normality step, as its Check says. | holds |
| §10.4 (b) | Γ = PSL(2,ℤ) with Γ′ the image of Γ(2); torsion-free Γ; the cusp t ↦ (t², t³); z ↦ z² on 𝔾_m | PSL(2,ℤ): S′ = ℙ¹ ∖ {0, 1, ∞}, F = S₃, S′/F = 𝔸¹ of degree 6, h = id. Torsion-free Γ: F = 1 and (b) reduces to (a). The cusp map is finite, bijective and birational onto a non-normal target, which is excluded because S^an ≅ X_Γ is normal. z ↦ z² has degree 2 with two-point fibres, so bijectivity forces degree 1 in characteristic 0. | holds |
| §10.4 (c) | PSL(2,ℤ); the image of Γ(3) | PSL(2,ℤ): local degree 2 at i, so π is holomorphic but not a covering. Image of Γ(3): a covering. | holds |

## Notes for the maintainer

- **Names.** No Lean name and no section id changed; other roadmaps' citations are unaffected.
- **Plan.** `design/plan.json` is unchanged. §10.4 (b) uses the normality statement of gap:normality-analytification, as README line 116 already says.
- **Ownership.** No new construction was introduced, so ownership is unchanged.
- **Citations resolved this round:**
  - VonNeumannAlgebras Layer 9, on main.
  - ShimuraVarieties §§3.3 and 3.4a, at its head through `roadmaps show`.
  - WitteMorris2015 line 1893 to line 1895 and line 2000 to line 2003.
- **Other uses of the letter N.** N remains in Γ(N) (Layer 6 Examples) and in GL_N (§4.4 and §11.1). None of these sits in a statement that mentions the Heisenberg group.
- **Review text.** No suspicious instructions were found in the reviews.
