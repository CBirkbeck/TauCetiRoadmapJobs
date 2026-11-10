# Review of CharacteristicClasses (pull request #1807 at da5e14d)

**Verdict:** needs changes

Four findings, all P3. None blocks. This head repairs all eight findings of the previous review except R06 (shape and Checks), which is only partly repaired and is raised again as R01 below. The gate passes, and the dependency check reports 0 problems. `Suggested.lean` elaborates with only the five `sorry` warnings. The five stated headlines are true as written: the adversarial table found no counterexample, and the one-tactic probe closes none of them. What remains:
- the README shape and Checks coverage (R01);
- the docstring's list of headlines that cannot be stated at the pins (R02);
- two ownership sentences: one reverse-supply wording (R03) and one restatement of a LieGroups argument (R04).

## R01 (P3) — The README still lacks the house shape, and many definitions still have no Checks or locator

Location: the headings of `TauCetiRoadmap/CharacteristicClasses/README.md`:
- line 12 "## Carriers, scope and suppliers";
- lines 236–2292 "## C1." … "## C7.";
- line 2523 "## Dependency order and references".

For example, C5a.1 (lines 1821–1895) defines `j`, `A_forms` and `H` and has no **Checks.** block.

Claim: the previous R06 is partly repaired.
- Done: the title, the `**Summary.**` paragraph, and ten new Checks blocks (18 now, 8 before).
- Missing headings: `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n`, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`, `## References`.
- The whole README has one `*Needs:*` line (C1.5a, line 849).

Witness: these definitions have no Checks:
- C1.0: the metric-change transport `H^(−1/2)` and the oriented SO(n) subbundle (a seeded target).
- C1.1b: `B_join(G)`.
- C1.2b: Čech `H^q` as a colimit.
- C1.5: the line class `c₁(L)=f_L*x`, `w₁`, and `ET_N`, `BT_N`.
- C3.5: the central-lift cocycle.
- C4.3: the universal Chern–Weil map.
- C5a.1: `j`, `A_forms` and `H` (seeded).
- C5a.2: `QI` and `u_i` (seeded).
- C5a.4: `K_I` (seeded).
- C6.1: bundle-level Td, L and Â.
- C6.3: `Hper` and the suspension character.
- C7.2: `S_high^±`.

These targets have no locator: C1.5a, C1.6, C3.4a, C3.5, C3.6 and C6.3.

Repair:
- Restructure to the house template. SmoothBundlesConnections on main is a model (lines 23, 104, 194, 208, 219, 1304). Keep the C-labels in the subsection titles, because consumers cite them.
- Add Checks with computed values. Each of these was computed here:
  - C1.0: take h₁=4h₀ on a line. Then H=4 and H^(−1/2)=1/2 sends an h₀-unit vector u to u/2, with h₁(u/2,u/2)=1. The wrong root H^(1/2) gives 2u, with h₁=16.
  - C1.5: c₁(O(−1)) pairs to −1 on CP¹, and c₁(O(1)⊗O(1))=2h. w₁ is a≠0 on the Möbius line and 0 on the trivial line.
  - C5a.1: for K=S¹ the CE differential is 0, and H*=Λ(θ)=H*(S¹;ℝ). For SU(2), H¹=ann(su(2))=0, and H³=ℝ is spanned by (X,Y,Z)↦B(X,[Y,Z]).
  - C5a.2: SU(2) has one basic generator, det, of polynomial degree 2 and weight 4, so QI is one-dimensional. U(1) has d=1, and its class is −h for θ↦exp(iθ).
  - C5a.4: for SU(2), K_I=ℝ[P]⊗Λ(e) with |e|=3 and De=P, and K_I/I₊=Λ(e)≅H*(S³;ℝ). For U(1), |e|=1.
  - C6.1: Td₁(TCP¹)=c₁/2=h pairs to 1, and L₁(TCP²)=p₁/3=h² gives signature 1. Â₁(TCP²)=−p₁/24=−h²/8 pairs to −1/8∉ℤ, consistent with CP² not being spin.
- Add locators:
  - C1.6: `hatcher-vbkt` Proposition 3.10, p. 86 (line 3359), which covers w₁ on real lines and c₁ on complex lines over spaces of CW type.
  - C3.6: Milnor–Stasheff §15.
  - C3.4a: Milnor–Stasheff §12.

