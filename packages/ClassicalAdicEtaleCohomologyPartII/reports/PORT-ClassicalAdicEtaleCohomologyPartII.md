# Port report: ClassicalAdicEtaleCohomologyPartII

Branch: `roadmap/classical-adic-etale-cohomology-part-ii`.
Head commit: eaeba489ced38aa5199bfa4da625a5ef6454c6fb.
Starting tree: clean, at `a8132fb`.

The committed content is exactly `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md`, `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/Suggested.lean` and `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/metadata.toml`. The top-level roadmap list, manifest and toolchain are unchanged. The package was treated as read-only except for this requested report. No push, pull-request operation or external message was performed.

## Draft pull request body

Build integral Faltings traces and almost Poincaré duality on admissible formal models, then deduce mod-p, finite p-power, integral and rational Poincaré duality for smooth proper rigid spaces. Product-polystable root calculations and descent through finite wild quotients provide the local theory; affinoid constructible algebraization and proper descent yield Zariski-constructible proper pushforward and proper base change for every torsion exponent, including the residue prime. This extends ClassicalAdicEtaleCohomology beyond its normalized analytic trace and prime-to-residue duality.

AI assistance: Codex (GPT-6) ported the accepted package, checked the mathematics and supplier boundaries, and validated the acceptance module.

## Validation

Exact build outcome line:

```text
Build completed successfully (8976 jobs).
```

Warning count: **1**, solely the intended “declaration uses `sorry`” warning on `monomial_root_duality`. The module has four supporting declarations with real bodies and one admitted headline. No background Lean process remains.

Exact gate summary:

```text
gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean committed tree: before committing, every content and dependency counter was zero and only `dirty` failed. Its final run above is on the committed tree. No gate rule or configuration was changed.

The prescribed movable dependency check returned exit 0:

```text
depcheck: 55 roadmaps, 630 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The final citation resolver returned no missing cross-roadmap citation or Lean name against main `a8132fb` and 366 indexed open roadmap pull requests (index of 2026-10-25T17:16:58Z). The initial index named main `bbed953`; all eight cited suppliers present in this worktree were also compared directly, and their README contents agree with both service snapshots. All eighteen available supplier documents were fetched again after the index refresh and were unchanged. The resolver explicitly did not check pinned library names on its service host, so those names were checked locally at the actual pins instead.

Metadata matches the main-folder convention, with `topic = "math.AG"`. The README retains 54 numbered targets, seven layers, exact supplier contracts, all API lists, layer Examples and Dependencies, worked examples and references. Every target has at least three Check bullets; the final total is 180, plus six convention Checks. Layer 6 is absent because the proper smooth local-system theorem belongs to HodgeTateAndCanonicalSubgroups §7.6.

## Signature comparison and headline coverage

A scratch file imported the built acceptance module and elaborated `#check @name` for every declaration. Exit 0, no diagnostics. Each elaborated type was compared with §3.7 of the README:

| Declaration | Elaborated domain and essential conclusion | Comparison |
| --- | --- | --- |
| `monomialRootAlgebra` | ℕ → ℕ → Type; the quotient over ZMod p with n+1 variables | Matches all natural p,n, including p=0 and p=1. |
| `monomialRootAlgebraCharP` | ∀ p n, CharP (monomialRootAlgebra p n) p | Matches the evaluation-at-zero retraction and the full definition domain. |
| `monomialClass` | ∀ p n, (Fin (n+1) → ℕ) → monomialRootAlgebra p n | Matches the product of quotient-coordinate powers. |
| `monomialRootModule` | ∀ p n m, [Fact (Nat.Prime p)] → ModuleCat (monomialRootAlgebra p n) | Prime binder survives; its action is a·x=a^(p^m)x. |
| `monomial_root_duality` | ∀ p n m, [Fact (Nat.Prime p)], an A-linear monomial projection, a bijective multiplication adjoint, and Subsingleton Ext in each k>0 | Matches the exact formula, Frobenius-restricted carrier and higher Ext assertion. |

No section binder was lost and no signature changed. `Suggested.lean` and `metadata.toml` are byte-for-byte identical to the accepted package. The sixteen geometric headline groups and their missing carriers remain individually identified in the module docstring: formal canonical duality; integral Faltings traces; integral product-root duality; polystable local duality; wild descent; global almost duality; geometric mod-p duality; finite local-system duality; finite p-power duality; integral duality; rational duality; affinoid algebraization; constructible proper pushforward; proper field-extension invariance; all-torsion proper base change; and the big-site constant cohomology sheaf. The characteristic-p root theorem is stated on native carriers, without replacing any of these geometric statements by a stand-in.

Nothing moved from Lean to README. No headline was deleted, weakened or replaced. The four real supporting declarations are needed to state the root theorem. No padding, API lemma, sorry'd data or computational example was added to Lean.

## Upstream mathematical reread and port changes

The full target README was read as a mathematical specification, including all proof routes, API bullets, Checks and worked examples. The following changes were made relative to `packages/ClassicalAdicEtaleCohomologyPartII/README.md`:

