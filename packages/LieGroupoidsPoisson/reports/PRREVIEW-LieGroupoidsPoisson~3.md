# Review of LieGroupoidsPoisson (pull request #1050 at 2a55031)

**Verdict:** accepted

Files reviewed: `TauCetiRoadmap/LieGroupoidsPoisson/README.md` (2102 lines; 185 changed lines since
a196c92, so a full review) and `TauCetiRoadmap/LieGroupoidsPoisson/Suggested.lean` (74 lines,
unchanged since a196c92: one definition with a real body, two sorried theorems). The gate at this
head passes every check (build 0, depcheck 0). No file outside the folder changed. One P3 finding,
no P1 or P2.

## Status of the previous review's findings

- **R01 (translations on the wrong fibres): repaired.** Line 433–435: "Left translation `h ↦ gh` by
  `g` is a diffeomorphism `t⁻¹(s(g)) → t⁻¹(t(g))` of target fibres, and right translation `h ↦ hg`
  by `g` a diffeomorphism `s⁻¹(t(g)) → s⁻¹(s(g))` of source fibres". Recomputed: `gh` needs
  `t(h) = s(g)` and has `t(gh) = t(g)`; `hg` needs `s(h) = t(g)` and has `s(hg) = s(g)`. Line 791
  now reads "`R_g : s⁻¹(t(g)) → s⁻¹(s(g))`, which are diffeomorphisms of source fibres". The new
  pair-groupoid Check (line 446–449) has one wrong instance (R01 below).
- **R02 (descended form unowned): repaired.** G7.2 (line 1868–1877) constructs `ω_red` on
  `q : Z → Z/Γ_ξ` by `ω_red(dq(u), dq(v)) = (i*ω)(u,v)`, proves smoothness through the local sections
  of B1.1/B1.4, closedness and uniqueness from injectivity of `q*`, nondegeneracy from
  `ker(i*ω) = ker dq`; HamiltonianReduction keeps only the comparison. On main,
  `SymplecticGeometry/HamiltonianReduction/README.md` line 297–302 consumes "G7.2's isotropy quotient
  and descended form" and "agreement of G7.2's descended form with R3's ordinary reduced" form: the
  two roadmaps now agree on the owner. The new Check (`ω_red = −ω` for the pair groupoid acting on
  itself) is recomputed in the table.
- **R03 (Theorem 1.30 needs source-connectedness): repaired.** Line 1570–1573 restricts the quotient
  statement to source-connected `Γ` and adds the `M × ℤ/2` negative control (line 1587–1590).
- **R04 (`SO(3)` monodromy, `N = 0` argument): repaired.** Line 1532–1538: `N = {v ∈ Z(𝔤) : exp v = 1}`
  with the vector-group argument through `Z(G̃)⁰` simply connected (long exact sequence with
  `π₂` of a Lie group zero); line 1542–1550: `N_x = 4πℤ·ξ`, `SU(2) ⋉ ℝ³`, boundary map `×2`.
  Both recomputed below.
- **R05 (negative-degree power maps): repaired.** Line 1649–1650: degree `m` for `m ≥ 0`; the new
  Check (line 1673–1675) records degree `|m|` for all integers.
- **R06 (Theorem 2.1 page): repaired.** p. 589 at lines 126, 1473 and 2082.
- **R07 (missing locators): repaired.** G2.4 cites Fernandes, Theorem 1.1 (arXiv p. 11); G6.2
  cites Coste–Dazord–Weinstein Ch. II §4 and GSM 217 §13.5 and Proposition 13.76; G6.3 Examples
  14.7 and 14.22; G7.1 Definition 14.38, Examples 14.39, Propositions 14.42 and 14.45; G7.2 §14.4
  item (i); G7.3 Example 14.40 and Proposition 14.45. Every one read at the text (Verified sound).
- **R08 (sign attribution): repaired.** Line 1292–1294 attributes the difference to `X_f = π♯df`
  versus `π♯df = −X_f`, the sharp map being the same.
