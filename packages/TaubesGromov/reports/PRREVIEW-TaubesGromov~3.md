# Review of TaubesGromov (pull request #2699 at bf96c5c)

**Verdict:** accepted

**Summary.** There are no findings, so this folder is ready for a human's final approval. The earlier findings are repaired as far as a legal text allows. The `(+,1)` Example now agrees with its series. Every statement drawn from a readable source (Taubes's JAMS paper, McDuff's lectures, Ionel–Parker, Baldridge) now carries a locator, and I checked each one against the text; every Check and the three Lean theorems recompute correctly. There are three small corrections and one format note, none blocking: a Needs cycle between §7.6 and §7.27, a notation clash in the suspension contract, and one sentence of the description. The human reviewers have one fact to weigh: Taubes's three J. Differential Geom. papers, which carry the SW = Gr headline, have no legal copy and are cited by title only.

## C01 — §7.6 and §7.27 each name the other in their Needs lines, so Layer 7's "Its sections are in build order" (line 1118) is not true as written

An implementer who follows the Needs lines can start neither section. §7.6 needs "§7.26–§7.27 (the ladder and the rates it is applied after)" (line 1228) and opens "After the uniform ladder, the rates and the covering by leading zeros" (line 1214). §7.27 in turn needs §7.6 (line 1655), because its stabilized slow family uses the `D₀`, `κ₀` and selected complement that §7.6 constructs.

The mathematics is not circular. §7.6 uses only the first two sentences of §7.27, the normalized leading equation and the covering by leading zeros, and the rest of §7.27 uses §7.6. The smallest repair is to write in §7.6's Needs line "§7.26, and the leading equation and covering by leading zeros of §7.27", or to give those two sentences a subsection of their own before §7.6, and to qualify the build-order sentence. A milder case of the same kind: §9.4 needs §10.1 (line 2105), and the Dependencies of Layers 9 and 10 (lines 2134 and 2266) each name the other. §10.1 uses nothing from Layer 9, so one clause in Layer 9's Dependencies saying so would remove the apparent cycle.

## C02 — The Tau Ceti suspension contract writes `J∂_s = T` and `σ_v`, but §10.1 has `T = ∂_s`, `J∂_s = R` and `ω_v`

In §10.1–§10.2, `T` is the unit vector `∂_s` (line 2142, and `∇_T`, `ι_T` in §10.2). Read in that notation, the contract's "block structures with `J∂_s = T`" (line 2650) says that `J` fixes `∂_s`, which no almost complex structure does. The contract has taken over Tau Ceti's notation, where `T = ∂_t` is the suspension field (`TauCeti/Geometry/Symplectic/Manifold/Suspension/AlmostComplex.lean`, line 221) and the fibre form is `σ`. Writing "`J∂_s = R`, the suspension field (Tau Ceti's `T`)" and `ω_v` would match §10.1.

## C03 — One sentence of the description overstates where sources are cited

The description says the layers are "prose subsections, each with a Needs line listing its inputs and its sources cited at the claim". At the head every subsection does have a Needs line. But about fifty subsections cite no source at the claim: §7.1–§7.42 rely on the Layer 7 introduction's citation of *Gr ⇒ SW* and *GR = SW*, and §0.3, §1.4, §5.8–§5.9, §9.2–§9.3, §9.5, §10.1, §10.3 and §10.4 cite none. Text that would be right: "each with a Needs line listing its inputs, and with a locator at the claim wherever a readable source states the result".

## N01 — Three symbols are reused with a second meaning in §7.10 and §7.36

In §7.10, `Ω = Kπ*ω_C + dλ` reuses `λ`, which §7.1 fixes as `√(2r)`, so `dλ` reads as zero. In §7.36, `α = dθ + A` and `ρ` reuse the section `α` and the forcing `ρ`. Renaming the primitive one-form and the radial coordinate would remove the clash.

## Earlier findings

