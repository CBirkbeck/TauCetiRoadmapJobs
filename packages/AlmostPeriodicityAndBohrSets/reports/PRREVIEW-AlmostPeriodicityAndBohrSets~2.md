# Review of AlmostPeriodicityAndBohrSets (pull request #3191 at 4d9521e)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. The Lean statement of Ruzsa modelling over `𝔽_p` in `Suggested.lean` drops the hypothesis `s ≥ 1` that the README has, and at `s = 0` it is false (it yields `False` on `𝔽₂²`); one binder repairs it. The three findings of the previous review are repaired, and the rest of the mathematics was recomputed and holds. There are three small corrections and two format notes, none blocking. Two points are left for the human reviewers (reused Lean shapes, and the books of Layers 8–10 that could not be read).

## R01 (P1) — `exists_linearMap_isAddFreimanIso` omits `1 ≤ s`, and at `s = 0` the statement is false

The file is the acceptance test, so every statement in it must be true; this one is contradictory, and anything could be derived from it.

The README states the theorem of 7.3 for `s ≥ 1` (line 834). The Lean declaration (`Suggested.lean`, lines 262–267) takes `(s : ℕ)` with no hypothesis. At `s = 0`, `0 • A = {0}`, so `#(s • A - s • A) = 1` and the conclusion asks for `G'` with `Fintype.card G' ≤ p` and a linear `φ` with `IsAddFreimanIso 0 A (φ '' A) φ`. Mathlib's `IsAddFreimanIso` (Combinatorics/Additive/FreimanHom.lean, line 101) has the field `bijOn`, so `φ` is injective on `A` whatever `n` is. Take `p = 2`, `G = ZMod 2 × ZMod 2`, `A = Finset.univ`: an injective map from 4 points into a type with at most 2. On a copy of the file, `example : False` is proved from the declaration instantiated at these values (`hiso.bijOn.injOn`, `Fintype.card_le_of_injective`, `omega`), and elaborates without error.

Add `(hs : 1 ≤ s)` to the signature. At `s = 1` the statement is the README's and holds: `φ` is injective on `A` exactly when its kernel meets `A − A` in `0`, which the line-quotient argument gives.

## C01 — Step 1 of the proof of 5.5 does not say which triple convolution, and with indicators of `A` and `−A` alone the stated bounds do not come out

Step 1 (lines 667–669) applies 2.2 "to a triple convolution of normalised indicators of `A` and `−A`" and obtains `T` of measure `e^{−O(L⁴)}`. In 2.2 the exponent is `m = ⌈max 1 (log (μB/μW))⌉`; with `B, W ∈ {A, −A}` this is `m = 1`, and then the comparison is `|g∗1_{−A}(t) − g∗1_{−A}(0)| ≤ εα` against a main term of size `α²`, which needs `ε ≈ α` and gives `μ(T) = e^{−O(L/α²)}`. The argument the section cites (Sanders2012 lines 107–112) uses the indicator of the sumset in the middle: with `g = μ_{−A} ⋆ 1_{A+A} ⋆ μ_{−A}` one has `g(0) = 1`, support in `2A − 2A`, `μB/μW ≤ 1/α` so `m ≈ L`, and `ε ≈ 1/L` over `≈ L` iterations gives `K^k = e^{O(L · L · L²)}`, the stated `e^{−O(L⁴)}`. Name `B = A + A` in step 1 (after replacing `A` by a compact subset of measure at least `α/2`, so that the sumset is measurable as 2.2 requires); "a small multiple of `α²`" is then the error for the unnormalised `1_{−A} ⋆ 1_{A+A} ⋆ 1_{−A}`.

## C02 — In step 2 of the torsion-free proof of 7.3, "a rescaling of `[0, P)` onto `ZMod q`" is not the map that works

A rescaling such as `x ↦ ⌊qx/P⌋` is not additive on any arc: with `P = 4`, `q = 2`, `1 + 1 = 0 + 2` but `0 + 0 ≠ 0 + 1`. The composite that is a Freiman `k`-homomorphism on the part of `A` falling in one arc of length `P/k` is: reduce mod `P`, dilate by `λ`, take the integer representative in `[0, P)`, and reduce that integer mod `q` (the last map is a group homomorphism `ℤ → ZMod q`; the representative is additive on `k`-fold sums up to a multiple of `P` that is constant on an arc). Say "the integer representative in `[0, P)` reduced mod `q`" (lines 825–826).

## C03 — The module docstring gives no missing carrier for the de Leeuw–Glicksberg decomposition, and none is missing

