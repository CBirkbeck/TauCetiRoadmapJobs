# Review of UniformWildKernelBounds (pull request #2892 at 8f4ea0c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The fifteen sampled targets, the four headline statements 7.3–7.6 and the Checks attached to them were recomputed and hold, the supplier sections cited say what the README takes from them, and `Suggested.lean` elaborates with no message. There are two small corrections and two format notes, none blocking. One thing is left to the humans who approve: the text of [FormalProof], to which every sampled target's locator points, could not be read from a legal place, so its declarations, its licence and its arrangement were not compared with the roadmap.

## C01 — The contract for ModularityAndLanglandsExtensions §2.43 and the References entry for Theorem 5.5.2 state irreducibility for a density-one set of primes without the hypothesis of extremely regular weight

A reader of the supplier contract ("§2.43 (irreducibility of `r_{ℓ,ι}(π)` for a density-one set of `ℓ` …", line 3575) or of the References ("Theorem 5.5.2: irreducibility for a density-one set of primes", line 3737) would take the theorem to cover the automorphic points of this roadmap. It does not: Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2 (arXiv 1010.2561v4, text lines 3787–3792) and ModularityAndLanglandsExtensions §2.43 at its open head both assume that `π` has extremely regular weight, and the points of 4.4 do not have it: their exponents `(e + 1, e, 1, 0)` give two equal two-element sums, `(e + 1) + 0` and `e + 1`.

No route is affected: 3.20(f), 4.2(d), 4.4 and 4.8 use §2.43 only as the hypothesis `ExtremelyRegularIrreducibility n` of AutomorphicGaloisRepresentationsPartII AG2.6, which is itself a statement about forms of extremely regular weight (AG2.6, line 2085 of that README on main). Adding "for `π` of extremely regular weight" in the two sentences makes them exact.

## C02 — The description's list of statements given without a route names 4.2(b) where the head has 4.2(b) and (c)

The description says: "the clauses (w1), (w2) of the automorphy statements 3.22(c), 4.2(b) and 4.5(b)". At this head the Summary (line 55) has "3.22(c), 4.2(b), (c) and 4.5(b)", and 4.2 says "The clauses (w1), (w2) in (b) and (c) are theorems of [FormalProof] whose routes are not given here." The description's clause would read "3.22(c), 4.2(b), (c) and 4.5(b)".

## N01 — The family index says "The family follows the formal Lean proof" (index `README.md`, line 10), and the References of this README say that the window bound and case analysis of [FormalProof] "are reconstructed in Layers 1–7" (line 3684). The project's rule is that a roadmap does not say it follows a source. If what is meant is the mathematical route and not the arrangement, wording such as "the family states, as targets, the theorems that the formal proof establishes" would say so; the index is shared by the family's pull requests, so a change there is made in all of them.

## N02 — 1.1 is stated "for every `e ≠ 0`" (line 262, and the Checks at lines 276 and 370), while `Ш¹(F, ℓ, e)` is defined by the Conventions as the group of BernoulliBoundsForClassGroupEigenspaces §6.17, which is defined for `e ≥ 1`. Either say in the Conventions that the same definition is used for every integer `e ≠ 0` in 1.1, or state 1.1 for `e ≥ 1`, the range every later target uses.

## Questions for the author

