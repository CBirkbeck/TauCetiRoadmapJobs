# FIX-PKG-HodgeClassesForJacquetLanglands~8

Review settled: `REV-PKG-HodgeClassesForJacquetLanglands~7` (four findings). All four hold and are
repaired. Only `packages/HodgeClassesForJacquetLanglands/README.md` changed; `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

§9.1 "the dual group is `GL₄(ℂ) × ℂ^×` … (EndoscopicTransferAndUnitaryTraceComparison §1.8; …)" →
"Prove that the dual group of `GU_E(V)` over `F` is … and of `G̃` is `Ĝ^{Σ_∞}`", with a proof route
through ReductiveGroupsPartII §§RG2.5.1–RG2.5.2 and two new Checks (34 vs 33; sign of `det g`). The
citation was also removed from the supplier heading, *Needs:* and Dependencies; the Scope says how §1.8
differs.

*Evidence.* §1.8, read at its open head, defines a group over `ℚ` with a `ℚ`-valued multiplier, dual
`ℂ^× × ∏ GL_n(ℂ)`. IP23 lines 4166–4181 (p. 91) need `GU(V)` over `F` and `Ĝ₀ = Ĝ^n`. No roadmap, on
main or at an open head, computes this dual group, so this roadmap owns it.

*Where this departs from the suggested repair.*
- The proof route adds the step to the quasi-split inner form, which is where an antidiagonal form
  exists.
- `θ₄ = J₄ ᵗg⁻¹ J₄⁻¹` is made explicit (IP23 line 3561, p. 79).

## F02 (P3) — applied

§1.4 "For `σ = id` and a non-symmetric bilinear form the identity fails" → two Checks:
- the `1 + E₁₂` counterexample (`L(L e₁₃) = e₂₃`, volume `1`);
- symmetry up to sign suffices, via `L∘L = (det A/c²)·⋀²(A⁻¹Aᵀ)`, shown on the standard symplectic
  form (`1`) and on the review's alternating matrix (`64`).

*Evidence.* Exact rational computation, in the table below. The review's factor `⋀²(A⁻ᵀA)` is the
inverse of the correct one when `A = [H(e_i, e_j)]`; it fails on all four non-symmetric instances
tried. No other passage makes this necessity claim. The §1.5 control is a concrete instance and holds.

## F03 (P3) — applied

§10.1 "(IP23, §12.2.4, pp. 96–97; §10.2, pp. 65–66)" → "(…; §10.4, p. 68)". The same slip was in §7.1,
which cites `τ`, the Schwartz forms and `H_N^+`: "§§10.1–10.3, pp. 65–68" → "§§10.1–10.4, pp. 65–68".

*Evidence.* IP23 line 2833: §10.2 is the Weil representations, p. 65. Line 2989: §10.4 starts on p. 68.
`τ` is at lines 3008–3014. The two other §10.2, p. 66 citations, both about splittings, are correct.
`sources.toml` is unchanged, because its locator covers §10.

## F04 (P3) — applied

- Scope: added `Orientation.barHodgeStar` as the positive-definite complexified case (`L = ±` that
  star, by the sign of `d_U`).
- `From Mathlib`: "Neither accepts a conjugate-linear form" now continues "…and Tau Ceti's
  `Orientation.barHodgeStar` covers only the positive definite form…".
- `From Tau Ceti`: added both declarations.
- §1.3: new Check, `L(e₁₂) = e₃₄`, `L(i·e₁₂) = −i·e₃₄`, `L∘L = 1`.

*Evidence.* At the pin, `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean` has
`barHodgeStar` (line 126), `barHodgeStar_barHodgeStar` (line 144, square `(−1)^{kl}`) and
`complexWedgePairing_barHodgeStar` (`α ∧ barStar β = h(β, α)·vol`). The Lean targets are strictly more
general, so nothing is deleted.

## Checks run

- **Elaboration.** `lake env lean packages/HodgeClassesForJacquetLanglands/Suggested.lean`, run from
  the content checkout, exits 0. The output is three `declaration uses 'sorry'` warnings (lines 70, 81,
  95) and nothing else. The file is unchanged this round.
- **Signatures.** I put `#check @name` for all four declarations in one scratch file and elaborated it
  once. The elaborated types match `scratch/signatures.md` and README §§1.3, 1.4 and 1.7.
  `[FiniteDimensional E U]`, `σ`, `vol` and `hkl` are present; `comp_self` keeps `hH` and `b`;
  `map_similitude` keeps `g`, `ν` and `hg`. Nothing changed.
