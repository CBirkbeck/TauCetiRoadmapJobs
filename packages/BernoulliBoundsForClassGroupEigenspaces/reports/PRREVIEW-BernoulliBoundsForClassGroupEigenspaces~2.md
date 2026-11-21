# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 6b5fd75)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** needs changes

**Summary.** Changes are needed. The values I computed for the Checks and worked examples of Layers 6 and 9–14 all agree with the text, but four findings block. No statement carries a source locator. The headline 9.4 and 9.8(b) are credited to Soulé, whose papers prove weaker bounds. The route of 9.8(a) cites AlgebraicTopology for Postnikov sections it does not contain. Two auxiliary statements of 9.6 are false in a degenerate case. There are three small corrections and four format notes. The human reviewers have to decide on scope: the family's source is an unrefereed formal proof announced on 20 November 2026. They should also know that Soulé 2003, the most-cited source, could not be read.

## R01 (P2) — No statement carries a source locator, and the statements beyond Soulé's and Arlettaz's papers cite no source at all.

An implementer cannot check a hypothesis or a constant against any text. The constant `16 N^{e+2}(e+1)!` of 10.1(b), the exponent shape of 9.7, the defect `(Ne)^c` of 6.18(c) and all of 9.5–9.6 rest on their route sketches alone.

How I know: the README gives no theorem, proposition, section or page number for any work it cites. The six References (lines 622–627) give a work and a range of README sections, nothing more, and none of them is cited for 6.18, 9.5–9.7, 11.1, 12.1, 13.1 or 14.1. The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–13) says the family follows Alpöge's formal Lean proof, but this README never cites it.

Smallest change: give the theorem and page of a published source at each statement that one states. For example, 9.8(a) can cite Arlettaz's Theorem 1.5, the result Soule1999 line 348 cites for the Hurewicz kernel. For each statement taken from the formal proof, give the file and declaration name in the repository the family index links, at a fixed commit.

## R02 (P2) — The sources named for 9.4 and 9.8(b) prove weaker statements than the ones attributed to them.

An implementer who opens the cited papers will not find the theorem stated. The headline of `Suggested.lean` is titled "Soulé's bound", with the source "Soulé 2003, with Soulé 1999" (lines 69–76), and the References credit Soulé 2003 with 9.1–9.4 and 9.8 (line 624).

Soule1999 treats `SL_N(ℤ)` only and bounds the torsion modulo the primes `≤ N + 1` (Theorem 1, Soule1999 lines 270–272). It calls the extension to rings of integers an open question (lines 53–54), yet the References credit it with "perfect forms over rings of integers" (line 623).

I could not open Soulé 2003 itself. Bayer-Fluckiger, Emery and Houriet say its bounds hold only up to torsion of small order, and that its bound for `log card` is at least `exp(α|D_F|^{1/2})` (BFEH2014 lines 25–27 and 47–49). Their own improvement still excludes the primes `≤ max(d + 1, 2n + 2)` (BFEH2014 lines 28–31).

By contrast, 9.4 includes all primes ("All primes are included", line 191) and has `log log` linear in `log |d_L|`, and 9.8(b) excludes only the primes dividing `R_m`.

Smallest change, in the README and in the docstring of `log_log_card_torsion_groupHomology_GL_le`:
- State Soulé's results as he proves them, with their locators.
- Credit the all-primes, log-linear forms of 9.4 and 9.8(b) to their actual source (the formal proof, by file and declaration), or to this roadmap's own route through 9.2–9.3.
- Correct the description of Soulé 1999 in the References.

## R03 (P2) — The route of 9.8(a) cites AlgebraicTopology Stage 8 for Postnikov sections, which that roadmap does not contain.

An implementer who follows the *Needs* line of 9.8 finds neither of the two inputs it names. AlgebraicTopology's Layer 8 (its "Stage 8") has Eilenberg–MacLane models (8.8c) and Hurewicz modulo a Serre class (8.8d), but the word "Postnikov" does not occur anywhere in that README. Nothing there bounds the homology of `K(π, i)` in a range by an integer independent of `π`.

The Postnikov towers of spaces are in StableHomotopyKTheory §§3.18–3.21 (on main). Its §3.35 puts the homology of Eilenberg–MacLane spaces in the Serre classes, but still gives no uniform exponent.