The docstring of `Suggested.lean` (lines 33–35) lists the decomposition among the results not stated, with a reason only for the other one. It is statable with the three predicates the file already defines: for `IsWAPMean m` and `IsWeaklyAlmostPeriodic f` there are `g`, `h` with `f = g + h`, `IsAlmostPeriodic g`, `IsWeaklyAlmostPeriodic h`, and `m n = 0` for the bounded continuous `n` with `n x = ‖h x‖`. Either state it, or say in the docstring that it is not counted among the headlines.

## N01 — In the Check of 4.2 on `ℤ/2`, "`ρ < 2`: the Bohr set is `{0}`" needs `0 ≤ ρ`

Widths in `unitaryBohrSet` are real, and for `ρ < 0` the set is empty (line 479).

## N02 — In 1.1 the two theorem numbers are in the opposite order to the two names

Theorem 7.2 of Sanders 2013 is Marcinkiewicz–Zygmund and Theorem 7.3 is Khintchine (Sanders2013 lines 655 and 681); the heading and the bullets of 1.1 name Khintchine first (line 252).

## Earlier findings

- R01 of the previous review (modelling lemma of 7.3 unsupported): repaired. 7.3 now states "**Theorem (torsion-free groups; Ruzsa).**" with `q ≥ #(k • A − k • A)` and `#A ≤ k * #A'`, which is Sanders2012 line 920, and a separate `𝔽_p` theorem with its own proof; 7.4 (small doubling), 7.5 and the Lean statements are restricted to those two classes; Scope names the general case as outside. The new Lean statement for `𝔽_p` has the defect of R01 above.
- R02 (compact abelian Fourier theory planned twice): repaired. 5.1 opens "CompactGroupsPartII §5.1 supplies … the bijection … the Hilbert basis of characters … the coefficient … and Parseval", and Scope and the supplier contracts cite it.
- R03 (multiplication on the Bohr compactification): repaired. 8.2 reads "`(χ ψ) f = χ (x ↦ ψ (y ↦ f (x * y)))`", with the Check `(ι 1 · ι 1) f = e(2θ)`; 10.3 uses the same formula.
- C01–C07, N01–N03: all repaired (commutativity stated in Conventions and 0.1; §3 and §§7–8 cited in 5.5; locators added in 1.1, 2.1, 3.1, 3.3, 6.1, 6.2, 7.3; `Convex.isClosed_iff_forall_isClosed_inter_closedBall`; docstring section numbers; sanity-check marking; description; line lengths; docstring; "a translate of the carrier").
- The two questions: answered in the text (5.5 no longer attributes a radius to Sanders; 6.2 is described as a variant of Sanders' Lemmas 6.2 and 6.3).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Khintchine, Marcinkiewicz–Zygmund | `m = 1, 2, 3`; symmetrisation | `(2m−1)!! = 1, 3, 15 ≤ m^m = 1, 4, 27`; `m^m · 4^m = (4m)^m`; Sanders2013 lines 655, 681 | holds | N02 |
| 1.2 sampling | general `k, m` | `(4m)^m k^m 4^m / k^{2m} = (16m/k)^m` | holds | none |
| 2.1 `croot_sisask` | Markov; fibre; `A = S = H`, `f = 1_H` | `(64m/(kε²))^m ≤ 4^{−m}`; fibre `≥ μS/(2K^k)`; `x ∉ H`: `2^{1/2m} > ε`; Sanders2012 line 193 | holds; Lean = README | none |
| 2.2 `L^∞` form | `μB/μW ≤ e^m`; `μB = 0` | `(ε/e) e^{1/2} ≤ ε`; `‖μ_W‖_{(2m)'} = μ(W)^{−1/2m}`; `m = 1` | holds | none |
| 2.3 iterated almost periods | `j = 2` | `L_{xy}h − h = L_x(L_y h − h) + (L_x h − h)`, norm `≤ 2δ` | holds | none |
| 3.1 `ruzsa_triangle`, covering | `0·∞`; counting measure | convolution `≥ μ(xY⁻¹) = μY` on `XZ⁻¹`; `#F μB ≤ KμB`; Tao2008 lines 192, 271 | holds | none |
| 3.3 `balog_szemeredi_gowers` | `A = B = H`, `K = 1`; `μ ↦ tμ` | `#H³ ≤ #H³`; `t³` both sides, `t` both sides; unpopular energy `≤ E/2`; Tao2008 line 652 | holds | none |
| 4.3 `inv_prod_le_measureReal_unitaryBohrSet` | `ι = ∅`; unequal `ρᵢ` | `1 ≤ 1`; `((1+ρ/2)/(ρ/2))^{2d²} = (1+2/ρ)^{2d²}`; doubling `5^{2d²}` | holds | none |
| 4.4 `bogolyubov` | `A = G`; `S₃`, `A = A₃` | `Σ_Spec d ≤ α/(α³/4)`; tail `< α⁴/4`; `Re h ≥ α⁴/8`; coefficients `1/2, 1/2, 0`; Bohr set `A₃` | holds | none |
| 5.1 characters, `cft` | `ℤ/N`, `1_{0}`; large spectrum | `1/N`; `#·η²α² ≤ α`; CompactGroupsPartII §5.1 has both headline names | holds; supplier cited | none |
| 5.3 Chang | general `f`; `f = 1_A` | `#Δ ≤ C²pη⁻²(‖f‖₂/‖f‖₁)^{4/p}`, factor `≤ e²` at `p = log(e‖f‖₂²/‖f‖₁²)`; ratio `1/α` | holds | none |
| 5.4 abelian Bohr sets | `ℤ/2`, `w < 2`; `ofFinset ∅` | chord set `{0}`; rank `0`, chord set `G`; bound `∏(1+2/w)^{−2}` from 4.3 at `d = 1` | holds | none |
| 5.5 `bogolyubov_ruzsa` | `A = G`; index-`n` subgroup; `g = μ_{−A}⋆1_{A+A}⋆μ_{−A}` | `g(0) = 1`; `Σ|ĝ| ≤ 1/α`; `(3e^{CL})^{−2CL⁴} ≥ e^{−C'L⁵}`; `2 • A = A + A` by `two_nsmul` | holds; sketch imprecise | C01 |
| 6.2 local Chang | weight `w`; Riesz products | `w = 1/μ(B⁺) ≥ 1/(2μB)` on `B`; `1 + 4^{−k}2^k ≤ 2`; `w(X) ≥ τ/2`; Sanders2012 lines 426, 438 | holds | none |
| 7.1 coset progressions | Freiman 2-isomorphism with `0 ↦ 0` | `ψ(Σnᵢxᵢ + h) = Σnᵢψ(xᵢ) + ψ(h)`; injectivity of `ψ` gives properness | holds | none |
| 7.2 Bohr sets contain progressions | `ℤ/N`, one frequency | `#H ∏(2Nᵢ+1) ≥ #G ∏ w/(2πd)`; side `2/π < 1`; `wN/π` against `wN/(2π)` | holds | none |
| 7.3 `exists_isAddFreimanIso_zmod` | `A = {0..n−1}`, `k = 2` | `#(2A−2A) = 4n−3`; `|a+b−c−d| ≤ 2n−2 < q`; Sanders2012 line 920 | holds | C02 |
| 7.3 `exists_linearMap_isAddFreimanIso` | `s = 0`, `𝔽₂²`, `A` everything; `s = 1`; subspace | `#(0A−0A) = 1`, `#G' ≤ 2 < 4`: `False` derived; `p^m ≤ (p−1)#D + 1 ≤ p#D` for `s ≥ 1` | Lean false at `s = 0` | R01 |
| 7.4 dense and small doubling | densities after modelling | `1/(8K^{16})`, `1/(pK^{16})`; `log(8eK^{16}) ≤ 16 log 2K`; Sanders2012 lines 914, 924 | holds | none |
| 7.5 `freiman_ruzsa`, `freiman_ruzsa_zmod` | `K = 1`; `{0..n−1}`; `L ≥ log 2` | `#(A+P) ≤ K⁵#A`; `#Q ≤ K⁸#A ≤ e^{8L}`; `L ≤ L⁵/0.23` | holds | none |
| 8.2 Bohr compactification | `ℤ`, `e(nθ)` | `(ι g ι h) f = f(gh)`; `e(2θ)` on both sides | holds | none |
| 9.1, 9.3 `isWeaklyAlmostPeriodic_iff` | `ℤ`, `1_{n≥0}`, `xₘ = m`, `yₙ = −n`; `1_{0}` | iterated limits `0` and `1`; `1_{0}` in `C₀`, translates at distance 1 | holds | none |
| 9.2 `isCompact_closure_toWeakSpace_iff_doubleLimit` | `K = {0} ∪ {1/n}`, `fₙ = 1_{[0,1/n]}` | limits `1` and `0`; each `fₙ` clopen indicator | holds; source not read | none |
| 9.4 `exists_isWeaklyAlmostPeriodic_coeff` | translate identity | `F(a⁻¹x) = ⟪π x ξ, π a η⟫ = T_ξ(π a η)(x)` | holds | none |
| 10.2 `exists_isWAPMean`, `IsWAPMean.eq` | `ℤ`, `1_{0}`; extension off the subalgebra | averages of norm `1/n`; mean constant on `Q_f`; linear extension exists | holds | none |
| 10.4 `ellis` | `2xy/(x²+y²)` | `1` on the diagonal, `0` at the origin; not closed by instances | holds | none |
| 10.5 decomposition | `ℤ`, `c + 1_{0}` | `f_ap = c`, `wapMean|1_{0}| = 0` | holds; statable | C03 |
| 11.1 convolution through the mean | flight part | `|m(uv)| ≤ ‖v‖ m|u| = 0` | holds | none |
| 11.2 `exists_unitaryBohrSet_subset_mul_inv` | `h(1)`; positivity | `h(1) = m(f²) ≥ m(f)²`; `f(y) f(x⁻¹y) > 0 ⇒ x ∈ SS⁻¹` | holds | none |
| 11.3 `exists_unitaryBohrSet_subset_of_mean` | `ℤ`, `A = 2ℤ` | `M(1_A) = 1/2`; `‖P[1_A]‖² ≥ M(1_A)²`; `A−A+A−A = 2ℤ` | holds | none |

- Source locators checked against the text: 17 (Sanders2012 Theorems 1.1, 10.1, 11.1, 11.3, Lemmas 4.3, 5.2, 6.2, 6.3, 11.2, §3; Sanders2013 Theorems 1.4, 7.2, 7.3, §§7–8; CrootSisask2010 Proposition 3.3; Tao2008 Lemmas 3.2, 3.6, Theorem 5.2; GreenRuzsa2007 Propositions 6.1, 6.4).
- Library declarations opened at the pins: 52 (Mathlib 27, Tau Ceti 25); all cited names exist where cited.
- Cross-roadmap citations resolved: CompactGroupsPartII §5.1 at its open head (section and both headline names present); the others were found by the citation resolver, none missing.
- Automatic checks: all passed. Dependency check: `depcheck: 2 roadmaps, 6 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 19 `sorry` warnings, nothing else. `#check @name` compared with the README for the declarations with section variables: `fourierCoeff` does not carry `[T2Space G]` (its body does not need it); no other difference except R01.
- One-tactic probe on a copy (each `sorry` replaced by `simp`, `rfl`, instance search in turn): none of the 19 theorems closes.
- Pointwise instances: `2 • A = A + A` holds by `two_nsmul` for `Set ℤ` and `Finset ℤ`, so `k • A` is the iterated sumset and not a dilation.

Overlap check: read FourierAnalyticAdditiveCombinatorics, CompactGroupsPartII, SidonSetsAndLinearEquations, CompactGroups, BanachSpaceTheory (and the cited sections of BanachAlgebras, SieveMethodsAndPrimePatterns, NoncommutativeIntegration); compact abelian characters, coefficient and Parseval: owner CompactGroupsPartII §5.1, cited here; Bogolyubov in finite abelian groups: owner FourierAnalyticAdditiveCombinatorics Layer 4, which leaves Bohr sets and Chang's lemma to others; nothing else shared.

Source independence: 8 passages compared with 5 sources, none shared; largest share Sanders2012, 10 of about 25 locators; contents compared with Sanders2012 (§§4–11): independent (Layers 0, 1, 3, 4, 8–11 have no counterpart, and Layer 5 places Chang's lemma before Bohr sets where the source has the reverse). The books cited for Layers 8–10 could not be read.

Research link: Layers 2 and 5–7 are the Croot–Sisask lemma (Croot–Sisask 2010) and the Bogolyubov–Ruzsa and Freiman–Ruzsa bounds of Sanders 2012 and 2013, with Ruzsa's and Green–Ruzsa's modelling; Layer 11 is Følner 1954 and Beiglböck–Bergelson–Fish 2010 per the README's References. Rests on the README and on the five texts read.

## Not verifiable

- Ruzsa 2009, Theorem 3.5 (7.3): book chapter not held; read only as quoted at Sanders2012 line 920.
- Namioka–Asplund 1967 (10.1) and Følner 1954 (11.3): the publishers' pages are on hosts the sources service does not classify; not read.
- Beiglböck–Bergelson–Fish 2010 (11.3): paywalled.
- Grothendieck 1952 (9.2, "Théorème 6"), Eberlein 1949 (9.4), Ellis 1957 and Namioka 1974 (10.4), de Leeuw–Glicksberg 1961 (10.5), Chang 2002 (5.3), Bourgain 1999 (6.1): no legal copy was found in the previous round; not sought again.
- Burckel 1970, Berglund–Junghenn–Milnes 1989 ("Appendix A", "Ch. 4"), Ruppert 1984 ("Ch. III"), Rudin 1962, Tao–Vu 2006: books not held; Layers 8–10 were checked by computation only.
- LeanAPAP and openai/math, whose Lean shapes the roadmap says it follows: not opened.

## Source issues

- none

## For the human reviewers

- **Licence.** `BohrSet` in `Suggested.lean` (line 176) is said to follow LeanAPAP's `BohrSet`, and the README's Provenance section names openai/math at `adc7f124`; both are stated to be Apache-2.0. Neither repository was opened.
- **Not tested.** Layers 8–10 cite three books (Burckel; Berglund–Junghenn–Milnes; Ruppert) that could not be read; wording and arrangement were not compared with them.
