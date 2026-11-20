# Review of TaubesGromov (pull request #2699 at bf96c5c)

**Verdict:** needs changes

**Summary.** One finding blocks acceptance: an Example in Layer 6 says that on a Kähler surface the limit cycle for `E = K` is a canonical divisor, which is false when `b₁(X) > 0`; one clause repairs it. Every other statement, Check and Example recomputes correctly, the three Lean theorems are true as stated on Tau Ceti's carriers, and every locator into a readable source was confirmed at the text. There are five small corrections and one format note, none blocking. The human reviewers have one fact to weigh: Taubes's three J. Differential Geom. papers, which carry the SW = Gr headline, have no legal open copy and are cited by title only.

## R01 (P2) — On a Kähler surface with `b₁ > 0` the limit cycle for `E = K` need not be a canonical divisor

The first Example of Layer 6 (line 1102) reads "For `X` Kähler with `b₂⁺ > 1` and `E = K`, the limit cycle of large-`r` solutions is a canonical divisor". A reader takes from it that the forward limit determines the holomorphic line bundle, which contradicts the care §6.1c takes to say that the limit fixes only the topological line.

A label is a Hermitian line, so `E = K` fixes `c₁(E) = κ` and nothing more. On a Kähler surface the large-`r` solutions with `β = 0` are the pairs of a holomorphic structure on `E` and a holomorphic section, and the zero divisor of `α` is any effective divisor `D` with `c₁(O(D)) = κ`. Take `X = C₁ × C₂` with both genera at least `2`, so `b₂⁺ = 1 + 2g₁g₂ > 1`, and `L = p₁*L₁` with `L₁` a nontrivial line of degree zero on `C₁`. Then `c₁(K ⊗ L) = κ` and `h⁰(K ⊗ L) = h⁰(K₁ ⊗ L₁) · h⁰(K₂) = (g₁ − 1) g₂ > 0`. A divisor of such a section is the zero set of `α` for a solution at every large `r`, so it is a limit cycle, and it is not linearly equivalent to a canonical divisor because `L` is nontrivial.

The smallest repair: "the limit cycle of large-`r` solutions is an effective divisor in the class `PD(κ)`, a canonical divisor when `b₁(X) = 0`".

## C01 — §7.6 and §7.27 each name the other in their Needs lines, so Layer 7's "Its sections are in build order" (line 1118) is not true as written

An implementer who follows the Needs lines can start neither section: §7.6 needs "§7.26–§7.27 (the ladder and the rates it is applied after)" (line 1228), and §7.27 needs §7.6 (line 1655) for the stabilized family, `D₀` and `κ₀`. The mathematics is not circular: §7.6 uses only the leading equation and the covering by leading zeros with which §7.27 opens, and the rest of §7.27 uses §7.6. Writing in §7.6's Needs line "§7.26, and the leading equation and covering by leading zeros of §7.27" would say so. A milder case: §9.4 needs §10.1 (line 2105) and the Dependencies of Layers 9 and 10 name each other, although §10.1 uses nothing from Layer 9; one clause in Layer 9's Dependencies would remove the apparent cycle.

## C02 — The Tau Ceti suspension contract writes `J∂_s = T` and `σ_v`, where §10.1 has `T = ∂_s`, `J∂_s = R` and `ω_v`

In §10.1–§10.2, `T` is the unit field `∂_s` (line 2142), so the contract's "block structures with `J∂_s = T`" (line 2650), read in the README's notation, says that `J` fixes `∂_s`. The contract has taken over Tau Ceti's notation, where `T = ∂_t` is the suspension field (`TauCeti/Geometry/Symplectic/Manifold/Suspension/AlmostComplex.lean`, line 221). Writing "`J∂_s = R`, the suspension field (Tau Ceti's `T`)" and `ω_v` would match §10.1.

## C03 — One sentence of the description overstates where sources are cited

The description says the layers are "prose subsections, each with a Needs line listing its inputs and its sources cited at the claim". Every subsection has a Needs line, but about fifty cite no source at the claim: §7.1–§7.42 rest on the citation of *Gr ⇒ SW* and *GR = SW* in the Layer 7 introduction, and §0.3, §1.4, §5.8–§5.9, §9.2–§9.3, §9.5, §10.1, §10.3 and §10.4 cite none. Text that would be right: "each with a Needs line listing its inputs, and with a locator at the claim wherever a readable source states the result".

