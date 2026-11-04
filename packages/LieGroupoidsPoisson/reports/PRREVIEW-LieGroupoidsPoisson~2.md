# Review of LieGroupoidsPoisson (pull request #1050 at a196c92)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/LieGroupoidsPoisson/README.md` (2015 lines, a full rewrite since
e11d273) and `TauCetiRoadmap/LieGroupoidsPoisson/Suggested.lean` (74 lines, two sorried theorems,
one definition). The gate passes every check at this head. No file outside the folder changed.

## Status of the previous review's findings

- **R01 (B1.0/B5.2 re-planned): repaired.** G0.1 now opens with "Regular fibres, transverse fibre
  products and the kernel distribution and kernel bundle of a submersion are consumed from
  SmoothBundlesConnections B1.0 and are not constructed here" (line 297); G3.3 consumes "B5.2's
  countability of `π₁(M,m₀)`" (line 1019); the two regular-fibre declarations are gone from
  `Suggested.lean`; the Downstream section no longer claims to supply HamiltonianReduction R3,
  MorseTheory or IntegrableSystems.
- **R02 (reciprocal supply with HamiltonianReduction): repaired**, with one residual (R02 below).
  No `*Needs:*` line names HamiltonianReduction; G4.3 states the Poisson side only; G4.6B is proved
  from G2.4 and G1.4 "No Kirillov–Kostant–Souriau form enters" (line 1343); G7.4 transports nothing
  across `W_O`.
- **R03 (reciprocal supply with ComplexKahlerGeometry): repaired.** G1.6 is stated "for an
  arbitrary constant-rank complex subbundle `E ⊆ TM ⊗ ℂ`" (line 737) and the eigenbundle
  specialisation is left to K1.
- **R04 (locators): partly repaired.** Locators verified at the text for G4.5, G5.1, G5.4, G5.5,
  G5.6, G6.1, G6.4 (see Verified sound). G2.4's locator proves the Poisson case only, and G6.2,
  G6.3, G7.1, G7.2 and G7.3 still carry no locator (R07 below).
- **R05 (`ℝ³∖{0}` attribution): repaired.** cf2011lectures line 423–438 is Example 1.18 and
  Exercise 8 on arXiv p. 14, as cited at lines 249–250.
- **R06 (process references): repaired**, except one new "now" (R09 below).
- **R07 (house shape): repaired.** 42 `### Gk.n` targets, 42 `*Needs:*` lines, 47 `**Checks.**`
  blocks, `### Examples` and `### Dependencies` in every layer, Scope, Conventions, supplier
  contracts, How to read the build, Downstream consumers, Worked examples, References.

## R01 (P2) — Left and right translations act on the wrong fibres

**Location.** `README.md` lines 231–232: "Left translation by `g` is a diffeomorphism
`s⁻¹(s(g)) → s⁻¹(t(g))` of source fibres, and right translation a diffeomorphism of target fibres";
line 781–782: "right translations, which are diffeomorphisms of target fibres".

**Claim.** `h ↦ gh` maps the source fibre over `s(g)` to the source fibre over `t(g)`; `h ↦ hg`
acts on target fibres.

**Witness.** With the stated convention (`gh` defined when `s(g) = t(h)`, `s(gh) = s(h)`,
`t(gh) = t(g)`, line 130–131), `gh` is defined for `h ∈ t⁻¹(s(g))` and lands in `t⁻¹(t(g))`: left
translation acts on target fibres. `hg` is defined for `h ∈ s⁻¹(t(g))` and lands in `s⁻¹(s(g))`:
right translation acts on source fibres. Pair groupoid, `g = (y,x)`: `h = (x,w) ↦ (y,w)` sends
`t⁻¹(x)` to `t⁻¹(y)`. The roadmap's own formulas agree with this: `a^R(g) = dR_g(a(t(g)))` (line
780) needs `R_g : s⁻¹(t(g)) → s⁻¹(s(g))`, and G6.2's `s̃(φ_g)(b) = φ_g(dL_g(b − du(ρb)))` with
`b − du(ρb)` target-vertical at `1_{s(g)}` needs `L_g : t⁻¹(s(g)) → t⁻¹(t(g))`.

**Repair.** Line 231–232: "Left translation by `g` is a diffeomorphism `t⁻¹(s(g)) → t⁻¹(t(g))` of
target fibres, and right translation by `g` a diffeomorphism `s⁻¹(t(g)) → s⁻¹(s(g))` of source
fibres." Line 781–782: "which are diffeomorphisms of source fibres". Check the G0.4 bisection
paragraph and the G2.1 construction once more against these domains (they are consistent as
written).

## R02 (P2) — The descended symplectic form on `Z/Γ_ξ` has no owner

**Location.** `README.md` lines 1844–1846: "The descended symplectic form on `Z/Γ_ξ` is
HamiltonianReduction R4's, which applies R3's generic descent to these data"; lines 80–82 and
1944–1946 say the same.

