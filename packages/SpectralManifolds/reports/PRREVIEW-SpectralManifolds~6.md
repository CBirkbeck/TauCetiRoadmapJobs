# Review of SpectralManifolds (pull request #2657 at 5b80b17)

**Verdict:** needs changes

**Summary.** One finding. The Check in §9.2 says that cap product with the doubled circle's fundamental class maps `K₁(C(S¹))` to `K¹(C(S¹))`. Cap product with an odd KK-class changes the degree, so the maps go `K₀ → K¹` and `K₁ → K⁰`. The Check's conclusion, that duality fails, is still right. Everything else I recomputed held up: all 110 Checks, the 64 real-product sign pairs, the four swap phases ζ, the orientation table for `1 ≤ p, q ≤ 6`, and every sampled locator I could read. There are seven small corrections, chiefly 29 citations of Connes 2008 that give no theorem number and three dependency summaries that disagree with the *Needs:* lines, and three format notes. One licence question is left for the human reviewers.

## R01 (P2) — The §9.2 Check gives the cap product with the doubled circle's fundamental class the wrong degrees

The Check that separates the duality axiom from the five conditions (README lines 1569–1572) says that cap product with `2Δ_D` "maps `K₁(C(S¹)) ≅ ℤ` to `K¹(C(S¹)) ≅ ℤ` by multiplication by `2`". This contradicts §9.1 and §9.2, so a reader checking "all K-degree cap maps" against it finds the degrees inconsistent. By §9.1, `Δ_D ∈ KK₁(A ⊗_min Aᵒᵖ, ℂ)` with `d = 1`. The Kasparov product `KK_i(ℂ, A) × KK₁(A ⊗ Aᵒᵖ, ℂ) → KK_(i+1)(Aᵒᵖ, ℂ)` shifts the degree by one mod 2. So the cap maps go `K₀ → K¹` and `K₁ → K⁰`, and an odd class gives no degree-preserving map `K₁ → K¹` under either index convention. This also matches §9.2's own `β ∈ KK_(−d)`. For a single circle these maps are Poincaré duality, `[1] ↦ [D]` and `[u] ↦ ±[pt]`.

The smallest repair keeps the conclusion: "cap product with it sends `[1] ∈ K₀(C(S¹)) ≅ ℤ` to `2[D] ∈ K¹(C(S¹)) ≅ ℤ` (and `K₁(C(S¹))` to `K⁰(C(S¹))`, also by multiplication by `2`); this is not an isomorphism, so the duality axiom fails".

## C01 — Twenty-nine claims cite Connes 2008 with no theorem or section, six of them in the sampled sections

A reader cannot check "(Connes 2008)" against a 67-page paper. Below are the places I found, in the arXiv v1 numbering the README cites:

- §1.3: Appendix 1, Lemma 13.2 (p. 58).
- §2.2: condition 3 of §2, and Definition 6.1 (p. 24).
- §2.5: condition 4 of §2 (p. 5), with antisymmetry from Theorem 1.1.
- §3.5: Lemma 2.1 and Propositions 2.2–2.3.
- §5.1: Lemma 4.3 (p. 13).
- §5.2: Theorem 5.13.
- §§5.3–5.4: Theorems 6.11 and 6.15.
- §6.2: Lemmas 7.1–7.3.
- §6.3: Theorem 8.5.
- §6.4: Lemma 9.1, eq. (159), and Lemmas 10.1–10.2.
- §6.5: Lemma 10.3.
- §§6.6–6.7: Lemmas 11.1–11.2 and Theorem 11.3.
- §6.8: Theorem 11.4.

§8.3's "(Plymen 1986)" is Theorem 2.11. Writing these in place of the bare citations would make every locator exact.

## C02 — Three dependency summaries disagree with the *Needs:* lines they summarise