- R01 (no locators, the mapping-torus layers unsourced): repaired for every source with a legal text, and every new locator was checked at the text. McDuff is cited at Conventions 6 and §2.2–§2.3 (Definition 3.2, §5.2 on p. 34, Lemma 5.1 on p. 33). *SW ⇒ Gr* is cited by proposition, equation and page at §4.2, §4.4, §5.1–§5.7, §6.1–§6.3 and §9.4. Baldridge's Theorem 15 and Theorem A are cited at §10.2. Ionel–Parker's Lemmas 3.1–3.2, (3.9)–(3.12) and Theorems 0.1 and 5.1 are cited at §11.1–§11.4. The three J. Differential Geom. papers are still cited by title. I looked for a legal copy again and found none, so this goes to the human reviewers and is not re-raised.
- R02 (the `(+,1)` Example): repaired. The Example now reads "A torus with label `(+,1)` has series `1 + t`: it contributes `1` in its own class and nothing in its multiples."
- C01 (TG numbering): repaired. Conventions item 9 now reads "In the former numbering, TGk is Layer k and TGk.n is §k.n; the former TG6.1 is §6.1 together with §6.1a–§6.1c."
- C02 (Layer 5 said it follows a source): repaired. The introductory paragraph is gone, and the sections cite *SW ⇒ Gr* at their claims.
- C03 (undefined notation in §9.4): repaired. The Check now defines `v` and `t` and computes "`e² = a²v² = 0` and `κe = (2g − 2)a v² = 0`".
- C04 (the wrong limit in a Layer 5 Example): repaired. The Example now reads "converges to `m` times the current of integration over `ℂ × {0}`".
- C05 (the description): partly repaired. The AlgebraicTopology citations now read §6.3 and Layer 6, but the sentence about sources at the claim is still broader than the head (C03 above).
- N01 (a negative Check for `HasZeroDivisor`): repaired by the third Check of §4.4, on the section `w̄`.
- Question on the vortex classification: answered. §4.4 now credits Taubes's 1980 paper and locates the statement at *SW ⇒ Gr*, Proposition 4.1(3), p. 871. Its proof on p. 880 refers to that paper (Tau96SWGr line 1604).

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result |
| --- | --- | --- | --- | --- |
| §3.4 curve paths (sample) | period doubling of a `(+,1)` torus; birth pair | `f_(+,0)(t) f_(−,0)(t²) = (1−t²)/(1−t) = 1+t = f_(+,1)`; `f_(+,0) f_(−,0) = 1` | IP97 (3.11)–(3.12), p. 12–13: `f_E f_H = 1`, `f_H′(t^k) = f_E(t^k) f_H(t^(2k))`; *Counting* unread | identities hold; locator not verifiable |
| §4.1 framed pairs (sample) | `u ≡ −1`; base-pointed group; `k = 3` | `u ≡ −1` excluded (no limit 1); based quotient dimension `2m+1`; `H⁴(ℝ²)` an algebra | Tau Ceti `FramedGauge.lean:39`: smooth, tends to 1, no base point | matches |
| §4.6 weighted estimates (sample) | `c = 0.4`, `c = 1/2` | margin `1/4 − c² = 0.09`; `0` at `c = 1/2`, matching §4.5's range `0 < c < 1/2` | Tau Ceti `vacuumAdjoint_vacuumOperator`: `L₀*L₀ = −Δ + 1/4` | consistent; *Gr ⇒ SW* unread |
| §4.7 flat scaling (sample) | `t = (2r)^(−1/2)`; `t = r^(−1/2)` | `(r/4)t² = 1/8`; `1/4` | Tau Ceti `coupledEquation c` has `c/8`, `c = 2r` gives `r/4`; Tau96SWGr (4.4), p. 871: `1/4` at `λ = √r` | holds |
| §5.2 coarse bounds (sample) | each bound against (1.24) | `|β|² ≤ Cr⁻¹w₊ + Cr⁻²`; `|F⁻| ≤ r/(4√2)(1+Cr^(−1/2))w₊ + C` | Prop 2.3: `(z/r)(1−|α|²) + zz′/r³`; (2.13) same factor; Lemma 2.6, p. 858 | supported (README weaker where it differs) |
| §5.5 rescaled compactness (sample) | decay rate | `exp(−c√r dist(x, α⁻¹(0)))` | Prop 4.4, p. 875: `z r exp(−z⁻¹ r^(1/2) dist)` for `r(1−|α|²)`, `r^(3/2)β`, `F_a`, `r^(1/2)∇α`; Prop 4.2, p. 872 | supported |
| §6.1b physical inputs (sample) | flat plane through a ball's centre | `ν(B_ρ) ≈ 2π²mρ² ≥ cρ²` | Lemma 5.2, p. 884: `H²(C∩B) ≥ z₁ρ²`; Prop 5.6, p. 887: limit an integer `> 0` | supported |
| §6.3 point cutdowns (sample) | `Ω_i = {x_i}` | limit curve through every `x_i` | Theorem 1.3, p. 852: `Ω_i ∩ α⁻¹(0) ≠ ∅` for all `i` gives `Ω_i ∩ image ≠ ∅` | supported |
| §7.8 disc foliation (sample) | `m = 1, 2, 3` | `p_m(1 − 1/m) = 0, 3/2, 16/9`, all `< 2` | closed form `2 − 2/m²`; HeegaardFloer §4.6e builds McDuff–Salamon E.6.2 | holds |
| §7.10 cone defect (sample) | regime `a → 0`, `h/a → 0` | error `(h/a)² + h/a + a + √a → 0`; `T(Ω) = Km·area(C)`, since `dλ` pairs to zero | closed, compactly supported current of fibre mass `m` | consistent; no source cited |
| §7.26 regularity ladder (sample) | base step with `δ₀ = 1/2` | `A₀ ≤ 2K₀(1 + ‖σ‖₂ + ‖h⁻¹S_h‖)`; `‖f²/h‖ ≤ ‖f‖_∞‖f/h‖` | Hölder | consistent |
| §7.27 onto inverse (sample, C01) | internal Needs graph | §7.27 needs §7.6; §7.6 needs §7.26–§7.27 | split at the covering by leading zeros removes the cycle | Needs-line cycle; mathematics not circular |
| §7.42 inverse charts (sample) | `(−1)`-sphere with `e = PD[S]`; torus with irrational flat normal line | index `S² − κS = −1 + 1 = 0`; `H⁰(N^j) = 0`, so `∂̄` invertible, degree `+1` | `f_(+,0)`: every coefficient `1` | consistent |
| §8.3 divisor line (sample) | slants of `pr_X e`; one-point base | zero against `[x]` and `γ` (Künneth `H²(X)⊗H⁰(B)`); `c₁(D)/[x] = μ`; determinant line gives `2μ` | Conventions 5 excludes `2μ` | holds |
| §10.4 chamber values (sample) | `g = 2`: `e = 3v + t`, `e = t`; wall value | `q = 2, d = 4, ⟨lΩ⟩ = 2(2+L)`; `q = −1, d = −2`; `c₁(index bundle on Picard T²) = l·t/2 = q` | Tau Ceti `apply_two_smul_sub_add_mul_apply_eq`; families index theorem | holds |
| Headline: plane vortices (Lean) | vacuum `!₂[0,0,1/2,0]`; section `w̄`; `m = 1` | `equation₀ = (4·¼ − 1)/8 = 0`; `w̄` has no zero divisor; `∫(1 − |α|²) = 16πm` | Tau96SWGr Prop 4.1(3)(i)–(iii), p. 871; Tau Ceti carriers at the pin | true as stated; probes fail |
| Headline: SW = Gr | `E` trivial; `E = K` on a quintic; `2E_x` on blown-up K3 | `1 = 1`; sign `(−1)^5 = −1`; `d = −2`, `e·E_x = −2`, both zero | *GR = SW* unread; forward cycles from Tau96SWGr Theorem 1.3 | consistent |
| Headline: mapping tori | Anosov `[[2,1],[1,1]]`; identity of `T²` | `ζ = 1 − t − 2t² − 3t³`, `det(I−P) = −1`, coarse `−a`; series `1` | IP97 Theorem 0.1, Theorem 5.1, Lemma 3.1; Tau Ceti `coeff_coe_charpolyRev_mul_mk_one_sq` | holds |
| §11.1 orbit labels | elliptic, `θ ∉ 2πℚ`; negative hyperbolic | `t f′/f = t/(1−t)`, giving `(+,0)`; `t/(1+t)`, giving `1+t` | IP97 Lemma 3.2: signs `1`, `−1`, `−(−1)^m`; p. 13: E, H, H′ ↔ `(+,0)`, `(−,0)`, `(+,1)` | holds |
| §2.3 two-torus Check | sections of `S² × T²`, `k = 2` | `[t²] f_(+,0)² = 3`; a sum would give `2` | McD96 Lemma 5.1, p. 33: `Gr(kB) = k + 1 = 3` | holds |
| §9.4 ↔ §10.1 (C01) | internal Needs graph | §9.4 needs §10.1; §10.1 needs no Layer 9 section | Layers 9 and 10 Dependencies name each other | acyclic at section level |
| Suspension contract (C02) | `J∂_s` | §10.1: `T = ∂_s`, `J∂_s = R`; contract: `J∂_s = T` | Tau Ceti `AlmostComplex.lean:221`: `T = ∂_t` | notation clash |