## C04 — The Check of §0.1 uses a symbol `D_J` that is defined nowhere

Line 132 reads "`J′ρ₁ = D_J ρ₁/2 = ρ₂`". The README defines `J′` on `Ω⁺` by `ω_u × ρ` (line 108) and no operator `D_J`, so the middle term cannot be evaluated. The outer equality is right: in the oriented frame `(ω_u, ρ₁, ρ₂)`, `ω_u × ρ₁ = ρ₂`. Writing "`J′ρ₁ = ω_u × ρ₁ = ρ₂`" would use the definition given.

## C05 — The finite-energy clause of `IsFramedVortex` follows from its other clauses

In `TauCetiRoadmap/TaubesGromov/Suggested.lean` (line 50) the definition asks for `Integrable (TauCeti.Vortex.energyDensity x)`. For a smooth solution whose section times the inverse winding phase tends to one, `|α| → 1`, and Tau Ceti's `TauCeti.Vortex.integrable_energyDensity` (`TauCeti/Analysis/PDE/Vortex/Energy.lean`, line 153) then gives the integrability; §4.4 itself cites that theorem. The clause changes no theorem. If it is kept to match the prose definition of §4.1, one sentence in the docstring saying that it is implied would tell an implementer that nothing has to be proved for it.

## N01 — Three symbols are reused with a second meaning in §7.10 and §7.36

In §7.10, `Ω = Kπ*ω_C + dλ` reuses `λ`, which §7.1 fixes as `√(2r)`. In §7.36, `α = dθ + A` and `ρ` reuse the section `α` and the forcing `ρ`. Renaming the primitive one-form and the radial coordinate would remove the clash.

## Earlier findings

