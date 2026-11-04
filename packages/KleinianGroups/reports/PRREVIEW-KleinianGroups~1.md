# Review of KleinianGroups (pull request #432 at 18e52e8)

**Verdict:** needs changes

The gate fails at this head (`sorry-data=14`, `imports`, `mathlib-subimports`, `no-import-mathlib`); the dependency check passes (`depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`). Six findings block; four are notes.

## R01 (P1) — Fourteen definitions and instances with `sorry` bodies

**Location.** `TauCetiRoadmap/KleinianGroups/Suggested.lean` lines 90, 94, 99, 104, 113, 118, 123, 127, 188, 198, 204, 208, 213, 218: `def toQuaternion … := by sorry`, both `MulAction` instances, `pslAction`, the `T2Space`, `MeasurableConstSMul` and `SMulInvariantMeasure` instances, `ofUpperHalfPlane`, `bianchi`, `bianchiGamma`, `bianchiGaussian`, `bianchiEisenstein`, `gammaGaussian`, `gammaEisenstein`.

**Claim.** The file states the headline theorems against these carriers.

**Witness.** The gate rule "no `sorry` in the body of a `def`, `abbrev`, `instance` or `opaque`" lists all fourteen; every headline (`covolume_bianchiGaussian`, `index_gammaGaussian`, `mul_index_mem_hyperbolicVolumes`, …) mentions one of them, so at this head the file asserts nothing about any determined object.

**Repair.** Give real bodies on native carriers, or move the construction to the README. Concretely: `toQuaternion p := ⟨p.coe 0, p.coe 1, p.height, 0⟩`; `ofUpperHalfPlane z := ⟨![z.re, 0, z.im], …⟩` with `z.im_pos`; `bianchi F ι` as the image of `SL(2, 𝓞_F)` under `Matrix.SpecialLinearGroup.map (ι.comp (algebraMap (𝓞 F) F))` followed by the quotient map to `PSL(2, ℂ)`, and `bianchiGamma F ι I` as the image of the kernel of `Matrix.SpecialLinearGroup.map (Ideal.Quotient.mk I)`; the four named groups as these at `F = ℚ(i)`, `ℚ(ω)` with `I = (2 + i)`, `(3 + ω)`. The action is the one place a real body costs a proof: either state the `SMul PSL(2, ℂ) H3` by the coordinate formula `(w, h) ↦ (((a w + b) conj(c w + d) + a conj(c) h²)/J, h/J)`, `J = |c w + d|² + |c|² h²` (closure is `h/J > 0`), prove `one_smul`/`mul_smul` in the file, and keep the quaternionic description as the README's derivation; or make the action a README target and restate the headlines with the `SMul` instance only (`MeasureTheory.covolume` and `HasFundamentalDomain` need just `[One G] [SMul G α]`, and `IsKleinian` can use `∀ p g, g • p = p → g = 1`). The Prop-class instances (`T2Space`, `MeasurableConstSMul`, `SMulInvariantMeasure`) become theorems in the README (see R08 for `T2Space`).

## R02 (P1) — The explicit fundamental domains of layer 2 are not fundamental domains, and the covolume route runs backwards

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 299–302: "the explicit domains for `Gamma(2 + i)` and `Gamma(3 + omega)`, each a box over a fundamental parallelogram for the translation sublattice"; lines 340–345: the manifold volumes are obtained "by integrating `volume` over the fundamental domains of layer 2", and the Bianchi covolumes "by dividing by the indices".

**Claim.** A box `P × [h, ∞)` over a fundamental parallelogram `P` of the translation lattice is a fundamental domain for `Γ(2 + i)`, and integrating over it gives `20 · catalanConstant`.

**Witness.** Take `p = (0, 0, t)` with `t < h`. For `g = (a b; c d)` in `Γ(2 + i)`, `d ≡ ±1 mod (2 + i)`, so `d ≠ 0` and `|d|² ≥ 1`; the action formula gives `height (g • p) = t / (|c|² t² + |d|²) ≤ t < h`. So no `Γ(2 + i)`-translate of the box contains `p`: the translates do not cover `H³`. The same computation with `(3 + ω)` (norm `7`) refutes the Eisenstein box. (Independently: `Γ(2 + i)` has `60/10 = 6` cusp classes, since the image of the stabilizer of `∞` in `PSL(2, 𝔽₅)` has order `10`; a flat-bottomed box sees only the cusp at `∞`.) And `vol(P × [h, ∞)) = area(P)/(2h²)` is a rational multiple of `1/h²`; no log-sine integral arises from it.

