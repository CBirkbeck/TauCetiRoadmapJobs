# Review of SobolevMapsBetweenManifolds (design, round 5)

**Verdict:** accepted

One finding, P3 and non-blocking: a note for the package stage. The round-4 finding is repaired.
No P1 or P2 finding, no declared gap, no conditional gap.

## Round-4 finding, checked

- **F01 (P3, six theorem targets with their locator in `plan.json` only) — repaired.** Each of the
  six now carries a locator at the claim in `packages/SobolevMapsBetweenManifolds/design/README.md`:
  - §1.4, line 501: "equal to `u` almost everywhere on `V` (Mazya2011 §1.1)".
  - §3.2, line 744: "equivalently every, Haar measure `μ` on `E` (Lee2012 Ch. 16)".
  - §3.3, line 766: "Prove (Lee2012 Ch. 6):".
  - §4.4, line 948: "(Ziemer1989 Ch. 2 §2.1, where the classical derivative of a `C¹` function on a
    Euclidean domain is its weak derivative)".
  - §4.5, line 966: "(Mazya2011 §1.1, locality of weak derivatives)".
  - §5.3, lines 1099–1100: "(Hajlasz2009 lines 104–106, for Riemannian metrics on a compact manifold;
    the compactness argument uses only continuity)".

  The repair replaced two of the locators the review proposed. Both replacements are sound:
  - §4.4: HeikkilaPankka2025 lines 22–27, read again, define the class, the distortion inequality
    and name `‖Df‖`, `J_f`; nothing there concerns `C¹` maps. The replacement is uncertified (see
    Not verifiable).
  - §5.3: Hajlasz2009 lines 102–106, read, assume compact smooth connected manifolds and say that
    all Riemannian metrics on them are equivalent, so the choice does not matter. That is the
    compact case of §5.3's last sentence, and the README states that scope.

  `plan.json` 4.4 and 5.3 carry the same locators; a script over the 29 targets finds each target's
  plan source key in its README section. `sources.toml` `cited_for` lists agree (Ziemer1989 gains
  4.4, Hajlasz2009 gains 5.3, Rickman1993 and HeikkilaPankka2025 drop them).

**Pattern search.** Locator only in the plan: none left (29 of 29 sections cite their plan source).
Locator into a passage that does not state the claim: the other certified citations were read at
their lines (table below); none fails.

## R01 (P3) — identities for the total `Df` are stated without the hypothesis that gives existence

**Location.** `packages/SobolevMapsBetweenManifolds/design/README.md` §4.5 line 968 ("`f ∈
W^{1,p}_loc(M, N)` gives `f|_U ∈ W^{1,p}_loc(U, N)`, with `D(f|_U) = Df|_U` almost everywhere"),
§4.6 lines 1009–1013, §4.1 lines 841–842, §4.3 lines 916–917, §4.5 lines 973–977, §8.2 lines
1367–1368.

**Claim.** These almost-everywhere identities hold for the total choice `Df` on the manifolds of
the Conventions, where Lindelöf is not assumed.

**Witness.** §4.3 line 920: `Df` is "a weak differential when one exists, and `0` otherwise", and
line 913 proves existence only "if `M` is Lindelöf". `plan.json` 4.5 has hypotheses "as in 4.2",
4.6 and 8.2 list no `LindelofSpace`. If `f` had no weak differential on `M` but one on a chart
domain `U`, `Df|_U = 0 ≠ D(f|_U)`.

**Repair.** No instance refuting the statements was found (on `M' = ℝ × D`, `D` uncountable
discrete, weak differentials exist slice by slice), so this is a precision note, not a missing
hypothesis with a counterexample. State each identity for every weak differential, which needs no
countability, and derive the `Df` form under Lindelöf:

- Conventions, Totality (line 176): replace "`0` off the class" by "`0` when no weak differential
  exists", as §4.3 has it, and add: "An almost-everywhere identity for `Df` or `Du` in Layers 4 and 8
  says that the field on one side is a weak differential whenever the field it is built from is
  one. For Lindelöf source manifolds it is the identity for the total choice."