The previous review of this same head had no findings. Its three small corrections and its format note stand unchanged, since the head is unchanged: they are C01, C02, C03 and N01 above. Its record of the repairs made before this head was confirmed again at the text: the `(+,1)` Example (line 374) reads "it contributes `1` in its own class and nothing in its multiples"; Conventions item 9 maps the former TG numbering; Layer 5 has no introductory paragraph; the Check of §9.4 defines `v` and `t`; the Layer 5 Example has the limit `m` times the current of `ℂ × {0}`; §4.4 carries the negative Check on `w̄`.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Source / library side (computed) | Result |
| --- | --- | --- | --- | --- |
| §0.1 determinant orientation (sample) | symbol at `ξ = e₁` on `e₁..e₄` | images `1, ω_u, ρ₁, ρ₂`; `σ(Je_i) = J′σ(e_i)` for all four; without `√2`, `e₂ ↦ ω_u/√2` | *GR = SW* unread; Tau Ceti symbol names resolve at the pin | holds; locator not verifiable; C04 |
| §1.1 configurations, good classes (sample) | exceptional sphere `S`; `e = κ` | adjunction `−2 = −1 + κ·S`, so `κ·S = −1 ≥ −1`: good; `e·S ≥ 0` would make `κ` bad | McD96 Lemma 3.3: `Gr′ = Gr` unless `E·A < −1`; *Counting* unread | consistent; locator not verifiable |
| §4.4 classification (sample, headline, Lean) | vacuum; `w̄`; `m = 1`; sign of winding | `equation₀(vacuum) = (4·¼ − 1)/8 = 0`; flux `16πm`; `a ≈ −im dθ` gives `∫iF = 2πm ≥ 0` | Tau96SWGr Prop 4.1(3)(i)–(iii), p. 871, coefficient `1/4` (scaling `√2`); proof p. 880 cites the 1980 paper | true as stated; probes fail |
| §5.4 monotonicity (sample) | flat vortex plane in a ball | `(r/4)·16πm/(2r) = 2πm` per disc; `E ≈ 2π²mσ²`; `(σ/2)(cσ²)′ = cσ²` | Prop 3.2 (3.3), p. 862: factor `s/2`, `(1+zs)(1+z r^(−1/2))`, `+z s⁴`; Lemma 3.6, p. 867: `z₁ρ⁻²` balls | supported |
| §5.5 rescaled compactness (sample) | `F_A − F_(A^can) = 2F_a` off zeros | bound `C/r + C r exp(−c√r d)` | Prop 4.4, p. 875: `|F_a| ≤ z r exp(−√r d/z)`; Prop 4.2, p. 872 | supported |
| §5.6 localization (sample) | `|α| ≤ θ` | `1 − θ² ≤ z exp(−√r d/z)` gives `d ≤ (z/√r) log(z/(1−θ²)) = K_θ h` | Prop 4.4, p. 875, for `r(1 − |α|²)` | supported |
| §5.3 Hermitian curvature | `F = e¹² − e³⁴`; `F = ω` | `B = diag(1,1,−1,−1)`, `λ_min = −1 = −√2/√2`; `c = 1`; `√2 r/8 = r/(4√2)` | Prop 3.4, p. 866 | holds |
| §5.9 modulus potential | `α = z`; general `∂̄_a α ≠ 0` | `τ = dθ = d^c H`; `d^cH = χτ − 2χ Im(α⁻¹∂̄α)`, and `Re(β)∘J = Im β` on `(0,1)`-forms | none cited | identity holds |
| §6.2 canonical-cycle expansion | `N`–`N` cross terms; `m₁ = m₂ = 2`, `S₁·S₂ = 1` | with `N` disjoint: self `−Σm(m−1)`, cross `+2Σm(m−1)`, total `+Σm(m−1)`; trial gives `κ·S₁ = 0 ≠ −1` | Tau Ceti `IsCanonicalCycle.apply_eq_zero_of_ne`, `CanonicalCycle.lean:179` | holds |
| Layer 6 Example (R01) | `C₁ × C₂`, `g_i ≥ 2`, `L = p₁*L₁` | `h⁰(K ⊗ L) = (g₁−1)g₂ > 0`, `c₁ = κ`, divisor not canonical | README §6.1c: limit fixes the topological line only | false for `b₁ > 0` |
| §7.1 rescaled norms (sample) | `j = 0`, `w = λy` | `λ⁻²∫|b|²d²y = λ⁻²∫|b_w|²d²w`; `∫|ζ|²/4 d²y = λ⁻²∫|ζ|²/4 d²w` | Layer 4 metric `|b|² + |δα|²/4` | consistent; no locator |
| §7.17 uniformity (sample) | forward references | §7.23 needs §7.22, which needs §7.19: projection used after confinement | §7.36 exists | consistent; no locator |
| §7.18 torus branch (sample) | component of genus `g′`, `A² = κ·A = 0` | adjunction `2g′ − 2 = −2δ ≤ 0`; Riemann–Hurwitz `2g′ − 2 ≥ 0`; so `g′ = 1`, `δ = 0`, unramified | HeegaardFloer §4.6e on main | holds; no locator |
| §7.19 graph branch (sample) | `k_C = d(C)/2`; `(−1)`-sphere | index `d(C) − 2k_C = 0`; normal degree `−1`, index `2(−1) + 2 = 0` | PseudoholomorphicCurveAnalysis §7.2 on main | holds; no locator |
| §7.21 templates (sample) | inverse, composite | `D(A⁻¹) = −A⁻¹(DA)A⁻¹`; `D(TS) = (DT)S + T(DS)` | none cited | consistent |
| §7.28 ledger (sample) | exponent list | `q, p_quad, a, π, b`: the five of §7.34 | none cited | consistent |
| §7.34 joint witness (sample) | `q = p_quad = a = 1`, `π = 0`, `b = 3` | `N ≥ 3`, `N ≥ 2`, `N ≥ 5`; at `N = 3`: `h¹` against `γ ~ h²` | §7.35: `2C²Lε < 1/4`, `2Cε < δ/4` give the first two | holds |
| §7.41 contraction | `τ_r` term `[16C²L(1+B)]⁻¹` | `2C²LBτ ≤ 1/8`; total `< 3/8`; `R_Newton < δ/2` and `< 3/(8CL) < 1/(2CL)` | §7.37 `γ_r` | holds |
| §7.6 ↔ §7.27 (C01) | Needs graph | each needs the other | §7.6 uses only §7.27's first two sentences | Needs cycle only |
| §9.3 wall coordinate | `ρ = 0`, `η = 0`; `e = 0` | `w = −2π l·[ω]`; `(r/4)‖ω‖² − 4π e·ω`; `w = −2πΔ` termwise | SeibergWittenTheory SW6.2, SW10 on main | holds |
| §10.2 energy (sample) | `F = i(ds∧a + b)` | both sides `|a|² dvol + ds∧a∧b`; `½∫(iF)² = 2π²l²` | Bal03 Theorem 15 (line 523): same four terms plus the `δ` term; Theorem A in §4.1 | supported |
| §10.4 chambers | `g = 2`: `e = 3v + t`, `e = t` | `q = 2`, `d = 4`, `2(2 + L)`; `q = −1`, `d = −2`; `w(g,0) < 0` for `c > 0` | Tau Ceti chamber lemmas resolve at the pin | holds |
| §11.1 orbit labels | elliptic; negative hyperbolic | signs `+`; `(−1)^(k+1)`; series `1/(1−t)`, `1 + t` | IP97 Lemma 3.2 (line 463), (3.9), p. 13: E, H, H′ ↔ `(+,0)`, `(−,0)`, `(+,1)` | holds |
| §11.2 Wang orientation | `P = [[2,1],[1,1]]`; reciprocal `p` | `det(I−P) = −1`; `1 − t − 2t² − 3t³`; `p′(1) = g p(1)`; coefficient `p(1)(a+1−g)` | Tau Ceti `catMap`, `Dynamics/CatMap.lean:43`; IP97 Theorem 5.1 (5.2) | holds |
| §11.3 zeta identity (sample, headline) | period `d` orbit; identity of `T²` | `N(h) = d`, `P_α(h) = −d`; series `(1−t)²/(1−t)² = 1` | IP97 Theorem 0.1 (line 53), proved in §4; (3.10) (line 531); Lemma 3.1 | supported in one variable, as the README says |
| Headline: SW = Gr, bad classes | `E` trivial; `E = K` on a quintic; `2E_x` on blown-up K3 | `1 = 1`; `(−1)^5 = −1`; `d = −2`, `e·E_x = −2`: both zero | *GR = SW* unread; forward cycles Tau96SWGr Theorem 1.3, p. 852 | consistent |
| Headline: minimal products | `b₁(Y) = 1` | `b₂ = 2`, signature `0`, `b₂⁺ = 1`; `X` parallelizable, form even; `d(e) = 0` | Tau96SWGr p. 847 remark on `b₂⁺ = 1` | consistent |
| Suspension contract (C02) | `J∂_s` | §10.1: `T = ∂_s`, `J∂_s = R` | Tau Ceti `AlmostComplex.lean:221`: `T = ∂_t` | notation clash |
| `IsFramedVortex` (C05) | energy clause | framing gives `|α| → 1` | Tau Ceti `Energy.lean:153` gives integrability | clause implied |

