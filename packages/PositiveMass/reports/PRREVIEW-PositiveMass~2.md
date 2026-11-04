# Review of PositiveMass (pull request #956 at ef9ad8b)

**Verdict:** needs changes

🤖 Independent AI re-review of the repaired head. Five findings: two P2, three P3. The push gate, the dependency check and an independent Lean elaboration pass. No pull-request file was changed.

## Previous findings (review at 68063cc), finding by finding

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 (P1) empty end family | `README.md:213`, “a finite nonempty family of such ends with pairwise disjoint images whose union has compact complement”; the torus Check at `README.md:239`; `Suggested.lean:106` `numEnds_pos : 0 < numEnds`; 1.1, 6.1 and 8.4 carry “nonempty ends”. | Repaired. |
| R02 (P1) two-way supply with Yamabe | Yamabe appears only at `README.md:34` (scope, as a consumer) and `README.md:1096` (downstream consumers). The closed-manifold inputs are now 0.4 and 3.0, derived from RiemannianGeometry R1 and the UO-D06/V5.1/K5a realization; the Euclidean Sobolev inequality is Mathlib's `eLpNorm_le_eLpNorm_fderiv_of_eq`. Depcheck prints no CYCLE. | Repaired (the notion moved down; see Verified sound). |
| R03 (P2) P7 supports | `README.md:973`–`976`: f=0 on X₀∖K, f=1 near ∂X₀, supp ξ₀ ⊂ X₀∖K; `README.md:1006`, “Since ξ₀ and ψ_λ have disjoint supports, `B_(ψ_λ) ξ₀ = 𝓓ξ₀`”; the residual Check at `README.md:996`. | Repaired. |
| R04 (P2) volume-equality duplication | `README.md:599`–`603`: the AE lower limit is proved here, R4.1 supplies monotonicity, small-ball limit and the equality API. | Repaired. |
| R05 (P3) locators | Every target now carries a theorem or section locator; the four unreadable works are marked uncertified at `README.md:1106`–`1131`. No `sources.toml`, but no roadmap on main has one (0 of 125). | Repaired. |
| R06 (P3) shape | Summary, scope, conventions, supplier contracts, build order, layers with `**Checks.**`, `*Needs:*`, Examples and Dependencies, consumers, references. | Repaired. |
| R07 (P3) normalization examples in Lean | `Suggested.lean` now has four definitions and the two P8.1 theorems only. | Repaired. |
| R08 (P3) Lean form | `Suggested.lean:38` `namespace TauCetiRoadmap.PositiveMass`; module docstring lists the non-statable headlines and the missing carriers. | Repaired, except the stale section labels in R04 below. |

## R01 (P2) — State integrable scalar curvature on the end in 7.1 and 8.3

**Location:** `TauCetiRoadmap/PositiveMass/README.md:1063`, “with Scal≥0 and one specified AE end satisfying 0.1 has nonnegative mass at that end”; also `README.md:970`–`971`.

**Claim:** A complete connected spin manifold with Scal≥0 and one AE end of order t>(n−2)/2 in the sense of 0.1 has a nonnegative ADM mass at that end.

**Witness:** `cecchini-zeidler` line 214 (Definition 2.1, p. 6) makes `scal ∈ L¹(E)` part of the definition of an AE end; 0.1 here does not, and 0.2's first bullet makes the limit depend on it.

Instance: n=3, M=ℝ³, g=u⁴δ with `u = 1 + (1+r²)^(−3/8)`. Then g−δ is `O_2(r^(−3/4))`, so the end has order 3/4>1/2; `Δ_Eucl u = (3/4)(1+r²)^(−19/8)(−r²/4 − 3) < 0`, so `Scal = −8u^(−5)Δu > 0` everywhere; u≥1 gives completeness; ℝ³ is spin. The scalar curvature is `≈ (3/2) r^(−11/4)`, not integrable. The normalized flux of 0.2 at radius r is `2·(3/4)·u³·r(1+r²)^(−11/8)·r² /r² · … = (3/2) u³ r^(1/4)(1+o(1))`: 15 at r=10⁴, 150 at r=10⁸, divergent. The limit does not exist in ℝ, so 8.3 as written asserts the sign of an undefined number. Cecchini–Zeidler Theorem B (`cecchini-zeidler` line 113) is not refuted: its AE end carries integrable scalar curvature by definition.

**Repair:** In 7.1 and 8.3 add “with integrable scalar curvature on E” (or put `scal ∈ L¹(E)` into the 0.1 definition and say so in 0.2, 8.1 and the Lean docstring, which keeps it separate as `hint`). Add the instance above as a negative-control Check of 8.3. Retest: the instance is excluded; spatial Schwarzschild (scalar-flat) still satisfies every hypothesis and has mass m.

## R02 (P2) — GeometricTopology Layer 1 does not supply the triangulation cited

**Location:** `TauCetiRoadmap/PositiveMass/README.md:183`, “GeometricTopology Layer 1: smooth triangulation of compact surfaces with boundary and the smooth/PL comparison”; also `README.md:56` and `README.md:684`.