- **Layer 1.** "How to read the build" says "Layer 1 uses only NoncommutativeGeometry N5 and the native operators" (line 50). But §1.3 needs SelfAdjointSpectralTheory Parts C–E, §1.7 needs SpinGeometry G1.4 and G2.1 and Tau Ceti's `CliffordAlgebra.complexVolume`, and §1.2's nuclearity bullet needs §§2.1, 3.1 and 3.6. Layer 1's own Dependencies paragraph (lines 312–316) already says so.
- **Layer 10.** Line 63 says that §§10.1–10.5 use "Layers 1–2 and NoncommutativeGeometry N5". But §10.1 needs VonNeumannAlgebras V2, §10.5 needs OperatorKTheory K6, and Layer 10's Dependencies says Layers 1–3.
- **§3.5.** Its API asserts that 𝒜 and `H∞` are nuclear (line 685), which is §3.6's theorem, but its *Needs:* line (lines 675–676) does not list §3.6.

Bringing the three summaries into line with the *Needs:* lines fixes all three.

## C03 — §3.3 credits the continuous Serre–Swan correspondence to Swan alone, but HilbertModules H5 on main owns it

HilbertModules H5 (main, its README lines 421–423) identifies the section modules of continuous Hermitian bundles over a compact base with the finitely generated projective modules of H2. §3.3's continuous-completion bullet (lines 618–620) and its *Needs:* line cite TopologicalKTheory T1 and HilbertModules H1 only. Citing H5 in both places would name the owner of the continuous comparison that the smooth theorem is checked against.

## C04 — In rank four, §8.1's irreducible spinor action is SeibergWittenTheory SW1.1's half-spin representation, and neither roadmap says so

SeibergWittenTheory (main, its README line 29) constructs the representations `ρ±` of FourManifolds F4's `Spinᶜ(4)` on `S±`, with an odd Clifford action on `S⁺ ⊕ S⁻`. §8.1 (lines 1431–1434) constructs `[s, z] ↦ z ρ(s)` for every `p`. A clause in §8.1 saying that for `p = 4` this action is `ρ⁺ ⊕ ρ⁻` of SW1.1 would keep the two constructions of one representation from drifting apart.

## C05 — The §9.1 Check pairs `Δ_D` with `[u]` "in the first variable", which gives a K-homology class rather than an index

Pairing `[u] ∈ K₁(A)` with `Δ_D ∈ KK₁(A ⊗ Aᵒᵖ, ℂ)` over the first factor alone gives an element of `K⁰(Aᵒᵖ)`, not an integer (lines 1554–1556). The Toeplitz index is the pairing of `[u]` with the restriction of `Δ_D` to `A ⊗ 1`, which is the class of the triple in `K¹(C(S¹))`. Equivalently, it is the pairing of `Δ_D` with `[u] ⊗ [1]`. Saying this explicitly would make the Check correct as written.

## C06 — §4.5's trace identity does not say which functions f it holds for, and its Check uses functions outside the class Connes proves it for

Connes 2008 proves the identity for `f ∈ C_c([0, ∞))` (Theorem 14.9) and the liminf bound for positive such `f` (Corollary 14.10). Lines 868–871 state it for "f", meaning the cutoff from the route paragraph, without saying so. The Check (lines 880–882) uses `1_[0,1]` and `e^(−u²)`; its values (`2` and `√π`) are right, but they are computed directly on the circle. Writing "for continuous compactly supported f, positive for the liminf" in the statement, and "computed directly" in the Check, would stop a reader from reading the Check as an instance of the theorem.

## C07 — The description says "N1 plans no chain-level complex", but NoncommutativeGeometry N1 on main plans one

NoncommutativeGeometry's README on main (lines 609–611) constructs `A⊗(A/ℂ1_A)^⊗n` and compares it with Tau Ceti's normalized Hochschild chains. What N1 lacks is Hochschild chains with general bimodule coefficients, and that is what §2.5 now states. Suggested wording: "N1 plans the normalized form quotient and its comparison with Tau Ceti's normalized chains, but no chains with bimodule coefficients; §2.5 therefore states those for general coefficients, …".

