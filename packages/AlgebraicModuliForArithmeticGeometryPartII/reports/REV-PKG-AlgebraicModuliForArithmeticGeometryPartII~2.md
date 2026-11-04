<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1082#issuecomment-6394250533 -->
Review (codex) of ac20a1e

Verdict: needs_changes

1. **F01** (P2) Two numerical-constancy headlines are statable but absent

   **Location:** Suggested.lean:13, “The positive-power criterion lacks the numerical Picard local system.” Suggested.lean:18 makes the same claim for the pure-curve graph criterion. README:530 and :756 state the corresponding headlines.

   **Claim:** The absence of the represented numerical local system prevents stating §§2.10 and 4.2 at the pins.

   **Witness:** Suggested.lean:68 already defines the geometric numerical quotient. `Scheme` pullbacks and `InvertibleSheaf.pullback` express the actual Galois action on it. The two signatures below elaborate at the pins, with only `sorry` warnings.

   **Exact repair:** State §2.10 in Layer 2 and §4.2 in Layer 4, remove their unstatability sentences, and register the definitions and theorem names in the corresponding README sections and How to read the build. Use the actual numerical quotient and Galois pullbacks, as below. There is no new opaque carrier or free predicate. The two equations on `g` uniquely specify the map induced by `sigma`: existence and uniqueness are the pullback universal property, since `sigma` fixes k. Using Aut(K/k) instead of Gal(k^sep/k) gives the same action, because automorphisms extend uniquely across the purely inseparable algebraic-closure stage.

   The following block was appended in the existing namespace in a scratch copy and elaborated using `lake env lean`. It requires exactly the file's existing imports, definitions, open namespaces and universe.

   ```lean
   /-- The numerical Galois action is trivial exactly when one positive exponent
   makes every geometric numerical class the pullback of a line bundle on X.
   The two equations on g specify the base-change map induced by sigma. -/
   theorem constantNumericalClasses_iff_positivePowerDescent
       (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
       (X : Scheme.{u}) (x : X ⟶ Spec (CommRingCat.of k)) [IsProper x] :
       let b := Spec.map (CommRingCat.ofHom (algebraMap k K))
       let X_K := pullback x b
       let q : TauCeti.AlgebraicGeometry.LineBundleClass X_K →
           TauCeti.AlgebraicGeometry.LineBundleClass X_K ⧸
             numericallyTrivialClasses K X_K (pullback.snd x b) := QuotientGroup.mk
       (∀ (sigma : K ≃ₐ[k] K) (g : X_K ⟶ X_K),
         g ≫ pullback.fst x b = pullback.fst x b →
         g ≫ pullback.snd x b =
           pullback.snd x b ≫ Spec.map (CommRingCat.ofHom sigma.toRingHom) →
         ∀ L : TauCeti.AlgebraicGeometry.InvertibleSheaf X_K,
           q (TauCeti.AlgebraicGeometry.LineBundleClass.mk
             ((TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback g).obj L)) =
           q (TauCeti.AlgebraicGeometry.LineBundleClass.mk L)) ↔
       ∃ d : ℕ, 0 < d ∧
         ∀ L : TauCeti.AlgebraicGeometry.InvertibleSheaf X_K,
           ∃ M : TauCeti.AlgebraicGeometry.InvertibleSheaf X,
             q (TauCeti.AlgebraicGeometry.LineBundleClass.mk L ^ d) =
             q (TauCeti.AlgebraicGeometry.LineBundleClass.mk
               ((TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback
                 (pullback.fst x b)).obj M)) := by
     sorry
   ```

   This is the full positive-power criterion, not the weaker claim that the image has full rational rank under an assumed constancy conclusion. Equality in the quotient is precisely the numerically trivial twist in §2.10, by §1.1's subgroup identification. The exponent precedes all geometric line bundles.

   **Repair tests:** On P¹_k both sides hold with d=1. On the pointless real conic the action on ℤ is trivial and the image is 2ℤ, so d=2 works while d=1 fails. On P¹_ℂ considered over ℝ the action swaps ℤ² and the image is diagonal: (d,0) is not diagonal for any d>0, so both sides fail. For an empty or finite scheme the quotient is 0 and d=1 works. The repair retains arbitrary proper X, nonreduced schemes, imperfect fields and positive characteristic.

   The same predicate also states the pure-curve graph criterion. The following real-body definition is exactly the first signature's left side; the graph definition uses the native irreducible components and intersection relation. The final equation ties the graph isomorphism to the actual base-change projection, excluding an arbitrary unmarked graph isomorphism. This block was elaborated together with the first: seven `sorry` warnings, no errors.

   ```lean
   /-- The actual base-field automorphisms fix every geometric numerical class. -/
   def HasTrivialNumericalGaloisAction
       (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
       (X : Scheme.{u}) (x : X ⟶ Spec (CommRingCat.of k)) [IsProper x] : Prop :=
       let b := Spec.map (CommRingCat.ofHom (algebraMap k K))
       let X_K := pullback x b
       let q : TauCeti.AlgebraicGeometry.LineBundleClass X_K →
           TauCeti.AlgebraicGeometry.LineBundleClass X_K ⧸
             numericallyTrivialClasses K X_K (pullback.snd x b) := QuotientGroup.mk
       (∀ (sigma : K ≃ₐ[k] K) (g : X_K ⟶ X_K),
         g ≫ pullback.fst x b = pullback.fst x b →
         g ≫ pullback.snd x b =
           pullback.snd x b ≫ Spec.map (CommRingCat.ofHom sigma.toRingHom) →
         ∀ L : TauCeti.AlgebraicGeometry.InvertibleSheaf X_K,
           q (TauCeti.AlgebraicGeometry.LineBundleClass.mk
             ((TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback g).obj L)) =
           q (TauCeti.AlgebraicGeometry.LineBundleClass.mk L))

   /-- The simple intersection graph of irreducible components. -/
   def componentGraph (X : Scheme.{u}) :
       SimpleGraph {C : Set X // C ∈ irreducibleComponents X} where
     Adj A B := A ≠ B ∧ (A.1 ∩ B.1).Nonempty
     symm := by
       constructor
       intro A B h
       exact ⟨h.1.symm, h.2.imp (fun _ hx => ⟨hx.2, hx.1⟩)⟩
     loopless := by
       constructor
       intro A h
       exact h.1 rfl

   /-- For a proper pure curve, numerical constancy is precisely descent of its
   component graph through the specified base-field projection. -/
   theorem constantNumericalClasses_iff_componentGraphDescent
       (k K : Type u) [Field k] [Field K] [Algebra k K] [IsAlgClosure k K]
       (X : Scheme.{u}) (x : X ⟶ Spec (CommRingCat.of k)) [IsProper x]
       (hpure : ∀ C : Set X, C ∈ irreducibleComponents X →
         topologicalKrullDim C = 1) :
       let b := Spec.map (CommRingCat.ofHom (algebraMap k K))
       HasTrivialNumericalGaloisAction k K X x ↔
         ∃ e : componentGraph (pullback x b) ≃g componentGraph X,
           ∀ C, closure ((pullback.fst x b) '' C.1) = (e C).1 := by
     sorry
   ```

   **Graph repair tests:** Two k-lines meeting at a k-point give trivial action on ℤ² and the identity on a two-vertex, one-edge graph. P¹_ℂ over ℝ gives the swap on ℤ² and a two-to-one vertex map, so both sides fail. The empty scheme gives the empty graph isomorphism and the trivial action on 0. P¹_ℝ disjoint union Spec ℂ gives trivial numerical action but three vertices over two; `hpure` excludes its zero-dimensional component. The same construction preserves the graph and numerical quotient under nilpotent thickenings.

   These are remaining instances of the old F01 pattern, discovered after its numerical-quotient repair; this is not a re-raise of an item marked not actionable.

2. **F02** (P3) Three Checks repeat general API assertions without an instance

   **Location:** README:177, “f*N ≡_f 0 for every N ∈ Pic(S).” The same pattern occurs at README:491 and README:1045.

   **Claim:** These bullets provide discriminating Checks.

   **Witness:** README:177 repeats :160; :491 repeats :479; :1045 repeats :1031. They supply no additional object or computed value. The smooth-case bullet also repeats the computed P² example at :1041.

   **Exact repair:** Delete these three bullets. Keep their API assertions and the other concrete Checks. Sections 0.4, 2.7 and 5.9 then retain respectively five, four and four Check bullets. If a replacement is wanted at :177, compute pr₁*O(−1)=O(−1,0), fibre degree 0, and horizontal degree −1; this tests relative versus absolute triviality. No Lean declaration changes are needed.

   **Repair test:** The remaining projection Check computes b=0; the remaining constant/nonconstant Checks compute the trivial action and the swap on ℤ²; the remaining AHK Checks compute 1, 0, 2−1=1 and 2−0=2. Coverage survives deletion.