- §4.5 first item: "if `D` is a weak differential of `f`, then `D|_U` is one of `f|_U`"; third and
  fourth items likewise. §4.6: "(a) if `D` is a weak differential of `f`, then `y ↦ D(θ y) ∘ dθ_y`
  is one of `f ∘ θ`; (b) `x ↦ dg_{f(x)} ∘ D(x)` is one of `g ∘ f`". §4.1's composition bullet, §4.3's
  chart formula and §8.2's `D(ι ∘ f) = dι ∘ Df` in the same form.
- `plan.json` 4.5, 4.6, 8.2: add the hypothesis "LindelofSpace of the source manifolds for the
  identities of the total choice".

Tested on the instance: with `θ(x, d) = x` from `ℝ × D` to `ℝ` and `f = |t|`, the field `sign(x)` on
each slice is `D(θ y) ∘ dθ_y` for `D = sign`, and it is a weak differential of `f ∘ θ = |x|` in every
slice chart; the repaired (a) holds with no countable cover, and the `Df` form holds on Lindelöf
`M'`. QuasiregularMaps' gap `sobolev-maps-chain-rules` asks for the identity on second countable
manifolds only, so the consumer is unaffected.

## Verified sound

**Principles.** No route-specific shortcut: every `1 ≤ p ≤ ∞`, every finite-dimensional target,
no bound on the `C¹` factors, no injectivity in §2.2, dimension `0` computed, Nash's theorem a
hypothesis. No re-planned roadmap: Tau Ceti's `W1p` and weak derivatives, PDE Layer 1,
GeometricCurrents G6, PseudoholomorphicCurveAnalysis PH1.1, PH1.2, PH4.1, DifferentialGeometry
Layers 2 and 12, RiemannianGeometry R4.6 and GeometricMeasureTheory G2 are cited, not restated.
No upward or cyclic supply (gate below). No copied passage (the README quotes no source text). No
computational algorithm. The design has no Lean file, so no sorry'd data and no `set_option`.
Elaboration: not available (this lane does not elaborate; the design stage has no
`Suggested.lean`).

