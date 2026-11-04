# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at fa1d0be)

**Verdict:** accepted

One P3 citation note; no P1 or P2 finding. The gate passes. This verdict means ready for a human's final approval, not an AI approval or merge. Source-access limitations are recorded below.

## R01 (P3) — Separate the smooth-category claim from its idempotented-ring citation

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:692–699`, especially “It is not closed under extensions in Rep A G ([Ber87] §1.1, p. 3).”

**Claim:** The cited passage supports the abelian-category construction for arbitrary commutative A and topological G, together with failure of extension closure in the ambient representation category.

**Witness:** Ber87 lines 78–110, §1.1, printed p. 3, discuss nondegenerate modules over idempotented rings. They do not state the arbitrary-topological-group claim or its assertion about extensions inside Rep A G.

**Repair:** Describe the arbitrary-coefficient smooth-category assertion as a direct construction: subobjects and quotients preserve open stabilizers; finite intersections handle finite sums, and every element of a colimit comes from a finite sum. Construct limits by taking smooth vectors. Scope the Ber87 citation to its idempotented-module analogue. Say extension closure fails **in general**, and add the explicit control G=(ℤ₂,+), A=ℚ₂, ρ(t)=[[1,t],[0,1]]. The subline ℚ₂e₁ and quotient are trivial and smooth, while e₂ has stabilizer {0}, which is not open. Thus the corrected claim retains the intended distinction without suggesting failure for discrete G, where every representation is smooth. This is a locator/attribution note, not a false-theorem finding.

## Verified sound

### Previous findings, checked before the full review

All seven previous findings are repaired. The comparison was followed by a fresh read of the whole folder, not just the changed 208 lines.

| Previous finding | Current passage and location | Result and separating test |
|---|---|---|
| R01, failed module build | `Suggested.lean:1`: `module` | Repaired. The supplied targeted-build gate passes; direct elaboration has only the 12 expected admission warnings. |
| R02, unpinned logarithm supplier | `README.md:4471`: “unital, possibly noncommutative ℚ-algebra”; ownership at 84–87 and 526–527 | Repaired. The additional algebraic logarithm is owned here; ReductiveGroups Layer 5P retains matrix/geometric ownership. At J³=0≠J², log(1+J)=J−J²/2, not J. No nonexistent pinned `Nilpotent.Log` module is consumed. |
| R03, missing AIG endpoint | `Suggested.lean:242–254`: `EssentiallyAIG.scalars`; `README.md:3806`: “every coefficient field κ with char(κ) ≠ p” | Repaired. Actual GL_n, n>0, coefficient characteristic and nondegenerate upper-unipotent character hypotheses occur in the signature. A character line has End=κ; two copies have M₂(κ) and fail the socle hypothesis. |
| R04, missing locally compact step | `README.md:589–600`: “translation stabilizer” | Repaired. The compact-clopen-set argument is explicitly owned. For C=ℤ₂ or 2ℤ₂ in noncompact ℚ₂, its translation stabilizer is C. A compact-space theorem is no longer silently applied to ℚ₂. |
| R05, unquoted TeX | `README.md:2638–2643`: the two modulus half-powers are code spans | Repaired. The scanner reports tex=0; at diag(ϖ,1), q=3, the two values remain 1/√3 and √3. |
| R06, anchor residue | `README.md:4430,4459,4468,4516,4545–4546,4594,4622`: ordinary Weil–Deligne headings | Repaired. residue=0; the raw-parameter, logarithm and operations sections remain present. |
| R07, missing presentation inventory | `Suggested.lean:29–32`: “The Iwahori–Matsumoto and Bernstein presentations” | Repaired. The missing convolution algebra, double-coset basis and affine-Weyl data are named. No finite-cardinality stand-in replaces either theorem. |

### Gate, signatures and acceptance statements

The reviewed Git head is exactly fa1d0be1d3ea586f8f5ce782b06f683666fe2c92. The outside-folder diff against origin/main is empty. No worktree source file was changed. The worker's gate reports zero for every rule, including build, source-material, stray-files, outside-folder, imports, sorry-data, set_option, dropped, readme-ids-missing and all text rules, and ends `OK`.

The independently rerun dependency check prints:

```text
depcheck: 205 roadmaps, 1548 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every `Needs` block and supplier contract was read, including the SR.5-to-SR.6 stable-operator edge and the separate placement of SR.2a. The dependencies on later consumers are not imported back into this roadmap. No declared supplier gap is being used as a substitute for an absent citation.

Direct `lake env lean` elaboration of `Suggested.lean` succeeded with 12 `sorry` warnings and no other warning or error. A scratch copy checked all 25 declarations in the supplied signature inventory, plus the point-topology instance: 26 elaborated types inspected. The three suspected binder losses concern the algebraic point carrier, absolute simplicity and relative genericity; their definitions do not require the omitted topological assumptions. Theorems using smoothness, local topology, completeness, characteristic restrictions or nondegenerate characters retain them. Uniform admissibility puts the bound before the representation quantifier and asserts finite generation as well as the numerical bound, so infinite-dimensional finrank=0 is not a loophole.

All 12 admitted headline theorems were tested in a scratch copy with `simp`, `rfl` and `infer_instance`, using `solve` to prevent a partial tactic from counting as success. All 12 remained admitted. Reading the relevant pinned carriers and existing declarations found no single native lemma that supplies one of these theorems under its actual signature. No padding deletion is requested.

The stated headlines are: the Grothendieck property of SmoothRep; GL₂ Whittaker multiplicity one; admissibility of irreducibles; uniform admissibility; finite length; noetherianity; finite generation of Hecke algebras over their center; scalar endomorphisms of essentially AIG objects; scalar endomorphisms of co-Whittaker objects; their arbitrary-module tensor endomorphism comparison; Frobenius semisimplification; and complete-coefficient Grothendieck monodromy. Each has a native statement in `Suggested.lean`.

The other README endpoints—both affine-Hecke presentations, Bernstein decomposition and center formula, Casselman and conditional Langlands classification, second adjointness, classical/derived Satake, integral types/blocks/universal Whittaker and local-Langlands families, finite-wild quotient and excursion results—are identified in the module docstring with their missing construction carriers. No arbitrary `Prop` parameter substitutes for those carriers. The raw Weil–Deligne bundle uses actual representations, an endomorphism and the arithmetic-degree relation; the other retained definitions are native predicates, quotients or point-carrier specializations needed by the 12 statements.

### Pinned libraries and ownership

The pins inspected are Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. These are the manifest's pins, not current upstream APIs. The following 16 groups record concrete declarations or definitions opened during the object audit:

| Pinned location | Content checked and boundary |
|---|---|
| `Mathlib/Topology/Algebra/Nonarchimedean/Basic.lean:41` | `NonarchimedeanGroup` includes the topological-group law and an open-subgroup basis; it does not itself assert local compactness or Hausdorffness. |
| `Mathlib/Topology/Separation/Profinite.lean:76,87` | Compact versus locally compact clopen-neighborhood statements; the latter is the relevant input for the noncompact van Dantzig argument. |
| `Mathlib/Topology/Algebra/OpenSubgroup.lean:603` | The compact ambient-group hypothesis prevents using this alone for additive ℚ₂. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:46,66` | `IsNonarchimedeanLocalField` contains valuative topology, local compactness and nontrivial valuation; the topological division-ring instance is available. |
| `Mathlib/RepresentationTheory/Coinvariants.lean:53,57,79,89,106` | Relation span, quotient, quotient map, its surjectivity and universal lift. Ordinary coinvariants are imported; inverse-character twisting is the added application. |
| `Mathlib/RingTheory/Artinian/Module.lean:287,308` | Fitting decomposition uses Artinian and Noetherian conditions. The roadmap's explicitly stable operator is a different hypothesis, not a duplicate unconditional Fitting theorem. |
| `Mathlib/RingTheory/Nilpotent/Exp.lean:50,53,76,180,185` | Existing nilpotent exponential, finite-sum formula, commuting-addition law, invertibility and functoriality are inputs, not new constructions. |
| `Mathlib/RingTheory/Algebraic/LinearIndependent.lean:28` | The transcendental inverse-family independence input to the cardinality version of Schur's argument. |
| `Mathlib/RingTheory/SimpleModule/Basic.lean:572` | Existing Burnside input; no second ownership of this finite-dimensional algebra theorem. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,80` | Reductivity and its smooth/geometrically-connected/unipotent-radical characterization; smoothness is not inferred from connectedness alone. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:256,343` | Existing discrete continuous representation structure and comparison of continuity conditions. An arbitrary topology on the representation space is not silently substituted for discreteness. |
| `TauCeti/RepresentationTheory/CharacterTwist.lean:86,98,145,180` | Character twist rescales the action by the character; subrepresentation and tensor comparisons are available. Whittaker coinvariants therefore require ψ⁻¹. |
| `TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.lean:73` | The actual inertia tame character has its Tate-twist target and coprimality assumptions; the monodromy theorem uses this carrier. |
| `TauCeti/RingTheory/PowerSeries/Log.lean:48,99` | Logarithmic derivative and truncated-coefficient identity, not a full noncommutative nilpotent-logarithm API. |
| `Mathlib/RingTheory/PowerSeries/Log.lean` | Formal-series logarithm/substitution inputs, distinguished from evaluating a finite noncommutative nilpotent logarithm. |
| `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean` | Actual GL_n upper-unitriangular subgroup used in the Lean Whittaker hypotheses, rather than unconstrained subgroup data. |

Ownership was searched by objects through `roadmaps grep`, the main checkout, the supplied open-head checkouts and the board packages. Searches covered smooth/discrete representations, Hecke and double-coset algebras, parabolic induction, Jacquet modules, derivatives, Satake, raw Weil–Deligne data, nilpotent logarithms and finite-wild cocycles. The roadmap resolver found no unresolved cross-roadmap citation or own Lean name; its explicit warning that it had not searched pinned Lake packages was handled by the direct pin inspection above. The object search found no duplicate fully qualified declaration in the readable sibling material.

Resolved supplier boundaries include the following 11 groups. Locations below are README locations unless specified otherwise; completed roadmaps use their completed location.

| Supplier | Resolution and direction |
|---|---|
| ReductiveGroups | Layer 5P (`TauCetiRoadmap/ReductiveGroups/README.md:464`) owns matrix exp/log and its geometric comparison; Layers 7 and 9 own reductive/root and dual-group infrastructure. This roadmap owns the additional general ℚ-algebra core and smooth-representation applications. |
| ReductiveGroupsPartII | Rational-point topology at 464 and 591, GL comparison at 748, torus valuation at 1815, lattice chains at 3411, parahorics at 3761, Moy–Prasad at 4795, decompositions at 5510, modulus at 6390–6450, dual data at 6705. These supply geometry, not the smooth functors newly built here. |
| ProfiniteCohomology | Layers 0,1,7,10 at 583,630,1168,1549; discrete continuous/cohomological objects remain its objects, compared to the algebraic open-stabilizer presentation here. |
| ProfiniteProPGroups | `TauCetiRoadmap/Completed/ProfiniteProPGroups/README.md:185`, Layer 1, finite-quotient/pro-order infrastructure. |
| RepresentationTheory/InductionRestriction | Existing algebraic induction, coinduction and finite-index formulas; smooth induction from closed subgroups and compact support are additional targets here. |
| ModularForms | Layer 2 at 383: existing double-coset Hecke ring; its comparison with convolution/permutation operators is the new target. |
| DGAInfinity | Layer 0 at 263–315: signed Hom complexes and dg-category foundation; no re-planning of that foundation. |
| DerivedModuleAlgebra | §0.2 at 626–651, especially the derived tensor construction at 633; consumed for derived module operations. |
| ClassFieldTheory | Layer 9 at 1505–1547: nonarchimedean Weil group, inertia and degree, with residue-degree restriction. The characteristic-zero reciprocity clause is not used as an equal-characteristic theorem. |
| LocalFieldsRamification | `TauCetiRoadmap/Completed/LocalFieldsRamification/README.md:34–35,66`, arithmetic Frobenius convention and Layer 4 ramification; the specified tame inertia data preserve that direction. |
| ArithmeticGaloisRepresentations | Main README at 606–645 and 1806–1840 consumes shared raw Weil–Deligne linear algebra for its arithmetic adapter. It does not replace this roadmap's general local representation-theoretic ownership. |

The readable AutomorphicSpectralTheoryPartII head explicitly consumes SR.1–SR.4 (`README.md:11`); its spectral theory is downstream. Archimedean smooth/Banach representation theory and finite-group algebraic induction are not re-planned here. The supplied SmoothBanachRepresentations checkout path was unavailable, so direct open-head inspection of that particular folder could not be certified. Ownership claims above refer only to main and readable supplied heads, not to unseen revisions. Two main-roadmap examples plus the induction/derived supplier roadmaps were read for the required prose/API/Checks shape.

### Seeded source audit

All 41 cited works were submitted to the legal sources service. It returned readable texts for 37 works and no readable full text for the four works listed below. No source passage was copied into the roadmap or report. There is no README locator explicitly flagged “unverified”; the prescribed 15 sample targets were checked, including the special topology control and the printed Satake convention. The following locators refer to the fetched edition's line-numbered extraction; the TV rows use the **published** text, not the differently numbered preprint.

| Sample target | Source and hypothesis check | Outcome |
|---|---|---|
| Check (topology), 649–653 | Direct calculation: topology {∅,H,S₃}, H=⟨(12)⟩, on the permutation module of S₃/H. The basis vector at H has open stabilizer H; its (23)-translate has a conjugate order-two stabilizer not open. | Confirms the need for `IsTopologicalGroup` when taking the invariant smooth-vector submodule. |
| Smooth representations form an abelian category, 692 | Ber87 lines 78–110, §1.1, p.3, is the idempotented-ring analogue. Arbitrary-ring/topological-group closure was checked directly. | Mathematics passes; source attribution is R01. |
| Invariants under compact opens, 736 | Ber92 lines 349–354, Proposition 6(1), p.14: fixed vectors are the normalized idempotent image over ℂ. The union and conjugation argument does not divide and works over A. | Distinction between arbitrary-coefficient exhaustion and averaging is retained. BH06 parallel locator not independently readable. |
| Normalised idempotents, 1162 | Ber92 lines 248–260 and 275–304, pp.11–12: normalized averaging and the Hecke action. The README requires unit volume for its coefficient extension. | C₂ calculation separates the valid projector from the characteristic-two zero denominator. |
| Hecke corners and irreducibles, 1325 | Ber92 lines 549–555, Lemma 7, p.19. Only irreducibles with nonzero e-part enter the correspondence. | Sign representation with zero H-fixed part is excluded; standard S₃ representation survives. |
| Exactness of induction, 1937 | BZ77 lines 188–211, §1.9(a),(e), p.445, gives complex coefficients. The additional ring statements explicitly separate compactly supported finite refinement from smooth induction's compactness/invertible-pro-order hypotheses. | No claim that the complex source already proves the whole ring-valued extension. |
| Center compatibilities, 2817 | BD84 lines 787–802, Theorem 2.13, p.22, identifies the center; BZ77 lines 129–140, §1.6, p.443, supplies product irreducibles. | Product formula follows with the product inertial data. Two-torus center calculation yields ℂ[x±,y±] and xy↦6 at (2,3). |
| Square-integrable/tempered, 2832 | Cas95 lines 1090–1104, Propositions 2.5.3–2.5.4, p.29; formal-degree statement/proof in §5.2, including its square-integrable qualification. Kon03 lines 292–310, p.390, keeps the tempered-support hypotheses. | Unitary central character and compactness modulo center are not dropped. |
| Steinberg, 2957 | Cas95 lines 2737–2739, Theorem 8.1.3, p.70, with preceding Lemmas 8.1.1–8.1.2. | Normalized Jacquet is δ_B^1/2. At q=3 this is 1/√3; the trivial representation gives √3. |
| Source convention, 3186 | TV lines 429–434, §2.9.2, p.187; 1204–1213, formula (7.2.1), p.206; 1250–1257, (7.2.5), p.207; 1343–1355, §7.4(a), p.209. | Published formulas have the sign incompatibilities described in Source issues. The README's correction passes GL₂ and does not silently copy them. |
| Classical Satake, 3207 | TV lines 1230–1257, §7.2, pp.206–207: triangularity/integrality after inverting q, and the displayed raw transform. | Coefficient extension is checked through the orbit basis; no averaging by the Weyl-group order. Characteristic two is allowed when q is a unit. |
| Unitary triangular matrix, 3472 | LTXZZ lines 8857–8866, Proposition B.2.6, printed p.337: Gaussian coefficients at -q and exponent δ(N−δ). | N=2,δ=1 gives S(T₁)=qμ+q−1; N=3 gives q²μ+q−1, with the middle dual eigenvalue included. |
| Projectives from types, 3922 | Hel16 lines 510–572, Lemmas 4.7–4.8 and Proposition 4.9, pp.11–12; 642–658, Proposition 4.16, p.14; 2560–2578, Definition 11.1/Lemma 11.2/Corollary 11.3, p.56. | The source's coefficient/normalization restrictions are not erased: the ℓ=2 unnormalized extension is a separate construction obligation, and the dual type uses the inverse twist. |
| Segments and their two representations, 4401 | AKY lines 271–288, §2.1, p.7; 528–543, Lemma 2.9 and proof, p.14. MS Theorem 9.10 and §8.16 were also compared for modular genericity. | Ascending induction's unique subrepresentation Z and quotient L are not interchanged: length-two GL₂ gives 1 versus St after centering. |
| Raw-parameter operations, 4518 | Del73 lines 605–612, §2.2.4, p.522; 1872–1904, §§8.4.1–8.4.3, pp.568–569. Degree and norm are transported to the stated arithmetic convention. | Dual -Nᵗ, tensor N⊗1+1⊗N, restriction q↦q^f and induced coset factor q^-deg(g) all satisfy the defining relation. The zero-scalar slip in the source proof is not inherited. |

Other source passages inspected for repaired ownership and proof routes include Kramer Theorems 1.41, 1.43 and 1.44 for the locally compact argument; EH §3.1 and Lemmas 3.2.2–3.2.3 for derivatives and AIG scalars; the actual CG18/CG20 preprint numbering for the local block/projector; and DHKM1's torus-isogeny and stable-lattice arguments. Published and preprint versions of the same work were treated as one source identity.

### Computed adversarial pass

The next table has 173 rows, one for every named target/definition in the README. It records finite-instance calculations and negative controls, not claims that examples prove the general theorems. “Pass / —” means agreement with the stated scope and no requested change; source-access limitations still apply. API operations and conventions were tested on the carriers of their defining target. All locations are in `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`. The additional topology sample is calculated in the source table above. Together these cover every sampled target, all 12 Lean headlines and R01.

| Statement and line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| van-dantzig (578) | G=ℚ₂, C=ℤ₂ or 2ℤ₂: translation stabilizer is respectively ℤ₂ or 2ℤ₂; in S₃, C={1,(12),(13)} has stabilizer {1}. ℝ has no compact open subgroup. | Pass / — |
| is-smooth (611) | Discrete C₂: sign line is smooth, every stabilizer open. ℤ₂ acting on ℚ₂² by [[1,t],[0,1]]: e₁ stabilizer G, e₂ stabilizer {0}; only the first is open. | Pass / — |
| smooth-vectors (631) | For that ℤ₂ action, Vˢᵐ=ℚ₂e₁, whereas for the trivial action Vˢᵐ=V; for V=0 both are 0. | Pass / — |
| smooth-rep-category (657) | C₂ over ℚ: Hom(trivial,sign)=0, End(sign)=ℚ; with G discrete the smooth-part counit on either line is identity. | Pass / — |
| smooth-rep-abelian (692) | The ℤ₂ unipotent extension has smooth subline and quotient, but middle smooth part has dimension 1, not 2; kernels/cokernels of maps of trivial lines are the underlying ones. See R01. | Pass; R01 citation repair. |
| smooth-discrete-comparison (709) | A discrete sign line for discrete C₂ has continuous action and open stabilizers; the discrete ℚ₂² unipotent example has e₂ orbit map discontinuous at 0. | Pass / — |
| compact-open-invariants (736) | ℚ₂ additive acting on finitely supported functions on ℚ₂/ℤ₂: each basis vector is ℤ₂-fixed, union of compact-open invariants is all V. For zero V both sides are 0. | Pass / — |
| unit-pro-order (760) | C₂ over ℚ: orders 1,2 are units; over 𝔽₂ order 2 is zero. Pro-3 group over 𝔽₂: every finite quotient has odd order, hence unit image 1. | Pass / — |
| averaging-projector (801) | C₂ sign over ℚ: (1+s)/2 acts as 0; trivial line gives 1. On the regular module its matrix is ½[[1,1],[1,1]], whose square is itself. | Pass / — |
| invariants-exact (827) | C₂ over 𝔽₂ on a length-2 Jordan block: fixed line maps to 0 in the trivial quotient, which has fixed dimension 1; 2 is not invertible. Over ℚ the averaging lift is surjective. | Pass / — |
| admissible (840) | Trivial group: κ is admissible, κ^(ℕ) is not; their fixed spaces have dimensions 1 and infinity. Zero has dimension 0. | Pass / — |
| finiteness-conditions (875) | κ[t,t⁻¹] for discrete ℤ is cyclic over κ[ℤ], but infinite-dimensional and not admissible for {1}; a sum of trivial lines is locally admissible but not finitely generated. | Pass / — |
| smooth-character (901) | For ℤ generated by g, χ(g)=2 changes a trivial line's eigenvalue from 1 to 2; inverse twist restores 1. Character 1 leaves the action unchanged. | Pass / — |
| smooth-dual (927) | The character g↦2 dualizes to g↦1/2, and double dual returns 2; zero dual is zero. Finite C₂ sign dual remains sign. | Pass / — |
| coefficient-change (955) | ℤ sign coinvariants are ℤ/2; tensor with ℚ gives 0 on either side, tensor with 𝔽₂ gives 𝔽₂. Invariants need the stated flatness/invertible-order qualifications. | Pass / — |
| smooth-centre (976) | For the trivial group, natural endomorphisms act on A² as a·I₂: diag(1,0) fails naturality with the two inclusions A→A². On A they give precisely A. | Pass / — |
| locally-constant-compact-support (1021) | Discrete ℤ: δ₀ has support {0}, constant 1 has infinite support and is excluded; on a finite two-point space the carrier is A². | Pass / — |
| open-closed-sequence (1046) | X={a,b}, U={a}, Z={b}: 0→A→A²→A→0 has maps x↦(x,0), (x,y)↦y; kernel is A×{0}, composite 0. | Pass / — |
| a-valued-haar-measure (1072) | C₂ counting measure: μ(G)=2, μ({1})=1; probability measure over ℚ gives 1 and 1/2. Over 𝔽₂ normalization μ(G)=1 cannot follow from singleton weights. | Pass / — |
| integration (1099) | C₂ with counting measure and f(1)=2,f(s)=3: integral=5; refining a constant value 2 on G gives 4 on both partitions. Empty support gives 0. | Pass / — |
| convolution-algebra (1131) | C₂: δ_s*δ_s=δ_1; S₃: δ_(12)*δ_(23)=δ_(123), reversed order δ_(132), so an unrecorded opposite algebra would change the answer. | Pass / — |
| hecke-idempotent (1162) | C₂ counting measure: e=(δ_1+δ_s)/2 has e²=e. In 𝔽₂, (δ_1+δ_s)²=0; division by μ(G)=0 is unavailable. | Pass / — |
| permutation-hecke-algebra (1191) | S₃/H, H=⟨(12)⟩: permutation dimension 3, two double cosets, End dimension 2. The trivial subgroup gives the group algebra with the specified opposite convention. | Pass / — |
| hecke-ring-comparison (1240) | A₄, H=⟨(12)(34)⟩, g=(123): HgH has size 4 and two H-cosets; augmentation of its operator is 2, not 4. For H=G the unit has degree 1. | Pass / — |
| locally-unital-algebra (1270) | Finite-support matrices on ℕ: an N×N corner identity fixes matrices supported there. The zero idempotent commutes with every matrix but does not fix E₁₁. | Pass / — |
| hecke-module-equivalence (1302) | Finite C₂, counting measure: integrating δ_s gives ρ(s), and δ_1 gives identity; for the sign line this recovers -1 and 1, not the zero action. | Pass / — |
| corner-irreducibles (1325) | S₃ over ℂ, H=⟨(12)⟩: standard simple has H-fixed dimension 1, sign has dimension 0; only the former survives e_H. Its corner module is simple of dimension 1. | Pass / — |
| bernstein-centre-corners (1347) | Finite C₂ over ℚ: center ℚ[C₂]≅ℚ×ℚ; e_+=(1+s)/2 corner sees first coordinate and e_- sees second. Using just e_+ loses the sign block. | Pass / — |
| l-adic-separatedness (1379) | Λ=ℤ_ℓ and G=1: center Λ, intersection ℓⁿΛ=0; a unit 1 is outside ℓΛ. Replacing Λ by ℚ_ℓ would give intersection ℚ_ℓ, outside the hypothesis. | Pass / — |
| iwahori-decomposition (1403) | GL₂, a=diag(ϖ,1): a u(x)a⁻¹=u(ϖx), while lower-root coordinate scales by ϖ⁻¹. Thus a contracts the upper and expands the lower subgroup. | Pass / — |
| positive-hecke-homomorphism (1429) | For GL₂ positive a with q=3 and K normalized volume 1, T_a acts on the trivial line by 3, T_(a²) by 9, and T_a² by 9; omitting the index would give 1. | Pass / — |
| strongly-positive-localisation (1485) | A[t] acting on A[t,t⁻¹]: inverting t yields A[t,t⁻¹]; on a module with t²=0 the localization is 0. Thus torsion is killed, not retained. | Pass / — |
| pro-iwahori-torus (1498) | For the rank-one torus the lattice is ℤ and the Hecke translations satisfy T_mT_n=T_(m+n), T_1T_-1=1; T_1 and T_-1 have different supports. | Pass / — |
| klingen-positive-hecke (1522) | Identity positive element has index 1 and operator 1; a central scalar translation has singleton coset and inverse translation. Their product is T_1, with no extra q power. | Pass / — |
| iwahori-matsumoto (1541) | Rank one q=3: T_s²=2T_s+3; at q=1, T_s²=1; at q=0, T_s²=-T_s and T_s need not be invertible. Identity index=1, simple-reflection index=3. | Pass / — |
| bernstein-presentation (1571) | For pairing ⟨α,λ⟩=1, (θ_λ-θ_(sλ))/(1-θ_-α∨)=θ_λ; pairing -1 gives -θ_(sλ). At q=1 the commutator term is 0; λ=0 maps to 1. | Pass / — |
| iwahori-hecke-centre (1594) | Rank-one lattice with inversion at q=1: center A[x+x⁻¹], x alone is not central; x+x⁻¹ has coefficients (1,1). Finite Weyl basis over A[x±] has rank 2. | Pass / — |
| grothendieck-abelian (1633) | G=1 reduces to A-modules: filtered colimit of Aⁿ is A^(ℕ); kernels of coordinate projections commute with that colimit. A is a generator, Hom(A,M)=M. | Pass / — |
| derived-smooth-category (1646) | G=1, complex A→A with differential identity: cohomology 0, hence zero derived object; zero differential instead has A in each of its two degrees. | Pass / — |
| k-injective-resolutions (1673) | Over a field, κ[0] is already K-injective: Hom from the contractible identity complex is contractible; κ[0]→κ[0] is a quasi-isomorphism, 0→κ[0] is not. | Pass / — |
| derived-invariants (1695) | C₂ over ℚ: H⁰(trivial)=ℚ, Hⁿ=0 for n>0; over 𝔽₂: H¹(C₂,𝔽₂)=𝔽₂. Derived invariants retain this latter class. | Pass / — |
| dg-enhancement (1722) | On the two-term identity complex, for f of degree 0 with components (a,b), df has component a-b; d²=0. Identity (1,1) is closed. | Pass / — |
| compact-generation (1753) | G=1 and κ coefficients: Hom(κ[0],⊕V_i)=⊕H⁰(V_i); if all shifts have zero Hom, all Hⁿ vanish. Generator κ is nonzero, zero alone cannot generate. | Pass / — |
| derived-smooth-dual (1769) | G=1, finite-dimensional V in degree 0: double dual dimension equals dim V and evaluation is identity in a basis; zero maps to zero, not a nonzero dualizing summand. | Pass / — |
| central-ext-vanishing (1814) | κ[t±], characters t=2 and 3 in characteristic 0: (t-2)-(t-3)=1, so common annihilator forces Ext=0. At equal character, Ext¹(κ₂,κ₂)=κ. | Pass / — |
| derived-hecke-algebra (1825) | G=H=C₂, κ=𝔽₂: Ext⁰(κ,κ)=κ and Ext¹=κ; over ℚ the positive Ext groups are 0. Multiplication in degree 0 has unit 1. | Pass / — |
| smooth-induction (1874) | H=1 in finite C₃: Ind of a one-dimensional module is A³; H=G gives A. Right translation cyclically permutes the three coordinates. | Pass / — |
| compact-induction (1893) | H=1 in discrete ℤ: c-Ind(A)=A^(ℤ), whereas unrestricted induction is A^ℤ; δ₀ belongs to both, constant 1 only to the latter. | Pass / — |
| frobenius-reciprocity (1911) | H=1, G=C₃, trivial target: Hom_G(A,A³) is the constant diagonal A; Hom_1(A,A)=A. Evaluation at 1 sends (a,a,a) to a. | Pass / — |
| induced-invariants (1926) | G=C₃,H=1,K=G: K-invariants of A³ are {(a,a,a)}, rank 1; K=1 gives rank 3, matching the three double cosets. | Pass / — |
| induction-exactness (1937) | H=1,G=C₃: induction triples 0→2ℤ→ℤ→ℤ/2→0, leaving an exact sequence in each coordinate. H=G gives the original sequence. | Pass / — |
| induction-in-stages (1947) | 1⊂C₂⊂S₃: induced rank 1 becomes ranks 2 then 6; direct induction has rank 6. Identity inclusions leave rank unchanged. | Pass / — |
| l-sheaf-model (1960) | Finite H\G with three cosets: the associated rank-one fibers have sections A³ and compact sections A³; over discrete infinite quotient compact sections are the direct sum. | Pass / — |
| mackey-filtration (1986) | S₃,H=K=⟨(12)⟩: double cosets have sizes 2 and 4; restriction of Ind_H^G(1) splits into ranks 1 and 2, totaling 3. | Pass / — |
| modulus-character (2003) | GL₂ over residue size 3: δ_B(diag(ϖ,1))=1/3, δ_B¹ᐟ²=1/√3; reversing the root gives 3 and √3. Over W(𝔽̄₂), a square root of 3 need not exist. | Pass / — |
| jacquet-module (2051) | Trivial GL₂ line: unnormalized U-coinvariants are κ and normalized torus action at diag(ϖ,1) is √q. Nontrivial additive character line has ordinary U-coinvariants 0. | Pass / — |
| jacquet-lemma (2072) | A finite p-group with p invertible: averaging kills the relation subspace and is identity on invariants. In characteristic p a size-p Jordan representation gives the nonexactness control. | Pass / — |
| parabolic-induction (2083) | P=G: δ=1 and i_G^G(V)=V. For GL₂ the normalized induction of (∣.∣^-1/2,∣.∣^1/2) is the unnormalized induction of 1, whose constants give a trivial subrepresentation. | Pass / — |
| first-adjointness (2102) | P=G: both Hom spaces are Hom_G(V,W), and evaluation/unit are identity. For GL₂ trivial subrepresentation above, r_B(1)=δ^-1/2 is exactly its inducing character. | Pass / — |
| induced-contragredient (2113) | P=G, torus character ϖ↦2: both dual constructions give ϖ↦1/2. Zero dual is zero; no extra modulus remains after normalization. | Pass / — |
| geometric-lemma (2131) | GL₂ principal series with distinct characters χ₁,χ₂: normalized B-Jacquet has two rank-one graded pieces (χ₁,χ₂) and (χ₂,χ₁); for a torus there is one piece. | Pass / — |
| principal-series-jacquet (2149) | At χ₁(ϖ)=2,χ₂(ϖ)=5, diag(ϖ,1) has Jacquet eigenvalues 2 and 5, trace 7 and determinant 10. A single unswapped piece would have dimension 1, not 2. | Pass / — |
| jacquet-invariants (2163) | P=G: projection on V^K is identity. For a stable operator diag(0,2), eventual kernel is first line, image second line; canonical lift lands in the second line only. | Pass / — |
| casselman-pairing (2192) | For a torus line χ(ϖ)=2 and its dual, pairing after simultaneous action gives 2·(1/2)=1; pairing with another χ-line instead gives 4 and is not invariant. | Pass / — |
| borel-casselman-invariants (2207) | Unramified generic GL₂ principal series: dim V^I=2 and dim normalized Jacquet torus invariants=2; Steinberg gives 1 and 1; zero gives 0 and 0. | Pass / — |
| whittaker-functionals (2225) | GL₂ over ℂ: Steinberg has Whittaker dimension 1, trivial line has 0. GL₁ has U=1 and its character line has quotient dimension 1. | Pass / — |
| compact-representations (2295) | A representation of a finite group has finite matrix-coefficient support; the trivial line for discrete infinite ℤ has constant coefficient 1 and noncompact support. | Pass / — |
| cuspidal-representations (2323) | A torus has no proper parabolic, so its character lines are cuspidal. Trivial GL₂ has B-Jacquet dimension 1 and is not cuspidal; zero has every Jacquet module 0. | Pass / — |
| harish-chandra-compactness (2348) | For a torus G/Z=1, a character's coefficient support modulo center is a point; trivial GL₂ has support all of G/Z, noncompact, and nonzero proper Jacquet module. | Pass / — |
| jacquet-subrepresentation (2365) | For a torus π embeds into i_G^Gπ=π by identity. Trivial GL₂ embeds as constants in Ind_B^G1=i_B^Gδ^-1/2, with dimension-one image. | Pass / — |
| admissibility-of-irreducibles (2374) | Torus character: every compact-open fixed space has dimension 0 or 1. Steinberg GL₂ has Iwahori-fixed dimension 1; the infinite sum of trivial lines is not simple and has infinite fixed dimension. | Pass / — |
| compact-induction-criterion (2397) | Finite S₃ with H=G and a simple representation: intertwining set is H and induction is that simple. H=1, trivial source: intertwining set is all S₃, induction has dimension 6 and is reducible. | Pass / — |
| hecke-algebra-decomposition (2421) | ℂ[S₃]≅ℂ⊕ℂ⊕M₂(ℂ): dimensions 1+1+4=6. Restriction to an H=⟨(12)⟩ corner gives dimensions 1+0+1=2. | Pass / — |
| commutative-subalgebra-bound (2469) | One generator on κ⁴: κ[J₄] has dimension 4, attaining the one-generator bound 4. For three generators on κ¹⁶, the displayed bound is 16^(7/4)=128; diagonal algebra dimension 16 is below it. | Pass / — |
| uniform-admissibility (2478) | Torus at any fixed compact open K: irreducible fixed dimensions are 0 or 1, so c=1 works uniformly; zero dimension is not used to disguise an infinite-dimensional fixed space. | Pass / — |
| finitely-many-cuspidals (2494) | F× at K=O×: one unramified inertial component, although infinitely many characters ϖ↦a. Counting actual characters would incorrectly give an infinite number. | Pass / — |
| unramified-characters (2530) | F×: G°=O× and quotient ℤ, χ(ϖ)=a determines χ(ϖⁿ)=aⁿ. For split semisimple SL₂ the unramified lattice is 0; the ramified norm-one torus separates parahoric index 2 from compact index 1. | Pass / — |
| finite-length (2579) | Torus module κ[t±]/(t-a)²: generated by 1, admissible, length 2. Infinite direct sum of κ_a has infinite length and fails finite generation. | Pass / — |
| cuspidal-support (2594) | Torus character χ has support (G,χ); generic GL₂ principal series has unordered support {χ₁,χ₂}. Swapping the two labels preserves support, replacing χ₁ by a distinct character changes it. | Pass / — |
| principal-series-constituents (2623) | GL₂ i_B(ν^-1/2,ν^1/2) has trivial submodule and Steinberg quotient; reversed ordering exchanges their positions. At q=3, the half-modulus values are 1/√3 and √3. | Pass / — |
| generic-irreducibility (2646) | GL₂ characters with ratio ν or ν^-1 give reducibility; ratio 1 over ℂ gives an irreducible principal series. The exceptional set is two proper equations, not every parameter. | Pass / — |
| bernstein-components (2667) | F× characters with equal restriction to O× lie in one inertial block despite distinct ϖ-values 2,3; characters with distinct O×-restrictions lie in different blocks. | Pass / — |
| cuspidal-splitting (2699) | Finite compact abelian quotient C₂ over ℂ: e_+=(1+s)/2 and e_-=(1-s)/2 split the two characters, e_+e_-=0 and e_++e_-=1. | Pass / — |
| bernstein-decomposition (2731) | For a sum of two torus characters with distinct unit restrictions, block projections have matrices diag(1,0),diag(0,1); their sum is identity and cross product zero. | Pass / — |
| noetherian (2743) | Torus unramified block κ[t±] is Noetherian; its cyclic regular module has ascending ideals eventually stationary, but infinite direct sum of trivial modules is not finitely generated. | Pass / — |
| bernstein-centre-blocks (2754) | F× unramified block has center κ[t±]; at character ϖ↦2, t acts by 2, at ϖ↦3 by 3. Replacing center by κ loses that distinction. | Pass / — |
| finite-type-corners (2773) | F×,K=O×: H(G,K)=ℂ[t±], equal to its center and generated by 1 as a module over it. For zero corner both module and image center are zero. | Pass / — |
| universal-unramified-twist (2789) | For F× universal value at ϖ is T∈κ[T±]; specializing T↦2 gives 2, T↦3 gives 3. On O× the universal unramified factor is 1. | Pass / — |
| centre-compatibilities (2817) | Two torus unramified blocks have centers ℂ[x±],ℂ[y±]; product center ℂ[x±,y±]. Evaluation at (2,3) sends xy to 6 on both sides. | Pass / — |
| square-integrable-tempered (2832) | For GL₂, unitary Steinberg is square-integrable modulo center; trivial representation has constant coefficient 1 on noncompact G/Z and is not. A unitary torus character has quotient support one point. | Pass / — |
| casselman-criterion (2856) | GL₂ St normalized B-Jacquet exponent at diag(ϖ,1) is q^-1/2<1, whereas trivial representation gives q^1/2>1. Unit-modulus tempered principal-series exponents give equality 1. | Pass / — |
| harish-chandra-tempered-support (2881) | Unitary GL₂ principal series is induced from two unitary torus lines, hence has tempered support with exponent absolute values 1,1. A nonunitary central twist changes a central absolute value away from 1. | Pass / — |
| langlands-classification (2894) | GL₂ ordered exponents (1/2,-1/2) give standard module with unique trivial quotient; its submodule is St. A torus standard module is already its unique quotient. | Pass / — |
| borel-casselman-block (2914) | Unramified GL₂ principal series has I-invariant dimension 2, St dimension 1; a character with nontrivial restriction to I has fixed space 0 and is outside the generated block. | Pass / — |
| iwahori-components (2929) | Split torus: connected Iwahori=O×, quotient ℤ. For a ramified norm-one torus, connected parahoric has index 2 in the compact group, so two characters may survive that smaller subgroup. | Pass / — |
| steinberg (2957) | Rank-zero torus St=1; GL₂ St has Iwahori invariants 1 and Whittaker dimension 1, versus trivial GL₂ Whittaker dimension 0. At q=3 its normalized Jacquet exponent is 1/√3. | Pass / — |
| isotypic-quotient-regular (2979) | Finite S₃ over ℂ: regular representation has standard isotypic summand std⊗std*, dimension 4; trivial isotypic summand dimension 1. Multiplicity is 2 for std, not 1. | Pass / — |
| stabilization (3020) | T=diag(0,2): from n=1, kernel=κe₁ and image=κe₂; T invertible on second line. For J₂, n=2 gives kernel=V and image=0. | Pass / — |
| jacquet-lemma-smooth (3041) | P=G, λ=1: all powers act as identity and Jacquet projection is identity. A nilpotent contracted summand has direct limit 0, consistent with its Jacquet image 0. | Pass / — |
| jacquet-duality (3053) | Torus character ϖ↦2: normalized Jacquet is itself, both dual/Jacquet orders give ϖ↦1/2. For P=G opposite parabolic is also G. | Pass / — |
| second-adjunction-unit (3066) | For P=G, induction and Jacquet are identity: unit and counit matrices are I, both triangle composites I. Zero object gives the unique zero map, its identity. | Pass / — |
| second-adjointness (3100) | P=G reduces both Hom sets to Hom_G(V,W). In GL₂ the opposite-Jacquet exponent of the trivial line is δ_B^1/2, matching its occurrence as quotient of i_Bδ_B^1/2. | Pass / — |
| satake-transform (3148) | GL₂ q=3: raw transform of first minuscule coset is 3X₁+X₂, normalized transform √3(X₁+X₂); raw coefficients are 3 and 1, not both √3. | Pass / — |
| twisted-weyl-invariance (3175) | Correct reflection X₁↦X₂/3, X₂↦3X₁ fixes 3X₁+X₂. Opposite twist sends it to X₁/3+9X₂. Thus the inverse sign fails already in rank 2. | Pass / — |
| satake-isomorphism (3207) | GL₂ q=3: raw generator 3X₁+X₂ and determinant X₁X₂ are twisted-invariant. Modulo 2, q=1 and the first becomes X₁+X₂; no division by ∣S₂∣ occurs. | Pass / — |
| torus-character-dictionary (3217) | F×/O×≅ℤ with ϖ↦1: χ(ϖ)=2 gives monomial evaluation X↦2; using ϖ⁻¹ instead would give 1/2. | Pass / — |
| frobenius-component-invariants (3227) | Split dual torus has trivial Frobenius action, so twisted conjugation is ordinary and each point is fixed. Inversion action gives h·a=h²a; h=2,a=3 gives 12, not 3. | Pass / — |
| pseudoroot (3243) | For GL₂ q=3 the selected modulus square root has torus coordinates (1/√3,√3), square (1/3,3). Its inverse has square (3,1/3), distinguished by the raw transform. | Pass / — |
| spherical-parameter (3272) | GL₁ spherical character ϖ↦2 corresponds to dual point 2; Hecke translation acts by 2. The inverse-Frobenius convention would give 1/2 and must be transported explicitly. | Pass / — |
| c-group-formulation (3287) | GL₂ changing √q to -√q negates the half-modulus coordinate pair, while its square remains (q^-1,q); the central sign quotient identifies the two enhanced descriptions. | Pass / — |
| gln-generators (3312) | GL₂ normalized generators are √q(X₁+X₂) and X₁X₂; at q=1 these are the elementary symmetric functions. GL₀ gives coefficient ring and no nontrivial generator. | Pass / — |
| hall-littlewood (3325) | Two variables: P_(1,0)=x+y, P_(2,0)=x²+y²+(1-t)xy, P_(0,0)=1. At t=1 the middle coefficient vanishes; normalization by 1+t removes the repeated-zero Weyl multiplicity. | Pass / — |
| macdonald-formula (3370) | For GL₂ λ=(1,0), q^⟨ρ,λ⟩P_λ(X;q^-1)=√q(X₁+X₂), agreeing with normalized Satake; λ=0 gives 1. Source text unavailable; algebraic examples only. | Pass / — |
| parabolic-descent (3377) | GL₂ to diagonal torus: first spherical generator descends to √q(X₁+X₂), determinant to X₁X₂. Descent through G itself is identity; composing with evaluation (2,3) gives 5√q and 6. | Pass / — |
| paired-unitary-parameter (3416) | Rank 0 polynomial=1; rank 1=T-1; rank 2 with a=2 gives T²-(5/2)T+1; rank 3 adds root 1, preserving reciprocal pairing 2↔1/2. | Pass / — |
| unitary-genericity (3433) | For roots (2,1,1/2), P'(1)=(1-2)(1-1/2)=-1/2 and P(-3)=-70. At q=3, (T-q)(T-q^-1) has derivative 8/3 at q; modulo 2 coincident roots give derivative 0. | Pass / — |
| unitary-weyl-traces (3461) | Rank-one reciprocal pair (2,1/2) has μ=5/2, fixed by swapping the pair; rank 3 standard trace μ+1=7/2. The middle root must not be omitted. | Pass / — |
| unitary-triangular-transform (3472) | N=2,δ=1,q=3: 3μ=-2+S(T₁), so at μ=5/2, S(T₁)=19/2. N=3 gives S(T₁)=9μ+2; δ=0 gives 1=1. | Pass / — |
| unitary-isotropic-counts (3489) | Over 𝔽₄ (q=2), isotropic line counts in dimensions 2,3 are 3,9; maximal isotropic counts in dimensions 4,5 are 27,297. Rank 0 count=1; beyond Witt index count=0. | Pass / — |
| unitary-spherical-coefficients (3503) | d₀=1, d•₀=0; d₁=1-q-2q² and d•₁=-q give -20,-3 at q=3. At q=-1 they give 0,1, so no division by q+1 is justified. | Pass / — |
| unitary-even-formulas (3525) | N=2,q=3,μ=5/2: I=27/2,R=4,T=-3. (q+1)R-I=5/2=-q(μ-(q+q^-1)); R+(q+1)T=-8=-(q²-1). | Pass / — |
| unitary-odd-formulas (3542) | N=3,q=3,μ=5/2: S(T₁)=49/2, I=28+49/2=105/2=9(μ+10/3); T=-20+49/2=9/2=9(μ-2). Rank-one empty product=1. | Pass / — |
| gsp4-spin-polynomial (3554) | q=2,T₀=1,T₁=2,T₂=3 gives Q=1-3X+14X²-24X³+64X⁴. At q=1,T₁=T₂=4,T₀=1 it is (1-X)⁴. | Pass / — |
| gsp4-galois-comparison (3578) | Reversing the preceding Q gives T⁴-3T³+14T²-24T+64. At q=0 formal specialization, Q=1-3X still reverses in degree 4 to T⁴-3T³, not T-3. | Pass / — |
| finite-discrete-cup-comparison (3588) | C₂ over 𝔽₂: degree-1 class u has u² nonzero in degree 2 on both discrete and continuous sides; for the trivial group positive-degree classes vanish. | Pass / — |
| derived-satake (3607) | For a split torus the Weyl group is trivial: ordinary Satake is identity and degree-one torus cohomology is retained. Rank 0 gives A in degree 0 and 0 in higher degrees. | Pass / — |
| unitary-iwahori-center (3624) | In a rank-one torus lattice with inversion, invariant coordinate is X+X^-1; evaluation at a=2 is 5/2 from both spherical and central descriptions. X alone changes to 1/2 under reflection. | Pass / — |
| twisted-coinvariants (3674) | Trivial ℤ-line, C₂ sign ψ: relations generate 2ℤ, quotient ℤ/2. After ℚ extension quotient 0; ψ-character line has quotient A. Inverse twist at ψ=2 acts by 1/2. | Pass / — |
| mirabolic-derivatives (3710) | GL₁ character has D¹=κ; trivial GL₂ has D²=0. Two rank-one inducing factors have top derivative κ⊗κ=κ; zero factor makes it 0. | Pass / — |
| derivative-exactness (3759) | An inflated module M has Ψ⁻Ψ⁺M=M and Φ⁻Ψ⁺M=0; the character-orbit induced model has Φ⁻Φ⁺M=M and ordinary quotient 0. Exact-sequence ranks reduce to 0→M→M→0. | Pass / — |
| schwartz-submodule (3773) | n=1: J(M)=M and End(J(M))=End(M); for trivial GL₂, top derivative and J are both 0. Tensoring with the zero module gives 0 on both sides. | Pass / — |
| essentially-aig (3797) | GL₁ character line: socle=κ, quotient=0, End=κ. Two copies have socle κ² and End=M₂(κ); diag(1,0) is nonscalar and absolute simplicity fails. Zero fails simplicity. | Pass / — |
| distinguished-cuspidal-types (3841) | GL₁ with unit-character τ: the τ-isotypic idempotent selects its own character and kills a distinct one. If ℓ divides a finite unit-quotient order, its ℓ-Sylow cannot be averaged away. | Pass / — |
| type-projective-construction (3922) | GL₁ trivial type: universal projective has unramified variable W(k)[T±], not a fixed character line. For χ(ϖ)=2, dual-type transport uses χ^-1; twisting in the other direction yields 1/2 instead of 2. | Pass / — |
| stable-operator (4010) | T=diag(0,2) on κ²: ker T^n=κe₁, im T^n=κe₂ for n≥1, colimit κe₂. J₂ has stable image 0 after n=2, not its initial image κe₁. | Pass / — |
| integral-second-adjointness (4032) | P=G gives identity adjunction over any p-invertible coefficient ring. At p=3,ℓ=2, normalization would require √3; unnormalized formulation avoids that unavailable scalar. | Pass / — |
| integral-blocks (4194) | GL₁ unramified block has parameter T±; distinct residual unit characters give orthogonal blocks. If ℓ divides q-1, the unit-Sylow group ring remains, rather than splitting into characteristic-zero characters. | Pass / — |
| modular-generic-segments (4216) | A singleton cuspidal segment has generic derivative dimension 1. In characteristic zero a longer quotient-convention segment is St and generic, while its Z-version is nongeneric; linked singleton segments do not satisfy the unlinked-product hypothesis. | Pass / — |
| type-projectives (4252) | For GL₁, specializing W(k)[T±] at T=a gives the one-dimensional character with ϖ-value a. The projective itself has infinite W(k)-rank; its character fiber has rank 1. | Pass / — |
| universal-whittaker (4275) | GL₁ unramified block: universal Whittaker projective A[T±] has derivative itself over its center, rank 1 over A[T±]. A character fiber T=a has derivative A. | Pass / — |
| co-whittaker (4336) | GL₁ V=A with a character action: derivative A, End=A; V=A² has derivative rank 2 and fails the definition. A=0 gives the zero module over the zero ring, with the unique scalar endomorphism. | Pass / — |
| universal-domination (4381) | GL₁, center specialization T↦a: A[T±]⊗_(T↦a)A≅A maps onto the character line by identity; specialization at 0 is excluded since T must stay invertible. | Pass / — |
| reduced-family-reconstruction (4390) | For reduced A=κ[x,y]/(xy), the map to its two generic fields is injective, intersection of minimal primes (x)∩(y)=0. For κ[ε]/ε², ε dies at the sole minimal-prime fiber. | Pass / — |
| segment-representations (4401) | GL₂ segment [-1/2,1/2]: Z=1 and L=St, with top derivatives 0 and κ. Singleton [a,a] gives ν^a in both conventions; empty multisegment gives rank-zero line. | Pass / — |
| wd-raw-parameters (4432) | N=[[0,0],[1,0]], r(Fr)=diag(1,q): rNr^-1=qN. At q=3 the coefficient is 3, not 1/3. N=0 satisfies the relation; nonnilpotent identity does not for q≠1. | Pass / — |
| nilpotent-exp-log (4470) | J₃³=0: exp J₃=1+J₃+J₃²/2 and log(1+J₃)=J₃-J₃²/2, inverse substitutions recover J₃. For N²=0, (1+N/2)²=1+N. | Pass / — |
| wd-parameter-operations (4518) | Dual monodromy is -Nᵗ and double dual N. For Sp₂⊗Sp₂, N_total²=2N⊗N≠0 in characteristic 0, N_total³=0. Unramified degree-2 restriction gives q²; induction coset of degree 1 contributes q^-1N. | Pass / — |
| wd-complete-coefficients (4548) | Tame rank-two unipotent action is 1+tN with N²=0, so exp(tN)=1+tN and log=tN; trivial action gives N=0. In dimension 0 the empty sum is the unique identity map of 0. | Pass / — |
| full-wd-construction (4596) | For a trivial ℓ-adic representation, finite-inertia WD part is trivial and N=0, inverse returns identity. For the tame unipotent rank-two model, inverse reinstates 1+tN, not 1-tN. | Pass / — |
| wd-frobenius-semisimplification (4624) | With trivial inertia, N=0, r(Fr)=[[a,1],[0,a]], a≠0: semisimplification is aI, characteristic polynomial (T-a)² on both sides. Sp₂ already has semisimple Frobenius and retains N≠0. | Pass / — |
| classical-llc-normalization (4652) | GL₁ unramified character ϖ↦2 has arithmetic Frobenius value 2; geometric Frobenius gives 1/2. In rank 2 the St parameter has nonzero N, unlike the nongeneric trivial representation's N=0. | Pass / — |
| integral-llc-centre (4698) | Rank-one universal unramified parameter r(Fr)=T: the central translation has eigenvalue T; specialization T=2 gives 2 on both sides. Inverse convention would give 1/2. | Pass / — |
| llc-family-conditional (4722) | GL₁ over reduced A, a∈Aˣ: family is a rank-one character, derivative A and generic fibers rank 1. Two copies give derivative rank 2 and violate the family normalization. | Pass / — |
| tensor-endomorphisms (4764) | GL₁ V=A: for M=A², End_G(M⊗V)=M₂(A)=End_A(M); M=0 gives zero endomorphism ring. Requiring only scalar endomorphisms after tensoring would be false. | Pass / — |
| ext-support-orthogonality (4778) | Torus exact characters 2 and 3: (t-2)+(t-3)=whole Laurent ring, Ext=0; identical character permits a length-2 Jordan extension with Ext¹≠0. | Pass / — |
| cg-distinct-block (4794) | For n=1, residue-unit variable y has y^d=1 and unramified variable X is independent. κ[[X]]/(X^m) has finite length m; κ[[X]] itself has infinite-length cyclic submodule and is excluded. | Pass / — |
| cg-derived-projector (4807) | Over 𝔽₂[ε]/ε², Q(V)=diag(1+ε,ε) has square diag(1,0), fixed by further factorial powers. The generalized zero eigenspace is killed; identity selects both lines. | Pass / — |
| highest-derivative-adapter (4818) | For Z([a,a+1]_1)=ν^(a+1/2) on GL₂, highest nonzero derivative shortens to the singleton [a,a]; the full derivative is 0. For GL₁ a singleton disappears, leaving the rank-zero line. | Pass / — |
| crossed-cocycles (4866) | ℤ acting on G_m by inversion: c(1)=a implies c(2)=a·a^-1=1; gauge h sends a to h²a, so a=3,h=2 gives 12. Ordinary conjugation would incorrectly give 3. | Pass / — |
| finite-wild-discretization (4902) | Trivial wild quotient and torus action leave generators Fr,s with Fr s Fr^-1=s^q; q=3 forces a torus inertia value b to satisfy b²=1. Deeper wild characters are excluded at fixed truncation. | Pass / — |
| finite-wild-representability (4916) | For split G_m with trivial wild part at q=3, coordinate ring R[a±,b±]/(b²-1); each geometric fiber has dimension 1. In characteristic 2 the b-fiber is nonreduced of length 2, not two reduced points. | Pass / — |
| ell-adic-extension (4939) | A tame rank-one value b of finite prime-to-p order has the same value under discrete and continuous extension; b=1 extends trivially. A proposed b with b^(q-1)≠1 fails the Frobenius relation before extension. | Pass / — |
| wild-strata (4952) | For wild quotient C_p and dual G_m over ℤ̄[1/p], homomorphisms are μ_p with p geometric points; each centralizer is G_m. Trivial wild quotient gives exactly one stratum. | Pass / — |
| twisted-component-finiteness (4971) | SL₂ diagonal torus quotient by inversion: trace t=a+a^-1 gives relation a²-ta+1=0, degree 2. Identity subgroup map has degree 1; finite generation concerns the invariant quotient. | Pass / — |
| tame-torus-engine (4982) | Trivial action on G_m: equation t^(q-1)=1 gives degree 2 at q=3. In characteristic 2 it is (t-1)²; at q=1 it is identically 0 and the whole G_m fiber is not finite. | Pass / — |
| frobenius-quotient-finite (5017) | In the split G_m q=3 model, forgetting b from R[a±,b±]/(b²-1) is finite free of rank 2 over R[a±]. Trivial dual group gives the identity map, rank 1. | Pass / — |
| excursion-algebra (5028) | G_m one-dimensional representation and one index: creation/annihilation 1 with parameter a gives scalar a; zero annihilation gives 0; trivial representation with both maps 1 gives 1. | Pass / — |
| excursion-invariant-comparison (5055) | For split G_m the invariant quotient has coordinates a±,b with b^(q-1)=1; one-index characters evaluate to a,b on both excursion and cocycle sides. Conjugation contributes no additional quotient. | Pass / — |
| z-finite (5073) | G=1,V=A^r (r>0): actual categorical center image is scalar A, V finite over it. V=ℚ^(ℕ) has image ℚ but is not finite over it; V=0 has zero image ring. | Pass / — |
| depth-generators (5101) | Trivial representation has every Moy–Prasad r-plus invariant equal to V, so depth≤r projection is 1; zero representation gives 0; a representation with all those invariants 0 has generated depth part 0. | Pass / — |
| cuspidal-stable-lattice (5113) | F× character ϖ↦ℓ has no stable rank-one O_E-lattice under both ϖ and ϖ^-1; inverse twist gives eigenvalue 1 and lattice O_E. O_E[T±] is cyclic but has infinite O_E-rank. | Pass / — |
| cuspidal-embedding (5141) | Torus Q=R[G/U] embeds into itself via identity with one cuspidal summand; zero uses the empty sum. Every map from R/ℓ to an ℓ-torsion-free target is 0, so cannot be an embedding. | Pass / — |
| stable-contracting-hecke-operator (5160) | P=G,λ=1 gives T=1 and colimit V^K. T=diag(0,2) gives colimit second line and projection kills first; a nilpotent T gives colimit 0. | Pass / — |

Further controls: the non-flat subgroup U over ℤ with coordinate ring ℤ[t]/(2t) becomes trivial after inverting 2, but over 𝔽₂ the swap matrix carries its upper elementary matrix to a lower one outside U. This supports the split-torus subgroup hypothesis in the normalizer target, rather than claiming a general closed normalizer for arbitrary non-flat subgroups. For q=1 the tame torus equation has an entire G_m fiber, so actual local-field residue cardinality q>1 matters. For p=2 or 3 the convolution and derivative constructions use exactly the stated invertible-order conditions; the ℓ=2 square-root issue is exposed at q=3. For the zero coefficient ring, units and endomorphisms have one element, so uniqueness statements remain meaningful; simple/generic nonzero field objects are not manufactured from it. The noncommutative S₃ convolution test, square-zero coefficient fiber, negative Bernstein pairing, rank-zero parameter, and fixed-degree polynomial reversal test cover the principal convention and total-function traps.

## Not verifiable

- **BH06**, *The Local Langlands Conjecture for GL(2)*: the service returned `uncertified` for DOI 10.1007/3-540-31511-X, without readable text. Its parallel locators in §§2–4, 7.6, 9.3, 9.10–9.11, 11.4–11.5 and 36.1–36.2 therefore are not independently certified here. This includes the exact printed locator for GL₂ Whittaker multiplicity one. The available Bernstein/Casselman sources and explicit computations check the parallel conventions, not this inaccessible book's wording.
- **Mac**, *Symmetric functions and Hall polynomials*, second edition (1995), Chapter III (2.1): the publisher book DOI and the service's chapter DOI both returned HTTP 403. No readable legal copy was obtained. The normalization examples above were calculated, but the printed formula's locator remains unverified. One missing-reference entry using the existing key Mac records these attempts; no source manifest was edited.
- **HM18**, *Converse theorems and the local Langlands correspondence in families*: DOI 10.1007/s00222-018-0816-y returned `uncertified`. The published interpolation locators at Theorem 1.1, Conjecture 7.1 and Theorems 7.4–7.5 remain uncertified; no claim is made to have read their proofs.
- **Nak**, *Zeta morphisms for rank two universal deformations*: DOI 10.1007/s00222-023-01203-7 returned `uncertified`. Its tensor-endomorphism lemma was not checked against the printed text. The general GL_n route is explicitly an additional derivative argument in the README, and the actual Lean tensor signature and rank-one/A² tests were checked separately.
- Direct ownership comparison at the supplied SmoothBanachRepresentations open checkout could not be completed because that folder was unavailable. The remaining claims about readable supplier heads, main and board packages are supported by the searches described above.

These access limitations are not mathematical counterexamples or additional findings. No missing text has been guessed or silently certified, and the review is completed rather than parked.

## Source issues

- **Misprint** in Ber92 at Definition 4(1), printed p. 9: the source says the local idempotent merely commutes with each element of the finite set; it should be a two-sided identity on that set, ef_i=f_i=f_i e; affects a stated result.
- **Error** in TV at equation (7.2.1), printed p. 206: the source says the twisted Weyl exponent is (Σ−wΣ)/2 under its stated uniformizer dictionary; it should be (wΣ−Σ)/2, or the dictionary must be inverted consistently; affects a stated result.
- **Error** in TV at §7.4(a)(i), printed p. 209: the source says the pseudoroot square is Σ(q) with the retained lattice dictionary; it should be Σ(q)⁻¹ for the modulus square root used by its raw Satake formula; affects a stated result.
- **Misprint** in Del73 at proof of Lemma 8.4.3, printed p. 569: the source says scaling N by every scalar a preserves the isomorphism class; it should be restricted to nonzero scalars a, since rank(N) differs from rank(0) when N is nonzero; affects the proof.

The roadmap already avoids these four source defects. Ber92's omission and Del73's zero-scalar slip were checked on the page images as well as the extracted text; the TV discrepancies were checked in the published edition against its own GL₂ transform and lattice dictionary.