Smallest change: cite StableHomotopyKTheory §§3.18–3.21 and 3.35 in three places: the *Needs* line of 9.8 (lines 317–318), the Layer 9 Dependencies (line 326) and the contract "From TauCetiRoadmap.AlgebraicTopology" (lines 584–586). State the uniform exponent of the Eilenberg–MacLane homology in degrees `≤ m + 1` as a step of 9.8(a), with Arlettaz's locator.

## R04 (P2) — Two statements of 9.6 are false as written in a degenerate case.

In (a), `v : k^× → ℤ/q` is not said to be a homomorphism. But the left side `θ_V(prism_g(…))` is a homomorphism in `g` (the route says so). It also vanishes at `g = 1`, because `prism_1(z) = ∂([1|1] × z)` is a boundary. So (a) forces `v` to be a homomorphism and fails for any other map.

In (b3), `J = ∅` gives `div(β) = 0`, and `GL_∅(F)` is trivial with determinant `1`, so the claim fails for `β = −1`.

Smallest change: write "a homomorphism `v`" in (a) (line 221) and "a nonempty finite set `J`" in (b3) (line 233).

## C01 — The overview bounds the length of `Ш¹(F, ℓ, e)` by that of `H²`, but 6.17(c) proves this only for the strict form.

Line 3, and the same sentence in the description, says of `Ш¹(F, ℓ, e)` that "its length is bounded by that of `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`". 6.17(c) (lines 46–47) proves this for `Ш¹_str`, and for `Ш¹` gives only `length Ш¹ ≤ length H² + r₁(F)`. The difference is the real-place quotient of 6.17(b), which can be nonzero only for `ℓ = 2` with `e` even. For `F = ℚ` that quotient vanishes, because the torsion class of `H¹(G_S, ℤ₂(e+1))` is nonzero at the real place. Would "the length of its strict form is bounded by …", or adding "+ r₁(F)", serve?

## C02 — The first clause of 6.17(d) restates HeckeIdealsAndTaylorWilesRelations §10.1(f).

At the head of its open pull request, §10.1(f) already says that for Galois `F′/F` the kernel of restriction lies in `H¹(Gal(F′/F), W^{G_{F′}})`. 6.17(d) (lines 50–51) states this again, and its route cites only inflation–restriction. Cite §10.1(f) for that clause in the route of (d). The three vanishing statements that follow it are this roadmap's own.

## C03 — The description says every pull request of the family carries the family index "with identical content"; at present they do not.