- **R09 (process word): repaired.** Line 2013–2014: "(R3; these are SmoothBundlesConnections B1.0's)".
- **R10 (infinitesimal-action sign): repaired.** Line 1862–1867 defines `a_P(p)` as the derivative of
  `g_ε·p` along a source-fibre path with `g_0' = a`, states `ι_{a_P}ω = −μ*(σ_Ω(a))`, explains the
  `+` in GSM 217 (algebroid `ker dt`, action differentiating `g ↦ g⁻¹·p`), and adds the two
  computations as a Check (line 1890–1895); the supplier contract (line 222–225) pins
  HamiltonianSystems' `ι_{Z_M}ω = d⟨μ,Z⟩`, which is line 62 of HamiltonianSystems at its open head.

## R01 (P3) — Wrong instance in the pair-groupoid translation Check

**Location.** `README.md` lines 446–449: "a statement putting left translation on source fibres
would need `gh` defined for `s(h) = s(g)`, which the arrows `(y,x)` and `(z,x)` with `z ≠ y` refute."

**Witness.** With `g = (y,x)` and `h = (z,x)`, `gh` is defined iff `t(h) = z` equals `s(g) = x`. For
`z = x ≠ y` the pair `(y,x)`, `(x,x)` has `s(h) = s(g)` and `gh = (y,x)` is defined, so the stated
condition `z ≠ y` does not refute the claim; `z ≠ x` does.

**Repair.** Replace "with `z ≠ y`" by "with `z ≠ x`".

## Verified sound

**Gate and dependency check.** The worker's gate at 2a55031 passes every check (build 0). Re-run of
the dependency check on this head: `depcheck: 204 roadmaps, 1417 edges, 0 problem(s)`; no UPWARD,
CYCLE or moved line. The roadmap is at line 136 of the merge order. Suppliers: Mathlib and Tau Ceti
at the pins; on main DifferentialGeometry, SmoothBundlesConnections, CotangentLagrangian, LieGroups,
AlgebraicTopology, Completed/UniversalCovers, Completed/HopfRinow; earlier in the order
PseudodifferentialOperators (read at its open head, P1.0 lines 151–211 and 319 as cited, line 211
names G1.1 as consumer); HamiltonianSystems (another author's open pull request adding a new folder,
cited by name and layer). None of them cites this roadmap as a supplier.

**Lean.** `lake env lean` on `Suggested.lean`: two `declaration uses sorry` warnings, exit 0
(2.9 s). Scratch copy with `#check @IsDiffSubmersionAt`, `#check @submersion_iff_split_mfderiv`,
`#check @rightInvariant_bracket`: every binder the README states is present (`IsManifold … ∞` on
both manifolds, `ContMDiff … ∞ f`, `CompleteSpace E`, `LieGroup I ∞ G`, `BoundarylessManifold I G`);
nothing changed. Padding probe: replacing each `sorry` by `first | rfl | simp | infer_instance | aesop`
closes neither (both directions of the iff remain; `aesop` makes no progress on the bracket).
Mathlib's `IsSubmersion` (`Geometry/Manifold/Submersion.lean` line 553) quantifies one complement
`F` for all points; in finite dimension with models `Fin n → ℝ`, `Fin m → ℝ` the complement
`Fin (n − m) → ℝ` serves at every point (and the empty manifold is vacuous), so the backward
direction of `submersion_iff_split_mfderiv` is true as stated. The docstring's list of non-statable
headlines (G5.5, G5.4, G5.6, G2.4, G4.5, G6.4, G7.4) is accurate at the pins: no Lie algebroid, Lie
groupoid, singular foliation or bivector carrier exists in the pinned Mathlib or Tau Ceti. No
`lemma`, `set_option`, `#eval` or `#print`. No sorried data.