3. **F03** (P3) The vertical-descent proof continues onto page 18

   **Location:** README:993, “CT20, Lemma 2.17 and proof, pp. 16–17”.

   **Claim:** The cited page range contains the lemma and the proof used in §5.7.

   **Witness:** CT20 line 690 starts page 18; lines 692–702 contain the nonzero section, the test curve and the negative-degree contradiction. These are the steps invoked at README:997.

   **Exact repair:** Change the range to pp. 16–18. Keep the lemma number and line 630. `sources.toml` already records pp. 16–18 and needs no change.

   **Repair test:** The expanded locator contains both the four hypotheses at CT20 lines 630–637 and the conclusion of the curve-degree contradiction at line 702.

Three findings: one P2 and two P3; no false mathematical target was found. The remaining blocker is two omitted headline theorems that can be stated using the repaired numerical quotient. The six declared supplier gaps are contracts, not findings.

In this report, README and Suggested.lean mean `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md` and `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean`. Source line numbers refer to the supplied cached extractions. Library paths below are relative to their pinned repositories.

## Verified sound

The complete package was read: 51 numbered subsections, all 51 Needs lines, the conventions, supplier contracts, six layer dependency paragraphs, examples, references, metadata, manifest and ten Lean declarations. All ten previous findings were checked individually. All fifteen newly seeded source targets were opened, including their proof inputs where the README extends a source's setting. The 176 computed rows and the other tables record the mathematical and ownership evidence; an elaboration result is not being used as a truth check.

### Previous findings, checked first

| Previous finding | Repaired passage and location | Result |
|---|---|---|
| F01: missing numerical-finiteness headlines | README:248 “this is `numericalClassGroup_free_finite`”; :263 “this is `relNumericalClassGroup_free_finite`”; Suggested.lean:86,97 state both | Repaired. Properness and Noetherianity survive elaboration. The separate §§2.10/4.2 omissions are R01. |
| F02: vague finite-component gap | README:55 “provide finitely many points s₁, …, s_n” with the degree-zero iff on all versus selected fibres | Repaired. Identical needs in plan.json; the injection at :267 is correctly directed. |
| F03: bigness gaps consume later predicates | README:49 uses “nonnegative degree on every integral curve”; :57 gives h⁰ inequalities and the top-intersection equality | Repaired. Neither contract depends on a later bigness predicate; n=0 is separated from the O(m^(n−1)) bound. |
| F04: node IDs and cycle-law ownership | README:419 cites “ComplexComparisonPartII §C3.2d.4”; :939 cites “AlgebraicModuliForArithmeticGeometry §7.3”; :108 assigns length dévissage to this section | Repaired. Both supplier declarations exist at the supplied heads; STACKS line 4474 supports the added law. |
| F05: source locators | README:138 “KLE05 line 2498”; :902 “HW23 lines 90 and 111”; :977 “BMP23 line 4789”; :1023 “AHK07 line 63”; :564 “p. 34”; Suggested.lean:133 “p. 7” | Repaired at every originally flagged location. R03 is another instance found in the new sample. |
| F06: padded Needs | README:603 “SchemeAndStackFoundations §§2.6, 4.9”; :671 “§§0.9, 0.11, 0.23, 2.6” | Repaired. Repeated entries at §§0.1 and 2.3 were also removed. |
| F07: duplicated Checks | README:347–349 retain the three distinct big/nonbig tests; :511–513 retain norm degree, identity and noninverse tests; :558–560 retain the two-torsion negative control | Repaired for all listed pairs. R02 records three remaining abstract repetitions. |
| F08: unnamed supplied variants | README:615 “requiring O_Y ≅ f_*O_X only”; :706 identifies the scheme case with StableReduction; :106 applies `c1_degree_curve` | Repaired. The variants and consumed originals are distinguished correctly. |
| F09: finiteness after topology | README:357 “Form quotients first, prove absolute and relative finiteness next, then give curve-space duality, topology and cones” | Repaired. Sections 1.1–1.6 follow that order; §0.6 no longer uses an undefined Num. |
| F10: nonexistent owners | README:15 describes the excluded topics without those names; :1057 retains the two actual consumers | Repaired. No rejected owner name remains. |

No repair report item was marked not actionable. Repair-touched definitions, gap statements, routes and examples were recomputed rather than accepted from the repair report. For unchanged material the previous computed rows were used as additional evidence, not its uncomputed summary assertions.

### Seeded source audit

| Target | Text opened, numbering and pages | Hypotheses and result |
|---|---|---|
| §1.3 relative finite rank | BMP23 line 825, Remark 2.22, p. 19; KLE05 line 2782, Theorem 6.16 and proof, pp. 58–59 | BMP23 gives proper Noetherian relative finite-dimensionality. KLE05's theorem is projective flat with geometrically integral fibres, not the whole claim. The README correctly uses the separately declared finite-point contract for the general reduction. |
| §2.1 proper Picard scheme | KLE05 line 1630, Corollary 4.18.3, p. 34; lines 1650–1685, p. 35; Proposition 4.17 at line 1578, p. 33 | Arbitrary proper k-schemes, fppf representability and open quasi-projective pieces match. Nonflat representability is Theorem 4.18.5, line 1672. No universal-functions hypothesis is smuggled in. |
| §2.2 constants and units | SCH23 line 313, Lemma 1.4 and proof, pp. 7–8 | Flat k-algebra base change preserves Γ; units depend on the entire finite constants algebra, including nilpotents. |
| §2.4 Brauer obstruction | SCH23 lines 221–226, p. 5; KLE05 lines 980–1038, Remark 2.11, pp. 20–21 | The coefficient is h_*G_m. The first kernel is Pic(X^aff)=0, and the obstruction is Br(X^aff), not always Br(k). |
| §2.5 torsion component | KLE05 lines 2701–2775, Definition 6.8, Lemma 6.9, Exercise 6.11, Proposition 6.12, Remark 6.14, pp. 56–58 | Finite type for proper nonprojective X uses Remark 6.14 and finite-type Picard pullback. Numerical triviality agrees with membership after any field extension. |
| §2.10 positive-power criterion | SCH23 lines 191–231, Lemma 1.1, pp. 5–6 | The README corrects d≥0 to d≥1, uses Pic^τ in the torsor step and only Leray injectivity. These repairs retain the theorem's generality. |
| §3.2 rigidity | SCH23 lines 265–273, pp. 6–7; README's graph-image argument at :617 | The source motivates the contraction dictionary, rather than stating this complete rigidity theorem. The provided proof establishes the proper-Noetherian generality: finite graph projection plus O_Y=f_*O_X gives an isomorphism. |
| §3.3 semiampleness and ring | SCH23 lines 265–273, p. 6; WIT22 lines 319 onward, p. 7 | Relative generation is the evaluation-map condition. No false fibrewise-generation equivalence is asserted. The relative version uses the named StableReduction interface. |
| §3.4 semiample dictionary | SCH23 lines 265–288, pp. 6–7 | Semiample sheaf and projective target match. The README supplies the missing finite-module argument for the full section ring and applies rigidity to numerical uniqueness. |
| §3.6 inseparable descent | SCH23 lines 289–311, p. 7 | The affine-hull argument uses neither projectivity nor constant Num. Arbitrary purely inseparable extensions work through qcqs flat Γ base change. Lean retains both source and target squares. |
| §4.1 component graph | SCH23 lines 232–238, p. 6 | The README repairs collapsed edges and separates arbitrary component bijections from field base change. |
| §4.4 surface contractions | SCH23 lines 332–347, p. 8 | Smooth proper surface and h⁰(O)=1 match. The roadmap correctly adds the missing zero-dimensional target and explains geometric normality, curve smoothness and flatness. |
| §5.2 numerical representatives | HW23 lines 1513–1528, p. 33, continuing p. 34; LMFDB11 lines 88–104 and 164 | HW23 uses numerical equivalence. The README does likewise; it does not infer failure of all positive-power lifts. The elliptic equation, conductor 11, rank 0 and torsion order 5 match. |
| §5.3 complete-DVR lifting | HW23 lines 1406–1417, Lemma 6.3, p. 31; KLE05 lines 2219–2241, Proposition 5.19, p. 47 | HW23 is projective mixed characteristic. The actual H² obstruction, formal existence and ampleness-openness route justifies the README's proper flat, all-characteristic extension. |
| §5.7 vertical descent | CT20 lines 630–702, Lemma 2.17, pp. 16–18 | All four hypotheses are retained. The target divisor belongs to S. The proof's test curve lies over K(E), which is allowed by the all-fibres nef criterion. R03 corrects pagination only. |

No locator is flagged unverified in the package. All fourteen manifest works have legal cached text; no new fetch or manifest mutation was necessary. Additional source checks covered the repair locators, STACKS 0AYW, 00PH, 0C66, 0D01, 0CZV, 0D3A and 0D3D, KEE99 0.0/1.7/2.16, and AHK07 1.6. Numbering is that of the explicitly recorded preprint versions, not assumed published numbering.

### Computed adversarial table

