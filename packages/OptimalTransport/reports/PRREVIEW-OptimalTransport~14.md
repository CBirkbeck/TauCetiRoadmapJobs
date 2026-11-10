# Review of OptimalTransport (pull request #950 at ba8ed1e)

**Verdict:** accepted

This is a full review: the folder changed by 340 lines since `51115d5`. All five findings of the previous review are repaired, the five new statements in `Suggested.lean` are correct on their carriers, and I have no finding on this head. The folder is ready for a human's final approval.

## Previous findings (review of `51115d5`)

- **R01 (14.8 `MCP(K,N)` theorem statable): repaired.** `Suggested.lean:613` states `exists_isKantorovichOptimalTransportMap_of_measureContraction` with `[ProperSpace X]`, `M.support = univ`, `1 < N`. `README.md:5333` names it: "It is `exists_isKantorovichOptimalTransportMap_of_measureContraction`: on a proper space carrying a `TauCeti.MetricMeasureSpace` whose reference measure `m` has full support". The docstring entry is narrowed to "The Gigli–Rajala–Sturm form" (`Suggested.lean:110`), and the full-support negative control is a Check (`README.md:5366`).
- **R02 (11.8, 7.7, 6.4 statable and absent): repaired.** `Suggested.lean:474` (porous medium and fast diffusion), `:382` (Riemannian partial regularity), `:181` and `:198` (Dirichlet problem, strictly convex and convex domains). Each is named in its subsection (`README.md:4281`, `:3154`, `:2562`, `:2573`). The description's sentence is corrected: it now counts twenty theorems, seventeen proved headlines and six not statable, which is what the file has.
- **R03 (0.1 and 3.5 restate pinned theorems): repaired.** `README.md:1209`: "Tau Ceti declares or proves `TauCeti.IsCoupling.measure_univ_eq`, …"; `:1871`: "`TauCeti.wassersteinEDist_finset_sum_smul_rpow_le` and `TauCeti.wassersteinEDist_sum_smul_rpow_le` (the mixture bound), `TauCeti.wassersteinEDist_smul_add_smul_rpow_le` (convexity in one argument)". All twelve 0.1 names and the three mixture names exist at the pin (file and line below).
- **R04 (16.1 namespaces): repaired.** `README.md:5693`: "Keep the declarations in the `TauCeti` namespace … as Tau Ceti's implementation does." The four directories it names exist at the pin; "following upstream naming feedback" is gone.
- **R05 (Brownian docstring): repaired.** `Suggested.lean:105–109` now names `ProbabilityTheory.BrownianReal.projectiveFamily` and `TauCeti.Probability.IsFilteredPreBrownianReal` and concludes "neither library has a Brownian law on a path space".
- No repair report marks a finding as not actionable, so nothing is re-raised.

## Verified sound

**Gate, dependency check, build.**
- Worker's gate at `ba8ed1e`: every counter `0`, `build=0`, `OK`. My rerun of the gate on this head: every counter `0`, `OK`.
- The dependency check printed `depcheck: 235 roadmaps, 2270 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration, signatures, padding.**
- `lake env lean` on `Suggested.lean`: exit 0, exactly 20 `declaration uses sorry` warnings (`:135 … :633`), nothing else.
- The file has no `variable` block, so no declaration can lose a binder. I put `#check @name` for all 21 declarations in a scratch copy and compared the elaborated types (and `signatures.md`) with the README statements: they agree, and nothing changed.
- One-tactic probe on the scratch copy: each `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (intros; trivial) | (intros; exact ⟨_, rfl⟩) | sorry`. All 20 theorems still report `sorry`; none is padding. `IsStronglyCConvexSet` is the one definition, needed by 6.14.

**Headline theorems.** The 20 stated theorems, the 17 the docstring lists as proved at Tau Ceti `2fd255d9`, and the 6 it lists as not statable cover the "Named completion targets" of `README.md:5750–5774`. For the six not statable I checked the carrier at the pins: no Skorokhod topology and no Wiener or Brownian path-space law in either library (search of both trees); `TauCeti.IsCBBZeroSpace` (`TauCeti/Topology/MetricSpace/CBBZero.lean:76`) is the only curvature-bounded-below predicate; `MetricMeasure/` has no finite-`N` curvature-dimension condition.

