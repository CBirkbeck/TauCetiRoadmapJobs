# Review of IncompressibleFluids (pull request #2630 at e704bba)

**Verdict:** accepted

**Summary.** Accepted: the four findings of the previous review are repaired, and every formula, constant, exponent and Check recomputed on this head came out as written, so there is no finding. There are four small corrections (two theorems still without a locator, a Lean Helmholtz–Weyl statement that is the bipolar theorem applied to the definition, a mismatch between the README's and the Lean file's Aubin–Lions hypotheses, and a description written for an earlier head) and two format notes, none blocking. Left for a human: which roadmap owns the whole-space theory that the open IncompressibleFlows also plans, and the fact that eight cited texts, among them the only locators of §5.1 and §6.1, could not be read legally.

## C01 — §2.3 and §5.3 state theorems with no locator

An implementer cannot tell which published statement the linear Stokes theorem of §2.3 (existence, uniqueness and energy equality with data `f₀ ∈ L¹(0,T; L²)`, `F ∈ L²L²`, lines 298–303) or the theorem of §5.3 (the Fujita–Kato solution is smooth for `t > 0` and is a Leray–Hopf solution with energy equality, lines 658–661) is meant to be; every other named theorem now carries one. Both statements are correct as far as I could compute (the energy identity of §2.3 follows from `⟪div F, u⟫ = −⟪F, ∇u⟫` with the divergence convention of the Conventions; the class `(q,p) = (4,6)` of §5.3 satisfies `2/4 + 3/6 = 1`), so this is a matter of adding a locator at each, for instance to the texts already in the References for Layers 4 and 5. §1.1, §1.4, §2.1, §3.2 and §4.1 also cite nothing, but they are definitions and elementary identities.

## C02 — The Lean statement called Helmholtz–Weyl is the double orthogonal complement of the definition, not the theorem of §1.2

As an acceptance test it asks an implementer for little. `solenoidalL2` is, by the proved `isSolenoidalOn_top_iff` (`Suggested.lean` line 79), the set of `L²` fields orthogonal to every test gradient, so `mem_orthogonal_solenoidalL2_iff` (line 145), which says that the orthogonal complement of that set is the `L²` closure of the test gradients, is Mathlib's `Submodule.orthogonal_orthogonal_eq_closure` applied to the subspace of test gradients, plus the bookkeeping between `eLpNorm` and the `Lp` norm. The content of §1.2 is the other description: the complement is the space of all `∇q` with `q` locally integrable and weak gradient in `L²` (lines 154–156).

Would the author either mark the Lean statement as a sanity check on the definition, or state the description by `L²` gradients instead (it is statable at the pins with `TauCeti.HasWeakFDerivOn` for a scalar `q`)?

## C03 — §3.4 and the Lean file state the Aubin–Lions lemma under different hypotheses

