# Review of McKaySkewGroup (pull request #223 at cdab583)

**Verdict:** needs changes

## R01 (P1) — Uniform arrow scaling changes the parameter quadratically

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:726`; also `TauCetiRoadmap/McKaySkewGroup/Suggested.lean:284`. The claim is “rescaling every arrow by `c ∈ ℂˣ` identifies `Π^λ` with `Π^(cλ)`.”

**Claim:** This gives the wrong parameter for the specified map. A preprojective relation is quadratic in the doubled arrows. The existential CBH theorem does not itself specify this false map, but its explanation and the README do.

**Witness:** On the displayed star representation, `a=E₁₀`, `a*=E₀₁`. Their commutator is `diag(-1,1)`. Scaling both by 2 gives `diag(-4,4)`, whereas doubling the parameter gives `diag(-2,2)`.

**Repair:** State the uniform scaling law with `c²λ`, or scale only the chosen original arrows by c and leave the reverse arrows fixed to obtain `cλ`. Specify the homomorphism direction: the c-scaled generators inside Π^λ define a map from Π^(c²λ) to Π^λ. For the abstract complex-algebra isomorphism at a nonzero scalar multiple, choose a square root or use the one-sided scaling. At c=2 the repaired uniform formula gives exactly `diag(-4,4)`. Keep this as a README normalization Check.

## R02 (P1) — The companion files admit mathematical data

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:132`, `TauCetiRoadmap/McKaySkewGroup/McKayClassificationTargets.lean:318`, and `TauCetiRoadmap/McKaySkewGroup/GeometricMcKayTargets.lean:351`. For example, “`noncomputable def clusterScheme : ∀ ... , Over complexPoint := sorry`”.

**Claim:** The no-sorry-data rule applies to all five reviewed files. Making a constructor a whole dependent family does not turn its admitted value into a theorem. The geometric module's explanation at lines 17–20 does not resolve this.

**Witness:** `scalarStarRepresentation` is an admitted algebra map; `finiteSO3Classification` an admitted classification witness; `clusterScheme`, `resolution`, and `resolutionMap` are admitted schemes and a morphism. Their consumers therefore mention admitted data.

**Repair:** Remove these admitted constructors and their dependent catalogues from the acceptance files. Keep the constructions, signatures and laws in the README. Retain only headline propositions statable using native carriers and a few genuinely simple definitions with real bodies; name the other headlines and missing carriers in the module docstring. This is not repaired by proving only the displayed evaluation laws. For example, the C₂ cluster functor must describe length-two families even over ℂ[ε]/ε²; an arbitrary admitted scheme over ℂ has no such meaning.

Other direct instances include `canonicalClassEquiv` at classification line 38, `rotationCover` at 110, `unitarizer` at 354, `coordinatePullback` at geometric line 106, `namedGenerators` at 189, `namedHypersurfaceEquiv` at 199, `tautological` at 423, and `componentLabel` at 484. This is a file-wide problem, not a request to replace one `sorry`.

## R03 (P1) — Two companion modules do not elaborate; the third cannot import them

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:46`, `TauCetiRoadmap/McKaySkewGroup/McKayClassificationTargets.lean:28`, and `TauCetiRoadmap/McKaySkewGroup/GeometricMcKayTargets.lean:1`.

**Claim:** The passing targeted build compiles `Suggested.lean`, which imports none of these three files. It is not evidence that the additional acceptance declarations have meaningful elaborated signatures.

**Witness:** Scratch elaboration reports unknown `DeformedPreprojectiveAlgebra` at CBH line 46 and unknown `TauCeti.irreducibleRepresentation` at classification line 28. The geometric import fails because the classification object file does not exist.

**Repair:** Remove the obsolete companion catalogues as in R02, moving their mathematical requirements to the README. If any eligible headline is retained, rewrite it against the actual pins in the permitted acceptance file and elaborate it. Merely adding a build dependency cannot fix the unknown constants. `Suggested.lean:257` declares lowercase `deformedPreprojectiveAlgebra`, not the uppercase name or the separate `deformedPreprojectiveIdeal` used by the controls. The current action instance also takes an `FDRep`, unlike the old application in `GeometricMcKayTargets.lean:32`. Re-run both the targeted build and direct elaboration of every retained Lean file. The failed probes were run on copies; missing Tau Ceti prerequisites were built first where applicable.

## R04 (P2) — The Weyl-algebra Check needs characteristic zero

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:733`. The Check says the first Weyl algebra “has no nonzero finite-dimensional module (trace of a commutator is zero)”. Layer 5 introduced Π^λ over k, without a characteristic-zero hypothesis on this Check.

**Claim:** Vanishing trace only forces the integer dimension to vanish in k. It does not force the dimension to be zero in positive characteristic. The general nonmodular convention does not help for a one-vertex quiver or trivial group.

**Witness:** Over 𝔽₂ take D=E₀₁ and T=E₁₀ on 𝔽₂². Then `DT−TD=diag(1,1)=I`. This is a nonzero two-dimensional module satisfying the stated Weyl relation; `Tr(I)=0`.

**Repair:** Keep the general-field algebra definition, but state this nonexistence Check over a characteristic-zero field. Add the positive-characteristic negative control: on k[t]/(tᵖ), differentiation and multiplication by t satisfy `[D,T]=1` and give dimension p. The repaired trace argument gives `dim M=0` in characteristic zero and deliberately does not exclude this p-dimensional example.

## R05 (P2) — The double-edge polynomial and CBH headlines are statable

**Location:** `TauCetiRoadmap/McKaySkewGroup/Suggested.lean:30`. The docstring concludes that “the `Ã₁` case remains a README target” because the affine graph carrier is a simple graph. The corner statements at lines 222 and 286 require `IsGraphical`.

**Claim:** This is a limitation of the selected graph adapter, not of the pinned preprojective-algebra carrier. It omits part of the all-finite-subgroup polynomial and CBH headline. This objection does not ask for an ordinary simple-graph zigzag theorem for C₂.

**Witness:** `TauCeti.preprojectiveAlgebra` takes an arbitrary finite quiver, including parallel arrows. A two-vertex quiver with `Hom(0,1)=Fin 2` and all other original-arrow types empty elaborates at the pin. C₂ has McKay matrix `[[0,2],[2,0]]`.

**Repair:** Express the polynomial and deformed-preprojective headline through a finite quiver realizing the actual McKay multiplicities, with the appropriate simple-graph adapter where applicable. Include the C₂ instance in that general statement. The scratch probe constructed the Kronecker quiver and its native preprojective algebra without any admitted data or option override. Its double has two arrows each way, exactly the missing C₂ case. Do not replace this with a small-value theorem or relax the valid ordinary-zigzag restrictions.

## R06 (P2) — The integral representation-lattice headline is wrongly labelled unstatable

**Location:** `TauCetiRoadmap/McKaySkewGroup/Suggested.lean:39`; compare `TauCetiRoadmap/McKaySkewGroup/README.md:425`. The docstring says Tau Ceti has `repRing`, “but no root lattice of an affine type to map to.”