**Duplication.** No pinned declaration proves a stated theorem. Tau Ceti has only the pieces: `Twist/StrictConvex.lean` (contact-set uniqueness, not Gangbo–McCann existence), `MongeAmpere/Comparison.lean:239` (Dirichlet uniqueness only), `GromovWasserstein/Point.lean:83` (one direction of 15.5). `library-matches.md` has no same-statement hit.

**Carriers opened at Tau Ceti `2fd255d9` for the new statements.**
- `mongeAmpereMeasure` (`TauCeti/Analysis/Convex/MongeAmpere/Basic.lean:231`): `μ(∂f(s ∩ interior {f ≠ ⊤}))` for a convex `f` that is never `⊥`, else `0`. `subdifferential` (`TauCeti/Analysis/Convex/Subdifferential.lean:89`) is empty where `f` is infinite. It does not require `f` lower semicontinuous. For `u` extended by `⊤` off an open convex `Ω` this is Hartenstine's normal-map measure on `Ω`.
- `MetricMeasureSpace` (`…/MetricMeasure/Basic.lean:35`): a reference measure finite on bounded sets on a complete separable metric space; no full support, no properness. `support` is at `:64`.
- `MeasureContraction` (`…/MetricMeasure/MeasureContraction.lean:104`): quantifies over `o ∈ M.support` only, and measurable `A` with `0 < m(A) < ∞`; Ohta's form.
- `EssentiallyNonbranching` (`…/MetricMeasure/Nonbranching.lean:60`): quantifies over laws absolutely continuous with respect to the reference.
- `internalEnergy` (`…/Wasserstein/InternalEnergy/Basic.lean:107`): `∫U(ρ)dm + U′(∞)·μˢ(univ)`, `⊤` when the positive part is infinite.
- `IsEVISolution` (`TauCeti/Analysis/GradientFlow/EVI/Basic.lean:96`): continuous on `[0,∞)`, energy neither `⊤` nor `⊥` at `t > 0`.
- 0.1: `Coupling.lean:298`, `:262`, `:267`, `:665`, `:509`, `:516`, `:503`, `:534`, `:472`, `:386`, `:391`, `:478`. 3.5: `Wasserstein/Mixture/Basic.lean:68`, `:78`, `:103` (hypotheses: measurable `edist`, `p ≠ 0`, `p ≠ ∞`, finite weights, as 3.5 now says).
- Sample: `Duality/Basic.lean:245` (weak duality), `Brenier.lean:565` and `:701`, `MongeAmpere/Transport.lean:273` and `:331`, `DisconnectedTarget.lean:89`, `Analysis/GradientFlow/Slope.lean:78`, `UpperGradient.lean:81`, `InternalEnergy/Basic.lean:203` and `:292`, `Wasserstein/BoltzmannEntropy.lean:184`, `Entropic/Duality.lean:504` and `:546`, `Entropic/SchroedingerSystem.lean:572` and `:600`, `MeasureContraction.lean:300`, `Nonbranching.lean:99`.
- Mathlib `1b1ccf4b`: `ProbabilityTheory.BrownianReal.projectiveFamily` (`Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean`).

**Cross-roadmap citations resolved on main (`ed7c546`).** RiemannianGeometry `## R1.` (`:186`) and `## R4.` (`:629`, cut locus at `:719`); DifferentialGeometry Layer 12; PDE §1.7 (A7) `:996`, §2.4 (B11) `:1241`, §6.3 (F26) `:2309`; OneParameterSemigroups Part A (`Completed/OneParameterSemigroups/README.md:90`); Hopf–Rinow under `Completed/`; GeometricMeasureTheory G2; consumer VonNeumannAlgebras `:60`, `:1293`. `citations.md` lists nothing unresolved.

