# Review of CharacteristicClasses (pull request #1807 at ac36c47)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CharacteristicClasses/` at this head. Eight of the previous review's nine findings are repaired (see "Previous findings" below). There are five findings, one of them blocking. The blocking one, R01, was introduced by following r36's own repair text, which misread an AlgebraicTopology line.

## R01 (P2) — the compact-generation coreflection is cited from AlgebraicTopology Stage 4.5, which says it does not own it

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:25–28`: "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection and the compactly generated substrate on which the stable colimits are formed". Also `:436–440`: "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection k, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its counit …".

Claim: this is supplier drift: a supplier is cited for an object it says another roadmap owns. Among the roadmaps this one may cite, the coreflection therefore has no owner.
- At this head, AlgebraicTopology says that HomotopySpheres §3A.1 owns the coreflection, and that Stage 4.5 consumes it. Stage 4.5 owns only the realization product comparison "together with the compact-generation facts it uses". Main's copy, lines 117–120, says the same.
- HomotopySpheres is on the list of roadmaps never to be cited.
- The pins do not have the coreflection. Mathlib's `Topology/Category/CompactlyGenerated.lean` declares only `of`, `ofHom`, `compactlyGeneratedToTop` and `fullyFaithfulCompactlyGeneratedToTop`. The only pinned coreflector is `TopCat.toDeltaGenerated` (`Topology/Category/DeltaGenerated.lean:64`).
- r36's repair of its R01 quoted AlgebraicTopology line 126 ("owns the compact-generation coreflection") as if AlgebraicTopology owned it. The subject of that sentence is "HomotopySpheres §3A.1" on line 125.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:125–127` at this head: "HomotopySpheres §3A.1 … owns the compact-generation coreflection and CW comparison consumed by 4.5's kified CW product, 8.10 and 8.11a/b."

Repair: the stable carriers do not need the coreflection. TopologicalKTheory T1.6a already forms them in Mathlib's `CompactlyGenerated` "with underlying weak-CW union topology" (`TauCetiRoadmap/TopologicalKTheory/README.md:647–650`).
- Lines 25–29: replace the sentence with "TopK T1.6a forms the fixed-rank and stable colimits in Mathlib's `CompactlyGenerated`, with underlying weak-CW union topology; the stable O/SO and ΩBSO comparisons are downstream consumers of these classifiers, not inputs to the finite oriented-cover comparison."
- Lines 436–440: delete "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection … for the stable carriers." Write instead: "Compute singular chains and cochains of the stable carriers on the underlying weak-CW union topology of TopK T1.6a; C3.6's direct-union argument applies to that space."
- If a k-ification is still wanted, for example for products of stable carriers, state it here as this item's own target. Name the functor, its universal property against compact Hausdorff test spaces, and the fact that singular simplices are unchanged, since every standard simplex is compact Hausdorff.

Test: afterwards `grep -n "Stage 4.5" README.md` returns no line, and the only AT4.5 citations left are the pushout names `relativeCWPushout`, `homotopyPushoutGluingComparison` and `relativeCWPushoutCWModel`, all present at AlgebraicTopology lines 659, 673 and 731.

## R02 (P3) — C1.1d and C1 item 2 plan, or take from a supplier's plan, principal-bundle and Bockstein API that the pinned Tau Ceti has

Location: `README.md:452–456`: "define a global trivialization as an equivariant bundle isomorphism P≃X×G … Construct its equivalence with global sections, using the bundle division map, and prove the inverse formulas and pullback laws." Also `:479–481` ("Changing the hemisphere sections to s_N a and s_S b changes c to a⁻¹cb") and `:571–574` ("Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and Bockstein construction …").

