# Review of CompactOperators (pull request #2546 at dec33f7)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: the Lean definition of `IsCompletelyContinuous` measures approximation by `ringOpNorm`, which is zero on an unbounded map, so at the generality the README states (any normed commutative ring) it admits unbounded maps and the closure under addition claimed in §0.1 fails. The repair is a one-line change of the definition. Every other statement, Check and source locator I recomputed or opened is sound. There are three small corrections and three format notes, none blocking, and three points for the human reviewers.

## R01 (P2) — `IsCompletelyContinuous` admits every unbounded continuous map, so §0.1's closure under addition is false for it over a general normed commutative ring

§0.1 (README lines 143–147) defines `IsCompletelyContinuous u` "for continuous linear maps between normed modules over a normed commutative ring" and asks to prove that it is closed under addition. `Suggested.lean` (lines 78–79) writes the approximation as `(u - v).ringOpNorm < ε`, with only `[NormedCommRing R]` in scope. Tau Ceti's `ringOpNorm` is `sInf {c | 0 ≤ c ∧ ∀ x, ‖f x‖ ≤ c * ‖x‖}` (`TauCeti/Analysis/Normed/Operator/RingOpNorm.lean:149`), and the infimum of the empty set is `0`. So a continuous linear map with no uniform bound has norm `0`, and it is "completely continuous" with `v = 0`. An implementer who proves the §0.1 targets for this definition cannot; a downstream roadmap that cites the name gets a predicate that is not the README's.

A counterexample: `R = ℤ` with the trivial norm, `M` the finitely supported integer sequences with `‖x‖ = max { 2^(−n) : xₙ ≠ 0 }`, and `u(eₙ) = e_⌊n/2⌋`. Then `‖ux‖ ≤ √2 ‖x‖^(1/2)`, so `u` is continuous, while `‖u eₙ‖ / ‖eₙ‖ = 2^(n − ⌊n/2⌋)` is unbounded; the same holds for `1 − u`. Both therefore satisfy the Lean definition. Their sum, the identity, does not: a continuous `v` with finite image vanishes on `eₙ` for large `n` (nonzero elements of a finitely generated submodule have norm bounded below), so `1 − v` is bounded with norm at least `1`. I checked in Lean, against the pin, that a map with no uniform bound has `ringOpNorm = 0`. The same junk value enters `IsOpLimitAeval` (line 276–278). The theorems of the file are not affected: each is over a Banach–Tate ring or a field, where continuous maps are bounded.

The smallest change: state the approximation by a pointwise bound, `∀ x, ‖u x - v x‖ ≤ ε * ‖x‖`, as the pinned `ContinuousLinearMap.IsCompletelyContinuous` does (`TauCeti/Analysis/Normed/Operator/CompletelyContinuous.lean:103`; its line 245, `isCompletelyContinuous_iff_ringOpNorm`, recovers the operator-norm form over Tate scalars), and likewise in `IsOpLimitAeval`. Alternatively, restrict §0.1 and the two definitions to Banach–Tate rings and fields. The README already takes this care for row norms (Convention 4, "so that a real supremum of an unbounded row cannot give a false compactness statement").

## C01 — `colemanDBounded_succ` is already proved at the pin, so as a target it asks an implementer for nothing

The pinned Tau Ceti has the same definition as `Polynomial.colemanDBounded` (`TauCeti/RingTheory/Polynomial/Resultant/Coleman.lean:74`), with the arguments in another order, and the padding identity as `Polynomial.colemanDBounded_succ`. With that module imported, `exact Polynomial.colemanDBounded_succ hP hB` closes the theorem at `Suggested.lean` line 339 (I ran it); the hypothesis `hP0` is unused. LocallyAnalyticDistributions cites the name (its line 237), so the declaration has a reason to stay: its docstring could say that it is the named interface for that citation, or the statement could stay in README §3.3 only.

## C02 — The finite lattice comparison of §4.4 is restricted to a discrete valuation ring, though Convention 2 says discreteness is not assumed