At their heads, the family index of the FiniteReductiveGroups (#2881) and AdelicHeightsAndSuccessiveMinima (#2883) pull requests differs from this one by 52 and 65 changed lines. For instance, their opening paragraph says the family follows "a complete formal proof" without naming it. The sentence could say instead that the family's pull requests carry versions of the index, which are brought to one text, by rebasing on whichever merges first, before they merge.

## N01 — KTheoryFiniteLocalFields is cited without a section in three places: the *Needs* line of 9.6 (line 263), the Layer 9 Dependencies (line 326) and its supplier contract (line 578). Quillen's computation is its Layer 1.

## N02 — The layer ids continue ArithmeticKTheory's: Layer 6 begins at 6.17, after that roadmap's 6.1–6.16, and Layers 9–14 follow its Layers 1–8. A reader can therefore take "§6.17" for ArithmeticKTheory's. One sentence in the guide to the layers saying the numbering is this roadmap's own would prevent that; renumbering would break UniformWildKernelBounds' citations.

## N03 — Two notation points:
- `v_O` in 10.1(a) (line 341) is not defined; the Check and the route of (b) use the normalisation `v_O(ℓ) = 1`.
- In 9.6, `β` names three things: the determinant of (b3), `α^{P_{M,E}(γ⁻¹)}` in the route, and a Bott element in `β^E·{α}` (line 262).

## N04 — The description's first paragraph prints `H²(𝒪_F1/ℓ, ℤ_ℓ(e+1))`: the brackets of `[1/ℓ]` were lost.

## Questions for the author

- 6.18(c): when `ℓ | [F:ℚ]`, does the sum run over all characters of `G` with values in `O`, including those of `ℓ`-power order? Is `δ` one bound for all `ψ`? No source is given to check the statement against.
- 9.5: are the `j`-cycles on which `Φ_n` is defined integral cycles, or cycles with `ℤ/ℓ^ν` coefficients? The route lifts mod-`ℓ^ν` cycles, which suggests the latter, but the statement does not say.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.17(b) real-place quotient | `ℓ = 2`, `e` even and odd; `ℓ` odd | `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` for `e` even (trivial action) and `0` for `e` odd (`−2M = M`); `0` for odd `ℓ` | matches "zero unless `ℓ = 2` and `e` even" | none |
| 6.17(c) order identity, Check over `ℚ(μ₃₇)` | `F = ℚ(μ₃₇)`, `ℓ = 37`, all `e` | global and local `H⁰` equal (totally ramified); `H²/37 ≅ Cl/37 ⊗ μ^{⊗e} ≠ 0` | `length Ш¹ = length H² ≥ 1` | none |
| 6.17(c) against the overview | `ℓ = 2`, `e` even; `F = ℚ` | layer `≤ length H² + r₁`; overview `≤ length H²`; for `ℚ` the real quotient is `0` | overview stronger than layer | C01 |
| 6.17(d) cyclotomic layers and degree 2 | `κ = 1 + ℓ^c u`, degree `ℓ^m`; `[F′:F] = 2` | `H⁰` cyclic of order `ℓ^{c+m+v(e)}`; norm has valuation `m`; `Ĥ⁰ = A[ℓ^{c+v(e)}]/ℓ^m A = 0`; `H¹(C₂, cyclic) ≤ ℤ/2` | holds | C02 (citation) |
| 6.17(f), 6.18(b), 10.1 parity | action of `c` on a `ψ`-component | `c` acts by `ψ(−1)`; `Ш⁻` is the `(−1)^{e+1}`-eigenspace, i.e. `ψ(−1) = (−1)^{e+1}` | consistent across 6.17, 6.18, 10.1 | none |
| 6.18(a) | `ψ` unramified at `p`; `ψ|I_p` of prime-to-`ℓ` order; `ψ|I_p` of `ℓ`-power order | `Frob` acts by `ψ(p)⁻¹p^{−e} ≠ 1`; `W^{I_p} = 0`; `W^{I_p} ≠ 0` | equality and strictness as stated | none |
| 6.17 Check `V(ℚ, 2) = 0` | `ℓ = 2`, `e = 1` | `H²(ℤ[1/2], ℤ₂(2)) = ℤ/2` detected at `ℝ` (sign of `{−1,−1}`), so `Sha² = 0` | `V(ℚ, 2) = 0` | none |
| 9.1 | `Λ₀ = {b}`; `{(2,0),(0,2)}` with `b = 2`; `Λ₀ = ∅` | torsion `b`, `4`, `1` against bounds `b`, `4`, `1` | holds (sharp) | none |
| 9.2 acyclic-complex bound | equivariant spectral sequence | `E²_{m,0}` torsion `≤ (m+2)^A` (by 9.1); `∏_{q=1}^m s^{A s^q} ≤ s^{mAs^m}` | matches the stated bound | none |
| 9.2 finite-group bound | bar complex of `S` | cycles have rank `≤ #S^j`, killed by `#S` | `#H_j ≤ #S^{#S^j}` | none |
| 9.3 Check and (f) | `L = ℚ`, `N = 2` | `A₂` has minimal vectors `±e₁, ±e₂, ±(e₁−e₂)`, automorphism group of order 12; `#GL_N(𝒪/3) ≤ 3^{nN²}` | `12 ≤ 81`; (f) holds | none |
| 9.4 Lean | `L = ℚ`, `N = 1`, `m` odd; `m = 0` | `log log 2 = −0.37 ≤ RHS ≥ 0`; `log log 1 = 0`; simp/norm_num/exact probes fail | consistent, not padding | R02 (source) |
| 9.4 from 9.2–9.3 | `A = (2|d|nN)^{c₁(m+1)(nN)³N}`, `s = 3^{nN²}` | `log log ≤ log A + m nN² log 3 + O(log m)` | shape of `c₂` bound recovered | none |
| 9.5 | `Φ(ψ^ℓ z) = ℓΦ(z)` | `∏_{t<j−1}(ℓ − ℓ^{t+2}) = ℓ^{j−1}·unit`; factor `t = k−2` kills products of `k` primitives | route consistent; no source | R01 |
| 9.6(a) | `g = 1`; `v` not a homomorphism | `prism_1(z)` is a boundary, so `θ = 0`, forcing `v(1) = 0`; left side is a homomorphism in `g` | false unless `v` is a homomorphism | R04 |
| 9.6(b1)–(b3) | Künneth; `|t − t₀| ≤ M < ℓ^c`; `J = ∅`, `β = −1` | rank `2E+1`; `(t₀−t)x₂ = ℓ^c` solvable; `det = 1 ≠ β` | (b1), (b2) hold; (b3) fails at `J = ∅` | R04 |
| 9.7 | `L = ℚ(i)`, `ℓ = 2`; corestriction | `H² = 0` so `log 1 = 0`; corestriction is onto in degree `cd_ℓ = 2` | holds | none |
| 9.8(a) | `m = 1`; the route's inputs | `K₁(R) → H₁(GL(R))` is an isomorphism; "Postnikov" occurs 0 times in AlgebraicTopology | statement holds; route miscited | R03 |
| 9.8(b) | `A[ℓ^v]`; `H²(𝒪_{L′}[1/ℓ], μ_ℓ)` | `#A[ℓ^v] ≤ #(A/ℓ)^v`; `#H² ≤ h·ℓ^{s−1}` with `s ≤ n(ℓ−1)` | inequalities hold | R02 (source) |
| 10.1 Check | `E = ℚ(i)`, `ψ = 1`, `e = 11`, `ℓ = 691` | `4·30030·(−691/2730) = −30404 = −691·44`, `v = 1`; `#K₂₂(ℤ) = 691` | bound 1 = length 1 | none |
| 10.1(a) for `ψ = 1`, `E = ℚ` | `ℓ ∤ e+1`; `ℓ | e+1`; `(ℓ−1) | e+1` | true value `v(B/(e+1))` against bound `v(P·B)`: `≤`; `≤`; `0 ≤ 0` | holds in the cases tried | R01 (source) |
| 10.1(b) | `|B_k(x)| ≤ 4k!/(2π)^k`; `P ≤ 4^{e+2}`; `n/2` minus characters | `|x_ψ| ≤ 16(2/π)^{e+1}N^{e+2}(e+1)!`; sum `≤ (n/2) log(…)` | holds (`n/2 ≤ n`) | none |
| 10.1 integrality | `f^{k−1}B_k(a/f)` expansion | denominators are `f` (`j = 0`) and von Staudt primes `≤ e+2` | `N·P·B` integral | none |
| 11.1 and Check | `p = 2`, `A = ℚ(μ_{2^∞})`, `q ≡ 3 mod 8`; iteration | `⟨q⟩` has index 2 in `ℤ₂^×`, so 2 places, and `2(0+2) = 4`; induction gives `p^r x₀ + Σ p^{r−j+1}#P_j` | holds | none |
| 11.1 Heisenberg Check | `p` odd; `p = 2` | `⟨yz^k⟩ ∩ H = 1`; `H ≅ (ℤ/p)²`; for `p = 2`, `(xy)² = [x,y] ∈ H` | holds | none |
| 12.1 Check | `E′ = ℚ(μ₇)`, `χ = ω⁴`, `n = 2`, adding 2 to `S` | Frobenius at 2 has order 3, residue field `𝔽₈`, characters `ω, ω⁴`; `1−2χ(2) ≡ 4`, `1−2χ⁻¹(2) ≡ 0` | `χ⁻¹`-part convention consistent | none |
| 13.1 | `τ` in an open subgroup of inertia, inside `H` | eigenvalues `χ_p^a, χ_p^b ∈ ℤ_p`; in a division algebra the element is central, so `χ_p(τ)^{a−b} = 1` | contradiction since `a ≠ b` (`k ≥ 2`) | none |
| 14.1 Check | `k = 2e+1`, `r = e` | `1 ≤ e ≤ 2e`, `e ≠ (2e+1)/2`; a divisible subgroup of a finite group is 0 | holds | none |

- Source locators checked against a text: 0 at claims (the README gives none); 6 reference entries examined; Soule1999 read in full; BFEH2014 read for its account of Soulé 2003.
- Library declarations opened at the pins: Mathlib `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:72`), `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`), `groupHomology` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`); Tau Ceti `DirichletCharacter.generalizedBernoulli` (`TauCeti/NumberTheory/DirichletCharacter/GeneralizedBernoulli.lean:81`, giving `B_{1,1} = +1/2`) and the cyclotomic characters (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/`).
- Cross-roadmap citations resolved: 51 ids, counting a range of layers once. On main: ArithmeticKTheory 2.1–2.3, 3.1, 3.2, 3.4, 5.1, 6.1, 6.3, 6.7–6.9, 7.3–7.5; ArithmeticGaloisDuality D7.6, R02.4.3; IntegralIwasawaTheory 0.1–0.3, 3.4, 3.5, 10.4, 10.5, 12.1–12.3; ProfiniteCohomology Layers 6, 7, 9; PadicMeasuresIwasawaAlgebras 6.1; LatticePackingsAndPerfectForms 1.7, 1.8, 4.1, 4.9; SchemeKTheoryOperations 6.7; Chebotarev Layer 10; ClassFieldTheory Layers 8–12; LFunctions Layers 4–5; CyclotomicClassGroupsAndStickelberger 3.1; DirichletPadicLFunctions 0.4; PadicHodgeTheory 3.6; SelmerIwasawaCohomology 4.9; EulerSystemsCyclotomicMainConjecture 0.29–0.31. At open heads: HeckeIdealsAndTaylorWilesRelations 10.1, KatoEulerSystems 4.1 and 7.9. One drift: AlgebraicTopology Stage 8 (R03).
- Dependency check: `depcheck: 7 roadmaps, 120 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: every check passed at this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives `sorry` as its only warning. The elaborated type of the one declaration matches 9.4 of the README (absolute `c₂` before all `L`, `N`, `m`; `1 ≤ N`; finite generation and the bound), with no section binders lost.
- Headline theorems: (1) 10.1, (3) 9.7 and 9.8, and (4) 13.1 and 14.1 are not statable at the pins, and the module docstring names each with what it lacks; (2) 9.4 is stated. The one-tactic probe (`simp`, `norm_num`, a direct `exact`) closes nothing, so it is not padding.

Overlap check: read UniformWildKernelBounds, KatoEulerSystems, ArithmeticKTheoryPartII, ModularIwasawaMainConjecturesPartII and HeckeIdealsAndTaylorWilesRelations (open), and ArithmeticKTheory, EulerSystemsCyclotomicMainConjecture and IntegralIwasawaTheory (main). The only shared object is the restriction-kernel clause of 6.17(d), owned by HeckeIdealsAndTaylorWilesRelations §10.1(f) (C02). Searches for the Hurewicz-kernel bound, perfect forms over number fields and twisted Tate–Shafarevich groups found no other owner, so this roadmap owns them; LatticePackingsAndPerfectForms owns only the case `L = ℚ`, which 9.3 cites.

Source independence: 7 passages compared with 2 sources (Soule1999 for 9.1, the route of 9.2, the definitions of 9.3, 9.4, the route of 9.8 and the Layer 9 guide; BFEH2014 for 9.4 and 9.8), none shared beyond standard phrases. Largest share is Soule2003, cited in 5 of 13 reference pointers (the README has no locators at claims). Its text and contents could not be read. Against Soule1999's contents (perfect forms, then homology of `SL_N(ℤ)`, then Vandiver) the arrangement is independent: Layer 9's order 9.1 → 9.2 → 9.4 ← 9.3, 9.4 → 9.8 is forced by its *Needs* lines.

Research link: Layer 9 states torsion bounds for the homology and K-theory of rings of integers in the line of Soulé (1999, 2003), later improved by Bayer-Fluckiger, Emery and Houriet (2014). The roadmap supplies UniformWildKernelBounds in a family aimed at the Riemann hypothesis for Dirichlet L-functions. This rests on the README, the family index, Soule1999 and BFEH2014.

## Not verifiable

- Soulé 2003 (Documenta Math., Extra Volume Kato): the EMIS mirror returned HTTP 503 on four attempts; the publisher's host (EMS Press) is in no licence class; EuDML and zbMATH returned 403.
- Soulé 1979 (Invent. Math. 55): paywalled, and no legal copy was found.
- Arlettaz 1991 (J. Pure Appl. Algebra 71): paywalled (uncertified).
- Ash 1984 (Duke Math. J. 51): the Project Euclid page has no open PDF.
- Rubin 1991 (Kolyvagin's system of Gauss sums): paywalled (uncertified).
- 9.5, 9.6(b4)–(b5), the routes of 9.7 and 10.1(a), and 6.18(c)–(d) beyond the computations in the table: no source is given to read them against.
- Whether `Suggested.lean` agrees with the formal proof linked in the family index: not checked.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–13) names its source as a formal Lean proof of the Riemann hypothesis for Dirichlet L-functions, announced 2026-11-20. This README cites it nowhere, and 6.18, 9.5–9.7, 11.1 and 12.1–14.1 cite no refereed source.
- Not tested: Soulé 2003, the most-cited source (5 of 13 reference pointers), could not be read, so the wording and arrangement checks were not done against it.
- Licence: `Suggested.lean` was not compared with the public formalisation linked in the family index.