Claim: the README never names the pinned principal-bundle carrier or the pinned Bockstein, but plans parts of both.
- `Topology/FiberBundle/Principal.lean` at the pin has the class `TauCeti.PrincipalBundle`, the division map `TauCeti.PrincipalBundle.division`, and `TauCeti.PrincipalBundle.trivializationOfSection`. That last turns a section continuous on an open set U into the equivariant trivialization `p ↦ (p.proj, division G (σ p.proj) p)`; with U = X it is the README's τ. The file also has `TauCeti.PrincipalBundle.pullback` and `Bundle.Trivialization.coordChange_eq_mul` (transition functions are left multiplications).
- `Topology/FiberBundle/GroupCocycle.lean` has `TauCeti.fiberBundleCoreOfGroupCocycle`, its principal instance `principalBundle_fiberBundleCoreOfGroupCocycle` (line 294), and `TauCeti.homeomorphOfCohomologous` (line 198). Changing sections by `h` there gives the cocycle `h_i⁻¹ g_ij h_j`. With i = N, j = S, h_N = a and h_S = b this is exactly the README's `a⁻¹cb`.
- `AlgebraicTopology/Cohomology/Bockstein.lean` has `TopCat.singularCohomologyBockstein` (line 127) and `TopPair.singularCohomologyBockstein` (line 278). It also has the exactness lemmas `singularCohomology_exact_coefficient₁/₂/₃` and naturality in maps and in coefficient sequences. AlgebraicTopology 6.1 (its line 1269–1277) plans the same construction.
- Minor: `README.md:1579–1580` calls `LieAlgebra.HasCentralRadical` "LieHighestWeight L9's". It is Mathlib's class (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`), as LieHighestWeight's own README, line 30, says.

Witness: `#check @TauCeti.PrincipalBundle.trivializationOfSection`, `@TauCeti.PrincipalBundle.division`, `@TauCeti.PrincipalBundle.pullback` and `@Bundle.Trivialization.coordChange_eq_mul` all elaborate at the pin (scratch `Probe3.lean`).

Repair:
- In C1.1d's first paragraph, consume `TauCeti.PrincipalBundle`, `PrincipalBundle.division`, `trivializationOfSection` (global case) and `PrincipalBundle.pullback` by name and file. Section to trivialization is the pinned map; trivialization to section is `b ↦ e⁻¹(b,1)`. Keep as targets the packaging as an equivalence, the C(X,G)-torsor of trivializations, homotopies of trivializations and the relative extension statements.
- In the clutching paragraph, glue on open thickenings of the hemispheres with `fiberBundleCoreOfGroupCocycle`, and read the change of sections from `homeomorphOfCohomologous`.
- In item 2, cite `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` with their exactness and naturality lemmas. Keep AT6.1 only for what the pin lacks: the 0→ℤ→ℤ→𝔽₂ normalization, pair-connecting compatibility and cup Leibniz.
- At line 1580, write "Mathlib's `LieAlgebra.HasCentralRadical`".

## R03 (P3) — the README lacks the house shape, most definitions have no Checks, and only one target has a `*Needs:*` line

Location: the whole README. The headings are `# Characteristic classes and Chern–Weil theory`, `## Carriers, scope and suppliers`, `## Conventions`, `## C1.`–`## C7.` and `## Dependency order and references`. `grep -c '\*\*Checks\.\*\*'` gives 8 and `grep -c '\*Needs:\*'` gives 1, the latter at C1.5a, line 808.

Claim: the house shape and per-target obligations are missing.
- There is no `# Roadmap:` title, no `**Summary.**`, no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k:` headings, per-layer `### Examples` / `### Dependencies`, or `## Downstream consumers`. References are merged into the dependency section.
- Pinned declarations are listed inline in C1.0, C1.1a, C2.1, C2.2, C5.1, C6.1 and C7.1, instead of under "From Tau Ceti".
- The seeded sample has no Checks and no `*Needs:*`: C1.0 (lines 230–292), C2.0 (847–919) and C5a.1–C5a.7 (1680–2016).
- Other definitions without Checks include:
  - C1.2a: `C_c^*` and support-excisive pairs;
  - C1.2b: Čech `H^q`;
  - C1.5: `x` and `w₁`;
  - C2.4–C2.6: Gysin maps, `p!` and the G/T transfer;
  - C3.1: the Leray–Hirsch map;
  - C3.2: `w_i` and `c_i`;
  - C3.3: `p_i` and `W_k`;
  - C4.1–C4.2: the invariant-polynomial forms;
  - C5a.2: `QI` and `u_i`;
  - C5a.3: `W(g)` and `CS_P`;
  - C6.1–C6.3: the bundle classes, `ch_j` and `Hper`;
  - C7.3a: `w̄(M)` and `ν_f`.
- The items themselves already compute discriminating values that could serve as Checks, for example:
  - the degree-one CE differential `da(X,Y) = −a([X,Y])` against Mathlib's `d₁₂_apply_apply_ofTrivial`;
  - `τ(−a/(2π)) = −θ/(2π)` on the circle;
  - `F_t` at `t = 0, 1`;
  - the sup-ball map `v ↦ (‖v‖∞/‖v‖₂)v` and its inverse;
  - the rank-0 Thom model `X₊`;
  - the metric-change identity `h₁(H^{−1/2}u, H^{−1/2}v) = h₀(u,v)`.

