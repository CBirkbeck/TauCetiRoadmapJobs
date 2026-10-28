# Port: EllAdicHomotopyTypesAndWeights

Branch: `roadmap/ell-adic-homotopy-types-and-weights`.
Head commit: b61fda14a02dd3b4c1ca1e4f33e43d8b9017165f.
Base: `d2e0f0d`, verified with an empty initial worktree.

Only `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md`, `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/Suggested.lean` and `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/metadata.toml` enter the commit. The top-level roadmap list, pins, tooling and merge order are unchanged. No push or GitHub write was performed.

## Validation

The targeted module build exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.EllAdicHomotopyTypesAndWeights.Suggested (8.1s)
Build completed successfully (8976 jobs).
```

Warning count: **0**; no other diagnostic. The accepted empty acceptance module has no admitted statements, so no `sorry` warning is expected.

The clean committed-tree push gate exited 0:

```text
gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The initial pre-commit gate passed every content check and reported only the expected uncommitted folder; the committed-tree rerun above clears that condition.

The required movable dependency check returned:

```text
depcheck: 153 roadmaps, 1037 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this roadmap.

The mechanical declaration extraction from `Suggested.lean`, after stripping its module comment, finds **zero declarations**, hence zero required `#check @name` commands. There are no elaborated declaration types or implicit section binders to compare, and no binder repair was needed. The module itself was elaborated by the targeted build. The 20 headline omissions were checked against the pinned source tree by object, including relative divided-power coefficient complexes, Sullivan/Hirsch algebras, polynomial forms, geometric ℓ-adic algebras, and model automorphism schemes. Ordinary DG algebras, simplicial chains and abstract mixed Hodge structures do not provide those missing carriers. No stand-in or weakened scalar theorem was added.

The citation resolver reports no missing Lean names and three roadmap names absent from its main/open-head index: AlgebraicTopologyPartII, EtaleHomotopyTypes and MixedHodgeModulesAndIrregularHodgeTheory. The latter two have the cited EH.0/EH.3/EH.6 and H.1/operations/weight-bounds sections in their earlier board specifications. AlgebraicTopologyPartII has a packaged roadmap with Layer 4, but not the old AT2.4/G3 section or the five general Sullivan interfaces; see the explicit conditional-contract limitation below. The resolver also says it did not check pinned library names; those were checked directly in this worktree instead.

## Draft pull request body

This roadmap builds integral divided-power forms and their simplicial and ℓ-adic comparisons, then applies them to étale homotopy types. It develops minimal-model weight splittings and conjugacy, proper smooth formality, and the weight-bounded presentation of normal varieties’ unipotent étale fundamental Lie algebras, retaining integral coefficients at every prime before rationalization.

AI assistance: Codex performed the port, supplier and source audit, and computed self-review. The accepted mathematical scope and conditional supplier contracts are retained.

## Dependencies still in pull requests

The indexed new-roadmap heads consumed are **DerivedDeRhamCohomology**, **DiamondsAndVStacks**, **ComplexComparisonPartII**, **MotivicEtaleKTheory**, **ResolutionOfSingularitiesCharacteristicZero**, **DeligneWeightsAndPurity**, and **AnabelianGeometryAndNonabelianChabauty**.

**AlgebraicTopologyPartII** and **EtaleHomotopyTypes** are earlier merge-order dependencies represented by board specifications, without a new-roadmap head in the supplied index. **MixedHodgeModulesAndIrregularHodgeTheory** is cited only to delimit ownership, not used for the hyperresolution construction. Revisions of main roadmaps are not dependencies on their revision heads.

## Port changes and upstream mathematical review

All 37 numbered target sections, 37 Needs lines, nine layers, worked examples and definition APIs are retained. Every definition/API block has at least three discriminating Checks. The acceptance file and metadata are byte-for-byte those of the accepted package. Nothing moved from Lean to README: the package already had the required import, module docstring and empty namespace, with all 20 non-statable headlines explained.

The accepted review’s decisions are preserved. Its non-blocking notes were applied by content rather than by their stale line numbers:

- The formality predicate is attributed to DGAInfinity Layer 3; Massey consequences and formality criteria remain in Layer 8. Layer 8 citations in §8.2 and its layer dependencies now include Layer 3. The generic localization was already correctly attributed to pinned Mathlib and remains so.
- The repeated sphere-weight Check in §6.5 and the repeated shear Check in §7.2 are deleted; the explicit compatible/incompatible sphere values and explicit associated-graded shear computation remain. No mathematical target is deleted.

The whole README was read as a mathematical specification, including its supplier blocks, API bullets and worked examples. Additional repairs are:

- Replace the obsolete AlgebraicTopologyPartII AT2.4/G3 locator with its packaged Layer 4 rational sphere/loop direction. The five interfaces stay explicitly requested contracts, rather than being asserted as existing exports.
- Extend the spectral supplier locators through DeligneWeightsAndPurity §0.18, which actually states decomposition by weights. Clarify that §7.14 supplies the smooth upper weight bound through its upper Newton triangle: r+s=w and r,s≤i imply w≤2i. Its hypotheses are retained; it is not a general singular ordinary-cohomology bound.
- State r≥1 and dγ₀=0 directly in the relative-simplex defining formula, avoiding an implicit γ_(−1) convention.
- Make the analytic local lifts into the specified étale covers part of the compatible-good-cover contract consumed in §4.3; good nerve equivalences alone do not supply that map. Add its precise Weil II locator and describe the local lifts in the proof route.
- Replace the dangling reference to a target-folder `sources.toml` by the reference keys in the README; only the three requested files are ported.

No generality was narrowed: arbitrary commutative rings including zero, primes 2 and 3, singular and nonreduced separated finite-type schemes, arbitrary algebraically closed bases, and proper smooth schemes without projectivity remain within their stated domains. No computational algorithm or copied source passage is introduced.