## R02 (P3) — The docstring omits two headlines that cannot be stated at the pins, and overstates the self-map identity

Location: `Suggested.lean:61–96`, the list of headlines not stated, and `Suggested.lean:44–47`: "The self-map form `⟨f* e(TM), [M]⟩ = deg(f) χ(M)` follows from it through the pinned `TauCeti.HomologicalOrientation.evalFundamentalClass_id_singularCohomologyMap`".

Claim:
- The Summary (`README.md:5–7`) lists the compact Lie group CE/de Rham comparison and the universal transgression as headlines.
- The docstring names only the exterior Hopf isomorphism. The CE/de Rham ring isomorphism (C5a.1) cannot be stated, because the pins have no Chevalley–Eilenberg complex in all degrees. The transgression `d_(2d_i) z_i = u_i` (C5a.5) needs BK, which the pins also lack.
- The self-map sentence does not hold as written. The pinned lemma gives only ⟨f*c,[M]⟩=⟨c,f_*[M]⟩, and the pins define no degree of a self-map, so `deg(f)` has nothing to refer to.

Witness:
- Mathlib `Algebra/Lie/Cochain.lean` stops at `d₁₂` (line 101), that is, at 2-cochains.
- Tau Ceti `Algebra/Lie/Cochain.lean` is titled "Low-degree Lie algebra cochains".
- The pinned lemma is Tau Ceti `Cohomology/FundamentalClass.lean:120`.

Repair: add two bullets.
- "the CE/de Rham ring isomorphism `H*_dR(K) ≅ H*(CE(𝔤;ℝ))` of a compact connected Lie group (C5a.1): the pins have Lie-algebra cochains only up to degree two";
- "the universal transgression `d_(2dᵢ)(zᵢ)=uᵢ` (C5a.5): no classifying space BK".

Replace the self-map sentence with: "The self-map form `⟨f* e(TM),[M]⟩ = deg(f) χ(M)` is not statable: the pins have no degree of a self-map. Given one, it follows from this theorem, `f_*[M]=deg(f)[M]` and the pinned `evalFundamentalClass_id_singularCohomologyMap`."

## R03 (P3) — The ConvexityToric sentence has this roadmap compare ConvexityToric's models, a supply in the wrong direction

Location: `README.md:175–179`: "Compare its finite products of spheres/projective spaces with C1's torus model and retain the standard-character versus positive-h generator sign."

Claim: the imperative gives this roadmap a comparison that consumes ConvexityToric T2's models. But ConvexityToric consumes C1–C3, and no C-section carries the comparison. It is the same two-way pattern that the previous R02 removed for GeneralizedCohomology and SpinGeometry.

Witness: `SymplecticGeometry/ConvexityToric/README.md:88–95` on main: "Consume CharacteristicClasses C1's torus universal-bundle models … Compare Borel constructions to those existing models."

Repair: "ConvexityToric T2 compares its finite products of spheres and projective spaces with C1's torus model, keeping C1.5's sign `u_i=−h_i`; nothing here consumes ConvexityToric."

Tested: after the edit, this README names ConvexityToric only as a consumer, and ConvexityToric line 95 keeps the comparison.

## R04 (P3) — C5.1 re-derives the radical/centre and orthogonality facts that LieGroups Layer 5A supplies

Location: `README.md:1709–1719`: "State as this item's own … 𝔤 has central radical … since a solvable ideal meets the semisimple summand … distinct simple ideals and the centre are B_G-orthogonal."

Claim: the previous R04 asked C5.1 to keep only what LieGroups lacks. The radical/centre argument and the orthogonality of the summands are already LieGroups 5A's. What LieGroups does not supply is the packaging as Mathlib's predicate, `IsKilling` for the complexified summand, and the scalar λᵢ on each simple factor.

Witness: `RepresentationTheory/LieGroups/README.md:654–656` on main: "prove `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally … Give the radical/center and bracket-orthogonality arguments from this same real invariant form".

Repair: "LieGroups Layer 5A's radical/centre argument gives rad(𝔤)=𝔷(𝔤), which is Mathlib's `LieAlgebra.HasCentralRadical`. Its orthogonal splitting and the Ad-invariance of B_G make the centre and the simple ideals B_G-orthogonal." Keep as this item's own the `IsKilling` hypothesis for the complexified semisimple summand and `B_G=−λᵢκ_(𝔰ᵢ)`.

