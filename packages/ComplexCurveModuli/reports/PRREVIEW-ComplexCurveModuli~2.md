# Review of ComplexCurveModuli (pull request #2548 at 1463ff2)

**Verdict:** needs changes

**Summary.** Changes are needed, for four findings. The punctured case of the uniformization headline can be stated at the pins (the statement below elaborates), but `Suggested.lean` leaves it out and its docstring says it cannot be stated. Sections 0.1f, 1.3 and 1.4 keep as targets results the Tau Ceti pin already proves. The Check of §2.2 asserts a false fibre. And none of the headline theorems names a source. There are also three small corrections and two format notes. Two matters are left for the human reviewers, both because the journal versions of Robbin–Salamon and of its corrigendum could not be read: the locators were checked against the arXiv text instead.

## R01 (P2) — The punctured case of the uniformization headline is statable at the pins, but `Suggested.lean` leaves it out and its docstring says it cannot be stated

The acceptance test states uniformization only for closed surfaces. The case the roadmap consumes downstream (complete finite-area metrics with cusps, used in §§0.5 and 6.2–6.3 and by ConformalMappingPartII) is listed in the module docstring (lines 42–44) as not statable, "for want of" a relation between a complex structure and a conformal class. The closed theorem uses no complex structure either: it is stated for the conformal class of a Riemannian metric, and the same form works on `M ∖ P`. The pin has `TauCeti.HyperbolicMetric` (complete, curvature −1; `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic.lean:51`), `TauCeti.HyperbolicMetric.HasFiniteVolume` (`…/Hyperbolic/FiniteVolume.lean:63`), `Bundle.ContMDiffRiemannianMetric.pullback`, which restricts `g` to the open submanifold (`…/Riemannian/Pullback/Basic.lean:158`), and `rescale`. With the imports of `Suggested.lean` plus `TauCeti.Geometry.Manifold.Riemannian.Hyperbolic.FiniteVolume` and `TauCeti.Geometry.Manifold.Riemannian.Pullback.Basic`, the following elaborates at the pins with `sorry` as its only warning:

```lean
theorem exists_hyperbolicMetric_hasFiniteVolume_of_eulerChar_lt_card
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [TopologicalSpace M] [T3Space M] [PreconnectedSpace M] [CompactSpace M]
    [SecondCountableTopology M] [ChartedSpace H M] [IsManifold I ∞ M] [FiniteCWType M]
    (hE : finrank ℝ E = 2) (U : TopologicalSpace.Opens M) (P : Finset M)
    (hU : (U : Set M) = (↑P : Set M)ᶜ) (hχ : eulerChar M < P.card)
    [PreconnectedSpace U] [MeasurableSpace U] [BorelSpace U]
    (hinj : ∀ x, Function.Injective (mfderiv I I (Subtype.val : U → M) x))
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :
    ∃ (G : HyperbolicMetric (I := I) (M := U)) (f : U → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
      (hf_pos : ∀ x, 0 < f x), G.HasFiniteVolume ∧
        G.metric = (g.pullback Subtype.val contMDiff_subtype_val hinj).rescale f hf hf_pos := by
  sorry
```

The repair is to state it, with `hinj` (true for every open inclusion) proved inline or absorbed into a small restriction definition. In the docstring, keep only the bordered case as not statable, naming the carrier it actually lacks.

## R02 (P2) — Sections 0.1f, 1.3 and 1.4 ask an implementer to build results the Tau Ceti pin already proves

An implementer would reprove declarations that exist. Each of these sections states as its own target something that is at the pin or owned by another roadmap on main:

- §0.1f (lines 216–226) asks for the adapter from a meromorphic function to a holomorphic map to `OnePoint ℂ`, its `MDifferentiable` property, and the `FiniteHolomorphicMap` of a nonconstant one. These are `TauCeti.RiemannSurface.mdifferentiable_sphereMap` and `TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic` (`TauCeti/Analysis/Complex/RiemannSurface/SphereMap.lean:199`, `:243`). The existence of the nonconstant function by Riemann–Roch is ModularForms §10B's own target ("Construct a finite meromorphic map X→ℙ¹ … and Riemann–Roch", ModularForms README line 1229), so §0.1f is its second owner.
- §1.3 (lines 492–495) asks to prove that a Hom set with fixed permutation is a torsor for the label-fixing automorphisms. This is `TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv` (`TauCeti/AlgebraicGeometry/Curves/NodalGluing/AuxiliaryMarks.lean:376`).
- §1.4 (lines 510–511) asks for the relabelling of blocks, the maps of transported subsets and faithfulness of forgetting colours. These are `partitionedAuxiliaryIsomorphismGroupoid_comp_of_injective` and `partitionedAuxiliaryIsomorphismGroupoid_le_comp` (`…/NodalGluing/PartitionedAuxiliaryMarks.lean:223`, `:217`), `AuxiliaryIso.PreservesColors.perm_image_preimage` and `AuxiliaryIso.PreservesColors.image_image_point_inr_preimage` (`:163`, `:169`), and Mathlib's `CategoryTheory.Subgroupoid.hom.faithful` (`Mathlib/CategoryTheory/Groupoid/Subgroupoid.lean:157`).

