# Review of CharacteristicClasses (pull request #1807 at 2ce4de6)

**Verdict:** needs changes

Eight findings: five P2 and three P3. The gate passes and `Suggested.lean` elaborates with only the four `sorry` warnings. The four stated headlines are true as written: the adversarial table below found no counterexample, and the one-tactic probe closes none of them. The defects are in ownership and supply direction: two owners for the support cochains, two-way supply with three roadmaps, and planning that LieGroups already owns on main. One headline is statable at the pins but missing.

## R01 (P2) — C1.2a S0–S4 and AlgebraicTopology's supported-cellular supplement both own the compactly supported local-coefficient cochains, and each says the other consumes them

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:71–75`: "C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4". Also lines 576–586: S0 (support colimit `H_c`), S1 (enlargement), S2 (cofinality), S3 (proper pullback, open extension, supported cups) and S4 (jointly proper homotopy invariance). The mixed-support paragraph at lines 655–662 is the same object again.

Claim: this pull request's AlgebraicTopology commits moved that foundation into AlgebraicTopology, but CharacteristicClasses was not updated. Each README now builds the same objects and names the other as the consumer.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:1923–1929` at this head says the supplement "owns the compactly supported local-coefficient cochain foundation below … CharacteristicClasses C1.2a consumes the foundation". Its lines 1932–1975 build S0–S4 item by item, and its table at line 3309 says the same. On main, AlgebraicTopology lines 1169 and 2102 consumed "CC C1.2a S0–S4".

Repair:
- Replace S0–S4 and the mixed-support paragraph with one paragraph that consumes, by name, AlgebraicTopology Stage 6's supported-cellular supplement. It supplies the support colimit and `H_c`, enlargement, cofinality, proper pullback, open extension, supported and mixed cups, and jointly proper homotopy invariance.
- Keep S5 here as this roadmap's own: support excision, the collared-pair triangle and the mapping-cylinder collar pusher.
- Rewrite lines 71–75: "C1.2a consumes the compactly supported cochain foundation of AlgebraicTopology's supported-cellular supplement after Stage 6.2. AlgebraicTopology consumes nothing of C1.2a. C1.2a compares S5's triangle with that supplement's supported CW-pair triangle."
- Add a one-sentence old → new note ("the former S0–S4 are AlgebraicTopology's supported-cellular foundation"). TopologicalSheafCohomology on main cites "its S0–S5" (`TopologicalSheafCohomology/README.md:11`), and this note keeps that citation followable.

Tested on the witness: after the edit, AlgebraicTopology lines 1923–1929 and CharacteristicClasses agree on one owner and one direction.

## R02 (P2) — CharacteristicClasses and two roadmaps on main each supply the other: GeneralizedCohomology and SpinGeometry

Location:
- `README.md:520–522` (C1.1d): "GeneralizedCohomology G4.0a's identification of SU(2)=Sp(1) with the unit quaternions S³, as the only inputs beyond T1.5a".
- `README.md:2223–2233` (C7.AdjointHopfObstruction): it uses G4.0a's Sp(1)/Spin(3) calibration and "GeneralizedCohomology G4.0a's actual HP¹", and "Use G4's ordinary quaternionic-line normalization".
- `README.md:1407–1411`, `1426` and `1435–1437` (C3.5): "SpinGeometry G4.1a owns rank0/rank1 and frame transport … The item order is G4.1a → C3.5 → G4.3".

Claim: these are supplier citations of roadmaps that consume this one. The dependency check passes because no section-level cycle closes: G4.0a and G4.1a do not cite CharacteristicClasses. But each roadmap pair has supply in both directions, against the single-direction principle. This pull request was opened to cut exactly such loops on main, and it already edits GeneralizedCohomology.

Witness:
- GeneralizedCohomology at this head, `README.md:922`: "*Needs:* CharacteristicClasses C1.1b; …; G4.0a". It also cites CharacteristicClasses at lines 539 (C1.2), 2525 (C2.1) and 2591–2600 (G4.5 uses C1.5 and C1.5a).
- SpinGeometry on main, `README.md:50`: "CharacteristicClasses C1,C3.5 … owns", and line 852: "G4.1a → CharacteristicClasses C3.5 → G4.3".