**Claim:** The triangulation input of the boundary Gauss–Bonnet theorem in 3.1 is supplied by GeometricTopology Layer 1.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:264`–`274` on main (inside Layer 1): the smooth/PL relation is “deferred to its own far-horizon section”, and the comparison “is deliberately *not* part of the early layer-1 work”. Smooth triangulation (Whitehead) is item 1 of the unnumbered section at `GeometricTopology/README.md:930`–`941`. Layer 1 states the PL pregroupoid, gluing and connected sums only.

**Repair:** Cite the section that states it: “GeometricTopology, the smoothing-and-triangulation comparison, item 1 (smooth implies PL: every smooth manifold, with or without boundary, has a smooth triangulation)”, in the scope list, the supplier contract and 3.1's `*Needs:*`; or, since only compact surfaces with boundary are needed, state Radó's triangulation theorem as a target of 3.1 with its own locator and drop the GeometricTopology citation. Retest: `roadmaps grep` for “smooth triangulation” finds the statement only in that far-horizon section.

## R03 (P3) — The flat-space admissible truncation in 7.1's Check is not admissible

**Location:** `TauCetiRoadmap/PositiveMass/README.md:994`, “On flat ℝⁿ, X_λ can be a coordinate ball of radius larger than `R + 1/λ`”.

**Claim:** A coordinate ball is an admissible X_λ for the exterior X₀.

**Witness:** `README.md:976`–`977` requires X_λ ⊃ X₀ with X₀ = {|x| ≥ R} the complement of a ball; no ball contains an exterior region.

**Repair:** Replace by “X_λ = ℝⁿ (empty boundary, every λ>0 admissible), or, for λ > 1/R, the exterior `{|x| ≥ R − 1/λ − ε}` whose boundary sphere has distance `1/λ + ε > 1/λ` from ∂X₀”. Retest: both contain X₀, have relatively compact X_λ∖X₀ and satisfy the distance condition.

## R04 (P3) — Stale section labels in the Lean docstring

**Location:** `TauCetiRoadmap/PositiveMass/Suggested.lean:25`, “P3a's torus obstruction”; `Suggested.lean:28`, “P1's weighted Fredholm theorems, P1c's round spinor spectrum and P6's Callias solvability”.

**Claim:** The docstring names the README sections of the non-statable headlines.

**Witness:** `README.md:189`, “Layer k is cited as Pk and its subsection k.n as Pk.n”; there is no section P3a or P1c. GeometricCurrents on main (`GeometricCurrents/README.md:948`–`953`) still uses P3a–P3c, so the lettered labels now point nowhere.

**Repair:** Write P3.1, P1.3 and P6.1; keep P8.2 and P8.3 as they are.

## R05 (P3) — Lemma 3.4 is cited for a hypothesis it does not state

**Location:** `TauCetiRoadmap/PositiveMass/README.md:921`, “surjectivity when `θ_ψ ≥ 0` and `η_ψ ≥ 0` (Cecchini–Zeidler, Lemma 3.4, p. 14–15)”.

**Claim:** Lemma 3.4 gives the isomorphism under the unbarred potentials.

**Witness:** `cecchini-zeidler` line 642–644: Lemma 3.4 assumes `θ̄_ψ ≥ 0` and `η̄_ψ ≥ 0` (the barred potentials of (2.8)); its proof text at line 647 drops the bars, a misprint listed below. The unbarred version is true by the same argument with (2.9): `0 ≥ ‖∇u‖²` forces ∇u=0, decay forces u=0 near infinity, connectedness forces u=0.

**Repair:** Cite “by the argument of Lemma 3.4 applied to (2.9)” and keep the unbarred statement, or state the lemma with θ̄, η̄ and derive the unbarred form; note that under Scal≥0 the unbarred hypothesis is the stronger one, since `θ_ψ ≤ θ̄_ψ`.

## Verified sound

**Scope and mechanical checks.** Head `ef9ad8bed9dfeaa6b870538c736be2be1e5ed050`; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty. The worker's gate reports every check zero and `OK`. No computational algorithm, sorry'd data, `set_option`, `lemma`, admitted example, LaTeX delimiter, process word or copied passage was found. Main was read at `c99407021ca54e77e61223896e876565b8c18aa4`.

The dependency check returned exactly:

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. VariationalMethods (#1028) and UnboundedOperators (#1027) are new-roadmap pull requests by the pull request's own author and are cited by section, never by number.

**Lean.** `lake env lean TauCetiRoadmap/PositiveMass/Suggested.lean` exits 0 with exactly the two `sorry` warnings (lines 122 and 148). A scratch copy with `#check @name` for all seven declarations elaborates; every binder of the README's 8.1 statement is present in both theorems: `3 ≤ n`, `n ≤ 7`, `(n−2)/2 < t`, `FiniteEndedAE n M t`, `0 ≤ scalarCurvature`, `Integrable scalarCurvature riemannianVolume`, `CompleteSpace`, `ConnectedSpace`, `SecondCountableTopology`, `IsRiemannianManifold`; nothing changed against the README. One-tactic probes on scratch copies: `simp` “made no progress” on both theorems, `infer_instance` fails on both, `exact?` “could not close the goal” on both. Neither theorem is padding. The three `TauCeti.*` imports exist at the pin with object files present.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, paths relative to each library):