1. **Corrected the AInf supplier parameter domain.** AInfCohomology §AI.6.1 states the CK application with parameter `p^q`, q positive rational, and compatible fixed roots. Calling this a “cyclotomic parameter” did not identify that domain correctly. Scope and the exact contract now give the actual parameter. The product-block theorem still permits every nonzero parameter, including units.
2. **Clarified uniformization's auxiliary models.** The reduced quasiprojective residue-fibre conclusion applies to the auxiliary presentation models. It cannot impose that property on an arbitrary original smooth-generic model. The contract now distinguishes them, in accordance with Z Theorem 4.4.1, pp.66–67, Z line 3188. For example t²=ϖ has nonreduced residue even though its generic fibre is smooth.
3. **Disambiguated the projection API in §3.6.** The integral projection fixes R⁺ and the characteristic-p projection fixes A. The common API now says each projection fixes its own base ring, rather than calling the characteristic-p map the identity on R⁺.
4. **Made a coefficient hypothesis explicit in §7.5.** The exponent a in ℤ/pᵃ is now explicitly a≥1, matching the finite p-power convention.
5. **Added a genuine n=2 test in §3.7.** The triple crossing has seven root summands at p=2,m=1. Its pairing has nonunit diagonal values generating the appropriate dual ideals; it must not be mistaken for a free-module pairing with a unit determinant. The explicit values are recorded below.
6. **Resolved the flagged parent signature.** `AdicSpace.henselianComparison_bijective_of_spec` is not a pinned library declaration, but it is explicitly assigned by ClassicalAdicEtaleCohomology §2.5, target sheaf-comparison-3-2-9. The supplier sentence now calls it that target's signature. No import or local restatement was introduced.
7. **Resolved the H locator.** The published primary PDF was accessible. H line 802, Proposition 2.18 and its proof, p.279, states the constant higher direct-image sheaf on the big smooth rigid étale site and derives it from proper base change. The README now supplies that exact line locator and removes the process label “uncertified”; the read-only package source manifest was not altered. This is a sheaf statement: for a point Z and Y=ℙ¹, R²g_*Λ=0 although H²(Z×Y,Λ)=Λ(−1).

Trailing whitespace on three inherited Check bullets was also removed.

The accepted review has no outstanding non-blocking findings. Its fourteen conditional supplier contracts are retained, with the auxiliary-model clarification above. Its historical description of an empty acceptance file was not used as a substitute for inspecting and elaborating the actual five-declaration package file.

## Suppliers, ownership and duplication

