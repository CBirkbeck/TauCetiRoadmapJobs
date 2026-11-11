<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6797461434 -->
Red team round 2 pass b (claude) of 1427b80

Verdict: needs_changes

1. **F01** (P2) `Π_θ` is not well defined on the vertex classes of `S_P`

   **Location.** `packages/MathematicalBilliards/README.md:844`: "the map `Π_θ : S_P → Z_P`, `[h, x] ↦ (x, h⁻¹θ)`, is well defined (on a side `S` the representatives `(h, x)` and `(hσ_S, x)` give `(x, h⁻¹θ)` and `(x, σ_S h⁻¹θ)`, which `Z_P` identifies)".

   **Claim.** `Π_θ` is a map on all of `S_P`.

   **Witness.** §11.1 glues `(g, x) ∼ (gσ_S, x)` for every `x` in the side `S`, vertices included; §7.2 identifies `(x, v) ∼ (x, σ_S v)` only "for `x` in the relative interior of `S`". Unit square, `θ = exp(iπ/6)`, vertex `0`, `S` the bottom side: `[id, 0] = [conj, 0]` in `S_P`, but `(0, exp(iπ/6)) ≠ (0, exp(−iπ/6))` in `Z_P`.

   **Repair.** Replace the quoted passage by:

   "the map `Π_θ`, `[h, x] ↦ (x, h⁻¹θ)`, from the complement in `S_P` of the vertex classes to `Z_P`, is well defined (at a point `x` of the relative interior of a side `S` the two representatives `(h, x)` and `(hσ_S, x)` give `(x, h⁻¹θ)` and `(x, σ_S h⁻¹θ)`, which `Z_P` identifies; at a vertex `Z_P` makes no identification and `Π_θ` has no value)"

   and in the next sentences replace "leaves `Π_θ` unchanged" by "leaves `Π_θ` unchanged (it permutes the vertex classes)" and "It carries `area_{S_P}` to" by "It carries `area_{S_P}`, for which the vertex classes are null, to". Add to the Checks of §11.4:

   "- The vertex classes are outside the domain of `Π_θ`: for the unit square and `θ = exp(iπ/6)`, `[id, 0] = [conj, 0]` in `S_P` (the vertex `0` lies on the bottom side), while `(0, exp(iπ/6))` and `(0, exp(−iπ/6))` are distinct points of `Z_P`, the vertex being in the relative interior of no side. The vertex classes are cone points, so they are not in `S_P^θ`."

   Tested on the instance: `[id, 0]` is no longer in the domain; `S_P^θ` contains no vertex class, so the bijection `S_P^θ/K_θ → M_θ ∖ Σ`, the conjugacy and the measure statement (`4 = |G| area P` on the square) are unchanged.

2. **F02** (P3) Layer 10 "Dependencies" omits the Tau Ceti groupoid it now consumes

   **Location.** `packages/MathematicalBilliards/README.md:800`: "Mathlib manifolds."

   **Claim.** Layer 10 depends on Mathlib only.

   **Witness.** README:728 (§10.1) "*Needs:* Tau Ceti `TauCeti.smulGroupoid`, `TauCeti.mem_smulGroupoid_iff`, …"; README:786 (§10.5) "*Needs:* … Tau Ceti `TauCeti.hasGroupoid_smulGroupoid_quotient_subgroup`".

   **Repair.** Replace the line by: "Mathlib manifolds; Tau Ceti's structure groupoid of a group action (`TauCeti/Geometry/Manifold/SMulGroupoid.lean`, in §§10.1, 10.2 and 10.5)."

One P2 finding (S01, introduced by the round-1 repair of 1a/F03) and one P3 finding (S02, left behind by the round-1 repair of 1a/F02). No statement of `Suggested.lean` was found false; no supplier citation is broken; the dependency check is clean.

## Round-1 findings at this head