Repair:
- C1.1d: consume the pinned `Quaternion.unitaryEquivSpecialUnitaryGroup` (Tau Ceti `Algebra/Quaternion/ComplexMatrix.lean:256`, unit quaternions ≃* SU(2)) together with the unit sphere of `ℍ[ℝ]`, instead of GeneralizedCohomology G4.0a.
- C7.AdjointHopfObstruction: keep the general su(F) bundle and the integral formula `p₁(su(F))=c₁(F)²−4c₂(F)` here. Build the S⁴ instance with C1.1d's own clutching: F is clutched by S³≅SU(2)⊂U(2), and E=su(F) is clutched by `Ad`, which is 2 ∈ π₃(SO(3))=ℤ. Alternatively, move the HP¹ instance into GeneralizedCohomology G4 as its consumer example. Point C2.2's third Check at whichever bundle remains here.
- C3.5: consume the pinned Clifford covering and connectivity declarations directly (already named at lines 1399–1404). State the rank-0/rank-1 μ₂ conventions and the frame transport as C3.5's own, and delete the "G4.1a → C3.5" order sentence, so that SpinGeometry only consumes C3.5.

Tested on the witness: after these edits, CharacteristicClasses names neither GeneralizedCohomology nor SpinGeometry as a supplier, and both still cite it as consumers.

## R03 (P2) — C7.1 makes the L₃ target depend on IndexTheory I7.2, a roadmap not on main that consumes this one

Location: `README.md:2151–2152`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

Claim: this roadmap is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. IndexTheory is an open pull request, and it consumes this roadmap. The dependency check misses the edge because the citation carries no link.

Witness: IndexTheory exists only at its open head (`TauCetiRoadmap/IndexTheory/README.md:239`: "CharacteristicClasses C1–C7: …"). `TauCetiRoadmap/IndexTheory/README.md` does not exist on main.

Repair: delete the sentence, or turn it into a consumer sentence: "IndexTheory I7.2 consumes L₃ for the signature formula in dimension twelve." Tested: CharacteristicClasses then names no roadmap that is absent from main.

## R04 (P2) — C5.1 states as its own the compact splitting, Killing-form and Cartan/root results that LieGroups Layers 5A and 6 own on main

Location: `README.md:1575–1591`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the negative semidefiniteness of the Killing form … the identification of t_ss,C as a Cartan subalgebra; and the actual root-pairing isomorphism".

Claim: what another roadmap plans is imported by name and section, never planned again.

Witness: `RepresentationTheory/LieGroups/README.md` on main.
- Line 655, Layer 5A: "prove `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally, that `s=[𝔤,𝔤]` is a centerless semisimple ideal, and that its Killing form is negative-definite".
- Line 750, Layer 6: "Prove t_ss,C is a Cartan subalgebra … match the actual weight and root spaces".

Repair:
- Consume LieGroups Layer 5A for the invariant form B_G, the splitting, semisimplicity and the negative-definite Killing form.
- Consume LieGroups Layer 6 for t_ss,ℂ, the root data and the Weyl comparison.
- Keep only what neither supplies: the per-simple-factor scalar comparing B_G with the Killing form, if LieGroups lacks it, and C5.1's transport through invariant polynomials and the pinned Chevalley isomorphism.

Tested: both sections exist on main at the lines above.

## R05 (P2) — `e(TM)[M] = χ(M)` (C2.3) is statable at the pins; the module docstring says it is not, and C2.3 plans a map the pin already has

Location: `Suggested.lean:61–69`: "but no identification of a tangent-bundle orientation with the homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier". `README.md:1043–1050` makes this identification a target "pointwise through the pinned generator `Orientation.localOrientation`".

Claim: a manifold orientation already determines the local homology orientation at every point. So the sign has a carrier, and the headline elaborates with no new definition.

Witness: Tau Ceti `AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202` defines `localOrientationOfManifoldOrientation o hE x : LocalOrientation M x (n+1)`. The statement below elaborates at the pins with only the `sorry` warning.