Tested on SU(2): κ=−8δ and B_G=2δ, so λ₁=1/4. That value is unchanged.

## Verified sound

**The previous review's findings at this head.**
- R01, repaired. Lines 71–78: "C1.2a consumes the compactly supported local-coefficient cochain foundation of AT's supported-cellular supplement … AlgebraicTopology consumes nothing of C1.2a."
  - Lines 593–611 keep the labels S0–S4 as AlgebraicTopology's, so the citations of "C1.2a S0–S5" in AffineMorseLefschetz and TopologicalSheafCohomology still resolve.
  - AlgebraicTopology at this head (lines 163–167 and 1914–1975) owns the foundation, including supported and mixed cups (line 1957), and names CC as the consumer.
- R02, repaired. C1.1d now uses LieGroups Layer 2 (line 532: "`SU(2)≃S³` by the first column"), which LieGroups line 435 supplies. C7 uses the pinned `Quaternion.toComplexMatrix` and C1.1d's clutching. C3.5 consumes the pinned Clifford covering declarations. The README names neither GeneralizedCohomology nor SpinGeometry as a supplier; line 1554 is a consumer sentence.
- R03, repaired. Lines 2315–2318: "the signature theorem in dimension twelve consumes it". IndexTheory is no longer named.
- R04, repaired. Lines 1700–1708 consume LieGroups Layer 5A and Layer 6, which exist on main (lines 641–671 and 750). A remainder is raised as R04 above.
- R05, repaired. `eval_eulerClass_tangent_eq_eulerChar` is at `Suggested.lean:197`, and the README states it at lines 1107–1116.
- R06, partly repaired; raised again as R01 above.
- R07, repaired. Lines 744–745: "which other roadmaps cite under the name cechSingularCWTypeComparison" (not backticked).
- R08, repaired:
  - (a) Lines 138 and 1711 cite Mathlib `LieAlgebra.HasCentralRadical`.
  - (b) Lines 583–589 and 1310–1317 name the pinned `TopCat/TopPair.singularCohomologyBockstein` and `TauCeti.ComplexTower.*`, `ModuleTower.subsingleton_limOne_of_isMittagLeffler`. All resolve at the pin.
  - (c) Lines 274–279 give the convex-cone argument and keep p. 26 for the retraction only.
  - (d) Line 915: "(2.4), p. 86, and Proposition3.7 with its proof, pp. 87–88". This matches `cohen-fiber-bundles` lines 2950, 2979 and 2985–2992.

**Gate and dependency check.** The worker's gate at da5e14d passes every check. The diff outside the listed folders is empty. The dependency check prints:

    depcheck: 235 roadmaps, 2292 edges, 0 problem(s)

Every supplier the README links is on main: TopologicalKTheory, AlgebraicTopology, DifferentialGeometry, SmoothBundlesConnections, ComplexKahlerGeometry, GeometricTopology, LieGroups, CompactGroups, LieHighestWeight, LieGroupoidsPoisson, ReflectionInvariantTheory, SpinRepresentations, ClassifyingSpaces, ConvexityToric, TopologicalSheafCohomology and SchubertGeometry. This matters because the roadmap is on main and may consume only main.

**Lean.**
- `lake env lean …/Suggested.lean` gives five `sorry` warnings and nothing else.
- I put `#check @` for all five declarations in one scratch file. The elaborated types match README C2.1 (lines 994–1006), C2.2 (lines 1067–1076), C2.3 (lines 1107–1113) and C7.3a (lines 2489–2503) in generality. `[FiniteDimensional ℝ F]` survives in the three bundle theorems, and C2.3 carries all its instance binders in its own signature, so no binder was lost.
- One-tactic probe on a scratch copy (`first | rfl | trivial | infer_instance | decide | simp | (constructor <;> simp) | aesop`): all five fail, so none is padding.
- `library-matches.md` shows no pinned declaration that proves any of them.