| Finding | State | Witness at `1427b80` |
|---|---|---|
| 1a/F01 (strong continuity absent from the acceptance test) | repaired | `packages/MathematicalBilliards/Suggested.lean:269–274` states `continuous_compMeasurePreserving_vadd` with `[MeasurableVAdd₂ ℝ X] (μ) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ] (f : Lp ℂ 2 μ)`; README §12.3 "Prove `continuous_compMeasurePreserving_vadd`: for a jointly measurable action of `ℝ` on a probability space"; module docstring lines 24–26. Route recomputed (below): true. |
| 1a/F02 (translation groupoid rebuilt) | repaired, one leftover (S02) | README §10.1 "The translation groupoid is `TauCeti.smulGroupoid (Multiplicative ℂ) ℂ`"; the eight Tau Ceti names exist in `TauCeti/Geometry/Manifold/SMulGroupoid.lean` (lines 123, 153, 164, 216, 223, 299) and `ContMDiff/Groupoid.lean:67`. The Layer 10 "Dependencies" line was not updated (S02). |
| 1a/F03 (unfolding only for trivial stabiliser) | repaired, the repair introduced S01 | README §11.4 "`Π_θ` induces a bijection from `S_P^θ/K_θ` onto `M_θ ∖ Σ`"; recomputed on the square at `θ = 1`, `exp(iπ/6)`. The new sentence "`Π_θ : S_P → Z_P` … is well defined" is false at vertex classes (S01). |
| 1a/F04 (zero iterate in the least-period Check) | repaired | README §6.2 "let `m` be the least positive integer with `F^m(x₀) = x₀ + (jℓ, 0)` … Positivity matters: `m = j = 0`". Diameter: `m = 2`, `j = 1`, `(2/2)·1 = 1 = p`. |
| 1b/F01 (`k ≥ 2` on the invariant measure) | repaired | `Suggested.lean:162–164` has no `hk`; README §3.3 "for every table `γ` (of class `C^k`, `k ≥ 1`)" with the route through `Λ`; §5.3 third paragraph added. Recomputed: `∂_s(e × γ(s)) = e × τ(s) = −sin δ`; unit circle `Λ(I(T(s, δ))) = R(Λ(s, δ))`. |
| 1b/F02 (`hcop`) | repaired | `Suggested.lean:246–249`: `{p q : ℕ} (hp : 0 < p) (hpq : p < q)`; README §6.4 "The coprime case is the content". `(2, 4)` on the ellipse: gaps `ℓ/2`, `s_{j+4} = s_j + 2ℓ`. |
| 1b/F03 (orientation preservation undefined) | repaired | README §4.1 API "maps each boundary circle onto itself preserving its direction"; §5.2 "The lift condition is the orientation-preserving hypothesis of Herman1983, Appendice, line 1150"; Herman1983 lines 1150–1154 read. Check `(−x − y, y)` : `F(x + 1, y) = F(x, y) − (1, 0)`. |
| 1b/F04 (Herman 3.4.3 as a definition) | repaired | README §4.4 "This is the standard definition, stated here; Herman1983, Chapitre I, 3.4.3, lines 425–432, does not define the set"; `Suggested.lean:179–182`. Herman1983 lines 425–432 read: agrees. |

## Verified sound

Counts: 17 declarations of `Suggested.lean` read (9 definitions, 8 theorems) and the proved `example`; 52 README subsections with every bold target read; 29 line locators verified against the cached texts (Herman1983 9, Hochman2012 7, BialyMironov2022 8, ChaikaForni2026 5), all supporting their claims, printed pages included (Hochman2012: printed page = extraction page − 1; lines 2439, 2627, 2854, 3076, 3099 give pp. 56, 59, 64, 69, 70); 186 Check bullets read, every numerical one recomputed, none false or vacuous, every definition with at least three; 11 sibling citations resolved (SymplecticGeometry/CotangentLagrangian C3.1 at README lines 527–590, IntegrableSystems I5.0 at 426–437 and I5.4 at 672–682, RiemannianGeometry/Surfaces §3.1 with `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` in its `Suggested.lean:130`, GeometricTopology §2.3 at 1386 and §1.7 at 1049, FactorRigidity §8.2 at 746, all on main; ProbabilisticAndMetricNumberTheory §4.6 and §4.9a at its open head, lines 5507 and 6319, line 62 of the merge order); 66 pinned declarations grepped (43 Mathlib, 23 Tau Ceti), all present in the files the README names.