A reader comparing the two cannot tell which is the target. §3.4 assumes `X₀` and `X₁` reflexive and `1 < p, r < ∞` (lines 405–408); `exists_subseq_tendsto_eLpNorm_of_isCompactOperator` (`Suggested.lean` line 194) has no reflexivity and allows `r = ∞` (`hr : 1 < r` only). The Lean statement is true: it is the form the README attributes to Simon 1987, and it follows from the two bullets of §3.4 (Ehrling's lemma and the Hölder bound `|t − s|^{1 − 1/r}` in `X₁`), neither of which uses reflexivity. The smallest change is one sentence in §3.4 saying that the target is the form without reflexivity and with `1 < r ≤ ∞`, Lions' theorem being the reflexive case.

## C04 — The description was written for an earlier head

Three sentences no longer describe the change.

- "the weak divergence and the solenoidal subspace `L²_σ`, … Ladyzhenskaya's inequality in dimension two, and the bilinear fixed-point lemma": the head also states the Aubin–Lions lemma, and proves two auxiliary statements and the submodule laws of `L²_σ` rather than admitting them.
- "Some Tau Ceti suppliers (Riesz transforms, Besov spaces, Duhamel) are on Tau Ceti's `main` but newer than this repository's pin, so they are cited by name without locators": the head cites no such names; it cites PDE §2.3, §7.1–§7.3 and §6.3 for them. The text that would be right: "The Riesz transforms, Besov spaces and Duhamel's formula are consumed from PDE §2.3, §7.1–§7.3 and §6.3."
- "It has had no independent review yet" is out of date.

## N01 — `integral_pow_four_le_of_finrank_eq_two` has no `finrank` hypothesis

The name promises a statement on a space `E` with `Module.finrank ℝ E = 2`, as §3.1 states it; the declaration is on `EuclideanSpace ℝ (Fin 2)`. Either form is fine; the name and the prose should say the same thing.

## N02 — The vorticity bullet of §4.3 omits `u₀ ∈ H¹_σ`

"`‖ω(t)‖₂² + 2ν∫₀ᵗ‖∇ω‖₂² = ‖ω₀‖₂²`" (line 531) is meant for data with `ω₀ ∈ L²`; the hypothesis stands in the bullet before it and would be clearer repeated.

## Questions for the author

- §4.2 cites Lemarié-Rieusset "Theorem 12.2, pp. 357–358" and then "Proposition 12.1, (12.10), p. 361". A Proposition 12.1 four pages after Theorem 12.2 is unusual numbering; is it right? I could not read the book.
- §1.2 cites Ożański–Pooley, §2.1, p. 16, for the symbol of `ℙ`. What stands there (OP17 line 699, equation (2.11)) is the Fourier transform of the Oseen kernel, the symbol times `e^{−4π²t‖ξ‖²}`. Is that the intended locator?

## Verified sound

Previous findings, at this head: R01 (no locators) partly repaired, the remainder is C01; R02 (overlap with IncompressibleFlows unstated) repaired as asked, by the scope bullet at lines 938–946 and a sentence of the description; R03 (Aubin–Lions absent) repaired, `Suggested.lean` line 194 and docstring lines 17–22; R04 (`sorry` inside a definition and an instance) repaired, `solenoidalL2` proves its three laws and the instance is derived from `isClosed_solenoidalL2` (lines 96–134). C01–C04 and N01–N02 of that review are repaired (References lines 1108–1127; scope bullet lines 947–949; §2.1 line 247 and §2.2 lines 278–280; supplier contract lines 1050–1055; line 997; `Suggested.lean` line 152).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: Riesz signs, `ℙ`, pressure | Fourier symbols | `RⱼRₖ ↔ −ξⱼξₖ/‖ξ‖²`; `Σ RⱼRⱼ = −1`; `−Δ ↔ 4π²‖ξ‖²` gives `p̂ = −ξⱼξₖF̂/‖ξ‖²` | agree; PDE §2.3 has the same sign | none |
| Conventions: Bessel scale | Mathlib symbol | `(1 − (2π)⁻²Δ)^{s/2} ↔ (1 + ‖ξ‖²)^{s/2}`, as `besselPotential` | agree | none |
| Conventions: scalings | NS `λ`; Euler `(a,b)` | `L^d`: `λ·λ⁻¹`; Euler terms each `a²b` | invariant | none |
| 1.1 weak divergence, `L²_σ` (S1), Lean | `d = 0, 1`; shear; `u = x` | constant in `L²(ℝ)` is 0; `∫g(x₂)∂₁φ = 0`; divergence `d` | true | none |
| 1.2 Helmholtz–Weyl, `ℙ` (S2), Lean | `u = (φ,0)`; `d = 1` | `(ℙu)^ = (ξ₂², −ξ₁ξ₂)φ̂/‖ξ‖²`; `(Kᗮ)ᗮ = closure K` | true; Lean form is the bipolar theorem | C02 |
| `lerayProjection_heatSemigroup` | `t = 0`; `d = 1` | identity both sides; `0 = 0` | true | none |
| 1.3 `Lᵖ` projection, pressure (S3) | `F = φ·1`; symbols | `ΠF = −φ`; `RⱼR_l∂ₖ` and `∂ⱼR_lRₖ` both `−2πiξⱼξ_lξₖ/‖ξ‖²` | true | none |
| 1.4 solenoidal Sobolev (S4) | `u = ∇φ`; `d = 2, 3` | `‖A − Aᵀ‖² = 2‖A‖² − 2∫(div u)²`; `‖Ω‖²_HS = 2ω²`, `2‖ω‖²` | true | none |
| 2.1 off-diagonal heat (L5), Lean | `p = q`; `q = ∞`; `d = 0`; dilation | `‖K_t‖_r = (4πt)^{−(d/2)(1−1/r)} r^{−d/(2r)} ≤` constant; `q = ∞` gives pinned `−d/(2p)`; both sides `λ^{−d/q}` | true | none |
| 2.2 Stokes, Oseen (L6) | Fourier side; `d = 3` source | `sup r e^{−νtr²} = (2eνt)^{−1/2}`; `1/(2ν)`; source `(‖x‖²+t)^{−(m+3)/2}`, gradient gives `−d−1−k` | true | none |
| 2.3 Stokes system (L7) | `F = −u ⊗ u` | `(1−ℙ)div F = −∇ΠF`; pressure `Π(u ⊗ u) + q`, as §4.1 | consistent | C01 |
| 3.1 Ladyzhenskaya, GN (N8), Lean | `d = 2, 3`; dilation | `θ = d(½ − 1/q)`: `½`, `¾`; `(4,4)`, `(10/3,10/3)`, `(4,3)` give `2/r + d/q = d/2`; source constant `√2` squared is 2 | true | N01 |
| 3.2 trilinear form (N9) | `d = 2`, `d = 3` | `2^{1/4}·2^{1/4} = √2`; `‖B(u,u)‖ ≤ ‖u‖₄²`; time exponents 2 and `4/3` | true | none |
| 3.3 product, Kato–Ponce (N10) | `s = 2`; `|x|^{−a}χ` on `ℝ` | `Δ(fg) − fΔg = gΔf + 2∇f·∇g`; in `Hˢ` iff `s < ½ − a`; square fails for `a ≥ (½ − s)/2` | true | none |
| 3.4 Aubin–Lions (N11), Lean | `sin(nt)x`; constant `e_n`; translates; `r = ∞` | `‖u_n‖² → (T/2)‖x‖²`; Hölder exponent `1 − 1/r`; Lean form needs no reflexivity | true | C03 |
| 4.1 weak solutions (W12) | exponents; a priori bound | `4/d`: 2, `4/3`; `y² ≤ y₀² + 2∫‖f‖y` gives `y ≤ y₀ + ∫‖f‖` | true | none |
| 4.2 Leray existence (W13) | source at `d = 3`, `f = 0` | OP17 Def. 4.5 line 2132, Thm 4.7 line 2172, Thm 4.2 line 1933, Lemma 4.3 line 1989, pages 41–45 | locators agree | none |
| 4.3 two-dimensional theory (W14) | stability constant; Lamb–Oseen; decay | `√2ab c ≤ νb² + a²c²/(2ν)`, rate `1/ν`; `∫_{‖y‖≤r}K_{νt} = 1 − e^{−r²/4νt}`; `t‖∇u(t)‖² ≤ ‖u₀‖²/(2ν)` | true | N02 |
| 4.4 weak–strong uniqueness (W15) | `p = ∞`; `(4,6)`; general `p` | `θ = d/p`, `1 − θ = 2/q`; Young gives `ν^{−(1+θ)/(1−θ)} = ν^{1−q}`; norm scales `λ^{1 − d/p − 2/q}` | true | none |
| 5.1 bilinear lemma (M16), Lean | `X = ℝ`; `a = 0`; two solutions | `(1 − √(1−s))/(2η) ≤ 2‖a‖`; `η(‖x‖+‖y‖) < 1` forces `x = y`; Lipschitz `(1 − 4ηr)^{−1/2}` | true | none |
| 5.2 Fujita–Kato, Kato (M17) | powers of `ν`; Kato exponent | bilinear `ν^{−3/4}`, linear `ν^{−1/4}`; `(ν(t−s))^{−1/2−1/4}`, `∫(t−s)^{−3/4}s^{−1/2} = Bt^{−1/4}`; `½ − 3/12 = ¼` | true | none |
| 5.3 agreement (M18) | exponents | `2/4 + 3/6 = 1`; `L⁴H¹ ⊂ L⁴L⁶` | true | C01 |
| 5.4 blow-up rates (M19) | ODE; scaling; source | `y² ≥ ν³/(2C(T*−t))`; `T₀ ≥ ‖u₀‖⁴/(2c⁴ν⁵)`; OP17 lines 1644–1664, 2621 agree at `ν = 1` | true | none |
| 6.1 vorticity, conservation (E20) | `d = 2, 3`; rotation; strain; Beltrami | `Ω₂₁ = ω`, `Ω₁₂ = −ω₃`, `Ω₁₃ = ω₂`; `ΩA + AᵀΩ = ΩS + SΩ`, zero for `d = 2`; `(u·∇)u = −x`; `curl u = u` | true | none |
| 6.2 Biot–Savart (E21) | radial `ω`; `e₃` at `x = e₁`; far field | `e₃ × e₁ = e₂`; `Δuⱼ = ∂ₖΩⱼₖ`; `‖x‖⁻² ∈ L²` at infinity, `‖x‖⁻¹ ∉` | true | none |
| 6.3 local theory, inviscid limit (E22) | Riccati; rate | `y ≤ y₀/(1 − Cty₀) ≤ 2y₀` at `T`; `d/dt‖w‖ ≤ ‖∇u⁰‖_∞‖w‖ + ν‖Δu⁰‖₂`; `s > 2` gives `Δu⁰ ∈ L²` | true | none |
| 6.4 Beale–Kato–Majda (E23) | scalings | `λ²·λ⁻²`; `ab·(ab)⁻¹` | invariant | none |
| 6.5 two-dimensional Euler (E24) | Osgood; radial `ω₀` | `∫₀¹dr/(r(1 − log r)) = ∞`; `r(t) = r₀^{exp(−Ct)}`; angular velocity `(1/2πρ²)∫_{‖y‖≤ρ}ω₀` | true | none |

- Source locators checked against the text: 19 of 46 (Ożański–Pooley 6, Tao's Notes 1–3 9, Constantin–Seregin 1, Grafakos–Oh 1, Crippa–Stefani 2); all found at the cited number and page.
- Library declarations opened at the pins: 36 (10 in Mathlib, 26 in Tau Ceti at `2fd255d`), each at the cited file and line; the heat-kernel normalisation and the Bessel symbol read in the source.
- Cross-roadmap citations resolved: PDE §1.3, §1.4, §2.2, §2.3 (multiplier `−iξ_j/|ξ|`), §6.1, §6.3, §7.1–§7.3 on main; OneParameterSemigroups on main (completed); CompressibleEulerEquations §4.3 at its open head.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- Elaboration of `Suggested.lean` at the pins: succeeds, `sorry` the only warning (7, all theorems; no definition or instance). The 13 elaborated types were compared with the README; no binder is lost.
- One-tactic probe on a copy of the file (`rfl`, `infer_instance`, `simp`): none of the seven admitted theorems closes.
- Headline theorems: Helmholtz–Weyl, commutation with the heat semigroup, the off-diagonal heat estimate, Ladyzhenskaya, Aubin–Lions and the bilinear lemma are stated; the Riesz formula and `Lᵖ` projection, the Stokes semigroup, the trilinear form and Layers 4–6 are named in the docstring with the carrier each lacks.
- Overlap check: read IncompressibleFlows, PDE, CompressibleEulerEquations, YangMillsConnectionsAndCaloricGauge; the whole-space Leray projection, pressure, Biot–Savart law and solution theory are shared with IncompressibleFlows, this roadmap claims them on `E` and says so (see the last section); the integer-order product estimate is CompressibleEulerEquations §4.3 and is distinguished; YangMillsConnectionsAndCaloricGauge only uses the Leray projection in Checks; the Riesz transforms, Besov spaces and heat semigroup are PDE's and are consumed. No other roadmap states an Aubin–Lions lemma or declares any of the Lean names.

Source independence: 13 passages compared with 7 texts (Ożański–Pooley, Tao's Notes 1, 2 and 3, Constantin–Seregin, Grafakos–Oh, Crippa–Stefani), none shared; largest share Tao's notes and Bedrossian–Vicol, 9 of 46 locators each; contents compared with Tao's notes (mild solutions, then weak solutions, then Euler; here weak before mild, after three layers with no counterpart): independent; Bedrossian–Vicol's contents could not be read, but its cited chapters 2, 4, 5 serve Layers 6, 4, 5, the reverse order.

Research link: the headline targets are the theorems of Leray (1934), Fujita–Kato (1964), Kato (1984), Beale–Kato–Majda (1984) and Yudovich (1963), the base of current work on Navier–Stokes regularity; Layers 1–4 are prerequisites of the stochastic Navier–Stokes programme PDE names. Rests on the README's References and on Ożański–Pooley (2017) and Tao's notes (2018).

## Not verifiable

- Bedrossian–Vicol, Majda–Bertozzi, Lemarié-Rieusset, Lions 1969, Grafakos, Galdi: books or a paywalled chapter with no legal open copy found; their 20 locators (§1.3, §3.1, §3.4, §4.2–§4.4, §5.2, §6.1–§6.5, Conventions) were not read. The statements were checked by computation.
- Wang's 2013 lecture notes and Danchin's 2005 lecture notes: no legal copy found; they carry the only locators of §5.1 and, with Lions, of §3.4.
- Tao's notes were read from his page as text without the formulas: the cited numbers, titles and settings match, the displayed hypotheses could not be compared symbol by symbol.
- Leray 1934, Lions–Prodi 1959, Ladyzhenskaya 1959, Prodi 1959, Serrin 1963, Fujita–Kato 1964, Kato 1967, 1972 and 1984, Kato–Ponce 1988, Beale–Kato–Majda 1984, Yudovich 1963, Simon 1987: cited by year without a locator; not read.
- Ownership against the two packages listed on the board (analytic number theory, Lawrence–Venkatesh): unrelated subjects; their files were not read.

Automatic checks set aside as false positives: the report of TeX subscripts in the tightness bullet of §4.2 points at a formula inside a code span that wraps over a line break; the report that the README names a roadmap the project does not cite as a supplier points at the scope bullet on IncompressibleFlows, which states an overlap and cites nothing from it.

## Source issues

- none

## For the human reviewers

- **Scope.** IncompressibleFlows (pull request #237, open) plans the Euclidean Leray projector, pressure, Biot–Savart law and Navier–Stokes and Euler theory (its Layer 2 and completion targets); this README claims them on `E` and states the overlap (lines 938–946). One owner must be chosen.
- **Not tested.** `TauCetiRoadmap/IncompressibleFluids/README.md` §5.1 (line 592) and §6.1 (line 735) rest only on Wang's and Danchin's lecture notes and on Majda–Bertozzi, none of which could be read; Bedrossian–Vicol (9 locators) likewise.
- **Licence.** Wang (2013) and Danchin (2005) are unpublished lecture notes, and Tao (2018) is a set of notes on its author's page; no host for the first two could be classified.