**Repair.** Invert the route, which is also the one the cited prior art grounds. Layer 2 states the Bianchi (Humbert) domain for the *full* group: for `PSL(2, ℤ[i])` the set `{(x, y, t) : |x| ≤ 1/2, 0 ≤ y ≤ 1/2, x² + y² + t² ≥ 1}` is a fundamental domain (Elstrodt–Grunewald–Mennicke, chapter 7, the Bianchi domain for `d = 1`; Swan's description for class number one), and the analogous prism over half a fundamental cell for `PSL(2, ℤ[ω])`. Layer 4 integrates these: `∫ dx dy / (2 (1 − x² − y²))` over the disc part reduces to `−∫₀^{π/4} log(1 − 1/(4 cos² θ)) dθ`, which the identity `sin 3θ = sin θ (4 cos² θ − 1)` turns into log-sine integrals, giving `catalanConstant / 3`; then `20 · catalanConstant` is `60 · (catalanConstant / 3)` by the index law, and likewise `21 √3 L(2, χ₋₃) = 168 · √3 L(2, χ₋₃)/8`. The torsion of the Bianchi group is irrelevant to a fundamental domain (`MeasureTheory.IsFundamentalDomain` is stated for any action); torsion-freeness is needed only for the membership statements of layer 5. Keep the face-pairing criterion as a general target; drop the two explicit "box" domains for the congruence subgroups, whose fundamental domains are the coset unions `IsFundamentalDomain.subgroup_iUnion_out_inv_smul` already supplies.

## R03 (P2) — The upper half-space model, its density and the `SL₂(ℂ)` action already have an owner

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 81–83: "This roadmap owns the upper half-space model and everything Kleinian: the space, its measure and distance, the quaternionic Moebius action"; lines 220–222: "There is no hyperbolic space in dimension three in either library".

**Claim.** No other roadmap plans `H³`, its `h⁻³` measure, or the Möbius action.

**Witness.** Polylogarithms, an open roadmap earlier in the merge order (position 327; this roadmap is at 353), §2.4 "Upper-half-space coordinates and the ideal boundary": it defines `upperHalfHyperbolicModel` on `H³ = {(w, h) ∈ ℂ × ℝ | h > 0}` with measure `h⁻³ dx dy dh`, the action of every determinant-one complex matrix by the displayed formula with `J = |cw + d|² + |c|² h²`, its composition law, isometry and orientation preservation, geodesic planes as vertical planes and hemispheres, and Checks (translation Jacobian, dilation, heights `1` and `2` at distance `log 2`). Its `Suggested.lean` has `idealRegion` and `signedIdealVolume` on `ℂ × ℝ` with density `p.2 ^ (-3)`. That is the same object as layer 0 here, on a different carrier (`ℂ × ℝ` versus `EuclideanSpace ℝ (Fin 3)`), and this README does not mention it.

**Repair.** One owner. Either consume Polylogarithms §2.4 by name for the model, the action and its isometry and measure invariance, and build layers 1–5 on its carrier (then the `Dist` convention must spell out the Euclidean distance on `ℂ × ℝ`, since the product `dist` there is the supremum distance, and the `cosh` formula and the `y = 0` slice comparison are stated against that); or state in the scope section why this roadmap is the owner and what Polylogarithms §2.4 then consumes from here, with the carrier reconciled. Record the choice under `## Scope and ownership`.

## R04 (P2) — Supplier drift: GeometricTopology layer 7 states no comparison theorem and cannot consume this roadmap; the Tau Ceti volume-density citations do not exist at the pin

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 29–32: "The two meet at exactly one theorem … That theorem is owned by layer 7 of GeometricTopology"; lines 98–101: "The comparison theorem between the two is a target of that roadmap, which consumes the `volume` of this one"; lines 212–216: "`Geometry/Manifold/Riemannian/VolumeDensity/` has `chartVolumeDensity` …, `chartRiemannianVolume`, …, and `chartRiemannianVolume_restrict_overlap`".

**Claim.** GeometricTopology layer 7 owns the identification of the `withDensity` measure with the Riemannian volume, and Tau Ceti already has the chart-level Riemannian measure.

**Witness.** GeometricTopology on main, layer 7 (`TauCetiRoadmap/GeometricTopology/README.md` lines 627–695), builds `HyperbolicMetric`, `hypVolumeOfMetric`, Mostow invariance and the Weeks target; it mentions neither an upper half-space model, a `withDensity` measure, nor this roadmap, and as a roadmap on main it cannot consume a later one. At the pinned Tau Ceti, `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity.lean` is a single file whose declarations are `chartVolumeDensity`, `chartVolumeDensity_def`, `_nonneg`, `_pos`, `_sq`, `_changeFrame`; there is no `chartRiemannianVolume`, no `chartRiemannianVolume_restrict_overlap`, and no `riemannianVolume` anywhere in the library.

**Repair.** The comparison is this roadmap's target or nobody's: state it here, as a layer-0 or layer-4 target with its hypotheses (the Riemannian volume of the metric `(dx² + dy² + dt²)/t²` as GeometricTopology layer 7 defines it, once that exists, equals `volume`), with a `*Needs:*` line naming GeometricTopology layer 7 as the supplier of the Riemannian side; or delete the claim. Correct the Tau Ceti citation to the file and the six declarations that exist.

## R05 (P2) — The fundamental-domain existence route has an unowned step and undeclared instances

**Location.** `TauCetiRoadmap/KleinianGroups/README.md` lines 268–271: "a discrete subgroup of `PSL(2, C)` is countable and has a fundamental domain, the latter from `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`"; `Suggested.lean` lines 150, 159–160, 178.

**Claim.** Countability plus proper discontinuity give a discrete subgroup a fundamental domain, so the index law and `IsCofinite.covolume_pos` apply.

**Witness.** At the pin, `TauCeti.exists_isFundamentalDomain_of_properlyDiscontinuousSMul` (`TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean` line 100) takes `(hμ : μ (freeLocus G X)ᶜ = 0)` under `[SecondCountableTopology X] [T2Space X] [LocallyCompactSpace X] [ContinuousConstSMul G X] [ProperlyDiscontinuousSMul G X] [Countable G] [OpensMeasurableSpace X]`. In dimension two the null-set hypothesis is `Subgroup.volume_compl_freeLocus` (`TauCeti/Analysis/Complex/Fuchsian/Covolume.lean` line 86), proved from countability of the non-free points; in `H³` a nontrivial elliptic element fixes a whole geodesic, so the set is uncountable and that proof does not transfer. No layer states that the union of the fixed geodesics of a countable subgroup is `volume`-null. The instances are also absent: on a probe copy elaborated at the pins, `SecondCountableTopology H3`, `T2Space H3`, `LocallyCompactSpace H3`, `OpensMeasurableSpace H3`, `BorelSpace H3`, `ContinuousConstSMul PSL(2, ℂ) H3` and `SecondCountableTopology PSL(2, ℂ)` all fail to synthesize (`H3` is a `def`, so nothing is inherited), and the README's layer-0 deliverables list only `MeasurableSpace` and `BorelSpace`.

**Repair.** Add to layer 1 the target "for a countable `Γ ≤ PSL(2, ℂ)`, `volume (freeLocus Γ H3)ᶜ = 0`", with its route: the fixed-point set in `H³` of a non-identity element is empty or a geodesic (Elstrodt–Grunewald–Mennicke, chapter 1, classification of elements of `PSL(2, ℂ)`), a geodesic is a null set for `volume`, and a countable union of null sets is null. Add to layer 0 the `T2Space`, `SecondCountableTopology`, `LocallyCompactSpace`, `OpensMeasurableSpace` instances on `H3` (transported along `H3.coe`, an open embedding), `SecondCountableTopology PSL(2, ℂ)`, and continuity of the action; then `countable_of_discrete` is `countable_of_Lindelof_of_discrete` and `hasFundamentalDomain` follows as in the Fuchsian file. Name these in the `*Needs:*` lines of `covolume_eq_index_mul_covolume`, `IsCofinite.covolume_pos` and `hyperbolicVolumes`.

## R06 (P2) — The README is not in roadmap form: no Checks, no `*Needs:*` lines, no per-theorem hypotheses or locators

**Location.** `TauCetiRoadmap/KleinianGroups/README.md`, whole file. Layers are single paragraphs headed "What to build / Deliverables / API / Unlocks"; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, no `### k.n` subsection, no `*Needs:*` line, no `**Checks.**` list for any definition, no `### Examples` or `### Dependencies`, no `## Downstream consumers`. Locators at claims: two in the whole file (Thurston p. 380; Milley). Example, lines 304–305: "A Dirichlet domain is open, is star-shaped about its centre, is locally finite" with no hypothesis on the centre (trivial stabilizer) or the group (discrete), no source; lines 243–251: "`dist` carries a `MetricSpace` instance on `H^3`, completeness, the geodesic through two points, the triangle inequality by the standard hyperbolic argument" with no statement of what "the geodesic through two points" delivers.

**Claim.** The README specifies the targets unambiguously.

**Witness.** The form in the brief and in the roadmaps on main (compare `TauCetiRoadmap/FuchsianOrbifolds/README.md`, whose layer 2 lists each theorem with its hypotheses and a source spine, and the open Polylogarithms §2.4, which gives five Checks for the half-space model alone). Here `IsKleinian`, `IsCofinite`, `H3`, `volume`, `dist`, `bianchi`, `bianchiGamma`, `dirichletDomain`, `catalanConstant`, `lchi3`, `hyperbolicVolumes` have zero Checks each; the seven "Acceptance checks" are global and three of them (4, 5, 7) are the headlines restated.

**Repair.** Rewrite in the house shape: per definition an API list and at least three discriminating Checks (for example for `volume`: the cusp box `[0,1]² × [1, ∞)` has volume `1/2`; the dilation `(x, y, t) ↦ (λx, λy, λt)` preserves it while it scales Lebesgue measure by `λ³`; the full space has infinite volume; for `dist`: heights `1` and `2` on a vertical line are at distance `log 2`; the slice `y = 0` agrees with `UpperHalfPlane.dist`; the supremum metric on `Fin 3 → ℝ` would give a different `cosh` value for `(0,0,1)`, `(1,1,1)`); per theorem its hypotheses and a locator (theorem or section and page); a `*Needs:*` line per target; `### Examples` and `### Dependencies` per layer; the supplier contracts with the exact pinned names (`MeasureTheory.covolume_eq_card_mul_covolume`, `MeasureTheory.IsFundamentalDomain.subgroup_iUnion_out_inv_smul`, `TauCeti.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`, `Subgroup.IsCofinite`, `Subgroup.isCofinite_iff_covolume_ne_top`, `QuotientGroup.instT2Space`, `Matrix.SpecialLinearGroup.finite_center`).

## R07 (P3) — Imports violate the header rule

**Location.** `TauCetiRoadmap/KleinianGroups/Suggested.lean` lines 1–11: eleven `import Mathlib.<submodule>` lines and no `import Mathlib`.

**Witness.** Gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`.

**Repair.** Replace the eleven lines by the single line `import Mathlib`; add `import TauCeti.<module>` lines only for Tau Ceti modules the file uses.

## R08 (P3) — Padding in `Suggested.lean`, including a `T2Space` instance that is a library inference and is also declared by an open pull request

**Location.** `Suggested.lean` lines 56 (`height_pos`), 70–73 (`volume_def`, `rfl`), 82 (`cosh_dist`), 107 (`isometry_smul`), 113 (`T2Space PSL(2, ℂ)`), 132 (`dist_ofUpperHalfPlane`), 150 (`countable_of_discrete`), 159 (`covolume_eq_index_mul_covolume`), 173 (`isCofinite_iff_covolume_ne_top`, proved in place), 178 (`IsCofinite.covolume_pos`), 284 (`hyperbolicVolumes_nonempty`), 289 and 292 (the two membership theorems).

**Witness.** On the probe copy: `instance : T2Space PSL(2, ℂ)` closes by `infer_instance` after `Matrix.SpecialLinearGroup.finite_center (R := ℂ)` (`TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean` line 227) and `Set.toFinite _ |>.isClosed`, through Mathlib's `QuotientGroup.instT2Space` (`Mathlib/Topology/Algebra/ProperAction/Basic.lean` line 206), which is exactly how `TauCeti/Topology/Algebra/Matrix/ProjectiveSpecialLinearGroup.lean` line 33 proves the real case; the open HeegaardFloer pull request declares the same instance as `pslComplex_t2` (`TauCetiRoadmap/HeegaardFloer/Suggested.lean` line 145). `hyperbolicVolumes_nonempty` closes by `exact ⟨_, twenty_catalan_mem_hyperbolicVolumes⟩`. `isCofinite_iff_covolume_ne_top` restates the structure. `covolume_eq_index_mul_covolume` is `MeasureTheory.covolume_eq_card_mul_covolume h` once the two instances of layer 0 exist. `volume_def` and `cosh_dist` mirror `UpperHalfPlane.volume_def` and `UpperHalfPlane.cosh_dist`, API by the README's own description. The membership theorems restate the covolume headlines together with `isKleinian_gamma*`.

**Repair.** Delete them from `Suggested.lean`; the README keeps each as a target or Check. For `T2Space PSL(2, ℂ)`, cite the two pinned declarations in the supplier contracts and declare nothing. Keep as headlines the four covolume theorems, the two index theorems, the two `isKleinian_gamma*` theorems, `isKleinian_iff_discrete_and_torsionFree`, `mul_index_mem_hyperbolicVolumes`, `rat_ratio_of_commensurable`, and `ThurstonQuestion23` with `hyperbolicVolumes`.

## R09 (P3) — `NoSmallRationalRatio 1000` is a numerical certificate, not a library theorem

**Location.** `Suggested.lean` lines 320–325; README lines 415–420 and 428–430.

**Claim.** The explicit bound `N = 1000` is a headline.

**Witness.** The README's own words: it is proved "from rigorous enclosures of both constants", and "the predicate for every `N` would be the open question itself". Proving it means enclosing `20 G / (21 √3 L(2, χ₋₃)) ≈ 0.64461` to width below `1/(999 · 998)` and checking the Farey neighbours of order `999`: a computation with a fixed numerical input, which the principles exclude ("Mathematical background is welcome; computational algorithms are not").

**Repair.** Delete `NoSmallRationalRatio` and `noSmallRationalRatio_thousand` from `Suggested.lean`; keep at most a README worked example stating the enclosure and the bound. The library content of layer 5 is `rat_ratio_of_commensurable`, `mul_index_mem_hyperbolicVolumes` and the statement `ThurstonQuestion23`.

## R10 (P3) — Prose errors and name drift

**Location and witness, one bullet each.**

- README lines 349–350: "the same integral at `pi/6` gives the `chi_(-3)` value". Computed: `−2 ∫₀^{π/6} log(2 sin t) dt = Cl₂(π/3) = 1.01494…`, while `L(2, χ₋₃) = 0.78130…`; the exact identity is `−2 ∫₀^{π/6} log(2 sin t) dt = (3√3/4) · L(2, χ₋₃)`. (The Catalan case is exact: `−2 ∫₀^{π/4} log(2 sin t) dt = G`.) State the constant.
- README lines 220–224: a three-item list ("no hyperbolic space in dimension three …, no name for Catalan's constant, and no fundamental domain for the modular group") is followed by "the second belongs to layer 7 of GeometricTopology, and the third and fourth are targets here and in FuchsianOrbifolds". GeometricTopology has no Catalan's constant (layer 4 here introduces it), and there is no fourth item.
- README lines 261–262 and 277: `Fuchsian.Covolume.isCofinite_iff_covolume_ne_top`. The pinned name is `Subgroup.isCofinite_iff_covolume_ne_top`, `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean` line 114.
- README lines 413–414: "the minimum volume `0.9427` of an orientable hyperbolic 3-manifold (Milley)". Milley's Theorem 1.3 (milley2009 line 47) is the closed case; `hyperbolicVolumes` also contains cusped quotients, whose orientable minimum `2.0299` is Cao–Meyerhoff. Cite both or say "closed".
- README lines 34–37 ("Suggested homes"), 105–107 ("prevent two agents"), 375 ("contributors should not attempt it from here"), 459–460 ("an auditor … reports back"): process narrative; the roadmap-for-a-roadmap label itself is fine.

## Verified sound

**Gate and dependency check.** Gate output read (fails as in R01, R07; `build=0`, `set_option=0`, `latex=0`, `prnum=0`). `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line; `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. `metadata.toml` carries `topic = "math.GT"`.

**Seeded sample (every "What to build", "Deliverables", "API", "Unlocks", "Design note", and "Humbert's formula" passage).** Read against the sources available (see Not verifiable for the three Springer books): Thurston's question 23 at thurston1982 line 913–914 (PDF page 24 = printed p. 380) reads as the README states it; Milley Theorem 1.3 at milley2009 line 47–48 gives the Weeks bound `0.943`; Humbert's formula as displayed at README line 14 agrees with the two computed values below. The "Deliverables" lists were checked name by name against `Suggested.lean` (every backticked name of the roadmap's own that the README claims is declared, except the README-only targets `smul_def`, `properlyDiscontinuousSMul_of_discrete`, `dirichletDomain`, `isFundamentalDomain_dirichletDomain`, `isFundamentalDomain_of_facePairing`, `torsionFree_gamma`, `zeta_gaussian_two`, `zeta_eisenstein_two`, which the resolver also lists as found nowhere but are prose targets).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Humbert at `d = −4` | `ζ_{ℚ(i)}(2) = ζ(2) L(2, χ₋₄)` | `8 · (π²/6) · G /(4π²) = G/3 = 0.30532` | agrees with `covolume_bianchiGaussian` | none |
| Humbert at `d = −3` | `ζ_{ℚ(ω)}(2) = ζ(2) L(2, χ₋₃)` | `3^{3/2} · (π²/6) · L/(4π²) = √3 L/8 = 0.16915` | agrees with `covolume_bianchiEisenstein` | none |
| Indices | `SL(2, 𝔽₅)`, `SL(2, 𝔽₇)`; `−1 ∉ Γ(I)` since `2 ∉ (2+i)`, `2 ∉ (3+ω)` (norms 4 vs 5, 7) | `120/2 = 60`, `336/2 = 168`; `relIndex` orientation `[K : H ⊓ K]` | correct | none |
| Manifold volumes and the `5/14` | `60 · G/3`, `168 · √3 L/8` | `20 G = 18.319`, `21 √3 L = 28.419`; `(20/21)/(8/3) = 60/168 = 5/14` | correct | none |
| Torsion-freeness of `Γ(2+i)`, `Γ(3+ω)` | elliptic traces in `ℤ[i] ∩ (−2, 2)` and `ℤ[ω] ∩ (−2, 2)` are `{0, ±1}`; `g ≡ 1` forces `tr g ≡ 2 mod I` | `2, 3, 1 ∉ (2+i)` (norms 4, 9, 1 vs 5); same against norm 7 | torsion free; `isKleinian_gamma*` sound | none |
| Box domain for `Γ(2+i)` | `p = (0, 0, t)`, `g = (a b; c d)`, `d ≡ ±1` | `height(g • p) = t/(|c|²t² + |d|²) ≤ t` | translates miss `{t < h}` | R02 |
| `cosh_dist` | `p = (0,0,1)`, `q = (0,0,2)` | `cosh(2 arsinh(1/(2√2))) = 1 + 2/8 = 1.25`; `1 + 1/(2·1·2) = 1.25`; `cosh(log 2) = 1.25` | agrees with Polylogarithms §2.4 Check (`log 2`) | none |
| `volume` on the cusp box | `[0,1]² × [1, ∞)` | `∫₁^∞ t⁻³ dt = 1/2` | README check 1 correct | none |
| `diag(i, −i)` on `y = 0` | `q = x + t j` | `i (x + t j) i = −x + t j` | reflection `x ↦ −x`, plane preserved | none |
| Log-sine at `π/4` and `π/6` | `∫₀^{π/4} log(2 sin t) dt = −G/2`; `∫₀^{π/6} log(2 sin t) dt = −Cl₂(π/3)/2` | `−2 · (−G/2) = G`; `Cl₂(π/3) = 1.01494 = (3√3/4) · 0.78130` | second claim off by `3√3/4` | R10 |
| `covolume_eq_index_mul_covolume` | `Δ = Γ`; `Δ = ⊥`, `Γ` infinite discrete; `Γ = Δ = ⊥` | `card = 1`; `card = ⊤`, `covolume ⊥ = volume H3 = ⊤`, `⊤ · (positive) = ⊤`; `⊤ = 1 · ⊤` | consistent | none |
| `isCofinite_iff_covolume_ne_top` without discreteness | `Γ = PSL(2, ℂ)` | no fundamental domain, so Mathlib's `covolume` is `0 ≠ ⊤`, yet not cofinite | discreteness field necessary, as the README says | none |
| `IsCofinite` on `⊥` | `Γ = ⊥` | `covolume = ⊤` | not cofinite; `hyperbolicVolumes` excludes it | none |
| `isKleinian_iff_discrete_and_torsionFree` | `⊥`; `PSL(2, ℂ)`; a discrete group with an elliptic element | both sides true; both false (stabilizer `PSU(2)`); left false (fixed geodesic), right false | iff holds | none |
| `rat_ratio_of_commensurable` | `Γ = Δ`; `Δ ≤ Γ` of index `n` | `q = 1`; `covol Γ = (1/n) covol Δ` | holds; `0 < q` needs finite nonzero covolumes, supplied by `IsCofinite` and R05 | none |
| `mul_index_mem_hyperbolicVolumes` | `Δ = Γ`; `Δ` of index `n` | `1 · v`; `n · v` witnessed by `Δ` (discrete, torsion free, covolume `n · covol Γ ≠ ⊤`) | holds | none |
| `hyperbolicVolumes` excludes `0` | any witness | `covolume_pos` and `≠ ⊤` give `toReal > 0` | holds given R05 | none |
| `ThurstonQuestion23` | `w = 0` | excluded by positivity; statement is "`∃ v, w` in the set with `v/w ∉ ℚ`" | faithful to thurston1982 line 913–914 (orientable manifolds suffice: a double cover doubles the volume) | none |
| `NoSmallRationalRatio N` | `q = 0` (den 1); `N = 0, 1` | needs `20 G ≠ 0`; vacuous (closed by `simp` on the probe) | well-formed | R09 |
| Bianchi covolumes not in the set | `G/3 = 0.305`, `√3 L/8 = 0.169` | below Weeks `0.9427` (closed, Milley) and `2.0299` (cusped, Cao–Meyerhoff) | claim true, citation incomplete | R10 |
| `catalanConstant`, `lchi3` as `tsum` | partial sums | `1 − 1/9 + 1/25 − … = 0.91597`; `1 − 1/4 + 1/16 − 1/25 + … = 0.78130`; both absolutely summable | `tsum` is the intended value | none |
| `bianchi F ι` for the two embeddings | `ι`, `conj ∘ ι` | `(1, i; 0, 1)` versus `(1, −i; 0, 1)` | distinct conjugate subgroups, as the README says | none |

**Library declarations opened at the pins.** Mathlib: `UpperHalfPlane` `MeasurableSpace`/`BorelSpace`/`MeasureSpace` instances and `volume_def` (`Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean` lines 33–50), `SMulInvariantMeasure (GL (Fin 2) ℝ) ℍ volume` (line 89), `dist_eq` and `cosh_dist` (`…/Metric.lean` lines 42, 67), `HasFundamentalDomain` and `covolume` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean` lines 668, 679), `IsFundamentalDomain.covolume_eq_volume` (line 695), `Subgroup.Commensurable` (`Mathlib/GroupTheory/Commensurable.lean`), `Subgroup.relIndex` (`Mathlib/GroupTheory/Index.lean` line 64), `Subgroup.instMeasurableConstSMul` (`Mathlib/MeasureTheory/Group/Arithmetic.lean` line 494), the subgroup `SMulInvariantMeasure` instance (`Mathlib/MeasureTheory/Group/Measure.lean` line 109), `ProperlyDiscontinuousSMul` (`Mathlib/Topology/Algebra/ConstMulAction.lean` line 532), `QuotientGroup.instT2Space` (`Mathlib/Topology/Algebra/ProperAction/Basic.lean` line 206), `NumberField.IsTotallyComplex` (`…/InfinitePlace/TotallyRealComplex.lean` line 209), `NumberField.dedekindZeta` (`…/NumberField/DedekindZeta.lean` line 49), `DirichletCharacter.LFunction` (`…/LSeries/DirichletContinuation.lean` line 61), `countable_of_Lindelof_of_discrete` (`Mathlib/Topology/Compactness/Lindelof.lean` line 571); no Catalan's constant, no three-dimensional hyperbolic space, no measure-theoretic fundamental domain for the modular group in Mathlib (grep). Tau Ceti: `IsFundamentalDomain.subgroup_iUnion_out_inv_smul` (line 131), `covolume_pos` (line 298), `covolume_conjAct_smul` (line 308), `covolume_eq_card_mul_covolume` (line 322) in `TauCeti/MeasureTheory/Group/FundamentalDomain.lean`; `exists_isFundamentalDomain_of_properlyDiscontinuousSMul` (line 100) in `…/ProperlyDiscontinuous.lean`; `Subgroup.volume_compl_freeLocus` (line 86), `Subgroup.IsCofinite` (line 106), `Subgroup.isCofinite_iff_covolume_ne_top` (line 114) in `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean`; `T2Space PSL(2, ℝ)` (`TauCeti/Topology/Algebra/Matrix/ProjectiveSpecialLinearGroup.lean` line 33); `Matrix.SpecialLinearGroup.finite_center` (`TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean` line 227); `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity.lean` (six `chartVolumeDensity` declarations only); `catalan` in `TauCeti/Algebra/TemperleyLieb.lean` line 50 is the Catalan numbers, as the README says.

