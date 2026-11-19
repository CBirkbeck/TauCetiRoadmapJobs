# Review of ComplexTori (pull request #2550 at 7e25313)
**Verdict:** needs changes

**Summary.** Needs changes, for one finding. The overview names a headline that has not been proved: a period family is holomorphically locally trivial wherever its periods vary by complex-linear automorphisms (§2.3). It can be stated at the pins with no new definition, yet `Suggested.lean` states no theorem, and its docstring says that every statable headline is already proved. Every Check and worked example I recomputed is correct, and the dependency direction is clean. There are two small corrections and two format notes. Two locator questions go to the author. For the human reviewers: the two most-cited sources could not be read.

## R01 (P2) — The holomorphic local triviality of §2.3 is a headline that can be stated at the pins, but `Suggested.lean` states no theorem and its docstring says that nothing statable remains

As a result, the acceptance test is missing the one headline of Layer 2 that is still a target. Three places also assert something false about the pins: the module docstring of `Suggested.lean` (lines 18–21: "Every headline that is statable against the pinned interfaces is already proved at the Tau Ceti pin"), the sentence of Scope and ownership at README lines 914–916, and the matching sentence of the pull-request description. The overview lists the result among the headline theorems (lines 19–21, "holomorphically locally trivial when its periods vary by complex-linear automorphisms"), and §2.3 (lines 295–300) states it as a target. The pinned Tau Ceti has no such result: its only trivialisation is the real one, `TauCeti.torusFamilyDiffeomorphProd` (`TauCeti/Algebra/Module/ZLattice/Family/DiffeomorphProd.lean:80`). The statement is true: on `p⁻¹(U)` the map `[y, v] ↦ (y, [g(y)⁻¹ v])` is well defined, because `g(y)⁻¹(v + Π y λ) = g(y)⁻¹ v + Π y₀ λ`. The theorem below elaborates against the pins with `sorry` as the only warning. It uses only the pinned carriers: the family atlas `TauCeti.torusFamilyChartedSpace`, Mathlib's atlas on an open subset, and the quotient atlas on `E/Π(y₀)Λ`.

```lean
theorem exists_diffeomorph_torusFamily_of_periods_eq
    {EY : Type*} [NormedAddCommGroup EY] [NormedSpace ℂ EY] {H : Type*} [TopologicalSpace H]
    {I : ModelWithCorners ℂ EY H} {Y : Type*} [TopologicalSpace Y] [ChartedSpace H Y]
    [IsManifold I ω Y] [T2Space Y] [LocallyCompactSpace Y]
    {Λ : Type*} [AddCommGroup Λ] [Module.Free ℤ Λ] [Module.Finite ℤ Λ]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (P : Y → Λ →ₗ[ℤ] E) [∀ y, DiscreteTopology (LinearMap.range (P y))]
    [∀ y, IsZLattice ℝ (LinearMap.range (P y))]
    (hinj : ∀ y, Function.Injective (P y))
    (hP : ∀ l, ContMDiff I 𝓘(ℂ, E) ω fun y ↦ P y l)
    (U : TopologicalSpace.Opens Y) (y₀ : Y) (g : U → E ≃L[ℂ] E)
    (hg : ContMDiff I 𝓘(ℂ, E →L[ℂ] E) ω fun y : U ↦ (g y : E →L[ℂ] E))
    (hgP : ∀ (y : U) (l : Λ), P y l = g y (P y₀ l)) :
    letI := TauCeti.periodAddAction P
    letI := TauCeti.torusFamilyChartedSpace (H := H) P (fun l ↦ (hP l).continuous) hinj
    ∃ Φ : Diffeomorph (I.prod 𝓘(ℂ, E)) (I.prod 𝓘(ℂ, E))
        (⟨TauCeti.torusFamilyProjection P ⁻¹' U,
          (TauCeti.continuous_torusFamilyProjection P).isOpen_preimage _ U.isOpen⟩ :
          TopologicalSpace.Opens (AddAction.orbitRel.Quotient Λ (Y × E)))
        (U × AddAction.orbitRel.Quotient (LinearMap.range (P y₀)) E) ω,
      ∀ x, ((Φ x).1 : Y) = TauCeti.torusFamilyProjection P x := by
  sorry
```

The smallest change has four parts. State this theorem, with the import `TauCeti.Algebra.Module.ZLattice.Family.Manifold`, which the file already has, under whatever name you prefer, and name it in backticks in §2.3. Move it in the docstring from the implicit "not statable" group to a stated headline. Then correct the Scope sentence and the description sentence. The "but not in general" half can stay the Check of §2.3. If you would rather state it too, Mathlib's manifold structure on `ℍ` makes it statable, with the discreteness and lattice instances of the family `a + bτ` taken as hypotheses.