Each row identifies a distinct assertion; repeated appearances of that assertion in APIs, Checks and worked examples share the row. Multiple values in a row are separate instances, not an assertion that those instances prove the general theorem. A dash in Change means no repair is needed for that assertion. All results below use the stated hypotheses. The subgroup-closure definitions were checked against the subgroup law, not treated as definitionally equal to their generating sets.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: proper may be empty | X=∅ over k | Pic=1; Num=0; no curves; Γ=0 ring; affine hull=∅ | Consistent | — |
| Conventions: base field in degree | P¹_ℂ over ℝ and its ℂ base change | ℝ-degree=4−2=2; two geometric degrees 1+1=2 | Consistent | — |
| Conventions: positive exponent | swap on ℤ²; d=0,1,2 | 0·(1,0)=(0,0) fixed; (1,0),(2,0) not fixed | d=0 must be excluded | Already excluded |
| Conventions: abelian groups | ℤ/4; S₃ | 1+2=2+1=3; (12)(23)=(123)≠(132)=(23)(12) | S₃ cannot be a Picard group; commutativity is explicit | — |
| Conventions: total finrank | infinite-dimensional ⊕ℕℝ; 0 | finrank=0 in both; dimensions are ℵ₀ and 0 | Finiteness must precede rank use | Correct order |
| §0.1 pairing and class invariance | O(m) on P¹, including m=−1,0,1 | χ=m+1; χ(O)=1; degree=m; isomorphic sheaves give equal χ | Correct native normalization | — |
| §0.1 tensor additivity | O(2)⊗O(−3) on P¹ | degree=−1=2+(−3) | Pass | — |
| §0.1 inverse and integer powers | O(2), n=−1,0,2 | degrees −2,0,4 = n·2 | Pass | — |
| §0.1 trivial and zero-dimensional degree | O on P¹; Spec k[ε]/ε² | 1−1=0; 2−2=0 | Excludes χ as degree | — |
| §0.1 generic-length formula | doubled line; line plus isolated point | doubled: χ(O(1))−χ(O)=3−1=2·1; mixed: (2+1)−(1+1)=1 | Multiplicity matters; dimension-zero part cancels | — |
| §0.1 finite pullback | z↦z² on P¹ | deg pullback O(1)=2; function-field degree·1=2 | Correct direction | — |
| §0.1 restriction of scalars | P¹ over a finite extension of degree e | deg_k O(m)=em=e·deg_K O(m) | Pass for separable and inseparable e | — |
| §0.1 full field base change | doubled line; P¹_ℂ/ℝ | degrees 2→2 and 2→1+1 | Reduced support would give wrong values | — |
| §0.1 first Chern comparison | O(−1),O,O(1) on P¹ | Euler degrees −1,0,1; cycle degrees −1,0,1 | Agrees with supplier | — |
| §0.2 component factor d_C | P¹_ℂ/ℝ; P¹ over k(t^(1/p)); pointless conic | (m,r,d)=(1,2,2),(p,1,p),(1,1,1); conic degree image=2ℤ | Not the closed-point index | — |
| §0.2 divisibility and ℝ-linearity | O(1) on first two curves; half its real class | 2=2·1; p=p·1; real scaled values 1=2·(1/2) | Integer divisibility only for integral classes | — |
| §0.3 both directions of field invariance | P¹_ℝ O(0),O(1); generic line in P² over k(u) | 0↔0; 1↔1; generic and specialized O(1)-degree both 1 | No erroneous image-curve argument | — |
| §0.4 NumericallyTrivial | O on X; O(1) on P¹; O(p−q) on E | all test degrees 0; degree 1; degree 1−1=0 with nontrivial Picard class | Real predicate, not triviality | — |
| §0.4 RelNumericallyTrivial | id_S; pr₁:P¹×P¹→P¹ | no fibre curves, all L pass; O(a,b) passes iff b=0 | Relative and absolute differ | — |
| §0.4 absolute/relative comparison over k | P¹→Spec k | fibre is P¹_k; both predicates on O(m) mean m=0 | Pass | — |
| §0.4 subgroup and equivalence | projection, O(a,0),O(c,0),O(a,1) | sum fibre degree=0+0=0; inverse=0; O(a,1) has degree 1 | Correct subgroup, excludes full Pic | — |
| §0.4 pulled-back classes | pr₁*O(−1) | fibre degree=0; horizontal degree=−1 | Relative zero need not absolute zero | R02 removes abstract repetition |
| §0.4 closed/geometric tests | blown-up P¹_R; P¹_ℂ/ℝ | O(E) degrees generic 0, exceptional −1; geometric O(m) degrees (m,m) | Both characterizations retain all components | — |
| §0.4 base change and closed restriction | O(a,0), pr₁; a fibre and a section | after any field extension fibre degree=0; fibre restriction 0; on section over base identity no relative curve | Pass | — |
| §0.4 surface/supplier relation | P¹×P¹; Enriques canonical sheaf | absolute zero iff (a,b)=(0,0); 2ω=0 gives 2degω=0 hence degω=0 | Same integral convention | — |
| §0.5 closed points suffice | P¹_R O(m); blow-up at closed point | special degree=m; O(E) generic 0 but E-degree=−1 | Closed test catches failure missed generically | — |
| §0.6 proper-surjective detection | nodal cubic normalization; Bl_pP² | normalization degree=d on both; pulled-back H gives E-degree 0 and strict-line degree 1 | Both directions compatible with positive field factor | — |
| §1.1 quotient and class equality | P¹; elliptic E; id_S | ℤ/0=ℤ; (E(k̄)×ℤ)/E(k̄)=ℤ; Pic/Pic=0 | Correct numerical quotient | — |
| §1.1 closure subgroups in Lean | P¹; pr₁; ∅ | closures are {0}, ℤ×{0}, {1}; quotient groups ℤ,ℤ,0 | Generators already a subgroup by §0.4 | — |
| §1.1 degree descends | O(a,b) modulo pr₁-numerical equivalence | (a,b) and (a+7,b) both evaluate to b | Pass | — |
| §1.1 torsion-free | degree lattice ℤ; Enriques ω of order 2 | n·d=0, n≠0 implies d=0; ω maps to 0 | No retained Picard torsion | — |
| §1.1 rational/real scalar extension | Num=ℤ² | maps (a,b)↦(a,b) in ℚ² then ℝ² have kernel 0 | Pass | — |
| §1.1 functorial pullback | P¹ self-maps of degrees 2 and 3 | (g∘h)* on degrees=6=3·2; identity=1 | Contravariant order correct | — |
| §1.1 surjective and field pullback injection | blow-up; real nonsplit quadric | H↦H has kernel 0; arithmetic diagonal ℤ→ℤ², n↦(n,n), kernel 0 | Injective need not surjective | — |
| §1.1 rational Cartier index independence | D=H/2; r=2,4 | [H]/2=[2H]/4 | Positive nonzero multiple matters | — |
| §1.1 comparison with existing spaces | P¹×P¹ | integral Num=ℤ²; real space=ℝ²; pairing matrix [[0,1],[1,0]] | Same supplied surface quotient | — |
| §1.2 finite free headline | ∅; Spec k; P¹; doubled P¹; Enriques | ranks 0,0,1,1,10; order-2 canonical class killed | No smooth/projective-only narrowing in Lean | — |
| §1.2 rank and algebraic extension | nonsplit quadric; Pⁿ | 1≤2; ranks 0 for n=0 and 1 for n≥1 | Correct inequality and zero case | — |
| §1.2 étale bound | P¹, Spec k; ℓ invertible | ρ=1≤dim H²(μ_ℓ)=1; 0≤0 | ℓ=char k excluded from this bound | — |
| §1.2 elliptic-product ranks | End rank 1,2,4 | 2+rank End=3,4,6 | Supersingular case retained | — |
| §1.2 lattice proof | image 2ℤ⊂ℤ at ℓ=2 | image/(2·image)=2ℤ/4ℤ has dimension 1; ambient mod-2 image is 0 | Proof uses the image lattice, correctly | — |
| §1.3 relative free finite headline | id_S; pr₁; Bl_xP¹_R | quotients 0,ℤ,ℤ²; (a,b) evaluates as (a,−b,a+b) | All-fibre numerical kernel correct | — |
| §1.3 finite-point injection | same blow-up, generic and closed points | (a,b)↦(a;−b,a+b), kernel {(0,0)} | Contract gives an actual injection | — |
| §1.3 Noetherian necessity | S=Spec ∏ℕk | degree functions=bounded integer sequences; singleton indicators give arbitrarily large independent finite sets | Not finitely generated | — |
| §1.3 rank under a proper k-base | P¹×P¹→P¹ | relative rank 1≤absolute rank 2; identity rank 0 | Correct direction | — |
| §1.3 reducible Euler negative control | two P¹, O(1)⊔O(−1) | χ(L^p(n))=(n+p+1)+(n−p+1)=2n+2; component degrees=(1,−1) | Euler test alone fails | — |
| §1.4 cycle quotient and pairing | P¹×P¹ | class (a,b) paired with rulings=(b,a); radical=0 | Curve and divisor sides distinguished | — |
| §1.4 duality | pr₁; identity | N¹=ℝ,N₁=ℝ, pairing bt; identity gives 0 and dual 0 | Finite-dimensional premise in order | — |
| §1.4 effective cone and closure | P¹×P¹; identity | NE=ℝ²≥0=closure; identity NE={0} | Empty generating set gives {0} | — |
| §1.4 pushforward | blow-up: E and strict transform of a line | g_*E=0; g_*ℓ̃=ℓ; degrees 0 and 1 on each side | Projection formula and cone inclusion | — |
| §1.4 nonclosed cone | E×E, A=[[1,√2],[√2,2]] | det A=0; det(A+I)=4; det(A+I/2)=7/4; irrational rank-one ray has no nonzero rational point | NE differs from its closure | — |
| §1.5 nef definition and dual cone | P¹ O(m); pr₁ O(a,b) | m≥0; b≥0; dual of nonnegative ray is nonnegative ray | Both directions agree | — |
| §1.5 convexity, addition, scaling | P¹ classes 1,2,0,−1 | 1+2=3≥0; 2·1=2≥0; 0≥0; −1<0 | Excludes sign reversal | — |
| §1.5 pullback/detection | blow-up H; effective E | pulled-back H has degrees 1 and 0, nef; E·E=−1, not nef | Effectivity alone insufficient | — |
| §1.5 base change and all fibres | pr₁ over k and K; blow-up P¹_R | degrees b→b; O(E) generic 0 and special −1 | Geometric and closed tests agree | — |
| §1.5 characteristic-zero comparison | P¹×P¹ | nef region a≥0,b≥0 in both suppliers | Pass | — |
| §1.6 bigness definition | P² O(1); P¹×P¹ O(1,0); point | h⁰=(m+1)(m+2)/2; h⁰=m+1=o(m²); h⁰=1=m⁰ | True, false, true | — |
| §1.6 nef top-intersection iff | same examples | squares 1>0,0; point top intersection 1>0 | Matches growth on both sides | — |
| §1.6 positive powers | O(d) on P¹ | h⁰(O(md))=md+1 for d>0; replacing d by ad preserves d>0 | a=0 would fail for O(1) | — |
| §1.6 integral field extension | P¹_k→P¹_K | both h⁰(O(m))=m+1, c unchanged | Vector dimensions, not restriction of scalars | — |
| §1.6 parent comparison | P² O(1); O_P² | both predicates: quadratic growth versus constant 1 | Proper extension agrees on supplied domain | — |
| §1.6 birational invariance | normalization of nodal cubic with degree-3 L | h⁰=3m versus 3m+1, difference 1=O(m⁰); degrees both 3 | Error term lower order | — |
| §1.6 nef hypothesis | H+E on Bl_pP² | (H+E)²=0; h⁰ grows quadratically; (H+E)·E=−1 | Nefness necessary for iff | — |
| §2.1 representability | P¹; P¹_ℂ/ℝ; Spec k[ε] | components ℤ; real points ℤ versus geometric ℤ²; finite local thickening Pic sheaf=0 | Arbitrary constants retained | — |
| §2.1 gluing and field change | nodal rational cubic; P¹_ℂ/ℝ | Pic⁰=G_m with tangent dimension 1; base change splits degree lattice to ℤ² | Componentwise Pic would lose G_m | — |
| §2.2 finite constants/affine hull | P¹; P¹_ℂ/ℝ; two lines; ∅ | constants k,ℂ,k×k,0; hulls Spec of those rings | Zero algebra gives empty hull | — |
| §2.2 constants base change | P¹×Spec k[ε], any A | Γ=A[ε]/ε² = (k[ε]/ε²)⊗A | Nilpotents survive | — |
| §2.2 units sheaf | same thickening | (1+εa)(1+εb)=1+ε(a+b); reduction deletes this kernel | Wrong reduced model excluded | — |
| §2.2 contraction/universality | P¹⊔P¹; finite Spec B | Γ=k×k, sheaf on the two-point hull maps identically; finite case map=id_B | Canonical affine map pinned | — |
| §2.3 étale pushforward and H¹ | finite R=ℂ/ℝ; R=k[ε]; R=0 | Pic(R)=0 in all cases; higher finite étale direct images=0 | Semilocal input used on its domain | — |
| §2.3 Brauer and nilpotents | ℂ; ℝ[ε]; ℝ×ℝ | Br=0,ℤ/2,(ℤ/2)²; Leray comparison same groups | Correct finite-product formula | — |
| §2.4 exact obstruction | pointless conic | 0→2ℤ→ℤ→ℤ/2; kernel of mod 2=2ℤ; 2·obstruction=0 | Nontrivial obstruction detected | — |
| §2.4 constants target and injection | P¹_ℂ over ℝ; over ℂ | Br(ℂ)=0; Pic→Picard points is ℤ→ℤ, then ℤ²→ℤ² | Br(k) would be wrong here | — |
| §2.5 definition of τ | P¹; elliptic E; classical Enriques | τ=0,E,ℤ/2; [n] inverse images of identity component give these groups | Includes torsion components | — |
| §2.5 finite type and scheme structure | ordinary Enriques in characteristic 2 | τ=μ₂, length 2, one geometric point; τ=Pic⁰ as schemes | Reduced points would lose length | — |
| §2.5 numerical membership/base change | O(m) on P¹; O(p−q) on E | membership iff m=0; degree-zero class always in E; same after extension | Both directions pass | — |
| §2.6 quotient local system | P¹_ℂ/ℝ | geometric quotient ℤ² with order-2 swap; arithmetic lattice diagonal ℤ | Not constant | — |
| §2.6 stalk rank and finite action | finite X; P¹; S₃-permuted three conjugate components | lattices 0,ℤ,ℤ³; image action sizes 1,1,6 | Finite action need not trivial or abelian | — |
| §2.6 rational injection not surjection | pointless conic | Num(X)=2ℤ↪ℤ=Num-sheaf(k); kernel 0, cokernel ℤ/2 | Integral image retained | — |
| §2.6 arbitrary field base change | real conjugate P¹→ℂ | swap local system becomes constant ℤ² | Scheme base change, not unchanged rational points | — |
| §2.6 morphism functoriality/injectivity | blow-up P²→P² | numerical pullback ℤ→ℤ² is a↦(a,0), kernel 0 | Same geometric stalk computation | — |
| §2.6 rational-point Picard Check | P¹_k with section | Pic=ℤ=Picard(k); obstruction=0 | Rational section kills obstruction | — |
| §2.7 constancy predicate/equivalence | P¹; finite X; nonsplit quadric | action id on ℤ; id on 0; swap on ℤ² | True, true, false | — |
| §2.7 finite-index equivalence | conic; conjugate P¹ | 2ℤ⊂ℤ index 2; diagonal ℤ⊂ℤ² infinite index | Both directions distinguish examples | — |
| §2.7 preservation/separably closed fields | trivial action restricted to subgroup; k=k^sep | image remains {1}; absolute Galois group={1} | Correct; abstract duplicate Check unnecessary | R02 |
| §2.8 norm map/rank formula | P¹, [E:k]=2, d=1,−1 | Nm O(d)=O(2d), degrees 2,−2; Nm pr*=2 | Not inverse to pullback | — |
| §2.8 τ preservation | E-curve degree-zero line bundle | norm degree=2·0=0 | Correct zero component | — |
| §2.8 tower/naturality | degrees 2 then 3; identity | norm degree=6d=2·3d; degree-1 norm=d | Correct composition | — |
| §2.9 torsor obstruction killed | smooth proper model of y²=−(x⁴+1) over ℝ, l=1; conic τ=0 | no real points, complex point (0,i), so [T] has order 2; conic [T]=0 already | Does not conflate with Brauer obstruction | — |
| §2.9 Leray step | split pullback class | image in H¹(E,P_E)=0; injective edge forces class 0; norm gives n[T]=0 | No false R¹q_* vanishing needed | — |
| §2.10 uniform exponent | conic; conjugate P¹; rank 0 | d=2 covers 2ℤ; every (d,0), d>0, misses diagonal; d=1 covers 0 | README theorem sound | R01 adds signature |
| R01 native Galois formulation | same objects | g* acts by identity on ℤ or swap on ℤ²; q(L)^d has values d or (d,0) | Full criterion on actual objects | Add tested signature |
| §2.11 doubling factorization | ℤ/4→ℤ/2 | d(1)=2; dπ(1)=2; πd(1)=0=2·1 in ℤ/2 | Both equations fixed | — |
| §2.11 uniqueness/naturality | same quotient, multiply by 3 | d(3·1)=2=3·2 mod4; forced value d(1)=2 | No arbitrary splitting chosen | — |
| §2.11 kernel hypothesis | ℤ/8→ℤ/2; kernel 2ℤ/8 | lifts 1,3 double to 2,6; difference 4≠0 | Without 2P=0 no well-defined d | — |
| §2.12 finite τ-points | elliptic curves over F₂ and F₃ in README | counts 3 and 4 including infinity; each rational degree-zero class killed by 3 or 4 | Small characteristics included | — |
| §2.12 locally finite torsion headline | finite X; E over F̄_p | Pic finite X=0, n=1; every point lies in finite E(F_q), killed by its order | Positive exponent exists | — |
| §2.12 excluded fields | constant elliptic E over k=F_p(E), P its generic point | [n]:E→E has degree n²>0 for n>0, so [n]P≠0; k is not algebraic over F_p | Algebraicity hypothesis retained | — |
| §3.1 IsContraction definition | id; cusp normalization; P¹_ℂ→Spec ℝ | identity section maps iso; k[t²,t³]→k[t] not onto; ℝ→ℂ not iso | Not just connected proper fibres | — |
| §3.1 surjectivity/empty case | ∅→Y; blow-up | app iso on all opens iff Y=∅; exceptional fibre P¹ nonempty | Empty source forces empty target | — |
| §3.1 geometric connectedness | blow-up; pr₁ | fibres point/P¹; geometric component count=1 | Locally Noetherian hypothesis present | — |
| §3.1 composition/flat base change | two point blow-ups; extension k→K | pushforward O=O at both stages; after extension also O | Pass | — |
| §3.1 Stein factorization/structure map | P¹_ℂ→Spec ℝ | Stein target Spec ℂ, then finite degree 2; structure map to ℝ not contraction | Constants control target | — |
| §3.2 rigidity existence/uniqueness | pr₁, g=h∘pr₁; id versus blow-up | g has degree-zero point images on vertical P¹; factor h unique; identity maps exceptional P¹ to a curve, so fails hypothesis | Proper graph argument applies | — |
| §3.2 same-curve uniqueness | two maps pr₁ and automorphism∘pr₁ | both contract vertical rulings only; target isomorphism is that automorphism | Marking under X retained | — |
| §3.3 semiample definition | O(1), O; E degree-zero infinite-order L | generated with m=1; generated with m=1; h⁰(L^m)=0 for every m>0 | Nef does not imply semiample | — |
| §3.3 graded ring/Proj | Pⁿ O(1); O_X | k[x₀,…,x_n], Proj=Pⁿ; B[T], Proj=Spec B | Includes n=0 and constants B | — |
| §3.3 positive powers | torsion L of order r | L^r=O, so its Veronese=B[T]; L^n torsion of order r/gcd(r,n) | Semiample equivalence for all n>0 | — |
| §3.3 semiample implies nef | P¹ O(2); Bl_pP² O(E) | degree 2≥0; E-degree −1 excludes semiampleness | Sign fixed | — |
| §3.3 pullback/base-change detection | pr₁*O(1); E nontorsion L over ℂ and extensions | O(1,0) generated; all positive-power section spaces remain 0 | Faithfully flat evaluation, not fibre-only assertion | — |
| §3.3 relative pullback power | L=pr₁*O(−1) | f*f_*L→L is iso; fibre degree 0 although absolute horizontal degree −1 | Relative generation correctly stated | — |
| §3.4 finite generation/projective contraction | O(1,0) on P¹×P¹ | R=k[x₀,x₁]; Proj=P¹; fibre degree 0, horizontal degree 1 | Correct curves contracted | — |
| §3.4 recovery of target | f=pr₁, ample O(1) on target | H⁰(X,f*O(t))=t+1=H⁰(P¹,O(t)); recovered Proj=P¹ | Marked recovery | — |
| §3.4 ring and target base change | P¹_ℂ viewed over ℝ, L=O | B=ℂ; B⊗ℝℂ=ℂ×ℂ; targets split into two points | No lost constants | — |
| §3.4 numerical uniqueness | O(p),O(q) on an elliptic curve with p≠q; torsion sheaves alone | degrees 1=1, both contractions are the identity; torsion powers yield B[T], target Spec B | Semiample assumption essential | — |
| §3.5 finite field of definition | identity; one-component collapse of conjugate P¹ | first defined over k; second defined over ℂ/ℝ degree 2, not ℝ | Existence not descent to k | — |
| §3.6 purely inseparable descent headline | identity extension; k⊂k^perf; ∅ | identity squares; Γ(U_K)=Γ(U)⊗K and same topological opens; empty target forced | Finite-degree assumption unnecessary | — |
| §3.6 separable negative control | P¹_ℂ/ℝ, collapse one geometric component | target geometric components have dimensions 0 and 1, swapped by conjugation | No ℝ descent | — |
| §3.7 constant-Num contraction descent | split P¹×P¹; nonsplit real quadric | split ruling class fixed and projection defined over k; nonsplit rulings exchanged, no individual projection | Hypothesis separates examples | — |
| §3.7 inseparable/Galois route | extension degrees p then 2 | inseparable stage keeps opens; norm class is 2[L], zero-curve set unchanged | Stage order and positive multiple correct | — |
| §3.8 open ampleness locus | P¹_Y, O(1),O | loci Y and ∅; pullback condition true and false on nonempty tests | Universal open characterization matches | — |
| §3.8 fibre-to-relative ampleness | P¹_R O(d), d=1,0,−1 | special degrees 1,0,−1; relative ample exactly d>0 | Both directions on this family | — |
| §4.1 graph definition | two disjoint lines; V(xy); integral nodal curve; ∅ | (vertices,edges)=(2,0),(2,1),(1,0),(0,0) | No loops or node multiplicities | — |
| §4.1 map on components | V(x²+y²)_ℂ→V(x²+y²)_ℝ | two vertices→one; one edge collapses | Edge-or-vertex law correct | — |
| §4.1 vertex bijection not arbitrary graph iso | normalization of two meeting projective lines | vertex counts 2→2; edge counts 0→1 | Adjacency reflection is extra | — |
| §4.1 field-base-change reflection/functoriality | two k-lines meeting at k-point, any K/k | graph remains (2,1); identity and composite vertex maps stay identity | Faithful-flat intersection test | — |
| §4.2 pure-curve criterion and R01 signature | conjugate P¹; two k-lines; empty scheme | swap ℤ² and graph 2→1; trivial ℤ² and graph edge→edge; action on 0 and graph ∅→∅ | Both directions pass | R01 adds signature |
| §4.2 mixed-dimensional negative control | P¹_ℝ⊔Spec ℂ | numerical local system ℤ constant; graph vertices 3→2 | Purity needed and retained | — |
| §4.3 matrix/negative predicates | two P² lines; exceptional curve; smooth fibre | [[1,1],[1,1]] has eigenvalues 2,0; [−1]; [0] | Signs and definite/semidefinite distinguished | — |
| §4.3 labels and adjacency | two transverse lines; disjoint exceptional curves | intersections 1>0 and 0; edge present and absent | Exact iff | — |
| §4.3 full Cartier base change | x^p−a and y^p−a on P² | local k-length p²; pulled-back divisors pC₁,pC₂ give p²·1 | Reductions alone would give 1 | — |
| §4.3 whole-surface restriction of scalars | P²_κ, [κ:k]=2 | line intersection over k=2; over κ=1 | Does not rescale reduced fibres in an ambient k-surface | — |
| §4.4 trichotomy | S→Spec k; Bl_pP²→P²; pr₁ | target dimensions 0,2,1; second degree 1; third flat P¹ fibres | All three alternatives needed | — |
| §4.4 constants and geometric normality | split smooth proper surface | H⁰=k; after K, H⁰=K; connected normal geometric source has one component | Supports integrality used in route | — |
| §4.5 exceptional negativity | blow-up; A₂ resolution | [−1]; [[−2,1],[1,−2]], eigenvalues −1,−3 | Negative definite | — |
| §4.5 nonzero function in proof | local blow-up of origin, r=x; r=0 | v_E(x)=1; v_E(0) is not a finite divisor coefficient | Nonzero restriction necessary | Already stated |
| §4.6 Zariski matrix/radical | I₂; blown-up smooth fibre | −2(a−b)² and −(a−b)²; radical a=b; fibre vector (1,1) killed | Sign consistent with Tau Ceti | — |
| §4.6 proper subsets/single component | singleton of I₂; irreducible fibre | submatrix [−2] definite; full [0] not definite | Strict proper-subset and r≥2 restrictions correct | — |
| §4.7 negative-curve field of definition | geometric exceptional curve | normal bundle O_P¹(−1), h⁰=0, Hilbert tangent dimension 0 | Finite separable field of definition | — |
| §4.7 descent under constant Num | conjugate exceptional E₁,E₂; ruling on real quadric | E₁²=−1, E₁E₂=0, (E₁−E₂)E₁=−1; ruling square 0 | Distinct negative conjugates prevent constancy; zero-square excluded | — |
| §4.8 fibre graph descent | blow-up of rational fibre point; real conic degeneration | split graph edge→edge; nonsplit graph edge→vertex with swapped classes | Hypothesis detects non-descent | — |
| §4.9 reducible image rationality | split blown-up fibre; smooth fibre over degree-2 point | reducible fibre at rational point has κ=k; irreducible fibre may have κ/k degree 2 | Reducibility is essential | — |
| §4.9 strengthening via descended curve | geometrically integral D in reducible fibre | k→κ(a)→H⁰(D,O)=k forces degree 1; positive transcendence degree impossible | Closed rational image follows | — |
| §4.10 labels descend | split blown-up fibre; irreducible fibre | edge label 1→1; edge set empty in one-component case | No invalid residue-degree square factor | — |
| §5.1 restriction map and injection | Pⁿ_R n≥1; Spec R | res:ℝ→ℝ identity; 0→0 | Zero-dimensional boundary correct | — |
| §5.1 quotient duality | nonsplit-to-split quadric over ℤ_(5) | res(t)=(t,t); annihilator span(1,−1); ℝ²/annihilator≅ℝ | Correct direction of quotient | — |
| §5.1 numerical surjectivity/base change | same quadric and henselization | ranks 1→2 before; ruling cover splits after henselization, ranks 2→2 | Noncomplete witness is discriminating | — |
| §5.2 numerical representatives | conic-like index-2 lattice inclusion | image=2ℤ; m=2 represents generator; exact representative at m=1 unavailable | Clearing index proves only numerical claim | — |
| §5.2 exact-restriction counterexample | E: y²+y=x³−x²−10x−20 at 7 | affine counts 0,1,2,0,2,2,2 sum 9; #E(F₇)=10; rational specialization subgroup order 5 | Some degree-zero classes do not lift exactly | — |
| §5.2 positive-power distinction | special class outside subgroup | Num class=0; tenth power=0 in Pic⁰, so trivial lift exists | No claim all powers fail | — |
| §5.3 lifting headline | P¹_R over ℤ₂, ramified complete DVR, F₂[[t]] | H²(O)=0; O(d) lifts for d=−1,0,1; obstruction group 0⊗m^n/m^(n+1)=0 | Mixed/equal characteristic and ramification allowed | — |
| §5.3 hypothesis controls | incomplete quadric DVR; K3 special fibre | res ranks 1 versus 2; K3 h²(O)=1 | Neither example contradicts stated theorem | — |
| §5.3 ampleness of every lift | P¹_R O(d) | special ample iff d>0; relative ample iff d>0 | Closed-point neighbourhood is whole Spec R | — |
| §5.4 cone/face comparison | P¹_R; P¹×P¹ over R; point | ray↔ray; quadrant↔quadrant with two boundary rays; {0}↔{0} | Effective cycles and faces match | — |
| §5.4 ample restriction iff | O(a,b) on product family | relatively ample iff a>0,b>0, same special criterion | Does not depend on numerical surjectivity for this implication | — |
| §5.5 nef-big specialization | Pⁿ_R O(1) | top intersection 1→1, all curve degrees positive, h⁰ grows as mⁿ/n! | Pass in all characteristics | — |
| §5.5 converse negative control | three disjoint sections becoming collinear | generic determinant t≠0; H²=4−3=1 on both; special H·ℓ=2−3=−1 | Generic nef-big does not imply special nef | — |
| §5.6 semiample numerical descent | pr₁ with O(a,0); O(0,1) | first m=1,M=O(a), fibre degree 0; second degree 1 | Both assumptions used | — |
| §5.6 missing semiampleness | E→Spec k, infinite-order degree-zero L | degrees 0; n[L]≠0 for every n>0; Pic(k)=0 | Numerical triviality alone insufficient | — |
| §5.6 rational class formulation | D=(a/2)pr₁*H | 2D=f*(aH); same class after clearing 2 | Positive Cartier index retained | — |
| §5.7 vertical descent | projective bundle; identity | Pic fibre degree 0 gives pullback class; identity M=L | Normal/Q-factorial assumptions compatible | — |
| §5.7 divisor-image hypothesis | Bl_pS, L=−E | generic restriction 0; (−E)·E=1; pullbacks have degree 0 on E | Excluded map supplies counterexample | — |
| §5.7 effective-divisor curve step | nonzero effective point divisor on P¹ | section has one zero; degree=1>0; opposite degree −1 contradicts nefness | Exact sign of contradiction | — |
| §5.8 normalized degree/minimum | Pⁿ lines; P¹_ℂ/ℝ | 1/1=1; 2/2=1 | Denominator positive; set nonempty by assumption | — |
| §5.8 independence and maximum | normalized H-values 1,2; H′=3H,D=−2H | H′ values 3,6; D values −2,−4 | Same minimizer gives maximum D | — |
| §5.9 AHK definition/independence | P² and Bl_pP²; point | 1−0=1=2−1; point 0−0=0 | Integer subtraction and zero case correct | — |
| §5.9 small modifications vs Cartier rank | projective quadric threefold cone | small resolution P²-bundle over P¹ has ρ=2,e=0; AHK=2; Cartier rank=1 | No false equality without Q-factoriality | — |
| §5.9 divisorial rank change | Bl_pP²→P²; two successive blow-ups | 2−1=1; 3−2=1 | Change equals number of exceptional prime divisors | — |
| §5.9 Q-factorial and smooth agreement | quadric surface cone via F₂; smooth P² | 2−1=1=Cartier rank; 1=1 | Duplicate smooth Check removable | R02 |
| §5.9 relative extension | Bl_pP²→P² used as base T; identity resolution | ρ(Bl_pP²/T)=1,e=1 gives 0; identity relative rank=0 | Tests contract and relative subtraction | — |
| Gap finite-point detection | field; identity; blown-up P¹_R | one fibre; zero tests suffice; exceptional degrees −1 and 1 force closed-fibre test | Precise contract | — |
| Gap birational h⁰/intersection comparison | blow-up P², H; nodal cubic normalization | h⁰ equal binomial(m+2,2), H²=1=1; cubic 3m versus 3m+1, difference 1 | Growth and top intersection compatible | — |
| Gap nonflat Picard pullback | normalization of nodal cubic | Pic⁰ map G_m→0, kernel G_m quasi-affine finite type | Not supplied by flat descent alone | — |
| Gap proper Hilbert tangent | exceptional P¹; line in P² | Hom(I,O)=H⁰(O(−1))=0; H⁰(O(1))=2 | Rigid/nonrigid cases separated | — |
| Gap exceptional degree witnesses | one and two disjoint exceptional curves | degree matrices [−1] and diag(−1,−1); kernels 0 | Relative detection precise | — |
| Gap projective nef-big criterion | P² H; P¹×P¹ O(1,0); Spec K | 1 and quadratic growth; 0 and linear growth; [K:k]>0 and constant growth m⁰ | All dimension cases consistent | — |