The repair is to cite these in the three sections, in the supplier contracts and in the table of results already in the library, and to drop the restated targets. §0.1f would keep only its comparison of ModularForms' Riemann–Roch spaces with `MeromorphicAt` functions, citing §10B for existence. The description's list of what the pins hold would then name these too.

## R03 (P2) — The Check of §2.2 says the fibre of `bx = 0` over b ≠ 0 is empty, but it is the point x = 0

A reader testing the non-flat example against its stated fibres finds the claim false. Over b₀ ≠ 0, the equation b₀x = 0 forces x = 0, so the fibre is one point, and it lies in every neighbourhood of the origin. The jump is from a point to a line, a jump in fibre dimension. The text (lines 642–643) reads "the fibre jumps from empty (b ≠ 0) to a line (b = 0)". The torsion witness, b killing the class of x, is right. The repair is "the fibre jumps from a point (b ≠ 0) to a line (b = 0)".

## R04 (P2) — The headline theorems carry no source locator

Without locators, an implementer cannot check the statements or their hypotheses against the literature. The three theorems of `Suggested.lean` (§§0.3, 0.4, 0.5/1.2), universality (§§4.1, 4.4) and compactness, Hausdorffness and properness (§6.3) cite no source. Only §§3.5, 3.6, 4.1 (one proof step), 4.2, 5.6 and 6.2 do. Two routes are also taken from Robbin–Salamon's proofs without citation. The induction on short geodesics in §6.3 is the proof of Theorem 17.5 of the arXiv version (RobbinSalamon2006 lines 3347–3374). The properness argument of §0.5 is its Lemma 9.2 (lines 1088–1101, stated for genus > 1). The repair is to add locators at the claims:

- universality: Theorems 5.3–5.6 (lines 750–768);
- the étale groupoid, its properness and the compactness of its quotient: Theorems 6.5–6.6 (lines 828–872);
- compactness: Theorem 17.5;
- properness of the diffeomorphism action: Lemma 9.2;
- hyperbolic metrics against complex structures of finite type: Proposition 17.3 (lines 3318–3325).

These numbers are the arXiv version's. In the journal numbering the README uses elsewhere, Theorem 17.5, Lemma 9.2 and Proposition 17.3 appear to be 14.5, 7.5 and 14.3, while §§5–6 keep their numbers (see the question below). For §§0.3 and 0.4, cite a standard text at its theorem number. For the curvature equation, these could be the sources Tau Ceti's own `ClosedSurface.lean` cites (Kazdan–Warner 1974; Berger 1971).

## C01 — The §0.4 Check's reason for non-invertibility at δ = 1 holds for every δ ≤ 1

As written, the argument would also "prove" non-invertibility on the scale the section uses, 0 < δ < 1. With the weight `t^δ`, the norm of `t^(−1)` is `sup t^(δ−1)`, which is finite for every δ ≤ 1. On the whole range, `t^(−1)` therefore has finite norm and lies in the kernel of the model operator on the end. The global operator is still injective there, by the maximum principle on decaying functions. The computation that does distinguish δ = 1 is `(−t² ∂_t² + 2) t^(−δ) = (2 − δ − δ²) t^(−δ)`, which for δ > 0 vanishes only at δ = 1: that weight is indicial, so the operator is not Fredholm there. The repair is to replace the last sentence of the Check (lines 345–347) with this computation.

## C02 — `CircleSobolevCoefficients` is a second carrier for Tau Ceti's `TauCeti.CircleSobolev s ℂ`

The definition at `Suggested.lean` line 248 imposes the same summability condition as the pin's structure (`TauCeti/Analysis/Sobolev/Circle/Basic.lean:194–201`). No statement uses it, and it is outside the node-chart prototype the docstring announces. It asks nothing of an implementer. Two repairs would work: mark it, with the node-chart block, as a sanity-check prototype, or have §3.1 (line 719) name the pin's structure and drop the definition.