## Supplier verification and ownership sweep

Pins were read from `lake-manifest.json` and confirmed at the package checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main is the requested `d2e0f0d`.

The merged shape models read were `TauCetiRoadmap/ComplexTori/README.md`, `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and `Completed/HodgeStructures/README.md`. The port keeps the package’s more detailed layer form.

| Supplier | Resolved input and boundary |
| --- | --- |
| Mathlib divided powers | `Mathlib/RingTheory/DividedPowerAlgebra/Init.lean`: carrier line 99, dp line 127, product line 171, extensionality line 235, lift line 346 and map line 418. The basis remark at line 249 refers outside the available development; it is not an implemented rank-one lattice theorem. The target identifies the concrete integral lattice rather than rebuilding the universal algebra. |
| Mathlib exterior algebra | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean` line 60, with the alternating universal property at line 109. This includes repeated-factor vanishing at 2. |
| Mathlib simplicial cochains | `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean` line 33; `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean` line 75; `Mathlib/CategoryTheory/Abelian/Ext.lean` line 56. The composite uses free coefficient modules and their module-valued Hom complex. |
| Mathlib normalization, ML and localization | `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean` line 167; `Mathlib/CategoryTheory/CofilteredSystem.lean` line 137; `Mathlib/CategoryTheory/Localization/Construction.lean` lines 106 and 111. Set-valued ML is not module-limit exactness, and categorical localization is not an enriched or monoidal comparison. |
| Native DG algebra | `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean` line 182; `TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean` line 50; `TauCeti/Algebra/Homology/DG/Algebra/Cohomology.lean` lines 182 and 257. Degree +1, square-zero and Leibniz are recorded; nonnegative support and strict graded commutativity are additional conditions. |
| Native topological cohomology | `TauCeti/AlgebraicTopology/Cohomology/Basic.lean` lines 60 and 94; `TauCeti/AlgebraicTopology/Cohomology/Cup.lean` line 203. Cup product retains the source diagonal, coefficient pairing and degree equality. |
| Native mixed Hodge structure | `TauCeti/Geometry/Hodge/Mixed/Basic.lean` line 72. Increasing rational W, decreasing complex F, boundedness and pure graded pieces are present; geometric realization and finite dimension are not fields of this carrier. |
| DGAInfinity and AlgebraicTopology | Main DGAInfinity Layers 1, 3, 8; main AlgebraicTopology Stage 4 item 7 and Stages 5–6. Sullivan minimality is distinguished from A∞ minimality. |
| DerivedDeRhamCohomology and DerivedModuleAlgebra | New-roadmap head §2.21 explicitly defines the strict predicates; main §§0.DP.2–.3, 0.14–.17, 1.T.1 and 1.1 own homogeneous powers, décalage and tower exactness. The application-specific coefficient resolution and ML verifications remain here. |
| Ordinary pro-category | Main AdicSpacesPartII R0.19.9 uses opposite-Ind and the correct lim-target/colim-source Hom formula. DiamondsAndVStacks D0.13 forwards that owner and supplies size bounds. EH.0 specializes pro-space reindexing; neither materialization nor a completed pro-space is substituted. |
| Étale input | EtaleHomotopyTypes EH.3’s raw rigid type and cohomology sections were read in its board specification. Main EtaleCohomologyFoundations F.2.2 explicitly includes separably closed field extension, F.3 ordinary direct images and finiteness, F.4 adic comparison and actions, F.10.1–.2b Frobenius. |
| Complex topology and logarithmic realization | ComplexComparisonPartII C6.0–.1, C6.3 and C6.6 have the separated, singular/noncompact topology and the finite/adic comparison domains used here. C5.3 and C5.5 give the pure/logarithmic directions. MotivicEtaleKTheory §§3.1–3.2 and 3.4 give the smooth logarithmic mixed realization, with WₘHⁱ induced from Wₘ₋ᵢ, but do not claim the requested singular hyperresolution extension. |
| Resolution and compactification | ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6 and 6.1–6.4 retain initial-boundary and quasi-projectivity hypotheses. Main SchemeAndStackFoundations §0.9, Layer 2, §§4.17 and 4.19, and main EtaleCohomologyFoundations G.1–G.3 supply the respective descent, SNC, alteration and proper-compactification inputs. Proper does not imply projective. |
| Weights | DeligneWeightsAndPurity §§0.1–.18, 7.12, 7.14–.15, 8.20–.24 have the finite-field and finite-dimensional hypotheses used. Arbitrary-base independence, general singular ordinary bounds and normal H¹ are explicitly requested extensions, not assertions made by these existing targets. |
| Algebraic groups | Main ReductiveGroups Layers 5/5P, 6 and 6A supply the characteristic-zero finite-stage polynomial Lie and Levi/torsor input. Compatible inverse-limit sections and conjugators are owned by §7.2 here. |
| Unipotent fundamental groups | AnabelianGeometryAndNonabelianChabauty §§2.1–2.3 distinguish lower-central and tensor-length towers and have the smooth characteristic-zero curve domain. The normal-variety extension remains an explicit contract. Its §1.5 already owns an uncompleted étale-type construction; this roadmap applies forms to a supplied type and makes no second raw-type target. |

The required `roadmaps list`, `roadmaps grep` and `roadmaps show` tools were used. Searches by object covered main and all 357 indexed open heads, with the supplied sibling heads available read-only, and the board’s package/specification texts. Search families included Sullivan/Hirsch models, polynomial and divided-power forms, rigid étale types, generalized spectra and model weights, hyperresolutions, prounipotent splittings, and unipotent Lie presentations. The broad and narrowed results were read for the relevant mathematical hits. Native pins were searched independently by object and hypotheses. The named open roadmaps on the brief’s sibling list add no second owner of the relative-form or model-weight targets. Heads revising a main roadmap were not used as suppliers. No unprovided head was fetched separately.