**Pinned declarations opened (152).** All 151 backticked names of the README were resolved against the pinned Mathlib and Tau Ceti (scratch `names-check.txt`). The only names not found are this roadmap's four own `Suggested.lean` names and five AlgebraicTopology former names listed at AT lines 539–546. These I opened by hand:
- Tau Ceti:
  - `Topology/CWComplex/Classical/FiniteCWType.lean:74`: `FiniteCWType` means homotopy equivalent to a finite CW complex, so every closed manifold has it.
  - `Cellular/EulerCharacteristic/FiniteCWType.lean:123`: `eulerChar`.
  - `LocalHomology/Orientation/Chart.lean:202` and `Homological.lean:75`: a `HomologicalOrientation` carries a transport field, so `hoh` pins `oh` down.
  - `Cohomology/FundamentalClass.lean:88` and `:120`.
  - `Geometry/Manifold/Orientation/Basic.lean:109` and `:145`.
  - `Algebra/Quaternion/ComplexMatrix.lean:158` and `:256`: i, j, k map to diag(I,−I), [[0,1],[−1,0]], [[0,I],[I,0]].
  - `Topology/VectorBundle/EulerClass.lean:258` and `:327`.
  - `Homotopy/Extension/Basic.lean:275`.
  - `Orientation/Prod.lean:78` and `:147`.
  - `Cohomology/IntegralCup.lean:155` and `:245`: a degreewise cup only, with no graded algebra, which confirms the docstring's exterior-Hopf claim.
  - `Algebra/Lie/Cochain.lean`.
- Mathlib: `Algebra/Lie/Cochain.lean:101` and `:118` (`d₁₂_apply_apply_ofTrivial` is −f⁅x,y⁆), and `Geometry/Manifold/Immersion.lean` (`IsImmersion.id`).
- I found no relative cup and no Chern or Stiefel–Whitney class of vector bundles in Tau Ceti's `AlgebraicTopology/Cohomology` or elsewhere; the `StiefelWhitney` files concern quadratic forms.