```lean
theorem eval_eulerClass_tangent_eq_eulerChar {M E : Type} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M] [TauCeti.FiniteCWType M]
    {n : ℕ} (hE : finrank ℝ E = n + 1) (o : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin (n + 1)))
    (oh : TauCeti.HomologicalOrientation M E (n + 1))
    (hoh : ∀ x, oh x = TauCeti.localOrientationOfManifoldOrientation o hE x)
    (u : (TauCeti.thomPair E (TangentSpace 𝓘(ℝ, E) : M → Type)).singularCohomology
      (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) (n + 1))
    (hu : ∀ b : M,
      (TopPair.singularKronecker (TopPair.ofSubset (X := TopCat.of E) ({0}ᶜ : Set E)) ℤ (n + 1)
        (TopPair.singularCohomologyMap (TauCeti.fiberThomPairMap E
          (TangentSpace 𝓘(ℝ, E) : M → Type) b) (n + 1) u)).hom
        (Orientation.localOrientation
          (show Orientation ℝ E (Fin (n + 1)) from o.toVectorBundleOrientation b) hE).1 =
        ULift.up 1) :
    oh.evalFundamentalClass (hE ▸ rfl) (ModuleCat.of ℤ (ULift.{0} ℤ)) (ContinuousMap.id M)
        (TauCeti.eulerClass (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) E
          (TangentSpace 𝓘(ℝ, E) : M → Type) (n + 1) u) =
      ULift.up (TauCeti.eulerChar M) := by
  sorry
```

Repair:
- Add this theorem to `Suggested.lean`, with its README statement in C2.3. The extra imports are `TauCeti.AlgebraicTopology.Cohomology.FundamentalClass`, `…Singular.LocalHomology.Orientation.Chart`, `…Orientation.Linear`, `…Cellular.EulerCharacteristic.FiniteCWType` and `TauCeti.Geometry.Manifold.Orientation.Basic`.
- `[FiniteCWType M]` is a hypothesis because the pin has no such instance for compact manifolds. Every closed manifold satisfies it, and the README should say so.
- Delete the χ(M) bullet from the not-statable list.
- In C2.3, consume `localOrientationOfManifoldOrientation`. What remains to build is its packaging as a `HomologicalOrientation`, plus the χ identity.

Instances checked: S² (n=1) gives 2=χ(S²). For odd n both sides vanish.

## R06 (P3) — The README lacks the house shape, and most definitions have no Checks

Location: the whole README. The title is "# Characteristic classes and Chern–Weil theory" and there is no `**Summary.**`. The headings are "## Carriers, scope and suppliers", "## C1." … "## C7." with numbered items, and "## Dependency order and references". There is no "## Scope and ownership", "## Exact supplier contracts", "## How to read the build" or "## Downstream consumers". No layer ends with "### Examples" and "### Dependencies".

Claim: the house form asks for at least three discriminating Checks per definition, but there are 8 `**Checks.**` blocks for 2,378 lines.

Witness: the following definitions have none.
- C3.2: `w_i`, `c_i` by the projective relations (lines 1318–1333).
- C3.3: `p_i`, `W_k` (lines 1334–1349).
- C6.2: `ch_j` (line 2058).
- C7.3a: `w̄(M)` (lines 2299–2302).
- C5a.3: `W(g)`, `CS_P` (lines 1787–1824).
- C2.0: the Thom CW model (lines 847–886).
- C2.5: `p!` (line 1167).
- C4.1–C4.2: the invariant and Chern forms.
- C1.2a S5: support-excisive pairs.

Repair:
- Restructure to the house template: Summary, Scope and ownership, Conventions, Exact supplier contracts listing the pinned Mathlib and Tau Ceti names per supplier, How to read the build, `## Layer k` with `### k.n`, Examples and Dependencies per layer, Downstream consumers, References. Keep the C-labels in the subsection titles, since GeneralizedCohomology, AlgebraicTopology, TopologicalKTheory, SpinGeometry and TopologicalSheafCohomology cite them.
- Add Checks with computed values. For example:
  - `w(T ℝP²)=(1+a)³=1+a+a²` (w₁≠0 detects nonorientability);
  - `c(O(−1))=1−h` on CP¹ (the sign-flipped definition gives 1+h);
  - `p₁(T CP²)=3h²` (signature p₁/3=1);
  - `ch(O(1))=1+h` on CP¹;
  - `w̄(ℝP⁴)=1+a+a²+a³`;
  - for `u(1)`: `W=ℝ[Ω]⊗Λ[θ]`, `dθ=Ω`;
  - the cells of `Th(TS²)` lie in degrees 2 and 4.

