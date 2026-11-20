# Review of TaubesGromov (pull request #2699 at 51f70da)

**Verdict:** needs changes

**Summary.** I recomputed every Check and convention and they hold, apart from one Example. The three Lean statements are true on Tau Ceti's vortex carriers, and they elaborate with `sorry` as the only warning. Two things block acceptance. First, no statement in the README carries a theorem, section or page locator, and the mapping-torus layers, which contain the third headline theorem, cite no source at all (R01). Second, an Example in Layer 2 gives a `(+,1)` torus a weight that its own series does not have (R02). There are five small corrections and one format note. The human reviewers have one point to decide: the three most-cited Taubes papers could not be read legally, so the wording and arrangement were not compared against them.

## R01 (P2) — No statement carries a locator, and the mapping-torus layers, which hold a headline theorem, cite no source at all

Without locators, a referee or implementer cannot check any of the roughly 150 targets against the literature. The third headline theorem is the zeta identity for `S¹ × Y_φ` (overview lines 29–35, §9.4, §10.4, §11.1–§11.4). As written it rests on no published source, so it is unsupported.

The README has about forty source citations, and every one names a paper by title only, for example "(Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*)" at lines 204, 229, 248, 296 and 311. None of them gives a theorem, proposition, equation, section or page. The only locator in the file is McDuff–Salamon E.6.2 at line 1230, carried over from HeegaardFloer. The following cite nothing at all: §1.4, §2.3, §5.2–§5.9 (Layer 5 is covered only by the sentence of C02), §6.1c, and everything from §9.2 to §11.4 except a remark on Baldridge in §10.2. The References (lines 2716–2737) list no source for the mapping-torus theorem. Below, Tau96SWGr is Taubes, *SW ⇒ Gr* (JAMS 9, 1996, read from the AMS open archive), McD96 is McDuff, *Lectures on Gromov invariants* (arXiv dg-ga/9606005) and IP97 is the arXiv text of Ionel–Parker. A published computation does exist. Ionel–Parker, *Gromov invariants and symplectic maps* (arXiv dg-ga/9703013, Math. Ann. 314 (1999)), Theorem 0.1 (IP97 lines 53–61), expresses the Gromov series of a symplectic mapping torus by the Lefschetz zeta function when `det(I − f_*) = ±1`. Its formulas (3.9)–(3.12) (IP97 lines 527–553, pp. 12–13 of the arXiv text) match elliptic, positive-hyperbolic and negative-hyperbolic orbits with Taubes labels `(+,0)`, `(−,0)` and `(+,1)`, which is exactly the table of §11.1.

The fix is to add the theorem or section and the page at each citation, and to cite the published sources of the mapping-torus theorem at §9.4, §10.4 and §11.1–§11.4. Here are locators for the parts I could read:

- §5.1 is *SW ⇒ Gr* §1(c)–(d), equations (1.12)–(1.20), pp. 850–851.
- §5.2 is its list (1.24) with Propositions 2.1, 2.3, 2.8 and 3.4, pp. 853–866.
- §5.4 is its Proposition 3.1, p. 862.
- §5.6 is its Proposition 4.4, p. 875.
- §6.1b is its Lemma 5.2 (p. 884) and Proposition 5.6 (p. 887).
- §6.1 is its Proposition 6.1, p. 891.
- For §2.2–§2.3, McDuff's lectures §5, p. 34 and Definition 5.2 (McD96 lines 1424–1447) are an open account of Taubes's weights and ray formula.

The JDG papers may be cited by locator alone.

## R02 (P2) — The Layer 2 Example gives a `(+,1)` torus weight one at twice its class, but `f_(+,1) = 1 + t` has no `t²` term

This Example is the reader's first worked instance of the weights. It contradicts §2.2's definition, the ray-series Check of §2.3 and the factor `1 + x` that §11.1 assigns to negative-hyperbolic orbits. A reader who trusts it would count a doubled `(+,1)` torus.