**Ownership and overlaps.** `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no revision-only id. The closest open roadmaps (ManifoldOptimization, StochasticCalculus, MathematicalStatisticsFoundations, CompactQuantumMetricSpaces, PointProcesses) were compared at the previous round's heads for the Brownian reference and Wasserstein carriers; this head changes none of the objects involved, and the README names no later roadmap as a supplier.

**Seeded sample.** Every locator was read at the text and page.
- **2.1:** no literature locator; the three Tau Ceti names exist. Checks recomputed (table).
- **3.9:** `TauCeti.MetricMeasureSpace` is as described; support reduction is `supportSpace` (`Basic.lean:113`). Checks: Lebesgue on `ℝ` is finite on bounded sets; counting measure on `[0,1] ∩ ℚ` is infinite.
- **5.5:** the pinned theorem exists; Villani 2003 is paywalled (below).
- **6.7:** `depf-survey` §3.2 starts on p. 24 (line 1024); the inclusion `∂u(X) ⊆ closure Y` for convex `Y` is on p. 25 (line 1093); Steps 1–3 are on pp. 26–27 (lines 1111, 1133, 1179).
- **6.11:** `depf-survey` (2.26), p. 18 (lines 713–714); Wang's counterexample, p. 18 (line 740). The README's determinant is right and the printed one is not; see Source issues.
- **7.4:** `mccann-polar` Corollary 10, pp. 14–15 (line 534, proof ending at line 558); Theorem 11, p. 15 (lines 559–565): compact, `C³`, a Radon `μ ≪ vol`, `s_#μ ≪ vol`, factors unique `μ`-a.e. and Borel. As stated.
- **7.5:** no source claim; it consumes Layer 6.12 and RiemannianGeometry R4.6.
- **7.6:** `figalli-noncompact` Theorem 1.1, p. 3 (lines 112–128); Remark 1.2, p. 4 (line 133): the product integrability condition is equivalent to a finite first moment about one point.
- **8.9:** `ambrosio-gigli-guide` Theorem 2.29, p. 44 (line 2328); Proposition 2.30, p. 45 (line 2346); compact standing assumption, p. 40 (line 2141); Nash embedding in the sketch, p. 46 (line 2452).
- **10.1:** the two Tau Ceti names exist; Ambrosio–Gigli–Savaré §1.2 is uncertified.
- **11.2:** `ags-calculus` Definition 7.1, p. 55 (line 2966); (7.3), p. 55 (line 2986); (7.5)–(7.7), p. 56 (lines 2998–3011).
- **11.9:** `ambrosio-gigli-guide` Theorem 3.35, p. 74 (line 3827, `λ ≥ 0`); Fokker–Planck example and contraction, p. 76 (lines 3969–3973).
- **13.3:** `nutz-eot` Theorem 2.1 (line 641), separability footnote (line 651).
- **14.5:** `ags-rcd` Theorem 6.10, p. 50 (line 2530); 6.11, p. 51 (line 2584, both factors nonbranching); 6.18, pp. 56–57 (line 2873: closed convex, `m(∂Y) = 0`, `m(Y) > 0`); 6.20, p. 57 (line 2896). `gms-convergence` Theorem 5.7, p. 39 (line 1924); 7.2, p. 54 (line 2760); 7.7, p. 57 (line 2927).
- **16.1:** the directories `TauCeti/MeasureTheory/OptimalTransport/` (with `GromovWasserstein/` and `MetricMeasure/`), `TauCeti/Analysis/Convex/MongeAmpere/` and `TauCeti/Analysis/GradientFlow/` exist at the pin; the files open `namespace TauCeti`.

**Locators of the new statements.**
- `hartenstine-dirichlet` Theorem 1.1, p. 1 (lines 31–34: bounded convex domain, finite Borel measure, solvable uniquely exactly when `g` has a convex extension in `C(cl Ω)`); Theorem 2.1 is announced on p. 1 (line 26) and its normal-map definition is on p. 2 (lines 59–73).
- `depf-partial` Theorem 1.4 on printed p. 82 (lines 73–78); its proof on pp. 89–90 (lines 354–366).
- `cavalletti-mondino-optimal-maps` Theorem 1.1, p. 2 (lines 78–87); standing assumptions, §2, p. 2 (lines 101–102); `supp m = X`, p. 4 (line 235); Ohta's definition and its equivalence, Appendix, p. 17 (lines 1019–1059); the branching `MCP(0,3)` space, p. 2 (lines 70–72).
- `ambrosio-gigli-guide` Definition 3.32 and (3.44), p. 71 (lines 3701–3712); (3.45) and Proposition 3.33, p. 72; (3.47), p. 73; Proposition 3.38, p. 75 (line 3934).