- Source locators checked against the text: 25 (Tau96SWGr 13, IP97 7, McD96 3, Bal03 2).
- Library declarations opened at the pins: Tau Ceti `Vortex/Deformation.lean:49,58,109`, `FramedGauge.lean:39,68`, `GaugeFixed.lean:71`, `FieldSpace.lean:152`, `Dilation.lean:127,194`, `VacuumOperator/Sobolev.lean:244`, `Charpoly/Symplectic.lean:74,84`, `Suspension/AlmostComplex.lean:221`. Mathlib: `Fredholm/Basic.lean:123`, `FunctionalSpaces/BesselPotentialSpace.lean:47`.
- All 114 library names the README cites resolve at the pins: 14 Mathlib names by `#check`, and 100 Tau Ceti names by a namespace-aware search, since most of their oleans are not built.
- Cross-roadmap citations resolved on main, about 45 ids, across MorseNovikov, HeegaardFloer, PseudoholomorphicCurveAnalysis, AnalyticStableMaps, ComplexKahlerGeometry, AlgebraicTopology, GeometricTopology, FourManifolds and SmoothBundlesConnections. The open SeibergWittenTheory and SymplecticGeometry revisions map their former numbering.
- Dependency check: "depcheck: 178 roadmaps, 2032 edges, 0 problem(s)". All 18 supplier roadmaps are on main.
- Automatic checks: all passed. `Suggested.lean` elaborates with three `sorry` warnings only. `#check @` of all five declarations matches the README. One-tactic probes (`simp`, `simp_all`, `aesop`) fail on all three theorems.
- All 45 Checks (37 blocks) were recomputed and hold. The Examples were also recomputed.
- The Fredholm headline is correctly named as not statable: `TauCeti.Vortex.sobolevFields` is a bare submodule, and only the vacuum operator is a continuous linear map.