- Source locators checked against the text: 27 (Tau96SWGr 15, IP97 7, McD96 3, Bal03 2); all agree in number, page and content.
- Library declarations opened at the pins: Tau Ceti `Vortex/Deformation.lean:49,58,99,109`, `FramedGauge.lean:39,69`, `Energy.lean:153`, `GaugeFixed.lean:71`, `FieldSpace.lean:152`, `VacuumOperator/Sobolev.lean:244`, `JHolomorphic/CanonicalCycle.lean:96,179`, `Dynamics/CatMap.lean:43`, `Suspension/AlmostComplex.lean:221`. The equation's sign and normalization were recomputed from line 49: `*iF_a = (1 − |α|²)/8` and `∂̄_a α = (∇₁α + i∇₂α)/2`.
- Cross-roadmap citations resolved on main: SeibergWittenTheory SW1.2–SW11.3 (22 items), HeegaardFloer §2.2, §3.4, §4.6b, §4.6e, PseudoholomorphicCurveAnalysis §3.1, §6.2, §6.3, §7.2, AnalyticStableMaps §0.5, §2.9, §2.13, §2.21, §3.7, MorseNovikov §4.1, §6.4, §6.5, AlgebraicTopology §5.1, §6.3, §8.7, SmoothBundlesConnections B6.2, GeometricTopology §1.5, ComplexKahlerGeometry §5.1, §5.4, §5.7, FourManifolds §4.1, §4.2, SymplecticGeometry S0–S2 and CotangentLagrangian C4, HopfRinow under Completed. All 18 suppliers are on main.
- Dependency check: "depcheck: 182 roadmaps, 2073 edges, 0 problem(s)"; no UPWARD or CYCLE line. No file outside the folder is changed.
- Automatic checks: all passed. `Suggested.lean` elaborates with three `sorry` warnings only; `#check @` of the five declarations matches §4.4; one-tactic probes (`simp`, `simp_all`, `aesop`, `exact?`) fail on all three theorems; a proved test that the vacuum has the empty zero divisor elaborates.
- All 45 Checks (37 blocks) and the Examples were recomputed; all hold except the Example of R01.
- Headlines not statable are named in the module docstring with what each lacks; the Fredholm headline is rightly among them (Tau Ceti has the gauge-fixed operator at a field only pointwise, `GaugeFixed.lean:71`, and no Fredholm statement in the vortex folder).
- No declaration of the pinned libraries states existence of vortices for a prescribed multiset of zeros, and no other roadmap declares these names.