## C03 — A heading link from ConformalMappingPartII stops resolving

ConformalMappingPartII on main (README line 25) links to `ComplexCurveModuli/README.md#d0-smooth-curves-finite-type-and-the-classification-floor`, and the renamed Layer 0 heading removes that anchor. The label "D0.4" still resolves by the rule at line 52; the link does not. The repair is an HTML anchor with the old id placed before `## Layer 0`.

## N01 — The Summary says the roadmap builds the moduli "following Robbin and Salamon's construction" (line 5). The layers are the roadmap's own, and §4.5 and Layers 0, 7 and 8 go beyond the paper; "using Robbin and Salamon's Hardy-gluing method" would describe it.

## N02 — "The following former targets of this roadmap" (line 1765) is process narrative; "The following results are proved at the Tau Ceti pin" is timeless.

## Questions for the author

- Which version of Robbin–Salamon was read for the numbered locators? The arXiv v4 text numbers the cited results 9.1, 10.2, 11.4, §§12–15, §17 and 17.4, and leaves the marked-section equation of 11.4, Step 3 unnumbered. The README's 7.4, 8.2, 8.9, "equation (15)", §§9–12, §14 and 14.4 match their contents under one uniform shift, and the corrigendum's published abstract calls the integrability lemma 8.2. I could not open the journal text, which is behind a subscription. If the arXiv text was used, a version note in References would let a reader find the results.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1f (sample) | meromorphic adapter; D = (g+1)p | pin: `mdifferentiable_sphereMap`, `ofMeromorphic` exist; RR ℓ(D) ≥ (g+1)+1−g = 2 | restates pin and ModularForms §10B | R02 |
| §0.1g (sample) | sphere, torus | ModularForms §10B gives h⁰(K) = g_an = g_top; ℓ(p) = 2 on ℙ¹, ℓ(2p) = 2, ℓ(p) = 1 on torus | true; no locator | R04 (route) |
| §1.4 (sample) | r₁ = r₂ = 1; one block; singletons | group trivial; pin decls at lines 163, 169, 217, 223; `Subgroupoid.hom.faithful` | all at pin | R02 |
| §3.2 (sample) | disc with ∂̄; closed surface | holomorphic ξ: Dξ = 0, controlled by trace; constants: Dξ = 0, trace empty, estimate fails | true; no locator | none |
| §3.5 (sample) | ι(η) formula; slice derivative | ι(η)² = −1; dι(0)η = j₀η − ηj₀ = 2j₀η; arXiv 9.1 lines 1059–1067; Wendl lines 5753–5758 same map | supported | question on numbering |
| §3.6 (sample) | α = 0; torus fibre | mixed term = arXiv eq. (6) line 1127; α = 0 ⇒ dj(iâ) = j dj(â); corrigendum abstract: fails g = 0,1, α ≠ 0 | consistent | none |
| §4.5 (sample) | xy = t² | A₁ singularity; classified by a = t², d(t²)/dt = 0 at 0; RS Thm 5.4 for their class only | consistent ("extends the paper") | none |
| §4.7 (sample) | sphere k = 0,1,2; torus | h⁰(O(2−k)) = 3,2,1; h⁰(O) = 1 on torus; one mark on sphere: Aut ⊇ z ↦ λz | true | none |
| §5.1 (sample) | signature count | RS footnote 7 (lines 800–804) standard surfaces per signature; (0,4): 1 smooth + 3 trees | consistent | none |
| §5.2 (sample) | cover of S | RS Prop. 6.3 proof (lines 807–811) countable cover | consistent; no locator | none |
| §6.2 (sample) | crossing geodesics; g = 2; (0,4) | sinh·sinh > 1 vs ≤ 1 for ℓ ≤ 2 arsinh 1; 3g−3+N = 3, 1; area 2π(2g−2+N) | true; RS 17.4 lines 3326–3341 | none |
| §6.3 (sample) | (0,4); Aut(C) | M̄_{0,4} = ℙ¹ compact vs ℂ∖{0,1}; Hom(C,C) = Aut(C) torsor; seq. compact + 2nd countable ⇒ compact | true; route = RS 17.5, uncited | R04 |
| §7.3 (sample) | external, self clutching | b₁ unchanged / +1; (0,{1,*,**}) → (1,{1}) nodal j-line boundary | true | none |
| §7.4 (sample) | suppliers | StableReduction Layers 3, 9 (lines 467, 699); `complexSchemeAnalytification` in §C-1.1 | resolved | none |
| §8.3 (sample) | (1,1), (2,0), dims | isotropy 2 generic, 4 at j = 1728, 6 at j = 0; dims 0,1,1,3; z ↦ 1/z fixes xy | true | none |
| `exists_zlattice_…` (§0.3) | χ = 2, 0; degree | sphere excluded; deg K = 0 so ω has no zeros; area(Σ) = deg·area(ℂ/Λ) ⇒ deg 1 | true; no locator | R04 |
| `exists_hyperbolicMetric_…` (§0.4) | χ = 0; g = 2; non-orientable | torus excluded; area −2πχ = 4π; pin has only the iff and uniqueness | true; statable, stated | R04 |
| punctured uniformization (§0.4) | M ∖ P, χ(M) < \|P\| | probe statement elaborates at pins (sorry only) | statable, absent | R01 |
| `finite_ordered_iff_…` (§§0.5, 1.2) | sphere n = 2, 3; torus n = 0, 1; g = 2, n = 0 | 2<2 F (z ↦ λz); 2<3 T; 0<0 F; 0<1 T (ℤ/2–6); −2<0 T | true; reduces via `finite_ordered_iff` | R04 |
| universality (§§4.1, 4.4) | chain of 3 spheres, diagonal | ind = 3−5+1+(2−1) = 0; D bijective, KS not onto; RS 15.2(iii) bound 3−3g−n+dim B | true | R04 |
| §2.2 Check | V(bx), b₀ ≠ 0 | fibre {x = 0}: one point, not empty | false sentence | R03 |
| §0.4 Check | weight t^δ, δ ∈ (0,1] | ‖t^(−1)‖ = sup t^(δ−1) < ∞ ∀ δ ≤ 1; (2−δ−δ²) = 0 iff δ = 1 | conclusion true, reason invalid | C01 |
| `CircleSobolevCoefficients` | pin structure | Σ(1+\|n\|)^(2s)\|aₙ\|² < ∞ both sides | duplicate carrier | C02 |