**Gate.**

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after VirtualFundamentalClasses (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2031 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` (main `9897cdb`, 432 open heads): no cross-roadmap
citation and no Lean name found nowhere. `roadmaps overlaps`: no other pull request changes this
roadmap, no dropped id, no id only an open revision defines. Pins: `lake-manifest.json` has Mathlib
`1b1ccf4` and Tau Ceti `2fd255d`, equal to `plan.json`'s baseline and unchanged since round 4.

Intake note: `merge-order/ORDER.txt` line 288 lists QuasiregularMaps, which consumes this roadmap
through six declared gaps (`packages/QuasiregularMaps/README.md` lines 319–339, slugs
`sobolev-maps-class`, `-weak-differential`, `-norm`, `-jacobian`, `-chain-rules`, `-euclidean`).
Each is covered here (T2 with §4.4–§4.5; §3.1 and §4.3; §5.1–§5.3; §6.1–§6.3; §3.3 and §4.6; §7.1),
so this roadmap is inserted before it. This roadmap names QuasiregularMaps only as a consumer.

**Sources: the seeded sample, at the locators.** The author flagged no locator as unverified beyond
the five uncertified texts.

| Target | Locator | Result |
|---|---|---|
| 1.2 | Ziemer1989 Ch. 2 §2.1; Mazya2011 §1.1; HeikkilaPankka2025 lines 22–23 | first two uncertified; HeikkilaPankka2025 line 23 names the local class `W^{1,n}_loc(M, N)` of a continuous map, the object generalised to every `p` |
| 2.1 | Lee2012 Ch. 6 | uncertified |
| 2.2 | Ziemer1989 Thm 2.2.2; Mazya2011 §1.1 | uncertified; Tau Ceti's `Analysis/Sobolev/WeakDeriv/MeasurePreserving.lean` line 61 cites the same Ziemer §2.2 for bi-Lipschitz changes of variables |
| 3.1 | Lee2012 Ch. 6, Ch. 16 | uncertified; RiemannianGeometry R4.6 on main (lines 2248–2256) states the same comparison for its conventions |
| 3.3 | Lee2012 Ch. 6 | uncertified |
| 4.3 | HeikkilaPankka2025 lines 22–26 | read: line 26 speaks of the operator norm of "the weak differential `Df`"; a definition target, supported |
| 4.5 | Mazya2011 §1.1 | uncertified |
| 4.6 | Ziemer1989 Thms 2.1.11, 2.2.2 | uncertified |
| 5.1 | HeikkilaPankka2025 line 26; Rickman1993 Ch. I §1 | line 26 read, supports; Rickman uncertified |
| 5.2 | Rickman1993 Ch. I §1; HeikkilaPankka2025 lines 22–26 | the lines give the class and `‖Df‖`; the equivalence is this roadmap's theorem; Rickman uncertified |
| 6.2 | HeikkilaPankka2025 lines 25–27; Lee2012 Ch. 15 | lines 25–27 read: (1.1) and "`J_f` is the Jacobian determinant of `f`"; Lee uncertified |
| 6.3 | Rickman1993 Ch. I §1; HeikkilaPankka2025 line 23 | line 23 read: the borderline `W^{1,n}_loc`; Rickman uncertified |
| 7.1 | MartioRickmanVaisala1969 line 124, lines 332–340 | read: line 124 introduces `J(x, f)` after the formal derivative (lines 118–121); lines 332–340 are 2.16, `ACL` and `ACL^p` (`p ≥ 1`). The README makes no `ACL` claim; the `ACL^p = W^{1,p}_loc` theorem is QuasiregularMaps Layer 5 |
| 8.1 | Lee2012 Ch. 4 | uncertified |
| 8.2 | Hajlasz2009 line 28; HeikkilaPankka2025 lines 1328–1329 | both read: line 28 defines the class through the embedding (`N` compact, no boundary, lines 23–25); lines 1328–1329 pass from `W^{1,∞}` of the composite with a Nash embedding to `W^{1,∞}(M, N)`, the "if" direction |

Also read: Hajlasz2009 lines 37–53 (weakly `p`-harmonic maps), 129–130 (Theorem 2.1, `p > n =
dim M`), 138–141 (`p = n`); HeikkilaPankka2025 lines 20–21. All eight cited works are in
`sources.toml`; the three certified entries carry the hashes of the cached texts; no local path.

**Library declarations opened at the pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).

- `TauCeti.HasWeakFDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`): `(μ : Measure E)
  (Ω : Opens E) (u : E → F) (U : E → E →L[ℝ] F)`, every direction a `HasWeakLineDerivOn`; no `Lᵖ`
  demand, as the supplier contract says. `Module.Basis.hasWeakFDerivOn_of_forall :657`.
- `TauCeti.HasWeakFDerivOn.comp_measurePreserving` (`…/WeakDeriv/MeasurePreserving.lean:130`):
  `MeasurePreserving Φ μ ν`, `LocallyLipschitzOn U Φ`, `MapsTo Φ U V`; derivative
  `(D (Φ x)).comp (fderiv ℝ Φ x)`, the direction §2.2 uses.
- `TauCeti.W1p.hasWeakFDerivOn_comp` (`…/W1p/ChainRule.lean:375`): `p ≠ ∞`, `ContDiff ℝ 1 F`,
  `‖deriv F t‖₊ ≤ M`, as §2.3's first Check. The same file has
  `TauCeti.W1p.exists_value_gradient_ae_eq_comp_of_le` (a `C¹` function on a half-line composed
  with a member bounded below, `p < ∞`, global, scalar): a different statement from §2.4 (no
  continuity, a lower bound instead), not a duplicate.
- `DifferentiableOn.addHaar_image_eq_zero_of_finrank_lt_finrank`
  (`TauCeti/Analysis/Calculus/Sard/LowDimension.lean:73`): `DifferentiableOn ℝ f s`,
  `finrank ℝ E < finrank ℝ F`, every Haar normalisation; no nullity of `s` needed, so §2.1's first
  item follows with room.
- `TauCeti.chartVolumeDensity` (`…/VolumeDensity/Basic.lean:48`, `√det` of the chart Gram matrix),
  `chartVolumeDensity_pos :61` (on the trivialisation base set), `TauCeti.chartRiemannianVolume`
  (`…/VolumeDensity/Measure.lean:113`: `finBasis.addHaar.withDensity`, comap along the chart
  restricted to its source, mapped by `Subtype.val`; no boundarylessness in its variables),
  `TauCeti.riemannianVolume` (`…/Volume.lean:82`), `riemannianVolume_restrict_source :87`. §3.1's
  route matches these, with boundary allowed.
- `TauCeti.Manifold.Orientation.IsOrientationPreservingAt` (`…/Orientation/Preserving.lean:63`): a
  continuous linear equivalence equal to `mfderiv f x` carrying `orientationAt x` to
  `orientationAt (f x)`. So §6.2's "then `J(mfderiv f x) > 0`" has the bijectivity it needs.
- `LinearMap.normDet` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`): defined for maps
  between different spaces, `0` when the range has no orthonormal basis indexed by
  `Fin (finrank U)`; `normDet_eq_abs_det :389`, `normDet_eq_prod_singularValues :374`.