Overlap check: read SeibergWittenTheory (main and the open revision), SymplecticGeometry (main and the open revision), HeegaardFloer, InstantonFloerTheory and DGFloer (main and the open head); nothing shared. SeibergWittenTheory excludes the large-`r`, vortex and weighted-count material (main line 5; revision lines 1522–1524). SymplecticGeometry assigns the counts, signs and zeta functions to TaubesGromov (revision lines 489–491). DGFloer assigns the surface-suspension application to TaubesGromov and keeps its own rational zeta separate (main line 86; head line 2845).

Source independence: 30 passages compared with 4 sources (Tau96SWGr, IP97, McD96, Bal03); nothing is shared beyond formulas, standard names and the five axioms of a positive cohomology assignment. Largest share: Tau96SWGr, 16 of 53 source citations. Contents compared with Tau96SWGr §§1–7: independent. §5.3 precedes §5.4, against the source's §3 order; §6.1 precedes §6.1a–§6.1b, against the source's §5-before-§6; and §5.8–§5.9 and §6.1c–§6.3 are the roadmap's own. *Counting*, *Gr ⇒ SW* and *GR = SW* (25 of 53 citations) could not be read.

Research link: the roadmap formalises Taubes's theorem SW = Gr for closed symplectic four-manifolds (*SW ⇒ Gr*, JAMS 1996; *Gr ⇒ SW* and *GR = SW*, JDG 1999; *Counting*, JDG 1996) and its mapping-torus application, the Gromov series as the Lefschetz zeta function (Ionel–Parker, Math. Ann. 1999). This rests on the README's References, Tau96SWGr §1 and IP97 Theorem 0.1.

