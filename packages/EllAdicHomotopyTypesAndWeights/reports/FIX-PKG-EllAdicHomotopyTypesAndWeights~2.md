# Repair findings and verification

## F01 (P1) — applied

Legacy G1–G8 → their actual local targets or exact supplier contracts. The top-level gaps list now contains only ten named-supplier records with slug, supplier, section and needs, matching the README. The brief authorizes editing that list; the review’s assertion that only appending is permitted is incorrect. No other plan field changes.

## F02 (P2) — applied

Locally imposed commutativity predicates → DerivedDeRhamCohomology §2.21’s predicates. Scope, the supplier contracts, §0.1, its Needs line and the build introduction now import the predicates; connectedness remains the local convention. The characteristic-2 exterior/polynomial distinction is preserved. Evidence: supplier §2.21; weil-II line 3665 and weil-II line 3710.

## F03 (P2) — applied differently

ComplexComparisonPartII’s singular mixed-Hodge extension → MotivicEtaleKTheory §§3.2/3.4, in both gap records and every Layer 5 dependency. ComplexComparisonPartII retains the pure/logarithmic inputs. ResolutionOfSingularitiesCharacteristicZero and proper compactification suppliers are explicit, with projectivity restricted to its actual domain. Scope distinguishes mixed Hodge modules. No supplier file or merge-order change is needed.

## F04 (P2) — applied

Constructing good covers again → using the contracted cover system to construct N→Et(X₁) and identify its contravariant finite-coefficient cohomology map with Artin comparison. Scope distinguishes EtaleHomotopyTypes §EH.6’s quasi-projective, completed homotopy-limit comparison. The two-arc negative control retains both ordinary-nerve and connected-component computations; a two-point control tests disconnectedness.

## F05 (P2) — applied differently

One Sullivan bundle → five contracts: polynomial de Rham comparison, model existence, rigidity, homotopy lifting and scalar extension. Rigidity receives its own slug instead of remaining bundled with existence. Every G3 citation and the old connected-sullivan-interface reference is replaced. Normal H¹ weights are separated from arbitrary-base filtration. All ten final gaps match the README verbatim.

## F06 (P3) — applied

The module docstring now explicitly includes §4.1’s étale realization theorem and its missing geometric carriers. The rejected-alternatives sentence is deleted. No theorem, definition, import or Lean name is added; elaboration succeeds with no declarations.

## F07 (P3) — applied differently

Stage 6 alone → pinned simplicial chains/cochains plus AlgebraicTopology Stage 4 item 7 and Stage 6. The review’s TauCeti.ChainComplex.linearYonedaObj is actually Mathlib’s ChainComplex.linearYonedaObj. DiamondsAndVStacks §D0.13 forwards the generic pro-category to AdicSpacesPartII §R0.19.9; that owner is cited. Section 3.1 imports §EH.0’s cohomology convention. Odd squares cite the exterior construction.

## F08 (P3) — applied differently

Repeated computations are deleted or combined, preserving the finite-support, component-nerve, unit and actual-conjugation information. Distinct controls replace otherwise duplicated edge and shear tests. The pattern search also consolidates repetitions in §§2.2, 3.4, 3.5, 4.1 and 6.3. Every definition retains at least three discriminating Checks; none is added to Lean.

## F09 (P3) — applied

A_l → A_ℓ throughout §3.5’s API; lγ_l → ℓγ_ℓ. The interval example now separates the integral value 1 from exactness dx₁=d(x₁), with the polynomial contraction giving H¹=0. No cohomology vanishing is inferred from the integral value.

# Ownership and locator evidence

The content snapshot is main at 5f173a7; Mathlib is pinned at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Pins were read from the content lake manifest. Three main-branch shapes were read: TauCetiRoadmap/ComplexTori/README.md, TauCetiRoadmap/DerivedModuleAlgebra/README.md and Completed/HodgeStructures/README.md.