**Library declarations at the pin.** Mathlib: `Manifold.IsSubmersionAt` (Submersion.lean line 171),
`IsSubmersion` (line 553), `IsDiffImmersionAt` (ImmersionDiff.lean line 65),
`HasRightInverse.of_surjective_of_finiteDimensional` and `HasRightInverse.comp`
(Analysis/Normed/Module/ContinuousInverse.lean), `LieRinehartRing`, `LieRinehartAlgebra`
(Algebra/LieRinehartAlgebra/Defs.lean lines 30, 43) with `lie_smul_eq_mul'`, `leibniz_mul_right'`,
`leibniz_smul_right'`, `LieModule.Cohomology.twoCochain` (Cochain.lean line 46), `d₁₂` (line 101,
`⁅x, f y⁆ − ⁅y, f x⁆ − f⁅x,y⁆` line 116), `d₂₃` (line 123, six terms line 127, signs `+,−,+,−,+,−`),
`d₂₃_comp_d₁₂` (line 143), `TrivialLieModule.equiv` (Algebra/Lie/Abelian.lean line 391),
`Groupoid.vertexGroup` (VertexGroup.lean line 42), `Groupoid.isoEquivHom` (Groupoid.lean line 97),
`Subgroupoid.full` (line 584), `Subgroupoid.vertexSubgroup` (line 161), `Codiscrete`
(CodiscreteCategory.lean line 40), `ActionCategory` (Action.lean line 48),
`VectorField.mpullback_mlieBracket`, `IsEmbedding.subtypeVal`, `MulAction.orbitRel.Quotient`,
`GroupLieAlgebra` with `mulInvariantVectorField` (GroupLieAlgebra.lean line 62, left-invariant).
Tau Ceti: `SmoothTwoForm` (TwoForm/Basic.lean line 61), `IsContMDiffDistribution`
(Distribution.lean line 163: every point has an open neighbourhood with a `C^n` frame of `k`
fields), `mvfderiv_mlieBracket` (VectorField/LieBracket.lean line 222, `minSmoothness 𝕜 2 ≤ n`),
`isLocalDiffeomorphAt_of_mfderiv_eq` (LocalDiffeomorph.lean line 269), `extChartPartialDiffeomorph`
(line 73), `leftInvariantDerivationLieEquivGroupLieAlgebra` (Lie/Tangent/LieEquiv.lean line 103),
`mulRightInvariantVectorField v g = mfderiv I I (· * g) 1 v` (RightInvariantVectorField.lean line
72–73), `levelSetChartedSpace` and `isManifold_levelSet` (Analysis/Fredholm/LevelSet).