- `TauCeti.riemannianVolumeForm` (`…/Riemannian/VolumeForm.lean:55`): `(orientationAt o x).volumeFormL`.
- `TauCeti.SmoothEmbedding` (`…/SmoothEmbedding/Basic.lean:75`) and
  `exists_contMDiffMap_extension_hasCompactSupport` (`…/SmoothEmbedding/Extension.lean:201`;
  variables `:164–171`: `[I.Boundaryless] [IsManifold J ∞ N] [T2Space N] [SigmaCompactSpace N]`
  on the ambient, finite-dimensional ambient model, `n : ℕ∞`): in §8.4 the ambient is `V₁`, `K = N`
  compact, `n = 1`; all hypotheses met.
- `Topology.IsOpenEmbedding.measurableEmbedding`
  (`Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean:687`), `mfderiv_eq_fderiv`
  (`Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:786`), `isAddLeftInvariant_eq_smul`
  (`Mathlib/MeasureTheory/Measure/Haar/Unique.lean:919`),
  `TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval` (`…/WeakDeriv/Interval.lean:302`).
- Every other backticked library name of the README (152 identifiers after removing the
  mathematical symbols and source keys) was matched to a declaration at the pins by script; rounds
  2–4 opened them at the same pins with file and line.

**Cross-roadmap citations resolved on main `9897cdb`.** PDE Layer 1 (`TauCetiRoadmap/PDE/README.md`
line 675); GeometricCurrents G6 (line 668; `W^{j,p}_loc(Ω)` at line 750); PseudoholomorphicCurveAnalysis
PH1.1, PH1.2, PH4.1 (lines 213, 279, 807); SobolevPolynomialApproximation §2.1 (line 324: `C^k`
diffeomorphisms with bounded derivatives, bounded operator on `W^{k,p}`);
PseudodifferentialOperators §5.2 (line 967); GeometricMeasureTheory G2 (line 148);
DifferentialGeometry Layers 2 and 12 (lines 1005, 2796; orientation as chart-sign data line 178;
the no-measurable-structure convention line 192); RiemannianGeometry R4.6 (lines 120, 2248–2256:
it owns the transfer of chartwise nullity to the Riemannian volume, in both directions on chart
sources, with a continuous chart density) and R6's reuse of it for the focal set (lines 3384–3387). Since round 4 the R4.6 transfer has
landed on main, so the Scope's citation needs no open revision. TeichmullerGeometry §7.4,
SobolevDifferentialForms §4.1 and QuasiregularMaps §2.8 (`packages/QuasiregularMaps/README.md` line
758) are cited as deferrals or consumers only; no `*Needs:*` line names them.