Lines 366–367 say: "A torus with label `(+,1)` contributes `1` in its own class and in twice it, and nothing beyond." By §2.2 the weight at multiplicity `m` is `[t^m](1 + t)`, which is `1` at `m = 1` and `0` at `m = 2`. McD96 line 1432 (p. 34) gives the same series. In Tau Ceti, `TauCeti.torusWeightSeries true 1` is `1 + X` (`TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.lean`, the private `positiveSeries 1`).

The fix is to write "contributes `1` in its own class and nothing in its multiples".

## C01 — The README drops the TG numbering without recording where the old ids went

The AnalyticStableMaps README at the head of its open pull request (#2529), line 1131, still says that "TaubesGromov TG1 constructs the normal operator". No TG id appears anywhere in this README. The rule (TGk is Layer k, TGk.n is §k.n, and the old TG6.1 is §6.1–§6.1c) is stated only in the pull-request description, which does not travel with the roadmap. Adding one sentence after the numbering item of the Conventions would keep such citations resolvable, for example: "In the former numbering, TGk is Layer k and TGk.n is §k.n; the old TG6.1 is §6.1–§6.1c."

## C02 — Layer 5's introduction says that the layer follows a source

Line 688 says: "The analysis of this layer follows Taubes, *SW ⇒ Gr*". That misdescribes the plan. The order of Layers 5–6 is forced by their Needs lines, §5.3, §5.8, §5.9 and §6.1c are the roadmap's own, and §6.1 comes before §6.1a–§6.1b whereas *SW ⇒ Gr* treats currents (§5) before curves (§6). Better to cite at the claims (R01), or to write "the estimates of §5.2–§5.6 are proved in Taubes, *SW ⇒ Gr*, §§2–4".

## C03 — The Check of §9.4 uses `v`, `t`, `c` and `q`, which are defined only in §10.4

Lines 2068–2070 say: "A pullback label `e = av` has `d(e) = 2cq` with `c = 0`". At that point the reader has no `c`, `q`, `v` or `t`. The value is right: `e² = a²v² = 0` and `κe = (2g − 2)a v² = 0`, so `d = 0`. Either add "(notation of §10.4)" or give this direct computation.

## C04 — The second Example of Layer 5 names the wrong limit

Line 867 says: "the current `T_r` converges to the fibre class times the vortex degree". With the vortex in the normal factor at scale `w = √(2r) y`, its zeros sit at `y = w_i/√(2r) → 0`, so `T_r` converges to `m [ℂ × {0}]`. That is the base line, transverse to the normal fibres `{b} × ℂ`, and the noncompact `ℂ × ℂ` has no class here to name. The fix is to write "converges to `m` times the current of integration over `ℂ × {0}`".

## C05 — Two sentences of the description do not match the head

The description says "the layers as prose subsections, each with its source at the claim". At the head, §1.4, §2.3, §5.2–§5.9, §6.1c and §9.2–§11.4 name no source, and the others name a paper by title only.

It also says "Citations of other roadmaps use their current numbering: … AlgebraicTopology's Stage 6 orientation classes are §6.3". The head still writes "AlgebraicTopology Stage 6" in §6.1's Needs line (line 904) and in Layer 6's Dependencies (line 1070). AlgebraicTopology on main maps Stage k to Layer k, so the citation resolves either way.

Text that would be right: "each with a Needs line listing its inputs; sources are named by title". For the second sentence, either change the two README places to "AlgebraicTopology §6.3" or drop that clause.

## N01 — `HasZeroDivisor` would gain a negative Check

The section `α(w) = w̄` has no zero divisor at `0` under the definition: no `v` is continuous and nonzero at `0` with `w̄ = wⁿ v(w)`. A definition by the growth rate `|α| ~ |w|ⁿ` would give it order `1`. This Check would separate the oriented order from the modulus order.

## Questions for the author

- §4.4 credits the existence and uniqueness of vortices with prescribed zeros to *Gr ⇒ SW*. The classification is commonly credited to Taubes, *Arbitrary N-vortex solutions to the first order Ginzburg–Landau equations* (Comm. Math. Phys. 72, 1980), and to Jaffe–Taubes, *Vortices and Monopoles* (1980), Ch. III. Is *Gr ⇒ SW* meant as a secondary account, and if so, at which section? I could read neither: no legal open copy of *Gr ⇒ SW* was found, and the 1980 paper resolved only to a paywall.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result |
| --- | --- | --- | --- | --- |
| §2.2 local weights | `f_(+,2)`, `f_(+,3)`, `f_(−,3)` to `t⁵` | `1+t−t²−t³+t⁴+t⁵`; `1+t−2t²−2t³+2t⁴`; `1−t+3t²−3t³+5t⁴−5t⁵` | McD96 l.1432–1433 same series; Tau Ceti `positiveSeries` same | holds |
| §3.1 compactness | `CP²`, `[ω] = H` | area ≤ N gives classes `jH`, `0 ≤ j ≤ N`; genus `(j−1)(j−2)/2` by adjunction | *Counting* unread | consistent; not verifiable |
| §4.4 and the three Lean theorems | vacuum `!₂[0,0,1/2,0]`; `m = 1` translate | `equation₀ = (4·¼ − 1)/8 = 0`; `α = 1`, `D = ∅`; `D = {z₀}` | Tau Ceti `equation` gives curvature `(|α|²−1)/8`, so `∫ iF_a = 2πm > 0` for `α ~ e^(imθ)` | true as stated |
| §5.1 projected equations | `|ω| = √2`, `u₀` | `q(u₀) = iω/4`, `|q|² = 2/16 = 1/8`; `P_α = (1 + i c₂(ω)/2)/2` | Tau96SWGr l.264–310 (pp. 850–851): same projections, `−2i` eigenline, `η_r` | holds |
| §5.3 Hermitian part | `F = e¹² − e³⁴`, `F = ω` | `B = diag(1,1,−1,−1)`, `λ_min = −1 = −√2/√2`; `B = Id`, `c = 1` | `c = r(1−|α|²+|β|²)/8` from Tau96SWGr (1.20) | holds |
| §5.9 modulus potential | `α = z`; general `α` | `τ = dθ = d^c H`; `χτ − d^cH = 2χ Im(α⁻¹∂̄α) = E` | no source cited; computed directly | identity holds |
| §6.1b physical inputs | holomorphic disc meeting `Z` | `I_n ≥ c_σ − ε_n`; `ν(B_ρ) ≥ c_K ρ²` | Tau96SWGr Lemma 5.2 p. 884 (density `z₁ρ²`), Prop. 5.6 p. 887 (positive integer) | supported |
| §7.4 full normal model | real rank count | `iT*X` gives 4, `W⁺ = E ⊕ K⁻¹E` gives 4, total 8 | *Gr ⇒ SW* unread | consistent |
| §7.5 moving bundles | kernel rank | `dim ker L_F(σ) = 2m`; `m = 1`: two translations | §4.3 index `2m` | consistent |
| §7.6 stabilization | algebra of `Π_σ` | `L f₁ + S₁ = S₁ − L A⁻¹ P_F S₁ = Π_σ S₁`; `P_F Π_σ = P_F − A A⁻¹ P_F = 0` | none needed | holds |
| §7.13 supercritical margins | `m = 1, 2, 3` | `1 − 2/p_m = 1/2, 1/3, 1/4`; `p_m(1 − 2/m) = −4, 0, 8/9 < 2` | `∂̄b_j` law derived from `D_C V = 0` | holds |
| §7.18 torus branch | genus-1 cover of a torus | adjunction gives `g = 1`; Riemann–Hurwitz `0 = d·0 + b`, so `b = 0`, unramified | *Gr ⇒ SW* unread | holds |
| §7.20 coarse spaces | scale | `h = λ⁻¹ = (2r)^(−1/2)`, `h²r = 1/2`, as in §5.6 and §7.22 | *GR = SW* unread | consistent |
| §7.30 slow-first recursion | orders | `P_C L_F(σ) = O(h)`, so `h^j f_j` reaches the slow complement at `h^(j+1)` | *GR = SW* unread | consistent |
| §9.1 SW = Gr | `E` trivial; `E = K` on a quintic | `1 = 1`; `±1` with sign `(−1)^5 = −1` | *GR = SW* unread | consistent |
| §9.3 wall coordinate | `η = 0`; `e = 0` | `w = −2π l·[ω] = −2πΔ`; `w = (r/4)‖ω‖² > 0` | `[F] = −2πi l` from `c₁ = [iF/2π]` | holds |
| §10.4 chamber arithmetic | `g = 2`, `e = 3v + t`; `e = t` | `q = 2`, `d = 4`, `⟨lΩ⟩ = 2(2+L)`; `q = −1`, `d = −2` | `e² = 2ac = 6`, `κe = 2` | holds |
| §11.1 orbit labels | elliptic `θ ∉ 2πℚ`; negative hyperbolic `λ < −1` | signs `+`; `(−1)^(k+1)`, giving `1/(1−t)`; `1+t` | IP97 (3.9)–(3.12): E ↔ `(+,0)`, H ↔ `(−,0)`, H′ ↔ `(+,1)` | holds |
| Headline: zero divisor of degree `m` | vacuum; translate | card 0 with `D = ∅`; card 1 | Tau Ceti `exists_contDiffAt_section_eq_pow_mul` gives local orders only, no degree | true; not in library |
| Headline: existence for every divisor | `D = 0`; `D = {0,0}` | vacuum works; double zero needs the scalar equation | Tau Ceti has reconstruction, not existence | true; not in library |
| Headline: uniqueness mod framed gauge | two vacua; base-pointed variant | `u = α_y/α_x → 1`; with `u(0) = 1`, dimension `2m+1` | Tau Ceti `exists_eq_phaseGauge_of_forall_section_eq_mul` needs a smooth nowhere-zero ratio | true; not in library |
| Headline: mapping tori | Anosov `[[2,1],[1,1]]` | `ζ = (1−3t+t²)/(1−t)² = 1−t−2t²−3t³`; `det(I−P) = −1`; coarse `−a` | IP97 Thm 0.1 product formula | holds |
| Layer 2 Example (R02) | `(+,1)`, `m = 2` | README claims weight 1 | `[t²](1+t) = 0` | false |
| §9.4 Check (C03) | `e = av` | `e² = 0`, `κe = 0`, `d = 0` | `c`, `q` defined only in §10.4 | value true, notation undefined |
| Layer 5 Example (C04) | zeros at `y = w_i/√(2r)` | limit `m[ℂ × {0}]` | README says "fibre class" | mislabelled |

- Source locators checked against the text: 9 (Tau96SWGr §1(c)–(d), (1.8), Thm 1.3, (1.24), (1.25), Lemma 5.2, Prop. 5.6; McD96 p. 34 weights and Def. 5.2; IP97 Thm 0.1 and (3.9)–(3.12)).
- All 44 README Checks recomputed; all hold. The Examples were also recomputed; one is false (R02) and one is mislabelled (C04).
- Library declarations opened at the pins: Tau Ceti `Vortex/Deformation.lean:49,58,89,99,109`, `FramedGauge.lean:39,59,69`, `Zeros.lean:81,95`, `Uniqueness.lean:158`, `AdjointKernel.lean:100`, `ExteriorEstimate.lean:119`, `Decay.lean:150,204`, `FieldSpace.lean:152,231`, `TorusWeight.lean:105,165,353`, `Charpoly/Symplectic.lean:74,84`, `CatMap.lean:43`, `OrbitZeta.lean:104,220`, `OrbitTorus/Weight.lean:156`, `MappingTorus/Rank.lean:113`, `Torsion.lean:151`; Mathlib `PowerSeries/Inverse`, `Fredholm/Basic`, `Distribution/Sobolev`, `NewtonIdentities`, `Covering/Vitali`, `Charpoly/Coeff`.
- Cross-roadmap citations resolved on main, about 60 ids: SeibergWittenTheory SW1–SW11; HeegaardFloer §2.1, §2.2, §3.4, §4.2, §4.4, §4.6b, §4.6e; FourManifolds §4.1–§4.2; PseudoholomorphicCurveAnalysis §3.1, Layers 4–5, §6.2–§6.3, §7.2; AnalyticStableMaps §0.5, §2.9–§2.21, §3.7; ComplexKahlerGeometry §5.1, §5.4, §5.7; AlgebraicTopology §5.1, §6.2–§6.4, §8.7; SmoothBundlesConnections B6.2; CharacteristicClasses C2; MorseNovikov §4.1, §6.4, §6.5; SymplecticGeometry S0–S2; CotangentLagrangian C4; GeometricTopology §1.5; HopfRinow Layers 1–2.
- Dependency check: "depcheck: 182 roadmaps, 2073 edges, 0 problem(s)"; every supplier is on main.
- Automatic checks: all passed. `Suggested.lean` elaborates with three `sorry` warnings only. `#check @` of all five declarations matches the README statements, with no binder lost. One-tactic probes (`simp_all`, `simp`, `aesop`) fail on all three theorems.

Overlap check: read SeibergWittenTheory (main and the open revision), SymplecticGeometry (main and the open revision), HeegaardFloer, InstantonFloerTheory and DGFloer. Nothing is shared. SeibergWittenTheory excludes the large-`r`, vortex and weighted-count material (main line 3; revision lines 1522–1524). SymplecticGeometry owns S0–S2 and assigns the counts and zeta functions to TaubesGromov. DGFloer (main line 86) assigns the surface suspension application to TaubesGromov.

Source independence: 9 passages compared with 3 sources (Tau96SWGr ×5, McD96 ×2, IP97 ×2), with nothing shared beyond formulas and standard names. The largest share of citations is held by Taubes, *Counting* and Taubes, *GR = SW*, 9 each of about 37 title-only citations, with no locators anywhere. Layers 5–6 compared with the contents of Tau96SWGr §§1–6 are independent: they are not one-to-one, the order is forced by the Needs lines, and §5.3, §5.8, §5.9 and §6.1c are the roadmap's own. *Counting* and *GR = SW* could not be read, so that comparison was not done.

Research link: the roadmap formalises Taubes's theorem SW = Gr for closed symplectic four-manifolds (Taubes, *SW ⇒ Gr*, JAMS 1996; *Gr ⇒ SW* and *GR = SW*, JDG 1999) and its mapping-torus application, the zeta-function computation of Ionel–Parker (1999). This rests on the README's References, Tau96SWGr §1 and IP97 Theorem 0.1.

## Not verifiable

- Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*, JDG 44 (1996): Project Euclid landing page, no open PDF (cited in §1.1–§3.4; sampled §3.1).
- Taubes, *Gr ⇒ SW*, JDG 51 (1999): same (cited in Layer 4 and Layer 7; sampled §4.4, §7.4–§7.30).
- Taubes, *GR = SW*, JDG 52 (1999): same (cited in §0.1–§0.2, §6.2–§6.3, Layers 7–8, §9.1; sampled §9.1).
- Taubes, Math. Res. Lett. 1 (1994) and 2 (1995): the publisher returned HTTP 403.
- Taubes, Comm. Math. Phys. 72 (1980): resolved only to a paywalled page.
- Baldridge, Trans. Amer. Math. Soc. 355 (2003): not fetched (cited only in a remark).
- Taubes, Geom. Topol. 3 (1999): fetched from arXiv but not compared, because the README cites it for an "architecture" with no statement or locator.

## Source issues

- **Misprint** in Tau96SWGr at Theorem 1.3, p. 852: the hypothesis asks for a metric making ω anti-self-dual; it should be self-dual, as in §1(c), p. 850, where the canonical Spinᶜ structure is set up; affects nothing.
- **Misprint** in Tau96SWGr at (1.8), p. 848: the fixed perturbation µ is called anti-self-dual; since it is added to `P⁺F_A`, it should be self-dual, like (1.17); affects nothing.

## For the human reviewers

- Not tested: the most-cited sources, Taubes *Counting* (JDG 44) and *GR = SW* (JDG 52), with nine title citations each, and *Gr ⇒ SW* (JDG 51), had no legal open copy. Wording and arrangement were not compared against them, and Layers 1–4 and 7–9 cite them.