## N01 — A Check could pin Voiculescu's constant `γ₁ = 1/π`, which Theorem 4.5 states; the §4 example would then read `k_(1,1) = 4/π`, fixing the normalization of `‖·‖_(1,1)` by a number.

## N02 — "Weakly oriented" (§2.6) is Ćaćić's "pre-orientable" (Ćaćić 2011, Definition 2.7, which is also the exact locator for §2.6's definition); naming the source's term once would help readers.

## N03 — The module docstring of `Suggested.lean` (lines 27–48) lists §6.7 and §§8.2, 8.5 as not statable at the pins, but not the converse §6.8 or the Spinᶜ reconstruction §8.3, which belong to the first and third headline theorems and lack the same carriers.

## Verified sound

| Statement | Instances tried | Computed (roadmap side) | Source / other side | Result; change |
| --- | --- | --- | --- | --- |
| §1.3 `D²`-test | circle, `T = e^(it)` | `δ(T)`: coefficient `abs(n+1) − abs(n)`, norm 1; `δ₁(T)`: `(2n+1)(1+n²)^(−1/2)`, bounded; `[D²,T]`: `2n+1`, unbounded | Connes 2008 Lemma 13.2: `δ₁ⁿ` bounded ∀n ⇔ `δⁿ` bounded ∀n | holds; locator in C01 |
| §1.7 volume element | `p = 1, 2, 3`; Tau Ceti `complexVolume` | `p=2`: `(c₁c₂)² = −1`, phase² `= −1`; `p=3`: `Γ = −c₁c₂c₃ = ω`; `p=1`: `Γ = −ic₁ = −ω` | `(−1)^(ℓ+1)`: `+1` at `ℓ=1`, `−1` at `ℓ=0`; pin `i^⌊(n+1)/2⌋` matches | holds |
| §2.2 regularity | circle; `M_n(ℂ)` on `ℂⁿ`, `n ≥ 2` | `End` of `C∞(S¹)` is `C∞(S¹)`; commutant of `M_n` is `ℂ`, so `π(a)` is not `𝒜`-linear | Connes §2 condition 3; Definition 6.1 (strong regularity) | holds |
| §2.5 orientation | `u = e^(it)`, `D = ±i d/dt`; `p = 2` chain | `[D,u] = −u`; `b(−u*⊗u) = 0`; `π_D(c) = 1` (`−1` for `−D`); `p = 2` terms cancel pairwise | Connes §2 condition 4; antisymmetry per Theorem 1.1 | holds |
| §4.2 quasicentral modulus | finite dimension; `B = 0` | `B = Id` gives `0`; infimum over all `B` is `0` via `B = 0` | Voiculescu 1979 p. 6: liminf over `R₁⁺`, natural order, max over `j` | holds |
| §4.3 multiplicity formula | `cos t` on `L²(S¹)`; `t ⊕ t` | `m_ac = 2` on `(−1,1)`, `∫m = 4`, `k = 4γ₁`; doubling gives `kᵖ ×2` | Voiculescu Thm 4.5: `kⁿ = γₙ∫m`, `0<γₙ<∞`, `γ₁ = 1/π` | holds; N01 |
| §4.4 log Cesàro trace | `s_N = (−1)ᴺ`; `μ_j = 1/(j+1)` | alternating log-mean → `0`; `H_(N+1)/log(N+2) → 1` | Connes Defs 14.3–14.4; Tau Ceti `dixmierTrace_eq_one_of_singularValue_eq` | holds |
| §4.5 cutoff identity | circle, `f = 1_[0,1]`, `e^(−u²)` | `ε(2⌊1/ε⌋+1) → 2`; `εΣe^(−ε²n²) → √π` | `1·2 = 2`; `(√π/2)·2 = √π`; Connes Thm 14.9 needs `f ∈ C_c` | values hold; C06 |
| §5.1 spectral derivations | circle, `ξ = 1`, `h = πηξ̄` | `d₁(a) = i·π·ia′ = −πa′`; flow `a(x − πt)` | Connes Lemma 4.3, (32): `δ_j(a) = i·h(ξ_j, [D,a]ξ_j)` | holds |
| §8.2 Spinᶜ ↔ modules | `p = 2,…,6`; `ℂl(3)` | ranks `2,2,4,4,8`; `ℂl(3) = M₂ ⊕ M₂`, `ℂl⁰(3) = M₂` | Plymen Def 2.2 (p. 310), Def 2.10, Thm 2.11 (p. 314), odd rank "similar" | holds |
| §8.3 Spinᶜ reconstruction | circle line bundle, `c(dt) = ±i` | rank `2⁰ = 1` over `ℂl⁰(1) = ℂ`; `D`, `D + φ` give the same Spinᶜ structure | Plymen Thm 2.11 | holds; C01 |
| §9.5 separating examples | doubled circle; Hodge–de Rham circle | doubled: cap ×2, not an isomorphism; HdR: `J² = 1`, `JD = DJ`, `Jγ = γJ`, `χ = Γ ≠ 1` | the Checks' claims | holds |
| §10.4 shuffle | `p = q = 1`; `p = 1, q = 3`; odd/odd | `C(2,1) = 2` vs `1`; `C(4,1) = 4` vs `6`; `w = σ₁σ₂ = iσ₃`, `w² = −1` | README values; Loday not read | holds |
| §10.6 products of manifolds | two circles vs torus `ℝ²/2πℤ²` | `c₁ = 1/π`, product `π²`; `(c₂·2)⁻¹ = (2/(4π))⁻¹ = 2π` | Check: `π²` against `2π` | holds |
| §11.4 circle and tori | periodic/antiperiodic; `n`-torus | spectra `ℤ`, `ℤ + ½`; `Tr_ω = 2` both; `2ⁿ` structures; trivial kernel `2^⌊n/2⌋` | NoncommutativeGeometry N7: `1/(2π)` at `θ = 0` | holds |
| §§1.5, 10.2 real signs | all 64 `(n₁, n₂)` | `J²`, `ε′`, `ε″` of each branch computed | KO table at `n₁ + n₂` | 64/64 agree |
| §10.3 swap phases | `U = (σ₁+σ₂)/√2` | `Uσ₁U⁻¹ = σ₂`, `Uσ₃U⁻¹ = −σ₃`; `ζ = 1, −i, i, −1` | README list | 4/4 agree |
| §10.5 orientation table | `1 ≤ p, q ≤ 6`, explicit Clifford matrices | volume of the product generators | table entries | 36/36 agree |
| Headline §6.7 (+ §6.8) | circle; `D ↦ −D` | `π_(−D)(c) = (−1)ᵖπ_D(c)`: flips at `p = 1` | Connes Thms 11.3–11.4; same hypotheses | holds; not statable (no unbounded calculus at pins) |
| Headline §7.6 Weyl/Dixmier | circle; torus `ℝ²/2πℤ²`, rank 2 | `N ~ 2R`, `Tr_ω = 2`; `c₂ = 1/(4π)`, `Tr_ω = 2π`, `N ~ 2πR²` | `vol(S^(p−1))/(p(2π)ᵖ)` formula | holds |
| Headline §§8.4–8.5 | `p = 2`, multiplicity 2 vs 4 | monomials `1, c₁, c₂, c₁c₂` span dim 4, not `M₄` (dim 16) | Connes Thm 11.5, even `p` (footnote 16) | holds |
| §3.2 Lean theorems | Banach `E, F`; indiscrete `ℝ` | Banach instance elaborates against both signatures; indiscrete target fails `T2Space` | Rudin 2.11, 2.15 (not read); no F-space theorem at pins | holds; not padding |
| §9.2 Check (R01) | doubled circle, `Δ` odd | cap: `K₀ → K¹`, `[1] ↦ 2[D]`; `K₁ → K⁰` | README: `K₁ → K¹` | false degrees; R01 |
| §9.1 Check (C05) | `Δ_D ∈ KK₁(A⊗Aᵒᵖ, ℂ)` | `[u]` in the first variable alone gives a class in `K⁰(Aᵒᵖ)` | README: an integer | wording; C05 |
| §7.3 Check | `λ = w dt` | defect `i∫ξ̄ηw′`; `B − B* = iw′/w`; `b = w′/w` | `∂(w dt) = w′ dt` | holds |
| §7.8 weak → strong | Hodge–de Rham circle | `χ = Γ` commutes with `D`; `M = 0`; `D₁² = D²`; `π_(D₁)(c) = Γ² = 1` | Ćaćić 2011 Cor 2.19: `D₀`, `M` per parity | holds |