The library pins were verified directly: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned declaration or object | File and line inspected; mathematical boundary |
| --- | --- |
| `LinearMap.IsPerfPair` | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean`, line 39: bijectivity of both adjoints, without a finite-dimensionality or projectivity axiom. |
| `Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean`, line 73: vectors fixed by every group element, without a group-finiteness assumption. |
| `iterateFrobenius` | `Mathlib/Algebra/CharP/Lemmas.lean`, line 327: x↦x^(p^m), under exponential-characteristic hypotheses. |
| `ModuleCat.restrictScalars` | `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`, line 85: r·x=f(r)x, not the untwisted action. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`, line 118: derived Ext on the actual ModuleCat objects. |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `Mathlib/AlgebraicGeometry/Sites/Etale.lean`, line 50: a scheme site, not a rigid site. |
| `Representation.exists_common_fixed_vector_of_isPGroup`, `Representation.invariants_ne_bot_of_isPGroup` | `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean`, lines 151 and 158: nonzero finite-dimensional representation, field of exponential characteristic p, p-group; no group-finiteness hypothesis. |
| `TauCeti.AdicSpace` | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean`, line 243: full subcategory of sheafy locally affinoid pre-adic spaces. No rigid site or almost-coefficient category is part of this definition. |

`MvPolynomial`, `Ideal.span`, `Ideal.Quotient.mk`, the native module and derived-category carriers are used directly. Object searches at these pins found no monomial-hypersurface Frobenius self-duality, rigid Faltings trace, almost-coherent formal specialization, or Zariski-constructible rigid proper-base-change theorem replacing the targets. The Frobenius pairings on dual numbers and the finite-free symmetric algebra results have different carriers and do not imply the singular root-module theorem. Web searches of Mathlib pull requests and the Lean Zulip archive found no relevant design replacing the chosen native quotient/restriction-of-scalars interface; this search is not a claim of exhaustive absence of unpublished work.

Cross-roadmap contracts were resolved against the actual main files or indexed new-roadmap heads, then their relevant passages were read. Open revisions of existing main roadmaps were not substituted for main. The following inventory records the exact consumed sections, including the parent signatures:

| Supplier | Sections and boundary verified |
| --- | --- |
| PerfectoidSpaces | P0.1–P0.13, P0.29: flat idempotent almost setup, adjoints, tensor–Hom, finiteness and sheaves; P3.11–P3.22: purity and acyclicity; P5.9–P5.13.4: finite-stage descent; P6.5–P6.7, P6.15–P6.16: towers and continuous functions. The same almost ideal and the specified cutoff are retained. |
| AdicSpacesPartII | R0–R1, R0.19–R0.20: complete affinoids, differential and morphism theory, analytification, spectral/tilde limits with plus rings. |
| AdicSpacesPartIII | F0.6–F0.8, R2.2–R2.8, R3.1–R3.8: formal geometry, models, completion, coherent operations, GAGA and finite coefficient trace. The five precise valuation/formal extensions are retained as conditional contracts rather than claimed implemented. |
| AdicSpacesPartIIPartII | RZ.0–RZ.2, RZ.4–RZ.5 in `packages/AdicSpacesPartIIPartII/design/README.md`: Zariski geometry, normalization, smooth loci, weakly Shilov points and rigid resolution. This earlier package is available on the board although the service has no indexed main/open folder for it. The two additional branched-cover/generic-smoothness contracts remain explicit. |
| RigidAnalyticGeometry | §§1.1–1.2: noetherianity and excellence of classical affinoids. |
| ResolutionOfSingularitiesCharacteristicZero | §§7.5, 7.8: reduced quasi-excellent characteristic-zero scheme resolution, including finite-type schemes over an affinoid algebra, preserving the full regular locus. This is distinct from rigid resolution. |
| SchemeAndStackFoundations | §§0.6, 0.8–0.9, 0.21, 2.18–2.21: reflexivity, finite presentation, excellence, DQCoh and coherent duality; universally coherent valuation-base upper shriek, its amplitude and canonical reflexivity remain the three stated extensions. |
| AdicCoefficientsAndComparisons | L2/fp-compactification-limit (`fpCompactificationLimit`) and L2/fp-strict-cofiltered (`fpStrictCofiltered`): finitely presented compactifications and strict common refinements over qcqs bases. |
| DerivedModuleAlgebra | §§0.2, 0.4, 0.8, 0.10–0.14, 1.T.1, 1.1–1.8, 1.E.1 and S.1: derived operations, completed towers, perfect systems and first-quadrant spectral sequences, with their bounded-torsion/completeness assumptions. |
| DerivedDeRhamCohomology | §1.22: valid completion exchanges, retaining the lower cohomological bound for totalization. |
| EnhancedDerivedSheaves | §§0.1–0.4, E1.1–E1.5, E2:towers.1, E5:animation.3 (`tot_filteredColimit_of_bounded`): enhancements and coherent limits. Its lower bound Hʲ=0 for j<0 gives Hⁱ cutoff i+1; derived sections and sheafification transport it to the geometric diagram. |
| AInfCohomology | AI.0:integral.1, AI.1.1–AI.1.7, AI.3.1–AI.3.2, AI.4.1, AI.6.1–AI.6.2: twist/dlog, décalage, Koszul, completed coefficients, toric comparison and the single-block `p^q` domain. |
| PadicHodgeTheory | §§2.1, 2.4, 2.7, 7.2: completed coefficients, geometric Hodge–Tate, primitive comparison, singular proper constant finiteness/perfectness and lattices. The general-model nearby coherence and smooth toric integral field-extension statements remain exact additional contracts. |
| ArithmeticGaloisDuality | D7.1–D7.3 and R02.1.2–R02.2.3: continuous cochains, finite-group bar algebra, Shapiro, coefficients and limits. The almost ringed-site realization is owned by §4.4 here. |
| DiamondsAndVStacks | D1.1–D1.6, D1.9–D1.11: disconnected bases and automatic flatness on that domain; D2.2: v-cover criterion for qc source and qs target. It is applied after perfectoid base change. |
| DiamondEtaleCohomology | C0.1, C0.23, C1.7–C1.12, C2.10: rigid/diamond sites, bounded-below v-embedding and hyperdescent for arbitrary coefficients; base-change alternatives remain quasi-pro-étale or prime-to-p. |
| ClassicalAdicEtaleCohomology | §§1.1–1.4, 1.5(c), 2.5/sheaf-comparison-3-2-9, 3.2, 7.1, 8.2, 8.4, 9.1, 9.5, 9.7, 10.5, 11.1–11.2: sites, rank-one stalks, affinoid comparison, overconvergence, proper amplitude, trace and purity. `ordinary_etale_cohomological_dimension` supplies the arbitrary-sheaf 2d bound; `IntegralSmoothProperTrace` supplies only the smooth-formal-family specialization. |
| HodgeTateAndCanonicalSubgroups | §§7.5–7.6: proper finiteness and proper smooth local systems with geometric stalks and rigid base-change comparison; integral stalk torsion is retained. |
| EtaleCohomologyFoundations | G.1–G.3, F.0, §§0.5–0.11, F.3: scheme compactification, monodromy, localization and scheme finiteness. Ordinary nonproper constructibility over quasi-excellent affinoid bases remains the additional contract. |

The new-roadmap dependencies still in indexed open pull requests are **AInfCohomology, AdicCoefficientsAndComparisons, ArithmeticGaloisDuality, ClassicalAdicEtaleCohomology, DerivedDeRhamCohomology, DiamondEtaleCohomology, DiamondsAndVStacks, HodgeTateAndCanonicalSubgroups, PadicHodgeTheory, ResolutionOfSingularitiesCharacteristicZero**. AdicSpacesPartIIPartII is an earlier board package, separately identified above; no open pull request for it was assumed.

Ownership searches used the roadmap service over all indexed open heads and main, local board packages, the pinned libraries, and README/Suggested.lean at every one of the 54 supplied sibling heads (108 files). They searched the mathematical objects: almost coherent formal sheaves and proper mapping, canonical Hartogs, Faltings traces, polystable character/root duality, Frobenius projection pairings, wild quotient descent, branched normal rigid covers, Zariski-constructible algebraization and proper pushforward/base change. The sole matched expression in the 108 supplied-head files was AdmissiblePairsAndPadicHodgeStructures' bibliography entry for BH's weakly Shilov geometry; it does not own the targets here. All own Lean names were also checked for collisions with readable roadmap declarations; there is no fully qualified collision.

No new duplication removal or supplier replacement was needed during this port. The accepted package already imports the fixed-vector and perfect-pairing inputs, proper smooth local systems, primitive comparison/perfectness, scheme compactification and generic derived algebra. Scope and ownership retains those boundaries; no deleted target survives as a stub. This roadmap owns the geometric Faltings extension and arbitrary product-parameter duality because the base roadmap stops at the analytic trace and prime-to-residue theory, while AInfCohomology's one-block specialization does not give the arbitrary product-parameter theorem. No ownership was moved to a later roadmap and no later roadmap is a supplier.

## Computed adversarial mathematics pass

O denotes O_C, a=ζ_p−1, Λ the displayed coefficient ring. Values below were recomputed from the definitions and the indicated small complexes; they are mathematical computations, not assertions that admitted Lean proofs were tested for truth. Each numbered target has a row, including its API and boundary conditions; the native definitions, conventions, supplier extensions and examples have separate rows.

| Statement | Instances tried | Values computed on the two sides | Result; change |
| --- | --- | --- | --- |
| Convention: shifts and local/global dimension | d=0,1,2 | O[0] has H⁰=O; Ω¹[1] has H⁻¹=Ω¹; Λ[−2] has H²=Λ, whereas Λ[2] has H²=0. Local curve degrees sum to 1; global ones sum to 2. | Correct; retained. |
| Convention: almost zero | p=2,3, v(p)=1, v(ε)=1/2 | In O/p, ε·1≠0; in O/𝔪, ε·1=0 for every ε∈𝔪. Thus O/p is nonzero almostly and O/𝔪 is zero almostly. | Correct; retained. |
| Convention: residue versus p reduction | π²=p, p=2,3 | In O_K/p, π≠0 and π²=0; in k_K, π=0. Formal t-power reduction in characteristic 2 gives O/t and O/t²; reduction by integer 2 gives O. | Correct; retained. |
| Convention: dlog/Tate normalization | one-torus and U=T⁻¹ | jΦ⁻¹Sch(dlog T)=dlog T; an extra a gives a⁻¹dlog T. dlog U=−dlog T on both sides. | Correct; retained. |
| Convention: orientation | two coordinates, p=2,3 | Swap gives determinant −1 and wedge −dT₁∧dT₂; scalar trace also gets −1, equal to 1 modulo 2 and 2 modulo 3. | Correct; retained. |
| Convention: unnormalized finite trace | two points; p points | Tr(1,1)=2 and Tr(e₁)=1; modulo 2 these are 0,1. For p points the unit trace is p=0 modulo p but Tr(e₁)=1. | Correct; retained. |
| 0.1 Almost coherent category | unit, residue field, infinite completed sum | Oᵃ has one generator; (O/𝔪)ᵃ=0 although its honest unit is 1≠0; ε times infinitely many coordinate units still needs infinitely many generators. | Category excludes arbitrary complete modules; retained. |
| 0.2 Affine equivalence, Hom, proper mapping | point; negative unbounded G; completed ℙ¹ with O,O/p,O(−2) | RHom(O,O)=O[0]; RHom(O,G)=G has H⁻ⁿ=O for all n>0. Projective-line (H⁰,H¹)=(O,0),(O/p,0),(0,O), respectively, with T⁻¹ generating the last H¹. Associated-sheaf maps identify these same modules; inversion gives C,0,C. | Correct bounds and integral supplier; retained. |
| 0.3 Almost coherent proper duality | identity modulo p,p²; line; two points | Over O/p the unit Hom is Oᵃ/p in degree 0. Over O/p², Hom into O/p of the periodic p-resolution has all differentials 0 and Ext¹=Oᵃ/p. Smooth-line shriek is Ω¹[1]; split counit (1,0)↦1. | Derived category and shift retained. |
| 0.4 Integral and mod-p nearby complexes | point; two-torus; square-zero thickening | Point A=Oᵃ, K=Oᵃ/p and A⊗ᴸO/p=K. Torus ranks are 1,2,1. In the thickening C[ε]/ε² every cε is power bounded, Cε/pCε=0 and its p-completion is 0, leaving O/p and O, annihilated by ε. | Distinguishes completed nearby coefficients from formal nilpotents; retained. |
| 0.5 Generic-fibre functor | O, O/pⁿ, pO | O⊗C=C, (O/pⁿ)⊗C=0, pO⊗C=C; unit and p-lattice both become C. | Correct functor and lost lattice size; retained. |
| 1.1 Formal dualizing complex | point, smooth surface, equal-characteristic line, embedded-point model | Degrees are 0,−2,−1 respectively. In ℤ_p[pT,T²,T³]/p, x=pT is nonzero with x²=xT²=xT³=0; the embedded point is non-CM and forces more than bottom dualizing cohomology. | Full complex retained. |
| 1.2 Étale/completion comparison | U=2T; n=0,1 | At odd residue characteristic dU=2dT with unit determinant 2. At p=2 this formal map is not étale. Reductions are modulo ϖ and ϖ², not the same fibre. | Correct domain; retained. |
| 1.3 Gluing kernel | whole open, empty open, point | ker(C⊕O→C)={(r,r):r∈O}; (1,0) has difference 1. For empty open the kernel object has sections C rather than O. | Equal-restriction law excludes direct sum and empty-open Hartogs; retained. |
| 1.4 Reflexive Hartogs | whole open; empty open; node | Whole-open map sends s↦(s,s) and recovers s. Empty-open map O→C is not surjective: 1/p has no integral preimage. Node has two branches and a dense open meets both, not just one. | Density/reduced-residue hypotheses retained. |
| 1.5 Bottom canonical traces | identities; two and p points | Identity sends 1↦1; disjoint union sends (1,0)↦1 and (1,1)↦2; p-point unit sends 1↦p, reducing to 0. Iterated sums give the same unit-vector value 1. | No degree division; retained. |
| 1.6 Generic canonical line | point, torus, inverse coordinate | 1↦1; dlog T↦canonical generator; dlog(T⁻¹)=−dlog T in both identifications. | Canonical bottom comparison retained. |
| 1.7 Coherent rigid trace | S=Tʳ, r=p in mixed characteristic; ramified point | Pullback dlog S=r dlog T; Tr(dlog T)=dlog S and Tr(f*α)=rα. In characteristic p, derivative of Tᵖ is 0, so that map is excluded. The ramified point has k[t]/t² residue; after C extension it splits into two reduced points. | Algebraically closed base and étaleness retained. |
| 2.1 Torsion-free quotient and cup | O⊕O/p²; torsion-free line; p=2 square | Quotient is O, while quotient by p-torsion alone leaves a nonzero O/p piece. A line remains O. For a degree-one square, 2x²=0 and 2-torsion-freeness gives x²=0. | Full power torsion removed; retained. |
| 2.2 Cotangent BMS maps | point, one-torus, smooth n=1 | Point differential source is 0. On the smooth torus the image lattice is a times the torsion-free nearby line, with quotient O/a, not zero; dlog source fixes the cocycle scale. | Intrinsic twist/image retained. |
| 2.3 Smooth inverse | d=0; curve; one-torus | Ψ⁰(1)=1. Curve ranks are 1,1,0 in degrees 0,1,2. Normalized coordinate character maps to dlog T; extra a⁻¹ changes it to a⁻¹dlog T. | Division only onto nonzero-scalar image; retained. |
| 2.4 Nice-model predicate | smooth affine; uv=ϖ; t²=ϖ | Residue algebras are k[T], k[u,v]/uv (two reduced branches), and k[t]/t² (nonzero nilpotent). First two satisfy niceness; last fails it despite smooth generic fibre. | Correct discriminating predicate; retained. |
| 2.5 Rational normalization/trace | torus, split cover, point | Φ=Sch∘j gives jΦ⁻¹Sch=id; torus trace/pullback values are 1,r; point comparison is 1; degree-two unit trace reduces from 2 to 0 at p=2. | No extra cyclotomic scalar; retained. |
| 2.6 Faltings trace | point; smooth curve; singular special fibre | Point trace 1↦1. Curve target Ω¹[1](−1)[−2]=Ω¹(−1)[−1] has H¹=Ω¹(−1). Bottom inclusion starts at H⁻ᵈ(ω•)[d], giving total shift −2d. | Correct shifts/full complex; retained. |
| 2.7 Pseudo-finite maps | identity, blowup, positive-dimensional generic projection | Identity has generic degree 1 and nearby amplitude [0,d]; blowup also has degree 1 but can have an exceptional ℙ¹. Positive-dimensional generic fibre has dimension ≥1 rather than 0 and fails finiteness. | Both defining conditions retained. |
| 2.8 Finite pro-étale trace | p sheets, one sheet, r×s sheets | Tr(e₁)=1, Tr(1)=p=0 modulo p; degree-one trace is id; either order of iterated sum on e₁ gives 1 for rs sheets. | Transitivity and coefficient reduction retained. |
| 2.9 Trace compatibility/locality | identity, two sheets, p sheets | Both routes send 1↦1 for identity, (x,y)↦x+y for two sheets, and the p-point unit to p integrally/0 modulo p; both send e₁↦1. | Correct projection/trace square; retained. |
| 3.1 Product polystability | no blocks; node; units; zero parameter | Dimensions are 0,1,Σn_i; uv=unit eliminates one variable as an inverse. uv=0 has both partials 0 at (0,0), so generic smoothness fails. | Every nonzero parameter retained, including units. |
| 3.2 Root tower | n_i=0; one torus; node at p=2,3 | No-block deck group=1; one-torus deck group=ℤ_p(1). Closed-node root fibres have bases 1,x,y (length 3) at p=2 and 1,x,x²,y,y² (length 5) at p=3; generic ranks are 2 and 3. | O-flat does not mean chart-flat; retained. |
| 3.3 Character summands/product | node opposite monomials; units; integral coset | (1,0)+(0,1) normalizes to (0,0) with scalar ϖ, so uv=ϖ rather than 1; at root level the factor is ϖ^(1/p^m). Integral coset contains 1 and u,v; unit parameter makes the scalar invertible. | Parameter factors retained. |
| 3.4 Character cochains | Γ=1, trivial ℤ_p character, nontrivial character | Cohomology is (O,0,…) for Γ=1; (O,O) for zero differential; (0,O/(ζ_(p^m)−1)) for the nonzero scalar differential. Small-scalar multiples can survive, so one-scalar annihilation is not almost zero. | Correct torsion and character signs; retained. |
| 3.5 Décalage and top map | [O —a→ O]; free line | Original H⁰=0,H¹=O/a. Lη_a gives zero cohomology. For a torsion-free line M/M[a]=O but M/aM=O/a. | Torsion quotient is not reduction; retained. |
| 3.6 Projection traces | m=0, torus roots, n=0 | tr₀=id; tr(T^(1/p^m))=0 for m>0; tr(T)=T; tr(1)=1. Ordinary inseparable field trace sends 1 to p^m=0; n=0 is just 𝔽_p and trace 1. | Base-ring wording clarified. |
| 3.7 Root derived duality | node p=2,3; m=0; triple crossing | Node adjoint sends x to functional x↦u; Hom(A/(v),A)=(u), Ann(u)=(v), so periodic positive Ext=0. At p=3 the x,x² block has entries 0,u,u,0. For n=2,p=2 the seven diagonal values are 1,U,V,W,UV,UW,VW; Ann(VW)=(U), Ann(W)=(UV). At m=0 evaluation at 1 inverts r↦(s↦rs). | New triple-crossing Check; no free-module shortcut. |
| 3.8 Oriented group trace | ranks 0,1,2; rescale generator | Rank-zero trace=id; rank-one top generator maps to 1; evaluating the same character at uγ gives u. A two-basis swap gives determinant −1 and the same trace sign. | Orientation line fixes intrinsic map; retained. |
| 3.9 Continuous-cochain duality | d=0; trivial rank-one action; opposite cosets | Evaluation at 1 returns b for d=0; degree-0 and degree-1 units pair to 1. Opposite cosets project into the base ring: at q=2 the torus root square projects to T, and at the node x² projects to u. Non-opposite coset projection is 0. | Derived opposite-character pairing retained. |
| 3.10 Polystable local duality | point, curve, surface | Point adjoint sends 1↦id. Curve paired degrees sum to 1 with target ω(−1)[−1]. Surface pairs 0,2 and 1,1; swapping coordinates gives −1. Mod-p ω•₀=ω₀[d] reproduces shift −d after −2d. | Correct local/global distinction; retained. |
| 4.1 Faltings pairing/perfection | point, zero object, smooth curve | Multiplication over Oᵃ/p sends 1⊗1↦1 and both adjoints are identity. Zero object gives 0≅0. Curve target has its canonical sheaf in degree 1, pairing 0 and 1. | Perfection is a conclusion, not an input field. |
| 4.2 Rig-isomorphism descent | identity and blowup | Identity preserves adjoint 1. Blowup generic degree=1 while exceptional ℙ¹ has dimension 1; Rf_* is needed, not equality of special fibres. | Trace descent retained. |
| 4.3 Good formal quotient | G=1, split C_p torsor, generic stabilizer | Quotient of G×X has |G|=p generic sheets and trace e₁↦1; G=1 gives id. A fixed generic point has orbit cardinality 1 instead of |G|>1 and fails the torsor condition. | No integral étaleness inferred. |
| 4.4 Homotopy invariants/orbits | C_p trivial in 𝔽_p; regular S₃ module; infinite ℤ | Cyclic differential g−1=0 and norm=p=0 give H¹=𝔽_p. Regular six-component invariants are diagonal M, coinvariants M, higher cohomology 0. Infinite regular finite-support invariants are 0 but coinvariants M. | Finite induction/coinduction boundary retained. |
| 4.5 Equivariant pushforward/Hom | G=1,C_p,S₃ | Trivial-group comparison=id; C_p H¹ remains O/p. For g=(12),h=(23), gh=(123), (gh)⁻¹=(132)=h⁻¹g⁻¹, not (123). | Inversion and finite ordinary cohomological dimension retained. |
| 4.6 Good quotient descent | split C_p and S₃ | Diagonal invariants and one-component coinvariants both identify with M; trace of one component=1, trace of invariant unit=p or 6, possibly zero. Higher induced-group cohomology=0. | Uses torsor Shapiro, not arbitrary norm invertibility. |
| 4.7 Local almost duality | point, uv=ϖ, t²=ϖ | Point matrix=(1); node residue uv=0 has two reduced branches; t²=0 residue has a nonzero nilpotent and fails niceness. | Domain retained; auxiliary-contract wording clarified. |
| 5.1 Global almost trace | point, two points at p=2, curve | Point 1↦1; (1,1)↦0, e₁↦1 at two points; H² of target Oᵃ/p(−1)[−2] is Oᵃ/p(−1), while target with +2 gives H²=0. | Negative trace shift retained. |
| 5.2 Global almost duality | point, ℙ¹, two points | Ranks are (1), (1,0,1), (2); endpoint pairing=1 and two-point matrix diag(1,1) has determinant 1 even when total unit trace=0. | Degreewise almost finite freeness retained. |
| 5.3 Almost detection/top trace | zero map, identity, two points | Zero map 𝔽_p→𝔽_p has kernel and cokernel 𝔽_p, extending to nonzero Oᵃ/p. Identity has both 0. Two-point summation has one-dimensional kernel; connected top trace has rank 1→1 and sends point class to 1. | Connectedness required; retained. |
| 5.4 Geometric mod-p duality | ℙ¹; two points; i=2d+1; characteristic p | Endpoint pairing=1; two-point matrix diag(1,1); i=2d+1 pairs H^(2d+1)=0 with H^(−1)=0. In characteristic p, ℙ¹ has H²(𝔽_p)=0 but H⁰=𝔽_p. | Mixed-characteristic and integer-index scope retained. |
| 5.5 Local-system duality | rank 0, rank r at point, C₂ Jordan block over 𝔽₂ | Rank-zero adjoints are 0→0; point evaluation matrix=I_r. Jordan block has fixed vector e₁ and trivial quotient; degree-two scalar=0, odd-degree scalar=1 modulo 2. | Sylow prime-to-p splitting retained. |
| 5.6 Finite p-power duality | n=1,2; ℙ¹; scalar change | Endpoint pairings are 1 modulo p and p². Λ_n⊗ᴸ_(Λ_n)𝔽_p has only H⁰=𝔽_p; Λ_n⊗ᴸ_(ℤ_p)𝔽_p also has H⁻¹=𝔽_p. | Correct tensor base and shift retained. |
| 5.7 Integral/rational trace | point, ℙ¹, torsion module | 1↦1 at every finite level and its limits; point-class trace=1 over ℤ_p and ℚ_p; (ℤ_p/p)[1/p]=0. | Integral torsion permitted. |
| 5.8 Integral derived duality | point, ℙ¹, [ℤ_p —p→ ℤ_p] | Point multiplication=1; ℙ¹ degrees 0,2 pair to 1 in shift −2. Two-term complex has H¹=ℤ_p/p; Hom(ℤ_p/p,ℤ_p)=0 but Ext¹=ℤ_p/p. | Derived Hom retained; no false degreewise claim. |
| 5.9 Rational duality | ℙ¹, torsion, two points | ℙ¹ endpoint matrix=(1); torsion rationalization=0; two-point pairing diag(1,1) has determinant 1, unlike all-ones product-of-sums matrix with determinant 0. | Correct degreewise consequence over a field. |
| 7.1 Zariski constructibility | point skyscraper, constant sheaf, infinite disjoint union | Stalks on the two strata are Λ and 0; constant specialization=id. On component j, Λ in degree −j gives a finite local bound but no common global lower bound. | Locally bounded category retained. |
| 7.2 Affinoid algebraization/comparison | structural identity, closed point, Spec K | Structural identity Spec A→Spec A is proper, so categories agree. Closed-point sheaf has Λ at that point and 0 off it on both sides. Constant rank-r point sheaf remains Λ^r in degree 0. | Does not confuse Huber and Zariski constructibility. |
| 7.3 Locality/generators | point, finite closed immersion, C₂ Jordan block | Point module Λ is a generator; pushforward skyscraper has stalk Λ at the closed point and 0 outside. Jordan block has two trivial one-dimensional constituents. | Generator argument needs no geometric duality. |
| 7.4 Proper constructible pushforward | identity, closed point, nodal curve; short cosimplicial complexes | Identity preserves F; closed-point R⁰ has stalk Λ and Rⁱ=0 for i>0. Normalization/point terms have dimensions 1,0. [Λ→idΛ] has H⁰=0 versus Λ after deleting degree 1; [0→Λ→idΛ] has H¹=0 versus Λ after deleting degree 2. | i+1 cutoff retained, no circular base-change input. |
| 7.5 Proper field-extension invariance | point, ℙ¹, ℤ/p², split nodal rational curve | Point map 1↦1. ℙ¹ ranks 1,0,1 and trace 1 before/after extension. For nodal curve branch difference (a,b)↦a−b gives groups Λ,Λ,Λ(−1), unchanged after extension. | Added a≥1; singular descent retained. |
| 7.6 All-torsion proper base change | identity; ℙ¹ at p²; n=1; empty source | Identity exchange=id; geometric extension preserves Λ in degree 0 and Λ(−1) in degree 2. At n=1 coefficient ring=0 so exchange=0→0. Empty-source images=0 for every g. | No good-prime restriction. |
| 7.7 Constant cohomology sheaf | one point, two points, Y=ℙ¹ | Degree-zero sheaves Λ and Λ²; higher direct-image sheaves=0 for a point. H²(point×ℙ¹,Λ)=Λ(−1) although the degree-two direct-image sheaf is 0. | Published locator verified and label repaired. |
| Native definition: monomialRootAlgebra | p=0,1,2,3; n=0,1,2 | At n=0, quotient by (t₀) is ZMod p; p=0 gives ℤ and p=1 gives the zero ring. At n=1, xy=0 but x≠0. At n=2, xyz=0 while xy≠0. | Correct real quotient; no change. |
| Native instance: characteristic | constants at p=0,1,2,3 | Evaluation at zero sends a constant c to c; 1 maps to 1 in 𝔽₂ and 𝔽₃. There 2·1=0 and 3·1=0 respectively; p=0 retains characteristic 0 and p=1 has 1=0. | No hidden prime binder needed for this instance. |
| Native definition: monomialClass | zero vector, node exponents (1,0),(1,1), triple exponents (1,1,0) | Products give 1,x,0,xy respectively. Adding exponent vectors gives the same product; at the node x·y=0 on both sides. | Coordinate product and relation agree. |
| Native definition: root module | p=2,m=0,1; n=0,1 | At m=0, u·1=u; at m=1 the underlying coordinate x has scalar action x·1=x², rather than x. For n=0 Frobenius on 𝔽_p is identity at every m. | Restricted scalars essential and correctly retained. |
| Native theorem: projection, adjoint, positive Ext | p=2,3; m=0,1,2; n=0,1,2 | At m=0 τ(t^e)=t^e and evaluation at 1 inverts the adjoint. At q=p^m>0, τ(x^q)=x and τ(x)=0 when q>1. A monomial with all exponents positive is already 0 before and after τ. Node branch Hom=(u); alternating u,v resolution has zero positive Ext. Triple-crossing values are 1,U,V,W,UV,UW,VW. | Matches all theorem clauses; prime hypothesis gives q≥1, so no division-by-zero junk value. |
| Supplier extension: valuation-formal-proper-mapping | identity, empty source, formal ℙ¹ over O, O/p and O(−2) | Identity comparison M→M; empty source 0→0. On ℙ¹, coherent modules are O,O/p,O in degrees 0,0,1 and their associated-sheaf maps are identities. Generic inversion changes O/p≠0 to 0. | Exact integral relative contract retained. |
| Supplier extension: reduced-model-cofinality | C point versus ramified ℚ_p point | Spf O_C has reduced residue k and generic point C. O_(ℚ_p(π))/𝔪_(ℚ_p) has π≠0,π²=0 for π²=p; after extension to C the generic algebra is C² with reduced model O_C². | Algebraically closed fraction-field domain retained. |
| Supplier extension: refined-formal-algebraization | affine line; point | O_K[T] completes to O_K⟨T⟩ with generic dimension 1 on both sides; O_K gives dimension 0. Components where ϖ is invertible have completion 0 and cannot determine the model's required dimension. | Flat, smooth-generic, pure-dimensional algebraization retained. |
| Supplier extension: finite-formal-quotients | G=1, split C_p and S₃ actions | Quotient of G×X is X; finite generic degrees are 1,p,6, and Tr(e₁)=1 in all cases. | Quasiprojective residue/orbit condition retained. |
| Supplier extension: polystable-uniformization-zigzag | point, node, nonreduced-residue smooth-generic model | Point diagram has degree 1 and dimension 0. uv=ϖ has two reduced branches and dimension 1. t²=ϖ has residue t²=0; the original model cannot acquire reduced residue merely from the theorem's phrasing. | Clarified auxiliary-model conclusion; original domain unchanged. |
| Supplier extension: finite-branched-covers | T=S² on characteristic-zero disc and its puncture | Derivative 2S is a unit on the puncture and is 0 at S=0. The normal extension has degree 2 and ramification index 2 at 0. With empty branch set the restriction is identity on finite étale covers. | Equivalence is stronger than ordinary normalization; retained. |
| Supplier extension: proper-generic-smoothness | inclusions at a and b in disc | S_f=Y∖{a}; for two maps common open=Y∖{a,b}. Intersecting over all point inclusions gives empty set. | Separate map quantifiers and finite intersections retained. |
| Supplier extension: valuation-upper-shriek | point, smooth line, two-point finite map | id!O=O[0], line shriek=Ω¹[1], finite counit (1,0)↦1 and (1,1)↦2. | Source/target and cohomological convention retained. |
| Supplier extension: valuation-duality-amplitude | dimensions 0,1,2 | Smooth dualizing complexes have nonzero degrees 0,−1,−2, each inside [−d,0]; tensoring a base module leaves the same relative Tor degree. | Coherence/relative amplitude not confused with chart-flatness. |
| Supplier extension: valuation-canonical-reflexivity | smooth line; excluded t²=ϖ | Canonical line O_K[T]dT has evaluation into its bidual equal to identity on dT. The t²=ϖ residue t has t²=0≠t, violating the reduced-residue hypothesis. | General valuation contract retained. |
| Supplier extension: connective-totalization-truncation | i=0,1; negative-cohomology control | [Λ→idΛ] has H⁰=0, Tot₀ gives Λ; [0→Λ→idΛ] has H¹=0, one-stage-shorter gives Λ. A lone Λ[2] in cosimplicial degree 2 contributes Λ to H⁰ of full Tot but 0 to Tot₁. | Bound i+1 needs terms in D≥0; retained. |
| Supplier extension: general-nearby-coherence | point, two-torus, nilpotent thickening | Point ranks=(1); two-torus torsion-free ranks=(1,2,1); nilpotent Cε/pCε=0 and completed Cε=0. Derived reduction returns Oᵃ/p, not the thickened formal algebra. | General formal-model contract retained. |
| Supplier extension: integral-toric-field-extension | point; toric character; singular node control | Unit maps 1↦1; γ−1 scalar ζ_(p^m)−1 remains the same scalar after C′/C. Node uv=0 has both derivatives 0 at the origin and is outside the smooth toric chart step. | Smooth reduction/descent retained. |
| Supplier extension: quasi-excellent-direct-images | j:𝔾_m→𝔸¹ in characteristic zero | At 0, (R⁰j_*Λ,R¹j_*Λ)=(Λ,Λ(−1)); higher boundary classes do not vanish merely because an open immersion is used. Identity image has R⁰=Λ, Rⁱ=0 for i>0. | Ordinary nonproper direct image retained. |
| Supplier normalization: almost setup and derived algebra | residue field; two-term p complex | 𝔪(O/𝔪)=0; ε·1 in O/p can be nonzero. Cone/shift conventions give H¹([ℤ_p —p→ ℤ_p])=ℤ_p/p and derived reduction an additional Tor class over ℤ_p. | Same conventions as PerfectoidSpaces, DerivedModuleAlgebra and EnhancedDerivedSheaves. |
| Supplier normalization: dlog and semistable parameter | one-torus; single block uv=p^q; unit parameter | One-character differential=ζ_(p^m)−1 and integral character differential=0. Node multiplication uv=p^q; q>0 makes it a nonunit. Parameter 1 instead gives torus uv=1. | Corrected “cyclotomic” to the actual positive-rational `p^q` domain. |
| Supplier normalization: analytic/coherent finite trace | S=Tʳ and split p sheets | Pullback factor r, coherent trace dlog T↦dlog S; pro-étale/analytic split trace e₁↦1 and unit↦p. All composites agree on r and p, without inversion of p. | Parent trace and formal coefficient contracts agree. |
| Supplier normalization: group theory | trivial C_p and regular nonabelian S₃ | H¹(C_p,𝔽_p)=𝔽_p; induced S₃ module has invariant rank 1, coinvariant rank 1, H¹=0. Inversion sends (123) to (132). | Same derived/contragredient conventions in ArithmeticGaloisDuality. |
| Supplier normalization: sites, stalks and descent | geometric point, identity extension, constant hypercover | Geometric point has cd=0. Identity exchange acts as 1 on Λ. Constant hypercover Tot=Λ with higher cohomology sheaves 0, although RΓ(ℙ¹,Λ) has H²=Λ(−1). | Cutoff and sheafification distinguish geometry from abstract section groups. |
| Supplier normalization: proper smooth local systems | elliptic curve, zero coefficients | Elliptic geometric ranks=(1,2,1); zero local system gives all ranks 0. A p-torsion integral stalk rationalizes to 0. | HodgeTateAndCanonicalSubgroups and PadicHodgeTheory contracts preserve torsion. |
| Layer 0 Examples | point; two-torus | Nearby point (Oᵃ,Oᵃ/p) becomes (C,0) generically; torus ranks=(1,2,1). | Agrees with §§0.1–0.5. |
| Layer 1 Examples | r=1,2,p on torus | Tr(dlog T)=dlog S, Tr(f*dlog S)=r dlog S, including r=p in mixed characteristic. | Agrees with §§1.5–1.7. |
| Layer 2 Examples | point and curve | Point trace=1; curve Ω¹[1](−1)[−2]=Ω¹(−1)[−1], in degree 1. | Agrees with §§2.3–2.6. |
| Layer 3 Examples | node and basis swap | uv=ϖ, first binary node fibre length=3 versus degree=2; basis swap trace factor=−1. | Agrees with §§3.2–3.10. |
| Layer 4 Examples | split C_p versus trivial C_p module | Split trace unit=0, component=1; induced H¹=0, trivial-module H¹=𝔽_p. | Agrees with §§4.4–4.6. |
| Layer 5 Examples | ℙ¹ and two-term integral complex | Each coefficient system has ranks 1,0,1 on ℙ¹ with trace 1; p-complex has torsion H¹=ℤ_p/p and derived Ext¹=ℤ_p/p. | Agrees with §§5.4–5.9. |
| Layer 7 Examples | closed point and product with ℙ¹ | Closed-point higher images=0; degree-two point direct-image sheaf=0 versus product cohomology Λ(−1). | Agrees with §§7.4–7.7. |
| Worked smooth curve/elliptic example | ℙ¹, elliptic curve; p=2 | ℙ¹ ranks=(1,0,1), elliptic ranks=(1,2,1). Symplectic matrix is ((0,1),(−1,0)), determinant 1; modulo 2 diagonal still 0 and off-diagonal entries both 1. | Local degree sum 1 and global degree sum 2 agree. |
| Worked nodal curve/hypercover example | split node | Normalization ℙ¹ with two branches gives difference (a,b)↦a−b; kernel has rank 1 and graph contribution H¹ has rank 1, so total ranks=(1,1,1). Smoothness opens belong to the base, with point-inclusion control Y∖{a}. | No contradiction with constructible proper pushforward. |

## Source access and unresolved matters

The main references retain their accepted versions and locators. The root theorem was checked directly in Z Theorem 4.3.2, p.59, Z line 2834; the uniformization clarification in Z Theorem 4.4.1, pp.66–67, Z line 3188; coherent formal proper mapping in AC Theorem 5.1.5, pp.116–117, AC line 4990; generic smoothness in BH Theorem 2.29, pp.13–14, BH line 567; formal quotient hypotheses in FQ Remark 3.3.3 and Theorem 3.3.4, pp.17–18, FQ line 756; and the big-site application in H Proposition 2.18, p.279, H line 802. These checks read primary texts and did not copy source passages into the roadmap.

The fourteen accepted conditional supplier contracts remain explicit mathematical obligations: valuation-formal-proper-mapping, reduced-model-cofinality, refined-formal-algebraization, finite-formal-quotients, polystable-uniformization-zigzag, finite-branched-covers, proper-generic-smoothness, valuation-upper-shriek, valuation-duality-amplitude, valuation-canonical-reflexivity, connective-totalization-truncation, general-nearby-coherence, integral-toric-field-extension and quasi-excellent-direct-images. They are not claimed to be implemented or silently discharged by a sorry build. The supplied versions of EnhancedDerivedSheaves now state the totalization bound directly; its geometric transport and the accepted contract record were preserved.

No unresolved port or elaboration defect remains. Two verification limits are recorded explicitly: AdicSpacesPartIIPartII is available only as the earlier board design rather than an indexed new-roadmap head; the institutional Han PDF endpoints returned HTTP 403 during the fresh source-access check, so its accepted February 25, 2019 locators were retained and were not substituted by the differently numbered 2017 arXiv version. H's previously inaccessible published locator was verified successfully. No suspicious instruction passage was acted upon, and no source passage required a separate prompt-injection quotation.


Pull request: #1549 (roadmap/classical-adic-etale-cohomology-part-ii at eaeba48)
