# Repair report — FIX-PKG-HigherHidaAndColemanTheory~16

One review, one finding. Edited: `packages/HigherHidaAndColemanTheory/README.md` (§9.6 only) and `packages/HigherHidaAndColemanTheory/sources.toml` (one locator). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

§9.6(4): "For (k,r)∈ℤ_≥0²" → exact sequence, cuspidal version, triangle and equivariance `d1∘U=p^(k+1)U∘d1` for every k≥0 and r∈ℤ, by tensoring r=0 with ω^r. Slope comparison kept at (k,r)∈ℤ_≥0², explicitly. §9.6(1): representability and compactness for r∈ℤ, slope bounds for r≥0. Definition of C and of U on ω^r extended to r∈ℤ. New Check at (0,−1).

**Verification.** The finding is right. Pilloni-Singular line 4104 introduces Ω(k,r) for k≥0 and every integer r, line 4107 reduces the map to r=0 by `Ω(k,r)=Ω(k,0)⊗ω^r`, and lines 4119–4129 state the sequence and the triangle for an algebraic weight. The range ℤ_≥0×ℤ_≥0 appears only at line 4035, which opens the slope comparison.

**Why the slope part is not widened.** The bound ≥−3 (Pilloni-Singular lines 4055–4059) uses that the differential of the isogeny maps integral sections of ω^r into p^r times integral sections. That is an inclusion: it gives integrality of `p^(−r)(ξ*)^r` for r≥0 and nothing for r<0, where the inverse appears. So §9.6(1) now states the slope bounds for r≥0 and says why, and the comparison of (4) is stated for (k,r)∈ℤ_≥0². The proof of the comparison uses the bounds only on the third term, whose determinant exponent is k+r+1; I did not widen the comparison to r≥−k−1 on that basis, because the source states it for r≥0 and the degree-0 bound rests on a q-expansion integrality argument I did not re-derive for other ranges.

**What had to be added to make the wider statement meaningful.** For r<0 the operator U on ω^r needs a definition: on the analytic correspondence the isogeny is étale, so `ξ*:t2*ω→t1*ω` is an isomorphism of invertible sheaves and its r-th tensor power exists for every integer r; U uses p^(−r) times it (the source's normalization, lines 3985–3993). Compactness does not depend on the sign of r: it comes from the restriction map between flag neighbourhoods (lines 3996–4016). The equivariance factor is independent of r because both terms carry the same extra tensor factor `p^(−r)(ξ*)^r` relative to r=0.

**Same pattern elsewhere.** §9.7 states its extension theorem and the combined comparison for (k,r)∈ℤ_≥0²; that is the source's range for those results (it consumes the slope comparison), so it stays. §9.8 uses r=2 only. No other statement of the README restricts a sheaf-level sequence to the range of a later slope application.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §9.6(4) exact sequence, r∈ℤ | (k,r)=(0,−1), ω trivialized locally | terms ω⁻¹, F^(0,w−)⊗ω⁻¹, F^(−2,w−)⊗ω⁰; d/dz: 1↦0, z↦1; kernel = constants; antiderivative exists at any larger radius parameter | Exact, as at r=0 | Statement widened; Check added |
| §9.6(4) exact sequence, radius | ℚ₂, f=Σ2^m z^(2^m−1) | antiderivative coefficients 1 at z^(2^m), not → 0; sup-norm ρ^(2^m)→0 for ρ<1 | Colimit still required for every r (twist by a line bundle does not change this) | None |
| Third-term exponent | (0,−1); (3,−4); (0,−2) | k+r+1 = 0; 0; −1 | Negative exponent occurs for r<−k−1, so ω^s must be defined for s<0 | Definition of C and of U on ω^r for r∈ℤ |
| Equivariance, r∈ℤ | p=3, k=0, f=z, U(f)(z)=f(3z), r=−1 and r=2 | D(Uf)=3, pU(Df)=3 for both r; p⁻¹U(Df)=1/3 | Factor p^(k+1), independent of r | Sentence on r-independence; Check |
| §9.6(1) slope bound, r<0 | integrality of `p^(−r)(ξ*)^r` with ξ*(ω⁺)⊂pω⁺ | r=2: p⁻²·p²=integral; r=−1: p·(ξ*)⁻¹ needs ξ*(ω⁺)=pω⁺ exactly, not available | Bound proved for r≥0 only | (1) split: compactness r∈ℤ, slopes r≥0 |
| §9.6(4) slope comparison | (0,2); (3,2); (0,0) | thresholds (k−2,k+1) = (−2,1); (1,4); (−2,1); third-term exponents 3, 6, 1 ≥ 0 | Bounds of (1) apply to the third term throughout ℤ_≥0² | Range stated explicitly; "no comparison asserted for r<0" |
| §9.7 combined comparison | r=2, k=0 | min(1,−2)=−2 all degrees; min(1,1)=1 in degree 0 | Unchanged and consistent with §9.6 | None |
| §9.8 consumer | r=2, k=0 and k=3 | degree-0 threshold 1 ⊃ slope 0; all-degree threshold 1 at k=3 | Unaffected | None |

## Checks

- `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`: exit 0, no output. The file is unchanged and declares nothing (every headline is recorded in its docstring as not statable at the pins), so the `#check @name` comparison has no declaration to compare.
- Dependency check: `depcheck: 244 roadmaps, 2217 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- No gate failure was listed for this round.

## For the maintainer

- No id is added, removed or renumbered; no Lean name changes; no supplier or gap is added.
- `sources.toml`: the Pilloni-Singular locator gains "§13.3, p. 88" and the proof of Proposition 13.3.1.1 (pp. 88–89), both now cited in §9.6. No new source.
- Gate failure (Pilloni-Singular `locator` of 1014 characters): the locator is rewritten as a list of sections with their pages and the numbered results in each (726 characters). It covers the same places, including §13.3, pp. 88–90, with Proposition 13.3.1.1; the exact per-claim locators stay in the README. Nothing else in the manifest changed; it parses, and its longest locator is now 983 characters (BP-Coleman, untouched).
- Ownership: the widened statement is the same object this package already owns (the analytic Klingen family of §9.6); the algebraic relative BGG resolution stays with AutomorphicBundles §9.1. Ownership against open pull requests was not re-searched for this change, since no new construction is introduced.
- A consumer that cites §9.6(1) for slope bounds at negative r would now find them unstated; none exists inside this package (§§9.7–9.8 use r≥0).