No additional duplicate mathematical target was found in the accepted local scope, so there is no new duplication deletion to record in Scope and ownership. That section retains the existing division among native DG and Hodge carriers, generic powers/towers, supplied topological and étale types, geometric weights, finite algebraic groups and this roadmap’s form-algebra and compatible-model comparisons. Existing owner material is not restated in Lean. No fully qualified declaration can collide: the acceptance namespace contains no declarations.

Mathlib/Zulip web searches for Sullivan models, polynomial forms and divided powers did not locate an additional applicable API proposal. This is a limited search result, not a claim that no such work exists. The roadmap follows the pinned Mathlib carriers and never waits for, or assigns work to, Mathlib.

## Source verification

The seven legal cached texts were opened directly; the extraction line numbers below, not remembered theorem names, locate the claims. Source statements are paraphrased in the README. The long Weil II PDF exceeded the web fetch size limit; its cached numbered extraction was used. The public Morgan correction was also opened online and agrees with the extraction. The two published supporting references Miller and SGA 5 remain locator-only; no reading of inaccessible text is claimed.

| Source | Passages read and role |
| --- | --- |
| weil-II | weil-II line 3650 through line 3975: all of §5’s form construction, integral and completed comparisons, analytic comparison, eigenvalue products, scalar descent, splitting, formality and normal presentation, plus the stronger assertions left as questions. The finite-block argument in §6.6 and compatible pro-lifting in §7.2 remain proof obligations here. |
| morgan | morgan line 1017 through line 1184: Hirsch/minimal definitions, homotopies, lifting, existence and rigidity; morgan line 2245 through line 2278: relation types and finite-nilpotent cutoffs. The latter alone has a smooth complex domain, not arbitrary normal schemes. |
| morgan-correction | morgan-correction line 29 through line 46: indecomposables are not generally rigid; their canonical associated graded is. The correction preserves the other presentation results. |
| dgms | dgms line 435 through line 468: polynomial forms and multiplicative de Rham comparison; its simply connected spatial interpretation is not imposed on generic connected DG algebra models. |
| sullivan | sullivan line 1023 through line 1068: algebraic groups, Levi conjugacy and rational points of unipotent torsors. These finite-dimensional assertions are not presented as a proof of compatible pro-limits. |
| poids | poids line 127 through line 215: general/proper/smooth weights, normal H¹, relation bounds, spread Frobenius and Hodge compatibility. The ordinary and compact-support domains are distinguished. |
| hodge-III | hodge-III line 1194 through line 1229 and line 1279 through line 1285: separated finite-type hyperresolution realization, independence, bounds, Künneth and cup compatibility, including singular schemes. |

No suspicious instruction in source or review text was acted on. Commands quoted by other documents were treated as text; task authorization governs all actions.

## Computed adversarial mathematics pass

These are independent recomputations, not a copy of the accepted review’s verdicts. K denotes a characteristic-zero field. Every numeric denominator below is nonzero in K. Each row records the defining statement or a separate API law; example checks test general statements without purporting to prove them. Inapplicable inputs are evaluated as negative controls rather than silently inserted into a theorem’s domain. No Lean theorem is justified by a `sorry` build.