### Pinned declarations and signatures

The content checkout is main at `bfaaff10c2db6fea1ff2d1500673df510534799f`. Its manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were against those copies, not current remote library branches.

| Declaration opened at the pin | File and line | What was checked |
|---|---|---|
| `AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean`:41 | Extends separated, universally closed and locally finite type; does not assert flatness, nonemptiness or geometrically connected fibres. |
| Properness of pullback second projection | Same file:82 | `[IsProper f]` supplies the exact fibre properness instance used by the relative numerical predicate. |
| `AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`:42 | Flatness of affine restriction maps, separately present in the DVR headline. |
| `Scheme.Hom.app` | `Mathlib/AlgebraicGeometry/Scheme.lean`:177 | Source Γ(Y,U), target Γ(X,f⁻¹U); testing every open expresses the canonical sheaf map, not merely global sections. |
| `Scheme.Hom.fiber`, `fiberι`, `fiberToSpecResidueField` | `Mathlib/AlgebraicGeometry/Fiber.lean`:37,40,45 | Actual scheme-theoretic residue-field pullback with both projections. |
| `AlgebraicGeometry.IsNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean`:277 | Includes local Noetherianity and compactness. A merely locally Noetherian infinite disjoint union is excluded. |
| Semilocal Picard instance | `Mathlib/RingTheory/PicardGroup.lean`:545 | `Subsingleton (CommRing.Pic R)` assumes finite maximal spectrum; applies to finite algebras, including the zero algebra. |
| `IsAlgClosure` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`:264 | Algebraic extension and algebraically closed target; R01 uses the actual base-field algebra structure and its automorphisms. |
| `IsPurelyInseparable` | `Mathlib/FieldTheory/PurelyInseparable/Basic.lean`:107 | Includes integrality; the statement also binds both fields and their algebra structure. |
| `separableClosure.isPurelyInseparable` | Same file:481 | Requires `Algebra.IsAlgebraic`; no finite-degree restriction. |
| `separableClosure.isGalois` | `Mathlib/FieldTheory/IsSepClosed.lean`:322 | Requires `Normal F E`; the finite normal field in §3.7 supplies it. |
| `Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean`:61 | Defined by cardinal-to-natural conversion; no hidden finite-dimensionality premise. |
| `Scheme.Hom.finrank` | `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`:88 | Local constancy uses finite, flat and locally finitely presented hypotheses. |
| `DistribMulAction` | `Mathlib/Algebra/GroupWithZero/Action/Defs.lean`:346 | Action preserves zero and addition; it is not itself a Galois action or a constancy theorem. |
| `QuotientAddGroup.lift` | `Mathlib/GroupTheory/QuotientGroup/Defs.lean`:249 | Generated additive declaration from `QuotientGroup.lift`; requires kernel inclusion. |
| `CategoryTheory.Limits.cokernel.desc` | `Mathlib/CategoryTheory/Limits/Shapes/Kernels.lean`:795 | Factorization through a cokernel, requiring the composite to be zero; no sectionwise surjectivity assumption. |
| `SimpleGraph`, `irreducibleComponents` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean`:93; `Mathlib/Topology/Irreducible.lean`:103 | Symmetric loopless adjacency and maximal irreducible subsets; neither by itself defines the package's component graph. |
| `InvertibleSheaf.eulerDegree` | `TauCeti/AlgebraicGeometry/LineBundle/Degree.lean`:70 | Actual body is the difference of Euler characteristics truncated at 2. Proper integral curves in the predicate ensure finiteness and higher vanishing; arbitrary schemes would permit junk values. |
| `LineBundleClass.eulerDegree` | Same file:126 | Lift of the invariant to isomorphism classes. |
| `LineBundleClass` group and trivial-class test | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`:135,142 | Native commutative group; class 1 means isomorphism to the trivial invertible module. |
| `InvertibleSheaf.pullback` | `TauCeti/AlgebraicGeometry/LineBundle/Pullback.lean`:72 | Actual invertible-sheaf pullback functor; used in all five signatures and R01. |
| `eulerDegree_eq_relativeDegree`, `eulerDegree_mul` | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean`:303,343 | Require integral locally Noetherian curve, codimension-one DVR local rings, properness and finite H¹(O). They are not cited as already proving arbitrary singular-curve additivity. |
| `Scheme.Modules.Cohomology` | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`:61 | Small-Zariski-site sheaf cohomology, with the actual invertible-module object. Subsingleton in the headline means H²=0. |
| Matrix semidefiniteness and radical theorems | `TauCeti/LinearAlgebra/Matrix/NegSemidef.lean`:91,104 | Symmetry, positive kernel vector, nonnegative off-diagonal entries; radical theorem additionally requires connected support graph. |
| Numerical-type strict inequality | `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/IntersectionForm.lean`:163 | Strict negativity for nonzero vectors supported on a proper subset; geometric hypotheses still must be supplied here. |

A scratch copy with `#check @name` for all ten declarations elaborated. Each predicate retains its proper structure morphism; the relative finiteness theorem retains `IsNoetherian S`; torsion retains prime p and algebraicity over ZMod p; inseparable descent retains the over-base equation and the marked pullback square; lifting retains properness, flatness and adic completeness. No section binder disappeared. No package declaration was changed.