- In the Check of 4.3 (line 2414), is `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, a point of the ring `R_ℓ = 𝔘/P` of 4.1 at `ℓ = 29`? I checked that it is conjugate self-dual, has the reduction of the diagonal point, and satisfies the relations of `I_ord` (the three factors vanish on the third, second and first coordinate). What stopped me: 4.1 (local chart)(ii) characterises only the points that reduce to the diagonal lift over a finite local algebra, and this point does not, so its lying on the component `P` needs an argument the README does not give (for instance the stability of `P` under conjugation by the integral points of the group preserving the form, the residual representation being trivial on the decomposition group).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.4 Case split (sampled) | `ℓ ∉ B`, `(ℓ−1) ∣ 2e`; `ℓ ∈ B`, `e = 1`, `e ≥ 2`; `χ = 1` | 0.3(d): `ℓ−1 ≥ 4` gives `e ≥ 2`, `ℓ ≤ 2e+1 < 2t+1`; Z/III/II by `ψ = 1`, odd, even; `B(1) = {3, 7}`, `P(1) = 7` | covers every triple |
| 1.2 Growth (sampled) | `X = ℤ_ℓ`, `g = 1+ℓ`; `ℓ = 2`, `h ≡ 1 mod 4`; `R = 1` | `ℓ^k ≥ R`, `k+1 ≤ ⌊log_ℓ R⌋+2 ≤ j₀`; `N_h x ∈ ℓx + ℓ²X`, `coker N_h = X/ℓX`, length `≤ R`; `m+1` exactly | holds |
| 1.3–1.6, 2.1, 2.2 | `∣z∣ < 1`, `= 1`; `a ≤ 0`; `B = 2C_Kκ/δ` | `r(e) ≥ ∣s−e∣` gives `v ≤ j+c+v_ℓ(e−s)`; forbidden log-length `R log 2B <` range `(R+1) log 2 + R log B`; `e > x^κ` or `e ≤ x^{δ/(2C_K)}` | holds |
| 2.3 Dyadic base fields (sampled) | `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`; §11.1 iterated at `p = 2` | `−q` generates `1+4ℤ₂`: index `2`; `−q′ ∈ 1+8ℤ₂`: index `4`; `4g + 4·2[M:ℚ] + 2·8[M:ℚ] = 4(g + 6[M:ℚ])` | holds, matches §11.1 |
| 2.4 | `J = 4J_*`; `x ≥ X^{1/J_*}` | `log(2∣d∣) ≪ X^{δ/(4J_*)} ≤ x^{δ/4}`; exponent `x^{δ/2}·x^{δ/4}`; `m′ ≤ α log₂ x + 2` | holds |
| 3.1 Counting (sampled) | `K = ℚ`, `n = 1`; ALS.5b.6 twist | `φ(M)(2H+1)` characters; `(1−n)/2 + (n+1)/2 = 1`, so `π∣det∣` is the cohomological twist; index `≤ (3M)^{n²[K:ℚ]}` | holds |
| 3.2 Congruence integers | `q = 4, 5, 7`; `q = 2`, `z = e^{2πi/3}`; `q = 5`, `e = 2` | `3.25 < 3.5`; `4.2 > 3.683`, `4.2 < 4.236`; `6.14 > 4.65`; `7/4 < 9/4`; `60 < 94 < 100` | holds |
| 3.5 Bernoulli units (sampled) | `ℓ = 17`, `m = 6`, all eight primitive `ξ(5)` mod `17`; `ℓ = 5`, `f = 455` | sums `12, 14, 11, 4, 12, 0, 12, 2` for `ξ(5) = 3, 5, 6, 7, 10, 11, 12, 14`: zero only at `11`; `29120 ≤ 2¹⁵ < 58240`; shift relation rederived | holds |
| 3.11, 3.12 Block locus (sampled) | parity split of the `𝒢₃`-adjoint; bigness | even: `4d − d = 3d`; odd: `2d − 2d = 0`; `N − N′ ≥ 3d+1` gives minimal primes of dimension `≥ 3d+2 > 2d + a₁C₀ + a₂`; block `≤ (2d+2) + d` | consistent |
| 3.14 | Greenberg–Wiles with the condition relaxed at `w` | local term at `w`: `∣k∣²/∣k∣ = ∣k∣`; all other terms `1` (`κ` odd, `≠ ω`) | holds |
| 3.16 Nice primes (sampled) | 3-cycle `y`; (g) discriminant; (h) | charpoly `X³ − det`; `a²α₀^{2m} + d²α₁^{2m} + (4bc − 2ad)(α₀α₁)^m`; `γ^m = 1`, `γ ≡ 1`, `m` invertible gives `γ = 1` | holds |
| 3.18, 3.19 counts | `ω ⊕ 1`; `GSp₄`; `GL₂` | `1 = 0 + 1`; `4d − 10d + 4d = −2d`, excess `2d + 2`; `d − 3d + d = −d`, excess `d + 1` | holds |
| 3.20 Check on `m(19, ψ)` | `Q = {43, 71}`, `ψ = (·/5)`, `e = 18` | `43 ≡ 3 mod 8`, `71 ≡ 7 mod 16`; `N = 244240`; `19·N·64 = 296995840 > 2²⁸`; `m = 29` | holds |
| 3.21 Gaussian frames (sampled) | count weight by weight; conductors | `(0,1,1,1,0)` at the real place, `dim ad_j` at `ℓ` for `j > 0`: `0, −1, 0, +1, +1`; `ξ` of conductor `2^{c₂−1}` for `c₂ ≥ 4` | holds |
| 3.22 Eisenstein congruences (sampled) | `L₄`, `L₃²`, `L₃L₅` in `t`; distribution relation; `w = 13`, `7` | `t + 6t²`, `t² + 4t³`, `t² + 16t³ + 48t⁴`; `s = −1/6`, `p = −1/72` give `1/18`; factor `w^k − φ̄(w)`; `13^k − 1 ≡ 0`, `7^k + 1 ≡ 2 mod 3` | holds |
| 3.22(c) | determinant and residual characters of `σ` | `det σ = η_Kθ_w`; residues `χ̄_ℓ^jχ̄′η_K`, `(χ̄_ℓ^jχ̄′)⁻¹`; `φ` odd, `k = 2m+1` odd | holds |
| 4.3 Check | `ℓ = 29`, `e = 28`, `ψ` cubic mod `7` | `29 ≡ 1 mod 7`, `ω²⁸ = 1`, `28 ∣ 56`; relations of `I_ord` vanish coordinatewise; membership in `R_ℓ` not shown | question |
| 4.5 host data | `R₁(ℓ, χ) ≤ 2^{c₂(ψ)}` | `lcm(4, o(ψ₁)) ∣ 4o′_χ` gives `f₀ ∣ d_ℓ`, `n₀ ≤ v₂(ℓ^{d_ℓ}−1)`; `2ℓf_χ4^{n₀} ≤ R₁`; `8o_χv² < R₁` | holds |
| 4.6 Shapes (sampled) | Check: `(ℓ−1) ∣ e`, `ψ̄(Frob_ℓ) = 1` | `{ψα, ψ, χ_ℓ^eα, χ_ℓ^e}`: multiplier `θ` twice, residues `(θ̄, Ψ̄, ᾱ, 1)`, inertial characters `(α, 1, θ, Ψ)` | holds |
| 4.7 Rigidity (sampled) | hypotheses of §9.9(a), (b), (d) at the head | §9.9(a): `n ∈ {2,3}`, irreducible on open subgroups; (b): `GSp₄`, imaginary quadratic `F`; twist leaves `ad r` unchanged | matches |
| 4.8 Levels (sampled) | weight of `m`; 4.2(b); conductor Check | `m = (e−1, −1, −e−1)`: labelled `(e+1, 1, 1−e)`, `a = (e−1, 0, 1−e)`; `ℓ ∤ M` forces unramified support; conductor exponent `≤ 2v_p(N)` | holds |
| 4.8 with §2.43 | weights `(e+1, e, 1, 0)` | `{e+1, 0}` and `{e, 1}` both sum to `e+1`: not extremely regular; §2.43 enters only through AG2.6 | C01 |
| 5.1, 5.5, 5.6 | `ℓ = 5`, `13`; two primes `p, p′`; `χ` cubic mod `7`, `ℓ = 5`, `e = 2` | `2.236·1.829 = 4.09 < 5`; `γ + 1/√13 = 0.854 < 1`; `B(χ) = {3, 7, 11, 13}`, `f₀ = 2`, `n₀ = 3`, `5·7·13·64 = 29120`, `m = 15` | holds |
| 6.5 Checks | `M′ = 5`, `a = 3`; `E = ℚ(μ₇)`, `ℓ = 3` | `ε₃ = 0, −1, 1, 0`; `1 − 43² = −2³·3·7·11`; trivial character: `−B/k = −1`; `v₃(φ(21)) = 1`; `C = 30·8 = 240` | holds |
| 7.1, 7.2 | `ℓ` with `(ℓ−1) ∣ 2e`; Case IV | `ℓe ≤ (2t−1)(t−1) < 2t²`; odd order of `χ_P` kills the `2`- and `q`-components, conductor `∣ f_χ` | holds |
| 7.3 Polynomial bound (sampled, headline) | §10.1(b) summed over `e < t`; odd `ℓ ∣ [E:ℚ]` | `n log(16N^{e+2}(e+1)!) ≤ N log(16N^{t+1}t!)`; such `ℓ` divide `o_χ`; `Ш = Ш⁺ ⊕ Ш⁻` | holds |
| 7.4 Window theorem (headline) | `J = 2J_{2.4}`, `δ/2` | `X^{δ/J} = X^{(δ/2)/J_{2.4}}`; `q > 2X^κ + 1 + P ≥ max(2t+1, P)`; total `2(Nt)^C + (C+1)exp(x^{δ/2})` | holds |
| 7.5 Tower form (sampled, headline) | `X = 2^{Jk₀}`, `k = ⌈log₂ Y⌉` | `k ∈ [k₀, Jk₀/2 + 1]`; `2^{2k−2} < Y²`; `N ≤ 2^{O(n)}` as `k₀ ≤ n`; loss `≤ 2(t−1) log 2` at `ℓ = 2` | holds |
| 7.6 Budget form (sampled, headline) | `δ = ε/2`; consumer sizes | `X^{ε/(4J)} ≤ X^{ε/(2J)}`; `log N ≤ x^{ε/4} + α log x + c`; `2exp(x^{ε/2}) ≤ exp(x^ε)`; `Y₀^{ε/5}(1 + log²Y₀) ≤ Y₀^{ε/4}` | holds; consumers cite §7.6 |
| Summary, `ℚ(μ_ℓ)` and `ℚ` | `Hom(A/ℓ, ℤ/ℓ)(−e)`; localisation at `ℓ` over `ℚ` | injects into `Ш¹[ℓ]`; fixed part of `(A/ℓ)(e)` is the `ω^{−e}`-eigenspace; local and global `H⁰` agree, so the wild kernel is all of `H²` | holds |
| `Suggested.lean` docstring | library names at the pins | `tateShafarevich` takes any family `f : V → Type u`; `TopRep ℤ`; adic completions are local fields under a finite residue field | exact |

- Source locators checked against the text: 3 (the announcement, footnote 1 at text line 53 and the Vandiver sentence at lines 180–181; Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2, arXiv v4 lines 3787–3792). The README flags no locator as unverified. The roughly 165 declaration locators into [FormalProof] were not opened.
- Library declarations opened at the pins: 16, among them `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`, 72), `continuousCohomology` (`…/ContCohomology/Basic.lean`, 131), `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean`, 31), `TauCeti.maximalUnramifiedExtension` (`TauCeti/NumberTheory/LocalField/Unramified/Maximal.lean`, 97), `TauCeti.ZModTwist` (`TauCeti/Topology/Algebra/Group/Profinite/ProP/ZModTwist.lean`, 137), `TauCeti.continuousLocalCyclotomicCharacter` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean`, 54), `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` (`TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean`, 242), `NumberField.classNumber_le_bound` (`TauCeti/NumberTheory/EffectiveBounds/ClassNumber/Basic.lean`, 81), `ZMod.chineseRemainder` (`Mathlib/Data/ZMod/Basic.lean`, 889).
- Cross-roadmap citations: none dangling among those resolved mechanically; statements compared in full for BernoulliBoundsForClassGroupEigenspaces §§6.17, 6.18, 9.7, 10.1, 11.1, FrobeniusRestrictedRieszSums §0.4, ExplicitNumberFields §§0.3, 5.3, ReducibilityIdealsAndUltrafilterPatching §4.9, HeckeIdealsAndTaylorWilesRelations §§3.13a(f), 9.9, ModularityAndLanglandsExtensions §2.43, AutomorphicGaloisRepresentationsPartII AG2.6, ArithmeticLocallySymmetricSpaces ALS.5b.6, and the two consumers' §7.11 and §10.7.
- Dependency check: `depcheck: 170 roadmaps, 2012 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside the folder the pull request changes only the family index.
- Automatic checks: all passed. Elaboration: `lake env lean` on `Suggested.lean` ends with no message; the file declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: 7.3 (with 7.2), 7.4 with its budget form 7.6, and 7.5. None is statable at the pins (no `ℚ_ℓ/ℤ_ℓ(−e)` as a topological Galois module, no host fields), and the docstring names each with what it lacks. No padding.

Overlap check: read HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, BernoulliBoundsForClassGroupEigenspaces, PotentialAutomorphyInfrastructurePartII, ExplicitNumberFields (open), ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII, GlobalGaloisDeformations (main); nothing shared: each hands the residually reducible machinery, the host case analysis and the windows to this roadmap, and this roadmap cites them for the groups `Ш¹`, the graded cotangent bound, the Hecke ideals and the class-number bound. Searches by object (exceptional twists, the pigeonhole on scales, residual lattices, the conjugate-norm twist, congruence integers, Bernoulli units, counts of cuspidal representations, Eisenstein congruences with an auxiliary character) find no second owner.

Source independence: 4 passages compared with 2 sources (the announcement, Barnet-Lamb–Gee–Geraghty–Taylor), none shared beyond a three-word phrase quoted as such; largest share [FormalProof], about 165 of about 170 locators; its text and contents could not be read, so wording and arrangement were not compared with it (from the cited paths alone, sections and its directories correspond many to many, and one directory serves Layers 0, 5, 6 and 7).

Research link: an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}` (Soulé 1979, 2003), through Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023); it is the "weakening of Vandiver" of the announcement (line 181). Rests on the README's Summary and References and on the announcement.