| Statement | Instances tried | Computed values on both sides or excluded model | Result; change |
| --- | --- | --- | --- |
| Convention: Koszul sign | Odd a,b in Λ_K(a,b); characteristic 2 | ab=−ba over K; at 2, ab=ba while a²=0 | Alternating axiom is retained separately. |
| Convention: differential degree and sign | da=u, db=0, degrees 1,2 | d(ab)=ub−a·0=ub, degree 4; d²(ab)=0 | Degree +1 retained. |
| Convention: weight of d | dy=x², degrees 3,2 | w(y)=4 gives w(dy)=4=2+2; w(y)=3 gives 3≠4 | Incorrect grading excluded. |
| Convention: geometric Frobenius | ℙ¹ over 𝔽₂ and 𝔽₃ | Spectra (1,2),(1,3); inverse spectra (1,1/2),(1,1/3); weights (0,2) versus (0,−2) | Same twist direction in all layers/suppliers. |
| Convention: q>1 | q=1, w=0,2 | 1⁰=1¹=1, so unequal weights have the same magnitude | q=1 remains excluded. |
| Convention: cohomology/Lie duality | 𝔾_m, elliptic curve | H¹ weights 2 and (1,1); dual weights −2 and (−1,−1) | Signs retained. |
| Convention: positive coefficient exponent | ℓ=2, r=0,1 | ℤ/(2⁰)=0 with 1 element; ℤ/2 has 2 elements | r=0 is not a finite-coefficient stage. |
| Convention: integral versus rational normalization | ℓ=2,3 | 2 and 3 are nonunits integrally; 2/2!=1 and 3/3!=1/2 rationally | No integral factorial inversion. |
| Convention: size and pro-map direction | Small constant point and two-point diagrams | Hom(*,*) has 1 element, Hom(*,{0,1}) has 2; pullback of 1 is (1,1) | Fixed small diagrams and contravariance retained. |
| §0.1 CDGA and connectedness | Λ(a,b), zero algebra, 𝔽₂[e] | H⁰=K versus 0; ab≠0; odd e²≠0 in the polynomial algebra | Zero and odd-polynomial models excluded where required. |
| §0.1 API forget refinement | Λ(a,b), d=0 | Both underlying and refined cohomology have ranks (1,2,1), [a][b]=[ab] | Product is retained. |
| §0.1 API commutation | Degrees (1,1),(2,3) | ab=−ba; xy=yx since (−1)⁶=1 | Degree, not weight, sets the sign. |
| §0.1 API odd squares | ℤ and 𝔽₂ | e²=0 in both exterior algebras; polynomial e² is a nonzero basis monomial at 2 | Extra axiom separates the objects. |
| §0.1 API morphisms | a↦2a then a↦3a | Composite a↦6a; identity gives a↦a | Native composition reused. |
| §0.1 API characteristic-zero implication | Odd a over ℚ versus 𝔽₂ | a²=−a² gives 2a²=0, hence a²=0 over ℚ; at 2 the equality is 0=0 | Characteristic restriction essential. |
| §0.1 localization | a↦2a on Λ_ℚ(a) | H¹ scalar 2; inverse scalar 1/2; composites both 1 | Mathlib localization suffices. |
| §1.1 concrete lattice | n=0,1,2,3; ℤ,𝔽₂,𝔽₃ | γ₀=1, γ₁²=2γ₂, γ₁³=6γ₃; latter products vanish at 2/3 without killing γ₂/γ₃ | Integral normalization retained. |
| §1.1 API lattice comparison | n=2 over ℤ | dp(2,1) maps to t²/2; its double maps to t² | Not an ordinary integral polynomial basis. |
| §1.1 API free basis/base extension | Rank 1, R=𝔽₂ and R=0 | γ₂ spans a 1-dimensional 𝔽₂ line; after zero-ring extension its sole value is 0 | Zero-ring case retained. |
| §1.1 API multiplication | m=n=1, m=2,n=3 | Coefficients binom(2,1)=2 and binom(5,2)=10 | Native dp product reused. |
| §1.1 API t-transition | n=0,1,2 | tγ₀=γ₁, tγ₁=2γ₂, tγ₂=3γ₃ | No uniformizer substitution. |
| §1.1 API rational comparison | γ₂,γ₃ over ℚ | Images t²/2,t³/6; product has coefficient 1/12 | Nonzero denominators explicit. |
| §1.1 API extensionality | Maps into 𝔽₂[ε]/ε² | Both send γ₁↦0; γ₂↦0 versus ε, with ε≠0 | All divided powers are needed. |
| §1.2 bigrading | One edge, p=0,1 and n=0,1 | Ω₀¹=0, Ω₁¹=R·dx₀; d sends (0,1) to (1,1) | Cochain and t-degrees distinguished. |
| §1.2 API component inclusion | γ₀+γ₂ | Supported indices {0,2}; sum has exactly those two components | Direct-sum inclusion tested. |
| §1.2 API d and d² | x₀ on an edge | dx₀ has degree (1,1), d²x₀=0 | Differential law retained. |
| §1.2 API degree-additive product | x₀ of (0,1), dx₁ of (1,1) | x₀dx₁ has (1,2); dx₀dx₁=−dx₁dx₀ | Both product degrees and sign retained. |
| §1.2 API coordinate action | γ₁ acting on γ₂ | Value 3γ₃, not γ₃ | Same R{t} action. |
| §1.2 API component extensionality | Identity versus projection killing n=2 | On γ₂ the values are γ₂ and 0 | Bidegree evaluations separate maps. |
| §1.3 relative simplex | Point and edge over ℤ,𝔽₂ | Point dx₀=0,x₀=t; edge dx₀=−dx₁; dγ₂(x₀)=x₀dx₀ | Quotient is by dt; formula now explicitly r≥1. |
| §1.3 API quotient comparison | Point versus imposing t=1 | Actual Γ(R) survives; t=1 would force 2γ₂=1 over ℤ | Wrong quotient excluded. |
| §1.3 API divided derivation | r=0,1,2 | dγ₀=0, dγ₁=dx, dγ₂=x·dx | No negative-index truncation. |
| §1.3 API diagonal | Edge | d(x₀+x₁)=dx₀+dx₁=0; x₀+x₁=t | t is retained. |
| §1.3 API coefficient extension | ℤ→𝔽₂, r=2 | dγ₂=x·dx before and after reduction, γ₁² becomes 0 | Extension precedes global Hom. |
| §1.3 API alternating factor | Edge over 𝔽₂ | dx₀²=0; odd symmetric replacement has dx₀²≠0 | Native exterior carrier reused. |
| §1.3 API map extensionality | The two §1.1 maps on the point | x₀↦0 for both, γ₂↦0 versus ε | All γ_r and dx_i detect maps. |
| §1.3 coefficient generality | ℤ₃[π]/(π²−3), 𝔽₃[[π]] | tγ₂=π²γ₃ in the former, 0 in the latter; πγ₃ differs in both | No ℤ_p-only formula generalized to DVRs. |
| §1.4 pullback | Omitted vertex, 2/3-vertex collapse, identity | Omitted x↦0; γ₂ of the sum is Σγ₂(x_i)+Σ_(i<j)x_ix_j; identity fixes γ₂ | Mixed terms and composition direction retained. |
| §2.1 compatible families | Empty set, point, two glued edges | Empty module 0; point Ω₁⁰=Rγ₁; shared vertex values 0 and γ₁ fail, γ₁ and γ₁ agree | Compatibility defines the object. |
| §2.1 API evaluation | Degenerate edge from a vertex | Pullback of γ₁(t) is γ₁(x₀+x₁); independent value 0 disagrees | Degeneracies enforced. |
| §2.1 API extensionality | Zero versus t on Δ¹ | At vertex 0 values 0 versus γ₁, hence forms differ | Simplex evaluations separate. |
| §2.1 API space maps | Two points→point | 1γ₁↦(1,1)γ₁; two successive identities still give (1,1) | Pullback is contravariant. |
| §2.1 API ring maps | ℤ→ℤ/4→ℤ/2 | 3γ₁↦3γ₁↦γ₁, same as direct reduction | Coefficient naturality. |
| §2.1 API representable simplex | Δ¹, identity simplex | Evaluation recovers x₀,x₁ and dx₀=−dx₁ | Yoneda comparison preserves t. |
| §2.2 coefficient homotopy | (p,n,i)=(0,0,0),(0,1,0),(1,1,1); R=0 | Answers R,0,R; normalized R→R has identity d and homology 0; zero coefficients give 0 in all positions | Simplicial and form directions distinguished. |
| §2.3 triangular comparison | Circle, torus at 2, empty set | Circle H¹Ω₀=0,H¹Ω₁=R; torus product 2abγ₂=0 mod 2 while ab≠0 ordinarily; empty groups 0 | Triangle and binomial product retained. |
| §2.4 principal quotient/diagonal | Point mod4→2, unit ideal, RP², infinite polynomial ideal | 3γ₁↦γ₁; quotient by 1 gives 0→0; H¹(RP²,ℤ)=0 but mod2 is 𝔽₂; sequence (x_i) has nonzero class modulo I∏R but zero image in ∏(R/I) | No arbitrary-ideal or diagonal base-change assertion. |
| §2.5 rational stabilization | Point, edge, disjoint edges | γ₂↦t²/2; degree-0 image misses x₁; family x₁ᴺ needs bound ≥N, so no common finite bound | Quasi-isomorphism does not mean degreewise surjectivity. |
| §3.1 finite pro-colimit | Constant point and finite-support module tower | Point remains (ℤ/ℓʳ)γₙ; (ℓⁱ) has finite support mod ℓʳ but infinite ℤ_ℓ support | lim/colim order retained. |
| §3.1 API colimit stages | Point; identity transition | γ₂ maps to γ₂ at every stage | Stage maps commute. |
| §3.1 API reindexing | Even cofinal subtower of constant point | Both colimits have one coefficient line, 1↦1 | No dependence on cofinal labels. |
| §3.1 API pro-pullback | Two points→point over 𝔽₃ | 1↦(1,1), not summation R²→R | Space/form directions agree. |
| §3.1 API coefficient reduction | ℓ=2,r=1, coefficient 3 | 3 mod4↦1 mod2 before/after the constant colimit | Reductions commute. |
| §3.1 API triangular colimit | Constant two-torus over 𝔽₂ | Product remains 2abγ₂=0 | Colimit does not remove the binomial factor. |
| §3.1 API universal map | Constant point, compatible maps γₙ↦n-th coordinate | At n=2 every stage value is the same γ₂; setting one stage value 0 violates compatibility | Stage maps determine the colimit map. |
| §3.2 finiteness (F) | Point, S¹, CP∞, countable wedge of circles | Cardinalities by degree: point (ℓ,1,…), circle (ℓ,ℓ,1,…), CP∞ (ℓ,1,ℓ,1,…); wedge H¹ has infinitely many coordinate vectors | F is degreewise, not bounded amplitude. |
| §3.2 API finite mod-ℓ groups | Circle at ℓ=2 | H⁰,H¹ each have 2 elements, higher groups 1 element | Nonzero higher cohomology permitted. |
| §3.2 API compatible inverse limit | Point, ℓ=2, element 3 | Reductions mod4 and mod2 are 3 and 1, with 3 mod2=1 | Integral limit retains reduction maps. |
| §3.2 API rationalization | Integral ℤ₂ and ℤ/2 examples | ℤ₂⊗ℚ₂=ℚ₂, (ℤ/2)⊗ℚ₂=0 | Torsion is killed only here. |
| §3.2 API cofinal invariance | Constant circle, even indices | H¹ cardinality 2 in both mod2 colimits | F invariant under reindexing. |
| §3.2 API cohomology equivalence | Circle identity, or point→circle | Identity gives ranks (1,1)→(1,1); point→circle fails the degree-1 isomorphism, 1 versus 0 | Equivalence condition is substantive. |
| §3.3 universal coefficients | ℤ_ℓ --ℓ→ℤ_ℓ in degrees 1,2 | H¹=0,H²=ℤ/ℓ; reduced H¹=𝔽_ℓ equals Tor₁(ℤ/ℓ,𝔽_ℓ), tensor term 0 | Tor degree i+1 is necessary. |
| §3.4 completed forms | Point, circle diagonal, infinite t-support | Point n-piece ℤ_ℓγₙ; circle diagonal cokernel mod2 has 2 elements; Σγₙ has infinite support and is excluded | Completion is bidegreewise. |
| §3.4 API projections | Point, ℓ=3, integral coefficient 5 | Reductions are 5 mod9 and 2 mod3; transition sends 5↦2 | Compatible finite levels. |
| §3.4 API multiplication | Point n=m=1 at ℓ=2 | γ₁²=2γ₂; mod2 value 0, mod4 value 2γ₂ | Limit retains the integral product. |
| §3.4 API differential | Edge, x₀ | At every coefficient level d²x₀=0; limit value 0 | No change in bidegree. |
| §3.4 API cohomology comparison | Constant circle, n=1 | lim_r ℤ/2ʳ=ℤ₂ for H¹, not 𝔽₂ | Requires the stated cycle/boundary proof. |
| §3.4 API maps | Two points→point | Completed H⁰ pullback 1↦(1,1) | Completion preserves contravariance. |
| §3.4 API limit universal property | Point and compatible residues of 3 | All residues determine 3; residues of 3 and 7 differ mod8, 3≠7 | Reduction maps detect equality. |
| §3.5 stabilized A_ℓ | (n,m)=(0,0),(1,1),(1,2),(2,3) | binom(n+m,n)/(n+m)! gives 1,1,1/2,1/12, equal to 1/(n!m!) | Normalized product is ordinary cup. |
| §3.5 API transitions | n=1,2 | (n+1)/(n+1)! gives 1,1/2, equal to 1/n! | t-transition is normalized correctly. |
| §3.5 API maps | Two points→point | Rational H⁰ map 1↦(1,1) | DG algebra functor remains contravariant. |
| §3.5 API ring comparison | Torus, t-degrees 1,1 | 2/2!=1, so product maps to ab on both sides | Scalar-only comparison is insufficient. |
| §3.5 API cofinality | Point with even reindexing | Both stabilized algebras have unit 1 and γ₂ class 1/2 | Canonical comparisons agree. |
| §3.5 API cohomology-equivalence invariance | Point and a contractible edge | H* ranks (1,0,…) on each, so the comparison is 1 in H⁰ and 0→0 above | Finite-coefficient condition is the input. |
| §3.5 API universal DG map | Point with evaluation γₙ↦1/n! | Unit value 1; n=2,m=3 gives 10/120=1/12 on either product route | Unit and product conditions necessary. |
| §4.1 étale realization | Point, two points, thickened point, ℓ=p on A¹ | H⁰ ranks 1,2,1; thickening has higher groups 0; Artin–Schreier classes tᵐ for p∤m give infinitely many H¹ classes | Connectedness and invertibility retained. |
| §4.1 API ordinary ring | A¹ and ℙ¹ | A¹ has H⁰ rank1 but H⁰_c=0; ℙ¹ has H² eigenvalue q | Compact supports cannot replace ordinary cohomology. |
| §4.1 API refinements | Point refinement | H⁰ scalar 1, positive groups 0 on both sides | Cohomological identification normalized. |
| §4.1 API field enlargement | Spec k⊂Spec K for algebraically closed k⊂K | H⁰ map 1↦1, ranks 1→1 | Countable field is a field of definition. |
| §4.1 API functorial maps | Two points→point, then identity | H⁰ pullback 1↦(1,1) before/after identity | Composition retained in localization. |
| §4.1 API connected models | Point versus two points | H⁰ dimensions 1 and 2 | A single connected model applies only to the first. |
| §4.1a finite/raw comparison | Point, two points, 𝔾_m | Completed γ₂ is the same basis element on both sides; stabilized value 1/2; H⁰ ranks 2→2 and H¹ ranks 1→1 | Map points from finite forms to rigid forms. |
| §4.1a API finite-coefficient pullback | Geometric point mod3 | Unit 1↦1; d1=0↦0 | Product and d commute with refinement. |
| §4.1a API completed quasi-isomorphism | Two points | Primitive idempotents (1,0),(0,1) retained, H⁰ dimension 2 on each side | No component collapse. |
| §4.1a API descent equivariance | Frobenius transposition | F(1,0)=(0,1) in both presentations | Continuity is still restricted to finite-component forms. |
| §4.2 Galois continuity | Point, finite 2/3-cycles, rigid infinite 2ʲ-cycles | Stabilizer indices 1 and 6; ⋂_j2ʲℤ̂ contains no finite-index open subgroup | Raw discrete continuity is correctly excluded. |
| §4.3 nerve comparison | 𝔾_m, two arcs with disconnected intersection, two points | H¹ ranks1→1; ordinary arc nerve H¹=0 but component graph has E−V+1=2−2+1=1; singleton nerve H⁰ rank2 | Good covers and local lifts are distinct inputs; lifts made explicit. |
| §4.4 complex model | 𝔾_m, elliptic curve, disconnected pair | Λ(a) H¹ rank1; Λ(a,b) ranks(1,2,1) with ab≠0; pair H⁰ rank2 | Connectedness required only for a single model. |
| §5.1 geometric filtration | G_m, elliptic curve, nodal curve C, C×G_m, dual numbers | H¹ weights 2,1,0; product H¹ weights{0,2}, H² has two weight2 lines; thickened point W₋₁=0,W₀=K | General singular/nonproper and nonreduced scope retained. |
| §5.1 logarithmic weight shift | dlog and dlog₁∧dlog₂ | Complex residue weights1,2 induce cohomology weights1+1=2 and 2+2=4 | Shift Wₘ₋ᵢ is essential. |
| §5.2 Frobenius/Hodge comparison | ℙ¹ at q=2,3 | Eigenvalues (1,2),(1,3); total W₀ rank1,W₂ rank2 in both cases | Eigenvalues vary; filtration agrees. |
| §6.1 admissible filtration | Λ(a,b), K[x₂], dy₃=x₂² | Constant exterior filtration valid; span{1,x} omits x²; algebra(y) omits dy=x² | Both closures required. |
| §6.1 API exhaustivity | Constant Λ(a,b) | 1,a,b,ab all lie at stage0 | No missing product. |
| §6.1 API finite degree | K[x₂] | dim M²ʲ=1, dim M²ʲ⁺¹=0 | Finite generators do not imply finite total dimension. |
| §6.1 API stability equality | a↦2a in Λ(a) | Image is K⊕Ka, inverse a↦a/2 | Onto stability, not just inclusion. |
| §6.1 API local finiteness | Shear on span{a,b} | σⁿb=b+na, orbit span dimension2 | Infinite order permits finite orbit span. |
| §6.1 API reindexing | Constant Λ(a,b), even stages | Stage algebras and union both have ranks(1,2,1) | Cofinality preserves union. |
| §6.1 API extensionality | Same constant algebra with two generator enumerations | Both stages contain 1,a,b,ab and hence are the same four-dimensional algebra | Witness order does not change filtration. |
| §6.2 stable representatives | Constant exterior model, punctured line, ℚ₇ extension, bad flag | Punctured line H¹ rank2,H²=0 but Lie degrees2,1,2,3,…; α²=2 mod7 has α≡3 and gives b↦b+αa; swap sends [a] outside L[a] for the bad first stage | Finite cohomology and field-extension law retained without finite M¹. |
| §6.3 spectral grading | J₂(1), eigenvalues2,3, invertible σ | dim ker(J−1)=1, dim ker((J−1)²)=2; products have eigenvalue6; generalized 0-space is0 | Generalized, multiplicative spectrum. |
| §6.3 API membership | b in Jordan block | (J−1)b=a≠0, (J−1)²b=0 | Positive powers required. |
| §6.3 API direct sum | diag(2,3) | E₂=Ka,E₃=Kb, intersection0, sum dimension2 | All components included. |
| §6.3 API products | Closed a,b with σa=2a,σb=3b | σ(ab)=6ab, not5ab | Product indices multiply. |
| §6.3 API differential | dy=x², σx=2x | σdy=4x²=d(4y) | Same eigenvalue on a vector and its differential. |
| §6.3 API finite-piece restriction | J₂(1) on a two-generator block | Generalized1-piece dimension2 in block and union | Native primary decomposition applies on finite pieces. |
| §6.3 API uniqueness | diag(2,3), reversed labels | Correct E₂=Ka; reversed label gives Kb and fails σa=2a | Component spaces determine the grading. |
| §6.4 eigenvalue products | Sphere model, linear acyclic pair, unit | σy=a²y uses degree sum4≥3; du=v permits arbitrary β although positive H*=0; unit has empty product1, sum0 | Minimality and inequality direction retained. |
| §6.5 integer weights | Sphere, G_m, Jordan2 block | Weights(2,4) satisfy dy; degree1 G_m has weight2; Jordan H¹ weight2,H² weight4 | Duplicate sphere Check deleted; stronger one remains. |
| §6.5 API d weight0 | dy=x² with weights2,4 | Weight(dy)=4=weight(y) | Wrong weight3 fails. |
| §6.5 API product addition | a,b weights1,2 | ab has weight3 | Not multiplicative weight labels. |
| §6.5 API induced cohomology | Λ(a,b), d=0, weights1,2 | H¹ splits in weights1,2 and H² in weight3 | Same coarsening on cohomology. |
| §6.5 API lower bound | Sphere model | x degree2/weight2, y degree3/weight4; no weight<degree terms | Bound allows strict inequality. |
| §6.5 API Galois descent | Conjugate eigenvalues ±√2, q=2 | Both have absolute value √2 and weight1; joint weight line-space dimension2 is rational | Galois-invariant coarsening, not individual eigenlines, descends. |
| §6.5 API extensionality | Λ(a), weight1 versus weight2 | At (degree1,weight1), components Ka versus0 | Componentwise test distinguishes gradings. |
| §6.6 common filtration | Noncommuting shears A,B; line a+b | AB=((2,1),(1,1)),BA=((1,1),(1,2)); Aⁿ=((1,n),(0,1)); diag(2,4)(a+b)=2a+4b∉K(a+b) | No finite-group averaging assumption. |
| §7.1 weight extension | Λ(a), weights1,2, bad flag | One-generator G₂=G_m,U=1; λ=2 gives(2,4); swap fails to preserve Λ(a) | Filtered, not unrestricted stage automorphisms. |
| §7.1 API finite projections | Λ(a,b) with constant filtration | Scalar maps(2,4) project to the same matrices at all stages | Compatibility tested. |
| §7.1 API kernel | Λ(a) weight1 | Gr(g)=id forces a↦a, so U={1} | Kernel is associated-graded identity. |
| §7.1 API section/grading correspondence | Weights1,2, λ=2,3 | Matrices diag(2,4),diag(3,9) multiply to diag(6,36), equal to action at6 | Algebraic G_m action matches integer grading. |
| §7.1 API field extension equations | b↦b+ca with c=√2 in ℚ₇ | At rational c=1 and extended c=√2, determinant1 and d=0 are unchanged | Finite equations, not an infinite-product tensor identity. |
| §7.1 API U characterization | Shear g(b)=b+a | Gr(g)=id; H¹(g)[b]=[b]+[a]≠[b] | Explicit stronger shear Check retained. |
| §7.1 API pro-point extensionality | Constant two-generator tower | Identity and shear differ already at b: b versus b+a | Finite projections separate points. |
| §7.2 pro-splitting/conjugacy | G_a⋊G_m, c=0,1 | s₁(2)s₁(3)=(-1,2)(-2,3)=(-5,6)=s₁(6); conjugation by(c,1) gives c(1−λ); c=0 gives0 | Compatible pro-lifting remains a target; duplicate shear Check deleted. |
| §7.3 rational weights | G_m and elliptic curve | W₁H¹(G_m)=0,W₂ rank1; W₀H¹(E)=0,W₁ rank2; ab weight2 | Rational theorem uses geometric weights. |
| §7.4 grading conjugacy | a↦a,b↦b+a | Weight lines Ka,Kb become Ka,K(b+a); Gr identity but H¹ off-diagonal entry1 | No homotopy-identity conjugator claim. |
| §8.1 arbitrary-base splitting | Three punctures over 𝔽̄₂, ℓ=3; base 𝔽₄ | H¹ eigenvalues(2,2) and(4,4) at q=2,4; both weights(2,2) | No Betti model or characteristic-zero restriction introduced. |
| §8.2 formality | Elliptic curve, ℙ¹, G_m | ℙ¹ x↦[x],y↦0, dy↦[x]²=0; H*=K[x]/x²; diagonal projection kills G_m H¹ rank1 | Proper smooth purity is essential to this route. |
| §8.3 1-minimal Lie tower | Λ(a),Λ(a,b),dc=ab,ℙ¹, infinite H² target | Lie dimensions1,2,3; [A,B]=−C; ℙ¹ map H²:0→K injective; K→K⊕⊕Ke_j has H¹0→0,H²0→⊕Ke_j | Finite H² target is unnecessary. |
| §8.3 API finite nilpotence | dc=ab | [A,B]=−C, brackets with C vanish, all length3 brackets0 | Finite stage is two-step nilpotent. |
| §8.3 API bracket and Jacobi | A,B,C as above | dc(A,B)=1=−c([A,B]); Jacobi(A,B,C)=0+0+0=0 | Negative transpose fixes sign. |
| §8.3 API transition surjection | Add c with dc=ab | Dual map sends(A,B,C)↦(A,B,0), rank2 and onto | Direction matches inclusion of algebras. |
| §8.3 API cohomology conditions | ℙ¹ | H¹:0→0 is an isomorphism; H²:0→K is injective but not onto | H² injection retained. |
| §8.3 API dual grading | dc=ab, weights2,2,4 | Dual weights−2,−2,−4; bracket weight(−2)+(−2)=−4 | No dual sign loss. |
| §8.4 unipotent comparison | Three punctures; C₂,S₃ | Free depth1 dimension2,depth2 dimension3; finite-order u has m log u=0⇒u=1, so both finite-group completions are trivial | Completion is not the original group. |
| §8.5 normal presentation | Three punctures, curves g=0,1,2, nodal rational curve | Punctures V rank2,w=−2,R=0; g=0 V=R=0; g=1 V rank2,one bracket relation; g=2 V rank4,relation[a₁,b₁]+[a₂,b₂]; nodal H¹ weight0 | Normality and cutoffs retained. |
| §8.5 relation-weight intersection | H² weights0 through4, generator weights−1,−2 | [−4,0]∩(−∞,−2]={−4,−3,−2}; free length2 brackets have weights−2,−3,−4 | No relation weights0 or−1. |