Convention 2 (lines 78–80) says field results assume no discrete valuation. **Finite lattice comparison** (lines 992–1003) asks for "a finite free lattice over a discrete valuation ring", because it uses Mathlib's `Submodule.smithNormalForm` for principal ideal domains. The cited source, Kedlaya §3, Theorem 16 (Kedlaya2007 line 191), is stated for any nonarchimedean field, and the diagonalisation it needs exists over every rank-one valuation ring (an entry of least valuation divides all others; clear its row and column). Either state the comparison over the valuation ring of `K`, with that diagonalisation as a target here, or add a clause to Convention 2 naming §4.4's lattice comparison as the one place where a discrete valuation is assumed.

## C03 — The description undercounts the names that leave code font: `fredholmDet` is a thirteenth

The description says "Twelve names the README on main gave in code font are affected" and that LocallyAnalyticDistributions cites all twelve. Main's README has `fredholmDet` in code font at line 588; the head writes "the Fredholm determinant at one" in prose (§2.4, line 668), and LocallyAnalyticDistributions cites the name (its line 213). It exists at the pin as `ContinuousLinearMap.fredholmDet` (`TauCeti/Analysis/Normed/Operator/Nonarchimedean/FredholmDet.lean:84`). Correct text: "Thirteen names … `IsRieszColemanProjection` and `fredholmDet`. … Nine of them exist as Tau Ceti declarations at the pin."

## N01 — The module docstring does not account for five theorems of `Suggested.lean`

`IsRowCompact.transpose`, `isCompletelyContinuous_of_isCompactOperator`, `colemanDBounded_succ`, `exists_newtonMajorant` and `colemanDEntire_isEntire` are neither in the headline list (lines 17–41) nor in the sentence naming the non-headline interfaces (lines 45–47). LocallyAnalyticDistributions cites the last three by name (its lines 237, 245, 246), so they could join that sentence.

## N02 — Two hypotheses are redundant

In `norm_charCoeff_of_unit_minors`, `hd : ∀ i, d i ≠ 0` follows from `hdec` (a strictly decreasing sequence of norms is positive at every index). In `colemanDBounded_succ`, `hP0` is unused.

## N03 — Convention 3 links a Mathlib pull request by number and calls it "proposed"

Lines 87–89 point to `mathlib4/pull/42865` as "Mathlib's proposed generalisation". The sentence dates the README; describing the shape (the infimum formula over semirings) without the link would be timeless.

## Earlier findings

