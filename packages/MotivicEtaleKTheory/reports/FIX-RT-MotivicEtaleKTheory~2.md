# Repair report: MotivicEtaleKTheory

The first F01 is from RT-MotivicEtaleKTheory_r2a; the next four findings are from RT-MotivicEtaleKTheory_r2b. There are five findings and no duplicate mathematical claims. The historical verification tables in the reviews are not additional findings.

## F01 (P2) — applied

Review r2a. Unspecified sheafification → degreewise Zariski sheafification, then global sections and Deligne. Updated §3.4's construction, proof route, descent and universal-property APIs, affine-line Check and acceptance docstring. BKK line 4255–4272 and BKK line 4310–4315 specify the topology and order; BKK line 4297–4308 gives the comparison.

## F01 (P2) — applied

Review r2b. A second universal-class construction → operations induced from KTheoryFiniteLocalFields §6.10's classes and projective-bundle/Whitney identities. Updated Scope, supplier contracts, §2.0b, References, source attribution and acceptance docstring. The supplier builds that general construction; WeibelKBook line 27681–27689 and WeibelKBook line 27760–27808 verify its scope. Shared-cycle pullback and comparison remain here.

## F02 (P3) — applied

Review r2b. §2.0a's forward character Check → its support-local example: 1 maps to the supported generator, then 0 after forgetting support. Deleted §2.2's reference to §7.3. Dévissage gives K₀^{0}(𝔸¹)=ℤ; Adams acts by a, and the two-term resolution gives 1−1=0 without the later character.

## F03 (P3) — applied

Review r2b. Printed p.274 → p.275 in README and manifest; Levine Lemma 4.3's p.290 → pp.289–290, with its proof added to the manifest. Replaced universal-character attribution by geometric-cycle-map/isomorphism attribution. Evidence: WeibelKBook line 15965, WeibelKBook line 15979, WeibelKBook line 16041; Levine94 line 1585–1609 and Levine94 line 1210–1214.

## F04 (P3) — not actionable in this package: re-raised disposition requires a human decision

Review r2b re-raises r1b F05, classified as not actionable in packages/MotivicEtaleKTheory/reports/FIX-RT-MotivicEtaleKTheory~1.md. The brief reserves reconsideration to a human. No existence verdict about the alleged board branch follows from absence here. Its stale citations require consumer edits, not a supplier gap. The proposed bullet awaits human disposition.

The reported two-unit expression is mathematically compatible: for a nonzero holomorphic f, dlog(f/|f|)=(df/f−df̄/f̄)/2=i darg f. Thus the reported expression at f=2,g=t is i log 2 darg t, with positive-circle period 2πi log 2. This algebraic check does not certify the unprovided board-branch text or settle the re-raised disposition. No unspecified board head was sought. Ownership against that unprovided open head was not checked.

## Required checks and acceptance signatures

- The prescribed `lake env lean` invocation, from the content checkout with the absolute package file as its argument, completed with exit 0 and empty stdout/stderr. The checked file is packages/MotivicEtaleKTheory/Suggested.lean. It imports only Mathlib, so no Tau Ceti object build was needed. No Lean process remains running.
- The requested mechanical declaration inventory is empty: zero definitions, abbreviations, instances, opaque declarations, axioms, theorems or examples, and zero section variables. Consequently there are no `#check @name` lines or retained binders to compare in a scratch signature file. The acceptance file was elaborated once. Its missing-carrier descriptions now explicitly mention the supplied universal classes and the Zariski-sheafified algebra. No signature was weakened, introduced or deleted.
- The prescribed dependency command completed with exit 0 and this exact output:

```text
depcheck: 30 roadmaps, 272 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- The citation resolver against main edbb842 and the indexed open roadmap heads lists no cross-roadmap citation or Lean name found nowhere. Its pinned-library pass is unavailable, so library declarations were inspected directly at the pins, as recorded below.
- `git diff --check` completed with exit 0 and empty output. The TOML files parse; the source manifest contains 12 distinct lifetime keys. Both existing gap slugs occur in the README and plan. No new gap is needed, and metadata.toml and design/plan.json are unchanged.
- No gate failure was listed in the brief. No commit, push, issue/PR edit or external message was made.

## Sources, supplier citations and ownership

Only existing legal cached source extractions were needed. No new source key or missing-text request was created. Bloch86 and Beilinson85 retain their settled uncertified status, and Levine98 remains waived; no claim of reading those texts is made. Source passages were not copied. WeibelKBook and BKK's existing entries now record the additional precise locators used by these repairs.

| Read evidence | Mathematical content used |
| --- | --- |
| BKK line 4255–4272, Definition 5.24, pp.117–118 | The colimit is a Zariski presheaf, its associated sheaf is Zariski, and the form algebra is its global sections. Analytic form sheaves on a compactification are a different stage of the construction. |
| BKK line 4297–4315, Proposition 5.29 and Definition 5.30, p.119 | Filtered Mayer–Vietoris and acyclicity compare the presheaf colimit with global sections of its sheafification; Deligne is then applied to that algebra. |
| WeibelKBook line 27681–27689, Theorem V.11.11, p.457 | The motivic Chern theory is for smooth quasi-projective varieties over a fixed field, beyond its later field-diagonal use. |
| WeibelKBook line 27746–27808, Lemma V.11.13 and proof of V.11.11, pp.458–459 | The field-diagonal factor is (−1)ⁿ⁻¹(n−1)!; universal classes come from the projective-bundle relation and satisfy the Whitney identity. |
| WeibelKBook line 15965–16041, Exercise IV.1.12(a) | The preceding page ends at 274; the exercise containing the Hopf witness ends at printed 275. |
| Levine94 line 1585–1609, Lemma 4.3, pp.289–290 | The lemma begins on 289; its proof uses rational-point specialization after reduction to an infinite field. |
| Levine94 line 749–778 and Levine94 line 1197–1269, §§2–3 | The geometric map precedes its isomorphism theorem. This supports the corrected attribution, not attribution of universal-character identification to Levine. |
| BF line 961–997, §3.2, pp.21–22 | Over ℂ, the flat-face nerve and moving/specialization realize universal classes on cycle complexes; the arbitrary-field Bloch reference remains uncertified. |
| MVW line 1054–1072, MVW line 1204–1216 and MVW line 5827–5842 | Functorial Tate sheaves, the units normalization, and smooth perfect-field cycle comparison retain the finite-field route without resolution. |
| BKK line 4060–4180, Propositions 5.12 and 5.15, pp.112–115 | The small-model contraction, degree cases of the product, and associator normalization used in the recomputations below. |

The two main-roadmap shape examples read were TauCetiRoadmap/DifferentialGeometry/README.md and TauCetiRoadmap/ComplexKahlerGeometry/README.md. The target's established seven layers were kept. Each cited supplier was resolved against main, or against its indexed new-roadmap head where absent from main; a revision of a main roadmap was not substituted as a supplier.

| Supplier citation | Contract checked and retained |
| --- | --- |
| GeneralAlgebraicKTheory §§3.12,4.6,4.8,4.14,6.3,7.4–7.7,8.12–8.13 | Plus/Q, resolution, dévissage, localization, tensor coherence and transfer; right-linear boundary sends a uniformizer to +1, with last-slot factor (−1)ⁿ⁻¹. |
| SchemeKTheoryOperations §§2.1–2.6,3.1–3.6,4.3,6.1,6.7–6.9,7.1–7.3 | Perfect/supported K and its pointed models; regular Noetherian finite-dimensional ample-family scope for Adams weights; several-variable uniqueness in §6.9; ordinary character and leading structure-sheaf class in §7.2. |
| KTheoryFiniteLocalFields §3.0a and §6.10 | Shared integral cycles, arbitrary-field moving/localization, transfers, derived coefficients, diagonal sign and motivic-to-K tower. Section 6.10 explicitly owns the integral motivic projective-bundle/splitting construction cited as V.11.11–11.14, not merely a field-valued formula. |
| MotivesAndAlgebraicCycles §§4.4,4.7–4.8,4.8a,4.14,4.17–4.18 | Tate complexes, shared cycles, relative-cycle specialization, transfer adapters and smooth perfect-field comparison. Resolution is needed for its separately stated representability/singular comparison, not the §4.17 finite-field input. |
| SchemeAndStackFoundations §§2.1–2.2,4.12,4.17,5.1–5.8 | Cohomology, domination, SNC predicates and ordinary cycle/intersection/Chern theory; higher universal operations are not assigned to its ordinary Chern API. |
| ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6,6.1–6.4 | Resolution and principalization preserve the given smooth open. Projective SNC compactification requires quasi-projectivity; the proper separated case instead uses Nagata before resolution. |
| EtaleCohomologyFoundations §§G.1–G.3 | Dense compactifications, existence, proper common refinements and coherent comparison are in its geometric prefix; no coefficient theory is used. |
| ComplexComparisonPartII §§C−1.1,C−1.4,C5.1,C5.3–C5.6,C6.0 | Analytification, properPureHodge including nonprojective schemes, relativeHodgeBundles, currents and stratification. regularSingularDeRhamComparison allows the trivial extension with residue 0; mixed-Hodge refinements remain §3.2 here. |
| EnhancedDerivedSheaves §§0.1–0.4,E0.6,E1.4,E2.6 | Enhanced sheaf/module complexes, replacements, derived tensor, coherent restriction diagrams and descent, including the point site. |
| DifferentialGeometry Layers 0–1,5–9; ComplexKahlerGeometry K1–K2; ComplexManifolds Milestones 1–2 | Native forms, integration/de Rham, type and Dolbeault calculus and shared complex orientation, with finite-dimensional Hausdorff/countability hypotheses where used. Whitney extension remains the explicit gap. |
| AlgebraicTopology Stages 2–3, Stage 6 items 1–4, Stage 8 item 2 | Relative theory, products and local duality; simplicial-group Kan and the abelian Moore/homotopy comparison, including components. |
| Completed/HodgeStructures | Linear Hodge data, with the actual pinned carriers and strictness checked below; geometric logarithmic forms are not supplied by linear data. |

Ownership searches used `roadmaps grep` and `roadmaps show`, plus object searches of main, the pins, this board's packages and all 29 sibling folders explicitly provided in the brief. Objects searched included universal motivic Chern classes, supported multi-relative K-theory, logarithmic Dolbeault and Deligne complexes, semipurity and closed-jet extension. The meaningful new ownership correction is §6.10's universal-class construction. No new carrier is assigned to a later supplier and no new fully qualified Lean name is introduced.

The earlier external dispositions for BorelRegulators §6.0a, ColemanIntegration §L3.Fa.2 and Polylogarithms §5.2 are not re-decided. Their relevant texts were located at their supplied/indexed heads; their general Deligne, cube and auxiliary constructions remain imports from this package under those dispositions. ZagierConjecturePolylogarithms M.8 and the zero-function logarithmic case of MixedHodgeModulesAndIrregularHodgeTheory remain design consumers, not suppliers. The unprovided KatoEulerSystems board branch is the explicit limit of the ownership check described under F04.

The slugs smooth-whitney-extension and flat-ideal-regular-situation still name DifferentialGeometry, Part II: Whitney jets and flat functions in both Exact supplier contracts and the top-level gaps list. A consumer's stale citation is not an input to this package, so registering it as a supplier gap would reverse supply direction.

## Pinned-library and headline audit

The content manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The declaration bodies and hypotheses at the following repository-relative files were read directly.

| Declaration | Pinned file/line and scope |
| --- | --- |
| AlgebraicGeometry.AlgebraicCycle; AlgebraicGeometry.AlgebraicCycle.map | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,55,69. Native locally finitely supported point coefficients, with no face-admissibility or dimension predicate. Pushforward tests dimension weights and uses residue degrees with quasi-compactness; properness is an extra higher-Chow hypothesis. |
| AlgebraicGeometry.Scheme; ModuleCat | Mathlib/AlgebraicGeometry/Scheme.lean:40; Mathlib/Algebra/Category/ModuleCat/Basic.lean:56. Scheme/module carriers do not include higher-cycle or scheme K constructions. |
| HomologicalComplex; HomologicalComplex.d_comp_d | Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72. Differential and its actual square-zero condition. |
| DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:67,87,90. Root-level localization of integer cochain complexes, not a coherent-diagram enhancement. |
| CochainComplex.mappingCone; its inl_v_d and inr_f_d | Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269. Source-shift-first cone; the pair fiber is obtained by shifting −1 and negating the second coordinate. |
| CategoryTheory.Abelian.DoldKan.equivalence | Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167. Abelian simplicial objects versus natural chain complexes; no claim about nonabelian components. |
| TauCeti.gradedCochainComplex | TauCeti/Algebra/Homology/GradedCochainComplex.lean:59. Graded submodules with a degree-one map and square-zero proof, not a geometric Deligne model. |
| TauCeti.Hodge.HodgeStructureOn; HodgeStructureOn.IsMorphism | TauCeti/Geometry/Hodge/Structure.lean:62; Morphism.lean:69. Opposed linear filtrations and conjugation-preserving linear maps. |
| TauCeti.Hodge.tate; tate_F; tate_piece | TauCeti/Geometry/Hodge/Tate/Basic.lean:91,100,111. Type (−p,−p) with the abstract lattice; geometric (2πi)ᵖ remains marked separately. |
| TauCeti.Hodge.MixedHodgeStructure; Hom.range_inf_F_eq_map_F | TauCeti/Geometry/Hodge/Mixed/Basic.lean:72; Mixed/Strictness.lean:110. Rational/complex models and strictness range(f)∩Fᵖ=f(Fᵖ) for actual Hodge morphisms. |

Object searches found no face-admissible higher Chow, scheme higher K/supported cube or real Dolbeault/Deligne carriers at these pins. Thus the docstring's headlines (§§1.3–1.4,2.0a–2.4,3.2–3.4,4.1–4.2,5.2,5.4,6.1–6.3,7.1–7.3) still cannot be stated using a few simple definitions. Native complexes, ordinary cycles and linear filtrations are insufficient substitutes. No scalar identity or Check was promoted into acceptance padding.

## Adversarial mathematics record

Each row identifies a target, API assertion, definition or convention. API numbers mean the bullets in their README order. Values are recomputed on actual objects; these tests do not prove the general theorem. P denotes a point, h the hyperplane class, and φ(t)=exp(−1/t²) extended by zero at 0. Empty objects, arbitrary coefficients, p=2,3 and imperfect fields are included where those inputs belong to the statement's domain.

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Component and universe convention | P⊔ℙ¹; ∅ | CH⁰=ℤ²; CH¹=0⊕ℤ; empty groups 0; two component inclusions retain two coordinates | Consistent; no edit |
| Motivic indexing | (p,a)=(0,1),(1,1),(1,2) | 2p−a=−1,1,0, giving 0,CH¹(X,1),CH¹(X,0) | Integer grading retained |
| Derived coefficients | ℤ/2⊗ᴸℤ/2; zero ring | H⁻¹=ℤ/2=H⁰; ordinary tensor misses H⁻¹; zero coefficients give 0 | Consistent; no edit |
| Cube/simplex differential | Γ_t; oriented simplex | ∂□Γ_t=[0], δΓ_t=−[0]; simplex [1]−[0] | Consistent; no edit |
| J and mixed signs | n=0,1,2; (1,1) | J=1,−1,1; J₂=J₁²=1; cross coefficients −1,+1 sum to 0 | Consistent over ℤ, including characteristic 2 bases |
| Shift and cone convention | f:0→ℝ[0] | fib(f)¹=ℝ, all other terms 0; d² second coordinate fda−df a=0 | Consistent; no edit |
| Localization orientations | Γ_t; ordered {2,t} | Raw unit boundary −[0], adapter +[0]; right-linear symbol boundary −[2], last-slot adapter +[2] | All signs retained |
| Tate marking and point quotient | p=−1,0,1; 2,i | Tate factors (2πi)⁻¹,1,2πi are nonzero; Re(log 2)=log 2, Re(log i)=0 | Consistent; no edit |
| Critical differential | x=z z̄ | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄ | Consistent; no edit |
| Complex orientation | Positive circle; ordered residues | ∮dz/z=2πi; two-residue +1, swapped −1; normalized c₁O(1) integral 1 | Consistent; no edit |
| Totalized product convention | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1 | Consistent; no edit |
| Whitney extension gap | Taylor coefficients 1,1,2; zero jet | Derivatives 1,1,4; zero and φ have the same zero jet, but values 0,e⁻¹ at 1 | Existence, not uniqueness, retained |
| Relative Borel clause | (m!)²sin y at m=2,y=π/2; A=∅ or U | Prescribed derivative 4; empty set imposes no conditions; on U extension equals the given smooth function | Parameter hypothesis retained |
| Flat-ideal gap | A=∅,B=U; A=B=U; axes | C∞=C∞+0; 0=0+0; φ(x)+φ(y) at (0,1) is e⁻¹, outside the intersection of the ideals | Sum and real-analytic hypotheses retained |
| §1.1 normalized cycles | P,p=0,n=0,1,2; double point | Groups ℤ,0,0; reduced coefficient 1, length-two cycle coefficient 2 | Consistent; no edit |
| §1.1 API 1, normalization | P,p=0 | Inclusion then quotient is 1↦1 at n=0 and 0↦0 at n=1; raw n=1 group is ℤ | Consistent; no edit |
| §1.1 API 2, maps | ℙ¹→P; degree-two field extension | Dimension-drop pushforward 0; transfer after flat pullback sends 1↦2 | Dimension shift retained |
| §1.1 API 3, orientation | Γ_t; concatenated two 1-cubes | δJ₁Γ_t=+[0]=J₀∂□Γ_t; J₂=1=(−1)(−1) | Consistent; no edit |
| §1.1 API 4, coefficients | Reduced/double point; Γ_t | Native coefficients 1≠2; normalized Γ_t has infinity coefficient 0, zero-face coefficient 1 | Native carrier retained |
| §1.2 mixed definition | Total N=0,2; bidegree (1,1) | Diagonals have 1,3 summands; d² cross coefficient −1+1=0 | Consistent; no edit |
| §1.2 API 1, axes | Degree-zero [V] | Both inclusions send coefficient 1 to 1 | Consistent; no edit |
| §1.2 API 2, total maps | (1,1) component | Two mixed differential composites have coefficients −1,+1, not +1,+1 | Consistent; no edit |
| §1.2 API 3, J | (1,0),(0,1),(1,1) | Multipliers −1,+1,−1; simplex axis is unchanged | Consistent; no edit |
| §1.3 integral comparison | P,p=0; empty/full support; ℤ/2 | H₀=ℤ↔ℤ via 1↦1, positive H=0; fibers 0/C; coefficient Tor₁ and tensor both ℤ/2 | Consistent; no edit |
| §1.4 shared operations | 𝔽₂(t)/𝔽₂(t²); square-zero point; odd degrees | Push-pull 1↦2 on both models; cycle group stays ℤ; exchange sign −1 | General field and integral scope retained |
| §2.0a cube carrier | n=0,1,2; empty/full support | n=0 gives 0 or K₀(P)=ℤ; n=1 gives π₀=K₁(k); n=2 gives K₂(k) | Consistent; no edit |
| §2.0a integral Adams | Spec ℚ, ψ² | ψ²1=1 and ψ²[−1]=0, whereas stable η·1=[−1]≠0; rationally [−1]=0 | Pointed-space scope retained |
| §2.0a generalized weights | ℙ²,h=1−O(−1) | ψ²h=2h−h²; ψ²h²=4h²; ψ²(2h+h²)=2(2h+h²); eigenlattice index 2 | Rational splitting retained |
| §2.0a relative-cycle definition | □ with z=t/(t−1); W on a face | z+(1−z)=1; W={z=0} has ambient codimension 1 and face codimension 0 | Improper incidence excluded |
| §2.0a support-local isomorphism | V=𝔸¹_k,W={0},D empty,c=1 | Raw 1↦[O₀] of supported coefficient 1; ψᵃ[O₀]=a[O₀]; forgetting support gives 1−1=0 | New Check uses only §2.0a inputs |
| §2.0a split/moving theorem | Empty D; split one-cube | No face condition when D=∅; each one-face chart retracts constantly with rank 1↦1 | Both splitting hypotheses retained |
| §2.0a API 1, support map | Spec L,c=0; support enlargement | 1↦[L]=1; including one point in two-point support sends 1↦(1,0) | Consistent; no edit |
| §2.0a API 2, support/degree zero | S=∅, S=X, n=0 | Groups 0,K₀(X); zero map into full support sends 0↦0 | Consistent; no edit |
| §2.0a API 3, pairing | Units over ℤ_(2),ℤ_(3); ℤ[i]⊗ℤℤ[i] | ψ²([u][v])=4[u][v]=(2[u])(2[v]); singular tensor product has local dimension 1, cotangent dimension 2 | Common-base regular domain retained |
| §2.0a API 4, ordered relativity | Ranks (1,0),(0,1),(1,1); two loops | Difference values +1,−1,0; loop swap −1; ψ² on unit/symbol has factors 2,4 | Consistent; no edit |
| §2.0a DVR and imperfect-field Checks | ℤ_p,p=2,3; L=𝔽_ℓ(t)[s]/(s^ℓ−t),ℓ=2,3 | Full one-cube π₀=ℤ_p×; L has dimension/embedding dimension 0 but Ω¹_L/k=L ds; rank map 1↦1 | All primes and regular non-smooth case retained |
| §2.0b induced Chern operations | Zero class; unit 2; 𝔾_m/𝔽₂ | c₀,₀(0)=1, positive c(0)=0, ch(0)=0; c₁,₁[2] has valuation 1; c₁,₁[t]=[t] of valuation 1 | Universal classes imported; operations on shared cycles retained |
| §2.0b two pullback routes | Infinite perfect ℚ; finite 𝔽₂ | Both ℚ routes give c₁[2]=[2]; specialization open over 𝔽₂ has 0 points, while Tate pullback retains [t] | Full arbitrary-field coverage retained |
| §2.0b API 1, inherited identities | O(1)⊕1; O(1)⊕O(−1) on ℙ² | c=1+h and (1+h)(1−h)=1−h²; individual line c₂ values 0 | Imported Whitney/stabilization, no duplicate construction |
| §2.0b API 2, diagonal | Milnor degrees 1,2,3 | Signed factorials 1,−1,2; multiplied by 1,−1,1/2 give 1,1,1 | Restriction is by construction |
| §2.0b API 3, Newton/space character | p=1,2,3; O(1) on ℙ² | Higher coefficients 1,−1,1/2; ch₂=h²/2≠c₂=0; πₙ of target is H²ᵖ⁻ⁿ | Rational denominators nonzero |
| §2.1 geometric map | P rank 2; h on ℙ¹; unit 2 | 2↦2; h↦1−O(−1) with χ=1; unit 2 has valuation 1 | Consistent; no edit |
| §2.1 API 1, naturality | Identity; P→ℙ¹ | h↦h for identity; pullback h=0, and rank of 1−O(−1) is 0 | Smooth/flat scope retained |
| §2.2 weight isomorphism | P; ℙ²; unit 2 | Weight eigenvalues 1,2,4 with differences −1,−3,−2; ch₂O(1)=h²/2; ch[2]=[2] | No integral character inferred |
| §2.2 API 1, universal identification | O_point on ℙ¹; 2; ordered {2,t} | Both maps give h, [2], and last-slot residue [2] of valuation 1 | Identification uses all degrees; forward regulator sentence deleted |
| §2.2 disconnected Check | P⊔P,x=([k²],[k]) | ch₀(x)=(2,1)≠(1,1)=ch₀(O_X), not scalar 3 | Consistent; no edit |
| §2.3 supported comparison definition | ∅/full support; inseparable field L | 0↔0; full rank ℚ↔ℚ sends 1↦1; L⊗ₖL=L[ε]/(ε^ℓ), Ω¹_L/k≠0 | Regular arbitrary-field scope retained |
| §2.3 API 1, pair maps | Degree-two extension; {0}⊂{0,1} | Push-pull factor 2; support map 1↦(1,0), identity 1↦1 | Consistent; no edit |
| §2.3 API 2, connecting maps | t; ordered {2,t} | ch_Z B[t]=+1=−δ_raw[t]; B{2,t}=−[2], last-slot adapter +[2] | Both orientations retained |
| §2.3 singular-support Check | Z=V(xy)⊂𝔸² | Two leading supported coefficients (1,1), rather than one regular-point rank | No unsupported dévissage to K(Z) |
| §2.4 product/leading theorem | Ranks 2,3; origin in 𝔸¹; ξ on ℙ¹ | ch₀ product 6=2·3; affine leading value 0=0; ch(ξ²)=0=h² | Leading class may vanish |
| §2.4 higher-Chern coefficient | p=1,2,3 | ch/c factors 1,−1,1/2; ch₂,₂=−c₂,₂ | Consistent; no edit |
| §3.1 logarithmic image algebra | Punctured disk; empty boundary; \|z\|⁻² | dlog\|z\|²=dz/z+dz̄/z̄; D=∅ gives ordinary smooth forms; quadratic pole is excluded | Consistent; no edit |
| §3.1 API 1, operators | log\|z\|²; z z̄ | ∂∂̄log\|z\|²=0 off 0; ∂∂̄(z z̄)=dz∧dz̄ and ∂̄∂ gives its negative | Anticommutation retained |
| §3.1 API 2, pullback | z=e u, u a holomorphic unit | log\|z\|²=log\|e\|²+log\|u\|²; dlog z=dlog e+dlog u | Algebraic pair-morphism domain retained |
| §3.1 API 3, injection/unit | 1; empty W; boundary-free W | Restriction sends 1 to 1 and d1=0; empty forms 0; logarithmic algebra equals smooth forms for D=∅ | Consistent; no edit |
| §3.2 filtered comparison | 𝔾_m; P; boundary blowup of torus | dlog in complex W₁, cohomology weight 1+1=2; point weight 0; torus Betti dimensions 1,2,1 unchanged | Shifted weight retained |
| §3.2 API 1, division estimate | f=e^(−1/\|z\|²), divide by z²; f=1 | All zero jets at 0; value e⁻¹ at 1; 1/z diverges | Flatness necessary |
| §3.2 API 2, log/combined estimate | f=e^(−1/\|zw\|²), divide by zw̄ and multiply log\|z\|² | Zero jets on axes; value −e^(−1/4)log4/2 at (−2,1); exponents 0 recover f | Fixed finite exponents retained |
| §3.3 cone/small model | P at twists −1,0,1; A=0 | H⁰=ℝ(−1),ℝ,0; H¹=0,0,ℝ; zero model all terms 0 | Consistent; no edit |
| §3.3 API 1, contraction/shift | Point weight 1, log2+iθ; shift [1] | Projection/inclusion retains log2, drops iθ; shifted point is degree −1, which has no one-dimensional real Dolbeault type | Cochain shift only |
| §3.3 API 2, exactness | Type-(0,0) sequence 0→ℝ→ℝ²→ℝ→0 | Weight-one D shifts the same exact sequence to degree 1; dimensions 1,2,1 with kernel=image | Type-compatible maps required |
| §3.3 API 3, critical degree | p=1,x=\|z\|² | Ordinary degree 0→2 and Deligne degree 1→2; differential −2dz∧dz̄ | Consistent; no edit |
| §3.3 cone-arrow witness | Point z=3+4i,p=1,2,3 | Quotient coordinates 3,4i,3; negated representative −3,−4i,−3, transported coordinates again 3,4i,3 | Arrow transport retains normalization |
| §3.4 Zariski definition/comparison | X=𝔸¹,p=1; Re z | Correct H¹=ℂ/(2πiℝ)=ℝ constants; Re z has d_D=0 and values 0,1 but order-one growth at infinity; D⁰=0 | Zariski site specified; analytic sheafification excludes neither this function nor its extra class |
| §3.4 API 1, refinements | Blowup x=e,y=eu; point (x,y)=(2,3) | Pullback log\|x\|=log\|e\|=log2; wrong swap gives log3; same on a further refinement | Consistent after site repair |
| §3.4 API 2, pullback | x↦x² on 𝔾_m | log\|x²\|=2log\|x\|; dlog period becomes 4πi | Consistent after site repair |
| §3.4 API 3, Zariski descent | ∅; two affine charts on ℙ¹ | Empty complex 0; on intersection 𝔾_m, H¹(−,ℂ)=ℂ supplies H²(ℙ¹,ℂ)=ℂ through Mayer–Vietoris | Topology explicit; no analytic descent claimed |
| §3.4 API 4, sheaf/skeleton | Duplicate a compactification object; P⊔ℙ¹ | Identity induces 1↦1; duplication changes no colimit; H⁰_D(ℝ(0))=ℝ² | Degreewise Zariski sheafification explicit |
| §4.1 full product | log2,log\|t\|; weight-zero constants 2,3 | Product i log2 darg t; reverse negative; high/weight-zero product 2·3=6 | Piecewise product retained |
| §4.1 API 1, differential/symmetry | x=\|z\|²,y=1 at weight 1 | x•y=−z̄dz+z dz̄; d_D(x•y)=−2dz∧dz̄=d_Dx•1; swap negates | Leibniz/critical sign consistent |
| §4.1 API 2, units/naturality | ℝ[t]; tℝ[t]; P | 1•t=t; for e∈tℝ[t], coefficient of t in et is 0 rather than 1; log2•log3=0 on P | No unital conclusion for a nonunital algebra |
| §4.1 API 3, odd critical formula | f=2,g=t; x=\|z\|²,y=1 | Four terms sum to i log2 darg t and −z̄dz+z dz̄ respectively | Formula applies to nonclosed inputs |
| §4.2 associator | Critical-even forms; Re z,2,3; t,t,t | Bracketings equal wedge³,6 Re z,t³; h_a=0 on critical-even triples even when d Re z≠0 | Degree −1 homotopy retained |
| §4.2 refinement/product witness | Ordered torus before/after blowup | Period (2πi)² on both; exchanging circles gives −(2πi)² on both | Consistent after site repair |
| §5.1 support fiber definition | ∅,X; pair differential | fib(id)=0; fib(D→0)=D; d² second coordinate res(dω)−d(resω−dg)=0 | Consistent after site repair |
| §5.1 API 1, support maps | {0}⊂{0,1} | r↦(r,0); direct and iterated inclusions both send 1 to (1,0) | Direction retained |
| §5.1 API 2, raw connecting | 0→ℝ[0]; open unit t | Fiber ℝ in degree +1; raw class (0,log\|t\|) has coefficient −1 | Shift/sign retained |
| §5.1 API 3, products | V(x),V(y); V(x),V(x−1) in 𝔸² | Transverse product coefficient +1 at origin; disjoint support product 0 | Intersection support retained |
| §5.1 API 4, pair extensionality | (0,0); (ω,g) with resω=dg | d(0,0)=0; cocycle differential (0,0); changing g by g′ changes second coordinate by g′ | Pair condition determines cocycles |
| §5.2 semipurity theorem | Axes; cusp; origin in 𝔸²,p=1,2 | Degree-two groups ℝ²,ℝ; origin degree 2 weight1 is 0, degree4 weight2 is ℝ; lower groups 0 | Codimension bound retained |
| §5.2 API 1, Betti calculation | Normal complex p-disk,p=0,1,2 | Support class in degree 0,2,4 with coefficient +1 and type (p,p); lower degrees 0 | Complex orientation retained |
| §5.2 API 2, multiplicities | Reduced cusp; 2V(x); axes | Coefficients 1,2,(1,1); zero coordinates give zero class, and nonzero generic coefficient survives | Singular/nonreduced support retained |
| §5.2 API 3, Green criterion | f=t,t⁻¹,1; d=p=1 | −log\|f\| gives supported coefficients +1,−1,0; current factor (2πi)⁻¹ for forms and 1 for points | Sign agrees with raw boundary adapter |
| §5.2 negative control | P, full support, p=1 | H¹_D(P,ℝ(1))=ℝ≠0, while codim(full)=0<1 | Codimension hypothesis necessary |
| §5.3 auxiliary definitions | (r,n)=(2p,1),(2p−1,1); P,p=0 | Total degrees 2p−1,2p−2; face signs +1,−1; normalized point support complex ℝ,0,0 | Consistent after site repair |
| §5.3 API 1, cycle classes | Origin; double origin | Coefficients 1↦1 and 2↦2 | Multiplicity-bearing map retained |
| §5.3 API 2, top projection | r=2p,n=1 | Target Hₚ[−2p] lies in degree 2p−1, equal to source total degree | Shift retained |
| §5.3 API 3, forget/constant map | P,p=0; empty support | Constant 1 maps to 1 in cube degree 0; empty-support 0 maps to 0 | Consistent; no edit |
| §5.3 API 4, support colimit | Support {0} then {0,1}; empty support | Representative 1 becomes (1,0) in the union; empty representative remains 0 | Finite-union equivalence retained |
| §5.3 good truncation | ω=Re(z₁)dz₂∧dz̄₂ at p=1 | dω(∂ₓ₁,∂ₓ₂,∂ᵧ₂)=−2i, so ω is excluded from the good top term | Brutal truncation still excluded |
| §5.4 three comparisons | Origin and double; P→𝔸¹,p=0,1 | Cycle/support values 1,2; H⁰ weight0 and H¹ weight1 both ℝ→ℝ by identity; normalized higher-cube cohomology 0 | Affine contraction recomputed after site repair |
| §6.1 regulator roof | P,p=n=0; ∅; O(±1) | m↦m; zero/empty↦0; normalized Chern integrals ±1; shift 2p has differential sign +1 | All roof arrows retain their domains |
| §6.1 API 1, lifts | Origin class and its double | Forget-support lifts give r_D values of multiplicity 1 and 2; boundary changes yield class difference 0 | Specified roof retained |
| §6.1 API 2, integral source | Units −1,i,2 at P | Torsion units give log1=0; 2 gives log2≠0 | Integral source retained |
| §6.1 API 3, degree zero | O(a) on ℙ¹,a=−1,0,1 | Cycle-class integrals −1,0,1 agree with c₁ | Normalization retained |
| §6.2 coherent supported realization | Z=∅ or X; identity restriction | Zero fiber map or absolute r_D; identity homotopy h=0 | Consistent after site repair |
| §6.2 API 1, pair homotopy | A=A′=ℤ[0],B=0,B′=(ℤ→ℤ),r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong (1,−1) gives (0,2) | Plus h sign retained |
| §6.2 boundary Check | (𝔸¹,{0}), unit t | r_D[t]=log\|t\|; raw boundary −1, negative Green representative +1 | Consistent after site repair |
| §6.3 pullback/model theorem | P→ℙ¹; compatible embeddings of ℚ; cube n=1,2 | Both Chern pullbacks 0; both values on 2 are log2; J signs −1,+1 applied to both source and target | Consistent; no edit |
| §7.1 independent character | Unit 2eⁱθ; O(a); zero class | Real logarithm log2; degree-zero character 1+a h_D; zero class 0, trivial line 1 | Independent normalization retained |
| §7.1 API 1, additivity/products | Unit products 2·3; ranks 2,3 | log6=log2+log3; character rank product 6=2·3 | Consistent; no edit |
| §7.1 API 2, classes/branches | O(1); log2+2πim | c₁ normalized integral 1; real part always log2 | Branch ambiguity quotiented correctly |
| §7.1 projection/component Checks | z=3+4i,p=1,2,3; constant ℤ,S₃ | πₚ₋₁(z)=3,4i,3 and πₚ₋₁(ℝ(p))=0; π₀=ℤ or S₃ respectively | Abelian Moore scope retained |
| §7.2 Beilinson identification | Rank2; O_point; units 2,−1; full/empty support | Both sides 2,h_D,log2,0; supported restrictions absolute/0; raw divisor boundary −1 | Consistent after imported-class repair |
| §7.3 multiplicativity | Units 2,t; ruling divisors; zero factor | Form i log2 darg t, period 2πi log2; ruling intersection degree 1, doubled ruling degree 2; zero factor 0 | Integral Chow source retained |
| §7.4 normalization witnesses | 1,i,1/2,2,3,6; O(a),a=−1,0,1 | Logs 0,0,−log2,log2,log3,log2+log3; Chern integrals −1,0,1; −a log\|t\| has divisor coefficient a | All witnesses agree |

The affected Checks in §2.0b, §§2.2–2.4, §3.4 and all later uses of D_log were recomputed above. In particular, the repaired affine-line group is the same ℝ used by §5.4's affine contraction and the unit logarithm. Replacing it by the analytic smooth-form sheaf would make Re z an additional H¹ class and break those comparisons. On every nonempty Zariski open of 𝔸¹ the point at infinity remains a boundary point; Re z grows like 1/|w| in w=1/z, exceeding every fixed logarithmic power. It therefore cannot enter by a Zariski covering.

The new support-local Check avoids a hidden character input: dévissage gives the supported generator, the trivial conormal gives ψᵃ=a on it, and its two-term ambient resolution makes the forget-support value 0. The separate leading-character Check in §2.4 remains 0=0 on 𝔸¹ and h=h on ℙ¹. The imported-class change preserves all diagonal factors and leaves the inverse-map identification theorem in §2.2 as a substantive target.

## Maintainer consequences

Changed only packages/MotivicEtaleKTheory/README.md, packages/MotivicEtaleKTheory/Suggested.lean, packages/MotivicEtaleKTheory/sources.toml and this report. No target number or Lean declaration name changed. KTheoryFiniteLocalFields §6.10 is now explicitly consumed for its universal-class construction; this uses an existing earlier supplier rather than requesting new supplier work. Existing Whitney gaps remain unchanged.

The re-raised KatoEulerSystems disposition requires a human decision. No external correction is claimed completed, and no claim is made that the alleged board-branch README does not exist. Previously recorded consumer ownership/citation corrections remain external work. This report is evidence for the next independent review, not an acceptance verdict.