**Duplication by object.** `roadmaps grep` over main and the 432 open heads: "oriented Jacobian",
`orientedJacobian`, `W^{1,p}_loc(M, N)`, `W^{1,n}_loc(M, N)`, `L^p_loc(M`, "Jacobian measure" match
nowhere; "Sobolev maps between manifolds" matches PH4.1 only (the `kp > 2` surface case, named in
the Scope); "weak differential" matches PH4.1's `du` and two unrelated uses (Poincare3D, DGFloer).
The pinned libraries have no local Lebesgue or local Sobolev class (grep for `MemLpLoc`,
`LocallyMemLp`, `W1pLoc`: none) and no lemma relating `IsNullSet` to `riemannianVolume`. §3.1 and
R4.6 state one comparison at two generalities; the Scope gives the one-clause difference
(continuous metric, `C¹` Lindelöf manifold, boundary allowed) and §3.1's fourth Check exhibits a
metric outside R4.6. Among the board packages only this roadmap and QuasiregularMaps treat these
objects, and QuasiregularMaps consumes them through its gaps. Ownership against the open pull
requests was checked by these greps.

**Shape.** Summary with T1–T7; Scope and ownership; Conventions; Exact supplier contracts (Mathlib,
Tau Ceti, three roadmaps); How to read the build; eight layers, 29 targets, every layer ending in
`### Examples` and `### Dependencies`; Downstream consumers; Worked examples; References.
`plan.json`: 29 targets, 104 tests, none with fewer than three, no gaps. No process residue (grep
for pull-request numbers, round labels, hand-off words, paths, LaTeX delimiters, `lemma`,
"optional", "deferred": nothing but "round sphere"). No backticked name is presented as this
roadmap's own. One line (222) is 101 characters long.

**Headline theorems.** T1–T7, each with its section labels, all resolving. For the package stage:
T1 is statable on `TauCeti.HasWeakFDerivOn` and `MeasureTheory.MemLp`; T2–T7 need the predicates
of §4.1–§4.3 and the oriented Jacobian of §6.1, each a definition with a real body on carriers that
exist at the pins. No statement of the README is padding-shaped.