The required `lake env lean` invocation from the content checkout completed successfully. Its only diagnostics were five `declaration uses sorry` warnings, at Suggested.lean:86,97,112,134,158. Both TauCeti module object files were already available; no build was needed. A separate scratch copy used `first | rfl | simp | infer_instance | trivial` at each of the five admissions. No admission closed; the elaborator reported an unsolved goal for each. Searches by the actual objects found no single pinned lemma closing any of these headlines. None is padding, a boundary calculation, a copied Check or a conclusion hidden in a hypothesis. All five helper definitions have real bodies and are used in headlines.

### Ownership, suppliers and order

The main-branch shape was compared with `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, `TauCetiRoadmap/StableReduction/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md`. The package has the prescribed heading order, six layers each with Examples and Dependencies, and actual APIs and at least three concrete definition Checks after R02's deletions. No route-specific prime restriction, computational algorithm, copied source paragraph, sorry'd data, `set_option`, `lemma` declaration or untrusted instruction was found in the package.

The following current citations were resolved, with their content read rather than inferred from their names. The open-head tool adds one header line; numbers here refer to the roadmap files, excluding that header.

| Supplier | Resolved sections and representative file lines | Consumed contract and comparison |
|---|---|---|
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`:848 (§0.9),938 (§0.11),1475 (§0.23); 2071–2409 (§§1.1–1.11) | Finite-presentation limits, field descent, universal homeomorphisms and spaces. No upper supplier is substituted. |
| Same | :3265,3309,3330,3437,3631,3656,3867,4428 | Sites, Leray, torsors, coherent base change, smooth-group comparison, Kummer, finite **small-étale** pushforward, field and scheme Brauer comparisons. The exactness at :3674 is not fppf exactness. |
| Same | :4789,4876,5448,5487,5528,5613 | Picard classes, norm, Stein, formal existence, modifications and Chow/generic flatness. Norm direction and degree in §2.8 agree with :4878–4888. |
| Same | :6653,6701,7129,7175 | Proper cycles, c₁/projection formula, intersection theory and smooth-projective-surface Num. `c1_degree_curve` is at :6711; `Num.free_finiteRank` at :7206/:7220 exists as a roadmap target, resolving the worker's apparent missing-library-name lead. |
| AlgebraicModuliForArithmeticGeometry, supplied open head | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`:657 (§1.4),685 (§1.5),818 (§1.6),993 (§2.1) | Projective parameter machinery and section-growth `bigLineBundle` at :873. It does not own the arbitrary proper bigness extension or already provide the general proper Hilbert space. |
| Same | :9172 (§7.3),9265 (`picard_infinitesimal_lifting`),9489 (§7.6.1),9541 (§7.6.1a),9620 (§7.9) | Picard stack, actual obstruction group, fppf sheafification, marked rigidification and identity-component criterion. The obstruction is H²(X₀,O)⊗I, exactly as used in §5.3. Layer 3 supplies effective polarized descent. |
| ComplexComparisonPartII, supplied open head | `TauCetiRoadmap/ComplexComparisonPartII/README.md`:1972 (§C3.2d.2),2008 (§C3.2d.4),2044 (§C3.2e),2056/2074 (§§C3.2f.1–2) | Universal-functions relative Picard space and obstruction; projective flat geometrically integral τ-component; full identity-component sheaf. The package's proper arbitrary-field variants have different scope. |
| JacobianChallenge, main | `TauCetiRoadmap/JacobianChallenge/README.md`:111,135,143,218 (Layers A–D) | Degree/divisor comparison, coherent finiteness and field base change, relative cohomology and Picard functor. No new degree or generic Picard functor is planned here. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md`:238 (J-A2),321,354,391,400,468 | Curve degree; nodal graphs; relative Proj; openness of ampleness; contraction descent with universal functions; model intersections. §3.2's curve-testing/nonuniversal variant differs from :400 as claimed. |
| AlgebraicVectorBundles, main | `TauCetiRoadmap/AlgebraicVectorBundles/README.md`:215,228,254,269,290 | L0A–L0C tensor/finite locally free operations and L1A–L1B relative Spec. Affine hull in §2.2 is an application preserving B, not a second relative-Spec construction. |
| AbundanceStatement, another author's new roadmap at its indexed head | `TauCetiRoadmap/AbundanceStatement/README.md`:254,276,300,329 (Layers 4B–5; 4A precedes them) | Characteristic-zero projective numerical spaces, cones, ampleness and semiampleness. This package owns the arbitrary-field proper/relative extension. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`:676,692 | §F.3 finiteness over separably closed fields for finite constructible invertible coefficients. This supplies the H² Kummer bound, including nonreduced proper X. |
| ResolutionOfSingularitiesCharacteristicZero, supplied open head | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md`:1016–1018 | §7.8 `resolution_field`, projective regular resolution, smooth in characteristic zero. The relative positive-characteristic claim only quantifies over existing resolutions and common dominations. |

Ownership searches used `roadmaps grep` on main and the 352 indexed open heads, by numerical triviality/quotients/rank, Picard schemes and τ, contractions, semiampleness, proper Hilbert spaces and AHK rank. The broad search was initially capped; a narrower search with limit 10000 returned all 493 matching lines, which were inspected. A separate exact-name search found no collision for this namespace or any of its five theorem names. The pin-wide search for numerical triviality, contraction, ampleness, section rings and represented Picard carriers found no existing theorem duplicating a kept signature.

The apparent overlaps are distinct objects or already imported special cases: Tau Ceti's `NumericalType.Pic` is the intersection-matrix component group, not Pic(X)/numerical equivalence; GrothendieckEulerForms concerns Euler-form radicals; Néron/relative-Jacobian roadmaps treat curve-model Picard components; the parent and ComplexComparison supply their explicitly delimited variants. `RelativeJacobiansAndIntegralCurveModels` §1.7 (README:340) has a finite-rank Hilbert subfunctor, not the all-dimensional proper Hilbert tangent contract. It is later in ORDER (61 versus 47). WeilConjectures' surface numerical local systems are likewise later (146), and cannot be suppliers of the general object here. No ownership was moved upward or duplicated in Suggested.lean.

The board index was read before making any absence judgment. Five of its twenty package heads exposed both README and Suggested.lean at the specified paths: AnalyticNumberTheory, ArithmeticStatistics, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. Their object/name scans found no overlap. The other fifteen returned HTTP 404 and are listed under Not verifiable; their names were not treated as nonexistent.

All Needs lines were read individually. The apparent forward edge §0.4→§0.5 is only for the closed-point characterization; the subgroup and definition use §0.1, and §0.5 uses only §§0.1/0.3. Similarly §2.7's finite-index API points to §2.10, whose input from §2.7 is only the already defined trivial-action predicate. These do not form target-level cycles. The finite-dimensional topology is now below absolute and relative finiteness. Proof inputs are assigned to local targets, named supplier sections or explicit gaps.

The required dependency command returned:

```text
depcheck: 48 roadmaps, 542 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The supplied resolver's `Num.free_finiteRank` lead was resolved at SchemeAndStackFoundations §5.10, not mistaken for a missing pinned theorem. A fresh resolver run found no unresolved cross-roadmap citations; it reported that its automatic library scan had no configured package directory, so the independent pin searches above, not that portion of its output, establish library-name resolution.