## R07 (P3) — `cechSingularCWTypeComparison`, which ComplexComparisonPartII cites five times, was dropped with no old → new note

Location: `README.md:704`: "Own the Čech/singular comparison on CW type". Main's line 640 reads "Own `cechSingularCWTypeComparison`: …", and commit b4658595 of this pull request dropped the name.

Witness: the ComplexComparisonPartII open head, `README.md` lines 120, 278, 795, 3207 and 3217 (`*Needs:* CharacteristicClasses C1.2b, `cechSingularCWTypeComparison`'s …`).

Repair: add one unbackticked sentence to C1.2b: "the comparison cited elsewhere as cechSingularCWTypeComparison is this Čech/singular comparison on paracompact Hausdorff spaces of CW type". This keeps the citations followable without claiming a declaration in `Suggested.lean`.

## R08 (P3) — Four attributions and locators are off

Location and witness:
- (a) `README.md:1580–1581` reads "LieHighestWeight L9's `LieAlgebra.HasCentralRadical`". The class is Mathlib's (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`). LieHighestWeight line 30 itself says "Mathlib defines".
- (b) `README.md:571–574` consumes "AlgebraicTopology Stage6.1's … Bockstein construction", and lines 1230–1231 consume "Stage 6.0's countable-tower cochain Milnor sequence". AlgebraicTopology at this head consumes both from the pin: `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` (`Cohomology/Bockstein.lean`, AT lines 474–476 and 1765), and `TauCeti.ModuleTower.shift`, `.lim`, `.limOne` (AT lines 1672–1680).
- (c) `README.md:266–268` attributes to "Hatcher, *Vector Bundles and K-Theory*, §1.2, p. 26 … so any two metrics are homotopic through metrics". Page 26 (`hatcher-vbkt` lines 1017–1030) states only the Gram–Schmidt deformation retraction GL_n(ℝ)→O(n). The homotopy of metrics follows from convexity of the cone of metrics, not from that page.
- (d) `README.md:873–874` cites Cohen's "Proposition3.7, p.87" for the boundary `(∂D^q×D^r)∪(D^q×∂D^r)`. The statement is on p. 87, but the decomposition is in its proof on p. 88 (`cohen-fiber-bundles` lines 2985–2988).

Repair:
- (a) Cite Mathlib `LieAlgebra.HasCentralRadical`.
- (b) Name the pinned Bockstein and `ModuleTower` declarations with their files, as AlgebraicTopology does.
- (c) Cite p. 26 for the retraction only, and state the convexity argument in your own words.
- (d) Write "Proposition 3.7 and its proof, pp. 87–88".

## Verified sound

**Gate and dependency check.** The worker's gate at 2ce4de6 passes every check, and `git diff --stat origin/main...HEAD` outside the listed folders is empty. The dependency check prints:

    depcheck: 236 roadmaps, 2286 edges, 0 problem(s)

**Lean.**
- `lake env lean …/Suggested.lean` gives only the four `sorry` warnings.
- `#check @` on the four declarations: the elaborated types match README C2.1 (lines 940–951), C2.2 (lines 1013–1021) and C7.3a (lines 2305–2319) in generality. `[FiniteDimensional ℝ F]` survives in all three bundle theorems, and no binder was lost. The "instance `ContMDiffConstSMul`" row in `signatures.md` is a docstring artifact.
- One-tactic probe (`first | simp | rfl | infer_instance | trivial | exact <pinned compact lemma>`) on a scratch copy: all four fail. The pinned compact-base lemma fails on `CompactSpace B`, so none is padding.
- The docstring's other not-statable claims hold. There is no relative cup product at the pin (`Cohomology/Relative.lean` and `Cup.lean` have none), so the Thom isomorphism and Gysin claims stand. There is no `ContMDiffConstSMul ℤˣ` sphere instance, so that target stands.