**Dependency check** (output): `depcheck: 223 roadmaps, 1966 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The roadmap is line 404, the last, of `merge-order/ORDER.txt`.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/MathematicalBilliards/` (11 files). No pull-request number, process word, `lemma`, `set_option`, `#eval`, `#print`, `True` placeholder or sorry'd data in the README or the Lean file. Imports: `import Mathlib` and `TauCeti.Analysis.Semigroups.Group.Unitary` (exists at the pin, used by `exists_tendsto_twistedAverage`). `design/plan.json` has `"gaps": []`; none is needed.

**Binders.** I ran no Lean. I compared the 17 elaborated types of `scratch/signatures.md` with the README statements: the file has no `variable` block, every binder is in its own signature, and each type equals its README statement (`measurePreserving_billiardMap` without `2 ≤ k`; `exists_lipschitzWith_of_isRotationalInvariantCurve` with `2 ≤ k`; `exists_two_periodic_orbits` with `0 < p`, `p < q` only; `isGraph_of_isRotationalInvariantCurve` with `0 < ℓ`, `a < b`, the lift relation, `IsTwistLift ℓ F ∨ IsTwistLift ℓ F.symm`, non-wandering on the open annulus). Nothing changed.

**Pinned statements quoted.** `Measure.prod` is `if SFinite ν then bind … else 0` (`Mathlib/MeasureTheory/Measure/Prod.lean:172`), as the README says. `AddCircle.measurePreserving_mk` is for `volume.restrict (Ioc t (t + T))` (`Periodic.lean:91`). `TauCeti.Semigroups.StronglyContinuousGroup` has real-linear operators and continuity at `0` only (`Group/Basic.lean:74`), `IsUnitary` is preservation of `⟪·,·⟫_ℂ` (`Group/Unitary.lean:107`). `TauCeti.hasGroupoid_smulGroupoid_quotient_subgroup` needs `T2Space`, `LocallyCompactSpace`, `ProperlyDiscontinuousSMul`, `IsCancelSMul` (`SMulGroupoid.lean:286–303`), which §10.5 states. `ContMDiffConstSMul`: no instance for `Multiplicative ℂ` on `ℂ` at the pins; the instance from `ω` to every `n` is `Mathlib/Geometry/Manifold/Algebra/SMul.lean:251`. No non-wandering set, weak mixing, Wiener lemma or continuous-time mean ergodic theorem at the pins (`grep` for `nonwandering`, `WeaklyMixing`, `WeakMixing` over both libraries: no file); `Lp.compMeasurePreserving_continuous` needs continuous maps and topological spaces.

**Headlines and padding.** End theorems of the README: (1) invariance of `sin δ dδ ds`, (2) Birkhoff's graph theorem, (3) two Birkhoff orbits, (4) measure preservation and reversibility of the polygonal flow, (5) the unfolding theorem, (6) the eigenfunction criterion. (1), (2), (3), (6) are stated, with the Lipschitz form of (2) and the three Layer 12 theorems that (6) is built on; (4), (5), non-ergodicity and the genus formula are named in the module docstring with the missing carrier. One-tactic probe: no theorem follows from one pinned lemma or restates a definition; the proved `example` tests the orientation convention of `ConvexTable`. No padding.