**Adversarial table.**

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 6.4 strictly convex | `Ω = (0,1)`, `ν = δ_{1/2}`, `g = 0` | `u = (\|x−½\|−½)/2`, `∂u(½) = [−½,½]`, length `1`; `\|x−½\|−½` has mass `2` | holds; Check right |
| 6.4 | `Ω = ∅`, `n ≥ 1` | `ν = 0` forced; `f ≡ ⊤`, subdifferential empty, `MA = 0` | holds |
| 6.4 | `n = 0`, `Ω` the point | `MA_u = volume{0} = 1` for every `u`; `ν = 0` unsolvable | `0 < n` needed, present |
| 6.4 | disc minus centre | closure strictly convex, `Ω` not convex, no `ConvexOn` function | `Convex ℝ Ω` needed, present |
| 6.4 | `n = 1`, `closure Ω = [a,b]` | open segment of two points lies in `(a,b)` | `StrictConvex` holds; any two boundary values allowed |
| 6.4 convex | square, `g(x,0) = x(1−x)` | edge restriction of a convex function is convex; `x(1−x)` concave | hypothesis `ConvexOn ℝ Ω g` excludes it |
| 6.4 extension | `u` extended by `⊤` | real epigraph convex, `interior{f ≠ ⊤} = Ω`, off-`Ω` inequalities trivial | Lean measure = source measure |
| 7.7 | `ℝⁿ`, `N(0,I) → N(0,4I)` | `T = 2x`, cost `n/2`; `−2x` costs `9n/2`; `Σ = ∅` | holds |
| 7.7 | circle, `f = g = 1/2π` | identity, cost `0`; rotation by `θ` costs `θ²/2` | holds |
| 7.7 | `β = 0`; `dim M = 0` | bounded image on compact `K`; one point, `h = id` | holds |
| 7.7 | local vs compact Hölder | local constant for `d < δ`, `diam·δ^{−β}` for `d ≥ δ` | `C^{0,β}_loc` gives Hölder on compacts |
| 11.8 | `n = 0` | `1 − 1/0 = 1`, range empty; `m > 1`: `ρ ≡ 1`, `Δζ = 0`, `∫∂ₜζ dt = 0` | holds |
| 11.8 | `n = 1, 2, 3` | lower bounds `max(0,⅓) = ⅓`, `max(½,½) = ½`, `max(⅔,⅗) = ⅔` | README ranges agree with Lean |
| 11.8 | Barenblatt, `n = 1`, `m = 2` | `∂ₜρ = t^{−4/3}(ξ²/12 − C/3) = (ρ²)″`; for `r²/2` the profile needs `ξ²/6` (`2k = ⅓`) | normalisation `U₂ = r²` pinned |
| 11.8 | `L_U = rU′ − U` | `U_m`: `r^m`; so `∂ₜρ = Δ(ρ^m)` for `m > 1` and `m < 1` | equation right |
| 11.8 | recession | `U_m′(∞) = ∞` (`m > 1`), `0` (`m < 1`); AG's `(z^α − z)/(α−1)` has `1/(1−α)` and differs by the constant `1/(1−α)` on probabilities | same flow |
| 11.8 | singular part, `m < 1` | mollifying mass `a` at scale `r`: gain `≥ c a^m r^{n(1−m)}`, cost `≤ a^{1/2} r`, ratio `→ ∞` iff `m > 1 − 1/n` | density statement meaningful at `t > 0` |
| 14.8 | `ℝ`, `U[0,1] → U[0,2]` | `2x` costs `⅓`; `2 − 2x` costs `∫(2−3x)² = 1` | holds |
| 14.8 | `[0,1] ∪ {p,q}` | `MCP`: density `1/((1−t)m(A))` times `(1−t)^N ≤ 1/m(A)` for `N ≥ 1`, `o` only in the segment; every coupling costs `1/12 + 1 = 13/12` | full support needed, present |
| 14.8 | uniqueness | a second optimal coupling lifts to a second optimal dynamical plan | coupling uniqueness follows from Theorem 1.1 |
| 2.1 | `δ₀`, `(δ₀+δ₁)/2`, `\|x−y\|` | value `0 + ½ = ½` = cost of the only coupling; `φ(1) = −1` completes the pair | Check right |
| 2.1 | `δ₀`, `δ₂`, `(x−y)²` | `φ = −4x − Kx²`, `ψ(2) = inf (1+K)x² + 4 = 4`; reversed constraint gives `20 > 4` | direction pinned |
| 3.9 | `ℚ`, counting | `[0,1] ∩ ℚ` infinite | excluded |
| 6.7 | disc to two half-discs | `u = ‖x‖²/2 + \|x₁\|`, `∂u(0,x₂) = [−1,1]×{x₂}`, mass `2·2 = 4` on a null segment | upper bound needs convex `Y` |
| 6.11 | `n = 3` | `a = 4/3`, `det = (32/27)(1+x₁²)(1−7x₁²)`: `640/2187` at `⅓`, `−10/9` at `½` | slab `ρ² < 1/7`; source's ball too large |
| 6.11 | general `n` | power of `r`: `(n−2)(a−2)+2a−2 = 0` iff `a = 2−2/n`; block det `2a r^{2a−2}((a−1)−(a+1)x₁²)`; `n = 2`: `−4x₁²` | formula right |
| 7.4 | circle, `δ₀`, `−∇φ = π/2` | `δ_{tπ/2}`; `t = 0, 1` give the endpoints | holds |
| 7.6 | `∫∫ d dμ dν < ∞` | Fubini gives one `y` with `∫ d(x,y) dμ < ∞`; triangle inequality for the converse | equivalence right |
| 8.9 | circle, `δ₀ → δ_{3π/2}` | long way `(3π/2)²`, short way `(π/2)²`; uniform law with `v ≡ c∂_θ`: `\|μ̇\| = 0 < \|c\|` | (B) is an inequality |
| 10.1 | `‖x‖²/2`, `\|x\|`, `−\|x\|` | slopes `‖x‖`; `0` at `0`; `1` at `0`; `g ≡ 0` fails by `½ > 0` | Checks right |
| 11.2 | `μ = 2m_a` | both sides `2 log 2 − 1`; `U[0,2]`: `−log 2`; `klDiv(U[0,1], Leb[0,2]) = 0 + 2 − 1` | identities right |
| 11.2 | `1/(x log²x)` on `[e,∞)` | mass `1`, entropy `−∞`, second moment `∞` | moment hypothesis needed |
| 11.9 | `V = x²/2`; `V = 0`; `(x²−1)²` | distance `\|a−b\|e^{−t}`; `\|√(s²+2t) − √(r²+2t)\| ≤ \|s−r\|`; `V″ ≥ −4` | Checks right |
| 13.3 | two-point diagonal reference | `φ_i + ψ_i` fixed separately, one constant per component | support-component statement right |
| 14.5 | Theorem 6.11 | both factors nonbranching in the source | hypothesis kept |
| 2.5, 5.8, 6.8, 6.14, 6.15, 7.3, 11.7, 12.7, 12.8, 13.4, 14.7, 15.5 | unchanged since `51115d5` | instances of the previous review's table (BLS Example 1.1 `P = 1`, `P^rel = 0 = D`; `T = 2x`; JKO steps `a(1+τ)^{−k}`; `S = 9/4`; one-point `RCD`; `ℚ` incomplete) | statements identical to the reviewed ones (diff of the folder) |