- **Dependency gate.** Output:

      depcheck: 241 roadmaps, 2263 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver.** No cross-roadmap citation and no Lean name is found nowhere. The resolver does
  not check names outside TauCetiRoadmap, so I opened the two new Tau Ceti names at the pin (above).
- **Shape.** 75 `**Checks.**` blocks and 75 *Needs:* lines, as before. No LaTeX delimiters or process
  words in the new text.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §9.1 `θ̂` on the torus | `G_E ≃ GL₄ × 𝔾_m`, antidiagonal form | `e_i ↦ e₀ − e_{5−i}`, `e₀ ↦ e₀`; transpose `f_i ↦ −f_{5−i}`, `f₀ ↦ f₀+f₁+f₂+f₃+f₄`; on `T̂`: `(s; ν̂) ↦ (s₄⁻¹,s₃⁻¹,s₂⁻¹,s₁⁻¹; ν̂∏s_i)` | equals IP23 line 4175 |
| §9.1 base preserved | simple roots `e₁−e₂, e₂−e₃, e₃−e₄` | images `e₃−e₄, e₂−e₃, e₁−e₂` | based action |
| §9.1 `θ₄` pinned | `J₄` with entries `1,−1,1,−1`; `J₄² = −1` | `θ₄(1+tE₁₂) = 1+tE₃₄`; `θ₄(1+tE₂₃) = 1+tE₂₃`; `θ₄² = id` | fixes the standard pinning |
| §9.1 involution | `θ̂²(g,ν)` | `(g, ν·det g·det g⁻¹) = (g, ν)` | involution |
| §9.1 centre / sign of `det` | `g = z·1₄`; scalar similitude `α = 1+i`, `N(α) = 2` | `θ̂(z,1) = (z⁻¹, z⁴)`; `N(det α) = 16 = ν⁴`; wrong model gives `ν⁻⁴ = 1/16` | wrong model excluded by §1.2 |
| §9.1 `Z(Ĝ)^{θ̂}` | centre `(z·1₄, ν̂)` | fixed iff `z = ±1`: dimension 1 = split rank of `Res_{E/F}𝔾_m` over `F` | consistent |
| §9.1 Weil restriction | `F = ℚ(√2)` | `(GL₄ × ℂ^×)²`: 34; rational-multiplier subgroup: `1 + 2·16 = 33`; codimension `[F:ℚ]−1 = 1` | Check correct |
| §9.1 `d = 0` | all places definite | dual group independent of signature (inner forms) | statement unchanged |
| §1.4 counterexample | `1 + E₁₂`, `c = −1` | `det = 1`; `L(L e₁₂) = e₁₂`, `L(L e₁₃) = e₂₃`, `L(L e₂₃) = −e₁₃+e₂₃` | identity fails |
| §1.4 formula | 3 random invertible `A`, `c ∈ {−1,2,3}`; `1+E₁₂` | `L∘L = (det A/c²)⋀²(A⁻¹Aᵀ)` exact on all; `⋀²(A⁻ᵀA)` fails on all | formula as written |
| §1.4 alternating | symplectic, `c = −1`; alt rows `(0,1,2,3)…`, `c = −1` and `c = 3`; rank-2 alternating | `1 = det`; `64 = det`; `64/9 = det/9`; `0 = det` | holds, degenerate included |
| §1.4 symmetric control | `diag(2,3,5,7)`; symmetric rows `(2,1,0,3)…` | `210`; `−11` | equal to `det/c²` |
| §1.3 vs Tau Ceti star | `E = ℂ`, `U = ℂ⊗ℝ⁴`, unit form, `d_U(e₁₂₃₄) = ±1` | `L(e₁₂) = ±e₃₄`, `⋆e₁₂ = e₃₄`; `L(i e₁₂) = ∓i e₃₄`; `L∘L = 1 = (−1)^4` | `L = ±barHodgeStar` |
| §10.1, §7.1 locators | IP23 lines 2833, 2976, 2989, 3008–3014 | §10.2 is on p. 65; §10.4 starts on p. 68 | corrected |

## For the maintainer

- No name that another roadmap cites changed. No Lean declaration changed.
- This roadmap no longer depends on EndoscopicTransferAndUnitaryTraceComparison: the Scope clause only
  says how §1.8's group differs. The depcheck reports no problem either way, because that roadmap is
  earlier in the order.
- Ownership against open pull requests was checked for the one object these repairs add (the dual
  group of `GU_E(V)` over `F`), with `roadmaps grep` across main and all open heads. There is no other
  owner.
- No source was missing. `needs-references.toml` was not written.