### Declared gaps

All six slugs and needs sentences match between README's named supplier subsections and `packages/AlgebraicModuliForArithmeticGeometryPartII/design/plan.json`. None has supplier `none`. Their outstanding work is not counted as a finding.

| Slug | Supplier/section | Precision and minimality checked |
|---|---|---|
| relative-numerical-component-reduction | AlgebraicModuliForArithmeticGeometry §1.6 | One finite set of points detects the componentwise degree-zero condition for every line bundle. The parent bounded-support statement alone does not say this. |
| proper-bigness-birational-comparison | AlgebraicModuliForArithmeticGeometry §1.6 | Exact section inequality, lower-order bound for n≥1 and compatible top intersection; no later bigness predicate. The proper nonprojective section-growth comparison is absent from the parent's projective API. |
| proper-picard-nonflat-descent | AlgebraicModuliForArithmeticGeometry §7.3 | The specific quasi-affine finite-type representability for surjective proper pullback, with its nilpotent/nonflat descent mechanism. Ordinary fpqc line-bundle descent does not supply it. |
| proper-hilbert-space-tangent | AlgebraicModuliForArithmeticGeometry §2.1 | Separated finitely presented ambient scheme, proper flat finitely presented subschemes, lfp algebraic-space representation and Hom(I,O) tangent. Existing projective Hilbert schemes and finite-rank subfunctors do not cover this domain. |
| relative-exceptional-degree-witnesses | SchemeAndStackFoundations §5.9 | Finite contracted curves detect nonzero rational exceptional combinations for projective regular-to-normal birational maps. Surface negativity alone does not provide the stated relative higher-dimensional extension. |
| projective-nef-big-criterion | SchemeAndStackFoundations §5.3 | Integral projective scheme over any field; explicit curve-degree nonnegativity and top-intersection/section-growth iff. The existing c₁ operations do not themselves assert this theorem. |