**Cross-roadmap citations resolved.** On main: SmoothBundlesConnections B1.0 (line 221), B1.1 (line
315–351: local sections, division map, smooth descent `f|U = F∘s_U`, `ker(dπ_p) = range(d(g ↦ p·g)_1)`),
B1.2 (line 366), B1.4 (line 421–445: free proper quotient, surjective submersion, principal bundle),
B3.2 (line 912: `[s(X),s(Y)] − s([X,Y]) = j(F(X,Y))`, LieGroupoidsPoisson owns the algebroid), B5.2
(line 1932 deferral); DifferentialGeometry 0.4 (`legacySmoothTwoFormEquiv` line 303,
`legacySmoothTwoFormEquiv_isClosed_iff` line 304), Layers 1, 3, 4, 5, 6 (lines 311–782), 10.1
(`IsRegularPoint`, `IsRegularValue` line 883), 12.1 (`nonempty_contMDiffRiemannianMetric` line 915);
CotangentLagrangian C1 (`ω = −dθ`, line 186); LieGroups Layers 0–5 (lines 233–358); AlgebraicTopology
Stage 1 (line 289); Completed/UniversalCovers; Completed/HopfRinow Layer 1 (line 264);
HamiltonianReduction R1 (line 22, G4.2a), R1 (line 65, G4.3), R2 (lines 130–140, positive Lie–Poisson
and sharp convention from G4.6A, orbit identification G4.6B), R3 (line 193), R4 (lines 295–302:
`t(g,ν) = Ad*_g ν = ν∘Ad_{g⁻¹}` as G6.3, G7.2 descended form consumed); ComplexKahlerGeometry K8
(lines 1551, 1598, 1683 cite G1.3), CharacteristicClasses C5a (lines 121, 1149, G1.3a),
OperatorAlgebraDynamics D5 (lines 59, 279, G0), Orbifolds (lines 48–50, 99: G0.4, G3.5),
LieHighestWeight (line 488, G4.6A), ContactGeometry (line 255). QuantumFoundations is not on main;
it is the new roadmap of open pull request #1771 and is cited only as a consumer. At open heads:
HamiltonianSystems (#480) lines 47–62: `ι_{X_F}ω = dF`, `{F,G} = dF(X_G)`, `X_{{F,G}} = −[X_F,X_G]`,
`(⁅Z,Z'⁆)_M = −[Z_M,Z'_M]`, moment map `ι_{Z_M}ω = d⟨μ,Z⟩`, canonical model
`ω((q,α),(q',β)) = βq − αq'`, cotangent lift `Z_M = (Aq, −α∘A)` with `μ_A(q,α) = α(Aq)` (lines
490–495); Layer 3 `IsMomentMap ω a μ` (line 433). The worker's resolver found no dangling citation
and no dangling Lean name.

**Ownership.** `roadmaps grep` over the 433 open pull requests and main for "symplectic groupoid",
"Weinstein groupoid", "Lie algebroid", "A-homotop", "cotangent groupoid", "Schouten": every hit
outside this folder is a consumer or a deferral (GeometricQuantization #1186 line 862; ComplexKahlerGeometry
line 190–191; GeometricRepresentationCategories line 345; SmoothBundlesConnections line 1932;
FormalConnectionsOpers #1056 line 1039, an algebroid of its own conormal Lie–Rinehart algebra;
HamiltonianReduction line 295 consuming `T*G ⇉ 𝔤*`). No other open roadmap builds these objects.

**Sources read at the text** (cache ids in parentheses; GSM 217's service extraction is empty, see
Not verifiable). cf2003 (9cfcc73b, arXiv math/0105033v5): Theorem 1.30 analogue and Lie II line
167–170; Example 3.7 line 852–862 (`[(X,f),(Y,g)] = ([X,Y], X(g) − Y(f) + ω(X,Y))`, `N_x` = period
group); Theorem 4.1 line 1013–1016 (`r(x) ≠ 0`, `liminf r(y) > 0`); Example 4.2 line 1019–1022.
cf2011lectures (e25355d2, arXiv math/0611259v1): Theorem 1.30 line 592–597, hypothesis "s-connected
Lie groupoid", `F` a local diffeomorphism with the same algebroid. cf2004 (1a2f52e1, arXiv
math/0210152): Theorem 2 line 166–170, Proposition 4 line 710–716 (Lagrangian graph ⇔
`m*ω = π₁*ω + π₂*ω`), Theorem 5 line 763–771 (uniqueness of the s-simply-connected symplectic
integration). bcwz2004 (398d08ea, arXiv math/0303180): Remark 2.3 line 348–350, Theorem 2.5 line
366–372 (`⟨ρ*(α),ρ(β)⟩ = −⟨ρ*(β),ρ(α)⟩`, `ρ*([α,β]) = L_α ρ*(β) − L_β ρ*(α) + d⟨ρ*(α),ρ(β)⟩`,
`ρ*_ω(α)(X) = ω(α,X)`). blohmann2008 (e700e699, arXiv math/0702399v3): Proposition 2.11 line
298–300 (p. 7), Proposition 2.12 line 351–352 (p. 8). Fernandes 2002 (f900fec4, arXiv
math/0007132v2): Theorem 1.1 line 409–428 on arXiv p. 11 (page marker line 399): coordinates
`(x_i, y_j)`, `#α_i = ∂_{x_i}`, `#α_s = Σ b_{sj}(y) ∂_{y_j}` with `b_{sj}(0) = 0` depending only on
`y`, so the `y`-direction anchors vanish on the plaque `{y = 0}` as G2.4 says. Coste–Dazord–Weinstein
(6ac494f8, Numdam PDML 1987 2A): Chapitre II line 568–1109; §4 "Cotangent d'un groupoïde" line 838
on printed p. 27 (line 860), §5 at line 1044 on printed p. 33; the cited span pp. 27–33 is exact.
GSM 217 (820bc6d5, author's copy; read through a Ghostscript extraction in scratch): Theorem 2.8
(p. 26), Theorem 3.2 (p. 44, `π = Σ ∂_{p_i}∧∂_{q_i} + Σ θ_{ab}(y) ∂_{y_a}∧∂_{y_b}`, `2s = rank π_x`),
Theorem 4.1 and Lemma 4.2 (p. 63, `ω_S(π♯α,π♯β) = −π(α,β)`), Theorem 4.13 (p. 69), §13.5 cotangent
groupoid (p. 344: `s(ξ_g)(α_x) = ξ_g(dL_g α_x)`, `t(ξ_g)(β_y) = −ξ_g(dR_g dι β_y)`, left-invariant
`A = ker dt`), Proposition 13.76 (p. 345), Example 14.7 (pp. 363–364, `Ω = −l_*ω_can` on `G ⋉ 𝔤*`,
`m(g,h,ξ) = (gh,ξ)`, `pr₁ = (g, Ad*_h ξ)`), Example 14.22 (p. 375, `Ω = −ω_can`, source the
antisymplectic realization of `(𝔤*, π_𝔤)`), Definition 14.38 (p. 388, `A*ω = pr₁*Ω + pr₂*ω`),
Example 14.39 (multiplication as an action along `t`), Example 14.40 (p. 388, connected `G` by
Proposition 14.45), Proposition 14.42 (p. 389, `μ*(σ_Ω(α)) = ι_{a(α)}ω`, proof line "`−Ω_x(α,dμ(v)) =
ω_p(a_p(α),v)`" with `a_p(α) = d A(dι(α), 0_p)`), §14.4 item (i) (p. 391, `ω_x` unique with pullback
to `μ⁻¹(x)` equal to the restriction of `ω`), Proposition 14.45 (p. 392, connected t-fibres).

**Seeded sample.** G1.3a: the pinned formula in degree one is `x₀ω(x₁) − x₁ω(x₀) − ω([x₀,x₁])` =
`d₁₂` (Cochain.lean line 116); in degree two the six terms `x₀ω(x₁,x₂) − x₁ω(x₀,x₂) + x₂ω(x₀,x₁) −
ω([x₀,x₁],x₂) + ω([x₀,x₂],x₁) − ω([x₁,x₂],x₀)` match `d₂₃` (line 127) term by term, and
`d₂₃ ∘ d₁₂ = 0` is line 143. G4.2a: HamiltonianSystems `ι_{X_F}ω = dF` (its line 47); on the
canonical model `ω(X_H,(q',β)) = β(∂H/∂α) − (−∂H/∂q)(q') = dH(q',β)` ✓; `ω = βq − αq'` is
`Σ dq^i∧dp_i = −d(p dq) = −dθ`, CotangentLagrangian's sign ✓; DifferentialGeometry 0.4 supplies the
two names ✓; HamiltonianReduction R1 line 22 consumes exactly this ✓. G4.6A: `{p_x,x} = −p*(∂_x x)
= −1` so `{x,p_x} = 1` = `π(dx,dp)` for `∂_x∧∂_p` ✓; Jacobi for the minus convention is the cyclic
sum `ℓ([a,[b,c]] + cyclic) = 0` and, for `{ℓ_a,p*f}`, `p*((ρ(a)ρ(b) − ρ(b)ρ(a) − ρ([a,b]))f) = 0` by
the anchor law ✓; group over a point: algebroid bracket `−[ξ,η]`, so `{ℓ_ξ,ℓ_η} = −ℓ(−[ξ,η]) =
ℓ([ξ,η])`, positive, as HamiltonianReduction R2 (line 130) and LieHighestWeight (line 488)
consume ✓; affine `{x,y} = y` ✓. G4.6B: `{ℓ_ξ,ℓ_η} = dℓ_η(π♯dℓ_ξ) = ν([ξ,η])` so `π♯dℓ_ξ = ν∘ad_ξ`;
`ξ_{𝔤*}(ν) = d/dt ν∘Ad_{exp(−tξ)} = −ν∘ad_ξ`; hence `π♯dℓ_ξ = −ξ_{𝔤*}` = the anchor `ξ ↦ −ξ_M` of
G1.4 ✓; on `𝔰𝔬(3)*`: `ν·(ξ×η) = η·(ν×ξ)`, so `π♯dℓ_ξ = ν×ξ = −(ξ×ν)` ✓; `ℝ ⋊ ℤ/2`: `π = 0`, orbit
`{ν,−ν}`, two point leaves ✓; affine dual: half-planes and axis points = orbits of the connected
affine group ✓.

**Adversarial table** (values computed on each side; rows for every repaired passage, the sampled
targets, the headlines and the finding).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| G0.2 translation bullet (R01 repair) | `gh`, `hg` | `gh` defined iff `t(h) = s(g)`, `t(gh) = t(g)`; `hg` iff `s(h) = t(g)`, `s(hg) = s(g)` | left on target fibres, right on source fibres | none |
| G0.2 new Check | pair groupoid `g = (y,x)`, `h = (z,x)` | `gh` defined iff `z = x`; for `z = x ≠ y`, `gh = (y,x)` exists | condition `z ≠ y` wrong, `z ≠ x` right | R01 |
| G0.2 `dim Γ ≥ dim M` | unit, pair | `n = n`; `2n > n` | consistent | none |
| G0.1 `submersion_iff_split_mfderiv` | `m = 0`; empty `X`; `n ≥ m` | RHS vacuous/true, LHS needs one global `F = Fin (n−m) → ℝ` | true at the pin | none |
| G0.4 `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` | `SingleObj S₃` | `vertexGroup`: `x*y = x ≫ y`; roadmap `gh = h ≫ g` | opposite | none |
| G1.1 Check 4 | `ρ(∂_x) = x∂_x` | `[f∂_x,g∂_x] = x(fg'−gf')∂_x`, `ρ` of it `= x²(fg'−gf')∂_x = [xf∂_x,xg∂_x]` | consistent | none |
| G1.3a vs `d₁₂`, `d₂₃` | degrees 1, 2 | three and six terms, signs equal | equal | none |
| G1.3 `𝔰𝔬(3)` | `e₃*` | `d(e₃*)(e₁,e₂) = −1`; abelian `ℝ³`: `H¹ = ℝ³` | consistent | none |
| G1.4 affine | `x∂_x, ∂_x` | `[x∂_x,∂_x] = −∂_x = −([e₁,e₂])_ℝ` | anti-homomorphism | none |
| G2.2 `rightInvariant_bracket` | affine group | `e₁^R = a∂_a + b∂_b`, `e₂^R = ∂_b`, bracket `−∂_b`; `e₁^L = a∂_a`, `e₂^L = a∂_b`, bracket `a∂_b` | `[ξ^R,η^R] = −[ξ,η]^R` | none |
| G2.4 Fernandes Thm 1.1 | `(x,y)` chart | `#α_i = ∂_{x_i}`, `#α_s = Σ b_{sj}(y)∂_{y_j}`, `b(0) = 0`, `b` depends on `y` only | plaque `{y=0}` is an integral manifold | none |
| G3.1 dimension | Hopf | `3 − 0 − 1 = 2` | consistent | none |
| G4.1 `[π,f] = −π♯df` | `∂_x∧∂_p`, `f = x` | `[π,x] = ∂_p(x)∂_x − ∂_x(x)∂_p = −∂_p`; `π♯dx = ∂_p` | consistent | none |
| G4.1 non-Poisson | `∂_x∧∂_y + y∂_y∧∂_z` | cyclic Jacobi `= {x,y} = 1` | consistent | none |
| G4.2 Check 1 | `ω = dx∧dp` | `ω♭∂_p = −dx`, `−(ω♭)⁻¹dx = ∂_p = π♯dx`, `{x,p} = 1` both sides | consistent | none |
| G4.2a adapter | canonical model | `ω(X_H,(q',β)) = β(∂H/∂α) + (∂H/∂q)q' = dH(q',β)`; `ω = dq∧dp = −dθ` | consistent | none |
| G4.3 | `π = ∂_x∧∂_p` | `ι_{−∂_p}(dx∧dp) = dx`, so `X_x = −∂_p = −π♯dx` | consistent | none |
| G4.4 degree-zero | general | `(π♯α)f = π(α,df)`; `α(−π♯df) = −π(df,α) = π(α,df)` | consistent | none |
| G4.5 leaf form | `∂_x∧∂_p`; `(M,ω)` with `π♯ = −(ω♭)⁻¹` | `ω_L(∂_p,−∂_x) = 1`; `ω_L(−u,−v) = ω(u,v)` | `ω_L = ω` | none |
| G4.5 vs GSM 217 Thm 4.1 | `(M,ω)` | theirs `ω_S(π♯α,π♯β) = −π(α,β)` with `π♯ = (ω♭)⁻¹`; both leaf forms `= ω` | attribution now right | none |
| G4.6A | `TM`, point group, affine | `{x,p_x} = 1`; `−ℓ(−[ξ,η]) = ℓ[ξ,η]`; `{x,y} = y` | consistent | none |
| G4.6B | `𝔤*`, `𝔰𝔬(3)*`, `ℝ⋊ℤ/2` | `π♯dℓ_ξ = ν∘ad_ξ = −ξ_{𝔤*}`; `ν×ξ`; orbit `{ν,−ν}` = two leaves | consistent | none |
| G5.2 codimension | `TM/ℝⁿ`, `𝔤`, `0` | `2n`, `dim 𝔤`, `dim M` | `= dim M + rank A` | none |
| G5.3 `N = 0` for `𝔤` (R04 repair) | simply connected `G̃` | `π₂(G̃/Z⁰) = 0 → π₁(Z⁰) → π₁(G̃) = 0`; `Z⁰` vector group; `exp` bijective | `N = {v : exp v = 1} = 0` | none |
| G5.3 `SO(3) ↷ ℝ³` (R04 repair) | `x ≠ 0` | `π₂(SO(3)) = 0 → π₂(S²) = ℤ → π₁(SO(2)) = ℤ → ℤ/2 → 0`, so `∂ = ×2`; `N_x = 4πℤ·ξ`; `ℝ/4πℤ = U(1) ⊂ SU(2)` | consistent | none |
| G5.3 `A = TM` | — | `ker ρ = 0 ⇒ N_x = 0` | consistent | none |
| G5.4 quotient statement (R03 repair) | `A = 0`, `Γ = M×ℤ/2` | `Σ(0) = M`, image `M×{1}` | needs source-connected, now stated | none |
| G5.4 `−φ∘(−id)` | `φ : 𝔤 → 𝔥` | `= φ` | consistent | none |
| G5.5 criterion | cf2003 Thm 4.1 | `r(x) ≠ 0` and `liminf r(y) > 0` | consistent | none |
| G5.6 Jacobi | cyclic sum | `dη(X,Y,Z)` | iff `dη = 0` | none |
| G5.6 square identity | `b(ε,0) = b(ε,1) = 0` | `∫a⁰(1,·) − ∫a⁰(0,·) = −∫γ*η` | consistent | none |
| G5.6 degrees (R05 repair) | `m = −1` | `z ↦ 1/z` degree `+1`; `z^m` degree `|m|` | `m ≥ 0` stated | none |
| G5.6 periods | `(1,0)`, `(0,1)`, `λ = p/q` | `1`, `λ`, `(1/q)ℤ` | dense iff `λ ∉ ℚ` | none |
| G6.1 `σ_Ω` pair groupoid | `a = (v,0)` | `du(X) = (X,X)`, `Ω((v,0),(X,X)) = ω(v,X)`, `σ_Ω(a) = −ω♭v`, `π♯σ_Ω = id` | consistent | none |
| G6.2 pair groupoid `T*` | `g = (y,x)` | `b − du(ρb) = (0,−b)`, `s̃(α,β) = −β`, `t̃ = α`; product `(α₁,β₂)` iff `α₂ = −β₁` | consistent | none |
| G6.2 vs GSM 217 §13.5 | `ker dt` convention | theirs `s(ξ_g)(α) = ξ_g(dL_g α)`, `t(ξ_g)(β) = −ξ_g(dR_g dι β)` | dual convention, as flagged | none |
| G6.3 `T*G` | `(g,Coad_h ν)(h,ν)` | `s = Coad_h ν = t(h,ν)`; `t(gh,ν) = Coad_g Coad_h ν` | consistent | none |
| G6.3 vs GSM 217 Ex 14.7/14.22 (R07) | `Ω = −ω_can` theirs | their bivector of `ω` is `(ω♭)⁻¹`, ours `−(ω♭)⁻¹`, so `(T*G,−ω_can)` theirs `= (T*G, ω_can)` ours as Poisson manifolds | same positive base | none |
| G6.3 affine | `(a,b)(1,t)(a,b)⁻¹` | `= (1,at)`, `Ad_{(a,b)⁻¹}e₂ = a⁻¹e₂` | consistent | none |
| G6.4 IM identities | `σ = id` | `⟨a,π♯b⟩ = π(b,a) = −⟨b,π♯a⟩`; Koszul `= L_{π♯a}b − ι_{π♯b}da` after Cartan; BCWZ's form `= L_{π♯a}b − L_{π♯b}a − dπ(a,b)` | all three agree | none |
| G7.1 `ι_{a_P}ω = −μ*σ_Ω(a)` (R10 repair) | pair groupoid, `a = (v,0)`, `μ = id` | path `(x+εv,x)`, `a_P = v`, `ι_vω = ω♭v`, `σ_Ω(a) = −ω♭v` | `−` sign, as stated | none |
| G7.1 same | `Γ ↷ Γ`, `μ = t` | `a_P = dR_p a = a^R`; at a unit `Ω(a,w) = Ω(a,du dt w) = −σ_Ω(a)(dt w)` | consistent | none |
| G7.1 vs GSM 217 Prop 14.42 | `α ∈ ker dt`, `a = dι α` | theirs `σ(α)(X) = −Ω(α,du X)`; `Ω(dι α, du X) = −Ω(α, du X)`, so `σ_ours(a) = −σ_theirs(α)`; same `a_P` | `+` there, `−` here | none |
| G7.1 Lagrangian graph dimension | general | `dim Γ + dim P − dim M = dim M + dim P = ½ dim(Γ×P×P)` | consistent | none |
| G7.2 `T_zZ = (𝔞_P)^ω` | general | `ω(a_P,v) = −σ_Ω(a)(dμ v)`, `σ_Ω` iso ⇒ `(𝔞_P)^ω = ker dμ` | consistent | none |
| G7.2 `ker(i*ω) = T(Γ_ξ·z)` | general | `𝔞_P ∩ ker dμ = {a_P : ρ(a) = 0}` | isotropy directions | none |
| G7.2 `ω_red` Check (R02 repair) | pair groupoid `↷` itself, `μ = pr₁` | `Z = {ξ}×M`, `Γ_ξ = 1`, `q = pr₂`, `i*Ω = −ω`, `ω_red = −ω`; leaf form `+ω` | consistent | none |
| G7.2 `Γ ↷ Γ` dimension | `μ = t` | `ker Ω|_Z = ker dt ∩ ker ds`; `2 dim M − dim M − dim Γ_ξ` | orbit dimension | none |
| G7.3 moment map (R10 repair) | cotangent lift of left translation | `L_{ξ_P}θ = 0 ⇒ ι_{ξ_P}(−dθ) = d(θ(ξ_P))`; `θ(ξ_P)(α_g) = α_g(dR_g ξ) = ν(Ad_{g⁻¹}ξ) = (Coad_g ν)(ξ)` for `α_g = ν∘dL_{g⁻¹}` | `μ = Coad_g ν = t` of G6.3 | none |
| G7.3 vs HamiltonianSystems cotangent lift | `Z_M = (Aq,−α∘A)` | `μ_A(q,α) = α(Aq) = θ(Z_M)` | same sign | none |
| G7.3 `(T*G)_ξ` | general | `s = ν = ξ`, `t = Coad_g ξ = ξ ⇒ g ∈ G_ξ` | `= G_ξ` | none |
| G7.4 dimension | `SO(3)`, `S²_r` | `3 + 2 = 5` | consistent | none |
| `rightInvariant_bracket` | abelian `G` | `0 = −0` | not a witness; affine is | none |

## Not verifiable

- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38: paywalled
  (Springer); cited only as the classical statement behind SmoothBundlesConnections B1.0, with the
  locators SmoothBundlesConnections itself uses.
- GSM 217 (cache 820bc6d5): the sources service's extraction of the cached author's copy is empty
  (its extractor cannot open the AES-encrypted file, and the pdftotext wrapper fails for the same
  reason). The file was read through a Ghostscript text extraction of PDF pages 30–100 and 330–420
  in the reviewer's scratch directory, where every printed page cited was identified by its running
  head, so the locators above are verified but the service's own line numbers for this text are
  unavailable.

## Source issues

- none