| Object | File and line | What it gives and does not give |
| --- | --- | --- |
| `Measure.euclideanHausdorffMeasure (d : ℕ)` | `Mathlib/Geometry/Euclidean/Volume/Measure.lean` (definition; `euclideanHausdorffMeasure_eq_volume` at 187) | Scaled Hausdorff measure with a natural-number dimension; `n − 1` is natural subtraction, harmless for n≥3. |
| `IsRiemannianManifold` | `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:79` | Distance equals Riemannian distance; no completeness, connectedness or second countability. |
| `RiemannianBundle`, `IsContinuousRiemannianBundle` | `Mathlib/Topology/VectorBundle/Riemannian.lean:420`, `:60` | Fibre inner products; the `inner ℝ` used by `pullbackMetricCoeff`. |
| `IsContMDiffRiemannianBundle` | `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:67` | Smoothness of the metric (both ∞ and 1 are assumed in the theorems; redundant, not wrong). |
| `IsLeviCivitaConnection`, `leviCivitaConnection` | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:201`, `:359` | The connection whose scalar curvature is used. |
| `eLpNorm_le_eLpNorm_fderiv_of_eq` | `Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:601` | GNS inequality for `ContDiff ℝ 1` compactly supported `u`, `1 ≤ p`, `1/p' = 1/p − 1/n`; non-sharp constant, as the README says. |
| `CovariantDerivative.scalarCurvature` | `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Scalar.lean:53` | Trace of Ricci; `scalarCurvature_eq_of_ricciTensor_eq_smul_inner` at 92 gives the constant-curvature value. |
| `instContMDiffCovariantDerivativeLeviCivitaConnection` | `.../LeviCivita/Regularity.lean:292` | Smoothness of the Levi-Civita connection under `IsManifold I ∞ M`. |
| `TauCeti.riemannianVolume`, `eq_riemannianVolume_iff` | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76`, `:87` | The chart-glued volume and its characterization. |
| `TauCeti.W1p0.sobolevEmbeddingL` | `TauCeti/Analysis/Sobolev/Embedding.lean:385` | `W^(1,p)_0(Ω) →L L^(p⋆)(Ω)` at the Sobolev conjugate, `pstar ≠ ∞`. |

Searches of both libraries for spin structures, Dirac operators, a mapping degree between closed manifolds, weighted Sobolev spaces and ADM mass found none (the `Dirac` hits are Dirac measures), so the docstring's inventory of non-statable headlines is correct.

**Cross-roadmap citations resolved** (all on main unless noted):

| Citation | Where found | Boundary |
| --- | --- | --- |
| RiemannianGeometry R1 conformal law | `RiemannianGeometry/README.md:229`–`234` | `Scal̃ = e^(−2u)(Scal + 2(n−1)Δ⁺u − (n−1)(n−2)|du|²)`, same signs as `README.md:129`. |
| R4.1 monotonicity, small-ball limit, equality API | `RiemannianGeometry/README.md:635`–`639` | Line 639 names PositiveMass P2.3 as the consumer and says the AE large-ball limit is PositiveMass's. |
| R4.3 covering criterion, R4.6 cut locus | `RiemannianGeometry/README.md:661`–`720`, items 3 and 6 | As cited. |
| R5a Gauss equation, R5b stability | `RiemannianGeometry/README.md:1145`–`1221`; the inequality at item line 69 | `∫(2|∇φ|²+Scal_P φ²) ≥ ∫(Scal_N+|A|²)φ²` with `A(X,Y)=⟨B(X,Y),ν⟩`, matching `README.md:135` and `:861`. |
| R7.8 Lipschitz approximation | `RiemannianGeometry/README.md:1303`, item 8 | Bounded Lipschitz functions, smooth approximation with gradient bound; no completeness assumed. |
| R8.1–R8.2 spherical harmonics | `RiemannianGeometry/README.md:1406`–`1422` | Eigenvalue `d(d+m−1)`, multiplicity `binomial(m+d,d) − binomial(m+d−2,d−2)`, completeness through K5a; identical to `README.md:417`–`419` with m=n−1. |
| DifferentialGeometry 2, 10, 12.2–12.5 | `DifferentialGeometry/README.md:341`, `:877` (10.2 Sard), `:910`–`935` | Orientation cover, Sard, gradient, divergence, Laplace–Beltrami `div ∘ grad`, density, divergence theorem and Green. |
| PDE Lanes A, C–E | `PDE/README.md:223`, `:285`–`340` | Lane C item 13 strong maximum principle, item 14 Harnack. |
| VariationalMethods V2.3, V5.1 (#1028 head) | `VariationalMethods/README.md:236`–`262`, `:435`–`460` | Complex coercive adapter and H-forcing; `CompactFormPair.operator` as the UO-D06 operator; order V2.3 → UO-D06 → V5.1 at line 51. |
| UnboundedOperators UO-D06 (#1027 head) | its `README.md:173`–`196` | Closed-form operator over `RCLike 𝕜`, `j(u) ∈ dom A` iff `∃h, q(u,v) = ⟨h, j v⟩`, as at `README.md:156`–`158`. |
| ComplexKahlerGeometry K5a | `ComplexKahlerGeometry/README.md:570`, `:1034`–`1060` | Compact boundaryless H² realization through V5.1/UO-D06; no weighted noncompact inverse, as the README says. |
| SpinGeometry G3–G6, G6.5 | `SpinGeometry/README.md:90` (Clifford sign), `:543`–`547` (chosen factor, half rank), `:636` (Lichnerowicz), `:701`–`726` (Dirac, H¹ domain), `:775`–`781` (sphere kernel vanishing) | Matches the Conventions and 1.3; the doubled odd module is the source's “complex spinor module” and is not used here. |
| GeometricCurrents G1–G7 | `GeometricCurrents/README.md:583`, `:668`, `:845` (regularity, 2≤n≤7), `:876`–`890` (sheet convergence), `:948`–`953` | Lines 948–953 assign the torus obstruction, capping and AE Plateau work to PositiveMass, under the old labels P3a–P3c. |
| AlgebraicTopology Stages 2–3, 6–7 | `AlgebraicTopology/README.md:326`, `:471`, `:946` (cup/cap at item 2, Poincaré–Lefschetz at item 4), `:1573`–`1601` | Euler–Poincaré over a field for finite CW type; `χ = 2 − b₁` for a closed oriented surface then needs Stage 6 duality for `b₂ = b₀ = 1`, which is cited. |
| GeometricTopology Layer 1 | `GeometricTopology/README.md:177`–`289` | Does not state triangulation: R02. |
| Yamabe Y6–Y8 (consumer) | `Yamabe/README.md:48`, `:235`–`300` | Consumes P8.1 and P8.3 and the P3 double-cover corollary; `Yamabe/README.md:52` still says PositiveMass consumes Y0 and Y2.1, which is no longer true at this head. |

**The Yamabe move, recorded.** Yamabe on main plans the positive first eigenfunction (`Yamabe/README.md:131`–`135`, Y1.2) and the sign-fixed conformal metric `λ₁φ^(−4/(n−2))` (`Yamabe/README.md:181`–`183`, Y3.1), and consumes P8. PositiveMass cannot cite a consumer, so these two facts and the `φ^(4/(n−2))` scalar law are now targets 0.4 and 3.0 here, with the same formula `λ₁ φ^(−4/(k−2))` as Yamabe's. This is the sanctioned move of a notion down to the earlier roadmap; Yamabe's own text should later import 0.4 and 3.0 instead of Y0/Y1.2/Y3.1 for these three facts, which is Yamabe's edit, not this pull request's.

**Ownership.** `roadmaps grep` over main and the 432 open heads for “ADM mass|positive mass theorem”, “Callias”, “monogenic|Fischer decomposition”, “weighted Sobolev”, “first eigenfunction” and “Gauss–Bonnet”: the mass, the Callias argument, the round monogenic spectrum and the weighted AE analysis have no other owner. “Gauss–Bonnet” hits on main are the closed-surface index identity (IndexTheory I7.1, as used by `PositiveScalarCurvature/README.md:412`), the moving-disc formula of RiemannianGeometry R4.9, étale Gauss–Bonnet, and hyperbolic surfaces in ComplexCurveModuli; none states the compact-surface-with-corners boundary theorem of 3.1. `PositiveScalarCurvature` on main is the surgery/bordism programme and does not own the torus obstruction. SurfaceTopology (#271) builds surfaces from combinatorial maps and does not triangulate a given smooth surface. The board's package index lists no PositiveMass sibling. No fully qualified name of `Suggested.lean` appears in another roadmap.

**Source sample.** Each of the fifteen seeded targets was read at its locator; page numbers are printed pages of the version named in References.

| Target | Source at locator | Result |
| --- | --- | --- |
| 0.1 AE ends | `cecchini-zeidler` line 210–219 (Def. 2.1, pp. 5–6); line 252–255 (Def. 2.3, p. 6) | C² decay of order τ>(n−2)/2 and nonempty finitely many ends agree; the source's `scal ∈ L¹(E)` clause is missing from 0.1 and from 7.1/8.3 (R01). |
| 0.4 normalizations | `lee-parker` line 69–75 ((1.1), p. 38); `cecchini-zeidler` line 239–251 (Example 2.2, p. 6); `schoen-yau-2017` line 128–132 (p. 4) | `a = 4(n−1)/(n−2)`, `S̃ = φ^(1−p)(aΔφ + Sφ)`; Schwarzschild mass m; Schoen–Yau divides by `4(n−1)ω_(n−1)`, half of ours. |
| 1.1 spaces | `cecchini-zeidler` line 262–282 ((2.3)–(2.4), p. 7), 463–466 (Prop. 2.7, p. 10), 477 (Prop. 2.8); `lee-parker` line 1575–1581 (Lemma 9.1), 1588–1606 (Thm 9.2, p. 76) | Weights `ρ^(−δp−n)`, derivative shift δ−i, Poincaré for δ<0, compact `H¹_δ ⊂ L²_(δ′)`, 9.2(a) is Bartnik's Prop. 1.6, 9.2(b) isomorphism iff 2−n<β<0 for q>1. |
| 1.2 harmonics | `RiemannianGeometry/README.md:1406`–`1422` | Eigenvalue and multiplicity as cited. |
| 1.3 spectrum | `camporesi-higuchi` line 409–446 ((3.44), p. 11), 447–460 (odd case) | `D_N(n) = 2^(N/2)(N+n−1)!/(n!(N−1)!)` for even N, eigenvalues `±(n+N/2)`; odd N uses rank `2^((N−1)/2)`; with N=m this is `2^floor(m/2)·binomial(k+m−1,k)`. |
| 2.1 harmonically flat | `lee-parker` line 1850–1864 (Lemma 10.6, p. 82); `schoen-yau-2017` line 1899–1904 (proof of Prop. 5.4, p. 41) | Flattening by cutoff then linear conformal correction; harmonic `u = 1 + m r^(2−n) + O(r^(1−n))` outside a compact set. |
| 2.2 zero-mass deformation | `lee-parker` line 1456 ((8.11), p. 73), 1917–1946 (Lemma 10.7, pp. 84–85) | Compactly supported h, conformal correction, variation `−∫h^(jk)R_(jk)`, hence Ric=0; the source then uses Prop. 10.2, the README uses 2.3. |
| 3.0 first eigenfunction | `lee-parker` line 421–423 (Thm 2.6, p. 46), 643–647 (Thm 4.1, p. 52) | Strong maximum principle and the positivity/regularity theorem; the eigenfunction claim is the standard specialization. |
| 3.1 torus obstruction, boundary Gauss–Bonnet | `schoen-yau-2017` line 1847–1868 (Thms 5.1–5.2, p. 40) | Degree-one map to Tⁿ and the cup-product obstruction; the ≤7 smooth route is this roadmap's. do Carmo §4-5 unreadable (below); values checked in the table. |
| 5.1 doubled bundle | `cecchini-zeidler` line 290–319 (§2.3, (2.5)–(2.6), pp. 7–8) | Same `c`, σ, 𝓓, `B_ψ`, `B_ψ² = ∇*∇ + scal/4 + c(dψ)σ + ψ²`, `χ = c(ν♭)σ` with inward ν and the +1 eigenbundle. |
| 5.2 integrated estimates | `cecchini-zeidler` line 356–384 ((2.7)–(2.10), Prop. 2.5, p. 9) | θ, η, θ̄, η̄ and both inequalities with constants `(n−1)ω/2` and `nω/2`; Penrose operator `∇_ξ u + c(ξ)Du/n`. |
| 6.1 Fredholm | `cecchini-zeidler` line 556–561 (Thm 2.12, p. 12), 679–691 (Thm 4.1, pp. 15–16), 642–644 (Lemma 3.4) | Nonnegative index on `H¹_(−q)(X,S;χ) → L²`; small negative part with `c₀ = 1/(2C)`; Lemma 3.4 is barred (R05). |
| 6.2 positivity | `cecchini-zeidler` line 662–673 (proof of Thm 3.1, p. 15) | ξ₀ nonzero at infinity on one end, zero on the others; `u = ξ − ξ₀`; (2.10) gives the sign. |
| 7.2 solving and rigidity | `cecchini-zeidler` line 764–789 ((4.4)–(4.7), pp. 17–18), 800–821 (proof of Thm B, p. 18) | Disjoint supports, `u_λ = ξ_λ` on `(X_λ∖X₀) ∪ K`, the (4.7) bound, λ↘0, Cauchy in `H¹_(−q)(X)`, parallel frame. |
| 8.3 arbitrary ends | `cecchini-zeidler` line 113–116 (Thm B, p. 3) | Complete connected spin, scal≥0, one AE end: mass ≥0, zero mass gives ℝⁿ; the end is AE in the sense of Def. 2.1 (R01). |

Also read: `cecchini-zeidler` line 346–351 (Def. 2.4), 613–627 (Lemma 3.3), 725–760 (proof of Thm A, (4.3)); `lee-parker` line 1449–1456 (Def. 8.2), 1650–1659 (Lemma 9.4), 1675–1700 (Thms 9.5–9.6), 1757–1761 (Thm 10.1), 1797–1809 (Thm 10.3 and the double-cover remark); `lohkamp-1999` line 480–483 (Prop. 6.1, p. 396); `witten-1981` line 264 (§III begins on p. 387).

**Adversarial table.** `Δ⁺ = −div grad`; `|S^(n−1)| = ω_(n−1)`; tails are integrals from radius 1.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 end definition | identity chart of ℝⁿ; `x ↦ 2x` | differences 0; `g−δ = 3δ`, no decay | first accepted, second rejected, as the Checks say |
| 0.1 distance comparison | g=δ+O(r^(−t)), radial ray | length `r + O(r^(1−t))` for t<1, `O(log r)` at t=1 | error unbounded for t<1, as stated |
| 0.1 flat torus, empty family | T³, unit parallel spinor | weighted norm 1, gradient 0 | excluded only by nonemptiness |
| 0.1 two-ended Schwarzschild | `(1+m/(2r^(n−2)))^(4/(n−2))δ`, m>0 | inversion fixes `r₀=(m/2)^(1/(n−2))`; two ends of order n−2 | finite-ended with two ends |
| 0.2 conformal flux | `g = w δ`, `w=(1+c r^(2−n))^(4/(n−2))` | `Σ_i(∂_i g_ij − ∂_j g_ii) = (1−n)∂_j w`; `∂_r w = −4c r^(1−n)(1+…)`; integrand `4(n−1)c r^(1−n)`; sphere integral `4(n−1)c|S|`; divided by `2(n−1)|S|` | mass 2c; c=m/2 gives m |
| 0.2 non-conformal perturbation | `δ_ij + ε x_i x_j r^(−n)` | `Σ_i∂_i g_ij = ε x_j r^(−n)`, `Σ_i∂_j g_ii = ε(2−n)x_j r^(−n)`; flux `ε(n−1)|S|` | mass ε/2 |
| 0.2 scaling | `λ g_c`, `y=√λ x` | coefficient `c λ^((n−2)/2)` | mass scales by `λ^((n−2)/2)` |
| 0.2 flat model | g=δ | derivatives 0, flux 0, Scal 0 | mass 0 |
| 0.2 limit needs integrable Scal | n=3, `u=1+(1+r²)^(−3/8)` | Scal>0 with `∫Scal dV ~ ∫r^(−3/4)dr = ∞`; flux `~(3/2)r^(1/4)` | no limit: R01 |
| 0.3 weight membership | n=3, p=2, `v=r^(−1)` | tails `4π∫r^(−2δ−3)`: δ=−1/2 gives 4π, δ=−1 log-divergent, δ=−3/2 divergent | strict δ>−t |
| 0.3 constants | `1` on ℝⁿ at δ=−(n−2)/2 | tail `∫r^(n−3)dr = ∞` | not in `L²_(−q)` |
| 0.3 endpoint | `r^(−1)` in `C⁰_(−1)` | `sup r·r^(−1) = 1`; `L²_(−1)` tail ∞ | endpoints differ |
| 0.4 conformal law | `u=(2/(n−2))log φ` in R1's law | `2(n−1)Δ⁺u = a_nΔ⁺φ/φ + a_n|dφ|²/φ²`; `(n−1)(n−2)|du|² = a_n|dφ|²/φ²` | gradient terms cancel; exponent `−(n+2)/(n−2)` |
| 0.4 sphere Check | n=3, `φ=√2(1+r²)^(−1/2)` | `Δ⁺φ = 3√2(1+r²)^(−5/2)`; `8Δ⁺φ = 24√2(1+r²)^(−5/2) = 6φ⁵` | `Scal = 6 = n(n−1)` |
| 0.4 covariance | `Scal_g=0`, `g=w^(4/(n−2))δ` | `Δ⁺_g U = w^(−(n+2)/(n−2))Δ⁺_Eucl(wU)` | `Δ_gU=0 ⟺ Δ_Eucl(Uw)=0` |
| 0.4 mass increment | `v = 1 + b r^(2−n)` on `(1+a r^(2−n))^(4/(n−2))δ` | product `1+(a+b)r^(2−n)+O(r^(4−2n))` | mass `2a → 2a+2b` |
| 0.4 Green inversion | `G = r^(2−n)+A` | inverted factor `1 + A R^(2−n)` | `m = 2A` |
| 1.1 radius change | ρ→2ρ | factor `2^(−δ−n/p)` | equivalent norms |
| 1.1 `L²_(−n/2)` | δ=−n/2 | `ρ^(−δ·2−n) = ρ⁰` | plain L² |
| 1.1 duality | n=3, p=2 | dual weight −5/2; `r^(−3)` tail `4π∫r^(−2)=4π`; pairing with `r^(−1)` is 4π; wrong weight 1/2 admits `r^(−1)` and pairing ∞ | −n in the dual weight is required |
| 1.1 Hölder | p=q=4, r=2, δ=ε=−1/2, f=g=r^(−1), n=3 | each `∫r^(−4)r^(2−3)r²dr = 1/2`; product weight δ+ε=−1 | consistent |
| 1.1 exterior domain | n=3, δ=−1/2 | `r^(−1−j)Y_j` harmonic, tails finite for all j | unrestricted domain not Fredholm |
| 1.2 polar Laplacian | `f=r²`, n=3 | Cartesian `Δ⁺f=−6`; radial `−2−(2/r)(2r)=−6` | sign consistent |
| 1.2 indicial factor | n=3, j=1, δ=1,−2,0 | `−(δ−1)(δ+2)` = 0, 0, 2 | roots j and 2−n−j |
| 1.2 multiplicities | S², j=0,1,2 | 1, 3, `6−1=5` | binomial difference |
| 1.3 `X²` | `x=re₁` | `r²c(e₁)² = −r²` | negative convention |
| 1.3 `D²` | `f=x₁²v` | `D²f = 2c(e₁)²v = −2v = Δ⁺f` | sign |
| 1.3 `DX+XD` | constant v; `x₁v` | `−nv`; `−(n+2)x₁v` | `−(2E+n)` |
| 1.3 even/odd powers | a=1, ℓ=0; a=0,1, n=3 | `D(X²v)=−2Xv`; `DXv=−3v`, `DX³v=−5X²v` | coefficients `−2a`, `−(2ℓ+n+2a)` |
| 1.3 Fischer dimensions | n=3, rank 2, k=0,1,2 | `dim P = 2,6,12`; `dim M = 2,4,6` | `rank·binomial(k+n−2,k)` |
| 1.3 chiral count | n=4, rank Σ⁺=2, k=1 | `dim P₁⁺ = 8`, `dim P₀⁻ = 2`, `dim M₁⁺ = 6` | opposite chirality in X term |
| 1.3 polar Dirac | constant spinor, n=3, k=0 | `(m/2+λ)=1+λ=0` | branch λ=−1, δ=0 |
| 1.3 multiplicities | m=2: k=0,1; m=3: k=0 | `2(k+1) = 2, 4`; `(k+1)(k+2) = 2` | matches (3.44) and the odd case |
| 1.3 Cauchy kernel | n=3 | degree −2 = 1−n−0 | first negative exceptional weight |
| 1.3 Dirac exceptional set | n=3 | λ=−1,−2 give δ=0,1; λ=1,2 give δ=−2,−3 | `{k} ∪ {1−n−k}` |
| 1.4 Fredholm interval | flat ℝⁿ, 0<δ<1 | kernel = constants (LP 9.2(b)) | crossing δ=0 adds j=0 |
| 1.4 Dirac weight | `δ=−(n−2)/2` | `1−n < −(n−2)/2 < 0` for n≥3 | inside the interval |
| 1.4 end-value problem | two-ended Schwarzschild, data (1,0), (1,1) | solution in (0,1); solution 1 | maximum principle |
| 1.4 end-value, empty family | flat torus | every constant | nonemptiness gives uniqueness |
| 2.1 approximation interval | n=3, t=1 | `1/2 < q < 1` | nonempty |
| 2.1 mass continuity | `(1+εr^(2−n))^(4/(n−2))δ` | `W^(2,p)_(−q)` tail `ε^p∫r^((2−n+q)p−1)dr` finite iff q<n−2; mass 2ε→0 | consistent |
| 2.2 linearized Scal | flat metric | `DScal(h) = div div h + Δ⁺tr h` | sign with Δ⁺ |
| 2.2 variation | `h=χRic` | `∫χ|Ric|² > 0`; both signs of s | mass decreases for one sign |
| 2.3 AE lower limit | Euclidean end with bounded core | `(ω_n rⁿ+O(r^(n−1)))/(ω_n rⁿ) → 1` | liminf ≥ 1 |
| 2.3 cylinder | `S¹×ℝ^(n−1)` | volume `O(r^(n−1))`, ratio → 0 | no AE end |
| 2.3 monotone squeeze | Ric≥0 | nonincreasing, ≤1, liminf ≥1 | ratio ≡ 1 |
| 3.0 constant potential | V=c | λ₁=c, φ=1 | simple |
| 3.0 S², S³ | Δ⁺ on S²; `8Δ⁺+6` on S³ | 0 (mult 1), 2 (mult 3); λ₁=6, φ=1 | original metric, Scal 6 |
| 3.1 equator | `S^k ⊂ S^(k+1)`, φ=1 | `k(k−1)Vol < k(k+1)Vol` | fails, unstable |
| 3.1 `a_k` | k=3,4,7 | 8, 6, 24/5 | all >2 |
| 3.1 Rayleigh bound | k≥3 | `a_k∫|dφ|² + ∫Scal_Σφ² ≥ 2∫|dφ|² + ∫Scal_Σφ² ≥ min Scal_M∫φ²` | λ₁ ≥ min Scal_M |
| 3.1 boundary Gauss–Bonnet | unit disc; annulus 1<r<2; hemisphere; square | 2π; `(1/2)4π − 2π = 0`; 2π; corners 4·π/2 | `2πχ` each |
| 3.1 surface case | T², S² | `(b₁,χ) = (2,0)`, `(0,2)` | torus class excluded by χ>0 |
| 3.1 cup pairing | identity T³→T³; constant map | 1; 0 | nonzero degree discriminates |
| 3.2 sign of b | `U = 1+b r^(2−n)`, U≤1 | b>0 gives U>1 | b≤0 |
| 3.2 concavity | F″≤0 | `Δ⁺F(h) = −F″|dh|² ≥ 0`, Scal≥0; convex F gives Scal≤0 | sign fixed |
| 3.2 capping model | `(1+a/r)⁴δ` on ℝ³∖0, `U=r/(r+a)` | `Δ_gU=0`; b=−a; `m+2b = 0`; Kelvin of `c r^(2−n)` is c | mechanism checked |
| 3.2 applicability | `h=1+(m/2)r^(2−n)` | m>0: no R₀ with h<1; m<0: h<1 everywhere | exactly negative mass |
| 3.2 λ₁>0 | closed, Scal≥0, >0 somewhere | λ₁=0 forces φ constant and Scal·φ=0 | λ₁>0 |
| 3.3 plane in Schwarzschild | `x₃=0`; `x₃=a≠0` | fixed set of an isometry; `H_g = e^(−f)(n−1)∂_νf ≠ 0` | minimal; not minimal |
| 3.3 log cutoff | `φ_R` on `R≤r≤R²` | `∫|dφ_R|² = 2π/log R` | → 0 |
| 4.1 frame-constant section | order t | `∇ψ₀ = O(r^(−t−1))`; `L²_(−q−1)` weight `ρ⁰`; `∫r^(−2t−2)r^(n−1)dr` finite iff 2t+2>n | iff t>q |
| 4.2 sign | inward ν, harmonic u | `0 = ‖∇u‖² + ∫Scal|u|²/4 + G_r`; `−G_r → (n−1)|S|m|v|²/2` | m≥0 |
| 4.2 constant | — | `(n−1)|S|/2 = (n−1)ω_(n−1)/2` | matches (2.9) |
| 5.1 σ and χ | `σ=[[0,−i],[i,0]]`, `c(ξ)=[[0,c_Σ],[c_Σ,0]]` | `σ²=I`; `c(ξ)σ = diag(ic_Σ,−ic_Σ) = −σc(ξ)`; `χ² = −c_Σ(ν)²·1 = I`; `χ* = −σc(ν) = χ` | self-adjoint involution |
| 5.1 explicit eigenspaces | `c_Σ(ν)=diag(i,−i)` | `χ=diag(−1,1,1,−1)`; +1: `(e₂,0),(0,e₁)` | half rank |
| 5.1 cross term | σ parallel | `ψ(𝓓σ+σ𝓓) = ψΣ(c_jσ+σc_j)∇_j = 0`; σ=id gives `2ψ𝓓` | `B² = 𝓓²+c(dψ)σ+ψ²` |
| 5.1 mean curvature | unit ball, exterior, half-space, inward ν | H = 1, −1, 0 | `η_ψ=(n−1)H/2+ψ` as in (2.7) |
| 5.2 potentials | ψ=0; ψ=λ flat; ψ=λf | `Scal/4`; `λ²`; `≥ −λ|df|` | consistent |
| 5.2 twistor | `u=Xv` | `|∇u|²=n|v|²`, `Du=−nv`, `|Du|²/n=n|v|²`, `Pu=0` | identity holds |
| 6.1 flat injectivity | ℝⁿ, ψ=0 | harmonic u in `L²_(−q)`: constants have `∫r^(−2)r^(n−1)dr=∞` | kernel 0, index 0 |
| 6.1 threshold | `θ⁻=λ|df|` | admissible iff `λ ≤ c₀/‖df‖_(L^∞_(−2))` | as stated |
| 6.1 constants | `c₀=1/(2C)` | `1/C − c₀ = c₀ > 0` | (4.2) |
| 6.1 unbarred Lemma 3.4 | kernel u | `0 ≥ ‖∇u‖²`, ∇u=0, u=0 near infinity | true, but not the source's statement: R05 |
| 6.2 Schwarzschild | m>0, n=3 | `(n−1)|S|m|v|²/2 ≥ ‖∇u‖²`; parallel u would force flatness | strict inequality |
| 7.1 supports | `ξ₀=(v,0)`, ψ_λ=λ at a common point | residual `(0,iλv)` of norm λ; with disjoint supports 0 | support law needed and present |
| 7.1 flat Check | X₀={|x|≥R}, ball X_λ | a ball does not contain X₀ | false Check: R03 |
| 7.1 barrier | `h(t)=λ/(1−λt)` | `h'=h²`, `h²−|h'|=0` | Lemma 3.3 model |
| 7.1 λ₀ | complete M | every λ>0 admissible with X_λ=M | λ₀=0 |
| 7.2 flat estimate | `ξ₀=βv` | `𝓓ξ₀=c(dβ)v`; `m ≥ −Cλ` | m≥0 |
| 7.2 `𝓓ξ₀=0` | — | ξ_λ=0, bound exact | m≥0 |
| 7.2 energy | zero mass | `0 ≤ E_(1/j) ≤ C/j → 0` | Cauchy by Poincaré |
| 8.1 nonspin | ℝ³; Schwarzschild c=1 | (Scal,m)=(0,0) with isometry; (0,2) | both controls |
| 8.2 spin, n=8 | ℝ⁸, Schwarzschild | rank 16; masses 0, 2 | outside 8.1, inside 8.2 |
| 8.3 | ℝⁿ; the R01 instance | m=0 rigid; flux divergent | hypothesis missing |
| 8.4 Green | A=0,1,−1 | m=0,2,−2 | −2 excluded by 8.1–8.3 |
| Lean `coordinateFluxIntegrand` | g=δ, r=0 | all derivatives 0, integrand 0 even at junk radius | no 0/0 |
| Lean `normalizedCoordinateFlux` | n=1; n=3 | denominator 0 (junk) ; `16π` | n≥3 in both theorems |
| Lean `FiniteEndedAE` | single end image with empty complement | exterior of a ball is not complete, excluded by `CompleteSpace` | no vacuous instance |
| Lean theorems | ends `Fin A.numEnds` | nonempty by `numEnds_pos` | every end quantified |

Statements quantified over arbitrary data were checked for a tying hypothesis: the end chart is tied to M by `pullbackMetricCoeff` of `mfderiv`; the flux is tied to the end by `(A.ends a).toFun`.

## Not verifiable

- **Bartnik 1986** (Theorem 1.3, Proposition 1.6): Wiley returns HTTP 403 through the service; no open copy. Checked only through the citing statements in Cecchini–Zeidler Proposition 2.7 and Lee–Parker Theorem 9.2(a).
- **Schoen–Yau 1979, Comm. Math. Phys. 65** (§§3–5): Springer DOI prefix is paywalled by policy; the open Project Euclid copy returned an Incapsula block page on both the article and the download URL.
- **Parker–Taubes 1982**: same archive, not retried after the block; the README cites it without a theorem number.
- **Schoen–Yau, Manuscripta Math. 28 (1979)**: Springer paywalled; the obstruction was checked against Schoen–Yau 2017 Theorems 5.1–5.2 instead.
- **do Carmo §4-5**: a textbook with no legal online copy and not in the operator's local directory; the boundary Gauss–Bonnet statement was checked by the disc, annulus, hemisphere and square computations.
- **ADM 1961**: cited only as the origin of the mass, no locator; not fetched.
- These five texts are listed in the job's `needs-references.toml` with where I looked. No manifest was edited, no paywall was circumvented, no Lean job is left running.

## Source issues

- **Misprint** in cecchini-zeidler at proof of Lemma 3.4, printed p. 15: the source says the unbarred θ_ψ and η_ψ are nonnegative while invoking (2.10); it should be the barred θ̄_ψ, η̄_ψ of the lemma's hypothesis and of (2.10); affects the proof.
- **Misprint** in cecchini-zeidler at equation (4.5), printed p. 17: the source says the gradient term is the unsquared L² norm on X_λ; it should be the squared norm, as in (2.9) and (4.7); affects the proof.
- **Misprint** in cecchini-zeidler at proof of Theorem A, printed p. 16: the source says the admissible X_λ satisfies dist(∂X, ∂X_λ) > 1/λ; it should be dist(∂X₀, ∂X_λ) > 1/λ, as used on p. 17; affects nothing.