- Source locators: 13 in the body (10 Robbin–Salamon 2006, 2 corrigendum, 1 Wendl). The Robbin–Salamon ones were checked by content against arXiv v4 (7.4 ↔ 9.1, 8.2 ↔ 10.2, 8.9 ↔ 11.4, §§9–12 ↔ §§12–15, §14 ↔ §17, 14.4 ↔ 17.4, 6.5 ↔ 6.5), Wendl's against v3.2 §4.2.4, and the corrigendum's against its published abstract only.
- Library declarations opened at the pins: `AuxiliaryAut.finite_ordered_iff` and its two specializations (`FiniteAutomorphisms.lean:126,163,189`), `Marking`/`specialPoints` (`Basic.lean:414,426`), `HyperbolicMetric` (`Hyperbolic.lean:51`), `HasFiniteVolume` (`FiniteVolume.lean:63`), `ClosedSurface.lean:76,105`, `pullback` (`Pullback/Basic.lean:158`), `Conformal.lean`, `SphereMap.lean:199,243`, `permFiberEquiv` (`AuxiliaryMarks.lean:376`), `PartitionedAuxiliaryMarks.lean:163–223`, `exists_analyticAt_hardyGraph` (`HardyGraph.lean:190`), `isCompl_neckGraph` (`Neck.lean:478`), `CircleSobolev` (`Basic.lean:197`), `FamilyNijenhuis.lean`, `AddCircle.lean` collar extension, Mathlib `contMDiff_subtype_val` (`ContMDiff/Basic.lean:367`) and `Subgroupoid.hom.faithful`.
- Cross-roadmap citations, all on main and all found: GeometricTopology §§1.1, 1.7, 3.3; AlgebraicTopology §§7.1–7.3; FuchsianOrbifolds Layer 5 items 1–3; ModularForms §10B; ComplexKahlerGeometry §§1.1, 1.2, 3.2, 3.4, 4.1, 5.10; PseudoholomorphicCurveAnalysis §§5.2, 6.1, 7.1, 7.2; HeegaardFloer §§3.1, 3.4, 4.3, 4.6a; PDE §§1.1, 1.4, 1.6, 1.7, 4.2; DifferentialGeometry Layer 3; ComplexTori Milestone 1; StableReduction Layers 3, 9, 10; Orbifolds O1, O3, O4, O5; ComplexComparisonPartII §§C-1.1, C0.3, C1.9, C3.2; ImplicitAtlases §7.4; Completed ConformalMapping.
- The old D-labels cited by ConformalMappingPartII and PainleveEquations (main), and by FuchsianOrbifoldsPartII, MappingClassGroupsAndCanonicalRepresentations and TeichmullerGeometry (open), namely D0.1–D0.5, D3.3–D3.6, D4.1, D4.4 and D6.2, each map under the rule of line 52 to the section with the same content.
- Automatic checks: all passed, none set aside. Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No supplier cites this roadmap, so there is no cycle.
- Elaboration: `lake env lean` of `Suggested.lean` gives three `sorry` warnings (lines 63, 74, 92) and nothing else. In a separate test file the punctured statement of R01 elaborates, and `simp`/`exact?` close none of the three theorems.
- Elaborated signatures of all 20 declarations were compared with the README statements: no binder is lost, and nothing was changed.
- Checks evaluated: 55 bullets. One is false (§2.2, R03) and one has an invalid reason (§0.4, C01).