- Previous review (of the pull request that added this roadmap): no findings to check.
- Source locators checked against the text: 25. Connes 2008 (15): Lemmas 2.1, 4.3, 9.1, 13.2; Thms 5.13, 6.11, 6.15, 9.9, 11.3, 11.4, 11.5, 14.9; Def 6.1; Defs 14.3–14.4; Cor 14.10. Voiculescu 1979 (2). Plymen 1986 (3). Ćaćić 2012: Def 2.5, Ex 2.9, Prop 2.16, Thm 2.18, Prop 2.24. Ćaćić 2011: Def 2.7, Cor 2.19. Dąbrowski–Dossena §4.
- Pinned declarations opened. Tau Ceti: `Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:129,169`, `…/Resolvent/Compact.lean:68`, `Analysis/OperatorIdeal/Family/DixmierTrace.lean:91,254,262`, `LinearAlgebra/CliffordAlgebra/VolumeElement/Complex.lean:94`, `…/Spin/SpinC.lean:240,259`, `Topology/Algebra/OpenMapping/Henkel.lean:79` (nonarchimedean source), `MeasureTheory/Function/Lp/Multiplication.lean:46`. Mathlib: `Analysis/Normed/Operator/Banach.lean:229,538`, `Topology/Algebra/Group/OpenMapping.lean:114`, `Geometry/Manifold/VectorBundle/ContMDiffSection.lean:394` (`Module 𝕜` only), `…/ContinuousFunctionalCalculus/Rpow/Order.lean`. The pins have no functional calculus or `|D|` for `LinearPMap`.
- Cross-roadmap citations resolved on main: about 45, in NoncommutativeGeometry N1–N7, OperatorKTheory K3, K5 §§5.2, 5.5, K6 §§6.2, 6.6, SpinGeometry G1.3–G6.5, PseudodifferentialOperators P1.0, P4, P6, P7 §§7.1–7.2, ComplexKahlerGeometry §§5.1, 5.3, 5.4, 5.7, CompactQuantumMetricSpaces §§3.1, 3.6, FourManifolds §§4.1–4.2, RiemannianGeometry R7.8, GeneralizedCohomology G5.5, AutomorphicSpectralTheory §§0.11, 0.13, LocallyAnalyticDistributions §0.2 (Fréchet open mapping over any complete nontrivially normed field), VonNeumannAlgebras V2 and V4.0.Fields, SelfAdjointSpectralTheory SA-B85 and Parts C–E, HilbertModules H1–H5, TopologicalKTheory T1, T7, DifferentialGeometry 6.2, and OneParameterSemigroups Part A. Every supplier is on main.
- Automatic checks: the gate passes every check. Dependency check: `depcheck: 200 roadmaps, 2205 edges, 0 problem(s)` (no UPWARD or CYCLE line). No change outside the folder.
- Elaboration: `lake env lean` exits 0 with exactly two `sorry` warnings (lines 64, 79). `#check @…` of both declarations shows all 18 binders (`T2Space`, `CompleteSpace`, countably generated uniformity on `E` and `F`), matching §3.2.
- One-tactic probe, decided by reading: the pins have no F-space open-mapping or closed-graph theorem (Mathlib's needs normed or σ-compact; Tau Ceti's Henkel theorem needs a nonarchimedean source), so neither theorem is padding. The three headline theorems are not statable, as the docstring says.
- Description against head: 68 `k.n` sections, 65 Check blocks and 110 Check bullets, as claimed; the renumbering, the three new sections and the corrected citations are as stated. The one exception is C07.