## Not verifiable

- Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*, J. Differential Geom. 44 (1996): the Project Euclid DOI page has no PDF; it is cited at §1.1–§3.4 (sampled §3.4).
- Taubes, *Gr ⇒ SW*, J. Differential Geom. 51 (1999): the Project Euclid DOI page has no PDF; it is cited in Layers 4 and 7 (sampled §4.1, §4.6, §4.7, §7.8–§7.42).
- Taubes, *GR = SW*, J. Differential Geom. 52 (1999): the Project Euclid DOI page has no PDF; it is cited at §0.1–§0.2, §6.2–§6.3, Layers 7–8 and §9.1 (sampled §6.3, §8.3).
- Taubes, Math. Res. Lett. 1 (1994) and 2 (1995): the publisher returned HTTP 403; they are cited only for the canonical sign and an announcement.
- Taubes, Comm. Math. Phys. 72 (1980): paywalled and recorded as uncertified; the statement was checked through Tau96SWGr Proposition 4.1(3), p. 871, and p. 880.
- §7.10, §7.26, §7.27 and §7.42 cite no source at the claim, so they were checked for internal consistency only.

## Source issues

- **Misprint** in Tau96SWGr at Theorem 1.3, p. 852: the source asks for a metric making ω anti-self-dual; it should be self-dual, as §1(c), p. 850, sets up; affects nothing.
- **Misprint** in Tau96SWGr at (4.5), p. 872: the source writes the pulled-back form with the term dy₂∧dy₄; it should be dy₃∧dy₄, as in (4.1); affects nothing.
- **Misprint** in Tau96SWGr at the proof of Lemma 5.2, p. 884: the source attributes an upper bound on the measure of C∩B to Proposition 3.1; it should say lower bound, as the lemma asserts; affects nothing.
- **Misprint** in McD96 at Definition 5.2, p. 34: the source takes, for each multiple m, a sum over the tori in class mA of their series; it should be a product, as Lemma 5.1's value k + 1 requires; affects nothing.
- **Misprint** in IP97 at §5, before Theorem 5.1, p. 20: the source says the fibre and section classes have intersection 0; it should be 1, as the proof's α = A·T uses; affects nothing.

## For the human reviewers

- Not tested: Taubes's three J. Differential Geom. papers (*Counting*, *Gr ⇒ SW*, *GR = SW*) hold 25 of 53 source citations, including the SW = Gr headline (§9.1). They have no legal open copy and are cited by title without locators, so wording and arrangement were not compared with them.