The explicit supplier-extension statements have their own computed controls:

| Contract statement | Instances tried | Computed values | Result; change |
| --- | --- | --- | --- |
| Polynomial forms and multiplicative de Rham | Point, interval, two-torus | H* point=K; d(t)=dt gives H¹ interval=0; two closed torus generators have product ab≠0 | General simplicial/characteristic-zero contract retained. |
| Full and 1-minimal existence and indecomposables | Λ(a,b); sphere; nonminimal du=v | First model ranks(1,2,1); sphere has dy=x² but indecomposable dy=0; du=v has nonzero indecomposable differential | No arbitrary nilpotent-space hypothesis added. |
| Minimal quasi-isomorphism rigidity | a↦2a on Λ(a); a↦0 | First H¹ scalar2 is invertible and map inverse sends a↦a/2; second H¹ scalar0 is not invertible | Quasi-isomorphism condition separates the maps. |
| Polynomial homotopy and lifting | Constant path; maps e↦a and e↦2a | Endpoints of constant path both a; H¹ scalars1 and2 differ, so the latter maps admit no such homotopy | Homotopy is not equality of arbitrary endpoint maps. |
| Scalar extension of models | Λ_ℚ(a)→Λ_ℚ(a) and ℙ¹ 1-minimal model | Over ℚ₇ H¹ stays rank1; sphere 1-minimal H² map remains0→ℚ₇ | Flat field extension preserves the same cohomology conditions. |
| Finite-component presentation | Point, two points and raw infinite orbit labels | Finite H⁰ ranks1,2; raw indicators have stabilizer ⋂2ʲℤ̂ of infinite index | Finite-component contract is genuinely stronger than raw cohomology. |
| Compatible good covers with local lifts | Two-point cover; circle bad cover | Nerve H⁰ rank2; bad ordinary arc nerve H¹ rank0 versus circle rank1 | Cofinal good refinements and the specified lifts remain required; lifts made explicit. |
| Geometric mixed Hodge hyperresolution | Nodal rational curve, G_m, product | H¹ nodal weight0, H¹ G_m weight2; product H² has two weight2 lines | Smooth realization alone misses the singular input. |
| Arbitrary-base weight filtration | Three punctures over 𝔽₂,𝔽₄ | Eigenvalues2,2 and4,4 have weights2,2 for q=2,4 respectively | Common-spread independence is distinct from a fixed Frobenius computation. |
| General ordinary weight bound | C nodal proper rational, X=C×G_m | H¹ weights0,2; H² weights2,2; these lie in[0,2] and[0,4] | Neither smooth-only nor proper-only scope covers X. |
| Normal H¹ weights | G_m, elliptic curve, nodal rational curve | H¹ weights2,1,0 respectively; the last fails normality | Normality retains the {1,2} range. |
| General normal-variety unipotent category | Point, G_m, elliptic curve, three punctures | Depth-one dimensions0,1,2,2; free puncture depth-two dimension3 versus elliptic dimension2 | Existing smooth curve data do not by themselves state the full generality. |

