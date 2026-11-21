# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 5ac6d6d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** accepted

**Summary.** Accepted: no statement was found false or unsupported. The formal proof is now cited by file and declaration at a fixed commit, and every one of the 80 cited declarations exists in the file named; the statements I opened (Layers 6, 9, 10, 14) say what the README records, and the Soulé and Bayer-Fluckiger–Emery–Houriet locators are correct. There are six small corrections and one format note, none blocking; the most substantial is that `Suggested.lean` states the torsion bound only for totally complex fields while the overview's headline (2) is for every number field. The human reviewers still decide the scope question (most statements rest on a formal proof announced on 20 November 2026) and the licence of that repository.

## C01 — The Lean theorem is the torsion bound for totally complex `L`, while headline (2) of the overview and 9.4 state it for every number field.

A reader of the acceptance test sees less than the roadmap promises: a library that proved only the totally complex case would pass it, although 9.3–9.4 plan the case with real places as this roadmap's own target. The general statement is statable at the pins: it is the present one with the binder `[IsTotallyComplex L]` removed (the statement at the previous head). The README is explicit about the restriction (9.4, line 285, "for totally complex `L`"), so nothing is misstated.

Would either of these suit: state the theorem for every number field, since 9.4 asserts it; or keep the restricted statement and say in the module docstring that the case with a real place is a target of 9.4 that the file leaves out because only the totally complex case is formally verified.

## C02 — Two citations of the formal proof omit hypotheses of the declaration they name.

In 9.7 (lines 411–413) `UpperTheory.V.ZK.lemmaK` is said to prove the bound "from Poitou–Tate duality, local finiteness and local Tate duality taken as hypotheses". The declaration (`ModularityArgument/ClassCounting/LemmaKOfLitN.lean`) has a fourth hypothesis, `BOdd`: the rank of the span of the primitive projections of `H_{k+1}(GL_n(𝒪_L); ℤ)` is at most `r₂(L)` for `k + 1 < r₂(L)`. The same hypothesis enters `SUpperOf := SChain → BOdd → SUpper`, which 9.5 (line 313) cites as proving the bound "without Borel's theorem". The formal proof does discharge it, as `UpperTheory.V.ZK.bOdd` in `ModularityArgument/ClassCounting/BOdd.lean`; naming that declaration at 9.5 would make the sentence checkable.

In 14.1 (lines 697–699) the proof "proves this as `GlobalTheory.Ord2.vanishOrdL_of_zetaUr`"; that declaration has the type `LitCoh → ZetaUr → VanishOrdL`. Say that the two are hypotheses, or name the declarations that discharge them (I did not look for them).

## C03 — The parenthesis in the route of 9.1 names the wrong quotient.

Line 200 says "the saturation of `⟨Λ₀⟩` modulo `⟨Λ₀⟩` embeds in it and maps onto the torsion". The saturation modulo `⟨Λ₀⟩` is the torsion itself, and `⟨Λ₀⟩` need not lie in the lattice `M` spanned by the chosen basis: for `ι = {1}`, `Λ₀ = {2, 3}` and the subfamily `{2}`, `⟨Λ₀⟩ = ℤ` and `M = 2ℤ`. What embeds in `ℤ^ι/M` is the saturation modulo the span of the chosen subfamily (their intersection with `M` is that span), and it maps onto the torsion. Replace "modulo `⟨Λ₀⟩`" by "modulo the span of the subfamily". The bound is unaffected.

## C04 — In 11.1 the hypothesis that `A` contains the cyclotomic `ℤ_p`-extension of a number field is used nowhere in the route.

The route (lines 565–570) uses only `(σ − 1)^p = 0`, inflation–restriction for `G/H` cyclic of order `p`, and the procyclic tame inertia at the places of `P`; all three hold for a number field `A`, where the statement reads `rank_p Cl(A′) ≤ p(rank_p Cl(A) + #P)`. If the hypothesis is kept because the formal proof and UniformWildKernelBounds work at infinite level, one clause saying so would stop an implementer from looking for where it enters.

## C05 — The description's list of what is taken from roadmaps on main names three suppliers of about twenty, and its sentence on `Suggested.lean` omits the restriction to totally complex fields.

"It takes the following from roadmaps on main:" is followed by GeneralAlgebraicKTheory, StableHomotopyKTheory and GeneralizedCohomology only. The head has supplier contracts for twenty-one roadmaps on main (ArithmeticKTheory, ArithmeticGaloisDuality, IntegralIwasawaTheory, ProfiniteCohomology, LatticePackingsAndPerfectForms and others). Either list them or write "among others". The sentence "`log_log_card_torsion_groupHomology_GL_le`, the torsion bound of 9.4 with all primes" should add "for totally complex `L`", as the head now states it.