The obsolete design records were resolved as follows; deleting them does not delete a mathematical obligation.

| Record | Location of the mathematical obligation |
| --- | --- |
| G1 | Local §§2.2–2.4 and 4.2: coefficient resolution, extendability, principal quotients and finite width. |
| G2 | Local §§3.3–3.4, importing DerivedModuleAlgebra §§1.T.1/1.1 for generic tower exactness. |
| G3 | ComplexComparisonPartII §§C6.0–C6.1 and gap:compatible-good-cover-refinement. |
| G4 | MotivicEtaleKTheory §§3.2/3.4 with gap:geometric-mixed-hodge-realization, DeligneWeightsAndPurity’s filtration contract, and local §5.1. |
| G5 | Local §§6.2 and 6.6, including the proof obligation in Weil II Lemme 5.3.5. |
| G6 | Local §7.2, including compatible sections and conjugators. |
| G7 | Local §8.4 and gap:normal-variety-unipotent-category. |
| G8 | EtaleCohomologyFoundations §§F.2.2, F.3 and F.4.1–F.4.6, EtaleHomotopyTypes §EH.3 and ComplexComparisonPartII §C6.3; no missing contract is invented. |

Cross-roadmap sections were resolved against main or the indexed open head. In particular:

- DerivedDeRhamCohomology §2.21 defines both homogeneous predicates, including odd squares at 2, on DGAInfinity’s nonnegative carrier.
- MotivicEtaleKTheory §§3.2/3.4 has smooth separated finite-type scope and already consumes ComplexComparisonPartII §§C5.1, C5.3, C5.5–C5.6 and ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4. Its Scope excludes singular hyperresolution theory, so that extension remains an explicit gap rather than an attributed theorem.
- ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6 and 6.1–6.4 supplies the stated resolution and boundary operations. Its §6.2 projective compactification has a quasi-projectivity hypothesis. EtaleCohomologyFoundations §§G.1–G.3 supplies proper compactifications and common refinements for the general separated case. Resolution preserves the smooth open after compactification; properness is never used to assert projectivity.
- MixedHodgeModulesAndIrregularHodgeTheory design §§H.1/operations and H.1/weight-bounds has quasi-projective/supported ambient scope and a Hodge-module construction. The requested Deligne hyperresolution realization has a different construction and includes general separated schemes.
- ComplexComparisonPartII §§C6.0–C6.1 includes singular, noncompact and nonreduced finite-type schemes; §§C6.3 and C6.6 supply finite and adic Artin comparisons. Good-cover compatibility is still expressly a gap. Its §§C5.3/C5.5 retain pure Hodge and logarithmic inputs.
- EtaleHomotopyTypes design §EH.0, “Local-coefficient detection”, uses the colimit convention. Its §EH.3 has the three cited rigid-type subsections; §EH.6, “Betti–étale comparison zigzag”, uses quasi-projective schemes, holim and the completed type. AlgebraicTopologyPartII design §AT2.4 has a nilpotent finite-type spatial model input, which does not supply the general connected-algebra contracts. Both designs were also read from the board’s main branch.
- DiamondsAndVStacks §D0.13 explicitly imports the generic pro-category from AdicSpacesPartII §R0.19.9. The latter uses the native opposite-Ind carrier, a small-diagram Hom formula and natural stage representatives. Section EH.0 remains the pro-space specialization with enlargement/reindexing interfaces; no new generic pro-category is owned here.
- The remaining contracts were opened at their actual sections: DerivedModuleAlgebra §§0.DP.2–0.DP.3, 0.14–0.17, 1.T.1/1.1; DGAInfinity Layers 1, 3, 8; AlgebraicTopology Stages 4–6; SchemeAndStackFoundations §0.9, Layer 2, §§4.17/4.19; DeligneWeightsAndPurity §§0.1–0.3, 0.7–0.15, 7.12/7.15, 8.20–8.24; ReductiveGroups Layers 5, 6/6A; AnabelianGeometryAndNonabelianChabauty §§2.1–2.3. Their domain restrictions remain in the README. In particular DeligneWeightsAndPurity’s general filtration and normal H¹ claims remain gaps, and the existing anabelian geometric category is restricted to curves.