**Adversarial table** (the 15 sampled targets, the headline theorems, the target of R01).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 definition | `log|x|` on `ℝ²`; Heaviside; Cantor `c` | `∫_{|x|<1}|x|^{−p} = 2π∫_0^1 r^{1−p}dr = 2π/(2−p)`, `∞` at `p = 2`; `∫Uφ = φ(0)` impossible for `U ∈ L¹_loc`; `c(1/4) = 1/3`, `c(3/4) = 2/3`, derivative `0` a.e. | class iff `p < 2`; two wrong models rejected | none |
| §1.2 degenerate | `E = 0`; identity of `E ≠ 0` | Haar on `0` is a point mass, every `u` a member with `Du = 0`; `∫|x|^p = ∞`, `x` unbounded | local class, not global | none |
| §2.1 item 1 | projection `ℝ² → ℝ`; `finrank E' = 0`; Cantor function | `ℝ × {0} ↦ ℝ`, not null, `2 > 1`; null `A` in the zero space is `∅`; Cantor set `↦ [0,1]`, measure `1` | dimension and differentiability used | none |
| §2.1 item 2 | constant map of `ℝ²`; `θ(z) = z²` on `ℂ ∖ {0}` | `θ⁻¹({c}) = ℝ²`, `Dθ = 0`; preimage of a null set is its two square-root branches, each a `C¹` image | invertibility used | none |
| §2.2 | `θ = 2y`, `u = |x|`; `z²`, `log|w|`; `(y₁, 0)`; `y³ + y` | `Du(2y)∘2 id = 2⟨y,·⟩/|y|`; `⟨z², 2zh⟩/|z|⁴ = 2⟨z,h⟩/|z|²`; `∫_{[−1,1]²}|y₁|^{−1} = ∞`; `(3y²+1)sign y ∉ L^∞(ℝ)` | formula, direction `Du(θ)∘Dθ`, both hypotheses | none |
| §2.2 route | `compL` hypotheses on `W ⋐ Ω'` | `Φ : E → E` after the reduction, injective on `W`, `‖Dθ‖ ≤ L`, `|det| ≥ c` on `W̄`, `p = 1 ≠ ∞`, `MapsTo θ W V`; `u|_V ∈ W^{1,1}(V)` since `V̄` compact in `Ω` | every input present | none |
| §3.1 | dim `0`; `4(dx²+dy²)`; `(1+|x₁|^{1/2})(dx₁²+dx₂²)` | point mass, only null set `∅` both sides; `√det(4I₂) = 4`; density `1+|x₁|^{1/2}`, `∫_0^1(1+t^{1/2})dt = 5/3`; segment null for both | iff holds | none |
| §3.1 route | arbitrary `s`, model with boundary | `MeasurableEmbedding.comap_apply` and `map_apply` hold for all sets; `withDensity ρ` with `ρ > 0` on the target has the Haar null sets there; countable cover by Lindelöf | no measurability or boundarylessness used | none |
| §3.1 flat consequence | `E` inner product space | `finBasis.addHaar` of the `finBasis` parallelepiped is `1`, `volume` of it is `√det Gram` | `volume = √det Gram · finBasis.addHaar` | none |
| §3.3 | covering `t ↦ e^{it}`; `(x,y) ↦ (x,0)`; `ℝ × D → ℝ`, `(x,d) ↦ d` | preimage of a point `2πℤ + t₀`; preimage of the line is `ℝ²`; `s = {0} × D` null, `f(s) = ℝ`; with `D = ℤ`, `f(s) = ℤ` | all three hypotheses used | none |
| §3.3 item 3 | `s ⊆ U` null in `U`, chart of `M` at `x ∉ U` | `source_x ∩ U` second countable, countably many chart sources of `U` cover `s ∩ source_x`, images under `C¹` coordinate changes null | no countability of `M` | none |
| §4.3 definition | `M = N = ℝ`, `φ = 2x`, `f = id` | representative `y/2`; `1·Df·(1/2) = 1/2`, `Df = 1`; with `dφ`: `1/4` | direction pinned | none |
| §4.3 uniqueness | `{D ≠ D'}` in the chart at `x₀` | `φ.source` second countable, countably many `f⁻¹(ψ.source)` cover it; on each, both chart fields are weak derivatives of one map, equal a.e. | null without Lindelöf | none |
| §4.3 total choice | discontinuous `f`; `id_M`; non-Lindelöf `M` | `0`; `mfderiv id = id` is a weak differential, so one exists; existence proved only for Lindelöf `M` | R01 | R01 |
| §4.5 item 1 and §4.6 (a) | `ℝ × D → ℝ`, `(x,d) ↦ x`, `f = |t|` | slice field `sign(x)` is a weak differential of `|x|` in every slice chart | "every weak differential" form holds; `Df` form needs existence | R01 |
| §4.5 corestriction | `tanh`, `W = (−1,1)`, chart at `2` | chart `id`, representative `id ∘ tanh`, `D = 1 − tanh²` | as the Check | none |
| §4.6 (a) | `θ = 2y`, `f = |t|^{1/2}` | `2·sign(2y)|2y|^{−1/2}/2 = sign(y)|2y|^{−1/2}`; `(√2|y|^{1/2})' = sign(y)|y|^{−1/2}/√2`, equal | chain rule | none |
| §4.6 (a) negative | `θ = (y₁,0)`, `f = |x|^{1/2}` on `ℝ²` | `∫_0^1 r^{−p/2} r dr < ∞` iff `p < 4`; `∫|y₁|^{−p/2}dy₁ < ∞` iff `p < 2` | hypothesis used for `2 ≤ p < 4` | none |
| §4.6 (b) | `g = (cos, sin)`, `f = |t|^{1/2}` | values of the representative in the open `ψ(ψ.source ∩ g⁻¹χ.source)`; composite the circle map, `p < 2` | §2.4 applies | none |
| §5.1 | `id : (ℝ, dt²) → (ℝ, 4dt²)`; circle of radius `3`; chart `2x` | `‖Df‖ = 2`; `3|t|^{−1/2}/2`; representative norm `1/2` against `‖Df‖ = 1` | metric norm, not chart norm | none |
| §5.1 chart comparison | compact `K`, `n = 0` | four factors continuous and positive on `K` and `f(K)`; `0 = 0` | bounded constants | none |
| §5.2 (T3) | `|t|^{1/2}`; `t log|t|`; Cantor; `n = 0` | `|t|^{−1/2}/2 ∈ L^p_loc` iff `p < 2`; `|log|t|+1|` in every finite `L^p_loc`, not `L^∞_loc`; classical derivative `0` but no class; `‖Df‖ = 0` and every map in every class | iff both ways; `W^{1,1}_loc` used | none |
| §5.2 route | compact `K ⊆ M`, `M` not Hausdorff | finitely many compact neighbourhoods `C_j` inside overlaps; `μ|_K ≤ Σ μ|_{C_j}` needs no compactness of `K ∩ C_j` | gluing sound | none |
| §5.3 | `g'_N = c²g_N`; `dx²+4dy²`; `e^{2x}dx²` | `‖A‖' = c‖A‖`; `‖id‖' = 2 = β/a`, `α/b = 1 ≤ 2`; ratio `e^x ∈ [e^{−R}, e^R]` on `[−R,R]` | bounds; compact comparability | none |
| §6.1 definition | `diag(2,1)`; `diag(−1,1)`; `n = 0`; bases `(2e₁,e₂)` | `2`; `−1`, and `+1` into `−o`; `vol_W/vol_V = ±1`, `normDet = 1`; matrix determinant `2` against `J(id) = 1` | sign, direction, orthonormality pinned | none |
| §6.1 Hadamard | orthonormal `b` | `|vol_W(Ab)| ≤ Π|Ab_i| ≤ ‖A‖ⁿ`; `λU`: `λⁿ` both sides | holds, equality case | none |
| §6.2 chart formula | chart frames `e`, `e'` | `vol_N(Df e) = det[D]·ε_N ρ_N`, `vol_M(e) = ε_M ρ_M`, quotient `ε_M ε_N det[D] ρ_N/ρ_M` | formula as stated | none |
| §6.2 Checks | target `4dt²`; `(M,o) → (M,−o)`; fold `(|x₁|, x₂)` | `ρ_N = 2`, `J_f = 2f'`, `normDet = 2|f'|`; `−1`; `sign(x₁)`, `‖DF‖ = 1` | densities and sign used | none |
| §6.2 orientation preserving | `IsOrientationPreservingAt` at the pin | `mfderiv` an equivalence carrying `o_M` to `o_N` | `J > 0` | none |
| §6.3 (T4) | radial stretch; bump sum; `n = 0`; `p = ∞`; junk `Df = 0` | singular values `r^{−1/2}`, `r^{−1/2}/2`, `J = r^{−1}/2 ≤ r^{−1}`; `p < 4`, `q < 2 = p/n`; `Σ2^{k(p−2)}k^{−p/2} < ∞` iff `p < 2`, inner mass `πλ_k²r_k²/4 = π/(4k)`, `Σ = ∞`; `p/0 = ∞`, `J = ±1`; `∞/n = ∞`; `0 ≤ 0`, and `1 ≤ 1` at `n = 0` | holds everywhere; `L¹_loc` only for `p ≥ n` | none |
| §6.4 | `2x`; `−x`; `z²` on `1 < |z| < 2` | `2 = vol([0,2])`; `μ⁺ = 0`, `μ⁻([0,1]) = 1`; `2π∫_1^2 4r³dr = 30π` against area `15π` | injectivity used | none |
| §7.1 (T6) | `Ω : Opens E`, `ψ = id`; reflection; `z²`; inversion | chart `Subtype.val`, target `Ω`, representative `f̃`; `−1`; `4|z|²`; `‖Df‖ = |x|^{−2}`, `J = −|x|^{−2n}` | iff and the three identifications | none |
| §8.1 | circle; `s³`; figure eight; `N` a `0`-manifold | `r(v) = v/|v|` on `ℝ² ∖ {0}`; left inverse `s^{1/3}` not differentiable at `0`; source neighbourhood `U` suffices; `r` constant | injective differential used, injectivity of `ι` not | none |
| §8.2 (T5) | circle, `ι` and `2ι`; `ι = s³`, `f = t^{1/3}`; double cover | `|t|^{−1/2}/2` on both sides, doubled by `2ι`; `ι∘f = id`, `Df = |t|^{−2/3}/3 ∈ L^p_loc` iff `p < 3/2`; `e^{i|t|^{1/2}}`, both classes `p < 2` | immersion and isometry used | none |
| §8.2 route "if" | `f = r∘(ι∘f)` near `x₀` | `ι∘f∘φ.symm` continuous with values in the open `t ∩ r⁻¹(ψ.source)`, `ψ∘r` `C¹` there | §2.4, then §4.5 | none |
| T1 (§1.3) | `sign(x₁)` on two half-planes; `log|x|`; empty index | `Du = 0` on each, jump across the null line; cover `{ℝ² ∖ 0, B(0,1)}` gives `p < 2`; `Ω = ∅` | open cover of all of `Ω` needed | none |
| T1 (§2.3, §2.4) | `e^{t²}`, `log|x|`; `G = st`; `log` on `(0,∞)` | `(log|x|)² ≥ −2log|x|` for `|x| ≤ e^{−2}`, `G(u) ≥ |x|^{−2}`; `u₂Du₁ + u₁Du₂`; `⟨x,·⟩/|x|²` | bounded derivative or continuity needed | none |
| T2 (§4.2) | circle map; atlas `{x³}` | `p < 2`; `|y|^{1/3}`, `∫|y|^{−2p/3} < ∞` iff `p < 3/2` | atlas independence within one `C¹` structure | none |
| T7 (§8.4) | `(s, e^{e^s})`, `u = log log(1/|x|)`; double cover; `(z, z²)` | `2π∫_0^{1/e} dr/(r log²(1/r)) = 2π`; second coordinate `1/|x|`, `∫r^{−2}r dr = ∞`; `ι₁∘u = z/|z|`, `ι₂∘u` jumps; both gradients `≍ 1/|x|`, `p < 2` | compactness and injectivity used | none |
| Worked examples | radial stretch; `zᵏ`; hemisphere | `‖Df‖²/J_f = 2`; `J = k²|z|^{2k−2} = ‖Df‖²`; `2π` | consistent with §5–§6 | none |