## Not verifiable

- [FormalProof], for every statement attributed to it: the fifteen sampled targets carry locators into it only, and no legal copy of its text could be read (the repository's host is in no licence class known to the sources service). This covers the statements given without a route: 3.15(c) (K1′), (K2′); 3.20(d), (e); 3.22(c) (w1), (w2) and 3.22(d); 4.2(b), (c); 4.5 (model), (b); 4.7(iv); and "the form of the formal proof" in 3.1, 3.2(b′), 3.19, 4.1 and 7.6.
- Kato 2004, Theorem 14.2, and Deligne–Serre 1974, Lemme 6.11: no legal copy found by the sources service in this run; the targets they are attached to (4.3(iii), 3.22(b)) were checked against their supplier sections instead.
- The other References without a locator (Schneider, Soulé, Jacquet–Shalika, Clozel and the rest): not opened.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README line 3684). The four-page announcement states none of the bounds 7.3–7.6, and no refereed source states them.
- Licence: the family index (line 13) records that the repository of [FormalProof] says the proof was published without a license and is mirrored for verification only. The README cites about 165 of its declaration names and file paths.
- Not tested: [FormalProof] holds nearly all the locators. Its text and table of contents were not read, so neither its wording nor its arrangement was compared with the roadmap; the index says the family "follows" that proof (N01).