The source evidence for changed contracts was read in the legal cached extractions:

| Claim | Evidence |
| --- | --- |
| Koszul signs versus alternating odd factors | weil-II line 3665, (5.1.2), p. 234; weil-II line 3710, (5.1.6.3), p. 235. |
| Polynomial forms, arbitrary characteristic-zero fields and multiplicative de Rham comparison | dgms line 448, Theorem 2.1, p. 255; sullivan line 1121 and sullivan line 1141, Theorem 7.1 and its polynomial example, pp. 296–299. |
| Full and 1-minimal models, lifting and rigidity | morgan line 1036, Definition 5.3; morgan line 1064, Theorem 5.6; morgan line 1119, Theorem 5.7; morgan line 1162, Proposition 5.9, pp. 163–167. Field extension preserves the free ordered algebra, decomposability and the cohomology conditions because it is flat. |
| General separated-scheme hyperresolutions and independence | hodge-III line 582, (6.2.8), pp. 20–21; hodge-III line 1194, (8.2.1), and hodge-III line 1204, Proposition 8.2.2, p. 38. Tensor compatibility is at hodge-III line 1155, (8.1.24), pp. 37–38. |
| Nerve map and the algebra comparison | weil-II line 3835, (5.2.4), and weil-II line 3847, (5.2.5), p. 239. |
| Weights and their field/spread interpretation | poids line 152, §8.3, p. 82; poids line 198, Theorem 14, pp. 83–84; weil-II line 3938, (5.3.6), p. 241. |
| Integral t transitions and rational normalization | weil-II line 3662, (5.1.1), p. 234; weil-II line 3792, (5.2.1.6–8), p. 238. |
| Interval exactness | sullivan line 1159, polynomial simplex contraction, p. 298; dx₁=d(x₁) directly. |

No new source was required. All nine manifest works have settled entries: seven legal cached texts and the existing uncertified SGA 5 and Miller entries. Neither uncertified work was reopened or represented as read. The source manifest and metadata are unchanged.

The ownership search used roadmaps grep by objects (divided-power forms, Sullivan/Hirsch models, homotopy algebras, hyperresolutions, good covers and Mal’cev objects), covering the indexed open heads and main, and searched board packages read-only. The relevant heads were opened with roadmaps show. Ownership against open pull requests was checked through that index, not through unrelated remote files. Main-roadmap revisions remain citations of the main copy. The local content is the pinned main snapshot, not the newer local main ref. The package retains ownership of Weil II §5’s relative-form construction and its geometric/minimal-model comparisons; no supplier construction is redeclared in Lean.

# Checks and gate outcomes

- Required elaboration: lake env lean on packages/EllAdicHomotopyTypesAndWeights/Suggested.lean, run from the content checkout, exited 0 with no output, errors or warnings. The command used the absolute file argument required by the brief. No TauCeti module is imported, so no targeted object-file build was necessary. No Lean process remains running.
- Mechanical binder audit: after stripping the module comment, there are zero declarations of any kind. Thus there are zero types to compare using #check @name; no binder disappeared, and no scratch declarations or padding were introduced. The single import is Mathlib; there is no set_option or sorry-data body.
- The statability audit found no Sullivan/polynomial-form/relative-form geometric carrier at either pin. Mathlib/RingTheory/DividedPowerAlgebra/ contains only Init.lean, with no homogeneous simplicial form complex. Tau Ceti’s abstract mixed Hodge structure is not a geometric realization. Each existing headline’s missing carriers remain identified in Suggested.lean, now including §4.1. The pinned DG and ordinary cochain carriers do not state these geometric headlines by themselves.
- Gap validation: all ten entries have exactly slug, supplier, section and needs; every supplier and section is named; every needs sentence matches the README contract; no legacy supplier-free entry remains. Comparing parsed plans with gaps removed gives equality. The other plan fields are unchanged.
- Check-count audit: all definition subsections retain at least three Checks. The theorem-only §§7.4, 8.1 and 8.4 have respectively one, two and two distinct Checks after consolidation; the brief imposes no minimum on theorem-only subsections. No Check has a Lean counterpart.
- Final dependency command: the brief’s gate --depcheck invocation with --name EllAdicHomotopyTypesAndWeights, --order merge-order/ORDER.txt and --movable exited 0. Its exact output was:

      depcheck: 51 roadmaps, 594 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The added direct suppliers are earlier. No merge-order file was edited.