Overlap check: read AnalyticStableMaps (main and its open revision), TeichmullerGeometry (open), HeegaardFloer (main), GromovWittenTheory (main), ComplexKahlerGeometry (main) and FuchsianOrbifoldsPartII (open). Shared: the finite holomorphic map of a nonconstant meromorphic function, whose owners are Tau Ceti and ModularForms §10B (R02). Otherwise AnalyticStableMaps, GromovWittenTheory, TeichmullerGeometry and FuchsianOrbifoldsPartII consume this roadmap and HeegaardFloer supplies it; nothing else is shared.

Source independence: 10 passages compared with 2 sources: RobbinSalamon2006 arXiv v4 (Def. 5.2 vs §3.4; 9.1 and 11.4 vs §3.5; 10.1–10.2 vs §3.6; 11.4 Step 3 vs §4.1; 9.2 vs §0.5; 17.4 vs §6.2; 17.5 vs §6.3; line 78 vs the docstring of `finite_ordered_iff_forall_eulerChar_lt`) and Wendl v3.2 §4.2.4 vs §3.5. No wording is shared beyond forced formulas. Largest share: RobbinSalamon2006, 10 of 13 locators. Contents compared with RobbinSalamon2006 (arXiv v4, 17 sections): independent. Layers 1–6 run in the order their *Needs:* lines force, the source's groupoid section (§6) precedes its analysis whereas Layer 5 follows Layer 4, and Layers 0, 7 and 8 have no counterpart.

Research link: Layers 3–6 are the analytic construction of the Deligne–Mumford orbifold by Robbin and Salamon (2006, with the 2007 corrigendum), extended to all restricted families. AnalyticStableMaps and GromovWittenTheory build stable-map moduli on it, and Robbin–Ruan–Salamon (2012) compare with regular maps. This rests on the README's Summary, Downstream consumers and References, and on RobbinSalamon2006 §§5–6.

## Not verifiable

- Robbin–Salamon, J. Eur. Math. Soc. 8 (2006): the journal text is behind a subscription (EMS Press states open access only for 2021–2026 issues). Its numbering was inferred from arXiv v4 and the corrigendum's abstract.
- Robbin–Salamon corrigendum, J. Eur. Math. Soc. 9 (2007): subscription; only the landing-page abstract was read. Lemmas A–B, the horizontal component ζ and the Remark on Hamiltonian connections (§3.6) are unchecked.
- Wendl, version 3.3: only version 3.2 (arXiv v2) was read; its §§4.2–4.3 support the citation.
- Hummel's book, cited through Robbin–Salamon §14, was not consulted.

## Source issues

- **Error** in RobbinSalamon2006 at Lemma 8.2 (arXiv v4 Lemma 10.2, p. 28): the source says J is integrable iff the mixed equation holds, reducing to a one-dimensional base; it should require genus > 1 or α = 0, the equation being otherwise only necessary; affects a stated result; corrected in print at Corrigendum, J. Eur. Math. Soc. 9 (2007), 901–905.
- **Misprint** in RobbinSalamon2006 at Lemma 11.3 (arXiv v4, p. 32): the source writes the marked-point constraint of the domain with b̂ as the base tangent vector; it should be â; affects nothing.
- **Misprint** in RobbinSalamon2006 at Theorem 11.4, Step 1 (arXiv v4, p. 33): the source lists the genus-zero slice arguments up to b with index n − s; it should be n − 3; affects nothing.

## For the human reviewers

- Not tested: the source with the largest share of locators, Robbin–Salamon 2006 (journal version, 10 of 13 locators), could not be read. Wording and arrangement were compared with its arXiv v4 text instead.
- Licence: the corrigendum cited for §3.6 (DOI 10.4171/JEMS/101) is behind a subscription at EMS Press; the locators into it (Lemmas A–B, the Remark) rest on its published abstract only.