Repair:
- Retitle to `# Roadmap: characteristic classes and Chern–Weil theory` and add a `**Summary.**` paragraph.
- Rename the scope section to `## Scope and ownership`. Move the pinned-name lists into `## Exact supplier contracts` (From Mathlib, From Tau Ceti, From TauCetiRoadmap.<X>), keeping one-line consumption sentences in the items.
- Turn the first paragraph of "Dependency order" into `## How to read the build`.
- Rename `## Ck.` to `## Layer k:` with `### k.n` subsections, and end each layer with `### Examples` and `### Dependencies`.
- Give every definition above three Checks, using the values just listed for the sampled ones.
- Give each target its own `*Needs:*` line.
- Split `## Downstream consumers` and `## References`.

## R04 (P3) — the module docstring's "not statable" list omits headline items the README's opening paragraph names

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:44–93`.

Claim: the README's opening lists as aims "integral Chern, Pontryagin and Euler classes, mod2 Stiefel–Whitney classes", "the compact connected Lie-group CE/de Rham … comparisons" and "the Todd, L and Â multiplicative classes". The docstring names none of the following as not statable:
- C5a.1's de Rham/Chevalley–Eilenberg ring isomorphism. The pins have only low-degree Lie cochains: Mathlib `Algebra/Lie/Cochain.lean` defines `oneCochain`, `twoCochain`, `d₁₂` and `d₂₃` (lines 43–156), and Tau Ceti's `Algebra/Lie/Cochain.lean` is titled "Low-degree Lie algebra cochains". There is no all-degree CE complex.
- C3.2–C3.3's Whitney, uniqueness and integral-correction laws for `w`, `c` and `p`. The docstring mentions "no Chern or Stiefel–Whitney class" only inside the universal-rings bullet.
- C6.1's bundle-level `Td(E)`, `L(E)` and `Â(E)` with their Whitney laws. There is no Chern or Pontryagin class.
- C5.1's `I(G) ≅ Sym(t*)^W` for a compact connected Lie group. The pin has no maximal torus or Weyl group of a compact Lie group, and the pinned `LieSubalgebra.lieChevalleyRestrictionIso` is for an algebraically closed field of characteristic 0.

The closing paragraph (90–93) says C7.1's genus polynomials "are proved at the pin". `L₃` is a README target (line 2142) and is correctly not stated here, being a small value.

Witness: `grep -n "C5a.1\|C3.2\|C5.1" Suggested.lean` returns nothing; C6.1 appears only in the series sentence at line 90.

Repair: add four bullets with these reasons, and change "the low-degree genus polynomials of C7.1 are proved at the pin" to "the pinned genus polynomials `Td₁–Td₃`, `L₁`, `L₂`, `Â₁`, `Â₂` that C7.1 consumes".

## R05 (P3) — the order with #1854, which also changes this folder, is still not stated

Re-raises r36 R09, which is not repaired. The pull request description is unchanged.

Location: pull request description, merge-order paragraph: "No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request."

Claim: #1854, by the same author, carries `TauCetiRoadmap/CharacteristicClasses/` at c07dda7, and its head conflicts with this one in `CharacteristicClasses/README.md` (worker's `overlaps.md`). The order with #1808 is stated; the order with #1854 is not.

Witness: `roadmaps list` row "#1854 … CharacteristicClasses … c07dda7 … Cut the dependency loops main acquired after the pin bump".

Repair: name #1854 in the merge-order paragraph with its position, and rebase whichever merges later onto the repaired folder.

## Previous findings (r36, read at 70140e6)

- **R01 (HomotopySpheres) — repaired.** `grep -c HomotopySpheres` gives 0 in both files, and the gate reports `dropped=0`. The replacement text is the source of R01 above.
- **R02 (docstring; absent headlines) — repaired.**
  - `Suggested.lean:14–24` now names the pinned Thom, Euler, orientation-cover and directed-union carriers.
  - Lines 125, 149 and 165 state the C2.1 and C2.2 headlines, and line 187 adds Whitney's ℝP headline.
  - The remaining "not statable" reasons are correct at the pin (see Verified sound). The omissions are R04.
- **R03 (planned pinned objects) — repaired.**
  - Lines 76–90 cite `TauCeti.TopCat.serreFibrations`, `mem_serreFibrations_of_exists_trivialization`, `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_cube_of_exists_trivialization`.
  - C1.0 (233–253, 276–288) consumes `OrthonormalFrameBundle`, `VectorBundleOrientationCover` and `orientationCoverHomeomorph`.
  - C2.0 (864) cites `FiberBundle.t2Space_totalSpace`.
  - C2.1–C2.2 (921–1022) consume `thomPair`, `IsThomClass`, `eulerClass` and the Mayer–Vietoris and directed-union lemmas.
- **R04 (pinned series) — repaired.** C6.1 (2020–2045) and C7.1 (2129–2141) cite `multiplicativeSequence`, `hirzebruchLSeries`, `aHatSeries`, `bernoulli'PowerSeries` and the genus lemmas by name, and `Suggested.lean` defines no series.
- **R05 (five non-headline theorems) — repaired.** All five are deleted.
- **R06 (C5.1 names) — repaired.** Lines 1570–1616 cite `ContRepresentation.isUnitarizable`, `TauCeti.lieCartanRestriction`, `LieSubalgebra.lieChevalleyRestrictionIso` with its two lemmas, and the `killingSymmetricEquiv` family.
- **R07 (TopK T1.1) — repaired.**
  - Line 2292 uses `TauCeti.FiniteRankBundleCore.ofBundle`, and `grep 'T1\.1[^0-9]\|FiniteRankAtlas'` gives 0.
  - "TopK T1's bundle category, metrics and embeddings" replaces "T1.1–T1.3".
  - C2.0's "T1.3" and "T1.4" resolve to TopologicalKTheory's numbered T1 items 3 and 4 (its lines 289, 303).