**Pinned declarations opened (25).**
- Tau Ceti `Topology/VectorBundle/`: `EulerClass.lean` lines 192 (`fiberThomPairMap`), 245 (`IsThomClass`), 356 (`eulerClass`) and 383 (`eulerClass_eq_zero_of_forall_ne_zero`); `Orientation/ThomClass.lean` lines 121 and 186; `MayerVietoris/DirectedUnion.lean` lines 227 (`existsUnique_singularCohomology_thomPairOver_iUnion`) and 301; `MayerVietoris/Basic.lean` lines 561 and 612; `Orientation/Cover.lean` lines 498 and 533; `Orientation/LocalSystem.lean` lines 75 and 139; `Orientation/Prod.lean` lines 78 and 147.
- Tau Ceti, other files: `AlgebraicTopology/UniversalCover/RealProjective/Basic.lean:60` (`RealProjectiveSpace` as the ℤˣ-orbit space of Sⁿ); `Geometry/Manifold/Instances/Quotient.lean:242` (`instIsManifoldQuotient`); `Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:151` (hypotheses: Field, CharZero, FiniteDimensional, IsKilling, Cartan, IsAlgClosed, matching C5.1); `Algebra/Lie/Killing/CartanRestriction.lean:203`; `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:123`; `Cohomology/FundamentalClass.lean:88`; `…/Orientation/Chart.lean:202`.
- Mathlib: `Geometry/Manifold/Immersion.lean` lines 802 (`IsImmersion`, charts in the maximal atlas) and 972 (`IsImmersion.id`); `Geometry/Manifold/Instances/Quotient.lean:50`; `Instances/Sphere.lean:465` (`contMDiff_neg_sphere`, every order).

**Cross-roadmap citations resolved (28).**
- AlgebraicTopology at this head: Stages 2.5, 4.5 (`relativeCWPushout`, `homotopyPushoutGluingComparison`, `relativeCWPushoutCWModel`), 4.6, 4.7, 4.8, 5.0, 5.5, 6.0–6.2, 8.2, 8.3, 8.5, 8.8b, 8.9, 8.10 and 8.12. Its consumer lines 154–162 and 3257–3279 agree with C1.5 and C1.5a.
- TopologicalKTheory at this head: T1.3–T1.5, T1.5a (l. 423), T1.6a (l. 499), the countable-colour producer (l. 539) and T6.4. Its lines 155–166 now make C1.1a–b a consumer only, so the earlier TopologicalKTheory loop is closed.
- ComplexKahlerGeometry: K7.1 (l. 2189) and K7.2 (l. 2231). GeneralizedCohomology: G4.0a (l. 2228).
- Main: SpinGeometry G4.1a (l. 397), so the overlaps lead "only an open revision defines it" is false. Also SchubertGeometry S9.6 (l. 120–128), LieGroupoidsPoisson G1.3a, ReflectionInvariantTheory §§1–4, TopologicalSheafCohomology TS1.1–TS1.2, SmoothBundlesConnections B1.4/B2/B6, and LieGroups Layers 1, 5, 5A and 6.

**Ownership against open pull requests.** I searched with `roadmaps grep` for owners of Stiefel–Whitney, Chern, Euler and Thom classes and the Chern–Weil map. The open pull requests own only étale, crystalline or algebraic analogues, or consume this roadmap (TangentialBordism, GromovWittenTheory, DGFloer). This roadmap is the topological owner.

Two other open pull requests change this folder. #1808 is stated as stacked after this one. For #1854, this description says no open pull request must merge before this one.