The two conclusions in the birational comparison are the explicitly paired growth/intersection comparison requested by the previous repair, not unrelated tasks; all quantifiers needed for the application are specified. Acceptance after R01 is addressed can remain conditional on these six contracts. Since this verdict is needs changes, `conditional_gaps` is not added to review.json.

### Headlines, shape and completeness

The README advertises numerical Néron–Severi and relative finite freeness (§§1.2–1.3); proper Picard representability, finite-type τ and the Brauer obstruction (§§2.1,2.4–2.5); positive-power constancy (§2.10); locally finite-field torsion (§2.12); the semiample contraction dictionary, purely inseparable and constant-Num projective descent (§§3.4,3.6–3.7); ampleness openness (§3.8); the pure-curve graph criterion, negativity, negative-curve descent and fibre graph/residue/label descent (§§4.2,4.5–4.10); complete-DVR lifting, cone identification, nef-big transfer, semiample and vertical descent, and AHK rank comparison (§§5.3–5.7,5.9).

Five of these are present as native Lean signatures. The module docstring names the absent represented Picard, positivity, intersection, algebraic-space, Hilbert, cone and resolution interfaces. Their heavy geometric constructions are appropriately kept in the README. The two R01 omissions are exceptions to the docstring's unstatability assessment: the existing geometric numerical quotient and native base-change maps suffice to express the relevant action without constructing an étale group scheme first.