**Overlap facts.** `scratch/overlaps.md`: none of the four lists has an entry. The closest roadmaps
(DifferentialGeometry, SobolevDifferentialForms, ComplexKahlerGeometry, SmoothBundlesConnections)
own no object of this roadmap: SobolevDifferentialForms §4.1 is the global form pullback the Scope
names; the others own no Sobolev class of maps.

**Declared gaps.** None declared, none needed: every prerequisite is a section here, a section of
a roadmap on main, or a pinned declaration.

**Untrusted text.** Nothing in the earlier reviews, the repair report, the sibling roadmaps or
the sources asked for an action; all of it was read as data.

## Not verifiable

- Ziemer1989 Ch. 2 §2.1, Theorems 2.1.11 and 2.2.2; Mazya2011 §1.1; Rickman1993 Ch. I §1; Lee2012
  Ch. 4, 6, 15, 16: paywalled and settled as uncertified in `sources.toml`; cited by locator, pages
  not opened. In particular the new §4.4 locator (Ziemer1989 Ch. 2 §2.1 for "a `C¹` function's
  classical derivative is its weak derivative") and whether Rickman1993 Ch. I §1, rather than a
  later section of that chapter, carries `|J| ≤ |f'|ⁿ` could not be checked. The statements are
  standard and are proved here from pinned declarations, so no proof depends on these texts.
- Bethuel1991: settled as uncertified; context for §8.3 and the Part II scope only.
- Elaboration: not available (this lane does not elaborate; the design stage has no
  `Suggested.lean`).
- Whether a member of the class on a non-Lindelöf manifold can fail to have a weak differential
  (R01): neither proved nor refuted; the repair removes the dependence on it.

## Source issues

- **Misprint** in HeikkilaPankka2025 at Appendix B, proof of Proposition B.1, line 1328 (arXiv v2): the source says the composite of `p : M → N` with the embedding `ι : N → ℝ^m` is `p ∘ ι`; it should be `ι ∘ p`, the only composable order; affects nothing.