- **R08 (locators; manifest) — repaired.**
  - C5a.1 now cites Dupont *Fibre Bundles and Chern–Weil Theory* (dupont-ln) A2, A7 and A8.
  - C5a.2 cites Dupont *Curvature and Characteristic Classes* (dupont-ccc) Proposition 8.3 and Hatcher AT §3.G.
  - C5a.6 cites dupont-ccc Corollary 8.35, and C5a.7 cites Hatcher AT Corollary 4D.3 and §3.G.
  - Cartan 1950 and Chern–Simons 1974 are no longer cited; the Weil algebra is cited to alekseev-meinrenken-chern-weil §3.1. All of these were read at their locators.
- **R09 (#1854 order) — not repaired.** It is R05 above.

## Verified sound

**Gate and build.**
- The worker's gate at ac36c47 shows every check at 0 and `OK`, including `build=0` and `outside-folder=0`.
- My re-run of the text gate gives every check at 0 except `outside-folder`. All of its listed files are in the PR's own sibling folders, which this brief names as the pull request's own.
- `git diff --stat origin/main...HEAD` excluding the 14 named folders is empty.
- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0 in 9 s. The only warnings are `declaration uses sorry` at 125:8, 149:8, 165:8 and 187:8.
- One `public import Mathlib` plus two `TauCeti.*` modules, both used. No `set_option`, no sorried data, `theorem` only, 193 lines.

Dependency check this round:

```text
depcheck: 230 roadmaps, 2338 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line; CharacteristicClasses is on main and not in `ORDER.txt`. Some roadmaps both supply and consume this one, with an item-level order that each states:
- SpinGeometry: G4.1a → C3.5 → G4.3. SpinGeometry line 852 states the same order, and G4.1a, lines 397–424 on main, consumes nothing of this roadmap.
- GeneralizedCohomology: G4.0a → C1.1d and C7; its G4 item 2 (line 2043) consumes C2.1, line 2074 leaves the primary obstruction here, and G5 (2550, 2588) uses C3.2's conventions.
- ReflectionInvariantTheory: §§1–4 → C5a → its late adapters.

The check reports none of these as a problem.

**Signatures.**
- `signatures.md` lists 5 entries. `ContMDiffConstSMul` (line 37) is an artefact of the docstring word "instance", not a declaration.
- The four theorems carry every binder their types use; `ι` is correctly absent from the Euler theorem. Each elaborated type matches its README sentence: C2.1 at 940–953, C2.2 at 1013–1019, C7.3a at 2305–2319.
- Generality agrees in both directions: an arbitrary base and coefficient ring K with R projective in C2.1, ℤ lifted to the base universe in C2.2, `k ≥ 1` in C7.3a. No change was needed.

**Padding probe** (scratch `Probe2.lean`, each `sorry` replaced by `first | rfl | trivial | simp | infer_instance | decide`): none of the four closes.
- `exists_isThomClass_of_orientation` is the general-base form of the pinned `VectorBundleOrientation.exists_isThomClass`, which needs `[CompactSpace B]`.
- It follows from the first theorem with g a generator, but not in one tactic.
- `hn : 2 ≤ finrank` is not needed for truth: for n = 0 both sides are false on a nonempty base, and for n = 1 oriented lines are trivial. The obstruction route in the README needs it, so this is a note, not a finding.

**Instances of the ℝP headline** (`#synth`):
- `ChartedSpace` is `MulAction.instChartedSpaceQuotient`, the properly-discontinuous instance is `Finite.to_properlyDiscontinuousSMul`, and the cancel instance is `TauCeti.Sphere.instIsCancelSMulIntUnitsSphere`.
- `TauCeti.RealProjectiveSpace n` is `Quotient (MulAction.orbitRel ℤˣ (sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1))` (`UniversalCover/RealProjective/Basic.lean:60`), the same type as in the headline. It has no charted-space instance at the pin, so using the raw quotient is right.
- `Manifold.IsImmersion` takes charts in `IsManifold.maximalAtlas` with no `IsManifold` instance (`Immersion.lean:143–191`). Mathlib has `IsManifold (𝓡 n) ω` on the sphere (`Sphere.lean:418`), `contMDiff_neg_sphere` (465), and `TauCeti.instIsManifoldQuotient` given `ContMDiffConstSMul`. The docstring's account is therefore accurate.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b; scratch `Probe1.lean`, 133 `#check` lines, all resolving):
- Three names resolve under the namespaces `TauCeti.HasHomotopyExtensionProperty.image` (`Extension/Basic.lean:275`), root `IsCoveringMap.mem_serreFibrations` (`SerreFibration/Basic.lean:179`) and `TopCat.singularCup` (`Cohomology/Cup.lean:203`).
- Statements read in full:
  - Thom and Euler carriers: `IsThomClass` (`EulerClass.lean:245`), `existsUnique_singularCohomology_thomPairOver_iUnion` (`DirectedUnion.lean:227`), `isZero_singularCohomology_thomPair` (`DirectedUnion.lean:301`, arbitrary base), `exists_isThomClass_of_compactSpace` (`[Subsingleton Kˣ]`), `VectorBundleOrientation.exists_isThomClass`, `exists_singularCohomology_thomPair_fiber`;
  - orientation and immersion carriers: `OrthonormalFrameBundle.orientationCoverHomeomorph` and its iff, `Orientation.localOrientation`, `Manifold.Orientation.toVectorBundleOrientation`, `instIsManifoldQuotient`;
  - other carriers cited by C2.3, C5.1, C6.1 and C7.1: `HomologicalOrientation.evalFundamentalClass` (`[CompactSpace N]`), `eulerChar` (`[FiniteCWType X]`), `ContRepresentation.isUnitarizable`, all C6.1 and C7.1 series and multiplicative-sequence names, `d₁₂_apply_apply_ofTrivial` (`Cochain.lean:118`).
- The "not statable" reasons hold at the pin:
  - `Cohomology/` has `Cup.lean` and `IntegralCup.lean` (absolute), and `Relative.lean` has only the pair long exact sequence. There is no relative cup.
  - `Grassmannian/` has only finite carriers (Basic, Graph, Map, Oriented, Orthonormal, Plücker, Projectivization, Stabilization, Tautological).
  - `ClassifyingSpace/` is Milnor's join for discrete groups, with Circle and Torus as `ℤ` and `ℤ^ι`.
  - No Chern–Weil map exists.
  - There is no bridge from a smooth to a homological orientation; Foliation/EulerClass states its Euler bounds with absolute values.

**Cross-roadmap citations resolved** (main adf01c6, or this head for the PR's folders):
- TopologicalKTheory, at this head: T1 items 3, 4, 5, T1.5a, T1.6a–d (289, 303, 334, 408, 483, 655, 747, 797), T6.4 (1262), and T7 item 4 (1549). TopologicalKTheory names C1.1a–b as a consumer (150, 198).
- AlgebraicTopology, at this head:
  - Stage 2 item 5 `supBallEuclideanDiskHomeomorph` (362);
  - Stage 4 items 4.5 `relativeCWPushout`, `homotopyPushoutGluingComparison`, `relativeCWPushoutCWModel` (659, 673, 731), 4.6 (821), 4.7 `simplicialRealizationCW` (856), 4.8 (882);
  - Stage 5 item 5.5 (1017);
  - Stage 6 items 6.0, 6.1, 6.2 (1178, 1235, 1280);
  - Stage 7 (1797);
  - Stage 8 items 8.2, 8.3, 8.5, 8.7, 8.8b, 8.9, 8.10, 8.12 (1877, 1907, 1928, 2039, 2061, 2186, 2227, 2376).
  - AlgebraicTopology mentions this roadmap only as a consumer, or as an input of RiemannianGeometry R3, at 137, 752, 1212, 1863 and 2384.
- GeneralizedCohomology G4.0a (1783, with HP¹ and S⁴ at 1849–1890) and the quaternionic-line normalization (2152).
- ComplexKahlerGeometry K4 (967), K7.1 (1962) and K7.2 (2000).
- On main:
  - SpinGeometry G4.1a and G4.1b (397, 425);
  - SchubertGeometry S9.6 (120–128);
  - LieGroupoidsPoisson §G1.3a (18);
  - ReflectionInvariantTheory §§1–4 (7, 19, 40, 68);
  - TopologicalSheafCohomology TS1.1–TS1.2 (7, 11);
  - AffineMorseLefschetz A4.0 (13);
  - MorseNovikov N6 (807–851);
  - LieHighestWeight `HasCentralRadical` (30).
- The overlap lead "SpinGeometry §G4.1a only at #1674" is false: main defines it at SpinGeometry line 397.
- No id this README cites is dropped by another pull request, and none this pull request drops is cited elsewhere.

**Ownership.** The general-base Thom class, the Euler primary obstruction and Whitney's ℝP non-immersion are owned here:
- GeneralizedCohomology, this head lines 2043 and 2074, defers Thom spaces and the primary obstruction to C2.1–C2.2.
- TangentialBordism (#942, its line 50) defers "non-immersion of RP^(2^k)" to this roadmap.
- `roadmaps grep --lean-only 'IsThomClass|eulerClass'` finds only #1807, #1808 and #1854, the last two carrying copies of this folder.

**Sources read at their locators** (the seeded sample):
- dupont-ln:
  - Proposition 2.20, line 532 (p. 15): local isometric trivializations by Gram–Schmidt.
  - Proposition 2.21, line 566 (p. 16): `FO(V)`, the right O(n) action with fibres as orbits, equivariant charts.
  - Example 4.3, line 976 (p. 32): a metric is a reduction to O(n), an orientation a reduction to GL⁺.
  - Proposition A2, line 2627 (p. 93): invariant forms ≅ `Alt(g/h)^H`, differential with sign `(−1)^{i+j}`, matching C5a.1 after the 0-based shift.
  - Proposition A7, line 2713: invariant inner product by averaging.
  - Theorem A8, line 2752: compact connected G, invariant forms compute `H*_dR`.
- hatcher-vbkt (printed page = cache page − 4):
  - p. 16, lines 636–651: `S(E)`, `D(E)`.
  - p. 26, lines 1017–1030: Gram–Schmidt deformation retraction of `GL_n(ℝ)` onto `O(n)`.
  - p. 88, lines 3426–3443: Thom class on `(D(E),S(E))`; Euler class as its zero-section restriction.
- cohen-fiber-bundles:
  - (2.4) at line 2950 (p. 86).
  - Proposition 3.7 stated at line 2979 (p. 87); its proof, lines 2985–2992 (p. 88), gives `S(ζ×η) = S(ζ)×D(η) ∪ D(ζ)×S(η)`, which is C2.0's boundary.
- dupont-ccc:
  - Chapter 4 Exercise 3, lines 2247–2264 (pp. 69–70): `dTP = P(Ω^k)`, naturality, `TP = k∫P(θ∧U_s^{k−1})`, `U_s = sΩ + ½(s²−s)[θ,θ]`.
  - Theorem 8.1, line 3514: `I(G) ≅ H*(BG;ℝ)` for compact G.
  - Proposition 8.3, line 3548: `I(G) ≅ Inv_W I(T)`, compact connected.
  - Corollary 8.35, line 3989: Borel, real coefficients.
- alekseev-meinrenken-chern-weil §3.1, lines 332–373: `Wg = Sg*⊗∧g*`, equation (10); Koszul algebra; the differential vanishes on `(Sg*)^inv`.
- hatcher-at:
  - Theorem 3C.4, line 12343: graded-commutative Hopf algebra of finite type in characteristic 0 is exterior ⊗ polynomial.
  - Corollary 4D.3, line 18734: integral `U(n)`, `SU(n)`.
  - §3.G table, lines 14230–14239: SU(n) 2,…,n; E8 2,8,12,14,18,20,24,30.
- zentner-instanton-sheet2 Exercise 2, lines 45–61: `p₁(su(E)) = −4c₂ + c₁²` with `p₁ = −c₂(su(E)⊗ℂ)`.

Each supports the statement as written, at the generality restated.

**Adversarial table** (values computed this round):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_singularCohomology_thomPair_fiber` (L125) | B = pt, F = ℝ, K = ℤ; e = id vs e = −id | `o ↦ ω`: restriction = g; `o ↦ −ω` under −id: −((−1)·g) = g, the two clauses agree (reflection acts by −1 on `H¹(ℝ,ℝ∖0)=ℤ`) | consistent |
| same | K = 𝔽₂; rank 0; B = ∅; g = 0 | −g = g; `H⁰(F,∅)=M`, u = sign function, (g,−g) on two components; `H^n(∅,∅)=0`; `H^n(E,E₀;A) ≅ Hom(H₀B,A)` injects into ∏_b A, so u = 0 | true, unique in each |
| `exists_isThomClass_of_orientation` (L149) | trivial line on S¹, K = ℤ; Möbius; K = 0 ring | u = pr*gen; no orientation (cover connected); all groups 0, span{0} = ⊤ | true; pinned minus `[CompactSpace B]` |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L165) | TS² (cells 0,2); S²×ℝ²; realified O(1) | e = 2 / no section; e = 0 / constant; e = 1 / none | both sides agree |
| same | su(F) on HP¹ (rank 3, cell dim 4); rank 0, B ≠ ∅; rank 1 | `e ∈ H³(S⁴)=0`, no section → excluded by `hdim` (4 > 3); e = ±1 ≠ 0 / `E_b = 0`; trivial: e = 0 / section | dimension bound necessary; `hn` not needed for truth |
| `not_exists_isImmersion_realProjectiveSpace` (L187) | k = 1, 2, 3; ℕ-subtraction | targets `2^(k+1)−2` = 2, 6, 14; RP² → ℝ² open-map contradiction; `w̄(RP⁴) = (1+a)³ = 1+a+a²+a³`, `w̄₃ = a³`; `w̄₇(RP⁸) = a⁷`; Whitney immerses in `ℝ^(2m−1)`, so non-vacuous | true |
| C1.0 metric change | `h₁(u,v) = h₀(Hu,v)` | `h₁(H^{−1/2}u,H^{−1/2}v) = h₀(H^{1/2}u,H^{−1/2}v) = h₀(u,v)`; Sylvester eigenvalues `√λᵢ+√λⱼ > 0` | correct |
| C1.0 cover | n ≥ 1; rank 0 | pinned iff `0 < det g`; rank 0: one frame, two orientations (pinned docstring: surjectivity needs ι nonempty) | matches "for n≥1" |
| C2.0 cells | rank 0; empty base; sup-ball map | `S(E)=∅`, `D(E)≅X`, model `X₊`; point; `‖(‖v‖∞/‖v‖₂)v‖₂ = ‖v‖∞`, inverse returns v | correct |
| C5a.1 CE sign | degree 1; Koszul `2d` | `(−1)^{0+1}a([X₀,X₁]) = −a([X,Y])` = Mathlib `d₁₂ f x y = −f⁅x,y⁆`; `(L_Xa)(Y)−(L_Ya)(X) = −2a([X,Y]) = 2da(X,Y)` | correct |
| C5a.1 H¹ | closed 1-forms | `da = 0 ⇔ a([g,g]) = 0`; exact 1-forms 0 | `ann([g,g])` |
| C5a.2 normalization | θ ↦ e^{iθ}; generator count | `dχ(a) = ia`, `(i/2π)ia = −a/2π`; rank K generators, central d = 1 | agrees with Conventions 200–203 |
| C5a.3 Weil | θ_t = tθ; Bianchi; rank one | `tΩ+((t²−t)/2)[θ,θ]` = Dupont `U_s`; `dΩ = [dθ,θ] = [Ω,θ] = −[θ,Ω]`; `CS = P(θ) = −θ/2π` | correct |
| C5a.4 Koszul | regular sequence; quotient | `H(ℝ[P]⊗Λ(e), De=P) = ℝ`; `K_I/I₊ = Λ(e)`, D = 0; `\|eᵢ\| = 2dᵢ−1` | consistent |
| C5a.5 transgression | page r = 2dᵢ | `d_r: E^{0,2dᵢ−1} → E^{2dᵢ,0}`; `π₁(BK)=π₀(K)=0` | well-formed |
| C5a.6 Poincaré series | SU(2), U(2), SU(3), trivial | `1+t³`; `(1+t)(1+t³)`, top 4; `(1+t³)(1+t⁵)`, top 8; `P(−1)=0`; trivial 1 | agree |
| C5a.7 degrees | U(n), SU(n), E8; SU(2)/N(T); n = 2 strict upper triangular | `Σ(2d−1)=n²`, `n²−1`; `3+15+23+27+35+39+47+59 = 248`; `H⁰=ℤ, H¹=0, H²=ℤ/2`; centre g ⊄ [g,g] = 0 | agree with Hatcher 4D.3 and §3.G |
| C7.AdjointHopf | basis; Z = diag(1,−1); roots 0, x−y, y−x | all skew and traceless; X = 0, Y = diag(−i,i); `c₂(End₀) = −(x−y)²`, `p₁ = c₁²−4c₂` (zentner line 50) | correct |
| same, on HP¹ | c₁ = 0, ⟨u,[HP¹]⟩ = 1 | ⟨p₁⟩ = −4; `e ∈ H³(S⁴)=0`; `w_{1,2,3}=0`, w₄ above rank; section ⇒ ε¹⊕P, `e(P)=0`, `p₁(ε⊕P) = p₁(P) − c₁(ε_ℂ)c₁(P_ℂ) = 0` | no section, not stably trivial |
| C7.3a | m = 2^k | `(1+a)^{2m} = 1+a^{2m} ≡ 1`; `(1+a)^{2^k−1} = Σ_{j<2^k} aʲ`; `w_j = binom(m+1,j)` | correct |
| C7.1 Checks | CP⁶; HP³; HP² | `(2170−1911+686)/945 = 1`; `p(HP³) = 1+4u+12u²+8u³`, `L₃ = (496−624+128)/945 = 0`; `p(HP²) = 1+2u+7u²`, `L₂ = 45/45 = 1` | correct |
| C3.3 `p_r = e²` | real rank m = 2r | orientation sign `(−1)^{m(m−1)/2} = (−1)^r`, times `(−1)^r` from `p_r` | +1, as stated |
| R01: stable carriers | singular simplex Δⁿ | compact Hausdorff, so `C(Δⁿ,kX) = C(Δⁿ,X)`; TopK T1.6a's carrier already has the weak-CW union topology | coreflection not needed |
| R02: C1.1d | X = pt, G = Circle; clutching | trivializations ≅ Circle, classes = point; `trivializationOfSection` on U = X gives `p ↦ (p.proj, division(σp.proj, p))`, inverse `(x,g) ↦ σ(x)g`; `h_N⁻¹ g_NS h_S = a⁻¹cb` | same conventions as the pin |
| R02: Bockstein | 0→ℤ→ℤ→𝔽₂→0 on RP² | `β(a) = y ≠ 0 ∈ H²(RP²;ℤ) = ℤ/2`; on a point `H¹(pt;ℤ) = 0` | pinned construction applies |
| R04: C5a.1, C5.1 | pinned Lie cochains; pinned Chevalley | degrees 1→2→3 only; field algebraically closed, char 0 vs compact group over ℝ | not statable, as R04 says |

## Not verifiable

- Milnor–Stasheff (`milnor-stasheff`): §4 (C7.3a), Theorem 10.4 (C2.1 and the two Thom headlines), §12 (C2.2), Theorem 15.3, §18 Lemma 18.1 (C2.0's one (q+r)-cell per base q-cell), §19 (C7.1).
- Milnor, *Topology from the Differentiable Viewpoint* §6 (`milnor-tdv`; C2.3a).
- Milnor, *Construction of Universal Bundles II* §§2–3 (`milnor-universal-ii`; C1.1b).
- Bott–Tu §§6, 11–14, 20–23 (`bott-tu`).

The manifest records all four as settled uncertified; they are cited by locator and their text was not read. tom Dieck and May are in the cache but were outside this round's sample.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, printed p. 87: the source takes η over the same space X and places ζ×η over X∧Y; it should take η over Y and ζ×η over X×Y, as the proof uses; affects nothing.
- **Misprint** in zentner-instanton-sheet2 at Exercise 2, page 1: the source writes "skey-adjoint" for the endomorphisms defining su(E); it should be "skew-adjoint"; affects nothing.