## C01 — Layer 3 cites no source, and Layers 5 and 6 each cite one section-level locator for all their targets

So a reader cannot check the monodromy convention `ρ(g⁻¹)` (§3.4), the multiplicity (§5.3), the canonical-bundle characters (§5.5), or the gauge and regluing (§§6.1–6.4) against a stated theorem. Layer 3 (lines 370–477) has no reference at all. Layer 5 cites Barth–Hulek–Peters–Van de Ven, Chapter V, "Logarithmic Transformations" from p. 216 (lines 676–679), and Layer 6 cites the same section and Bogomolov–Tschinkel §3 (lines 768–769), in each case for the whole layer. Bogomolov–Tschinkel §3 (p. 3) attributes the construction to Kodaira, *On the structure of compact complex analytic surfaces I*, Amer. J. Math. 86 (1964), and refers to Friedman–Morgan (1994), §1.6, for details. Would you give theorem and page locators at the targets where one of these states the result? Where a statement is the roadmap's own normalisation, such as the `ρ(g⁻¹)` convention or the weighted cyclic correction, saying so would do.

## C02 — The punctured-disc covering cited for §6.1 lives on the unit disc, while Layer 6 uses the discs of radius `r` and `r^m` of Layer 5

In the *Needs:* line of §6.1 (line 780) and in the supplier contract (lines 1100–1102), `TauCeti.puncturedDiscPow` is `z ↦ z^e` on the punctured unit ball (`TauCeti/Topology/Covering/PuncturedDisc.lean:192`). Layer 6 itself (line 762) takes `D_z` and `D_t` "as in Layer 5", of radii `r` and `r^m`. Either take `r = 1` in Layer 6 or add the rescaling to the *Needs:* line.

## N01 — Scope and ownership contains a pull-request number and a process instruction

Lines 917–922 cite a Mathlib pull-request number and add "before a local-section calculation is changed, its atlas is compared with the installed one". House style keeps the README timeless.

## N02 — Layer 2 says that a construction "follows" a source

"The analytic family construction follows Birkenhake–Lange, Chapter 8" (line 234) reads as the roadmap following a source. "For the Siegel case of this construction see Birkenhake–Lange, Chapter 8" would say the same thing.

## Questions for the author

- Is §§5.2–5.3 really not statable at the pins? The docstring gives as its reason that the rotated disc has no manifold structure. But its carrier is `Metric.ball 0 r` (`TauCeti/Analysis/Complex/RootsOfUnity/Quotient.lean:147`), so Mathlib's open-subset atlas would give one in a one-line definition, and `p_Q` is a `Quotient.lift` through `TauCeti.rootsOfUnityBallQuotientHomeomorph`. With these, the holomorphy of `p_Q`, and its submersivity off `F`, look statable through `TauCeti.instIsManifoldQuotient`. Was the judgement that multiplicity `m` would need an ad hoc encoding? I did not elaborate such a statement.
- Which section of Brown is meant at line 485? In the published contents of *Cohomology of Groups*, Chapter VI §2 is "Relative Homological Algebra". Periodic resolutions of cyclic groups are Chapter I §6, and cohomology with coefficients is Chapter III. The text is paywalled, so I could not check what VI.2 contains.

## Verified sound