The Lean file has 173 lines, one `import Mathlib` and two used individual TauCeti imports. Metadata is `topic = "math.AG"`. All package-local backticked declaration names match its ten declarations. The absent local-system carrier does not justify replacing the headline with abstract linear algebra, and the R01 signatures use those geometric objects directly.

## Not verifiable

- Ownership against these fifteen board heads could not be completed: ArithmeticLocallySymmetricSpacesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PELModuliPartII, PadicHodgeTheoryPartII, PadicLocalLanglandsForGL2QpPartII, RealSurfacePeriodIndex, SchemeAndStackFoundationsPartII, ShimuraVarietiesPartII, VStackSheavesAndLisseCategoriesPartII, VectorBundlesAndIsocrystalsPartII. Both requested files returned HTTP 404 at the exact indexed heads and package paths. No absence or duplicate-ownership conclusion is drawn about their unavailable contents.
- Open-roadmap ownership and supplier checks are against the supplied index of 2026-10-25T05:45:13Z; later remote changes were not independently refreshed. Existing main roadmaps were consumed from main, not from revisions in open pull requests.
- Published-version pagination and numbering were not independently checked. The package explicitly cites the legally cached preprint versions, whose locators were checked.
- The six supplier gaps remain promised work. The concrete tests above establish consistency on the listed instances, not completed proofs of those contracts.

No cited source was unreadable, waived or newly requested. No needs-references file or manifest entry was added. The original four package files remain unchanged.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, p. 5: the source says a nonnegative descent exponent suffices; it should be positive, because zero kills every geometric class; affects a stated result.
- **Gap** in SCH23 at proof of Lemma 1.1, p. 5: the source uses the full Picard scheme after extension and asserts higher-direct-image vanishing; it should use the τ-component and Leray injectivity, which suffices; affects the proof.
- **Error** in SCH23 at §1 before Proposition 1.2, p. 6: the source says component maps preserve edges; it should allow an edge to collapse when its endpoints have the same image; affects nothing.
- **Error** in SCH23 at Proposition 1.2, p. 6: the source assumes only dimension one; it should require every component to have dimension one, excluding P¹_ℝ disjoint union Spec ℂ; affects a stated result.
- **Misprint** in SCH23 at proof of Lemma 1.4, p. 8: the source reverses the degree-two Leray edge; it should point from base cohomology of h_*G_m to total-space cohomology; affects nothing.
- **Error** in SCH23 at §2 before Theorem 2.1, p. 8: the source lists only birational and curve-target contractions; it should include the structure contraction to Spec k; affects nothing.
- **Misprint** in SCH23 at §2 and proof of Theorem 2.1, pp. 8–9: the source sometimes denotes the surface by X; it should consistently use S; affects nothing.
- **Gap** in SCH23 at proof of Theorem 2.1, fibre-type case, p. 9: the source infers fixed components from two overlapping negative subcurves; it should separate each distinct pair using negative self-intersection and nonnegative mutual intersection; affects the proof.
- **Gap** in SCH23 at Theorem 2.1(ii), p. 8: the source declares label preservation immediate; it should justify residue-field and multiplicity compatibility, for example by descending geometrically integral component divisors; affects the proof.
- **Misprint** in AHK07 at proof of Lemma 1.6(1), p. 4: the source prescribes n−e+2 additional hyperplane cuts; it should prescribe n−e−2 so the remaining dimension is two; affects the proof.
- **Error** in AHK07 at Lemma 1.6(2), p. 4: the source asserts strictly positive rank without a dimension restriction; it should restrict positivity to positive-dimensional Y, since a point has rank zero; affects a stated result.
- **Misprint** in CT20 at Lemma 2.17, p. 17: the source places the descended divisor on an undefined Y; it should place it on S; affects nothing.
- **Gap** in KEE99 at proof of Lemma 2.16, printed p. 270: the source claims finite-type Picard parameterization for a fixed Hilbert polynomial on arbitrary projective E; it should use finite type of Pic^τ, since opposite multidegrees defeat the assertion; affects the proof.
- **Gap** in KEE99 at proof of Lemma 1.7, printed p. 262: the source applies an ample-plus-effective decomposition to a merely proper scheme; it should first pass to a projective modification and compare bigness; affects the proof.
- **Misprint** in LIP69 at proof of Lemma (14.1), printed p. 224: the source allows any nonunit r; it should require r nonzero as well, so its valuation coefficients are finite; affects nothing.
- **Misprint** in KLE05 at Example 4.14, printed p. 33, line 1564: the source takes the proper image of the bad locus as the desired open neighbourhood; it should take the complement of that image in T; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ac20a1ed573a5b3da6078dc5e1d7bcd11fec099e", "job": "REV-PKG-AlgebraicModuliForArithmeticGeometryPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