Overlap check: read NoncommutativeGeometry, SpinGeometry and IndexTheory (main), SeibergWittenTheory (main), and SchrodingerOperatorsAndSpectralTypes (open head). Shared objects and their owners: the rank-four Spinᶜ spinor representation is SeibergWittenTheory SW1.1's, and the general-rank action is this roadmap's §8.1 (C04). The continuous section-module correspondence is HilbertModules H5's, and the smooth one is this roadmap's §3.3 (C03). Spectral triples, regularity and the Hochschild class are NoncommutativeGeometry N5's and are consumed here. SchrodingerOperatorsAndSpectralTypes owns single-operator spectral types and Kato–Rosenblum, which are not restated here. No object has two owners.

Source independence: 25 located passages plus 6 further passages (the summary, §2.6, §7.8, the §10.2 table, both `Suggested.lean` docstrings) were compared with 6 sources, and a 7-word-run scan was run over the whole README. Outside bibliographic titles and formulas the longest shared run is 8 words, a standard phrase. Largest share: Connes 2008, 42 of about 91 locators. Contents compared with Connes 2008: independent. Layers 5–6 follow Connes §§4–11 in order, but their *Needs:* lines force that order (§6.2 needs §§5.4, 6.1; §6.4 needs §§4.3, 4.5, 6.2–6.3; §6.5 needs §6.4; §6.7 needs §§6.1–6.6). Connes §4 is split between §5.1 and §6.1, his §9 and Appendix 2 form Layer 4, and Layers 7–11 draw on other sources.