**Ownership.** Searched main and the open heads by object with the roadmap tool (`billiard`, `translation surface`, `Wiener`, `weak(ly) mixing`, `non-wandering`, `twist map`, `invariant curve`, `mean ergodic`, `Katok–Zemlyakov`). Owners found are the ones the README cites (C3.1 for smooth billiards; FactorRigidity §8.2; ProbabilisticAndMetricNumberTheory §4.9a; Completed/Exchangeability and Mathlib for the discrete mean ergodic theorem). OperatorTheory/UnboundedOperators (open) mentions one explicit translation surface and no carrier; PainleveEquations (open) uses "invariant curve" for an algebraic curve; Equidistribution (open) cites the discrete mean ergodic theorem. This roadmap is the owner of the remaining objects. No `Suggested.lean` at main or an open head declares one of this file's fully qualified names (the six names of `scratch/citations.md` are this file's own declarations).

**Adversarial pass: `Suggested.lean`.**

| Declaration (context: no `variable`; binders in the signature) | Instances tried | Values on each side | Result |
|---|---|---|---|
| `ConvexTable` (`k`, `ℓ`, `[Fact (0 < ℓ)]`) | unit circle; clockwise circle; stadium; `exp(2iu) + exp(iu)` | `1 − cos(t − s)`, `2` at `π`; `cos(t − s) − 1 = −2`; `0` along a segment; `Im(conj γ′ γ″) = 9 + 6cos u ≥ 3`, turning `4π`, not injective | orientation and strictness determined |
| `ConvexTable.billiardLift` | unit circle `(0, π/2)`; `δ = 0`; `δ = π`; `δ ∈ (π, 2π)`; `(0, 5π/2)` | set `{−sin t ≥ 0} = [π, 2π)`, `s₁ = π`, `δ₁ = arccos 0`; set `(s, s + ℓ)`, `(s, 0)`; set `∅`, `sInf ∅ = 0`; set `(s, s₁′]`, `s₁ = s`, `δ₁ = arccos(cos δ)`; `e = −1`, image `(π, π/2)` | agrees with §2.1, §3.3 |
| `ConvexTable.billiardMap` | circle `R` | `(s + 2Rδ, δ)`; independent of the representative by `F(s + ℓ, δ) = F(s, δ) + (ℓ, 0)` | sound |
| `phaseMeasure` | total mass; `δ < π/2` | `ℓ · 2`; `ℓ` | sound |
| `ConvexTable.measurePreserving_billiardMap` | ellipse `(2cos u, sin u)` at `(2, 0)`, `δ = π/4`; `k = 1`; measurability off `A` | exit `t = 4/5`, point `(6/5, 4/5)`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5`, `sin δ₁ · det = 1/√2`; `∂_s(e × γ) = −sin δ` needs `C¹` only; pieces `A`, `(π, 2π) ∪ {0}`, `≡ π`, `(0, π) + 2πm` cover `ℝ`, the map continuous on each | true as typed |
| `IsTwistLift` | shear; `(x + 1/4, y)`; inverse of a positive lift | `x + y` increasing; constant; image verticals are graphs meeting each vertical once, `y ↦ x′(y)` injective continuous with `f_b⁻¹(x) < f_a⁻¹(x)`: decreasing | sound; `∨ F.symm` is the negative case |
| `nonwanderingSet` | identity; `x + 1` on `ℝ`; `(x, y²)` | everything; `∅`; the two boundary circles | sound |
| `IsRotationalInvariantCurve` | `δ = c`; small circle; two circles; `(x, h(y))` of §5.1 | degree `1`; null-homotopic; not an injective image; `h(0) = 0`, curve kept | sound |
| `isGraph_of_isRotationalInvariantCurve` | shear, `C = {y = c}`; rotation `1/4` with the `sin 8πt` curve; `(−x − y, y)`; boundary circle | `ψ = c`; `dx/dt = 1 − 0.8π < 0`, not a twist (excluded by `hF`); `F(x + 1) = F(x) − (1, 0)` (excluded by `IsTwistLift`); excluded by `hCo` | hypotheses of Herman1983 lines 1150–1154 present; `Ioo` in the conclusion follows since `U ⊇` the lower circle |
| `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` | circle; bound | graphs `δ = c`, constant `0`; `∂_δF₂/∂_δF₁ = 1/(2R)` | sound; `2 ≤ k` used for the `C¹` twist |
| `ConvexTable.IsPeriodicConfiguration` | equilateral; `(0, π/2, π)`; `s_j = jπ√2`, `p = q = 0`; `(0, 0, 0, ℓ)` | `1/2 = 1/2`; `0 ≠ 1/√2`; excluded by `0 < q`; excluded by strict gaps | sound |
| `ConvexTable.exists_two_periodic_orbits` | `(1, 2)` and `(2, 4)` on the ellipse; unit circle `(1, 3)` | `W = 8`, `4`; doubled axes, vertex sets `{(±2, 0)}`, `{(0, ±1)}`; offsets `0`, `π/3`: `π/3 = 2πm/3 + 2πn` impossible | true as typed |
| `IsWeaklyMixing` | two points, trivial action; half-torus, horizontal flow; one point | `1/4`; mean of `||1/2 − t| − 1/4|` is `1/8`; `0` | sound |
| `continuous_compMeasurePreserving_vadd` | `e₁` on `AddCircle 1`; identity; counting measure on `ℝ` | `2|sin πt| → 0`; `0`; `√2` (excluded by `IsProbabilityMeasure`); route: `‖U_t A_h f − A_h f‖ ≤ 2|t|‖f‖/h`, `A_h f → f` a.e. by Fubini and invariance, weakly by boundedness | true |
| `tendsto_average_norm_charFun_sq` | `δ₀`; `(δ₀ + δ₁)/2`; Lebesgue on `[0, 1]` | `1`; `(1 + cos t)/2 → 1/2 = 1/4 + 1/4`; `(2 − 2cos t)/t² → 0` | sound |
| `exists_tendsto_twistedAverage` | `e₁`, `a = 0, 1`; identity group; `v = 0` | `⟨e₁, U_t e₁⟩ = exp(2πit)`, atom at `2π`; `A_N⁰e₁ = 0`, `A_T¹e₁ = e₁`, `1 = δ_{2π}({2π})`; `(1 − exp(−2πiaT))/(2πiaT) → 0`; `0 = 0` | signs agree with `charFun` |
| `isWeaklyMixing_iff` | non-ergodic action; `a ≠ 0`; `f = 0`; unbounded measurable `f` | invariant indicator non-constant; `∫f = 0`, `|⟨f, U_t f⟩|² = ‖f‖⁴`; constant; `|f|` invariant, constant by ergodicity, so `f ∈ L²` | both directions sound |

**Adversarial pass: README targets** (values not already in the table above).

| Target | Instances tried | Values | Result |
|---|---|---|---|
| §2.2 derivatives | general; circle; circle–ellipse diameter | `∂Φ/∂s₁ = sin δ₁`, `∂Φ/∂δ = −L`, `∂Φ/∂s = sin δ − κL`; `2R`, `1`; `2·1 − 1 = 1`, `2·4 − 1 = 7` | sound |
| §2.4 | circle | `I F I(s, δ) = (s + ℓ − 2Rδ, δ) = τ_ℓ F⁻¹` | sound |
| §3.1–3.2, conventions | circle; signs | `∂²L = sin δ/(2R) = sin²δ/L`; `y = −cos δ = −∂₁(−L)`, `Y = ∂₂(−L)`; C3.1's `v = cos δ = ∂₁(−L)` | consistent with I5.0 line 435 |
| §4.2 | shear; standard map; `(x + y, y + c)` | `h = (X − x)²/2`, `−∂₁h = ∂₂h = 1` at `(1, 2)`; `S = −ε cos(2πx)/(2π) + Y²/2`; flux `c` | sound |
| §5.3 Lipschitz bound | image of a vertical at `p` | upper part right of `p` above `C`, lower part left below: difference quotients at most `∂_yF₂/∂_yF₁`; `F⁻¹` gives the lower bound | sound |
| §5.4 strict comparison | `α = √2/2`, `q = 7`, `p = 5`; two lifts with fixed points | `5 − 4.9497 = 0.0503 < 0.1`, `g₂⁷ = x + 5.6497`; both `0` | sound |
| §5.4 time reversal | general | `F₁(x, π − ψ) = g⁻¹(x) + ℓ`, so `1 − ρ` | sound |
| §5.6 | perturbed circle | height `c + ε cos(2(c + ε)) ≠ c + ε` | sound |
| §6.3–6.4 collapsed limits | `(0, 0, ℓ)`; general | `4ℓ/3`; `(q − p)pℓ/q + p(q − p)ℓ/q = 2p(q − p)ℓ/q` | sound |
| §7.1, §7.3 | square with hole; corners | `(n_i + 2)π` per hole, `8π`; `⌈π/α⌉ = 2, 2, 1` | sound |
| §9.1–9.3 | square; pentagon; `π/8` triangle; `N = 1` | `N = 2`; `N = 5`; `N = 8`; `conj d · σ(v) = conj(conj d · v) exp(2πij/N)`; `Re v` not invariant | sound |
| §10.3 | cone disc `k = 3`; torus chart | `πr⁶/3 = 3πρ²` = eight sectors; `0`, `π/16`, `π/4` | sound |
| §10.5 | route | `ψ_zψ_w = ψ_{z+w}` for `|z| + |w| < r`, then `n`-th roots; stabiliser discrete, spanning | sound |
| §11.1–11.3 | square, triangle, `π/8`, L, square with hole | vertex classes `1`; `1`; `4, 1, 1`; `χ = 0, 0, −2, −2, −8`; mirror chart `gσ_S(x − x₀) + gx₀` | sound |
| §11.4 | square `θ = exp(iπ/6)`, `1`; injectivity on a side | `K` trivial, mass `4`; `K = {1, conj}`, fixed set `Im z ≡ 0, 1`; `h′σ_S = kh` gives `[h′, x] = [kh, x]`; vertex `0`: two values | S01 |
| §12.6 | `χ + χ∘ρ`; square `θ = 1` | frequencies `λ*`, `rλ*`, eigenvalue `⟨λ*, θ⟩`; `exp(πiu)`, eigenvalue `1/2` | sound |

Note (not a finding): the route of §12.3 uses finiteness of `μ` only through Fubini and through weak convergence of a bounded almost-everywhere convergent family, both of which hold for σ-finite `μ`; the statement is kept for probability measures, which is what Layers 8–12 use, and the README says so.

## Not verifiable

- KatokHasselblatt1995 (Sections 9.2, 9.3, Chapter 13), Tabachnikov2005 (Chapters 3, 7), ChernovMarkarian2006 (Chapter 2), BoldrighiniKeaneMarchetti1978 (§2), ZemlyakovKatok1975, KerckhoffMasurSmillie1986 (Theorem 1): waived, no text. Whether twist maps are Section 9.2 or 9.3 of KatokHasselblatt1995, and which section of Chapter 13 has Birkhoff's graph theorem, could not be checked.
- MasurTabachnikov2002 (§1) and Birkhoff1927 (§§1–3): uncertified, cited by locator.
- Herman1983, printed page of the Remarque of 4.3 (lines 762–769 read; the page marker was not checked) and the extent of the proof of 2.2 (lines 188–196 read).
- Elaboration: I ran no Lean; the signatures are those of `scratch/signatures.md`.
- Board packages on other pull requests' heads were not read; ownership was checked against main and the open roadmap heads.

## Source issues

- **Misprint** in Hochman2012 at Lemma 6.1.6, items 2 and 3, printed p. 57: the source says the Cesàro averages of `|a_n − a|` and of `(a_n − a)²` equal `0`; it should be that they tend to `0`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1427b8031576532f4eadf6a35068c3aaf3f76400", "job": "RT-MathematicalBilliards~2b", "model": "fable", "worker": "chris-x8"} -->