| Statement | Instances tried | Values computed (text / computed) | Result | Change |
|---|---|---|---|---|
| §1.3 kernel, components, bijectivity | `f(z,w)=2z`, `L=ℤ[i]²`; `f(z)=(z,0)`; `×2` on `ℂ/ℤ[i]` | components `ℤ[i]/2ℤ[i]≅(ℤ/2)²`, four; `(L'∩range f)/f(L)=0`, `L'/f(L)≅ℤ[i]`; kernel order 4, `2ℤ[i]≠ℤ[i]` | holds; pin gives `(L'∩range f)/(L'∩f(L))` | none |
| §1.4 homology | `α=1+i` on `ℂ/ℤ[i]`; `H_k(ℂ/ℤ[i])` | `H₂` multiplication by `|α|²=2`; ranks 1,2,1,0 `=binomial(2,k)` | holds | none |
| §2.1 period separation | `ℍ`, `Π(τ)(a,b)=a+bτ` | `|a+bτ|≥|b|Im τ` (b≠0), `≥1` (b=0): `min(1,Im τ)`; `τ=it`: norm `t→0` | Check true | none |
| §2.2 total space | `E=0`; constant periods `ℤ[i]` | total space `Y`; product `Y×ℂ/ℤ[i]` | consistent with pin | none |
| §2.3 local triviality (headline) | `Π y=g(y)Π y₀`; family `a+bτ` | `g⁻¹(v+Π yλ)=g⁻¹v+Π y₀λ`; for `ℍ`, `g·1=1` forces `g=1`, `τ=τ₀` | true; statable, absent | R01 |
| §2.5 marking | `τ=i`, multiplication by `i` | `1↦(0,1)`, `i↦(−1,0)`: `(0,−1;1,0)`; `Γ0−Γ1` gives `(−1,0)` | Check true | none |
| §3.3 freeness | `C₂` on `ℂ`, `R=1`, `a=½` | cocycle `½+½=0`; `(1−A)T=0∌½`: free; linear fixes `(0,0)` | true | none |
| §3.4–3.5 monodromy | `ℤ` on `ℂ`, `R_n=iⁿ` | `R_{g⁻¹}(gy)` sends `Π(gy)λ` to `Π(y)ρ(g⁻¹)λ`: `−i`; other convention `i` | consistent | none |
| §4.2 order | `A=1`, `t=⅓`, `m=2`; `t=½`, `m=4` | `N₂=⅔≠0`; `N₄=2=0`, `N₂=1=0`: exact order 2 | true | none |
| §4.3 `H¹` | `ZMod 2`, `σ=id`; `A=−1`, `m=2`; `A=1` | `N=2x=0`; `ker N=T`, `2T=T`, `H¹=0`; `H¹=T[2]≅(ℤ/2)²` | true | none |
| §4.4 freeness | `A=diag(1,i)`, `t=(½,0)`, `m=4` | `N₄=(2,0)=0`; `t∉0×T`; `N₂=(1,0)=0`, square fixes `(x₁,0)` | faithful, not free | none |
| §4.5 connecting class | trivial, `m=3`, `t=⅓`; `A=−1`, `m=2` | `δ[⅓]=[1]`, `[1]≠[−1]` mod `3ℤ[i]`; `Λ^A=0`, `H²=0` | true | none |
| §4.6 trivial action | `Λ=ℤ[i]`, `m=2` | `|T[2]|=|Λ/2Λ|=4`; exact order 2: three points | true | none |
| §4.1 / headline fixed points | `A=−1`, `k=1,2` | `N₁=t∈2T=T`; `N₂=0∈0` | true | none |
| §5.1 total action | `m` prime vs `m=4` | prime: any `g^k` generates; composite: all `k` (pin) | matches pin | none |
| §5.4 normal character | normal coordinate `z`, `g:z↦ζz` | `∂_z↦ζ∂_z`: character `ζ`; `ζ^m=1`; order `m` (units constant on `T₀`) | true | none |
| §5.5 adjunction | `m=2`, `A_E=1`; `A_E=diag(1,−1)` | `(ζ det A)⁻¹=−1`, `K_F=1`, `N=−1`: `1=(−1)(−1)`; `det=−1`: `K_F` order 2 | true | none |
| §5.3 multiplicity (headline) | `m=1`; `m=2`, chart `u=z` | `t=z`; `t=u²` | true; docstring calls it not statable | question |
| §6.2 cyclic correction | `m=2`; general `m` | `c(ζz)−c(z)=−f(z)` using `∑f(ζ^jz)=0`; unweighted gives `0` | true; pin with `a=0` | none |
| §6.3 gauge | generator `(ζz,e+Πλ/m)` | invariant via `Log(ζz)=Log z+2πi/m`; other sign shifts by `2Πλ/m`, a period iff `m|2` | true | none |
| §6.4 regluing | `D_t×E`, `m=2`, 2-torsion translation | gauge `Q*≅D_t*×E`; glue | consistent; no locator | C01 |
| §6.6 reversal | generator `ζ⁻¹` | orbit sum `−Πλ`, `λ↦−λ`; `H¹` value `−b(0)` | true | none |
| Layer 1 headline: `E/L` Lie group, compact, homology | `ℂ/ℤ[i]` | `⋀^k ℤ²`: 1,2,1 | proved at pin | none |
| Layer 2 headline: manifold, submersion, smooth trivialisation | `ℍ` family | `v=x+yτ`: `(Re v−Re τ·Im v/Im τ, Im v/Im τ)` | proved at pin | none |
| Layer 4 headline: `δ` isomorphism | as §4.5 | as §4.5 | proved at pin | none |