**Cross-roadmap citations resolved.** FuchsianOrbifolds on main: scope excludes "general Kleinian groups, higher-dimensional locally symmetric spaces" (README line 27); discreteness is the input (line 130); covolume from Mathlib's `UpperHalfPlane.volume` (lines 132–136). GeometricTopology on main, layer 7 (lines 627–695): see R04. Polylogarithms at its open head, §2.4: see R03. HeegaardFloer at its open head, `pslComplex_t2`: see R08; HeegaardFloer on main does not declare it. Ownership against the other open pull requests the brief lists was checked by the `roadmaps grep` over Bianchi, Kleinian, Humbert, Catalan, Thurston, upper half-space, `PSL(2, ℂ)`: QuaternionicModularForms (open) consumes this roadmap and plans nothing of it; K3BlochGroups and BorelRegulators plan no hyperbolic space. The merge order lists this roadmap last (353), after Polylogarithms (327) and PolylogarithmFunctions (42).

**Elaboration.** `lake env lean` on a probe copy (sub-imports replaced by `import Mathlib` plus `TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Basic`, built first): every original declaration elaborates with `sorry` the only warning (35 such warnings, matching the gate's `build=0`); the added probes gave the results reported in R05 and R08. The 45 elaborated signatures in the worker's listing were compared with the README: `covolume_eq_index_mul_covolume` carries `[Countable Γ] [HasFundamentalDomain Γ H3 volume]` as the README says; `bianchi` and `bianchiGamma` carry `[IsTotallyComplex F] [Fact (finrank ℚ F = 2)]` and the embedding as data, matching the convention; no declaration lost a binder.

## Not verifiable

- Elstrodt–Grunewald–Mennicke, *Groups Acting on Hyperbolic Space* (egm1998): paywalled (Springer DOI); recorded `uncertified`. The README cites it only by chapter ("chapter 8") for Humbert's formula and the Bianchi domains; the theorem numbers it should carry (R06) could not be checked.
- Maclachlan–Reid, GTM 219 (maclachlanreid2003), and Ratcliffe, GTM 149 (ratcliffe2019): paywalled; recorded `uncertified`; cited without locators.
- Humbert, C. R. Acad. Sci. Paris 169 (1919) (humbert1919): the sources service found no legal copy (Gallica not resolved); listed in `needs-references.toml`. The formula was checked numerically instead (table rows 1–2).
- Neumann–Yang (neumannyang1999, arXiv math/9712224): fetched; the README cites it only "for why the question is arithmetic", with no statement to check.

## Source issues

- none