The previous review read this same head and had no finding. Its three small corrections and two format notes are unchanged, since the folder is unchanged; they are C01–C03 and N01–N02 above, each verified again.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| `IsCompletelyContinuous` (§0.1) | `ℤ` trivial norm, `u(eₙ) = e_⌊n/2⌋`; Tate ring; field | ratio `2^(n−⌊n/2⌋)` unbounded, `ringOpNorm u = sInf ∅ = 0`; `u`, `1−u` pass, `1` fails with norm `≥ 1` | false at stated generality | R01 |
| §0.1 identity criterion; lattice Checks | `(1−u)ⁿ = 0`, `n = 0`; `(π, a) = (p², p)`, `(p², p²)` | `u Σ_{k<n}(1−u)ᵏ = 1 − (1−u)ⁿ`; `g(p^(2m)) = p^(−m)` vs `α = p^(−2m)`; `g(p^k) = p^(−2⌊k/2⌋)`, `g(p) = 1`, `α(p) = p⁻¹` | true | none |
| §0.2 sample; `IsRowCompact.transpose` | `x ↦ (Σxⱼ)e₀`; rows of `u` null because columns of `v` are | `(u − uπ_S)e_k = e₀`; off finite `S` rows `< ε`, each row in `S` `< ε` off a finite set: column sups `→ 0` | true | none |
| §0.4 sample | identity on a (Pr) module; retract `ri = 1` | compact identity gives finitely generated by §0.1; `HasPr.projective` needs `Module.Finite` (pin line 252) | true | none |
| Headline 1: `isRowCompact_iff_isCompletelyContinuous`, compactoid and compact comparisons (§0.5) | rank-one `x ↦ v(x)f`; `ℂ_p` line; `K⟨T⟩` over `K` | Serre §3 Prop. 4: `wⱼ = xⱼv → 0`; unit ball of `ℂ_p` not compact; monomials `Tⁿ` have no uniform tail | true | none |
| §1.1 sample | `[[0,1],[0,0]]`; `diag(a,0)`; empty matrix | `det [[1,−T],[0,1]] = 1`; `reflect 2 (1−aT) = T² − aT`, reverse `T − a`; empty determinant `1` | true | none |
| §1.2 sample; `norm_charCoeff_mul_pow_le_of_rowNorm_le` | `diag(pⁱ)`; `q = 0`; `n < |T|` | `cₙ = (−1)ⁿ p^(n(n−1)/2)/∏(1−pʲ)`; `B^|S∩T| q^|S∖T| ≤ B^|T| q^(n∸|T|)`; `0⁰ = 1` only when `n ≤ |T|` | true | none |
| §1.3 sample; Headline 2a `charPowerSeries_isEntire` | `Tᴺ`; `I = ∅`; Serre Prop. 7(b), 8 | Gauss norm of `Tᴺ` at radius 1 is 1; `H = 1`; `|cₘ|Mᵐ ≤ ∏(rᵢM) → 0` | true | none |
| §1.5 sample; `charPowerSeries_eq_mul_of_comm` | `K × K`, `e = (1,0)`; commuting idempotent | `1 − eT = (1−T, 1)`, leading coefficient `−e` not a unit; `(1−Tup)(1−Tu(1−p)) = 1 − Tu` | true | none |
| `c0_completedBaseChange` (§1.7) | `I = ∅`; `φ = id`; `ℚ_p × 𝔽_p((t))` | `‖Θz‖ ≤ L max‖sⱼ‖‖xⱼ‖`; `s ⊗ r eᵢ = sφ(r) ⊗ eᵢ`; inverse bound 1 since `‖eᵢ‖ = 1`; `(p,t)` scales by `p⁻¹` | true | none |
| §2.2 sample | `Q = T − c` | `Gₙ = Σₖ a_(n+1+k) cᵏ`, the coefficients of `(F(T) − F(c))/(T − c)` | true | none |
| §2.3 sample | `1 + T²` in characteristic 2; `F(0) = 1`, `F(a) = 0` | `Δ¹ = 2T = 0`, `Δ² = 1`; `1 + a Σ a_(n+1)aⁿ = 0` gives the inverse | true | none |
| §2.4 sample | identity of a line; Serre recurrence | `V₁ = c₁ + u = 0`; `V_m − uV_(m−1) = c_m` | true | none |
| §2.5 sample; Headline 2b `isUnit_one_sub_smul_iff` | `diag(pⁱ)`; `I = ∅`; `a = 0` | invertible iff `a ∉ {p^(−i)}`; zero ring of operators, `H = 1`; `H(0) = 1` while `0 ∈ spectrum` | true | none |
| `exists_rieszProjection` (§3.1) | `1 + N`; `diag(λ, μ)`; `h = 0` | `e^(h+1) = e^h` gives `Cw = p`; `c = μ−λ`, `Cb = diag(0,1)`; `E = 0`, `w = C⁻¹` | true; matches Serre's `p = eʰ` | none |
| §3.2 sample; `isFredholm_one_sub_smul` | `a = 0`; Jordan block; Serre corollary p. 82 | identity, index 0; `H = (1−λT)²`, `N` the plane; codimension of image = dimension of kernel | true | none |
| `colemanDBounded`, `_succ` (§3.3) | `D_(1,0)(1,1)`, `D_(0,0)(1,1)`; `B = X`; `B = c`, `P = 1` | `Res(X, 1−T) = 1−T`, empty resultant 1; `∏(1 − αᵢT) = P`; `(1−cT)ᴺ`, steps of norm `|c|` | true; closes by a pinned lemma | C01 |
| Headline 4: `charPowerSeries_eq_colemanDEntire`; `exists_newtonMajorant` | `B = 0`; `F = 1`; `j = 0` | `v = 0`, `D(0, F) = 1 = H₀`; `‖a₀‖ = 1 ≤` empty product; concave hull slopes give `ρ` | true | none |
| Headline 3: `exists_rieszColemanProjection` (§3.4) | `Q = 1`; `diag(λ, μ)`, `Q = 1−λT`; `Q = 1+aT` on `M = 0` | `E = 0`, `w = 1`, rank 0; `Q*(u) = diag(0, μ−λ)`; `D(B,Q) = (1−T)^(deg Q)`; `‖aⁿ‖ ≥ ‖a⁻¹‖^(−n)` so `S` not entire | true; JN Thm 2.2.2 matches | none |
| §4.2 sample | `1 − pT²` | points `(0,0)`, `(2,1)`: slope `1/2` twice; eigenvalues `±√p` of valuation `1/2` | true | none |
| §4.4 sample; `norm_charCoeff_of_unit_minors` | `[[p,1],[0,p]]`; `p^max(2i−j,0)`; `S ≠ {0..n−1}`; `n = 0` | slopes row `(0,1)`, Hodge `(0,2)`, Newton `(1,1)`; transposed columns constant 1; other minors `≤ ∏_(i<n−1)‖dᵢ‖‖dₙ‖`; `c₀ = 1` | true; DVR-only lattice step; `hd` redundant | C02, N02 |
| Description, names leaving code font | main README line 588 | `fredholmDet` in code font on main, prose at head, cited by LocallyAnalyticDistributions | 13, not 12 | C03 |