**Claim:** The absent specialized name does not prevent stating this headline. The required integral lattice and radical quotient are simple native module constructions. Layer 2's actual representation-class/form comparison, not a general quotient lemma, belongs in the acceptance test.

**Witness:** The scratch definitions `Fin t.nodes → ℤ`, `Submodule.span ℤ {t.marks}`, and their quotient elaborate at the pin. `TauCeti.repRing` is native. For C₂ the quotient map is `(a,b)↦b−a`, with form `2(b−a)²`.

**Repair:** Use those real-body definitions and state the Layer 2 comparison on the actual representation ring/McKay labelling, retaining the integral form and regular class. Do not build another generic affine-data engine or substitute a theorem about arbitrary integer vectors. The C₂ comparison sends the trivial class to −1, the sign class to 1, and the regular class to 0; the singleton comparison gives the zero lattice. Both are expressible without a new heavy carrier.

## R07 (P3) — Layer 3 replans the native skew-monoid algebra

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:456`: “Define the skew product on the finitely supported carrier `Γ →₀ A`, prove ... its universal property, associativity, algebra structure”.

**Claim:** These are existing objects and laws, even though the inventory at line 77 correctly says to consume `SkewMonoidAlgebra`. The equivariant-module equivalence and the McKay specializations are separate new work.

**Witness:** At the pin, `Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean:39,742,779,1042` supplies the carrier, `liftNCRingHom`, ring structure and `single_mul_single`; `Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean:30` supplies `liftNCAlgHom`.

**Repair:** Delete the generic carrier/ring/universal-property construction targets and cite those exact declarations in the supplier contract. Keep the action adapters and the actual module-category equivalence. The native multiplication already gives `(1#g)(x#1)=−x#g` and `(x#1)(1#g)=x#g` for the sign action, so the proposed convention Check still works unchanged.

## R08 (P3) — The seeded geometric claims lack exact source locators

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1327,1335` and `:1437`. In particular, “Prove that these charts exhaust all regular Γ-clusters” and the determinant-degree delta equations have no primary theorem/page locator.

**Claim:** The supplier references establish generic Hilbert, bundle and surface infrastructure, not the new Γ-Hilbert-scheme identification or the tautological-degree theorem. Neither the broad references section nor FKS's algebraic scope certifies these claims. There is also no `sources.toml` recording the cited works.

**Witness:** SchemeAndStackFoundations §4.14 gives projective Hilbert/Quot representability; AlgebraicVectorBundles L0 gives locally free sheaf operations. Neither states the all-Γ-cluster chart exhaustion or `deg det(T_i)|E_j=δ_ij`. The FKS endpoint display is in preprint §8.3, p.30, not §§8.1–8.2.

**Repair:** Attach primary theorem/section/page locators to the new claims in §§7.0–7.4, especially full Γ-Hilb equals its coherent component, the minimal-resolution identification, the positive degree pairing, and the fundamental-cycle identification. Separate source theorems from new comparison constructions and state the latter's proof inputs. Correct the FKS scope/locator to include the §8.3 display actually used in §6.3. Add one source-manifest entry per work, with the version actually checked and the service status. The C₂ chart calculation below fixes the positive degree convention that the chosen source must support. Missing source text is reported separately, not guessed.

## R09 (P3) — All three companion import lists violate the Lean form

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:1`, `TauCetiRoadmap/McKaySkewGroup/McKayClassificationTargets.lean:1`, and `TauCetiRoadmap/McKaySkewGroup/GeometricMcKayTargets.lean:1`.

**Claim:** Each listed Lean file must start with the single `import Mathlib`, followed only by used pinned `TauCeti.*` modules. The companion files instead import roadmap modules and Mathlib submodules. Geometric line 2 imports `TauCetiRoadmap.AlgebraicVectorBundles.Suggested`.

**Witness:** The three first lines import another `TauCetiRoadmap.*` module; none of their import lists contains the required `import Mathlib`. The geometric bundle carrier is taken from another roadmap's acceptance file.

**Repair:** Delete the obsolete companion catalogues or consolidate eligible headlines into a compliant acceptance file. Use native pinned carriers, and document genuinely missing bundle/geometric carriers instead of importing another roadmap. The main `Suggested.lean` already demonstrates the permitted import form and elaborates with it.

## R10 (P3) — The companions are API and boundary-test catalogues

**Location:** `TauCetiRoadmap/McKaySkewGroup/McKayClassificationTargets.lean:325`; `TauCetiRoadmap/McKaySkewGroup/GeometricMcKayTargets.lean:77,80,85,540`.

**Claim:** The auxiliary declarations include boundary cases, definitional projections and immediate library wrappers rather than headline theorems. The special-purpose trace controls also belong among README Checks, not a parallel acceptance API.

**Witness:** `quotientProjection_native` is proved by `rfl`; the next two theorems are exactly native projection-invariance and finiteness results. `cyclic_one_eq_bot` and `trivial_component_empty` are sorried boundary cases.

**Repair:** Delete these declarations from the acceptance files; do not move them into `Suggested.lean` or prove the sorried controls in place. Keep their mathematical statements as README Checks. At Γ=1 the quotient projection is the identity and the exceptional component set is empty; those useful tests do not become headline results. The eight sorried theorems actually in `Suggested.lean` survived the one-tactic probe; this finding concerns the companion catalogues.

## R11 (P3) — Dependencies and discriminating Checks are not organized per target

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1,327,819,1277`. There is one explicit `*Needs:*` line for the entire document. The title is “McKay correspondence, skew-group algebras, and algebraic Weyl functors”.

**Claim:** The required opening Summary, Scope and ownership, Exact supplier contracts, How to read the build, and layer-ending Examples/Dependencies are absent in the required form. Several definitions have long lists of demands but not their own API and three computed, discriminating Checks. In particular, the Γ-side center lift, comparison functors, and geometric quotient/cluster constructions need their own tests. Broad prose dependency lists cannot distinguish the inputs to each of their theorems.

**Witness:** §§6.1–6.3 contain no `**Checks.**` block; §§7.0–7.4 likewise have none. There are no layer-ending `### Examples` or `### Dependencies` headings. The sole `*Needs:*` is at line 327.

**Repair:** Reorganize the same mathematics into the required headings and attach statement/proof-route dependencies to each target. Give each definition its API and at least three actual computations, not promises to test it. For the center lift, use the matrix-block computation below, a two-block central element, and a noncentral element that fails centrality; for the cluster construction use Γ=1, the C₂ exceptional chart, and its dual-number family. Remove process wording such as “landed native” at line 916. This is documentation repair, not a request to weaken or postpone a layer.

## R12 (P3) — The exceptional invariant target includes an executable search

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1307`. The requirement includes “a terminating finite search space” and repeated demands for coefficient/generation certificates. Line 1339 also asks for iterative curve-addition/termination.

**Claim:** The mathematical invariant presentations and minimal anti-nef cycle are appropriate targets. Commissioning the search/certificate procedure itself conflicts with the roadmap's mathematics-only scope.

**Witness:** The exceptional-family paragraph explicitly uses Reynolds images through the Noether bound as the search space and exact elimination as its verification procedure, rather than merely stating the resulting polynomials and algebra isomorphisms.

**Repair:** State the invariant triples, their polynomial relations, generation/kernel theorems and inverse algebra maps as mathematical targets with locators. Retain Noether/Molien facts as proof inputs and small exact examples as Checks; remove the executable search and certificate deliverable. State the fundamental cycle by effectivity, anti-nefness and minimality, with a mathematical proof route. The Q₈ example `X²=Z(Y²−4Z²)` evaluates to 900=900 and remains a legitimate Check after this change.

## Verified sound

The review covered the five named files at the requested head; there was no previous review to reconcile. The base tree has no `McKaySkewGroup` folder, and the diff outside this folder is empty. I read the repository's normative README and CONTRIBUTING and compared the main-branch DGAInfinity, StablePeriodicCurved and NilpotentOrbits roadmaps before assessing shape. No source passages were copied into the deliverables, no PR files were edited, and no GitHub action was taken.

The worker's gate reports **all checks passing**, including the targeted build. Independently, `lake build TauCetiRoadmap.McKaySkewGroup.Suggested` completed successfully (9001 jobs), and direct `lake env lean` elaboration of the original `Suggested.lean` succeeded with its eight `sorry` warnings and no other diagnostics. This is consistent with R02–R03: the companion modules are outside that import closure. The mechanical supplier check was run with the requested `--depcheck`, `--name McKaySkewGroup`, merge order, and `--movable` options. Its complete output was:

```text
depcheck: 162 roadmaps, 1163 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No declared supplier gaps were present. The citation resolver reported no unresolved roadmap citations; its library-name search was not a substitute for the manual pinned-source checks below.

**Headline inventory and Lean coverage.** The README's end results are: finite-subgroup classification/conjugacy and concrete models; marked affine McKay classification and converse; the integral representation-ring/root-lattice comparison; polynomial and exterior basic-corner identifications; relative quadratic duality/Koszulity; the trace-normalized CBH equivalence; FKS curved Morita/reflection/Weyl comparisons including the corrected Γ realization; and geometric McKay with invariant presentations, resolution, tautological degrees and finite/affine Lie comparisons. The eight main Lean theorems state three classification/conjugacy results, two McKay existence results, and the three corner results. R05–R06 concern missing statable scope. The docstring does name the relative quadratic, curved-category and geometric-resolution carriers it lacks; the companion files cannot bypass those absences with admitted data.

I appended `#check @name` for all **21 named declarations** in `Suggested.lean` to a scratch copy and elaborated it once. The eight theorem signatures retain their finite-group, dimension, faithfulness, determinant, centrality and trace hypotheses where needed. The three algebra-automorphism definitions and their six action/scalar instances retain their field/group/module or `FDRep` inputs; they do not need a finite-group hypothesis merely to extend an action. `IsMcKayLabelling` is a predicate with a real body, not an unspecified Prop field. No silently lost necessary binder was found in these 21 signatures. No PR declaration was changed. Companion signature probes instead expose the failures in R03; I do not certify nonexistent elaborated signatures.

The one-tactic scratch probe tried `rfl`, closing `simp`, and `infer_instance` on each of the **eight** sorried main theorems. None closed. Object searches did not find a single pinned library theorem asserting any of those eight McKay/classification/CBH conclusions. Reading the companion bodies directly identified the projection wrappers and boundary padding in R10. Two further native-carrier probes elaborated without warnings: the Kronecker preprojective algebra and the integral quotient by the marks. The required missing `TauCeti.RepresentationTheory.RepresentationRing.Basic` object was built first; the classifier probe's missing affine positive-semidefinite module was likewise built before diagnosing its unknown identifiers.

**Adversarial computations (77 rows).** These are instance checks, not proofs of general targets. Each row gives the actual values compared. Rows touching invalid companion declarations concern their written mathematical intent; R02–R03 prevent a semantic certification of those Lean declarations. “Retain” means that this computation found no defect, not that unavailable sources or the general theorem have been certified. The table covers all eight main theorems, their 13 supporting definitions/instances, the eight seeded sections, and the mathematical claims touched by findings.

| ID | Statement / definition | Instances tried and values computed on both sides | Result; change |
| --- | --- | --- | --- |
| A01 | `finite_subgroup_SL2_classification` | Orders 1 and 2 give cyclic groups; Q₈ gives `QuaternionGroup 2`, order 8. Irrep degree squares for binary tetrahedral are 1+1+1+4+4+4+9=24; for binary icosahedral, 1+4+4+9+9+16+16+25+36=120. | These family controls agree; retain. Source-based full classification remains partly uncertified. |
| A02 | `finite_subgroup_SL2_conjugate_of_mulEquiv` | For H=K=C₃ in diagonal matrices, g=1 gives `H.map conj(1)=H`; conjugation by `[[0,1],[-1,0]]` swaps diag(ζ,ζ⁻¹) with its inverse, and the subgroup remains C₃. | Both maps give the same subgroup; retain. |
| A03 | `card_eq_48_conjugate` | C₄₈ and `QuaternionGroup 12` both have order 48, but the first is abelian and the second has noncommuting generators. They fail respectively the noncyclic and non-dihedral hypotheses. | Exclusions discriminate correctly; retain. This conditional theorem alone does not construct the octahedral model. |
| A04 | `IsMcKayLabelling` | C₂ has two simples of dimensions (1,1), M=`[[0,2],[2,0]]`; `2I−C=M`. For Γ=1, M=[2], while no valid affine type has one node. | Real predicate admits the double edge and excludes the singleton affine model; retain. |
| A05 | `exists_isMcKayLabelling` | C₃ gives M with diagonal 0 and off-diagonal 1, δ=(1,1,1), and `Mδ=2δ=(2,2,2)`. Q₈ gives four leaves of weight 1 and centre 2: leaf sum 2 and central sum 4. | Dimensions and multiplicities agree; retain. |
| A06 | `exists_isMcKayLabelling_of_valid` | A₁ occurs for C₂ with marks (1,1); D₄ occurs for Q₈ with marks (1,1,1,1,2); E₈ marks (6,3,4,2,5,4,3,2,1) have squared sum 120. | Boundary and exceptional values agree; retain. |
| A07 | `symmetricAlgebraAut` | Sign action sends x to −x, x² to x², and applying it twice sends x to x. A zero vector space has symmetric algebra k and identity action. | Generator and degree-two values distinguish the action; retain. |
| A08 | `exteriorAlgebraAut` | −I on k² sends x,y to −x,−y and x∧y to x∧y; x∧x=0 remains 0. In dimension 0 the algebra is k. | Determinant and exterior relations agree; retain. |
| A09 | `tensorAlgebraAut` | Sign action sends x to −x and the nonzero tensor x⊗x to itself; g² sends every generator to itself. | Does not incorrectly impose x²=0; retain. |
| A10 | `symmetricAlgebraAction` | For C₂, `(1#g)(x#1)=−x#g`, versus `(x#1)(1#g)=x#g`. | Native left-skew multiplication has the stated direction; retain. |
| A11 | `symmetricAlgebraAction_smulCommClass` | g(3x)=−3x and 3g(x)=−3x; g(1)=1. | Scalar action commutes; retain. |
| A12 | `exteriorAlgebraAction` | On Q₈'s defining V, i·x=ix and i·y=−iy, hence i·(x∧y)=x∧y; i² acts as −I on V. | Group law and degree-two action agree; retain. |
| A13 | `exteriorAlgebraAction_smulCommClass` | g(3x∧y)=3x∧y for determinant-one g, equal to 3g(x∧y). | Scalar compatibility agrees; retain. |
| A14 | `tensorAlgebraAction` | For i,j in Q₈, ρ(i)ρ(j)=ρ(ij), while ρ(j)ρ(i)=−ρ(ij). Extension on degree one preserves this noncommutative order. | Detects a reversed action; retain. |
| A15 | `tensorAlgebraAction_smulCommClass` | i·(3x)=3ix=3(i·x); on x⊗y, the scalar 3 is still multiplied once. | Scalar compatibility agrees; retain. |
| A16 | `exists_full_corner_equiv_preprojectiveAlgebra` | For C₃ every group-algebra block has size 1, e=1; graded dimensions on each side are 3,6,9 in degrees 0,1,2. C₂ requires two parallel original arrows, not a simple edge. | C₃ agrees; omitted C₂ repaired by R05. |
| A17 | `exists_full_corner_equiv_zigzag` | C₄: dimension 16=4 vertices+8 arrows+4 volumes. Q₈: basic corner dimension 18=5+8+5, while ΛV⋊Q₈ has dimension 32. Odd C₃ gives the sign product (−1)³=−1≠1. | Morita corner need not preserve dimension; even/binary condition distinguishes the odd-cycle obstruction. |
| A18 | `deformedPreprojectiveAlgebra` | At λ=0 the generating relator is the native preprojective relator. A one-loop vertex gives `[a,a*]=λ`; with no arrows, one vertex and λ=1 the ideal contains 1 and the quotient is the zero ring. | Correct junk/zero-ring behavior; retain definition. |
| A19 | `cbhRelator` | Γ=1 gives `xy−yx−z`; swapping x,y gives `−[x,y]−z`, not `[x,y]−z`. At z=0 the relation is the commutator. | Basis determinant matters; retain real body, repair scaling explanation R01. |
| A20 | `CBHAlgebra` | Γ=1,z=0 gives the commutative polynomial quotient; z=1 gives `[x,y]=1`. The zero relation is not imposed when z=1. | Distinguishes commutative and Weyl cases; retain. |
| A21 | `exists_full_corner_equiv_deformedPreprojectiveAlgebra` | Q₈ scalars f=(1,−1) at leaf/centre give traces λ=(1,−2). A one-copy leaf/centre Γ-module has `Tr(z)=1−2=−1`, whereas every commutator has trace 0. | Trace weighting is necessary; retain. R05 adds the double-edge scope. |
| A22 | Uniform arrow scaling | `[E₁₀,E₀₁]=diag(−1,1)`; `[2E₁₀,2E₀₁]=diag(−4,4)`, not `2 diag(−1,1)`. | Fails; R01. |
| A23 | Weyl finite-dimensional nonexistence | Over 𝔽₂, `[E₀₁,E₁₀]=I₂`, `Tr(I₂)=0`, and dimension is 2. Over characteristic zero trace would give 2≠0. | Missing hypothesis; R04. |
| A24 | Strong Q₈ two-dimensional-simple obstruction | Scalar star weights give E₁₀,E₀₁ and all four matrix units on ℂ². Trace weights require `d_leaf=2d_centre`; total dimension ≤2 forces both 0, leaving only isolated one-dimensional simples. | The stronger abstract-algebra obstruction is sound in this instance; retain in README. |
| A25 | Orientation reversal | Put b=a*, b*=−a. Then `[b,b*]=[a*,−a]=[a,a*]`, including value `diag(−1,1)` on the star matrices. | Parameter stays λ; retain. |
| A26 | Layer 0 pole count | Cyclic rotation C₂: signature (2,2), sum `1/2+1/2=1=2−2/2`. Tetrahedral rotation: (2,3,3), sum `1/2+2/3+2/3=11/6=2−2/12`. | Pole formula agrees; retain. |
| A27 | Dihedral family boundaries | m=1 gives order 4 cyclic C₄, not a new D₃ case; m=2 gives order 8 Q₈ and D₄. Degrees: four 1-dimensional plus m−1 two-dimensional give `4+4(m−1)=4m`. | Boundary exclusion and order agree; retain. |
| A28 | Weighted Cartan norm identity | Q₈, x=1 at centre and 0 at leaves: `xᵀCx=2`; the four edge contributions are each `1·2·(0−1/2)²=1/2`, total 2. | Weight factors are necessary; an unweighted sum gives 1 here, not 2. |
| A29 | Layer 2 radical quotient | C₂: δ=(1,1), `Cδ=(0,0)`, quotient `(a,b)↦b−a`, form `2(b−a)²`. (1,0) maps to −1, (0,1) to 1, δ to 0. | Integral comparison is well-defined and statable; R06. |
| A30 | Layer 2 singleton | Γ=1: M=[2], C=[0], regular vector (1), ℤ/ℤ=0 and descended form 0. | No affine A₀ needed; retain. |
| A31 | Relative duality and Koszul boundary | V=0 gives S=k[Γ] in both degree-zero algebras and no positive terms. For dim V=2, exterior ranks 1,2,1 give Hilbert numerator `(1−t)²`, inverse to Sym Hilbert denominator. | Basic degree/zero controls agree; general relative duality carrier still missing. |
| A32 | Nonmodular hypothesis | For Γ=C₂ over 𝔽₂, group order is 0 in k and `(g−1)²=0`; the group algebra is not semisimple. Over ℂ, 1/2 exists and e±=(1±g)/2 are two orthogonal idempotents. | The standing invertibility condition excludes the modular countermodel. |
| A33 | Odd cyclic exterior corner | For C₃ with V=χ⊕χ⁻¹, reverse products satisfy xy=−yx. Multiplying the three desired rescaling equalities gives 1=−1. Both candidate corner dimensions are 12, so dimension alone does not detect failure. | Retain the signed relation and negative control. |
| A34 | FKS graded differential convention | For odd a and odd d, d(am)=−a d(m); applying d again gives a d²(m), since the two minus signs multiply to +1. For c=0, d²=0. | Parity and curvature agree; retain. |
| A35 | §6.1 full matrix-unit Morita context | A=M₂(ℂ), e=E₁₁: p=(E₁₁,E₂₁), q=(E₁₁,E₁₂), Σpq=E₁₁+E₂₂=I. The inverse multiplication sends E₂₂ to E₂₁⊗E₁₂, whose product is E₂₂. | Both multiplication/inverse tests agree. |
| A36 | §6.1 center lift θ | In the same block, θ(zE₁₁)=zI and e(zI)e=zE₁₁. Taking z=3 gives 3I and 3e; taking z=0 gives 0 both ways. | Correct central lift, not a free parameter correspondence. |
| A37 | §6.1 exclusion of noncentral lift input | Take A=B=M₂(ℂ), e=1, z=E₁₂. θ(z)=E₁₂ and `[E₁₂,E₂₁]=E₁₁−E₂₂≠0`. | The center hypothesis is material; add as a definition Check under R11. |
| A38 | §6.1 two-block center and trace dictionary | A=ℂ×M₂(ℂ), e=(1,E₁₁), z=(1,−E₁₁). θ(z)=(1,−I₂). Block scalars (1,−1), block traces (1,−2). | Distinguishes scalar, primitive-corner and trace coordinates. |
| A39 | §6.1 inverse Wedderburn coefficient | Q₈ central 2-dimensional block has identity coefficient δ²/8=4/8=1/2. A rank-one matrix unit in it has coefficient δ/8=1/4. Thus `(8/2)·(κ/4)=κ`. | The κ extraction factor is correct. |
| A40 | §6.1 curvature coordinates | With κ_a=2, t_a=3: f_a=6 and t_a=f_a/κ_a=3. At δ_a=2 the CBH trace is 12, not 6 or 3. With ζQ=−3, the graph sign gives t=3. | Dictionaries discriminate the three coordinates. |
| A41 | §6.1 tensor differential | For odd p, d_E(p⊗n)=−p⊗d_N n; a second application gives p⊗d_N²n, hence the same +curvature. For even p both signs are +. | Correct sign in both parities. |
| A42 | §6.1 native coinduction comparison | A=M₂, e=E₁₁, p=E₂₁, n=1: Ψ(p⊗1)(E₁₂)=1 and its value at E₁₁ is 0; Σp_jΨ(q_j)=E₂₁. | Explicit inverse returns p; matches Hom inverse, not definitional tensor equality. |
| A43 | §6.1 coinduction differential | Let q and p both be odd and f=Ψ(p⊗n). Df(q)=−d((qp)n)=−(qp)d(n), since qp is even. Ψ(d_E(p⊗n))(q)=−(qp)d(n). | The two signs agree. |
| A44 | §6.1 extension/projective distinction | With c=0 and a projective extension module, e(-) gives a projective corner extension module; on a factorization M→P→N its image is eM→eP→eN. For the identity of P the stable class is 0 on both sides. | Stable-ideal test agrees; it does not assert every homotopy-null map has this factorization. |
| A45 | §6.2 transported kernel sign | p odd, kernel element k: D gives −p⊗d_Kk⊗q; D² gives +p⊗d_K²k⊗q. The shift identification adds a second −, so the displayed unshifted Δ component is +. | Sign cancellations agree. |
| A46 | §6.2 both duplex square components | Write D(v,w)=(−t μw,Δv). Then D²(v,w)=(−t μΔv,−t Δμw). At t=0 both entries are 0; the second equation is not implied merely by evaluating the first at 1. | Correct two-component requirement; retain, without a zero-parameter equivalence claim. |
| A47 | §6.2 crossed right action | `((α⊗T⊗β)g)h` has matrix Tρ(g)ρ(h)=Tρ(gh) and last factor h⁻¹g⁻¹β=(gh)⁻¹β. Replacing γ⁻¹β by γβ reverses the required order for i,j∈Q₈. | Right action law has the correct inverse. |
| A48 | §6.2 Fourier multiplication μ | Q₈, T=E₁₁, α=β=1: the identity group coefficient is `(2/8)Tr(T)=1/4`, the coefficient of the actual primitive matrix idempotent. Omitting δ gives 1/8. | Normalization is necessary. |
| A49 | §6.2 Frobenius trace transport | A=M₂(B), e=E₁₁: τ_A(diag(b₁,b₂))=τ_B(b₁)+τ_B(b₂); on eAe only b₁ remains. For B=ℂ and E₁₂,E₂₁, both cyclic products have trace 1. | Trace restricts correctly and is cyclic in this model. |
| A50 | §6.2 ordinary adjoint pairing | A=M₂(ℂ), ε=1, u=E₂₁⊗E₁₂, v=E₂₂: τ(μ(u)v)=1; the E₂₁⊗E₁₂ component of Δ(v) pairs with u to 1. With ε=−1, Δ is negated and the two negatives still give 1. | Pairing/colour factor is consistent. |
| A51 | §6.2 restriction projection | For D(v,w)=(−tμw,Δv), projection gives −tμw after D, whereas forgetting differential leaves projection(v,w)=v. At t=2, μw=1 gives −2, so projection need not be a chain map. | README correctly claims only the underlying stable A-module map. |
| A52 | §6.2 framed comparison | For an invertible stable comparison β:R'→R and framing u:W→R, transported framing is β⁻¹u; then β(β⁻¹u)=u. Using βu has the wrong source. | Direction is correct; full braid/framing coherence remains a construction target. |
| A53 | §6.3 raw endpoint composites | Q₈, a=trivial, b=V: φ_ab(v)=v⊗1, φ_ba(1)=y⊗x−x⊗y. Wedge composites are Ω id_V and −2Ω id_ℂ. | Raw scalar antisymmetry fails; README's obstruction is correct. |
| A54 | §6.3 weighted normalization | Dimensions δ_b=2, δ_a=1 turn (1,−2) into (2,−2); scaling the reverse map by 1/2 gives scalars (1/2,−1) and weighted values (1,−1). | Correct repair of the source's ordinary-scalar equation. |
| A55 | §6.3 coordinate change and inverse | c=1,x=5,δ_b=2,s_ab=2,s_ba=3: ĉ=6, ε̂=12, x̂=5/2, ŷ=30=2·3·5. Inverse gives x=5 and y=5. | Both equations and both inverses agree. These arbitrary rescalings test the dictionary before imposing colour normalization. |
| A56 | §6.3 square and moment signs | Set both multiplicity maps of the Q₈ edge to 1. The wedge square has values +Ω on V and −2Ω on ℂ; d² has values −Ω and +2Ω. Thus f=(−1,2), λCBH=(−2,2), λmom=(2,−2). | The displayed minus sign and endpoint dimensions agree. |
| A57 | §6.3 arrow support | φ_ab has domain ρ_b but corresponds to a corner element in e_bA₁e_a. Its backtrack with the reverse lies in e_bA₂e_b: left and right multiplication by e_b leave it fixed, by e_a kill it when a≠b. | Coefficient maps and left arrows must not be silently identified; README keeps them distinct. |
| A58 | §6.3 volume change | r_ab=2,r_ba=3,κ_b=5 gives κ̂_b=30; t_b=6 gives t̂_b=1, and κ_b t_b=30=κ̂_b t̂_b. | Central curvature is unchanged; retain. |
| A59 | §6.3 reflected scalars | t_a=2,t_i=3 at adjacent i: s_a gives (−2,5), and applying it twice returns (2,3). For κ_a=2,κ_i=3, f=(4,9) goes to (−4,15) by the stated κ ratio. | Reflection and diagonal conjugation agree. |
| A60 | §6.3 bilinear adjoint | In one dimension M=3,G_A=2,G_U=4: D=3/2. Pairings scaled by α=2,β=4 give D'=3/4=(α/β)D. | Confirms transpose formula and factor α/β. |
| A61 | §6.3 diagonal kernel comparison | μ=3,Δ=3/2,t=2,r=1/2. D(v,w)=(−6w,3v/2), new D'(v,w)=(−12w,3v/4). For C(v,w)=(v,w/2), CD=D'C=(−6w,3v/4). | Both matrix entries intertwine; scaling only Δ would fail. |
| A62 | §7.0 contragredient coordinates | s sends points (x,y) to (y,−x), so s·x=−y and s·y=x. At point (1,2), (s·x)(1,2)=−2=x(s⁻¹(1,2)). | Inverse and coordinate directions agree. |
| A63 | §7.0 free locus and excluded origin | C₂: orbit of (1,0) is {(1,0),(−1,0)}, size 2; origin orbit has size 1. Fiber ring at origin is ℂ[x,y]/(x²,xy,y²), dimension 3; generic fiber degree is 2. | Correctly restricts flat/étale claims to the free locus. |
| A64 | §7.0 trivial quotient and conjugation | Γ=1 gives invariants ℂ[x,y] and q=id. For T=diag(2,1), pullback x↦2x,y↦y, inverse x↦x/2; composition fixes x,y. | Actual maps and inverse equations have the right domains. |
| A65 | §7.1 cyclic presentations | n=1: X=x,Y=y,Z=xy and XY−Z=0; eliminate Z to get ℂ[x,y]. n=2: X=x²,Y=y²,Z=xy and XY−Z²=0. n=3: at x=1,y=2, XY=8=Z³. | Includes smooth and double-edge boundaries; retain. |
| A66 | §7.1 dihedral invariant relation | m=2,x=1,y=2: A=1,B=16,w=2,Y=17,Z=4,X=−30. Then X²=900=4(289−4·16). Under s, A,B swap and w changes sign, so X,Y,Z are fixed. | Relation and chosen coordinate model agree. |
| A67 | §7.1 exceptional degree constraints | E₆ weighted degrees (X,Y,Z)=(12,8,6) give 24=24=24; E₇ (18,12,8) give 36=36=36; E₈ (30,20,12) give 60=60=60. | Homogeneity agrees; degree lists alone do not certify polynomials, generation or inverse maps. R08/R12. |
| A68 | §7.2 transported resolution | C₂ gives A₁, exceptional P¹ with normal bundle O(−2), so self-intersection −2. Γ=1 gives π=id, zero exceptional components and zero lattice. | Boundary values agree with the cited finite surface contract. |
| A69 | §7.3 cluster family, including nonreduced tests | On the C₂ chart, ideal (y−ux,x²−v) has quotient basis (1,x), regular multiplicities (1,1). Over ℂ[ε]/ε², v=ε still gives a free rank-2 quotient. The reduced point quotient has rank 1 and fails. | Distinguishes families from complex-point sets; retain. |
| A70 | §7.3 positive tautological degree | On the other chart x=ty, the odd basis is y; on overlap y=ux. The quotient line has transition y=ux and degree +1; its dual has degree −1. The invariant line has degree 0. | Fixes the HomΓ/universal quotient convention; a dual convention fails the claimed positive delta. |
| A71 | §7.3 lattice/intersection and cycle | C₂: [triv]↦−E, [sign]↦E, regular↦0; E²=−2, so minus intersection is +2. Every nonzero effective cycle is mE, m≥1, with intersection −2m≤0; the minimum is E. | Root-lattice and fundamental-cycle values agree. |
| A72 | §7.3 finite D₄ highest-root cycle | Delete one affine leaf of the Q₈ star. Remaining leaf coefficients are (1,1,1), centre 2. Cartan product is 0 on leaves and 1 at centre; intersection is therefore 0 on leaves and −1 at centre. | Anti-nef cycle is the expected highest-root cycle; it is not the deleted trivial component. |
| A73 | §7.3 ordinary K₀ boundary | Universal regular bundle for C₂ has rank 2; for Q₈ it has rank 8=4·1+2·2. Zero K₀ class would have rank 0. | README correctly refuses to kill it in ordinary K₀. |
| A74 | §7.4 finite versus affine Lie data | Finite A₁ Cartan [2] has determinant 2 and gives sl₂ of dimension 3. Affine A₁ has matrix `[[2,−2],[−2,2]]`, rank 1, and full Cartan realization dimension 2·2−1=3, not rank 1. | Finite Geck and full affine realizations remain distinct. |
| A75 | §7.4 zero and non-unimodular controls | Γ=1 has zero finite root lattice and zero Lie algebra, not a simple rank-zero algebra. The A₁ root lattice has Gram determinant 2, so its integral dual has index 2. | Correctly avoids simplicity/unimodularity overclaims. |
| A76 | Companion admitted construction test | Intended C₂ `clusterScheme` must represent the rank-2 dual-number family in A69; `Spec ℂ` has only the unique structure morphism from any affine ℂ-test scheme and cannot distinguish u=0 from u=1 clusters. | The laws must determine the actual construction; admitted data are not an acceptance test (R02–R03). |
| A77 | Companion boundary/projection wrappers | Γ=1 gives projection id=id by unfolding; empty exceptional set has cardinality 0 and its cycle is the unique empty function. | Correct small values, but delete their acceptance declarations (R10). |

**Pinned library audit.** The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened the following definitions/laws, rather than relying on current online API names:

| Pinned file and line | Declaration / content checked | Consequence for this review |
| --- | --- | --- |
| `Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean:39,742,779,1042` and `Mathlib/Algebra/SkewMonoidAlgebra/Lift.lean:30` | Native carrier, `liftNCRingHom`, ring structure, `single_mul_single`, `liftNCAlgHom` | R07; the left-skew product needs no new foundational carrier. |
| `Mathlib/RepresentationTheory/Character.lean:177,245` | `FDRep.char_tensor`, `FDRep.char_orthonormal` | The sole explicit Needs line cites actual declarations; the finite complex setting supplies the character hypotheses. |
| `TauCeti/RepresentationTheory/Simple/Basic.lean:142,188,196,202` | Simple/irreducible bridge; quotient `SimpleFDRepClasses`, `mk`, and its isomorphism criterion | The labelling uses classes of actual simple finite-dimensional representations. It is not a chosen free index set. |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:135,154,177,368,500,519,658` | Nodes, Valid, IsGraphical, Cartan matrix, marks, affine node, `Cδ=0` | A₁ is valid but not graphical; its double edge is recorded in the matrix. IsGraphical alone is not Valid. |
| `TauCeti/RepresentationTheory/Quiver/Preprojective/Basic.lean:115,515,597,716` | Doubled vertex idempotent, preprojective ideal, algebra and lift | Native construction takes quivers with parallel arrows; R05's repair does not need another path algebra. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Relations.lean:99,103,278,300` | Quadratic/full zigzag ideals, redundancy with graph hypotheses, `nonisolatedZigzagQuotient` | Ordinary simple-graph quotient must retain its graph restrictions; no C₂ ordinary-graph claim was demanded. |
| `TauCeti/RingTheory/Idempotents/Corner.lean:56,64,70,162` | Corner map/submodule, membership `exe=x`, algebra instance | Main headlines use a real corner algebra. |
| `TauCeti/RingTheory/Morita/Corner.lean:183,192,205,388,410` | Restriction to eM, native coinduction through `Hom_eAe(eA,N)`, full-idempotent equivalence and inverse | §6.1's tensor/coinduction comparison is necessary; native inverse is not literally Ae⊗N. |
| `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean:106,127` | `repRing` is `SplitK0 (FDRep k G)`; character ring homomorphism | The carrier exists, including the actual tensor product. Semisimplicity is needed to identify split/exact K₀, not to define the carrier. |
| `TauCeti/CategoryTheory/GrothendieckGroup/Monoidal/Basic.lean:179` | `SplitK0.of_mul_of` | The generic class-of-tensor rule is supplied, while the specific McKay/root comparison is new. |
| `TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:51,60,66,73,85` | Finite-group invariant projection: integrality, surjectivity, finiteness under finite type, prime-orbit fibers | These are not global flatness or arbitrary-target quotient theorems. The origin fiber in A63 matters. |
| `Mathlib/LinearAlgebra/RootSystem/GeckConstruction/Basis.lean:45,50,105,109,125` | Reduced crystallographic irreducible root-system hypotheses, basis, root equivalence, simplicity, Lie equivalence | Over ℂ these apply to nonempty finite ADE data. The right-inverse Lie theorem needs a finite-dimensional simple Lie algebra; it is not a construction from a singular affine matrix. |
| `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/LieAlgebra/RootSystem.lean:59,66,77,91` | `rationalRootSystemEquiv` and simple-root/inverse-coroot coordinates | §7.4 can consume the pinned comparison rather than commission a second Lie-existence theorem. |

These are **13 library audit entries**. The general claims that some relative/curved/geometric carriers are missing were also searched by object in the pins; I found no native relative quadratic-dual or FKS curved-duplex/minimal-surface-resolution carrier that would justify the admitted companion constructions. A source file existing in Tau Ceti but lacking an object file was not treated as a missing API.

**Supplier and ownership audit.** Main-branch context was `2b363a2b5643eed47f0cf2ed7ffcc85141b79af4`. I used the roadmap `grep`, `show` and `resolve` tools, searched the board's package README/plan files, and inspected relevant supplied open heads. Queries included skew groups, McKay, curved Morita, relative quadratic duals and faithful tensor powers. No duplicate fully qualified name of the 21 main acceptance declarations was found in the searched roadmap files. This does not make the stale companion names valid.

The following **17 supplier groups** were resolved. Existing-roadmap revision heads were not substituted for main; KacMoody is a permitted new open roadmap.

| Supplier and resolved location | Consumed object and boundary |
| --- | --- |
| `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:221,241` | Irreducible/Wedderburn indexing, central idempotents, completeness and sum of squares. The main text does not supply the sharp faithful-tensor-power theorem as a named target; the proof in McKay Layer 1 must remain owned here rather than cite a pending revision as a supplier. |
| `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:205,226` | Normalized averaging and unitarization, with actual positive Gram operator. |
| `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:175,200` | Classical matrix-group defining representations and their tensor/symmetric/exterior constructions. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:321,356` | Finite Cartan classification and integral root data. |
| `TauCetiRoadmap/ReductiveGroups/README.md:1125` (§9A.1a) | Integral ADE norm-shell/root-coordinate comparison; not the finite-group McKay theorem. |
| `TauCetiRoadmap/ZigzagPreprojective/README.md:205` (Layer 0 and later algebra layers) | Affine matrices/marks/deletion, ordinary and skew zigzag/preprojective relations. It explicitly leaves the representation-theoretic comparison to McKay. |
| `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:206,229,270` | Path algebras, representation/module comparison, idempotents/projectives and basic-algebra Morita theory. |
| `TauCetiRoadmap/DGAInfinity/README.md:629` (Layer 11) | Generic relative quadratic/Koszul framework over a finite-dimensional separable semisimple base, with right-module/right-dual conventions. McKay's S=k[Γ] specialization and explicit left/right bridge are distinct. |
| `TauCetiRoadmap/GrothendieckEulerForms/README.md:283,313` | Graded projective resolutions and the definition of linearity. It assigns the duality theorems to the DG/zigzag owners. |
| `TauCetiRoadmap/StablePeriodicCurved/README.md` (scope and curved/stable layers) | Morphism ideals, factor-through quotients, right curved modules. The left superlinear algebra-valued FKS adaptation is new here. Changing to the graded opposite negates an odd square, explaining the stated −c bridge. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:479` | Actual SU₂→SO₃ double cover, kernel {±1}; no need to reconstruct the generic covering theory. |
| `TauCetiRoadmap/NilpotentOrbits/README.md:417,481` (N8 and scope boundary) | ADE hypersurfaces/resolutions, completed-local slice comparisons and exceptional intersections. The owner explicitly excludes geometric McKay; §7.2's transport is a consumer construction. |
| `TauCetiRoadmap/ReflectionInvariantTheory/README.md:7` (§1) | Contragredient polynomial action, Reynolds/Molien/Noether inputs. It does not deliver McKay's exceptional invariant triples. |
| `TauCetiRoadmap/GroebnerGeometry/README.md:63` (G1) | Ideal, normal-form and elimination facts. R12 concerns this roadmap's computational deliverable, not reassignment of the supplier. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2624,5706,6567,6653,6701,6987` | §§1.17,4.14,5.1–5.3,5.7 resolve. Hilbert/Quot is over a Noetherian base and projective ambient scheme; P²/ℂ meets that. The affine support-open/Γ-cluster charts remain McKay's work. §1.17 expressly does not supply a general torsor construction. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215,228,254` (L0A–C) | Tensor/Hom, finite local freeness, arbitrary pullback for finite locally free sources, determinants and affine finite-projective comparison. It does not supply the irrep/exceptional-curve degree pairing. |
| `TauCetiRoadmap/KacMoody/README.md:21,31` (KM0–KM1, supplied open head) | Full singular Cartan realization and affine central/degree/loop comparison. Its affine A₁ realization has the dimension checked in A74. |

Open-work object checks also inspected QuiverRepresentationsPartII's scope (multisegment/commuting-operator continuation), HopfologicalAlgebra's Hopf-relative stable categories, and K3SurfacesAndSymplecticBoundedness's local quotient input. The latter names McKay as supplier; it does not own the constructions here. The same K3 contract is the relevant board-package hit. No ownership move to a later supplier is proposed. The specific duplication found is R07. The general FKS comparison belongs here because its left curved, corner-normalized construction is beyond the named generic stable/DG inputs; geometric McKay belongs here because the surface owner supplies the resolution and excludes the representation labels.

**Seeded source verification.** No locator was explicitly marked unverified in the README (the phrase “unverified drawing” is not a locator). All eight requested seeded targets were examined. Source-service fetches were attempted for all twelve cited works, including the four inline works absent from the references list. Five works were readable for this review: Ste85, HK01 corrected v2, FKS05 arXiv v1, Tikaradze's 2022 preprint, and the author's Conze paper. For the Conze scan, the service cached the legal author PDF but could not extract it; the legal PDF's web text supplied the passage. The line numbers for that work below are explicitly the web PDF extraction, not a nonexistent cache extraction.

| Seeded target | Text/locator actually read | What the source supports, and limit |
| --- | --- | --- |
| §6.1 actual Γ-side curved Morita comparison | FKS05 lines 1124–1170, preprint pp.29–30, §§8.1–8.3; lines 745–807, pp.20–21, §6; native corner source above | Finite binary Γ, exterior grading, graph/Γ Morita context and the graph curvature convention. The explicit dual-basis, coinduction and center-lift formulas are this roadmap's construction and were checked in A35–A44; they are not all stated verbatim as one FKS theorem. |
| §6.2 Γ kernel/crossed actions/functor comparison | FKS05 lines 1381–1408, preprint pp.36–37, §9.3; graph §6 lines 745–807; nonzero reflection propositions near lines 846,910,922 | Source-shaped exterior/endomorphism kernel and algebraic reflection output. The inspected §9.3 display names an adjoint without specifying its pairings on those pages. The roadmap defines a particular bilinear adjoint instead; A45–A52 check its stated convention. No inference that all pairings are absent elsewhere is made. |
| §6.3 endpoint-weighted realization | FKS05 lines 1159–1170, preprint p.30, §8.3; the raw intertwiners/epsilon display | The source's ordinary-scalar reverse-edge assertion fails the Q₈ computation. The roadmap's weighted correction is independently supported by rectangular trace cyclicity and A53–A61. This is a corrected comparison target, not a claim that the raw display proves it. The bibliography's §§8.1–8.2 locator misses this display (R08). |
| §7.0 quotient/conjugation maps | Native invariant quotient source; ReflectionInvariantTheory §1; SchemeAndStackFoundations §1.17 | These support the stated generic action/finite-quotient inputs with their hypotheses. The specific free-locus torsor/conjugation theorem needs its own exact locator or a clearly scoped construction route (R08); A62–A64 verify directions and the excluded origin. |
| §7.1 all-family invariant presentations | Ste85 lines 187–210, printed pp.591–592, geometric discussion; NilpotentOrbits N8 and invariant-theory suppliers | Steinberg records the geometric type correspondence, not the actual three exceptional invariant triples and their inverse algebra maps. Cyclic/dihedral formulas were recomputed in A65–A66. All-family presentations cannot be source-certified from a degree list (A67, R08). |
| §7.2 resolution transport | NilpotentOrbits N8, lines 417–447; its exclusion at 481 | The named surface owner really supplies the particular resolutions and exceptional lattice. Transport through an algebra isomorphism is sound. A completed-local slice comparison is not a global polynomial slice isomorphism, as the README correctly says. A68 checks the boundary cases. |
| §7.3 actual geometric representation labels | SchemeAndStackFoundations §4.14 and AlgebraicVectorBundles L0; Ste85 lines 187–210 | Generic representability and sheaf operations are supplied. These locators do not certify chart exhaustion, positive tautological delta degrees or the full label comparison. A69–A73 check the C₂/Q₈ conventions; R08 requests primary locators for the general claims. |
| §7.4 Lie/source-diagram comparison | Mathlib Geck Basis lines 45–125; Tau Ceti rational root comparison; KacMoody KM0–KM1 | The finite reduced/crystallographic/irreducible and characteristic-zero hypotheses are present in the native theorem. Affine singular data use their own full realization. A74–A75 distinguish those cases. |

Additional source checks: HK01 corrected arXiv v2, lines 545–635 (preprint pp.12–14), supports the skew product, Koszul proposition 13, duality corollary 3, symmetry hypotheses in proposition 14, and binary/cyclic corner statements in propositions 16–17 and relation (42). In particular the even-dimensional symmetry result needs central −I; the roadmap's odd cyclic exception is material. Ste85 lines 45–75 (printed p.588) gives the symmetric dimension equation and nontrivial/C₂ boundary; lines 100–123 (pp.589–590) give finite-root deletion/highest-root data. Tikaradze lines 118–137 (preprint pp.3–4, §2) uses the commutator deformation and the dimension-weighted coordinates. CBConze ([author’s PDF](https://www.math.uni-bielefeld.de/~wcrawley/preproj2.pdf)) lines 194–202 of the web PDF extraction (printed p.3, before Theorem 0.9) explicitly use traces on irreducibles to identify the parameter. That supports the trace normalization but is not a substitute for opening CBH98 Theorem 0.1 itself.

## Not verifiable

- **CBH98**, Theorem 0.1 and §§3–4: the source-service DOI route reached the Project Euclid landing page without a readable PDF; the author page pointed to the same publication. I did not certify the original theorem's exact numbering/hypotheses from its text. The Conze and Tikaradze passages independently confirm the trace-coordinate issue only.
- **McK80**, Props.1–2, pp.183–186: the DOI resolved to the AMS volume landing page rather than a legal readable individual text. Steinberg supplied readable corroborating mathematics, but not a check of McKay's numbered propositions.
- **CS03**, §6.5: source-service title search did not produce a legal readable book text. The exact quaternion-coordinate classification locator remains unchecked.
- **CL18**, §§2–4, especially §2.1 and Theorems 1–2: the source-service DOI lookup encountered Crossref HTTP 429 and MDPI HTTP 403. No theorem text was read and no contents were inferred from the title.
- **Isaacs**, Character Theory of Finite Groups, Theorem 4.3: no readable legal text returned by the service. The finite faithful-tensor route's exact book locator remains unchecked.
- **Springer**, Invariant Theory, LNM 585, §4.4, and **CBK22**, Introduction/§§2–3: the service classified these publication routes as paywalled/uncertified. They are retained as locator-only citations and are not renewed missing-text requests.
- **FKS05 journal pagination/version:** the arXiv v1 text was read. The claimed journal-page correspondences and equality of the journal's displays to the preprint were not independently checked. Source conclusions above explicitly identify the version read.
- **General geometric McKay source certification:** §§7.1–7.3 lack precise primary locators for their new conclusions. Their suppliers were resolved and small cases were computed, but those do not verify the full Γ-Hilb/tautological-degree theorem. See R08.
- **Companion Lean signatures:** classification and CBH copies fail before they provide a trustworthy interface; the geometric copy fails at its classification import. Their written mathematical requirements were inspected, but every sorried companion theorem cannot be certified as a well-typed proposition at this head. See R02–R03. No claim of a complete formal truth check is made.

The missing-text requests were consolidated in `needs-references.toml` in the review scratch artifacts. Resolved Steinberg/Conze requests were removed after the legal texts became readable. No roadmap source manifest was edited. Review work is complete to these stated limits; it is not contingent on obtaining text before reporting the independently witnessed defects.

## Source issues

- **Error** in FKS05 at arXiv math/0311485v1, §8.3, printed p.30 (lines 1168–1170): the source says reverse-edge ordered wedge-composite scalars are antisymmetric; it should be their endpoint-dimension-weighted scalars that are antisymmetric; affects a stated result.
