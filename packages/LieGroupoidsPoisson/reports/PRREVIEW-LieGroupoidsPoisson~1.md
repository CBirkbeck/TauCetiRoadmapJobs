# Review of LieGroupoidsPoisson (pull request #1050 at e11d273)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/LieGroupoidsPoisson/README.md` (1166 lines) and
`TauCetiRoadmap/LieGroupoidsPoisson/Suggested.lean` (100 lines, four sorried theorems). The gate at
this head passes every check. The findings below are ordered by severity.

## R01 (P1) — G0.0/G0.1 re-plan SmoothBundlesConnections B1.0 and B5.2, which are on main

**Location.** `README.md` lines 174–262 (G0.1: line 174 "Own the map-level regular fiber", line 210 "Build the
transverse fiber product", line 241 "Construct the smooth constant-rank kernel distribution of every such
submersion … (`submersionKernel_smooth`)"), lines 157–165 (G0.0: "separately prove that
`π₁(M,m₀)` is countable"), lines 1084–1086 ("G0.1 … supplies SBC B1.1/B1.5, HamiltonianReduction R3,
MorseTheory M2 and IntegrableSystems with regular fibers and fiber products");
`Suggested.lean` lines 50–90 (`exists_regularFiber_manifold`, `submersionKernel_smooth`).

**Claim.** This roadmap owns the regular fibre of a smooth map (no Hausdorff hypothesis, fibre may
be empty, model `Fin (dim X − dim M) → ℝ`, route through `exists_isManifold_sectionZero_of_contMDiff`
and `extChartPartialDiffeomorph`), the transverse fibre product, the kernel distribution of a
submersion with its `ContMDiffVectorBundle` structure and pullback, and the countability of `π₁` of a
connected second-countable manifold; and it supplies these to SmoothBundlesConnections.

**Witness.** `TauCetiRoadmap/SmoothBundlesConnections/README.md` on main (fa41b37), section
"B1.0 Regular fibres, fibre products and kernel distributions of submersions" (lines 221–314),
states exactly these three constructions, with the same hypotheses, the same model, the same route
and the same Lee locators, and its `Suggested.lean` line 69 declares
`exists_regularFiber_smoothEmbedding` with the statement of this roadmap's
`exists_regularFiber_manifold` (more general models). SBC's Conventions (line 112) say B1.0 is
stated without Hausdorffness "because LieGroupoidsPoisson applies them to non-Hausdorff arrow
manifolds", and its Downstream consumers (lines 1929–1931) say LieGroupoidsPoisson *consumes*
"B1.0's regular fibres, fibre products and kernel distributions". SBC B5.2 (line 1227) owns the
`π₁` countability theorem, with the same proof sketch as G0.0, and lists LieGroupoidsPoisson as a
consumer (line 1240). A roadmap on main is existing work: it is built on, never re-planned; two
owners for one object is a design defect.

**Repair.** In G0.0 delete the countability lemma and cite SmoothBundlesConnections B5.2 at the
point of use (G3.3). In G0.1 delete the regular-fibre, transverse-fibre-product and
kernel-distribution/kernel-bundle constructions and cite SmoothBundlesConnections B1.0 by name,
including `exists_regularFiber_smoothEmbedding` in the supplier contracts; keep what SBC assigns to
this roadmap (line 81–83): the `IsDiffSubmersionAt` comparison, the constant-rank theorem, bracket
naturality for related fields and the smooth-subbundle API. Rewrite the "Dependency order" paragraph
so that B1.0 supplies G0, and delete the claims that G0.1 supplies SBC B1.1/B1.5, HamiltonianReduction
R3, MorseTheory M2 and IntegrableSystems (MorseTheory on main does not cite this roadmap). In
`Suggested.lean` delete `exists_regularFiber_manifold` and `submersionKernel_smooth` and rewrite the
module docstring accordingly; `submersion_iff_split_mfderiv` and `rightInvariant_bracket` stay (no
owner on main or at the pins: `TauCeti/Geometry/Lie/InvariantVectorField/Commutation.lean` has only
the mixed right–left bracket `mlieBracket_mulRightInvariantVectorField_mulInvariantVectorField = 0`,
lines 199–239).

## R02 (P2) — Reciprocal supply with HamiltonianReduction

**Location.** `README.md` G4.3 (lines 652–660, "Consume HamiltonianReduction R1's … exact
sequence"), G4.6B (lines 693–702, "consume HamiltonianReduction R2's KKS construction"), G7.2
(lines 1043–1050, "Consume HamiltonianReduction R3's generic `descendedForm_exists` and
`descendedForm_unique`"), G7.4 (lines 1061–1080, "consume its transverse fiber-product manifold
`W_O` … R3's diffeomorphism `Φ`").

**Claim.** HamiltonianReduction R1, R2 and R3 are suppliers of G4.3, G4.6B, G7.2 and G7.4.

**Witness.** `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md` on main consumes this
roadmap: line 22 (R1 consumes G4.2a's adapter equation), line 65 (R1: "The comparison with `π♯df`
is proved by LieGroupoidsPoisson G4.3"), line 131 (R2 takes the sharp convention from G4.6A), line
139 (R2: "LieGroupoidsPoisson G4.6B owns that theorem"), line 193 (R3 consumes
"LieGroupoidsPoisson G0.1"), line 295 (R4 uses the cotangent groupoid `T*G` and "Consume G7.2's
isotropy quotient"). Two roadmaps citing each other is defect class 14, whatever the target-level
interleaving; the depcheck does not see it because the README has no `*Needs:*` lines and the
reverse edges live on main. The README's own "Dependency order" paragraph (lines 1008–1013)
choreographs the interleaving, which is the defect, not a mitigation.

**Repair (minimal, on this side).** (a) G4.3: drop the citation of R1's sequence; state on this
roadmap's carrier, from HamiltonianSystems Layer 1 only, that `f ↦ π♯df = −X_f` is a Lie
homomorphism `C∞(M) → 𝔛(M)` with kernel the locally constant functions and image in the symplectic
fields; R1 on main already consumes that statement. (b) G4.6B: prove "connected Lie–Poisson leaf =
immersed `G⁰`-coadjoint orbit" from G2.4 applied to the transformation algebroid of the coadjoint
action (G1.4) and the cotangent algebroid of G4.6A (`π♯dℓ_ξ` is the fundamental field of `ξ` up to
the pinned sign, so the anchor image is the orbit tangent), without the KKS form; the comparison of
the leaf form with KKS moves to HamiltonianReduction R2/R4 and is listed under ownership. (c) G7.2:
keep only the owned input (kernel of the restricted form is the isotropy-orbit tangent distribution
and equals `ker dq`; closedness and basicness of `i*ω`), and leave the descended form to R4, which
consumes R3's descent on main. (d) G7.4: keep the identification of `G⋉O` with the endpoint
restriction of `T*G` (G3.4/G6.3) and delete the transport across R3's `W_O` and `Φ`, which is R4's
comparison. Then no `HamiltonianReduction` section is consumed anywhere.

## R03 (P2) — Reciprocal supply with ComplexKahlerGeometry

**Location.** `README.md` G1.6 (lines 424–442, "consume SBC B2's tangent complexification and CK
K1's `+i` and `-i` eigenbundles … With ComplexKahlerGeometry's Nijenhuis/NN equivalences deduce the
integrability equivalence"); lines 393–410 and 1107 (the standalone CE complex "consumed by ComplexKahlerGeometry K8").

**Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` on main line 1551 and 1683 consume
"LieGroupoidsPoisson G1.3" (the standalone Lie-algebra Chevalley–Eilenberg complex), and line 190
says LieGroupoidsPoisson consumes K1's eigenbundle/involutivity dictionary. Same defect class as R02.

**Repair.** G1.6 states the subalgebroid/involutivity equivalence for an arbitrary constant-rank
complex subbundle of `TM⊗ℂ`, built on SBC B2's complexification and this roadmap's ℂ-linear
kernel/image API, with no citation of K1; the specialisation to the `±i` eigenbundles of an
almost-complex `J` and the Newlander–Nirenberg comparison are deleted here and listed under
ownership as ComplexKahlerGeometry's (K1 owns eigenbundles and NN and may consume G1.6's general
statement). Keep G1.3's standalone complex, which K8 cites.

## R04 (P3) — Theorems without locators

**Location.** `README.md` G2.4 (Stefan–Sussmann orbit theorem), G4.5 (Weinstein splitting),
G5.4 (Lie II and uniqueness), G5.5 (the integrability criterion is stated without its theorem
number), G5.6 (the `S²×S²` example), G6.1 (Lagrangian graph, anti-symplectic inversion, base
Poisson structure, `dim Γ = 2 dim M`), G6.2–G6.3 (cotangent groupoid), G6.4 (closed IM two-forms
and the tangent-prolongation cocycle), G7.1–G7.2.

**Witness (verified locators the author can use).** cf2003 line 1013–1016: Theorem 4.1 (Annals
p. 600; the arXiv text's page number plus 574 is the Annals page, checked on Prop 4.7 = p. 604 and
Lemma 4.9 = p. 606), stating (i) `N_x(A)` discrete, (ii) `liminf_{y→x} r(y) > 0`, as in G5.5; cf2003
line 388: Proposition 1.3, equation (1) `∂_t b − ∂_ε a = T_∇(a,b)`, `b(ε,0) = 0`, as in G5.1; cf2003
line 852–862: Example 3.7, the central extension bracket and `N_x = ` periods of `ω`, as in G5.6;
cf2003 line 1019–1022: Example 4.2, non-integrability from a noncyclic period group; cf2004 line
166–170 and 763–771: Theorem 2 and Theorem 5 (integrable by a symplectic groupoid ⇔ `T*M`
integrable ⇔ monodromy locally uniformly discrete, with uniqueness of the s-simply-connected
symplectic integration), as in G6.4; cf2004 line 710: Proposition 4 (Lagrangian multiplication
graph ⇔ multiplicativity), for G6.1; bcwz2004 line 366–372: Theorem 2.5 (closed IM two-forms ⇔
multiplicative closed two-forms on an s-simply-connected integration), the source of G6.4's
construction, with Remark 2.3 (line 348) fixing "target Poisson, source anti-Poisson" for the
right-invariant convention, as in G6.1. The IM identities at bcwz2004 line 370–371 agree with G6.4's
two displayed identities after `L_{ρ(b)}σ(a) = ι_{ρ(b)}dσ(a) + d⟨σ(a),ρ(b)⟩` (computed below).

**Repair.** Add these locators at the claims; for G2.4 and G4.5 cite Crainic–Fernandes–Mărcuț
(leaf theorem and splitting theorem) by theorem number, for G5.4 cite cf2003 or the Crainic–Fernandes
lectures (R05) by theorem number.

## R05 (P3) — The `ℝ³∖{0}` example is attributed to the wrong text

**Location.** `README.md` lines 1129–1131 and 1162–1166 ("Crainic–Fernandes–Mărcuț, *Lectures on
Poisson Geometry*, §1, Example 1.18 and Exercise 8").

**Witness.** The author copy of GSM 217 (cfm2021, chapters 1–2 read) uses "Problems", not
exercises, and its chapter 1 is "Poisson brackets"; it has no Example 1.18 of that kind.
cf2011lectures line 423–438 (M. Crainic and R. L. Fernandes, *Lectures on integrability of Lie
brackets*, arXiv math/0611259, p. 14; Geom. Topol. Monogr. 17 (2011)) is Example 1.18 "The
fundamental groupoid of a foliation" followed by Exercise 8: "the smooth foliation of `ℝ³−{0}` by
horizontal planes … `Π₁(F)` is not Hausdorff".

**Repair.** Cite the lectures (arXiv id or the Geometry & Topology Monographs volume) with
Example 1.18 and Exercise 8, and keep GSM 217 for the Poisson foundations only.

## R06 (P3) — Process references in the README

**Location.** `README.md` lines 142–148 ("Mathlib #41039 proposes … when its API is available,
consume it … regardless of that proposal's merge status"), line 154 ("Use Mathlib #41039's
categorical total-arrow shape"), line 239 (a link to a Zulip design discussion), line 95 ("on its
current `SmoothTwoForm` carrier").

**Witness.** House style: timeless, no pull-request numbers or merge status, no process narrative.

**Repair.** Describe the shape in mathematical terms (topology on objects and on the total arrow
type, categorical hom-types) without the pull-request number or the discussion link; replace
"current" by "pinned".

## R07 (P3) — README shape: no Checks, no `*Needs:*` lines, no `### k.n` targets

**Location.** Whole `README.md`: the sections are `## Conventions and ownership`, `## Pinned
substrate …`, `## G0.` … `## G7.`, `## Dependency order and acceptance`, `## References`, each layer
a numbered list.

**Witness.** The house shape (Scope and ownership, Conventions, Exact supplier contracts, How to
read the build, `## Layer k:` with `### k.n` prose targets each ending in a `*Needs:*` line, API
bullets, `**Checks.**` with at least three discriminating checks per definition, `### Examples`
and `### Dependencies` per layer, Downstream consumers). Here every definition (Lie algebroid, A-path
and A-homotopy, monodromy group, symplectic groupoid, cotangent groupoid, bibundle, Poisson bivector,
algebroid representation) has zero Checks, and the sign witnesses that the Conventions rely on
(`σ_Ω = −ω♭` on the pair groupoid, `{x,p} = 1` for the tangent-algebroid dual, the `u ∂x∧∂y`
plane) are prose remarks rather than Checks. Without `*Needs:*` lines the dependency check reads no
edge of this roadmap at all (it reported 0 problems as-is and 0 problems with every supplier
spelled out on a scratch copy, so no UPWARD or CYCLE line exists; the reciprocal pairs of R02–R03
are invisible to it).

**Repair.** Recast into the house shape; one `*Needs:*` line per target; three Checks per
definition, including the computed witnesses listed in the adversarial table below (each is a
ready-made Check).

## Verified sound

**Gate.** Every check passes at e11d273 (depcheck 0 problems; build 0). Re-run of the
dependency check: `depcheck: 204 roadmaps, 1404 edges, 0 problem(s)`; on a scratch copy with an
added `*Needs:*` line naming DifferentialGeometry 0.4, SmoothBundlesConnections B1.4,
HamiltonianSystems Layer 1, HamiltonianReduction R1, CotangentLagrangian, LieGroups Layer 4,
ComplexKahlerGeometry K1, PseudodifferentialOperators P1.0, HopfRinow Layer 1, AlgebraicTopology,
UniversalCovers, OperatorAlgebraDynamics D5, MorseTheory M2, IntegrableSystems, QuantumFoundations
and FormalConnectionsOpers: `1410 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. The
roadmap sits at line 136 of the merge order; every supplier is on main or earlier in the order
(PseudodifferentialOperators at line 8), except HamiltonianSystems, which is another author's open
pull request adding a new folder (allowed) and does not cite this roadmap.

**Lean.** `lake env lean` on `Suggested.lean`: exactly four `declaration uses sorry` warnings, exit
0. A scratch file with `#check @` for all five declarations elaborated; the elaborated types carry
every binder the README states (`IsManifold … ∞` on both manifolds, `ContMDiff` on `f`,
`CompleteSpace E`, `LieGroup I ∞ G`, `BoundarylessManifold I G`); nothing changed. Padding probe:
replacing each `sorry` by `first | rfl | simp | infer_instance | aesop` closes none of the four.
Mathlib's `GroupLieAlgebra` bracket (`GroupLieAlgebra.bracket_def`) is the value at `1` of
`mlieBracket` of left-invariant fields under `LieGroup I (minSmoothness 𝕜 3) G`
(`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean` lines 93–100, 230); Tau Ceti's
`mulRightInvariantVectorField v g = mfderiv I I (· * g) 1 v`
(`TauCeti/Geometry/Lie/RightInvariantVectorField.lean` line 72); `Manifold.IsSubmersionAt` is the
chart normal form `(u,v) ↦ u` with both charts in the `C^n` maximal atlas
(`Mathlib/Geometry/Manifold/Submersion.lean` lines 121–173, `LocalSourceTargetProperty.lean` lines
76–89), so the forward direction of `submersion_iff_split_mfderiv` needs no smoothness hypothesis
and the backward direction needs `hf`, which is present; `Manifold.IsSmoothEmbedding` is
`IsImmersion ∧ IsEmbedding` (`SmoothEmbedding.lean` line 72); `TauCeti.IsContMDiffDistribution I n k D`
asks for a `C^n` local frame of `k` fields near every point (`Distribution.lean` line 163).
`LieModule.Cohomology.d₁₂ : oneCochain →ₗ twoCochain` and `d₂₃ : twoCochain →ₗ L →ₗ L →ₗ L →ₗ M`
exist at the pin with the trilinear codomain the README says. Every Mathlib name the README cites
exists at the pin: `Groupoid.vertexGroup` with `mul := x ≫ y` (`VertexGroup.lean` line 43),
`SingleObj.comp_as_mul : f ≫ g = g * f` (`SingleObj.lean` line 76), `Subgroupoid.full` (arrows with
both endpoints in `D`, `Subgroupoid.lean` line 584), `Groupoid.isoEquivHom`,
`Subgroupoid.vertexSubgroup`, `ActionCategory`, `Codiscrete`, `TrivialLieModule.equiv`,
`MulAction.orbitRel.Quotient`, `IsEmbedding.subtypeVal`, the three `LieRinehartRing` fields,
`FundamentalGroupoid`, `HasRightInverse.comp`,
`HasRightInverse.of_surjective_of_finiteDimensional`, `VectorField.mpullback_mlieBracket`,
`mvfderiv_mlieBracket` (root namespace, `CompleteSpace E`, `minSmoothness 𝕜 2 ≤ n`). Every Tau
Ceti name cited exists at the pinned a91d3aa: `isLocalDiffeomorphAt_of_mfderiv_eq`
(`LocalDiffeomorph.lean` 269), `extChartPartialDiffeomorph` (73), `sectionZeroChartedSpace` and
its `_chartAt`/`_atlas` (`Section/Chart.lean` 246–263), `exists_isManifold_sectionZero_of_contMDiff`
(`SmoothZero.lean` 63), `hasMFDerivAt_coe_sectionZero`, `isImmersionOfComplement_coe_sectionZero`
(`Section/Manifold.lean` 169, 219), `sectionLinearization_trivial`, `SmoothTwoForm`
(`TwoForm/Basic.lean` 61), `leftInvariantDerivationLieEquivGroupLieAlgebra`
(`Tangent/LieEquiv.lean` 103), `levelSetChartedSpace`/`isManifold_levelSet`
(`Analysis/Fredholm/LevelSet`): the latter two are for Fredholm derivatives of finite index, so they
do not cover G5.2's infinite-codimension-kernel level set; G5.2's Banach split-regular-level theorem
is not a duplicate (the README could say so).

**Cross-roadmap citations resolved (on main unless stated).** DifferentialGeometry 0.1/0.2
(alternating bundle), 0.4 (`legacySmoothTwoFormEquiv`, evaluation law,
`legacySmoothTwoFormEquiv_isClosed_iff`), Layer 4 (`IsContMDiffDistribution`), 8.3 (smooth chains),
10.1 (`IsRegularPoint`, `IsRegularValue`), 10.3–10.4 (`∫_M f*ω = deg·∫_N ω`), 12.1
(`nonempty_contMDiffRiemannianMetric`); SmoothBundlesConnections B1.1 (division map), B1.2, B1.4
(free proper quotient), B2 (complexification, exterior powers, Hom bundles), B3.2 (`j(ξ) = −V_ξ`,
`[s(X),s(Y)] − s([X,Y]) = j(F(X,Y))`, line 912), B5 deck action `[a]·[γ] = [γ.trans a]` (line 1222);
HamiltonianReduction R1 (`ξ_M(x) = d_1(g ↦ gx)ξ`, line 36; exact sequence line 63 with `f ↦ −X_f`),
R2 (KKS, positive Lie–Poisson, line 129–131), R3 (`descendedForm_exists`, `descendedForm_unique`,
`W_O`, `Φ`, lines 200–225), R4 (`T*G` with `s(g,ν) = ν`, `t(g,ν) = ν∘Ad_{g⁻¹}`, line 295);
ComplexKahlerGeometry K1 (eigenbundles, line 165–179), K8; CotangentLagrangian `ω = −dθ` (line 186);
HopfRinow (completed) Layer 1 exponential map; LieGroups Layers 0–5 (Layer 4 Lie III, Layer 5
simply-connected covers); AlgebraicTopology Stage 1 fundamental groupoid; Completed/UniversalCovers;
OperatorAlgebraDynamics D5 (consumer, lines 59, 279); IntegrableSystems (consumer, line 17);
PseudodifferentialOperators at its open head (P1.0 "Smooth section modules" anchor, `IsScalarTower`,
`SMulCommClass`, `(u+iv)·s = u·s + v·(Js)`, lines 198–205, 319); HamiltonianSystems at its open
head (Standing conventions: `ι_{X_F}ω = dF`, `{F,G} = dF(X_G)`, `X_{{F,G}} = −[X_F,X_G]`,
`(⁅Z,Z'⁆)_M = −[Z_M,Z'_M]`, Layer 1 `IsHamiltonianVectorField`, Layer 3 moment maps). All agree
with this roadmap's Conventions. QuantumFoundations is an open pull request by the same author,
named only as a consumer. Ownership against the open pull requests listed in the brief was checked
by name and by object for groupoids, algebroids and Poisson structures (`roadmaps list`,
`roadmaps grep`); no other open roadmap builds them.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Conventions: `ι_{X_f}ω = df`, `{f,g} = df(X_g)` ⇒ `X_{{f,g}} = −[X_f,X_g]` | `L_{X_f}` of `ι_{X_g}ω` | `ι_{[X_f,X_g]}ω = L_{X_f}(dg) = d(ω(X_g,X_f)) = −d{f,g}` | consistent | none |
| `β(π♯α) = π(α,β)` ⇒ `π♯df = −X_f`, `π♯ = −(ω♭)⁻¹` | symplectic `π` | `dg(π♯df) = {f,g} = ω(X_f,X_g) = −dg(X_f)` | consistent | none |
| `[df,dg]_π = d{f,g}` from the Koszul formula | `α = df, β = dg` | `d{f,g} − d{g,f} − d{f,g} = d{f,g}` | consistent | none |
| anchor `π♯` is a Lie homomorphism | `df, dg` | `π♯d{f,g} = −X_{{f,g}} = [X_f,X_g] = [π♯df, π♯dg]` | consistent | none |
| `[π,f] = −π♯df` from the pinned Schouten laws | `π = X∧Y` | `[f,X∧Y] = −X(f)Y + Y(f)X`; `π♯df = X(f)Y − Y(f)X` | consistent | none |
| leaf form `ω_L(π♯α,π♯β) = π(α,β)` with `π♯ = −(ω_L♭)⁻¹` | general | `ω_L(π♯α,π♯β) = −α(π♯β) = π(α,β)` | consistent | none |
| G4.6A minus convention gives canonical `T*M` | `A = TM`, `ℓ_{∂x} = p` | `{p,x} = −∂x(x) = −1`; canonical `ω = dx∧dp`: `X_f = f_p∂x − f_x∂p`, `{p,x} = −1` | consistent | none |
| group over a point: raw dual is positive Lie–Poisson | `[ξ,η]_A = −[ξ,η]_𝔤` | `{ℓ_ξ,ℓ_η} = −ℓ_{[ξ,η]_A} = ℓ_{[ξ,η]_𝔤}` | consistent | none |
| G6.3 `t(g,ν) = Coad_g ν` with `t(α_g)(ξ) = α_g(dR_g ξ)` | `α_g = ν∘dL_g⁻¹` | `ν(Ad_{g⁻¹}ξ)` | consistent; Marsden–Ratiu sign: right trivialisation Poisson onto `𝔤*_+` | none |
| action algebroid anchor `−ξ_M` in standard coordinates | `G⋉M`, unit `(1,x)` | raw: anchor `dt(ξ,0) = +ξ_M`, bracket `[X^R_ξ,X^R_η] = −X^R_{[ξ,η]}`; after `v ↦ −v`: anchor `−ξ_M`, standard bracket; `[−ξ_M,−η_M] = −[ξ,η]_M` | consistent (homomorphism) | none |
| G2.3 `j([p,ξ]) = [−V_ξ(p)]` gives the pointwise adjoint bracket | `P = G` over a point, `ξ(g) = Ad_{g⁻¹}ξ₀` equivariant | `V_ξ = X^R_{ξ₀}`; `[V_ξ,V_η] = −V_{[ξ,η]}` (equivariance term `V_ξ(η) = −[ξ,η]` flips the sign) so `[jξ,jη] = j[ξ,η]` | consistent; agrees with SBC B3.2 line 912 | none |
| `rightInvariant_bracket` sign | `G = GL_n`, `X^R_ξ(g) = ξg` | `D(X^R_η)(X^R_ξ) − D(X^R_ξ)(X^R_η) = ηξg − ξηg = −[ξ,η]g` with `[ξ,η] = ξη − ηξ` the left-invariant bracket; abelian `G`: `0 = −0` | true under Mathlib's `[V,W] = DW·V − DV·W` | none |
| IM identities (G6.4) on the pair groupoid | `σ = −ω♭` | `⟨σX,Y⟩ = −ω(X,Y)` skew; `L_X(−ι_Yω) + ι_Y dι_Xω = −ι_{[X,Y]}ω = σ[X,Y]` (uses `dω = 0`) | consistent; equal to bcwz2004 line 370–371 with `φ = 0` | none |
| G6.1 `σ(a)(X) = −Ω(a,du X)`, `π♯∘σ = id` | pair groupoid, `Ω = pr₁*ω − pr₂*ω`, `a = (v,0)` | `σ(a) = −ω(v,·) = −ω♭v`; `π♯(−ω♭v) = v` | consistent | none |
| G6.2 cotangent groupoid of the pair groupoid | `φ = (φ_y,φ_x)` | `t̃ = φ_y`, `s̃(φ)(b) = φ_x(−b)`, units `(φ,−φ)`, inverse `(−φ_x,−φ_y)`; `(φ_y,−φ_x)` is the pair groupoid of `T*M` and `(T*M×T*M, ω⊕ω) → (ω⊕−ω)` | consistent: target Poisson, source anti-Poisson | none |
| G5.6 central-component equation and period sign | `T_∇` with trivial connection on `ℝ` | central part `∂_t b⁰ − ∂_ε a⁰ = −η(∂_tγ,∂_εγ) = η(∂_εγ,∂_tγ)`; integrate: terminal − initial `= −∫_{I²}γ*η` | consistent with cf2003 line 388, 855 | none |
| G5.6 central extension is an algebroid | `[(X,f),h(Y,g)]` | `= h([X,Y], Xg−Yf+η(X,Y)) + X(h)(Y,g)` | Leibniz holds; Jacobi ⇔ `dη = 0` | none |
| G5.6 periods on `S²×S²` | degrees `(m,n)` | `∫σ*η = m + λn`; `λ ∉ ℚ` ⇒ `ℤ+λℤ` dense ⇒ `r(x) = 0` | matches cf2003 Example 4.2 | none |
| G4.7 plane `π = u ∂x∧∂y` | `ω_L = (1/u)dx∧dy` on `{u ≠ 0}` | `{f,g}_ω = u(f_xg_y − f_yg_x)`; `u = x`: leaves two half-planes and points of the axis | consistent | none |
| G1.3 CE differential vs Mathlib `d₁₂` | `k = 1` | `dω(x₀,x₁) = x₀·ω(x₁) − x₁·ω(x₀) − ω([x₀,x₁])` | shape of Mathlib's `d₁₂`; comparison is a stated target | none |
| G5.2/G5.5 codimension `dim M + rank A` | `n + k` | cf2003 line 1158–1159: codimension `n + k` | consistent | none |
| G5.5 criterion `r(x) > 0`, `liminf r(y) > 0` | — | cf2003 line 1013–1016 (i)–(ii); local uniform discreteness ⇔ `U ∩ N(A) = M` (line 1245–1247) | consistent | none |
| `exists_regularFiber_manifold` | `m > n`, nonempty fibre | surjective `mfderiv` impossible, hypothesis false; empty fibre: all conjuncts vacuous with model `Fin (n−m) → ℝ`; `n = m`: discrete fibre; line with two origins over `ℝ`: two-point 0-manifold, no `T2Space` needed | true as stated | delete as a duplicate (R01) |
| `submersion_iff_split_mfderiv` | `m = 0`, `f` discontinuous | RHS true (`mfderiv = 0` has a right inverse into `Fin 0 → ℝ`), normal form false; excluded by `hf` | `hf` is needed and present | none |
| `submersionKernel_smooth` | `m > n`, `X ≠ ∅` | `IsSubmersion` false (`E ≃ F × complement` impossible); `X = ∅`: vacuous | true as stated | delete as a duplicate (R01) |
| G0.4 isotropy `(x ⟶ x) ≃* (Aut x)ᵐᵒᵖ` with `gh = h ≫ g` | Mathlib `vertexGroup` | `mul := x ≫ y` (`VertexGroup.lean` line 43), so the pin `gh = h ≫ g` is the opposite | consistent with the README's `ᵐᵒᵖ` | none |
| G3.5 balanced product action | Blohmann | blohmann2008 line 270–271: `(m,n)·h = (m·h, h⁻¹·n)` | matches `(p,q)·λ = (p·λ, λ⁻¹·q)` | none |

**Headline theorems.** From the README: the Crainic–Fernandes criterion (G5.5), Lie II (G5.4), the
nonintegrable `S²×S²` extension (G5.6), the orbit theorem (G2.4), the leaf decomposition (G4.5),
symplectic integration (G6.4), groupoid Marsden–Weinstein (G7.4), the gauge-groupoid/Atiyah
identification (G2.3), the regular-fibre theorem and submersion comparisons (G0.1), the
right-invariant bracket sign (G2.2). The module docstring names the first seven as not statable and
says what each lacks (no Lie algebroid or Lie groupoid carrier, no leaf-space or bivector carrier);
that is accurate at the pins: no `Lie algebroid`, `LieGroupoid`, `Poisson` or singular-foliation
carrier exists in Mathlib or Tau Ceti at a91d3aa/6b7abb3c (grep of both trees). The two regular-fibre
statements are statable but belong to SmoothBundlesConnections (R01). Bracket naturality for
`f`-related fields (G0.1, assigned to this roadmap by SBC) is statable with `mfderiv` and
`VectorField.mlieBracket` at the pin and could be stated; it is a lemma rather than a headline, so
this is a note, not a finding.

**Sampled sources.** Verified at their locators: cf2003 Prop 4.7 (line 1154–1163, four assertions,
Annals p. 604), Lemma 4.9 (line 1251–1252, p. 606), Thm 4.1, Prop 1.3 eq. (1), Example 3.7,
Example 4.2, Example 4.5 (Weinstein's `su(2)*` example); cf2004 Thms 1, 2, 3, 5, Cor 2, Prop 4;
bcwz2004 Thm 2.5 and Remark 2.3; blohmann2008 Def 2.10 (P1)–(P3) and Props 2.11–2.12 (line
298–300, 351–352) with the associator, unit constraints and pentagon (line 309–349);
cf2011lectures Example 1.18 and Exercise 8. The README's G3.5 correctly says Blohmann's
Proposition 2.11 is in the Hausdorff Lie-groupoid category and that the locally Hausdorff case is
proved here (blohmann2008 line 239–241 requires a submersive moment map for the pullback manifold).

## Not verifiable

- Lee, *Introduction to Smooth Manifolds*, 2nd ed., Corollary 5.14 and Proposition 5.38: the
  sources service resolves the citation only to a paywalled Springer page (recorded as
  uncertified); the locators are the standard ones for the regular level set theorem and its
  tangent space and are the same ones SmoothBundlesConnections B1.0 cites.
- Crainic–Fernandes–Mărcuț, GSM 217 (author's preliminary copy, AMS permission stated on each
  page): read for chapters 1–2 and the Lie-groupoid part only to check R05; its theorem numbers for
  the Weinstein splitting and leaf theorems were not located for R04 (the author should cite them by
  number).
- `sources.toml`: the folder has none, so no manifest locators could be cross-checked; the texts
  fetched for this review are cf2003 (arXiv math/0105033), cf2004 (arXiv math/0210152), bcwz2004
  (arXiv math/0303180), blohmann2008 (arXiv math/0702399), cf2011lectures (arXiv math/0611259),
  cfm2021 (author page).

## Source issues

- none