## C06 — The family index describes this roadmap by content it does not have.

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 110, reads "bounds for eigenspaces of class groups and K-groups by Bernoulli numbers, Stickelberger-type annihilation, and the vanishing of Bloch–Kato groups". This roadmap leaves Stickelberger annihilation to EulerSystemsCyclotomicMainConjecture (Scope and ownership, line 732) and has no statement of that kind; its Layer 9 (torsion of the homology of `GL_N(𝒪_L)`, the étale bound) is not mentioned. A line that matches: "twisted Tate–Shafarevich groups and their bounds by Bernoulli numbers, explicit torsion bounds for the homology of `GL_N(𝒪_L)`, étale cohomology and K-groups, and the vanishing of Bloch–Kato groups".

## N01 — ArithmeticKTheoryPartII §8.3 is cited in 9.8 (a) (line 444) as a comparison but appears in neither the Layer 9 Dependencies nor the supplier contracts; a clause "(a comparison, not an input)" would tell a reader that nothing is consumed from it.

## Questions for the author

- In 14.1 (lines 688–692, repeated under Downstream consumers) the formal proof is said to prove the downstream instance under `(p − 1) ∤ 2e`, `p ∤ d_K h_K`, even level prime to `d_K` and irreducibility on `G_{K(μ_{p^∞})}`. The next paragraph gives another list (`admitted`, `SrcL`). In `Definitions/Foundations/FinalTheorems.lean` and `VanishOrdL.lean` I found the stable line, the inertial characters and the ordinary source, but not the first three conditions. Which declaration carries them? I could not search the repository by content.
- Does Arlettaz's Theorem 1.5 give one exponent `R_m` for the map to `H_m(GL(R); ℤ)` for every ring, from `m = 1`? The two sources I could read cite it only for the primes that can divide the kernel (Soule1999 lines 347–348; BFEH2014 lines 145–146). The text is not available to me.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.17 (b) real places | `ℓ = 2`, `e` even; `e` odd | `H¹(ℝ, ℚ₂/ℤ₂(−e))`: `ℤ/2` (trivial action); `0` (`ker N`/`im(σ−1)` with `σ = −1`). ArithmeticKTheory §6.9 Check: same parities | agree | none |
| 6.17 (b) duality | ArithmeticKTheory §6.9; HeckeIdeals §10.1(b) | `Sha²` kernel over `S ∪ S∞`; pairing with real places in both kernels; `T^D = ℚ_ℓ/ℤ_ℓ(−e)` for `T = ℤ_ℓ(e+1)` | consistent | none |
| 6.17 (c) formal proof | `Formalism.GaloisCohomology.VFormula`, `shaLeV` | `VLen + len H⁰ = shaLen + Σ local H⁰` under `PTCase` (`l ≠ 2` or no real place) | as recorded | none |
| 6.17 (d) cyclotomic layer | degree `ℓ^m`, `κ = 1 + ℓ^c u` | `#H⁰(F′) = ℓ^{c+m+v(e)}`; norm valuation `(c+m+v(e)) − (c+v(e)) = m`; `Ĥ⁰ = 0` | holds | none |
| 6.17 (d) quadratic | `ℓ = 2`, cyclic `H⁰` | `H¹(C₂, ℤ/2^a)` has order ≤ 2; `kerTwo`: length ≤ 1 | holds | none |
| 6.17 Checks | `ℚ(μ₃₇)`, `ℓ = 37`; `ℚ`, `ℓ = 2`, `e = 1` | `H²/37 ≅ Cl/37 ⊗ μ^{⊗e} ≠ 0`, `Br[37] = 0` (one place); `{−1,−1}` nonzero at 2, kernel 0 | true | none |
| 6.18 (a) | `ψ` ramified of order prime to `ℓ`; unramified | `W^{I_p} = 0` (`1 − ζ` a unit); `Frob − 1 = ψ(p)⁻¹p^{−e} − 1 ≠ 0`, onto divisible `W` | equality holds | none |
| 6.18 (b) | `F = ℚ`; `M = ℤ/ℓ`, `O` ramified | `N = 1`: `length Ш¹(ℚ) = V_ℓ(1, e; {ℓ})`; `length_O(M ⊗ O) = e_O` | sum formula holds | none |
| 6.18 (c), (d) formal proof | `loss`, `nuBound`, `upV` | `loss = (n+n²)·nuBound + ω(N)·n·v_ℓ(n)`, `nuBound ≤ log₂N + 2 + log₂e`; `upV`: `#T·h0` | within `(Ne)^c` for `N ≥ 3` | none |
| 9.1 | `Λ₀ = {b}`; `Λ₀ = ∅`; `{2, 3}` in `ℤ` | `ℤ/b`, bound `b`; torsion 1; torsion 1, `M = 2ℤ` | bound holds; route wording | C03 |
| 9.2 | trivial action on a point; `C₂` free on `EG` | complex `ℤ ←1– ℤ ←0– ℤ` exact; `(m+2)·s^{m s^m}`; `#H₁(C₃) = 3 ≤ 81`; formal `bound m A s (m+2)` | holds | none |
| 9.3 (a), (e), (f) | `L = ℚ`, `N = 2`; totally complex | stabilizer 12 ≤ `3⁴ = 81`; `dim V = nN²/2 ≤ nN²`; `orbnum` exponent `12(p+1)(nN)³N` | as recorded | none |
| 9.4 and the Lean theorem | `m = 0`; `N = 1`; torsion of order 1, 2 | torsion trivial, `log log 1 = log 0 = 0` in Lean, RHS ≥ `8c₂ log 12`; `log log 2 < 0` | true for `c₂ ≥ 0` | C01 |
| 9.4 from the formal proof | `tors_le`, `orbnum`, `hglFG_of` | `log log # ≤ 12(m+1)(nN)³N·log T + log(m+2) + log m + m·nN²·log 3 + …`, `T = 2|d|nN` | `c₂` exists; all `N`, `m` | none |
| 9.5 | `j = 1`; `B = 0` | `#H₁(GL_n; ℤ/ℓ^ν) ≤ (ℓ^ν)^{r₁+r₂−1}·#μ`; one value. Formal `SUpper`: `(l^ν)^{r₂}·tc·tc`, `n = 2(k+1)+4` | holds | C02 |
| 9.6 (a), (b1) | `g = 1`; `x = 0`; rank count | `0 = v(1)`; `0^{i−1} = 0` for `i ≥ 2`; `2E+2` elements in rank `2E+1` over `ℤ/ℓ^ν` | consistent with `STheta`, `SRel` | none |
| 9.7 | formal `LemmaK`, `kBound`; corestriction | `log # ≤ exp((2en)^C log 2D)`; `cd_ℓ = 2` gives `cor` onto for `ℓ` odd or `L` totally imaginary | as recorded | C02 |
| 9.8 (b) | `m` even, kernel of Hurewicz | `#K_m[ℓ^v] ≤ #(K_m/ℓ)^v`; `#H²(μ_ℓ) ≤ h·ℓ^{#S_ℓ}`, `#S_ℓ ≤ n(ℓ−1)` | holds | none |
| 10.1 (a) Check | `E = ℚ(i)`, `e = 11`, `ℓ = 691` | `P₁₃ = 30030`, `30030/2730 = 11`, `4·11·(−691) = −30404`, `v₆₉₁ = 1`; `K₂₂(ℤ) = ℤ/691` | sharp | none |
| 10.1 (b) | constant | `N·4^{e+2}·N^{e+1}·4(e+1)!/(2π)^{e+1} = 16(2/π)^{e+1}N^{e+2}(e+1)!`; formal `bnd N k = 16N^{k+1}k!` | agree | none |
| 10.1 character | `ℚ(μ₇)`, `p = 7`, `χ = ω⁴`, prime 2 | `ω⁴(2) = 16 ≡ 2`, `1 − 4 ≡ 4` unit; `χ⁻¹(2) = 4`, `1 − 8 ≡ 0`; residue characters `ω, ω⁴` | `ψ`, not `ψ⁻¹` | none |
| 11.1 | `q ≡ 3 (8)`; `q′ ≡ 7 (16)`; two steps | orders `2^{n−2}`, `2^{n−3}` mod `2^n`: 2 and 4 places; `4r + 8[M:ℚ] + 16[M:ℚ] = 4(r + 6[M:ℚ])` | Checks true | C04 |
| 12.1 | IntegralIwasawaTheory §12.3; CM quadratic `χ`, `e` even | same formula with `E = F(μ_p)`; `χ(c) = −1 = (−1)^{e+1}` | consistent | none |
| 13.1 | division algebra case; good non-ordinary place | eigenvalues `χ_p^a, χ_p^b ∈ ℤ_p`, central forces `χ_p^{a−b} = 1`, `a ≠ b`; slopes in `(0, k−1)`, irreducible | holds | none |
| 14.1 | KatoEulerSystems §7.9(1); formal `VanishOrdL` | finite `Sel(K, T)` has no divisible subgroup; formal: `ℚ`, `l ≠ 2`, weight `2e+1`, `admitted`, `SrcL` | as recorded | C02 |
| Padding probe | `simp`, `rfl`, `infer_instance`, `exact ⟨0, by simp⟩`, `aesop` | five errors, none closes the theorem | not padding | none |