- Source locators checked against the text: 18. Serre1962 lines 60, 82, 101, 157, 174, 177, 273–294, 306, 311, 335, 388, 438, 448–501, 506; JohanssonNewton line 536; Kedlaya2007 lines 166, 191; Schikhof lines 432, 625–636, 708–715; DeGrandeDeKimpe1982 lines 45, 101.
- Library declarations opened at the pins: 46 Tau Ceti names of the supplier contracts located (among them `RingOpNorm.lean:149`, `PseudoUniformizer.lean:136, 150`, `ZeroAtInfty/Basic.lean:50`, `ZeroAtInfty/Matrix.lean:90, 177, 248`, `Entire/Basic.lean:76`, `PotentiallyONable.lean:127, 252`, `CompletedTensor.lean:260, 314, 383, 454`, `Resultant/Coleman.lean:74`, `CompletelyContinuous.lean:103`, `RowCompact.lean:91, 115`) and 10 Mathlib (`Charpoly/Coeff.lean:290, 292`, `Fredholm/Basic.lean:123`, `LinearMap/Index.lean:39`, `FreeModule/PID.lean:508`, `Resultant/Basic.lean:131`, `FreeLocus.lean:181`, `PowerSeries/Restricted.lean:28`).
- Cross-roadmap citations resolved on main (1b7b481): PadicFunctionalAnalysis §§0.1, 0.4, 1.1, 1.4, 2.4, 2.6, 4.4; RestrictedPowerSeries §§1.1–1.3, 2.1–2.3, 7.2; NewtonPolygons §§0.6, 0.7, 2.5, 3.2, 3.3, 4.1, 4.3, 5.3; AdicSpacesPartII §R0.5 with (f); AdicSpacesPartIII §R3.6; LocallyAnalyticDistributions §§4.1, 4.2, 4.13, 4.14; OperatorIdeals Part A.
- Automatic checks: every check passed. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` elaborates with 23 `sorry` warnings and nothing else. The 39 elaborated signatures were compared with the README; the six flagged definitions drop only instances their bodies do not use, which is how R01's generality arises for `IsCompletelyContinuous` and `IsOpLimitAeval`.
- One-tactic probes on a copy: `isFiniteRank_iff_range_fg` closes with one term (settled earlier as a named interface); `colemanDBounded_succ` closes with the pinned lemma (C01); `IsFiniteRank.isCompletelyContinuous`, `IsRowCompact.transpose`, `isCompletelyContinuous_of_isCompactOperator`, `charPowerSeries_isEntire`, `exists_newtonMajorant`, `colemanDEntire_isEntire` and `exists_tendsto_opNorm_sum_pow` do not close with `simp_all`, `rfl` or `infer_instance`.
- Description counts recomputed at the head: 47 Checks in 24 groups and 40 *Needs:* lines, as stated.
- Ownership against open pull requests: the overlap report lists none changing this roadmap and no dropped id; QuaternionicModularForms, AutomorphicGaloisRepresentations and PadicFamilies, read at their heads, consume these objects and state none as their own; no other `Suggested.lean`, open or on main, defines `IsRowCompact`, `IsCompletelyContinuous`, `charPowerSeries`, `colemanDBounded` or `IsRieszProjection`.

Overlap check: read LocallyAnalyticDistributions, PadicFunctionalAnalysis and RestrictedPowerSeries (main), and QuaternionicModularForms, AutomorphicGaloisRepresentations and PadicFamilies (open). Fredholm determinants, Riesz and Coleman theory: CompactOperators, cited by the others. Banach–Tate data, `c₀` and matrices: PadicFunctionalAnalysis. Entire-series algebra: RestrictedPowerSeries. Field `c₀` tensor comparison: AdicSpacesPartII §R0.5(f), with the ring-scalar variant here.

Source independence: 12 passages compared with 5 sources (Serre1962 Props. 4, 5, 7, 8, 10, 11, 12 and the corollary; JohanssonNewton Thm 2.2.2 against §3.4 and its docstring; Schikhof §2.15; DeGrandeDeKimpe1982 §§1.1, 2.1; Kedlaya2007 Thm 16); nothing shared beyond what the mathematics forces (longest run 3 words). Largest share: Serre1962, 20 of 40 source mentions. Contents compared with Serre1962 §§1–7: independent; §§0.3, 0.4, 1.1, 1.5, 1.7, 3.3, 3.4 and Layer 4 have no counterpart there, and the order is forced by the *Needs:* lines of §1.2 (on §0.2), §2.4 (on §§1.2–1.4) and §3.1 (on §§2.3–2.5). Coleman1997 was not read.

Research link: Layers 1–3 are the Fredholm and Riesz theory of Serre (1962), extended by Coleman (1997) to Banach algebras of coefficients for families of modular forms; Johansson–Newton (arXiv v4, §2.2) use it for extended eigenvarieties, and LocallyAnalyticDistributions consumes it. Rests on the README summary and JohanssonNewton §2.2.

## Not verifiable

- Coleman 1997 (Invent. Math. 127), Appendix A3–A4, cited in README Layers 2–4 and in the docstring of `charPowerSeries_eq_colemanDEntire`: recorded as uncertified (paywalled); cited by its locator only and not read.

## Source issues

- **Misprint** in Kedlaya2007 at §3, the sentence before Theorem 16, p. 5: the source says the theorem is the archimedean analogue of Weyl's inequality; it should be the nonarchimedean analogue, the section being over a nonarchimedean field; affects nothing.

## For the human reviewers

- The pinned Tau Ceti already proves much of `Suggested.lean` under its own definitions (for example `ContinuousLinearMap.IsRowCompact`, `RowCompact.lean:115`, and `Polynomial.colemanDBounded_succ`); the file restates these on local copies of `IsRowCompact`, `IsCompletelyContinuous`, `colemanDBounded`. Whether to import them is yours.
- Licence: the Provenance section (README lines 1121–1135) names W. Coram's PhD repository at a fixed commit; the description says it is under Apache 2.0. I did not compare `Suggested.lean` with that repository.
- Not tested: Coleman 1997 is paywalled and recorded as uncertified, so the Appendix A3–A4 locators were not read.