**Claim.** HamiltonianReduction R4 constructs the reduced form of a symplectic groupoid action from
G7.2's kernel and basicness data.

**Witness.** `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` on main, R4, line
297: "Consume G7.2's isotropy quotient and descended form". R4 expects the descended form from
G7.2; G7.2 points back to R4. HamiltonianReduction is a consumer of this roadmap (R1 line 22 and
65, R2 line 131, R3 line 193, R4 line 295), so its R3 descent (`descendedForm_exists`,
`descendedForm_unique`, line 200–203) cannot be cited here without a cycle. The object is unowned.

**Repair.** State the descended form in G7.2: on the quotient `q : Z → Z/Γ_ξ` of §G3.1 there is a
unique two-form `ω_red` with `q*ω_red = i*ω`; define it on `dq(u), dq(v)` by `(i*ω)(u,v)`,
well-defined by basicness, smooth through the local sections of `q` that SmoothBundlesConnections
B1.1 and B1.4 provide for the quotient charts (already consumed by §G3.1); prove `dω_red = 0` from
`q*dω_red = d(i*ω) = 0` and `q` a surjective submersion, and nondegeneracy from
`ker(i*ω) = ker dq`. Leave to HamiltonianReduction R4 only the comparison with the ordinary reduced
form of R3. Update lines 80–82 and 1944–1946 accordingly. This keeps HamiltonianReduction a pure
consumer and matches what its R4 expects.

## R03 (P2) — "Every integration is a quotient of `Σ(A)`" needs source-connectedness

**Location.** `README.md` lines 1543–1544: "Every integration `Γ` of `A` is a quotient of `Σ(A)` by
a discrete bundle of groups in its source fibres (Crainic–Fernandes, *Lectures*, Theorem 1.30,
p. 18)".

**Witness.** cf2011lectures line 592–597: Theorem 1.30 assumes `G` s-connected and produces
`F : G̃ → G` with the same algebroid, a local diffeomorphism. Counterexample without the
hypothesis: `A = 0` over `M`, `Γ = M × ℤ/2` with `s = t = pr₁` (dimension `dim M`, algebroid `0`);
`Σ(0)` is the unit groupoid `M` (G5.2 Check 3), and the unique morphism `M → M × ℤ/2` over the
identity is the unit section, not surjective.

**Repair.** "Every source-connected integration `Γ` of `A` is a quotient of `Σ(A)` by a discrete
bundle of groups in its source fibres; in general the image of `Σ(A) → Γ` is the source-connected
component of §G0.4."

## R04 (P3) — The `SO(3)` monodromy Check is off by a factor two

**Location.** `README.md` lines 1521–1523: "`N_x = 2πℤ · x/|x|`-rotations, discrete and uniformly
so on `ℝ³ ∖ {0}`"; lines 1516–1517: "`N = 0` since `G̃` is simply connected and `exp` on the centre
is injective near `0`".

**Witness.** The source-simply-connected integration of the action algebroid is `SU(2) ⋉ ℝ³`; its
isotropy at `x ≠ 0` is the stabiliser circle `U(1) ⊂ SU(2)`, in which the unit-speed rotation
generator `ξ` about `x/|x|` has period `4π` (it has period `2π` in `SO(3)`). Equivalently, in
`SO(2) → SO(3) → S²` the boundary `π₂(S²) = ℤ → π₁(SO(2)) = ℤ` is multiplication by `2` (cokernel
`π₁(SO(3)) = ℤ/2`), so `N_x = ∂(π₂(S²)) = 4πℤ·ξ`. For the first bullet, injectivity near `0` does
not give `N = 0`; what does is that `exp : Z(𝔤) → Z(G̃)⁰` is injective because the connected centre
of a simply connected Lie group is a vector group.

**Repair.** Write `N_x = 4πℤ·ξ` with `ξ` the unit-speed rotation generator (or `2πℤ` in the
`SU(2)` normalisation, stated as such), and replace "injective near `0`" by the vector-group
argument.

## R05 (P3) — Power maps of negative degree

**Location.** `README.md` line 1614: "prove that based power maps have degree `m` for every
integer `m`".

**Witness.** `z ↦ z⁻¹` is a holomorphic automorphism of the Riemann sphere, so it has degree `+1`;
`z ↦ z^m` has degree `|m|` for every integer `m`. Negative periods are not needed from power maps:
line 1612–1613 already closes the period set under negation by reversal.

**Repair.** "based power maps have degree `m` for every `m ≥ 0`" (the constant map for `m = 0`).

## R06 (P3) — Locator of Crainic–Fernandes 2003, Theorem 2.1

**Location.** `README.md` line 126 ("Theorem 2.1, p. 586"), line 1456–1457 and line 1996.