A secondary direct arithmetic recomputation gives binom(5,2)=10, 5!=120 and 2!3!=12, so 10/120=1/12; the semidirect product gives −1+2(−2)=−5; the Heisenberg sign gives −c(−C)=1; and the two shear matrix products have unequal diagonal entries (2,1) and (1,2). Every Check and worked example was compared to the formulas in its layer, including the sphere’s nonzero minimal differential and the higher degree-one generators for punctured curves. No zero-denominator or natural-subtraction special case is used to manufacture a value.

## Unresolved conditions and limits

The port preserves the accepted conditional supplier decisions. It does **not** certify completion of the five requested AlgebraicTopologyPartII interfaces, compatible good-cover refinement, geometric mixed Hodge hyperresolution realization, arbitrary-base weight filtration, normal H¹ weights, or the general normal-variety unipotent category. The package also explicitly requests finite-component étale presentations and general ordinary-cohomology weight bounds; those requests remain explicit.

In particular, AlgebraicTopologyPartII’s packaged Layer 4 no longer contains the old AT2.4/G3 minimal-model target. The five general Sullivan contracts are stated here as requests, and their satisfaction by that supplier is unresolved. The two other names absent from the resolver have earlier specifications with matching locators, not content-repository heads. The worker must retain these distinctions when checking the submission; a successful gate is not evidence that the conditional supplier contracts have landed. No later-roadmap dependency, invented supplier declaration or new ownership transfer was used to hide a condition, and no supplier file was edited.

Miller and SGA 5 remain supporting published locators without accessible text. Weil II itself states §5.3.5 and leaves its technical proof to the reader; the target’s finite-block proof remains work in this roadmap. Likewise compatible pro-group lifting is a theorem to prove here. The computed audit establishes consistency of the tested instances, not the proofs of these general results.


Pull request: #1644 (roadmap/ell-adic-homotopy-types-and-weights at b61fda1)