**Cross-roadmap citations resolved (52).**
- AlgebraicTopology at this head: consumer lines 157–167; the supplement at 1914–1981; Stage 6.2's excisive-couple products at 1805–1808; former names at 528–552; Stages 4.5, 4.6, 4.7, 4.8 (line 1268), 5.5, 6.0 (line 1667), 7, 8.8b (lines 2812 and 3314), 8.9 (line 3032), 8.10 (line 3072) and 8.12 (lines 3257 and 3274).
- TopologicalKTheory at this head: T1.1–T1.6 (lines 269–499), T1.5a (line 423), T1.6a (line 499), the countable-colour producer (line 539), T3.4 (line 1037), T4.8 (line 1127), T6.4 (line 1277) and T7.4 (line 1636). Its lines 152–158 and 209 are consumer statements only.
- LieGroups: Layer 2 (line 435), Layer 5 (line 575), Layer 5A (lines 641–671; its λ=(1,2,3) Check matches C5.1's first Check) and Layer 6 (line 750).
- Other roadmaps on main:
  - LieHighestWeight L1 (line 351).
  - CompactGroups Layer 0 (line 205) and Layer 1 (line 226).
  - LieGroupoidsPoisson G1.3a.
  - ReflectionInvariantTheory §§1–4 (lines 7, 19, 40, 68).
  - SchubertGeometry S9 item 6 (line 120).
  - SmoothBundlesConnections B1.4 (line 421), B2 (line 557) and B6/B6.0 (lines 1304–1306).
  - DifferentialGeometry Layer 8 (line 816) and 10.2 (line 884).
  - GeometricTopology Layer 1 (line 783), Layer 3 (line 1429), Layer 10 (line 7645) and Layer 11 (line 7732).
  - ComplexKahlerGeometry K4 (line 1222) and K7.1/K7.2 (line 554).
  - TopologicalSheafCohomology TS1.1–TS1.2.
  - AffineMorseLefschetz A4.0, MorseTheory M5 (line 857), ConvexityToric T2 (line 73) and MorseNovikov.
- Consumer-only checks: GeneralizedCohomology at this head, ClassifyingSpaces line 1193, SpinGeometry on main and at its open heads, GeometricTopology lines 213 and 7998, ReflectionInvariantTheory lines 66 and 133, SchubertGeometry line 120. None is supplied by this roadmap in return, except the ConvexityToric wording of R03.
- No roadmap cites a label C1.1c (searched on main and at all open heads).

**Ownership and duplication against open pull requests.**
- I searched with `roadmaps grep` for owners of Chern–Weil, Thom, Stiefel–Whitney, Pontryagin and Chern classes, and for the Euler-number and immersion statements. The open pull requests own only étale, crystalline or algebraic analogues, or consume this roadmap (GromovWittenTheory, TeichmullerGeometry, StringOrientation, SpinGeometry). No other `Suggested.lean` states any of the five theorems.
- MorseNovikov on main owns the vector-field Poincaré–Hopf identity Σind=χ (its line 18). C2.3's sum-of-local-indices formula is the Euler-class side (e=Σind), proved by a different route, so it is not a restatement.
- `overlaps.md`: no dropped id and no id defined only by an open revision. #1808 and #1854 conflict in this folder, and the description fixes the order "this pull request → #1808 → #1854".

**Headline theorems.**
- Stated: C2.1 Thom class existence and uniqueness over an arbitrary base; C2.1 existence for every coefficient ring; C2.2 the Euler class as primary obstruction; C2.3 `⟨e(TM),[M]⟩=χ(M)`; C7.3a Whitney's non-immersion theorem.
- Named as not statable: the Thom isomorphism, the Gysin sequence, the universal rings (and through them the Chern and Stiefel–Whitney classes, w₂ and the adjoint p₁ formula), Borel's theorem and the universal Chern–Weil map, the singular/de Rham Chern–Weil comparison, the exterior Hopf isomorphism, and the Chern-character isomorphism with its Thom correction.
- Not named: the CE/de Rham comparison and the universal transgression (R02).
- The genus series and polynomials are pinned and cited. The L₃ identity is a polynomial computation, so leaving it out of `Suggested.lean` is correct.

**Sources: the seeded sample, read at the locator.**
- C1.0:
  - `dupont-ln` Prop 2.20 (line 532, p. 15), Prop 2.21 (line 566, p. 16; the action's orbits are the fibres) and Example 4.3 (line 976: a metric is a reduction to O(n), an orientation a reduction to GL⁺).
  - `hatcher-vbkt` p. 26 (lines 1017–1030, the Gram–Schmidt retraction GL_n→O(n)).
- C2.0:
  - `hatcher-vbkt` p. 16 (lines 636–645, the disk and sphere bundles) and p. 88 (lines 3427–3433, the Thom class on (D(E),S(E))).
  - `cohen-fiber-bundles` (2.4) (line 2950, p. 86) and Prop 3.7 with its proof (lines 2979–2992, pp. 87–88).
- C5a.1: `dupont-ln`:
  - Prop A2 (line 2627). Its differential is Σ_(i<j)(−1)^(i+j)α([vᵢ,vⱼ],…); in degree 1 this is −α([v₁,v₂]), which equals the README's sign and Mathlib's.
  - Prop A7 (line 2713).
  - Thm A8 (line 2752, G compact and connected).
- C5a.2:
  - `dupont-ccc` Prop 8.3 (line 3548, p. 115, G compact connected, I(G)≅Inv_W I(T)).
  - `hatcher-at` §3.G table (lines 14230–14239: SU(n) 2,…,n; E8 2,8,12,14,18,20,24,30).
- C5a.3:
  - `alekseev-meinrenken-chern-weil` §3.1, eq. (10) (lines 357–373: the Koszul algebra, the curvature variables, the basic subcomplex equal to (Sg*)^inv with zero differential).
  - `dupont-ccc` Ch. 4 Ex. 3, (4.15)–(4.17) (lines 2247–2264, pp. 69–70: U_s=sΩ+½(s²−s)[θ,θ]).
  - `dupont-ln` Thm 9.5 and Lemma 9.6 (lines 2244 and 2264).
- C5a.4 and C5a.5:
  - `dupont-ccc` Thm 8.1 (line 3514, p. 114: any compact G, real coefficients).
  - `hatcher-at` Thm 3C.4 (line 12343: commutative associative Hopf algebra over a field of characteristic 0, of finite type).
- C5a.6: `dupont-ccc` Cor 8.35 (line 3989, compact connected G, real coefficients, as the README says).
- C5a.7: `hatcher-at` Cor 4D.3 (line 18734: U(n), SU(n) and Sp(n) integral exterior algebras).
- C7.AdjointHopfObstruction: `zentner-instanton-sheet2` Exercise 2 (lines 45–61: p₁(su(E))=−4c₂(E)+c₁(E)²). The source's route (b) goes through the rational Chern character; the README rightly asks for the integral root calculation.
- Also C1.6's suggested locator, `hatcher-vbkt` Prop 3.10 (line 3359, p. 86).

**Adversarial table.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_singularCohomology_thomPair_fiber` | base a point with ω and −ω; rank 0 on two components; base ℝ | point: u=g for ω and −g for −ω; rank 0: u=(1,−1), which no constant class gives; ℝ: the directed-union gluing needs no compactness | holds | none |
| C2.1 `exists_isThomClass_of_orientation` | Möbius line with ℤ; rank 0; B×ℝⁿ | Möbius: the cover is connected, so no orientation exists and the hypothesis is empty; rank 0: the constant 1 restricts to a unit; product: pr*g generates every fibre | holds | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` | TS²; S¹×ℝ²; L⊕L on RP²; su(F) on S⁴; B=∅ | ⟨e,[S²]⟩=2, no section; H²(S¹)=0, constant section; e=β(a)≠0 in ℤ/2 with w₂=a²≠0, no section (a torsion e still detects); S⁴ in rank 3: e=0 and no section, excluded by `hdim` since 4>3; ∅: both sides true | holds; `hdim` necessary | none |
| C2.3 `eval_eulerClass_tangent_eq_eulerChar` | S² (n=1); T²; S³; CP²; reversed o; M=∅ | 2=χ(S²)=2; T² parallelizable, 0=0; S³: e is 2-torsion in H³=ℤ, so 0=0; CP²: c₂=3h², 3=χ; −u and −[M] give the same value; ∅: 0=0 | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1,2,3; m=3 control; natural subtraction | RP²→ℝ² would have open compact image; w̄₃(RP⁴)=a³≠0 with q=2<3; w̄₇(RP⁸)=a⁷ with q=6<7; w̄(RP³)=1 gives no obstruction, and RP³ immerses in ℝ⁴; 2^(k+1)≥4, so no truncation | holds | none |
| C1.0 metric change | h₁=4h₀ on a line; rank 0 | H^(−½)=½: h₁(u/2,u/2)=1; H^(½): 16; singleton frame | holds; no Check | R01 |
| C2.0 Thom cells | TS²; trivial bundle over a point; Möbius line | cells in degrees 2 and 4, H̃=ℤ in 2 and 4; S^r; RP², with H̃¹(RP²)=0≠H⁰(S¹)=ℤ | holds | none |
| C1.2a S5 Checks | X=[0,1), A={0}; pusher with r0=1/4, r1=1/2 | H_c⁰(X)=0, H_c⁰(A)=ℤ, H_c¹(X,A)=ℤ, H_c¹(X)=0, so the connecting map is an isomorphism; u=1/8 goes to 0 and 7/16 is fixed | holds | none |
| C5a.1 CE sign and H¹ | degree 1; U(1); SU(2) | README −a([X,Y]) = Dupont A2 = Mathlib −f⁅x,y⁆; H¹(U(1))=ℝ; ann(su₂)=0=H¹(S³) | holds; no Check | R01 |
| C5a.2 degrees | SU(n); E8 | weights 4,…,2n, n−1=rank generators; Σ(2dᵢ−1)=248=dim E8 | holds; no Check | R01 |
| C5a.3 `CS_P` | u(1) with P=a and P=a²; quadratic P on nonabelian g | θ; θΩ with d(θΩ)=Ω²; ∫(t²−t)/2=−1/12 gives −(1/3)tr θ³, which equals tr(A dA+⅔A³) at θ | holds | none |
| C5a.4 Koszul model | SU(2); U(1); trivial group | Λ(e₃)=H*(S³); Λ(e₁); ℝ | holds; no Check | R01 |
| C5a.5 transgression | bidegree; circle | d_(2d): E^(0,2d−1)→E^(2d,0); d₂z₁=u₁ | holds | none |
| C5a.6 Poincaré series | SU(3); G2; trivial group | (1+t³)(1+t⁵): total 4=2², top degree 8=dim; 3+11=14; χ=1 | holds | none |
| C5a.7 degrees | E8; U(2); SU(2)/N(T) | 3+15+23+27+35+39+47+59=248; 1+3=4; RP²: H²=ℤ/2 | holds | none |
| C7.AdjointHopfObstruction | roots; equator; pinned embedding | p₁=(x−y)²=c₁²−4c₂ (Zentner line 50); c(a,b)⁻¹e₁=(ā,−b) has determinant (−1)³=−1, so ⟨c₂,[S⁴]⟩=±1 and ⟨p₁,[S⁴]⟩=∓4; i, j, k map to diag(I,−I), [[0,1],[−1,0]], [[0,I],[I,0]], the README's ordered basis | holds | none |
| C5.1 scalar and radical | SU(2) with start λ=(1,2,3); U(2); T² | κ=−8δ and B_G=2δ, so λ₁=1/4; rad=iℝ·1=centre; no simple factor | holds | R04 (ownership) |
| C3.2 relation sign | line E; RP²; CP¹ | a−c₁=0 gives c(O(−1))=1−h; (1+a)³=1+a+a²; (1+h)² gives 2 | holds | none |
| C3.3 Whitney correction | CP²; O(1)_ℝ on CP²; L⊕L on RP⁴ | (1−h²)³ gives p₁=3h²; p₁=h²=e²; −β(a)²≠0 in H⁴(RP⁴;ℤ)=ℤ/2 | holds | none |
| C3.4a first obstruction group | real k even or odd; complex | π_(n−r)(V_r(ℝⁿ)) is ℤ/2 when k is even and ℤ when k is odd (r≥2); complex: ℤ in degree 2k−1 | holds | none |
| C6.2 Chern character | O(1) and O(2) on CP²; TCP² | (1+h+h²/2)²=1+2h+2h²; ch₂=3h²/2=(9−6)h²/2 | holds | none |
| C6.4 wedge correction | rank r | ∏(1−e^(xⱼ))=(−1)^r e^(c₁)∏(1−e^(−xⱼ)), point value (−1)^r | holds | none |
| C7.1 L₃ | CP⁶; HP³; HP² | 945/945=1; (496−624+128)/945=0; (49−4)/45=1 | holds | none |
| C7.2 coth versus L | 2k roots | x coth(x/2)=2·g(x/2); the degree-2k parts agree since 2^(2k)·2^(−2k)=1 | holds | none |
| C7.3a w̄ Checks | RP⁴; RP²; RP³ | (1+a)³; 1+a; 1 | holds | none |
| Docstring list of non-statable headlines | all-degree CE complex at the pin; a degree of self-maps | Mathlib stops at `d₁₂`, and Tau Ceti's file is "Low-degree"; no deg at the pin | C5a.1 and C5a.5 unnamed; self-map sentence overstated | R02 |
| ConvexityToric sentence | this README lines 175–179 against ConvexityToric lines 88–95 | both assign the comparison, and ConvexityToric consumes C1–C3 | reverse-supply wording | R03 |
| Checks coverage | count of Checks blocks | 18 blocks; none in C1.0, C1.5, C5a.1, C5a.2, C5a.4, C6.1 | shape | R01 |

## Not verifiable

- `milnor-stasheff` is uncertified (no legal copy). Its cited locators were checked mathematically instead (see the table): Corollary 11.12 (C2.3 and its Lean docstring), Theorem 10.4 (C2.1), §12 (C2.2), §4 (C7.3a), Lemma 18.1 (C2.0), Theorem 15.3, §14, §19 and Appendix C. I searched the sources cache and the manifest.
- `bott-tu`, `milnor-tdv` §6 and `milnor-universal-ii` §§2–3 are uncertified and cited by locator only.
- No locator in the README is flagged unverified.
- tom Dieck and May are outside this round's sample and were not re-read.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, p. 87: the source says η is a bundle over X and ζ×η is a bundle over X∧Y; it should say η is over Y and ζ×η is over X×Y; affects nothing.
- **Error** in zentner-instanton-sheet2 at Exercise 3 hint, p. 2: the source says BSU(2) is HP¹, which is S⁴; it should say BSU(2) is HP^∞, whose 7-skeleton is HP¹=S⁴, which suffices for maps from S⁵; affects nothing.
- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 2: the source writes "skey-adjoint"; it should say skew-adjoint; affects nothing.