- Source locators checked against a text: Soule1999 7 (p. 2 lines 53–54; Props. 1–2; Lemma 1 lines 175–182; Prop. 3 lines 227–241; Thm. 1 lines 265–272; pp. 7–8 lines 313–317; Thm. 2 lines 343–348); BFEH2014 5 (Thm. 1.1, Cor. 1.2, lines 47–49, Thm. 2.2, Cor. 2.3 with §3.1). All correct.
- Formal proof at commit `ab0b752`: 54 cited files fetched, all present; 80 cited declarations, each found in the file named (`hglFG_of` and `fgShift` in the directory named); about 40 statements read.
- Library declarations opened at the pin: `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:23`), `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:17`), `AddCommGroup.torsion` (`Mathlib/GroupTheory/Torsion.lean:371`), group-homology Shapiro (`Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean`), `DirichletCharacter.generalizedBernoulli` (`TauCeti/NumberTheory/DirichletCharacter/GeneralizedBernoulli.lean:81`, representative `N` for the zero residue, so `B_{1,1} = +1/2`).
- Cross-roadmap citations resolved: 25 roadmaps, about 60 section ids; 21 on main, KatoEulerSystems, ArithmeticKTheoryPartII, HeckeIdealsAndTaylorWilesRelations and UniformWildKernelBounds at their open heads. Van der Kallen's stability stands inside SchemeKTheoryOperations §6.7; the Hopf-algebra statement inside Polylogarithms §2.2.
- Dependency check: `depcheck: 171 roadmaps, 2004 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. The 67 names the citation tool finds in no pinned library are declarations of the formal proof, each confirmed in its file.
- Elaboration: `lake env lean` on `Suggested.lean` gives `declaration uses 'sorry'` at line 81 as its only message; the elaborated type has the binders `L`, `[IsTotallyComplex L]`, `N`, `m`, `1 ≤ N` and matches 9.4 restricted to totally complex `L`.
- Changes outside the folder: the three family-index files only.

Overlap check: read UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations and ArithmeticKTheoryPartII (open), ArithmeticKTheory, BorelRegulators and EulerSystemsCyclotomicMainConjecture (main). Sha kernels and their duality: HeckeIdealsAndTaylorWilesRelations §10.1, cited; `Sha²_{i,ℓ}` and the wild kernels: ArithmeticKTheory §6.9, cited; Stickelberger annihilation: EulerSystemsCyclotomicMainConjecture, not restated; the low-range Hurewicz theorem: ArithmeticKTheoryPartII §8.3, cited as a comparison; `Ш¹(F, ℓ, e)`, the torsion bounds and the étale bound: this roadmap, consumed by UniformWildKernelBounds by section. No other roadmap cites Arlettaz, Bayer-Fluckiger–Emery–Houriet or a torsion bound for `GL_N(𝒪_L)`.

Source independence: 12 passages compared with 3 sources (9.1, 9.2, 9.3, 9.4, 9.8, four References entries and the Lean docstring against Soule1999 and BFEH2014; 9.6 and 9.7 against the formal proof's statements), none shared beyond standard phrases; largest share the formal proof, 80 of about 95 locators; contents compared with its directory layout and with the sections of Soule1999: independent (the cited files lie in more than twenty directories in no order the layers follow; Soulé's §1 on Voronoi reduction comes after 9.1–9.2 here).

Research link: Layer 9 extends the torsion bounds of Soulé (1999, 2003) and Bayer-Fluckiger–Emery–Houriet (2014) to all primes; Layers 13–14 rest on Kato's finiteness theorem and the Ribet–Momose open image theorem; the roadmap supplies UniformWildKernelBounds in a family following Alpöge's formal proof (2026). Rests on the README, Soule1999, BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8 (a)): recorded as uncertified; the text was not read.
- Soulé 2003: described in the README only through BFEH 2014; its own text was not read.
- The formal proof: statements were read, proofs were not checked or compiled; whether `LitCoh` and `ZetaUr` are discharged was not looked for.
- The first list of hypotheses in 14.1 for the downstream instance: no declaration found that carries it (first question).
- The Check of 11.1 that the bound fails for a quadratic extension at odd `p`, and its Heisenberg model: read, not computed.
- The copy of this folder in the family-wide pull request #2954: its head was not available to compare; the tools report that the two merge cleanly.

## Source issues

- none

## For the human reviewers

- Scope: Layers 6, 10 and 9.5–9.7 cite no refereed source; their only source is the formal Lean proof by L. Alpöge announced 2026-11-20 (README References, line 842; family index lines 9–12).
- Licence: the repository `leanprover-community/riemann-hypothesis` reports no licence file through the GitHub licence endpoint at the time of this review. The README cites its file paths and declaration names and copies no code.
- Licence: `Suggested.lean` uses the same carrier expression as the formal proof's `UpperTheory.V.K.HGL` and `torsHGL` (`GeneratorCountTuples/TorsBoundPow.lean`); the theorem's name, quantifiers and bound differ from `TorsBound` there.
- Not tested: the wording comparison with the formal proof covered its Lean statements only; it has no prose to compare.