**Sources: the seeded sample, read at the locator.**
- C1.0: `dupont-ln` Prop 2.20 (line 532, p. 15), Prop 2.21 (line 566, p. 16) and Example 4.3 (line 976, p. 32); `hatcher-vbkt` p. 26 (lines 1017–1030).
- C2.0: `hatcher-vbkt` p. 16 (lines 637–645) and p. 88 (lines 3428–3436); `cohen-fiber-bundles` (2.4) (line 2950) and Prop 3.7 (lines 2979–2992).
- C5a.1: `dupont-ln` Prop A2 (line 2627; its differential matches the README sign, and k=1 gives −α([v₁,v₂])), Prop A7 (line 2713) and Thm A8 (line 2752).
- C5a.2: `dupont-ccc` Prop 8.3 (line 3548, p. 115); `hatcher-at` §3.G table, p. 326 (lines 14230–14239: SU(n) 2,…,n; E8 2,8,12,14,18,20,24,30).
- C5a.3: `alekseev-meinrenken-chern-weil` §3.1 eq. (10) (lines 357–373); `dupont-ccc` Ch. 4 Ex. 3, (4.15)–(4.17), pp. 69–70 (lines 2247–2264: `U_s=sΩ+½(s²−s)[θ,θ]`); `dupont-ln` Thm 9.5 and Lemma 9.6 (lines 2244 and 2264).
- C5a.4 and C5a.5: `dupont-ccc` Thm 8.1 (line 3514, p. 114); `hatcher-at` Thm 3C.4 (line 12343).
- C5a.6: `dupont-ccc` Cor 8.35 (line 3989, p. 130, real coefficients, as the README says).
- C5a.7: `hatcher-at` Cor 4D.3 (line 18734).
- C7.AdjointHopfObstruction: `zentner-instanton-sheet2` Exercise 2 (lines 45–61).
- Also `tomdieck-at` 14.4.3, the Milnor space (line 14467), for C1.1b.

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_singularCohomology_thomPair_fiber` | base a point; rank 0 on two components; two trivializations with det ≷ 0; B=ℝ (non-compact) | point: u=g for ω, −g for −ω, matching e*g and −e*g; rank 0: u=(g,−g), which no constant class gives; det>0 gives sign +1 and det<0 gives −1 with the orientation flipped (pinned sign lemma); iUnion gluing needs no compactness | holds | none |
| `exists_isThomClass_of_orientation` | Möbius line over S¹ with ℤ; B×ℝⁿ with ℤ; probe | Möbius: no orientation exists (`nonempty_iff_not_connectedSpace`), so the hypothesis is empty; B×ℝⁿ: pr*g generates every fibre; the compact lemma fails on `CompactSpace B` | holds | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` | TS²; S²×ℝ²; O(1)_ℝ on CP¹; plane bundles over S¹; B=∅; su(F) on S⁴ | ⟨e,[S²]⟩=2≠0 / no section; 0 / constant section; 1 / none; H²(S¹)=0 / trivial, so a section; H^n(∅)=0 / vacuous; S⁴, rank 3: e∈H³(S⁴)=0 but p₁=−4u≠0, so no section and the iff fails without `hdim` | holds; `hdim` is necessary | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1,2,3; m=3 control; k=0 junk | ℝP²→ℝ²: q=0<1, and a local diffeo has open compact image; w̄(ℝP⁴)=(1+a)³, w̄₃=a³≠0, so q≥3>2; (1+a)⁷=Σ_{j≤7}aʲ, w̄₇≠0, so no ℝ¹⁴; m=3: w̄=(1+a)⁻⁴=1, no obstruction, and ℝP³ immerses in ℝ⁴; k=0 is excluded (2−2=0) | holds | none |
| C2.3 `⟨e(TM),[M]⟩=χ(M)` | S²; odd n; the pin | 2=χ(S²); 0=0; the probe statement elaborates | statable, absent | R05 |
| C1.0 metric change | h₁ vs h₀ via H^{−1/2}; rank 0 | h₁(H^{−½}u,H^{−½}v)=h₀(H^{½}u,H^{−½}v)=h₀(u,v); singleton frame | holds | R08(c) locator |
| C2.0 Thom cells | TS² over S² (cells 0, 2), r=2; rank 0; ∅ | Thom cells in degrees 2 and 4, H̃=ℤ in 2 and 4, matching Hᵏ(S²)≅H̃ᵏ⁺²; X₊; a point | holds | R08(d) locator |
| C5a.1 CE sign, H¹ | degree 1; U(1); SU(2) | README −a([X,Y]) = Dupont A2 = Mathlib `d₁₂_apply_apply_ofTrivial` (−f⁅x,y⁆); ann(0)=ℝ=H¹(S¹); ann(su₂)=0=H¹(S³) | holds | none |
| C5a.2 degrees | SU(n); E8 | weights 4,…,2n, n−1=rank generators; Σd=128=120+8 | holds | none |
| C5a.3 CS_P | t=0,1; degree-one P | F₁=Ω, F₀=0, so d CS_P=P(Ω); CS_{−a/2π}=−θ/2π; U_s=F_s | holds | none |
| C5a.4 Koszul model | SU(2); U(1); trivial group | Λ(e), deg e=3 = H*(S³); Λ(e), deg e=1; ℝ | holds | none |
| C5a.5 transgression | bidegree; circle | d_{2d}: E^{0,2d−1}→E^{2d,0}; d₂z₁=u₁ | holds | none |
| C5a.6 Poincaré series | SU(3); G2; trivial group | (1+t³)(1+t⁵): total 4=2², top degree 8=dim; 3+11=14; χ=P(−1)=0 vs 1 | holds | none |
| C5a.7 degrees | E8; U(2); SU(2)/N(T) | odd degrees sum to 248=dim E8; 1+3=4; ℝP²: H⁰=ℤ, H²=ℤ/2 | holds | none |
| C7.AdjointHopfObstruction | roots 0, ±(x−y); HP¹; clutching | p₁=(x−y)²=c₁²−4c₂ (Zentner Ex 2 agrees); ⟨p₁,[HP¹]⟩=−4; e∈H³(S⁴)=0, wᵢ=0; Ad=2∈π₃(SO(3)), so nontrivial | holds | R02 (supplier) |
| C7.1 L₃ | CP⁶; HP³; HP² (L₂) | (2170−1911+686)/945=1; (496−624+128)/945=0; (49−4)/45=1; K₃ coefficients 2, −13, 62 over 945 | holds | R03 (supplier) |
| C1.1d free classes | [S¹,O(2)]; [S²,O(k)]; rank-k bundles over S²; O(−1) | ℤ⋊(ℤ/2); ℤ/2 since π₂SO=0; 2 classes for k≥3 (π₁SO(k)=ℤ/2); s_S=z⁻¹s_N gives winding −1 | holds | none |
| C3.3 Whitney correction | L on ℝP⁴ | p(L)=1; p₁(L⊕L)=−c₁(L_ℂ)²=−β(a)², whose reduction is a⁴≠0 | holds | none |
| C6.4 wedge correction | rank r | ∏(1−e^{x_j})=(−1)^r e^{c₁}∏(1−e^{−x_j}), degree 0 (−1)^r | holds | none |
| C7.2 coth vs L | 2k roots | x coth(x/2)=2L(x/2), so the degree-2k parts agree (4^k·4^{−k}); constants 4^k vs 1 | holds | none |
| Conventions: Pfaffian/line | block [[0,−α],[α,0]]; standard character | Pf=−dα/2π; (i/2π)(i dα)=−dα/2π; (i/2π)(ia)=−a/2π | consistent | none |
| C1.2a S0–S4 | AlgebraicTopology at this head vs this README | AT 1923–1929 "owns … C1.2a consumes" vs CC 72 "supplement consumes C1.2a S0–S4" | two owners | R01 |
| C5.1 splitting/root data | LieGroups on main | 5A l. 655 and 6 l. 750 own them; C5.1 "State as this item's own input" | duplicate | R04 |

## Not verifiable

- `milnor-stasheff` (uncertified, no legal copy): Thm 10.4 (the arbitrary-base Thom class in C2.1 and in the docstring), §12 (C2.2), §4 (C7.3a), Lemma 18.1 (C2.0), Thm 15.3, §19 and App. C. I searched the source cache and the manifest. The statements were checked mathematically instead (see the table).
- `bott-tu` and `milnor-tdv` §6 (uncertified): cited by locator only.
- `milnor-universal-ii` §§2–3 (uncertified). tom Dieck 14.4.3 was read instead.
- No locator in the README is flagged unverified.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, p. 87: the source says η is a bundle over X and ζ×η is a bundle over X∧Y; it should say η is over Y and ζ×η is over X×Y; affects nothing.
- **Error** in zentner-instanton-sheet2 at Exercise 3 hint, p. 2: the source says BSU(2) is HP¹, which is S⁴; it should say BSU(2) is HP^∞, whose 7-skeleton is HP¹=S⁴, which suffices for maps from S⁵; affects nothing.
- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 2: the source writes "skey-adjoint"; it should say skew-adjoint; affects nothing.