**Witness.** cf2003 line 542–556: Theorem 2.1 is on arXiv page 15, whose running head (line 543)
is Annals p. 589; the offset is confirmed by line 386–387 (arXiv p. 11 = Annals 585, where
Proposition 1.3's equation (1) sits, as cited).

**Repair.** p. 589 in all three places.

## R07 (P3) — Locators still missing or proving less than the statement (Re-raised: R04)

**Location.** G2.4 lines 867–869 ("Theorem 4.1 and Lemma 4.2, p. 63, for the cotangent algebroid;
the same argument for a general algebroid"); G6.2 (lines 1688–1699), G6.3 (lines 1719–1725), G7.1
(lines 1813–1820), G7.2 (lines 1838–1850), G7.3 (lines 1871–1876): no locator.

**Witness.** cfm2021 (Ghostscript extraction of the author's copy) line 2900–2911: Theorem 4.1
builds the orbit's smooth structure from Weinstein splitting charts, a Poisson-specific argument;
cf2011lectures line 907–909, Remark 2.14: "It remains to show that each orbit O is an immersed
submanifold … This can be proved using a local normal form theorem for Lie algebroids" (not proved
there). The cotangent groupoid, symplectic groupoid actions and the reduction identifications are
standard results with primary sources (Coste–Dazord–Weinstein 1987 for `T*Γ`; Mikami–Weinstein,
Publ. RIMS 24 (1988), for symplectic groupoid actions and the moment map).

**Repair.** For G2.4 cite a text proving the general case (the local splitting theorem for Lie
algebroids: Fernandes, *Lie algebroids, holonomy and characteristic classes*, Adv. Math. 170
(2002), or Dufour–Zung, *Poisson Structures and Their Normal Forms*, Ch. 8), by theorem number
after checking it; add locators to G6.2, G6.3, G7.1–G7.3.

## R08 (P3) — The sign difference with Crainic–Fernandes–Mărcuț is misattributed

**Location.** `README.md` lines 1276–1278 ("whose formula carries the opposite sign because its
sharp convention is the opposite of this roadmap's") and lines 2011–2013.

**Witness.** cfm2021 line 387–390 (notation table): symplectic `ι_X ω = df`, Poisson
`X_f = π♯(df) = ι_{df}π = {f,·}`. So its sharp is `π♯α = π(α,·)`, the roadmap's `β(π♯α) = π(α,β)`.
What differs is the Hamiltonian field: `X_f = +π♯df` there, `X_f = −π♯df` here (line 152), i.e.
`π♯ = +(ω♭)⁻¹` there. Computed on `(M,ω)`: with `α = ω♭u`, `β = ω♭v` and their `π♯ = (ω♭)⁻¹`,
`ω_S(u,v) = −π(α,β) = −ω(v,u) = ω(u,v)`; with `α = −ω♭u`, `β = −ω♭v` and `π♯ = −(ω♭)⁻¹`,
`ω_L(u,v) = π(α,β) = ω(u,v)`. Both leaf forms equal `ω`; for one abstract `(M,π)` they are
negatives of each other.

**Repair.** "whose formula carries the opposite sign because it attaches `X_f = π♯df` (so
`π♯ = (ω♭)⁻¹`) to a symplectic form, whereas this roadmap has `π♯df = −X_f`; the sharp map
`π♯α = π(α,·)` itself is the same."

## R09 (P3) — Process word

**Location.** `README.md` line 1942: "(R3, now SmoothBundlesConnections B1.0's)".

**Repair.** "(R3; these are SmoothBundlesConnections B1.0's)".

## R10 (P3) — The infinitesimal-action identity of G7.1 does not fix its sign

**Location.** `README.md` line 1823: "The infinitesimal action `a ↦ a_P` satisfies
`ι_{a_P} ω = μ*(σ_Ω(a))`", with `a_P` undefined.

**Witness.** With `a_P(p) = d/dε (exp(εa)·p)`, the HamiltonianSystems fundamental-field convention
of line 145: for `Γ` acting on itself by left multiplication with `μ = t`, `a_P = a^R`, and at a
unit `Ω(a,v) = Ω(a, du·dt v)` (since `(ker ds)^Ω = ker dt`), so `ι_{a^R}Ω = −t*(σ_Ω(a))` with
`σ_Ω(a)(X) = −Ω(a, du X)`. For the pair groupoid of `(M,ω)` acting on `M` with `μ = id`,
`a = (v,0)`: `a_P = v`, `ι_vω = ω♭v`, while `σ_Ω(a) = −ω♭v` (G6.1's Check). Both give
`ι_{a_P}ω = −μ*(σ_Ω(a))`. The identity as written holds for `a_P := −(fundamental field)`, which
is the algebroid-morphism convention `ξ ↦ −ξ_M` of G1.4.

**Repair.** Define `a_P` (say which of the two), and add one of the two computations above as a
Check; pin the moment-map sign of HamiltonianSystems Layer 3 (`IsMomentMap`) in the supplier
contract, since G7.3's `μ(g,ν) = Coad_g ν` depends on it.

## Verified sound

**Gate and dependency check.** The worker's gate at a196c92 passes every check (build 0). Re-run of
the dependency check on this head: `depcheck: 204 roadmaps, 1407 edges, 0 problem(s)`; no UPWARD,
CYCLE or moved line. The roadmap is at line 136 of the merge order. Every supplier is on main or
earlier in the order; HamiltonianSystems (open pull request of another author adding a new folder)
and PseudodifferentialOperators (earlier in the order, read at its open head) do not cite this
roadmap as a supplier (HamiltonianSystems: no mention; PseudodifferentialOperators line 211 names
G1.1 as its consumer).

**Lean.** `lake env lean` on `Suggested.lean`: two `declaration uses sorry` warnings, exit 0. A
scratch copy with `#check @IsDiffSubmersionAt`, `#check @submersion_iff_split_mfderiv`,
`#check @rightInvariant_bracket` inside the namespace elaborated: every binder the README states is
present (`IsManifold 𝓘(ℝ, Fin n → ℝ) ∞` on both manifolds, `ContMDiff … ∞ f`, `CompleteSpace E`,
`LieGroup I ∞ G`, `BoundarylessManifold I G`); nothing changed. Padding probe: replacing each
`sorry` by `first | rfl | simp | infer_instance | aesop` closes neither (goals remain in both
directions of the iff; `aesop` makes no progress on the bracket). Neither declaration restates a
definition or mirrors a Check. The docstring's list of non-statable headlines (G5.5, G5.4, G5.6,
G2.4, G4.5, G6.4, G7.4) is accurate at the pins: no Lie algebroid, Lie groupoid, singular foliation
or bivector carrier exists in Mathlib 6b7abb3c or Tau Ceti a91d3aa.

**Library declarations at the pin.** Mathlib: `LieModule.Cohomology.oneCochain`, `twoCochain`,
`d₁₂`, `d₂₃` (`Mathlib/Algebra/Lie/Cochain.lean` lines 36, 43, 46, 101, 123; `d₁₂ f x y =
⁅x, f y⁆ − ⁅y, f x⁆ − f⁅x,y⁆` line 116; `d₂₃ a x y z = ⁅x, a y z⁆ − ⁅y, a x z⁆ + ⁅z, a x y⁆ −
a⁅x,y⁆ z + a⁅x,z⁆ y − a⁅y,z⁆ x` line 127, term by term the README's line 668–669, and
`d₂₃ ∘ d₁₂ = 0` line 143); `LieRinehartRing`, `LieRinehartAlgebra`, `lie_smul_eq_mul'`,
`leibniz_mul_right'`, `leibniz_smul_right'` (`Algebra/LieRinehartAlgebra/Defs.lean`);
`Groupoid.vertexGroup` with `mul := x ≫ y` (`CategoryTheory/Groupoid/VertexGroup.lean` line 43,
so `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` for the roadmap's `gh = h ≫ g` is right); `Groupoid.isoEquivHom`
(`CategoryTheory/Groupoid.lean` line 97); `Subgroupoid.full` (`Subgroupoid.lean` line 584);
`Subgroupoid.vertexSubgroup`; `Codiscrete` (`CodiscreteCategory.lean` line 40); `ActionCategory`;
`SingleObj.comp_as_mul`; `TrivialLieModule.equiv` (`Algebra/Lie/Abelian.lean` line 391);
`IsEmbedding.subtypeVal`; `HasRightInverse.comp` and
`HasRightInverse.of_surjective_of_finiteDimensional` (`Analysis/Normed/Module/ContinuousInverse.lean`);
`Manifold.IsSubmersionAt` (`Geometry/Manifold/Submersion.lean`); `IsDiffImmersionAt`
(`ImmersionDiff.lean`); `Manifold.IsSmoothEmbedding` (`SmoothEmbedding.lean`);
`VectorField.mpullback_mlieBracket`. Tau Ceti: `SmoothTwoForm` (`TwoForm/Basic.lean` line 61),
`IsContMDiffDistribution`, `mvfderiv_mlieBracket`, `isLocalDiffeomorphAt_of_mfderiv_eq`,
`extChartPartialDiffeomorph`, `leftInvariantDerivationLieEquivGroupLieAlgebra`,
`mulRightInvariantVectorField` (`RightInvariantVectorField.lean` line 72), `levelSetChartedSpace`
and `isManifold_levelSet` (`Analysis/Fredholm/LevelSet`, Fredholm as the README says).

**Cross-roadmap citations resolved.** On main: SmoothBundlesConnections B1.0 (lines 221–236: regular
fibre as `{x // f x = c}`, model `Fin (dim X − dim N) → ℝ`, `exists_regularFiber_smoothEmbedding`,
no Hausdorff hypothesis), B1.1 (division map, local sections, descent of invariant maps, lines
315–351), B1.2 (`p·g = g⁻¹p` conversion, line 369), B1.4 (free proper quotient, line 421–432), B2.1
(complexification, exterior powers, Hom bundles, lines 559–566), B3.2 (`j(ξ) = −V_ξ`,
`[s(X),s(Y)] − s([X,Y]) = j(F(X,Y))`, "LieGroupoidsPoisson owns the resulting Lie algebroid
structure", lines 906–914), B5.2 (deck action `[a]·[γ] = [γ.trans a]` line 1222, countability of
`π₁` lines 1227–1235); DifferentialGeometry 0.1, 0.2, 0.4 (`legacySmoothTwoFormEquiv`, its
evaluation law, `legacySmoothTwoFormEquiv_isClosed_iff`, lines 294–310), Layers 1, 3, 4, 5, 6, 8.3,
10.1 (`IsRegularPoint`, `IsRegularValue`), 10.3–10.4, 12.1 (`nonempty_contMDiffRiemannianMetric`);
CotangentLagrangian C1 (`ω = −dθ`, line 186); LieGroups Layers 0–5 (headings at lines 233–358);
AlgebraicTopology Stage 1 (line 289); Completed/UniversalCovers; Completed/HopfRinow Layer 1 (line
264); HamiltonianReduction R1–R4 as consumers (lines 22, 65, 131, 139, 193, 295, all citing this
roadmap, none consumed here); ComplexKahlerGeometry K8 consumes G1.3 (lines 1551, 1683);
CharacteristicClasses C5a (lines 121, 1149); OperatorAlgebraDynamics D5 (lines 59, 279);
Orbifolds (line 48–50, G0 and G3.5 bibundles); LieHighestWeight (line 488, G4.6A positive
Lie–Poisson); ContactGeometry (line 255); IntegrableSystems (line 17), ReductiveGroups (line 357)
and RiemannianGeometry still cite "LieGroupoidsPoisson G0.1" for regular fibres and `π₁`
countability, which the Downstream section correctly redirects to B1.0 and B5.2 (their stale
citations are those roadmaps' to update). At open heads: HamiltonianSystems (#480) Standing
conventions `ι_{X_F}ω = dF`, `{F,G} = dF(X_G)`, `X_{{F,G}} = −[X_F,X_G]`,
`(⁅Z,Z'⁆)_M = −[Z_M,Z'_M]`, canonical model `ω((q,α),(q',β)) = βq − αq'` with Hamiltonian fields
`(∂H/∂α, −∂H/∂q)` (lines 47–60), Layer 1 `IsHamiltonianVectorField`, `poissonBracket`, Layer 3
`IsMomentMap`; PseudodifferentialOperators (#952) P1.0 lines 151–211, 319 (`IsScalarTower`,
`SMulCommClass`, `(u+iv)·s = u·s + v·(Js)`). The resolver found no dangling citation and no
dangling Lean name.

**Ownership.** `roadmaps grep` over the 433 open pull requests and main for "Lie algebroid", "Lie
groupoid", "symplectic groupoid", "Weinstein groupoid", "A-homotopy", "Poisson bivector",
"Schouten bracket", "cotangent groupoid", "bibundle": every hit outside this roadmap is a consumer
or a deferral (GeometricQuantization #1186 line 862: "Poisson geometry and symplectic groupoids
belong to LieGroupoidsPoisson"; FormalConnectionsOpers #1056 line 1039 names an algebroid of its
own conormal Lie–Rinehart algebra, not a generic carrier). No other open roadmap builds these
objects.

**Sampled sources** (every locator read at the text). cf2003 (arXiv math/0105033, Annals offset
574, confirmed by the running heads at lines 387 and 543): Lie II line 167–170 (p. 579), Proposition
1.3 with equation (1) `∂_t b − ∂_ε a = T_∇(a,b)`, `b(ε,0) = 0`, line 382–389 (p. 584–585), Theorem
2.1 line 552–556 (p. 589, see R06), Example 3.7 line 852–862 (p. 597; bracket and period group as
in G5.6), Theorem 4.1 line 1013–1016 (p. 600; (i) `r(x) ≠ 0`, (ii) `liminf r(y) > 0`), Example 4.2
line 1019–1022 (p. 600), Proposition 4.7 line 1154–1163 (p. 604; four assertions, codimension
`n + k`), Lemma 4.9 line 1251–1252 (p. 606; transversal meeting each leaf at most once).
cf2011lectures (arXiv math/0611259): Example 1.18 and Exercise 8 line 423–438 (p. 14), Theorem
1.30 line 592–597 (p. 18, s-connected hypothesis), Theorem 2.19 line 997–1000 (p. 27, Lie II),
Theorem 4.1 line 2211–2217 (p. 55) and Theorem 4.2 line 2233–2237 (p. 56). cf2004 (arXiv
math/0210152): Theorem 2 line 166–170, Proposition 4 line 710–714 (Lagrangian graph ⇔
`m*ω = π₁*ω + π₂*ω`), Theorem 5 line 763–771 (uniqueness of the s-simply-connected symplectic
integration). bcwz2004 (arXiv math/0303180, p. 8): Remark 2.3 line 348–350 (left-invariant
convention makes `s` Dirac), Theorem 2.5 line 366–372 (the two IM identities with
`L_α ρ*(β) − L_β ρ*(α) + d⟨ρ*(α),ρ(β)⟩`, as the README says; its `ρ*_ω(α)(X) = ω(α,X)` is the
roadmap's `σ_Ω` up to the global sign that both identities are linear in). blohmann2008 (arXiv
math/0702399): Proposition 2.11 line 298–300 (p. 7) and Proposition 2.12 line 351–352 (p. 8).
cfm2021 (author's preliminary copy, AMS permission on each page; the sources service produced a
0-page extraction, so the cached PDF was extracted to scratch with Ghostscript, pages 1–120):
Theorem 2.8 line 1391 (p. 26, Schouten bracket characterised by (i)–(iii)), Theorem 3.2 (Weinstein
splitting, p. 44, `π = Σ ∂_{p_i} ∧ ∂_{q_i} + Σ θ_{ab}(y) ∂_{y_a} ∧ ∂_{y_b}`, `θ(0) = 0`), Theorem
4.1 and Lemma 4.2 line 2900–2911 (p. 63; `ω_S(π♯α,π♯β) = −π(α,β)`), Theorem 4.13 line 3233 (p. 69,
regular Poisson structures ↔ symplectic foliations), notation table line 387–390 (R08).

**Seeded sample.** G1.3a: the CE formula at line 636 and the degree-two comparison at line
668–669 match Mathlib's `d₁₂`, `d₂₃` term by term (above); the sign check "`d₂₃ ∘ d₁₂ = 0` fails
with the opposite sign on the bracket terms" is `d₂₃_comp_d₁₂` at the pin. G4.2a: the adapter
equation matches HamiltonianSystems' `ι_{X_F}ω = dF`; on its canonical model
`ω(X_H,(q',β)) = β(∂H/∂α) + (∂H/∂q)q' = dH(q',β)` ✓, `ω = dq∧dp`, `X_q = −∂_p`, `X_p = ∂_q`,
`{q,p} = dq(X_p) = 1` ✓; DifferentialGeometry 0.4 supplies `legacySmoothTwoFormEquiv` and the
closedness comparison ✓; HamiltonianReduction R1 consumes exactly this (line 22). G4.6A: `A = TM`,
`{p_x, x} = −p*(∂_x x) = −1`, so `{x,p_x} = 1` = the canonical bracket of G4.2 ✓; group over a
point: algebroid bracket `−[ξ,η]` (G2.2), minus convention gives `{ℓ_ξ,ℓ_η} = ℓ([ξ,η])` ✓ (positive,
as HamiltonianReduction R2 line 131 and LieHighestWeight line 488 require); Jacobi of the minus
convention is the cyclic sum `ℓ(Jacobi) = 0` ✓; affine algebra `{x,y} = y` ✓. G4.6B:
`dℓ_η(π♯dℓ_ξ) = {ℓ_ξ,ℓ_η} = ν([ξ,η])`, so `π♯dℓ_ξ = ν∘ad_ξ`; `ξ_{𝔤*}(ν) = d/dt ν∘Ad_{exp(−tξ)} =
−ν∘ad_ξ`; hence `π♯dℓ_ξ = −ξ_{𝔤*}` ✓ = the anchor `ξ ↦ −ξ_M` of G1.4 on `dℓ_ξ ↦ ξ`; bracket
`[dℓ_ξ,dℓ_η]_π = dℓ_{[ξ,η]}` ✓; on `𝔰𝔬(3)*`, `ν([ξ,η]) = ν·(ξ×η) = η·(ν×ξ)`, so `π♯dℓ_ξ = ν×ξ =
−(ξ×ν)` ✓; `ℝ ⋊ ℤ/2`: `𝔤 = ℝ` abelian, `π = 0`, point leaves, coadjoint orbit `{ν,−ν}` ✓;
affine dual: leaves of `{x,y} = y` are the half-planes and axis points, the orbits of the
connected affine group ✓.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| G0.2 translation bullet | pair groupoid, `g = (y,x)` | `h ↦ gh` defined on `t⁻¹(x)`, lands in `t⁻¹(y)`; `h ↦ hg` on `s⁻¹(y)`, lands in `s⁻¹(x)` | bullet swaps source/target | R01 |
| G0.2 `dim Γ ≥ dim M`, equality iff étale | unit, pair groupoid | `n = n`, `2n > n` | consistent | none |
| G0.4 `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` | `SingleObj S₃` | `vertexGroup`: `x * y = x ≫ y`; roadmap: `gh = h ≫ g = g * h` | opposite | none |
| G1.1 Check 4 | `ρ(∂_x) = x∂_x` | `[f∂_x,g∂_x] = x(fg' − gf')∂_x`; `ρ([·,·]) = x²(fg'−gf')∂_x = [xf∂_x, xg∂_x]` | consistent | none |
| G1.2 negation morphism | `𝔰𝔬(3)` | `[−a,−b] = [a,b] ≠ −[a,b]` | consistent | none |
| G1.3 `d₂₃` formula | Mathlib line 127 | six terms equal, signs `+,−,+,−,+,−` | equal | none |
| G1.3 `𝔰𝔬(3)` | `e₃*` | `d(e₃*)(e₁,e₂) = −1`, `H¹ = 0`; abelian `ℝ³`: `H¹ = ℝ³` | consistent | none |
| G1.4 affine anti-homomorphism | `x∂_x, ∂_x` | `[x∂_x,∂_x] = −∂_x = −([e₁,e₂])_ℝ` | consistent | none |
| G2.2 `rightInvariant_bracket` | affine group | left: `[a∂_a, a∂_b] = a∂_b` so `[e₁,e₂] = e₂`; right: `[a∂_a + b∂_b, ∂_b] = −∂_b = −e₂^R` | true, sign forced | none |
| G2.4 Lectures Remark 2.14 | general algebroid | source defers the immersed-orbit proof | locator proves less | R07 |
| G3.1 dimension | Hopf `S¹ ↷ S³` | `3 − 0 − 1 = 2` | consistent | none |
| G3.3 `(ℝ×ℝ)/ℤ ≅ S¹×ℝ` | `(a,b) ↦ (a mod 1, b − a)` | invariant under `(a+n,b+n)` | consistent | none |
| G4.1 `[π,f] = −π♯df` | `π = ∂_x∧∂_p`, `f = x` | `[x,π] = [x,∂_x]∧∂_p − ∂_x∧[x,∂_p] = −∂_p`; `[π,x] = [x,π]` (degrees 2,0); `π♯dx = ∂_p` | consistent | none |
| G4.1 non-Poisson bivector | `∂_x∧∂_y + y∂_y∧∂_z` | cyclic Jacobi sum `= {x,y} = 1` | consistent | none |
| G4.2 Check 1 | `ω = dx∧dp` | `ω♭∂_p = −dx`, `−(ω♭)⁻¹dx = ∂_p = π♯dx`; `{x,p} = 1` both sides | consistent | none |
| G4.2 diagonal | `f = pr₁*x, g = pr₂*y` | `{f,g} = 0`, `{f∘Δ,g∘Δ} = {x,y}` | Poisson iff `π = 0` | none |
| G4.2a adapter | canonical model | `ω(X_H,(q',β)) = β(∂H/∂α) + (∂H/∂q)q' = dH(q',β)` | consistent with `+df` | none |
| G4.3 Casimir on `𝔰𝔬(3)*` | `|ν|²` | `ν·(2ν×ξ) = 0` | consistent | none |
| G4.3 `π♯df` on the plane | `u = x` | `π♯df = x(f_x∂_y − f_y∂_x)` | consistent | none |
| G4.4 degree-zero agreement | general | `(π♯α)f = π(α,df)`; `α(−π♯df) = −π(df,α) = π(α,df)` | consistent | none |
| G4.5 leaf form sign | `∂_x∧∂_p` | `ω_L(∂_p,−∂_x) = 1` ⇒ `ω_L = dx∧dp` | consistent | none |
| G4.5 vs cfm2021 Thm 4.1 | `(M,ω)` | both conventions give leaf form `ω`; `π` differs by sign | reason misstated | R08 |
| G4.5 plane | `u∂_x∧∂_y` | `π♯dx = u∂_y`, `π♯dy = −u∂_x`, `ω_L = (1/u)dx∧dy` | consistent | none |
| G4.6A | `TM`, point group, affine | `{x,p_x} = 1`; `−ℓ(−[ξ,η]) = ℓ[ξ,η]`; `{x,y} = y` | consistent | none |
| G4.6B | `𝔤*`, `𝔰𝔬(3)*`, `ℝ⋊ℤ/2` | `π♯dℓ_ξ = ν∘ad_ξ = −ξ_{𝔤*}`; `ν×ξ`; orbit `{ν,−ν}`, two leaves | consistent | none |
| G5.1 `A = 𝔤` homotopy | constant paths `0`, `ξ` | endpoints `1`, `exp ξ` in `G̃` | consistent | none |
| G5.2 codimension | `TM` on `ℝⁿ`, `𝔤`, `0` | `2n`, `dim 𝔤`, `dim M` = `dim M + rank A` | consistent; cf2003 4.7(ii) | none |
| G5.3 `SO(3) ↷ ℝ³` | `x ≠ 0` | `SU(2)_x = U(1)`, period of unit rotation `4π`; `∂: π₂(S²) → π₁(SO(2))` is `×2` | Check says `2π` | R04 |
| G5.3 `𝔤` over a point | `𝔤 = ℝ` | `N = ker(exp|_{Z(𝔤)}) = 0` (vector group) | true, reason weak | R04 |
| G5.4 Theorem 1.30 | `A = 0`, `Γ = M×ℤ/2` | `Σ(0) = M → Γ` not surjective | needs s-connected | R03 |
| G5.4 `−φ∘(−id)` | `φ : 𝔤 → 𝔥` | `= φ` | consistent | none |
| G5.4 holonomy of `x dy` | unit square | `exp(∓∫dx∧dy) = e^{∓1}` | consistent | none |
| G5.5 criterion | cf2003 Thm 4.1, Lectures 4.1/4.2 | `r(x) > 0`, `liminf r(y) > 0`; `N ∩ U = {0}` locally | consistent | none |
| G5.6 Jacobi | cyclic sum | `dη(X,Y,Z)` | iff `dη = 0` | none |
| G5.6 square identity | `b(ε,0) = b(ε,1) = 0` | `∫a⁰(1,·) − ∫a⁰(0,·) = −∫γ*η` | consistent with cf2003 line 388, 855 | none |
| G5.6 degree of `z^m` | `m = −1` | `z ↦ 1/z` holomorphic, degree `+1` | false for `m < 0` | R05 |
| G5.6 periods | degrees `(1,0)`, `(0,1)`, `λ = p/q` | `1`, `λ`, group `(1/q)ℤ` | consistent | none |
| G6.1 `σ_Ω` on the pair groupoid | `a = (v,0)` | `σ_Ω(a) = −ω♭v`, `π♯σ_Ω = −(ω♭)⁻¹(−ω♭) = id` | consistent | none |
| G6.1 base Poisson signs | `Ω = pr₁*ω − pr₂*ω` | `pr₁` Poisson onto `−(ω♭)⁻¹`, `pr₂` anti | consistent, bcwz Rem 2.3 | none |
| G6.2 pair groupoid `T*` | `g = (y,x)` | `b − du(ρb) = (0,−b)`, `s̃(α,β) = −β`; product `(α₁,β₂)` with `α₂ = −β₁` | consistent | none |
| G6.3 affine `Ad` | `(a,b)(1,t)(a,b)⁻¹ = (1,at)` | `Ad_{(a,b)⁻¹}e₂ = a⁻¹e₂` | consistent | none |
| G6.3 left trivialisation | `α_g = ν∘dL_{g⁻¹}` | `t(α_g)(ξ) = ν(Ad_{g⁻¹}ξ)` | consistent with HR R4 line 295 | none |
| G6.4 IM identities | `σ = id` | `⟨a,π♯b⟩ = π(b,a) = −⟨b,π♯a⟩`; Koszul = `L_{π♯a}b − ι_{π♯b}da` after Cartan | consistent, bcwz line 370–371 | none |
| G6.4 `Ξ_Ω` sign | `θ = p dx`, `Ω = pr₁*ω − pr₂*ω` | `ω_can = dx∧dp`; `σ_Ω = −ω♭`, `π♯σ_Ω = id` | consistent | none |
| G7.1 `ι_{a_P}ω = μ*σ_Ω(a)` | `Γ ↷ Γ`, pair groupoid `↷ M` | `ι_{a^R}Ω = −t*σ_Ω(a)`; `ι_vω = ω♭v = −σ_Ω(a)` | sign depends on `a_P` convention | R10 |
| G7.2 descended form | HR R4 line 297 | R4 consumes it from G7.2; G7.2 assigns it to R4 | unowned | R02 |
| G7.2 Check 3 | `Γ ↷ Γ`, `μ = t` | `ker(Ω|_Z) = ker dt ∩ ker ds`; `dim = dim M − dim Γ_ξ` | consistent | none |
| G7.4 dimension | `SO(3)`, `S²_r` | `3 + 2 = 5` | consistent | none |
| `submersion_iff_split_mfderiv` | `m = 0`, discontinuous `f` | RHS true, LHS false without `hf` | `hf` needed, present | none |
| `rightInvariant_bracket` | abelian `G` | `0 = −0` | not a witness; affine case is | none |

## Not verifiable

- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38: paywalled
  (Springer); cited only as the classical statement behind SmoothBundlesConnections B1.0, with the
  same locators SmoothBundlesConnections uses.
- cfm2021, GSM 217: the sources service's extraction of the cached PDF is empty (its extractor
  cannot open the AES-encrypted file); the author's copy was read through a Ghostscript text
  extraction of pages 1–120 in the reviewer's scratch directory, so the locators above are
  verified, but the service's own line numbers for this text are unavailable.
- Primary sources for G6.2, G6.3 and G7.1–G7.3 (Coste–Dazord–Weinstein; Mikami–Weinstein): not
  cited by the README, so not fetched; R07 asks for the locators.

## Source issues

- none
