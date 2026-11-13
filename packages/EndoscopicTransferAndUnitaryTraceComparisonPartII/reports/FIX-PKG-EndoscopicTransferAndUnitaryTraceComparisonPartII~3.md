# Repair of EndoscopicTransferAndUnitaryTraceComparisonPartII (package, round 3)

Findings of `REV-PKG-EndoscopicTransferAndUnitaryTraceComparisonPartII~2` (three findings, one P2 and two P3). Only `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` did not change.

## R01 (P2) — applied

The finding is right. In Xiao18, conditions (1)–(3) before equation (2) (Xiao18 lines 140–150, p. 4) require v_i=v*_i=0 on every factor F_i⊇E. Lemma 5.1 (Xiao18 lines 1015–1016, p. 21) keeps that condition and adds v₂=v*₁=0, and line 1072 uses it to take N past the vectors. I recomputed the review's witness (F=ℚ₃, E=ℚ₃(√2), a=2, b=1): the integrand takes the value 1 at g=I and 0 at g=diag(3,3,1)∈T, so the outer integral over GL₃(F)/T is not defined.

§3.5 changed from "truncated arguments u=(v_a,0), u*=(0,u_b*)" to the following. F[x_a] and F[x_b] are decomposed separately, so that S₁=S₁(a)⊔S₁(b). The identity is G_(S₁(a))(f)=|D_ab|⁻¹G_(a,b)(f_p), where G_(a,b)=G_(S₁(a))⊗G_∅ uses the §3.2 distributions in each block. Coordinates are zero outside S₁, and the mixed case is kept. The determinant identity uses the full cyclic vectors. The route also explains why N fixes the truncated vectors.

The review's negative and positive controls are added as a fourth Check in §3.5, with v*=e₁*+e₃* chosen cyclic in each block.

Same pattern elsewhere: the §3.6 proof route now applies §3.3 with Σ=S₁(a) in rank n and (S₁(a),∅) in the two blocks. It shows that the b-block character η(N_(F[x_b]/F)ζ) is constant on each form, and that its value equals κ_(S₁(a)) at the rank-n orbit with both block components on the reference forms, so the two cancel. A rank-(1,1) Check (sign η(c_b) on both sides) is added. §3.2, §3.3 and the Layer 3 example already used S₁-only coordinates and are unchanged.

## R02 (P3) — applied

The finding is right. With U_i↦T_i in every rank: H₂(e_(1,0))=+T_(1,0),F, ξ_F gives T₁⊗1+1⊗T₁, and H₁⁻¹(T₁)=−e₁. So ξ_X(e_(1,0)) is still −(e₁⊗e₀+e₀⊗e₁). On the spectral side, f̂(U)↦f̂(q^(−b/2)U′,q^(−a/2)U″) under either consistent choice.

In §5.1, "the opposite dictionary would give the opposite sign" is replaced. The new text says that a consistent change leaves ξ_X unchanged, because the sign substitution commutes with the Levi scalings. It also says that the mixed convention (new H₂, old H₁ inverses) gives +(e₁⊗e₀+e₀⊗e₁), and the Check excludes that. The §2.3 dictionary statements concern H_n itself and remain correct (H₁(e₁) and H₂(e_(1,0)) do change sign); they are unchanged.

## R03 (P3) — applied

New API lists:
- **§2.2 (ξ_F).** Domain H_n,F and codomain H_a,F⊗H_b,F. The formula |det m₁|^(b/2)|det m₂|^(a/2)f^P, equivalently |det m₁|^b∫_N f(mu)du (Leslie25 lines 1793–1813). The Satake substitution. Unital algebra homomorphism, which §5.1 needs. The base-change square with BC_(a,b)=BC_a⊗BC_b.
- **§4.8 (c_n,d).** Compact open determinant-shell support. Finite expansion over partitions of d into at most n parts. c_n,0=1_K. The Satake formula. Φ_n,2d=c_n,d∗e₀. The (d+1)-term Levi decomposition with its exponent identity.

All Checks are kept. A scan of every numbered section found no other definition without an API list.

## Checks run

- **Lean elaboration.** `lake env lean` on `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/Suggested.lean`, run from the content checkout: exit 0, no output. No `TauCeti.*` import, so nothing needed building.
- **Signature check.** `Suggested.lean` declares nothing, so the `#check @name` scratch comparison has nothing to compare. No binders changed.
- **Dependency check.**