- Source locators checked against the text: 1 of 6 (Bogomolov–Tschinkel §3, p. 3–4, read in full); Brown and Birkenhake–Lange checked against public chapter lists only.
- Library declarations opened at the pins: `Submodule.orbitRelQuotientMap_bijective_iff` (`Algebra/Module/Submodule/OrbitRelQuotient.lean:317`), `TauCeti.isCancelSMul_torusFamilyAffineMulAction_iff` (`Algebra/Module/ZLattice/Family/Stabilizer.lean:308`) and its cyclic form (`:330`), `TauCeti.cyclicCorrection` and `TauCeti.add_cyclicCorrection_apply_sub` (`Dynamics/BirkhoffSum/Cyclic.lean:73,121`), `TauCeti.exists_birkhoffSum_translation_eq_period` (`Algebra/Module/ZLattice/Family/AffineAction.lean:353`), the three rotated-disc criteria and exact order (`Algebra/Module/ZLattice/Family/RotatedDisc.lean:105–191`), `TauCeti.rootsOfUnityBall` (`Analysis/Complex/RootsOfUnity/Quotient.lean:139`), `TauCeti.puncturedDiscPow` (`Topology/Covering/PuncturedDisc.lean:192`), `TauCeti.torusFamilyChartedSpace` and `TauCeti.isManifold_torusFamily` (`Algebra/Module/ZLattice/Family/Manifold.lean:112,137`), `Submodule.isClosed_orbitRelQuotient_mk_image_preimage` (`Topology/Algebra/Module/DiscretePreimage.lean:78`), `TauCeti.freeLocus.instIsManifold` (`Geometry/Manifold/Instances/Quotient.lean:293`), `IsCoveringMap.exists_homeomorph_comp_eq_of_simplyConnectedSpace` (`AlgebraicTopology/UniversalCover/Classification/Pointed.lean:264`); Mathlib `Manifold.IsImmersion` (`Geometry/Manifold/Immersion.lean:802`).
- Cross-roadmap citations resolved on main: ComplexManifolds Milestones 1, 4, 5, 6, 7.4–7.6; AlgebraicTopology §§2.6, 5.4, 5.5 (fibre transport); GeometricTopology §§1.1, 1.3; SmoothRepresentationsOfLocalGroups SR.0d.2; GeometryOfNumbersAndQuadraticArithmetic §6.1a; AbelianSchemesAndArithmeticModuli A5.1, A5.6, A5.8; BallQuotientsAndComplexHyperbolicLattices §8.2; ComplexKahlerGeometry; Completed UniversalCovers and AnalyticToricGeometry. The old item numbering (Milestone 4 "Integral connecting class" items 5–6) agrees with the mapping sentence; the open ComplexManifolds revision keeps Milestone `k` = Layer `k`.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; all four suppliers are on main.
- Elaboration: `Suggested.lean` exits 0 with no warning, and its 18 `#check` lines pin existing declarations. The file declares nothing of its own, so there were no signatures to compare. The R01 statement elaborated in a separate file, with `sorry` as the only warning.
- Ownership: ComplexManifolds (main and its open revision) defers complex-torus families to this roadmap. FuchsianOrbifolds defers torus families over orbifolds to Layer 3. NeronModelsAndSemistableAbelianVarietiesPartII treats algebraic multiple fibres, a different object.

Overlap check: read ComplexManifolds (open revision and main), FuchsianOrbifolds; nothing shared; ComplexManifolds owns quotients, gluing and line bundles and this roadmap cites them.

Source independence: 7 passages compared with 1 source (Bogomolov–Tschinkel §3 against the Layer 5 introduction, §§5.1, 6.1, 6.2, 6.3, 6.4 and the Layer 6 introduction), none shared beyond formulas; largest share Birkenhake–Lange and Barth–Hulek–Peters–Van de Ven, 2 of 6 locators each; contents compared with Birkenhake–Lange's and Brown's public chapter lists: independent; Barth–Hulek–Peters–Van de Ven's section list not readable.

Research link: Layers 5–6 formalise Kodaira's logarithmic transforms (Kodaira 1964). Bogomolov–Tschinkel (2003, §3) use them to build special elliptic fibrations, preserving simple connectivity and the Kähler property (their Prop. 3.1). Based on Bogomolov–Tschinkel §3, read, and the README's references.

## Not verifiable

- Birkenhake–Lange, *Complex Abelian Varieties*, Chapters 1 and 8: Springer, paywalled; only the public chapter list was found.
- Brown, *Cohomology of Groups*, Chapter VI §2: Springer GTM 87, paywalled; a reseller's published contents were read (see the question above).
- Barth–Hulek–Peters–Van de Ven, *Compact Complex Surfaces*, Chapter V, "Logarithmic Transformations", p. 216: Springer, paywalled; the publisher's page lists chapters only.

Automatic checks set aside as false positives: the citation lookup reports the module `TauCeti.Topology.Algebra.Module.DiscretePreimage` (README line 1028) as found nowhere, but the module exists at the pin and declares both theorems cited with it.

## Source issues

- none

## For the human reviewers

- Not tested: the two sources with the largest share of locators could not be read. These are Birkenhake–Lange and Barth–Hulek–Peters–Van de Ven, with two of the six locators each. Wording and arrangement were checked against Birkenhake–Lange's public chapter list only, and not against Barth–Hulek–Peters–Van de Ven.