- Citation resolver: no unresolved Lean names. Its roadmap-name leads are AlgebraicTopologyPartII, EtaleHomotopyTypes and MixedHodgeModulesAndIrregularHodgeTheory, whose exact sections were found in their board-main designs. The resolver cannot see these designs. Its statement that it did not check external pinned names was compensated by opening the actual pinned files: SSet.chainComplex in Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:75 and ChainComplex.linearYonedaObj in Mathlib/CategoryTheory/Abelian/Ext.lean:56. TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60 uses this composite; TauCeti/Algebra/Homology/LinearYoneda.lean:56 supplies its functorial adapter, not another object declaration.
- git diff --check exited 0 with no output. The package pattern audit finds no old G3/connected-sullivan-interface citation, A_l spelling, lγ_l formula or erroneous TauCeti.ChainComplex.linearYonedaObj name in the README. No additional gate failures were listed in the brief.

# Adversarial mathematics pass

Values below were recomputed, not inferred from successful sorry elaboration. Each target has a row; convention and supplier-interface rows cover the changes that are not separate local targets. The finite examples test the general statements without replacing their full scope. A passing example is evidence against the stated wrong model, not a proof of a headline theorem.

| Statement | Instances tried | Computed values on the two sides or against the wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Universe and pro-map direction | Constant one-point and two-point diagrams; identity refinement | Hom(*,*) has 1 element; Hom(*,{0,1}) has 2; identity pullback fixes (1,0) and (0,1) | Consistent | Cite actual pro owners. |
| Degree, support and completion conventions | x₀, dx₀; finite γ₀+γ₂ and infinite Σγₙ | d sends (0,1) to (1,1); p≤n; finite support has 2 entries, infinite support is excluded before and after completion | Consistent | Consolidate finite-support Check. |
| Sign and odd-square conventions | Λ(e) over ℤ/𝔽₂; 𝔽₂[e] | e²=0 in both exterior examples; e²≠0 in the polynomial example although −1=1 in 𝔽₂ | Distinguishes predicates | Import §2.21; exterior locator. |
| Weight/differential conventions | dy=x², degrees 3/2 | w(x)=2, w(y)=4 gives w(dy)=4=w(x²); w(y)=3 gives 3≠4 | Consistent | None. |
| Frobenius, twists and duals | ℙ¹, q=2; elliptic curve and 𝔾_m | Geometric spectrum (1,2) gives (0,2); inverse spectrum (1,1/2) gives (0,−2); Lie weights dualize (1,2) to (−1,−2) | Sign fixed | Retain witnesses through Layers 5–8. |
| Weil weight domain | q=1; zero representation | 1^(w/2)=1 for every integer w; empty spectrum has no counterexample to any purity weight | q>1 needed | None. |
| Polynomial-form supplier contract | Point, Δ¹, arbitrary disjoint edges | Point H⁰=K; d(x₁)=dx₁ and H¹(Δ¹)=0; edge N form x₁ᴺ has degree N, unbounded in N | De Rham comparison does not imply bounded forms equal all forms | Split gap; interval explanation. |
| Minimal-model supplier contract | Λ(a₁), even sphere, three punctures | Betti ranks (1,1,0); sphere H*=K[x]/(x²); Λ(a,b) has H²=K but punctures have H²=0, requiring c₁ with dc=ab | H¹≠0 requires full algebraic existence | Split gap. |
| Quasi-isomorphism rigidity contract | a↦2a on Λ(a₁); augmentation to K | First map has H¹ scalar 2 and inverse 1/2; augmentation has H¹ map K→0 and is not a quasi-isomorphism | Both directions distinguished | Separate rigidity slug. |
| Homotopy lifting contract | Λ(e₁)→Λ(a₁); interval endpoints | e↦a and e↦2a give H¹ scalars 1 and 2, hence no homotopy; constant interval has equal endpoints and dt evaluates to 0 twice | Correct polynomial interval | Split gap. |
| Scalar-extension contract | K→L on Λ(a) and the sphere model | H¹=K becomes L; H²=K becomes L; dy=x² remains decomposable; the 1-minimal H² map 0→K becomes 0→L | Flatness preserves model conditions | Split gap; no assertion about tensoring infinite form products. |
| Good-cover supplier contract | Point; two arcs on S¹; two singleton points | Point nerve H⁰=Λ; ordinary two-arc nerve H¹=0 versus H¹(S¹)=Λ; two-singleton nerve H⁰=Λ² | Intersections and components necessary | Covers have one supplier. |
| Mixed-Hodge realization contract | 𝔾_m, its square, nodal proper curve | dlog lies in complex W₁ and cohomological W₂; product dlog x∧dlog y lies in complex W₂ and H² weight 4; nodal H¹ weight 0 | Shift and tensor weights agree; singular case required | Readdress contract. |
| Arbitrary-base filtration contract | ℙ¹ over 𝔽̄₂, ℓ=3; extension 𝔽₂→𝔽₄ | H² spectrum 2 becomes 4; 2=2^(2/2), 4=4^(2/2); W₁H²=0, W₂H²=H² in both | Weight invariant under base extension | Separate from normal H¹ bound. |
| Normal H¹ supplier contract | Elliptic, 𝔾_m, nodal cubic | H¹ weights respectively {1}, {2}, {0}; first two satisfy allowed {1,2}, third fails normality | Normality excludes weight 0 | New separate gap. |
| Normal unipotent-category contract | Point; three punctures; finite C₂ and S₃ | Point quotient dimension 0; puncture depth dimensions 2,3; finite groups have trivial unipotent completion, orders 1 versus 2/6 | Group and completion distinct | Existing gap retained. |
| §0.1 supplied predicates and connectedness | Exterior and polynomial odd generator; Λ(a,b); zero algebra | e²=0 versus e²≠0; [ab]≠0 in H²Λ(a,b); zero algebra has H⁰=0≠K | Accepted/rejected models distinct | Import predicates; consolidate repeated Checks. |
| §1.1 coordinate divided-power algebra | n=0,1,2; R=𝔽₂ and ℚ | γ₀=1; γ₁²=2γ₂, hence 0 mod 2 with γ₂≠0; γ₂↦t²/2; tγ₂=3γ₃ | Integral normalization correct | None. |
| §1.1 map extensionality | Two maps to 𝔽₂[ε]/ε² agreeing on γ₁ | Both γ₁↦0; γ₂↦0 versus ε; γ₂²=6γ₄↦0 in both | γ₁ does not determine map | None. |
| §1.2 t-grading | Integral edge | Ω₀¹=0; Ω₁¹=ℤ·dx₀; d(x₀) has bidegree (1,1), not (1,2) | Correct support/direction | Remove repeated differential Check. |
| §1.3 simplex forms | One vertex; edge; characteristic 2 | Vertex dx₀=0, x₀=t and γ₂ survives; edge dx₀=−dx₁; dγ₂(x₀)=x₀dx₀; dx₀²=0 at 2; t=1 would force 2γ₂=1 | Quotient is by dt | None. |
| §1.4 pullback | Face, identity, collapses of 2 and 3 vertices | Omitted xᵢ↦0; identity γ₂↦γ₂; collapse γ₂↦Σγ₂(xᵢ)+Σᵢ<ⱼxᵢxⱼ in either order | Mixed terms and contravariance correct | None. |
| §2.1 global compatible forms | Δ⁰, ∅, adjacent edges | R{t}; zero algebra with 1=0; common vertex values 0/γ₁ fail equality while γ₁/γ₁ agree | Empty and compatibility cases correct | None. |
| §2.2 coefficient homology | (p,n,i)=(0,0,0),(0,1,0),(1,1,1); R=0 | Answers R,0,R; normalization of R^σ is R→R with identity and zero homology; zero-ring answers all 0 | Simplicial and cochain directions distinct | Keep zero-ring Check without repeating first two. |
| §2.3 triangular comparison | S¹; two-torus at ℓ=2; empty | H¹Ω₀=0, H¹Ωₙ=R for n≥1; (aγ₁)(bγ₁)=2abγ₂=0 mod 2 although ab≠0; empty cohomology all 0 | Triangle and product coefficient agree | Correct cochain supplier references. |
| §2.4 principal coefficients/diagonal | Point mod 4→2; infinite discrete set; RP² | 3γ₁↦γ₁; kernel of ∏R→∏R/(a) is a∏R; H¹(RP²,ℤ)=0 but H¹(RP²,𝔽₂)=𝔽₂, so diagonal reduction can fail | Both exclusions needed | None. |
| §2.5 rational stabilization | Point, edge, disjoint edges indexed N≥1 | γ₂↦t²/2; t-degree 0 image is constants and omits x₁; family x₁ᴺ has no finite global bound, so has no stabilized preimage as a form | Injection/quasi-isomorphism distinguished from surjectivity | Replace repeated edge witness by infinite-bound control. |
| §3.1 pro-colimit | Constant point; even-index subtower; colimit/limit reversal | Point piece (ℤ/ℓʳ)γₙ unchanged; sequence (ℓⁱ)ᵢ has finite support mod each ℓʳ but infinitely many nonzero ℤ_ℓ coordinates | Orders of limits differ | Import EH.0 convention. |
| §3.2 finiteness (F) | Point, CP∞, countable wedge S¹, S¹ | Cardinalities at point ℓ,1,…; CP∞ ℓ in each even degree; wedge H¹=∏ℕ𝔽_ℓ is infinite; S¹ cardinalities ℓ,ℓ,1,… | Degreewise finiteness, not total boundedness | Delete repeated wedge Check. |
| §3.3 universal coefficients | ℤ_ℓ→ℤ_ℓ by ℓ in degrees 1,2 | Integral H¹=0, H²=ℤ/ℓ; reduced H¹=𝔽_ℓ; left term 0, Tor₁(H²,𝔽_ℓ)=𝔽_ℓ | Tor is in degree i+1 | Supplier reference only. |
| §3.4 completed forms | Point; circle at (1,1), ℓ=2,r=1 | Point piece ℤ_ℓγₙ; circle coker d=ℤ/2 with 2 elements, not 0; infinite Σγₙ excluded | Completion and ML quotient retained | Consolidate point and cokernel repetitions. |
| §3.5 homotopy algebra | n,m=(0,0),(1,1),(1,2),(2,3); ℓ=2,3 | Normalized products are respectively 1,1,1/2,1/12 on both sides; 2/2!=1/1!=1 and 3/3!=1/2!=1/2; ℓ is a nonunit before rationalization | Product and transition normalization agree | Fix ℓ spelling, merge repeats. |
| §4.1 variety realization | Geometric point, two points, 𝔸¹ with ℓ=p | H⁰=ℚ_ℓ, ℚ_ℓ² respectively; Artin–Schreier classes tᵐ, p∤m give infinitely many independent H¹ classes at ℓ=p | Connectedness and invertibility needed | Add headline to docstring; consolidate point Check. |
| §4.2 finite-level action | Point; two-point Frobenius orbit | 1↦1 and stabilizer index 1; (1,0)↔(0,1) and index 2 | No actual minimal-model action inferred | Remove stale G3 citation. |
| §4.3 supplied nerve comparison | 𝔾_m(ℂ), bad two-arc cover, two points | Comparison H¹ ranks 1→1; bad ordinary nerve H¹=0 versus circle rank 1; two singleton cover H⁰ has rank 2→2 | Correct map direction and domain | Import covers; preserve component computation. |
| §4.4 complex model comparison | 𝔾_m, elliptic curve, disconnected points | Λ(a) H¹ rank 1; Λ(a,b) H¹ rank 2 with ab≠0 in H²; two points H⁰ rank 2, outside connected-model hypothesis | General algebra comparison retained | Remove stale G3 citation. |
| §5.1 geometric filtration bridge | 𝔾_m, elliptic, nodal curve, dual-number point | H¹ weights 2,1,0; thickened point H⁰=ℚ_ℓ, positive Hⁱ=0, W₋₁H⁰=0 and W₀H⁰=H⁰ | Nonreduced and nonnormal cases consistent | Resolve Hodge owner and normal-weight gap. |
| §5.2 Frobenius/Hodge comparison | ℙ¹, q=3 | Spectrum (1,3); W₀ ranks (1,0), W₂ ranks (1,1); inverse eigenvalue 1/3 would give weight −2 | Frobenius sign agrees with supplier convention | Dependency ownership only. |
| §6.1 admissible filtration | Λ(a,b), K[x₂], dy=x² | Constant filtration exhaustive; degree≤2 span misses x² in degree 4; algebra on y misses dy=x² | Product and differential closure separately tested | Remove repeated bullets. |
| §6.2 stable representatives | Sphere block; three punctures; two shears | {x,y} contains x²; puncture cohomology ranks (1,2,0) but successive free Lie degrees have dimensions 2,1,2,3,…; both shears preserve Λ(a,b) | No whole-degree finite-generation assumption | Supplier reference only. |
| §6.3 generalized spectral grading | J₂(1); product eigenvalues 2,3; zero | Kernel dimensions 1 and 2 for first/second powers; product eigenvalue 6≠5; invertibility gives generalized 0-eigenspace dimension 0 | Generalized/multiplicative indices necessary | Consolidate repeated Jordan/product bullets. |
| §6.4 product theorem | dy=x², σx=ax; linear du=v; unit | σy=a²y from differential, degree sum 4≥3; du=v can carry arbitrary β with positive cohomology 0 and is not minimal; unit empty product 1, sum 0 | Inequality and minimality correct | Remove duplicate y clause. |
| §6.5 integer weights | Sphere and σa=2a, σb=a+2b at q=2 | Sphere weights 2,4; Jordan H¹ eigenvalue 2 has weight 2 and H² eigenvalue 4 has weight 4; d preserves weights despite nonsemisimplicity | Bounds and descent compatible | None. |
| §6.6 common filtration | Shears A,B; Aⁿ and A⁻¹; weight lines 1,2 | AB=((2,1),(1,1)); BA=((1,1),(1,2)); Aⁿ=((1,n),(0,1)); AA⁻¹=I; 2(a+b)≠2a+4b | No finite-group or arbitrary-subspace shortcut | Keep distinct inverse/infinite-order and graded-subspace controls. |
| §7.1 weight extension | Λ(a₁), w=1; two weights; identity constraints | Section a↦λa has U=1; at λ=2 scalars 2,4; shear b↦b+a is identity on Gr but changes [b] | Kernel and scalar conventions fixed | None. |
| §7.2 compatible splitting | 𝔾_a⋊𝔾_m, c=0,1 | s₁(2)s₁(3)=(-1,2)(-2,3)=(-5,6)=s₁(6); (c,1)(0,λ)(−c,1)=(c(1−λ),λ); c=0 gives diagonal section | Finite-stage algebraic witness consistent | Limit compatibility remains a target, not inferred from example. |
| §7.3 rational splitting | Elliptic and 𝔾_m | Elliptic H¹ weights (1,1) and product 2; 𝔾_m W₁H¹=0, W₂H¹=H¹ of rank 1 | Weight need not equal degree | None. |
| §7.4 conjugacy | g(a)=a, g(b)=b+a with weights 1,2 | g(Ka)=Ka and g(Kb)=K(b+a); Gr(g)=(1,1), but H¹g sends [b] to [b]+[a]≠[b] | Associated graded identity weaker than homotopy identity | Combine three repetitions preserving actual conjugation. |
| §8.1 arbitrary-base splitting | Three punctures over 𝔽̄₂ with ℓ=3 | H¹=ℚ₃(−1)², eigenvalues (2,2), weights (2,2); no complex realization is used | Positive-characteristic input retained | Delete repeated instance. |
| §8.2 proper smooth formality | Elliptic, ℙ¹, 𝔾_m | Elliptic minimal d=0; ℙ¹ x↦[x], y↦0, dy↦[x²]=0 in H⁴; 𝔾_m diagonal projection sends weight-2 H¹ generator to 0 and fails | Purity, not zero minimal differential, is used | None. |
| §8.3 1-minimal Lie tower | Λ(a), Λ(a,b), dc=ab, ℙ¹ | Abelian dimensions 1 and 2; dc(A,B)=1=−c([A,B]) forces [A,B]=−C; ℙ¹ 1-minimal H²=0 injects into K but is not isomorphic | Bracket sign and H² direction fixed | None. |
| §8.4 étale unipotent comparison | Three punctures; C₂ and nonabelian S₃ | Depth dimensions 2 and 3; for finite-order unipotent g, m log(g)=0 implies log(g)=0, hence g=1; completion orders 1 versus group orders 2,6 | Comparison is with completion | Keep finite-order explanation once. |
| §8.5 normal presentation | Three punctures, elliptic, genus g, nodal rational curve | R=0 on two weight −2 puncture generators; elliptic [a,b]=0 weight −2; genus g≥1 gives 2g generators and one relation, g=0 gives V=R=0; nodal weight 0 violates normal bound | Relation range [−4,0]∩(−∞,−2]={−4,−3,−2} | Normal H¹ contract explicit. |
| Worked infinite-discrete quotient | R=ℚ[x₁,x₂,…], I=(xᵢ), versus I=(a) | (xᵢ) maps to 0 modulo I but lies in no ideal generated by finitely many chosen polynomials times ∏R; principal kernel equals a∏R | Arbitrary quotient assertion remains excluded | None. |

The remaining worked curve and torus examples reproduce the values in the §2.3, §5.1 and §§8.2–8.5 rows: topological torus ranks (1,2,1), elliptic weights (0,1,2), algebraic-torus weights (0,2,4), and the sphere’s weights (2,4) on x,y with dy=x². Identity pullbacks fix these classes. The infinite discrete example is not used to infer any unsupported tensor/Hom interchange.

# Maintainer consequences

Only the permitted README, Suggested.lean, top-level plan gaps and this report changed. There are no new or renamed Lean declarations. The retired connected-sullivan-interface slug is replaced by polynomial-forms-de-rham, sullivan-minimal-models, sullivan-quasi-isomorphism-rigidity, sullivan-homotopy-lifting and sullivan-scalar-extension. The geometric-mixed-hodge-realization slug keeps its name but now addresses MotivicEtaleKTheory §§3.2/3.4. Normal-h1-weights is a separate DeligneWeightsAndPurity contract. Supplier authors must supply the declared gaps; this package does not claim they already do. No commit, push, pull-request edit or supplier edit was made. A fresh independent review remains necessary.