```text
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. No new cross-roadmap citation was added.
- **Citations.** I re-resolved the supplier sections cited by the changed text: SmoothRepresentationsOfLocalGroups §SR.4.3, EndoscopicTransferAndUnitaryTraceComparison §4.9, and GeometryOfNumbersAndQuadraticArithmetic §2.7 `IntegralHermitianLattice.ofCarrier`, which is the lead in `citations.md` and is a roadmap target at line 705 of that README, not a pinned declaration. All are present at their heads.
- **Gaps.** The plan's seven gaps are unchanged and still match the README.
- **Ownership.** No new object is owned here. ξ_F was already a target of §2.2, and c_n,d of §4.8. No source fetch was needed and the manifest is unchanged.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §3.5 descent (repaired) | Review's mixed instance, a=2, b=1 over ℚ₃(√2); untruncated vector e₁ vs prescribed 0 | Old arguments: inner values 1 (g=I) and 0 (g=diag(3,3,1)) on one coset. New: 0 and 0; positive control 1_(3ℤ₃³): 1 and 1 | New arguments well defined; Check added |
| §3.5 N-invariance (route) | n=[[1,X],[0,1]]; (v_a,0) and row (0,v_b*) | n(v_a,0)=(v_a,0); (0,v_b*)n⁻¹=(0,v_b*). Off-block map X↦Xμ_b−μ_aX gives \|det\|=\|D_ab\| | Matches Xiao18 line 1072 |
| §3.5 determinant identity | Mixed instance, v=(1,0,1) | det[[1,0,2],[0,1,0],[1,1,1]]=−1; (−1)^(ab)D_ab·1·1=1·(−1)=−1 | Unchanged, holds |
| §3.5 degenerate S₁(a)=∅ | Same instance | Vector argument 0; rank-n Σ=∅; a-block distribution G_∅ with T₁ trivial is the plain η-orbital integral at the zero vector | Covered by "both coordinates zero outside S₁" |
| §3.6 b-block sign | a=b=1, F[x]=F×F, v=(1,1), v*=(c_a,c_b) | b-form ⟨c_bζ_b⟩; reference orbits have η(ζ_b)=η(c_b); κ_(S₁(a))(ζ₀)=η(ζ_0,b)=η(c_b); cancels. With c_b a nonnorm, a one-sided omission gives −1× | Route and Check added |
| §3.6 discriminant ratio | Hankel form Tr(cζαβ) on power basis | det=N(ζ)·Δ(x,v,v*); η∘N_(F_i/F) is trivial for F_i⊇E | b-character constant on forms |
| §5.1 dictionary | e_(1,0), n=2, q=2 | Original −(e₁⊗e₀+e₀⊗e₁); consistent opposite −(…); mixed +(…) | Clause rewritten |
| §5.1 e_(1,1) under opposite | ê=−U₁U₂ | Consistent opposite: −q⁻¹e₁⊗e₁ (even degree, unchanged); mixed: −q⁻¹e₁⊗e₁ as well | Only odd degree discriminates; Check uses e_(1,0) |
| §2.2 ξ_F formula | f=1_(K diag(π,1)K), a=b=1 | Valuations (1,0): q⁻¹·vol(π⁻¹O)=1; (0,1): 1·1=1, so X+Y. Formula: q^(1/2)·q^(−1/2)(X+Y) | Consistent |
| §2.2 unitality | f=1_K | \|det m₁\|^b·vol N(O)=1 on K_M | ξ_F(1_K)=1⊗1 |
| §2.2 wrong model (untwisted) | Z₁Z₂ / T₁T₂ | Twisted gives q⁻¹XY over F at a=b=1; untwisted would give XY | Excluded by the existing Check (q⁻²XY over E) |
| §4.8 c_n,d Satake | n=1; n=2, d=1,2 | Z^d; q(Z₁+Z₂); q²(Z₁²+Z₂²)+(q²−1)Z₁Z₂+Z₁Z₂=q²h₂ | Formula holds |
| §4.8 Levi exponent | General | d(n−1)−bd_a−ad_b=d_a(a−1)+d_b(b−1) | Holds; d+1 terms |
| §4.8 c_n,0 | d=0 | M_n(O_E) with unit determinant is K_n,E | Unit |

## Notes for the maintainer

- No name that another roadmap cites changed. No section was renumbered, and no Lean name was added or removed.
- Ownership against open pull requests: rechecked only for the changed text, using `roadmaps grep`. The changes add no new owned object.
- Nothing suspicious appeared in the review text.