Overlap check: read SeibergWittenTheory (main and its open revision), SymplecticGeometry (main and its open revision), HeegaardFloer, DGFloer and InstantonFloerTheory; nothing shared. SeibergWittenTheory excludes the large-parameter, vortex, weighted-count and zeta material (main, opening section; revision line 1523); SymplecticGeometry leaves the surface specialization and counts to TaubesGromov (revision lines 45, 488, 593); DGFloer assigns the surface suspension and its point-count and zeta applications to TaubesGromov (main line 86; open head line 4125).

Source independence: 16 passages compared with 4 sources (Tau96SWGr, IP97, McD96, Bal03); nothing shared beyond formulas, standard names and the five criteria of a positive cohomology assignment, restated in other words. Largest share: Tau96SWGr, 16 of 54 source citations. Contents compared with Tau96SWGr §§1–7: independent; Layers 5–6 keep the order their Needs lines force (§5.4 on §5.2, §5.5 on §5.2–§5.3, §5.6 on §5.5), with §5.3 before §5.4 against the source, §5.8–§5.9 and §6.1c–§6.3 the roadmap's own, and §6.1 before §6.1a–§6.1b against the source's §5 before §6. *Counting*, *Gr ⇒ SW* and *GR = SW* (25 of 54 citations) could not be read.

Research link: the roadmap plans Taubes's theorem SW = Gr for closed symplectic four-manifolds (Taubes, *SW ⇒ Gr*, 1996; *Counting*, 1996; *Gr ⇒ SW* and *GR = SW*, 1999) and its mapping-torus application, the Gromov series as a Lefschetz zeta function (Ionel–Parker, 1999). It rests on the README's References, Tau96SWGr §1 and IP97 Theorem 0.1.

## Not verifiable

- Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4* (1996): no legal open copy; cited by title at §1.1–§3.4 (sampled §1.1, checked for internal consistency only).
- Taubes, *Gr ⇒ SW* (1999): no legal open copy; cited by title in Layers 4 and 7 (sampled §7.1, §7.17–§7.19, §7.21, §7.28, §7.34, checked for internal consistency only).
- Taubes, *GR = SW* (1999): no legal open copy; cited by title at §0.1–§0.2, §6.2–§6.3, Layers 7–8 and §9.1 (sampled §0.1, checked by computation only).
- Taubes, Math. Res. Lett. 1 (1994) and 2 (1995): no legal open copy; cited for the canonical sign and an announcement.
- Taubes, Comm. Math. Phys. 72 (1980): paywalled and recorded as uncertified; the statement was checked through Tau96SWGr Proposition 4.1(3), p. 871, and line 1604.

## Source issues

- **Misprint** in Tau96SWGr at Theorem 1.3, p. 852: the source asks for a metric making ω anti-self-dual; it should be self-dual, as §7(a), p. 909, states; affects nothing.
- **Misprint** in Tau96SWGr at the proof of Lemma 5.2, p. 884: the source attributes an upper bound on the measure of C∩B to Proposition 3.1; it should say lower bound, as the lemma asserts; affects nothing.
- **Misprint** in McD96 at Definition 5.2, p. 34: the source takes, for each multiple m, a sum over the tori in class mA of their series; it should be a product, as Lemma 5.1's value k + 1 requires; affects nothing.
- **Misprint** in IP97 at §5, before Theorem 5.1, p. 20: the source says the fibre and section classes have intersection 0; it should be 1, as the proof's α = A·T uses; affects nothing.

## For the human reviewers

- Not tested: Taubes's three J. Differential Geom. papers (*Counting*, *Gr ⇒ SW*, *GR = SW*) hold 25 of 54 source citations, including the SW = Gr headline (§9.1); no legal open copy exists, so wording and arrangement were not compared with them.