## Not verifiable

- **Villani 2003 and 2009**, **Ambrosio–Gigli–Savaré 2008** (§1.2 for 10.1; Theorems 4.0.4 and 11.2.8 for 11.7), **Kechris**, **Huang**, **Dembo–Zeitouni**: recorded `uncertified` (paywalled); cited by locator only. Villani 2003, Theorem 2.12 (5.5) is among them.
- **Gutiérrez, *The Monge–Ampère Equation*, Theorem 1.6.2** (6.4): paywalled; read only through Hartenstine's quotation of it as Theorem 2.1.
- **Feldman–McCann 2002** (7.6, the compact-support theorem): not in the manifest and not read; the stated Lean theorem rests on Figalli's Theorem 1.1, which was read.
- **Agueh–Carlier 2011**, **Jordan–Kinderlehrer–Otto 1998**, **Gangbo–McCann 1996**, **Caffarelli 1992**: publisher-paywalled; carried from the earlier reviews.
- The absence of a singular part at positive times for the fast-diffusion flow (11.8) is argued in the README by a slope estimate, which I checked for a mollified singular part with no absolutely continuous part underneath; the general case rests on the smoothing theory of the fast-diffusion equation, which I did not read.

## Source issues

- **Error** in depf-survey at display (2.26) and the sentence after it, p. 18: the source gives the right-hand side with the factor `1 − x₁²` and says it is positive in the ball of radius `1/2`; it should be the factor `(n−2) − (3n−2)x₁²` up to a positive constant, positive only for `x₁² < (n−2)/(3n−2)` (`1/7` when `n = 3`); affects a stated result.