Research link: Layers 4–6 prove Connes' spectral characterization of manifolds (Connes 2008, Theorems 11.3–11.5), using Voiculescu's 1979 multiplicity theorem. Layers 7–8 carry Ćaćić's almost-commutative reconstruction and real structures (2011, Corollary 2.19; 2012, Propositions 2.16, 2.24). Layer 10 is Dąbrowski–Dossena's real products. All from the README's own sources, read at their locators.

## Not verifiable

- Loday, *Cyclic Homology*, §4.2 (seeded §10.4) and Trèves, Chapter 51 (seeded §10.6): books; the sources service found no legal copy. Shuffle counts and Check values were recomputed instead.
- Rudin, Theorems 2.11 and 2.15, and Nestruev, Chapter 11: books with no legal copy.
- Swan 1962, Hörmander 1968, Birman–Koplienko–Solomyak 1975 and Ando 1988: outside the sample and not fetched this round.
- Voiculescu 1979 and Plymen 1986 were read from image-only scans by OCR; only the formulas legible in the OCR were checked.

Automatic checks set aside as false positives: the citation resolver reported "OperatorKTheory K6.6" as missing, but OperatorKTheory on main has §6.6 (Index pairings) inside Layer K6. The resolver does not read a layer prefix followed by a section number.

## Source issues

- **Misprint** in Connes2008 at Definition 14.1, inequality (224), p. 61: the source says the Weyl norm of `T₁ + T₂` is at most `σ_N(T₁) + σ_N(T₁)`; it should be `σ_N(T₁) + σ_N(T₂)`; affects nothing.

## For the human reviewers

- Licence: Voiculescu 1979 and Plymen 1986 were read from the Journal of Operator Theory archive at jot.theta.ro. The PDFs are served without login, and the pages carry "© Theta Foundation" with no stated licence. I recorded them as publisher-open.
- Not tested in any round: the book locators (Rudin Theorems 2.11 and 2.15, Nestruev Chapter 11, Loday §4.2, Trèves Chapter 51) and Birman–Koplienko–Solomyak 1975 and Ando 1988 (README lines 2330–2353).
