# PORT-CstConjectureForDaggerVarieties

Branch: `roadmap/cst-conjecture-for-dagger-varieties`.
Head commit: `2ad4b9a7b277e18606176448881e8b3691ad1b6b`.
Base: `9c6e95d`; initial worktree status was empty.

## Draft pull request body

This roadmap builds the fundamental period diagram for smooth dagger varieties, its Banach–Colmez filtration and two bundle-cohomology obstructions, and the resulting comparison and period-recovery theorems. It develops comparison for the geometric classes of Colmez–Nizioł and proper times Stein spaces, while keeping the unrestricted C_st conjectures separate from the proved classes and retaining the topology, Galois descent and filtration needed by arithmetic consumers.

AI assistance: authored and checked with Codex (GPT-6); the port includes a source, supplier, ownership and computed mathematical self-review.

## Validation

- Targeted module build: `Build completed successfully (8954 jobs).`
- Target line: `✔ [8954/8954] Built TauCetiRoadmap.CstConjectureForDaggerVarieties.Suggested (1.7s)`.
- Warning count: **0** (including **0** sorry warnings; the module declares no targets).
- Push gate: `gate CstConjectureForDaggerVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency direction, complete output:

      depcheck: 206 roadmaps, 1412 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line. The order file and tooling were not edited.
- Citation resolver against main `9c6e95d`, the 436 indexed open roadmap heads, and the worktree's pinned packages: cross-roadmap citations found nowhere **None**; Lean names found nowhere **None**.
- Pins read from the unchanged manifest and confirmed against the dependency checkouts: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.
- The declaration-by-declaration `#check @name` signature audit has **zero subjects**. There are no definitions, instances, theorems or section variables in `Suggested.lean`; the targeted build elaborated the complete file. No missing binder or generality change was found. No empty substitute theorem was added.
- Only `TauCetiRoadmap/CstConjectureForDaggerVarieties/{README.md,Suggested.lean,metadata.toml}` is committed. The top-level roadmap list, manifest and toolchain are unchanged. Nothing was pushed and no GitHub object was written.

## Port and upstream mathematics fixes

The full six-layer specification, 44 numbered subsections, every definition API and all original discriminating Checks and worked examples are retained. `metadata.toml` retains `topic = "math.AG"`, matching the one-key format on main. Models read were AdicSpacesPartII, AdicSpacesPartIV, RestrictedPowerSeries and Completed/OrthogonalL2Bases.

The accepted review's F01 and F02 are already applied in the source package: there are no duplicate reminder-only Checks blocks; §0.3 capitalizes C; `WittVector.Isocrystal` points at its declaration on line 113. These decisions are retained.

Additional fixes made in this port:

1. §3.7's projective-line Check previously asked for radii strictly between |π| and 1 without specifying an extension of the value group. For K=Q_p there are none in |K×|. It now explicitly uses |K̄×| after base change to C, with ε′_n=|p|^(1−1/n), n≥2. These radii decrease to |p| and their reciprocal disc radii increase to |p|⁻¹. The cohomology values after base change are (C,0), and the geometric proof route explicitly uses X_C and Z_C. The K-valued comparison and its base-change compatibility remain in the same exact contract; no theorem is narrowed.
2. §3.5's empty-boundary Check previously called the discrepancy complexes zero. It now computes the identity complexes [Q_p→Q_p] and [B_dR⁺→B_dR⁺] at a point: both cohomology groups vanish, although their terms are nonzero. The assertion is about their derived isomorphism classes.
3. §§1.5–1.6's qualitative Checks now give the point values, the disc class [T] and its image dT, and the horizontal kernels 0 versus O(D)/C. The point's right vertical map sends 1 to 1 in C and is an inclusion, not an isomorphism Q_p≅C.
4. Layer 3's example identifies its closed dagger unit disc with the semistable tube complement of §3.6. This distinguishes it from the open-disc complement of the closed projective tube in §3.7.
5. Pinned Tau Ceti declaration locators are made explicit: `AdicSpace` in `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:243`; `spaY` and `frobeniusHomeomorph` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Y.lean:116` and line 218; `spaX` in `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:56`.
6. Unicode mathematical expressions are prose rather than code identifiers. Backticked identifiers and repository paths are ASCII. No mathematical statement was deleted by this formatting repair.
7. The worked proper-curve rank formula now explicitly assumes geometric connectedness. Two disjoint projective lines have ranks 2,0,2, so without that hypothesis the rank-one endpoints would be false. That negative control is now stated alongside the example.

## Lean to README

Nothing moved: `packages/CstConjectureForDaggerVarieties/Suggested.lean` already satisfies the acceptance-test form and is copied unchanged. Its 33 missing-carrier entries cover all headline targets, including the two vanishing results. Every headline needs dagger cohomology, modified coherent Fargues–Fontaine bundles, sympathetic period functors or their strict derived realizations. These are not a few simple definitions on available native carriers. The empty namespace is therefore intentional, and there is no padding, sorry'd data, `set_option`, roadmap import or unused Tau Ceti import.

At the actual pins, object searches find Mathlib's algebraic de Rham period-ring carriers and its isocrystal carrier, and Tau Ceti's adic spaces and topological Frobenius quotient. Neither search finds the dagger cohomology or sympathetic period functors required by those headlines. Native generic sheaves and functors do not constitute the missing constructions. A theorem solely about an arbitrary filtered vector space or free scalar would not state one of these headlines.

## Suppliers, replacements and duplication

The following supplier roadmaps are new folders still in open work: **PadicHodgeTheory**, **VectorBundlesAndIsocrystals**, **CrystallineCohomology**, **LocallyAnalyticDistributions**, **CohomologyComparisons**, **ClassicalAdicEtaleCohomology**. AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartIV are consumed from main; revisions of their folders are not dependencies.

All cross-roadmap citations were resolved again by roadmap and target, then their relevant text was read: AdicSpacesPartII R0.5, R0.10–R0.17 and R1; AdicSpacesPartIII R3.4; AdicSpacesPartIV F1.7–F1.12 and F1.16; PadicHodgeTheory §§0.2–0.5, 2.7, 3.4–3.7 and 5.2; VectorBundlesAndIsocrystals VB1–VB3's named curve, classification, curvature, Hom, height and Artinian targets; CrystallineCohomology CR.4.7; LocallyAnalyticDistributions §§0.0–0.2; CohomologyComparisons §§4.8–4.11; ClassicalAdicEtaleCohomology §§1.3–1.4, 8.4 and 9.7. The claims of broader scope are still explicit extension contracts, not falsely attributed existing theorems. In particular the prime-to-residue-characteristic proper-base-change statement alone does not supply integral p-adic Künneth.

Pinned definitions read include `BDeRhamPlus`/`BDeRham` at Mathlib `RingTheory/Perfectoid/BDeRham.lean:75,88` with binders at lines 51–52; `WittVector.Isocrystal`/`isocrystal_classification` at `RingTheory/WittVector/Isocrystal.lean:113,180`; `Module.Free` at `LinearAlgebra/FreeModule/Basic.lean:43`; `Module.Finite` at `RingTheory/Finiteness/Defs.lean:121`; and `CategoryTheory.BicartesianSq` at `CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56`. Their native meanings matter: the period-ring carriers include a zero-ring case in characteristic p, Isocrystal imposes no finiteness or monodromy, its classification is rank one, freeness is not finite generation, and the categorical square imposes both universal properties. The Tau Ceti carriers listed above were also opened, not inferred from their names.

The object sweep used `roadmaps list`, `roadmaps grep` with an increased output limit, and `roadmaps show`, covering all indexed main and open heads. It also searched all board package READMEs and design READMEs. Searches included dagger spaces/cohomology, Hyodo–Kato, C_st, qBC/Banach–Colmez, period lattices/Hom and Roos limits. Relevant overlaps were read in the cited suppliers, CohomologyComparisonsPartII and ClassicalAdicEtaleCohomologyPartII, together with the board's VectorBundlesAndIsocrystalsPartII design. No helper agent made a mathematical judgment.

No additional duplicate target was found to delete. The source package already assigns the algebraic and proper rigid comparisons to CohomologyComparisons §§4.8–4.11, slope decomposition to CrystallineCohomology CR.4.7, and finite BC/Artinian/Hom-vanishing theory to VectorBundlesAndIsocrystals VB3. Their exclusions remain recorded only in Scope and ownership. The constructions retained here are the C-lattice specialization and the analytic diagram, defects, slope classes, exhaustion and recovery applications, not second generic curve, finite-BC, site or period-ring theories. CohomologyComparisonsPartII's arithmetic log-syntomic sheaves and realizations are different objects. No declaration in this port duplicates any readable roadmap's fully qualified name, since it declares none.

The board's VectorBundlesAndIsocrystalsPartII design owns the enlarged TVS/Pair/qBC and height-Hom theory, consistent with this package's accepted request for an extension of the finite-BC direction. It is not silently added as a supplier: it is not in the permitted merge-order prefix and has no usable new-folder open head in the supplied index. The accepted exact contracts remain the boundaries to that work; they are not replanned as constructions in this roadmap. No later roadmap is added to any Needs list. No ownership claim is made that those conditional contracts have already been fulfilled.

## Sources and limits of verification

The four public PDFs were reopened; their SHA256 hashes agree exactly with `packages/CstConjectureForDaggerVarieties/sources.toml`: CN25 `bb1628cf1f4321243e6070be2abae99f72a41e237e70a7eb1ec1fc03cc2cd52a`; GK04 `8adbb83b2cd20e134f5175d810a10d0d82f222da6063edb791b0270a33619dc1`; BKV22 `150ba49710056b7de62ca91467cd7e4cde2aaba6a053a5f83bd0c35e0addfea9`; CN1 `f4798bc39e556c7f3439c0037783986842ebe03498bf425500c4b9f6ef1ed25d`.

The README retains the accepted package's manuscript line convention alongside theorem and printed-page locators. Source passages opened included CN25 line 1807 (Definition 5.13), line 1852 (Lemma 5.17), line 1870 (Proposition 5.18), line 1896 (Proposition 5.20), line 1913 (Proposition 5.23), line 1954 (Proposition 6.1), line 2098 (Theorem 6.14), lines 2185–2239 (conjecture and twist reduction), lines 2333–2466 (defect/equivalence/splitting and product proof), lines 2489–2574 (geometric classes and tubes), lines 2601–2713 (limits and proper-factor comparison), lines 2735–2870 (recovery); GK04 line 499 (Proposition 3.7) and line 556 (Corollary 3.8); BKV22 lines 1176–1187 (integral tube charts); CN1 line 1163 (naive interior). Each was matched by named result and printed page, including the proof inputs used. The source's stronger filtered tube wording and positive-crystalline equality are not treated as proofs of the extra properties explicitly separated in the accepted package.

An indexed web search of Mathlib pull requests and Lean Zulip for dagger cohomology, Hyodo–Kato and Banach–Colmez found no relevant formalization. This is a search result, not a completeness claim about unindexed work. Pinned source searches, rather than that web search, determine statability.

## Computed adversarial mathematics pass

The table has 214 statement rows. These are independently recomputed small instances and negative controls, not proofs of the general target theorems or of the conditional extension contracts. R denotes B_dR⁺, B denotes B_dR, U₁ denotes (B_cris⁺)^(φ=p), D† is a closed dagger disc and D is the open disc. Formal bundle tests do not assert that an analytic variety with a prescribed defect exists. API facts with several clauses are separated below when they test different mathematics. In each retained row the change column says **retain**; explicit repairs are named.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Base and coefficient convention | p=2,3; Q₂(√2); characteristic-p field | 2,3≠0 in K; v₂(√2)=1/2; p=0 in a characteristic-p field | Characteristic-p case excluded; ramification retained | retain |
| Countable perfect residue and completion | k=F_p; perfection of F_p(z) | First k̄=F̄_p; second trdeg(k̄/F̄_p)=1; F̂ⁿʳ=W(k̄)[1/p] in both cases | Finite-residue classification alone cannot cover the second | retain |
| Monodromy relation | φ=diag(1,p), Ne₁=e₀ | Nφe₁=pe₀=pφNe₁; reversed relation gives e₀ versus p²e₀ | Both p=2 and 3 distinguish signs | retain |
| Horizontal sign | Same module and N_Bu=−1 | N(e₁+ue₀)=e₀−e₀=0; N(e₁−ue₀)=2e₀≠0 | Positive exponential is horizontal | retain |
| Period normalization | p=2, π=√2; p=3 unramified | u=2u_π gives N(u)=2(−1/2)=−1; unramified value −1 | Uniformizer and absolute N differ | retain |
| Bundle degree and lattice sign | Trivial M, lattices t⁻¹R,R,tR | t_H−t_N=1,0,−1; bundles O(1),O,O(−1) | Opposite sign fails on both nonzero twists | retain |
| Dual Hodge filtration | Line of jump 1 and its dual | Fil¹D=D, Fil²D=0; dual Fil⁻¹=D∨, Fil⁰=0 | Dual jump −1 from annihilator degree 1−j | retain |
| Tate twist | φ(e)=e, multiply φ by p⁻¹ and lattice by t | Total φ(te)=p⁻¹pt e=te; degree −1−(−1)=0 | Simultaneous twist cancels | retain |
| Difference-map convention | Point; (x,f)=(1,1) and (0,1) | v(1,1)=0; v(0,1)=−1; sum gives 2 at (1,1) | Kernel diagonal, map onto R | retain |
| Cohomological shift | Identity and zero maps K→K | Identity: H⁰=H¹=0; zero: H⁰=H¹=K; K[−1] has H¹=K | Shift sign fixed | retain |
| Signed height | Q_p, R/t, C/Q_p | Heights 1,0,−1; 0=1+(−1) in 0→Q_p→C→C/Q_p→0 | Dimension cannot replace height | retain |
| Contragredient action | S₃: g=(12),h=(23); C₂ | gh e₁=e₂, hg e₁=e₃; gh e₁∨=e₂∨; transposition squared fixes e₁∨ | Inverse required in action formula | retain |
| VS/TVS naturality | Constant Q_p and additive C functors | Hom_TVS(Q_p,B)=B; Hom_VS(C,B)=0, but C-point Q_p-linear dual is nonzero | Pointwise Hom is a wrong model | retain |
| Fixed universe | Zero and constant rank-two functors | Evaluations 0 and Q_p² in the chosen universe; natural identity components 0 and I₂ | No size change needed for these functors | retain |
| Torsion Pair convention | [0→R/t], zero Pair | Realizations C and 0; heights 0 and 0 | Torsion height differs from Q_p height 1 | retain |
| Reasonable versus general Pair | D†, D, D†⨿D in degree 1 | A=O(D†)/C, O(D)/C and their sum; B⁰ ranks 1,1,2; B¹=0 for all | Last Pair mixes compact type and nonnormable Fréchet | retain |
| Native period carriers | R_input of characteristic p | Inverting p=0 gives zero; BDeRhamPlus=BDeRham=0 | Nonzero geometric period hypotheses necessary | retain |
| Native Isocrystal and rank-one classification | Standard slopes −1,0,1; direct sum rank 2 | φ=p⁻¹σ,σ,pσ; ranks 1,1,1 versus 2 | Rank-two object exists; rank-one theorem does not classify it | retain |
| Native freeness and finite generation | Zero module; countable free module over a field | Basis cardinalities 0 and ℵ₀; first finite, second not finite | Free alone does not mean finite free | retain |
| Native bicartesian square | Identities Q_p→Q_p over R→R | Pullback=Q_p, pushout=R | Both universal properties hold | retain |
| Adic-space and quotient suppliers | A point y of spaY; Frobenius orbit of y | Quotient classes [y]=[φy]; no coherent sheaf is part of this quotient datum | Topological quotient cannot replace coherent curve | retain |
| Banach tensor supplier R0.5 | Scalar lines and zero module | K⊗̂_K K=K with 1⊗1↦1; 0⊗̂K=0 | Completion and zero cases agree | retain |
| Countable open-exhaustion supplier R3.4 | Constant point exhaustion; zero sheaf | lim=Q_p, lim¹=0, H¹=0; zero gives 0 throughout | No restriction-surjectivity assumption added | retain |
| C-valued de Rham finiteness contract | Point, dagger disc, annulus | Dimensions (1), (1,0), (1,1), respectively | Examples finite; not proof of all three classes | retain |
| C-valued strict differential contract | D† and rigid closed disc | dT has primitive T on D†; ω=ΣpⁿT^(pⁿ−1)dT has formal primitive ΣT^(pⁿ) outside Tate algebra | Rigid closed disc is a negative control | retain |
| C-valued Künneth contract | Two annuli; point factor | Convolution (1,1)*(1,1)=(1,2,1); (1)*(1,1)=(1,1) | Cup classes dlog T,dlog S,dlog T∧dlog S agree | retain |
| Tube-finiteness contract | P¹ boundary ∞; empty intersection/union | Affine line and semistable complement have H_dR=(K,0); empty intersection complement ∅ gives 0; empty union gives P¹ | Unfiltered statement consistent | retain |
| Proper-pair resolution extension | (P¹,∞); empty boundary; Z=X | Identity resolves first two; boundary one point or empty; Z=X first discards all components and U=∅ | Dense-open hypothesis used on remaining components | retain |
| Arithmetic acyclic period-Hom contract | Unit line; Q_p(−1); zero | Hom values Fⁿʳ,K; Fⁿʳt⁻¹,Kt⁻¹; 0 | Dual Frobenius p⁻¹ and jump −1 | retain |
| Bounded arithmetic subfiltration contract | φ=1, jump 1, r=1; φ=p, jump 1 | Shrink jump 1→0 in first: t_H=t_N=0; second retains jump 1: t_H=t_N=1 | Bounds Fil⁰=M and Fil²=0 survive | retain |
| Positive crystalline Hom contract | Unit line r=1 and λ=t⁻¹ | λ(t)=1; choose θ(x)=1 in U₁, then θ detects a pole of x/t | One eigenvector is insufficient; all evaluations required | retain |
| Galois Hom-vanishing contract | C, R/t and zero | Hom_(G_L)(C,B)=0 and Hom_(G_L)(R/t,B)=0; Hom(0,B)=0 | Non-equivariant evaluation maps need not vanish | retain |
| Period-lattice gluing contract | Be with lattices R,tR | Completion lattices R,tR; resulting bundles O,O(−1) and H⁰=Q_p,0 | Marked lattice determines modification | retain |
| qBC extension contract | Q_p, C, C/Q_p | Graded classes negative,zero,positive; heights 1,0,−1 | Signed additivity agrees with parent BC | retain |
| Countable finite-BC inverse-limits contract | Constant Q_p and tower with zero transitions | Constant: lim Q_p, lim¹0; zero transitions: δ=id, both limits 0 | Artinian route consistent in examples | retain |
| Natural period-Hom contract | Q_p and C | Hom_VS(Q_p,B)=B of rank 1=height; Hom_VS(C,B)=0 of rank 0=height; Ext¹(C,B)=0 | Rank differs from C-dimension | retain |
| Strict derived-limit contract, shift | Constant Q_p[0] and V[−1] | Fibre gives (H⁰,H¹)=(Q_p,0), respectively H¹=V,H²=0; unshifted cone puts Q_p in H⁻¹ | Fibre normalization required | retain |
| Strict derived-limit contract, section | Constant tower and δ(a)_n=a_n−a_(n+1) | a₀=0,a_n=−Σ_(k<n)b_k gives δ(a)_n=b_n including n=0 | Explicit continuous right inverse | retain |
| Strict derived-limit contract, truncation | Constant V in degree 2; truncate at i=1 | H^≤1 before/after=0; at i=2 both sides H²=V | Common lower bound, no common upper bound needed | retain |
| Strict derived-limit contract, higher obstructions | Tail tower ⊕_(j≥n)Q_p | lim=0, lim¹=∏Q_p/⊕Q_p, lim²=0; [(1,1,…)]≠0 | R¹lim not set to zero by fiat | retain |
| Dagger analytic-complexes contract | Point and annulus | HK ranks (1) and (1,1); φ on annulus H¹=p, N=0; de Rham ranks match | Comparisons use actual cohomology | retain |
| Filtered t-shift contract | Point, i=0,r=0→1 | F⁰=R, F¹=tR; t sends b↦tb bijectively onto tR | Isomorphism after the same truncation on both sides | retain |
| Stable-range period-map contract | Point r=0; D† at i=r=1 | H_syn⁰=H_proét⁰=Q_p; H_syn¹=H_proét¹=O(D†)/C | Does not identify degree r+1 in general | retain |
| Syntomic Stein/affinoid contract | D† and point | D† top kernel O/C and X¹¹=0; point r=0 kernel 0 and X⁰⁰=Q_p | Separate topology assertions remain inputs | retain |
| Analytic-exhaustion descent contract | Constant disc; disjoint union of points | Constant gives original complex; increasing finite subsets give B⁰=∏R and H⁰=∏Q_p | Global cohomology need not be finite | retain |
| Continuous quotient-splitting contract | One-chart disc and point, q=0 | Evaluation f⊗b↦f(0)b sends 1⊗b↦b,T⊗b↦0; point E=H=R,Q=0 | Retraction fixes H and kills zero-constant complement | retain |
| Overconvergent crystalline contract | D† and ordinary formal disc | Overconvergent HK¹=0; ordinary Tate complex has nonexact ω with exact partial-sum limits | Ordinary completed complex is a wrong substitute | retain |
| Algebraic comparison over C contract | G_m and P¹ | H¹(G_m): φ=p,Hodge jump 1; H²(P¹): same; bundle degree 1−1=0 | Algebraic pairs weakly admissible | retain |
| Analytic HK GAGA contract | A¹,G_m | Algebraic and analytic HK ranks (1,0) and (1,1); dlog T maps to dlog T | HK agreement does not assert pro-étale agreement | retain |
| Proper-log period sequence contract | Point with empty boundary | Q_p→Q_p⊕R→R, x↦(x,x),(y,f)↦y−f; kernel diagonal, cokernel 0 | Exact difference-map convention | retain |
| Proper integral étale contract | Point and P¹ | Complexes Z_p[0] and Z_p[0]⊕Z_p(−1)[−2]; perfect with ranks 1 and 2 | No perfection of second factor required | retain |
| §0.1 filtered C-lattice definition | M=0; trivial line and L=tᵐR | Ranks 0,1; localizations 0,B for every integer m | Zero submodule in rank one localizes to 0≠B | retain |
| §0.1 construction from data | φ=σ,N=0,L=R | Nφ=pφN=0; R[1/t]=B | Operator and spanning laws satisfied | retain |
| §0.1 morphism determined on M | Unit line, scalars 0,1,2 | Extensions send e↦0,e,2e; lattice images 0,R,2R | No independent choice of period map | retain |
| §0.1 full-lattice localization API | L=tR | tR→B injective and tR[1/t]=B | Zero lattice fails equality | retain |
| §0.1 tensor API | L=tR,L′=t⁻¹R | Tensor lattice R, rank 1, degree −1+1=0 | Diagonal tensor returns unit | retain |
| §0.1 dual API | L=tR | Dual lattice t⁻¹R; evaluation (te)(t⁻¹e∨)=1 | Unshifted dual lattice is wrong | retain |
| §0.1 arithmetic lattice specialization | Line of Hodge jump 1 | Fil⁰(D⊗B)=t⁻¹R; associated degree 1 for φ=1 | Convolution sign fixed | retain |
| §0.1 identity and composition | Unit-line maps 2 then 3 | Composite sends e↦6e; identity sends e↦e | Scalar extension preserves 3·2=6 | retain |
| §0.2 bundle and sections definition | L=t⁻¹R,R,tR | Bundles O(1),O,O(−1); middle H⁰=Q_p, last H⁰=0 | Embedded lattices distinguish bundles | retain |
| §0.2 punctured section module | Trivial line for all three lattices | Away from ∞ all three give Be | Lattice change supported at ∞ | retain |
| §0.2 completed local lattice | Same three lines | Completions t⁻¹R,R,tR, each spanning B | Abstract rank one alone loses marking | retain |
| §0.2 functorial maps | Unit line, maps 2 then 3 | Bundle map on sections x↦6x; identity x↦x | Functor laws agree | retain |
| §0.2 section equalizer API | Trivial line, L=R or tR | Be∩R=Q_p; Be∩tR=0 | Sections depend on the lattice | retain |
| §0.2 tensor/dual API | O(1)⊗O(−1),O(1)∨ | O with degree 0; O(−1) with degree −1 | Both signs agree with lattice tensor | retain |
| §0.3 acyclicity definition/API | 0,O,O(1),O(−1) | Slope lists ∅,{0},{1},{−1}; acyclic T,T,T,F | Zero included and negative excluded | retain |
| §0.3 weak admissibility API | Same four bundles | Weakly admissible T,T,F,F | Positive acyclic line need not be weakly admissible | retain |
| §0.3 isomorphism invariance | Rescale trivial basis by 2 | L=R mapped to 2R=R, degree remains 0 | Unit rescaling does not change predicates | retain |
| §0.3 tensor closure | O(1),O(2) | Tensor O(3), H¹=0, slope 3≥0 | Addition of slopes gives correct sign | retain |
| §0.3 arithmetic compatibility | φ=p, jump 1 | Arithmetic t_H=t_N=1; geometric lattice t⁻¹R gives degree 0 | Both notions pass on the Tate model | retain |
| §0.4 four acyclicity criteria | O(1),O,O(−1) | H¹=0,0,nonzero; admissible sublattices R,R,none inside tR | Both implications distinguished | retain |
| §0.4 finite-dimensional realization criterion | O and O(1) | V_st(O)=Q_p; V_st(O(1))=U₁ with quotient C | Only first has finite Q_p dimension | retain |
| §0.4 admissible evaluation | Trivial pair (Fⁿʳ,R) | Q_p⊗B_st=B_st and Q_p⊗R=R, 1⊗b↦b | Source and target identified by evaluation | retain |
| §0.4 bounded sublattice refinement | φ=p,r=1,L=R or t⁻¹R | First E=O(−1), forced L′=R fails; second E=O, L′=L passes | Acyclicity is indispensable | retain |
| §0.4 zero and negative Newton cases | L=R, φ=p⁻¹,1,p | Newton slopes −1,0,1; bundle slopes 1,0,−1 | Acyclic iff Newton slopes ≤0 here | retain |
| §0.5 bounded X and V definitions | Trivial line, r=0 and 1,L=R | r=0: X=V=Q_p, quotient 0; r=1: X=U₁,V=Q_pt, quotient C | Positive ring is used before quotient | retain |
| §0.5 eigenspace membership API | Rank-two monodromy model | φ(e₁+ue₀)=p(e₁+ue₀), N=0; wrong sign N=2e₀ | All simultaneous conditions tested | retain |
| §0.5 bounded functorial maps | Scalar 2 on trivial line r=1 | Q_pt→Q_pt sends t↦2t; U₁→U₁ sends x↦2x | Kernel and quotient maps commute | retain |
| §0.5 kernel inclusion API | V=Q_pt⊂U₁⊂R | t↦t, no negative t-power appears | Codomain R, rather than B alone, matters | retain |
| §0.5 acyclic exactness API | Unit line r=1,L=R | ker θ on U₁=Q_pt and θ(U₁)=C | Both ends of short exact sequence tested | retain |
| §0.5 twist API | V=Q_p at r=0→1 | Multiplication t sends 1↦t; Galois character changes 1→χ | Identification is a Tate twist | retain |
| §0.5 finite-BC height API | M rank 0,1; trivial line at r=1 | Heights 0,1; U₁ height 1 despite C quotient | Height equals rank | retain |
| §0.5 denominator-level criterion | Unit line,r=0,L=R,k=0,1 | k=0 quotient 0; k=1 quotient t⁻¹R/R=C(−1); kernel remains Q_p | New denominator changes quotient, not kernel | retain |
| §0.6 generation | M=0; slopes 0 at r=0 and 1 at r=1 | Generated lattices 0,R,Re respectively | Zero and slope endpoints pass | retain |
| §0.6 out-of-range negative control | Slope 1 at r=0 | X=(B_cris⁺)^(φ=p⁻¹)e=0, span 0≠Re | Upper slope bound necessary | retain |
| §0.6 monodromy untwisting | N²=0 rank-two model | exp(uN)e₁=e₁+ue₀; exp(−uN)(e₁+ue₀)=e₁ | Inverse really cancels | retain |
| §0.7 B-valued eigenspace Hom | Unit r=0,1; M=0 | Hom(Q_p,B)=B; Hom(U₁,B)=B; Hom(0,B)=0 | Ranks 1,1,0 match M∨⊗B | retain |
| §0.7 B_st-valued Hom | Unit line,r=0 | Evaluation e∨⊗b sends ae↦ab, inverse reads value at e | Rank-one isomorphism, zero map excluded | retain |
| §0.8 kernel period-Hom | Trivial M,r=1,L=R or t⁻¹R | V=Q_pt or U₁; both Hom into B have rank 1 | Lattice enlargement preserves extended Hom | retain |
| §0.8 acyclicity negative control | φ=p,r=1,L=R | X=Q_pe→Ce injective, V=0; Hom rank 0≠1 | Cannot omit acyclicity | retain |
| §0.9 truncated evaluation | Unit L=R,r=1,k=2 | Map R/t²→R/t² is ×t; kernel tR/t², cokernel R/t | Kernel killed by t; cokernel within t² bound | retain |
| §0.9 zero-twist edge | r=0,k=0 and k=1 | k=0 both modules 0; k=1 evaluation R/t→R/t identity | Annihilator t⁰=1 forces zero errors | retain |
| §1.1 filtered groups definition | Point,r=0,1; D†,i=r=1 | Point (F,B,Fil,A)=(tʳR,R,tʳR,0); disc (O/C,0,0,O/C) | Filtered group and image are different | retain |
| §1.1 triangle and connecting API | D† at r=1 | DR¹⁰=O(D†); constants C map to B⁰/t; cokernel gives A¹¹=O/C | Connecting map retains [T] | retain |
| §1.1 image-quotient API | Same disc and point | Disc F/A=0=Fil; point tʳR/0=tʳR | Both nonzero-kernel and zero-kernel cases | retain |
| §1.1 filtration monotonicity API | Point,r=0→1→2 | t²R⊂tR⊂R; after localization all span B | Correct inclusion direction | retain |
| §1.1 pullback and composition API | Annulus inversion T↦T⁻¹ twice | dlog T↦−dlog T↦dlog T | Identity and composite agree on cohomology | retain |
| §1.1 scalar-extension API | Disc over K; point over C | B⁰(disc)=R=K⊗_K R; point has R/t=C | No C-linear section of R→C is assumed | retain |
| §1.1 negative degrees | i=−1 | F,B,Fil,A and all connecting sources in negative degrees=0 | No preceding defect at i=0 | retain |
| §1.2 smallness definition | Point,D†,countably many points | B⁰ ranks 1,1,∞; higher B=0 in first two | First two small, last not small | retain |
| §1.2 finite/free API | Point in degree 0 and 1 | B⁰=R free rank 1; B¹=0 free rank 0 | Positive-rank requirement would fail | retain |
| §1.2 rank comparison API | Annulus | ranks of HK¹,B¹,H¹_dR are 1,1,1 | All three coefficients match | retain |
| §1.2 invariance API | Annulus inversion | dlog T mapped to −dlog T, rank remains 1 | Cohomology equivalence preserves smallness | retain |
| §1.2 quasi-compact example API | D† and product of two annuli | Dimensions (1,0) and (1,2,1) | Finite in every degree | retain |
| §1.2 algebraic example API | A¹ and G_m analytifications | Dimensions (1,0) and (1,1) | Neither requires quasi-compact analytification | retain |
| §1.2 naive interior | Closed disc and open unit disc | Boundary complement {|T|=1}; open disc H_dR=(C,0); closed disc positive-dimensional affinoid not partially proper | Closed disc is not itself a naive interior | retain |
| §1.3 square definition and commutativity | Point,i=r=0 | a=id on Q_p,b=inclusion,c=inclusion,d=id; ca(1)=db(1)=1 | Actual maps fix square | retain |
| §1.3 total complex API | Same point | u(x)=(x,x),v(x,f)=x−f; vu(x)=0 | Opposite last sign gives 2x | retain |
| §1.3 functorial-square API | Scalar action 2 on constant coefficient | Both paths send 1↦2; v(2x,2f)=2(x−f) | Corner and total maps commute | retain |
| §1.3 bicartesian/exact API | Point and zero space | Point kernel diagonal Q_p,cokernel 0; zero gives 0→0→0→0 | Exactness and universal properties agree | retain |
| §1.3 classical corners API | D†,i=r=1 | X=B=0 classical; F=H=O/C nonzero | Classical X,B does not erase F | retain |
| §1.3 topology negative control | Finite-support sequences inside c₀(Q_p) | Sequence (pⁿ) lies in c₀ but not c₀₀; quotient has nonzero class [(pⁿ)] | Dense image must not be replaced by closure without justification | retain |
| §1.4 twist equivalence | Point,i=0,r=0→1 | H:Q_p→Q_pt; F:R→tR; U₁/Q_pt=C=B⁰/t | Common quotient comparison agrees | retain |
| §1.4 surjectivity induction | Point in degree 0 | v(0,−b)=b; ker v={(x,x)}; preceding H⁻¹=0 | Base step gives exact sequence | retain |
| §1.5 simplified rows | D†,r=1 | Both left terms O/C; β([T])=dT; HK¹=H¹_dR=0 | Explicit nonzero differential kernel | strengthen Check |
| §1.5 point and degree −1 | Point,r=0 | Ω⁻¹=0; top middle Q_p, bottom C; right map 1↦1 | Inclusion Q_p→C, not an identity of carriers | strengthen Check |
| §1.5 kernel exponent | Point,r=0; annulus,r=1 | (B_cris⁺)^(φ=p⁻¹)=0; annulus kernel also φ=p⁻¹ on coefficient after φ_M=p, hence 0 | Integer r−1 avoids natural-subtraction error | retain |
| §1.5 topological cases | D† and open D | H¹=O(D†)/C with LB topology; H¹=O(D)/C with Fréchet topology | Same algebraic pattern, different topology | retain |
| §1.6 proper horizontal maps | Point,i=r=0 | Q_p→Q_p and R→R are identities, kernels 0 | Proper injectivity distinguished | strengthen Check |
| §1.6 affinoid horizontal maps | D†,i=r=1 | H→X and F→B are O/C→0, both onto with kernel O/C | Shared nonzero kernel | strengthen Check |
| §2.1 modified bundle definition | Point at (i,r)=(0,0),(0,1) | φ_M=1,p⁻¹ and lattices R,tR; both bundles O | Simultaneous shift cancels | retain |
| §2.1 h⁰ API | Same two point twists | H⁰(O)=Q_p, realized in shifted period coordinates as Q_pt at r=1 | Rank-one constant, not U₁ | retain |
| §2.1 h¹ API | Same points; formal O(−1) | H¹(O)=0; H¹(O(−1))≠0 of height −1 | Failure term detects negative slope | retain |
| §2.1 pullback API | Annulus inversion | dlog T↦−dlog T, induced h⁰ line map −1, square +1 | Functor laws retained | retain |
| §2.1 degree −1 API | i=−1 | h⁰₋₁=h¹₋₁=0 | No artificial constant summand | retain |
| §2.1 twist API outside stable range | D†,HK¹=0; quasi-compact point | Zero pair stays 0 for every r; point twists all O | Does not claim a non-small finite bundle | retain |
| §2.2 h⁰ kernel identities | Point,r=1 | ker(U₁⊕tR→R)=U₁∩tR=Q_pt=ker(U₁→C) | Both kernel descriptions agree | retain |
| §2.2 h¹ cokernel identities | Same point | θ(U₁)=C so both cokernels 0=H¹(O) | Positive eigenspace maps onto quotient | retain |
| §2.2 preceding failure identity | D†,i=r=1; degree 0 | ker(O/C→0⊕O/C)=0=h¹₀; at i=0 preceding term 0 | Preceding-degree index correct | retain |
| §2.3 qBC filtration definition | Point,D†,P¹ at i=1 | Graded triples (0,0,Q_p),(0,O/C,0),(0,0,0) | Distinguishes finite quotient from Pair | retain |
| §2.3 positive subobject API | Point; formal negative-slope defect in degree i−1 | Positive piece 0; formal piece H¹(O(−1)) of height −1 | Positive curvature need not have positive height | retain |
| §2.3 middle torsion API | D†,i=r=1 | A=F=O/C, B=Fil=0; A is killed by t | Removing torsion loses [T] | retain |
| §2.3 final quotient API | P¹,i=0,r=1 and i=r=1 | h⁰₀(1)=Q_pt of height 1; h⁰₁(1)=0 | Reading r instead of i would fail | retain |
| §2.3 pullback API | Disc map T↦T² | [T]↦[T²], differential dT↦2T dT | Functorial Pair map is nonzero at p=2 | retain |
| §2.3 finite-BC agreement API | Q_p and C | Filtration has only negative and zero piece, respectively; heights 1 and 0 | Agrees with finite-BC conventions | retain |
| §2.3 reasonableness qualification | X=D†⨿D | H¹=A=O(D†)/C⊕O(D)/C, both finite graded pieces 0 | Mixed-topology small X need not have reasonable A | retain |
| §2.4 six-term failure sequence | Point,r=1 | 0→0→Q_pt→tR⊕U₁→R→0→0; kernel diagonal Q_pt | Both failures vanish | retain |
| §2.4 failure sequence on disc | D†,i=r=1 | 0→0→O/C→O/C⊕0→0→0→0 | Nonzero horizontal kernel does not imply failure | retain |
| §2.4 necessity of both defects | Formal O(−1) in degree i−1, zero degree-i defect | Left defect H¹(O(−1))≠0; right defect 0 | Surjectivity alone need not give injectivity | retain |
| §2.5 height identity | Point,r=0 and D†,r=1 | 1=1+0+0; 0=0+0+0 | Infinite Q_p dimension of O/C irrelevant | retain |
| §2.5 Euler sign | O and O(−1) | 1−0=1; 0−(−1)=1 | Nonzero bundle H¹ has negative height | retain |
| §2.5 strict height qualification | Torsion away from ∞ | rank 0,height 0,positive curvature | Broader strict inequality would be false | retain |
| §2.6 degreewise equivalence | Point,r=0 | Failures (0,0), acyclic (0,O), H⁰=Q_p,adjacent H_syn¹=0,height 1=1 | All five criteria agree | retain |
| §2.6 adjacent syntomic term | D†,r=1 | Degree-1 HK=0 and degree-0 pair O give both h¹=0; H_syn² has no positive piece | Does not identify full H_syn² with pro-étale beyond range | retain |
| §2.7 all-degree equivalence | D† | Degrees 0,1,≥2 give heights 1,0,0 and de Rham dimensions 1,0,0 | Every degree, not a single degree | retain |
| §2.7 quantifier negative control | Formal O in degree 0 and O(−1) in degree 2 | Degree 0:1=1; degree 2:1+(−1)=0≠1 | Degree-zero identity alone insufficient | retain |
| §2.8 eigenspace cohomology | Point,r=0,1 | Derived φ=1 fibre has H⁰=Q_p,H¹=0; φ=p gives H⁰=U₁,H¹=0 | Matches simultaneous positive semistable eigenspaces | retain |
| §2.8 splitting shift | Point and a single group V in degree i | Direct sum is Q_p[0], respectively V[−i] with Hⁱ=V | No group appears in negative degree | retain |
| §2.8 crystalline negative control | Ordinary formal disc | a_(pⁿ−1)=pⁿ→0; primitive coefficient a_(pⁿ−1)/pⁿ=1 does not tend to 0 | Ordinary completion adds non-Hausdorff H¹ | retain |
| §2.9 syntomic decomposition | Point and D† | Q_p=0⊕Q_p⊕0; O/C=0⊕0⊕O/C | Pair summand can be infinite dimensional | retain |
| §2.9 complement used by proof | Disc,q=0 and point | f↦f(0), kernel zero-constant functions; point E=H=R,Q=0 | Complement map is explicit in test | retain |
| §3.1 nonnegative de Rham slopes definition | Point,D†,countable points | Modified bundles O,(O,0),rank-infinite in degree 0 | First two pass, last fails smallness | retain |
| §3.1 smallness API | D† and countable points | B⁰=R versus ∏R | Predicate includes finite-rank condition | retain |
| §3.1 every-degree acyclicity API | D† | H¹(O)=0 in degree 0; zero pair in every positive degree | All indicated bundles acyclic | retain |
| §3.1 isomorphism API | Disc T↦−T | H⁰ map id, H¹_dR=0; inverse composite T↦T | Predicate unchanged | retain |
| §3.1 diagram equivalence API | D†,r=1 | Square O/C→0 over O/C→0 bicartesian; failure terms 0 | Matches nonnegative slopes | retain |
| §3.1 height API | Point and D† in degree 1 | ht Q_p=1=dim H⁰_dR; ht(O/C)=0=dim H¹_dR | Pro-étale size does not replace height | retain |
| §3.2 product slope theorem | Two annuli | HK/de Rham ranks (1,2,1); tensor bundle degree sums 0+0=0 | Product finite and acyclic | retain |
| §3.2 torsion modification route | O→O(1) at ∞ | Cokernel torsion of length 1; H¹(source)=H¹(target)=0 | Inclusion suffices; equality not required | retain |
| §3.2 pro-étale negative control | Two discs,T and S | Mixed derivative of TS is 1; of f(T)+g(S) is 0 | Factor-pullback formula misses [TS] | retain |
| §3.3 algebraic analytification | A¹ | Algebraic étale H¹=0; analytic pro-étale H¹=O(A¹_an)/C contains [T]≠0; both de Rham H¹=0 | Only required realizations compared | retain |
| §3.3 algebraic lattice and GAGA | G_m | HK¹ line φ=p, jump 1,lattice t⁻¹R,degree 0 | Corresponding bundle O | retain |
| §3.4 almost proper theorem | Z=∅,X; thickened point in P¹ | U=X,∅,A¹; cohomology of ∅=0; reduced and thickened point have same U | Resolution applied only after components discarded | retain |
| §3.5 discrepancy comparison | Proper point,empty boundary | [Q_p→Q_p] and [R→R] with identities both have (H⁰,H¹)=(0,0) | Derived zero, not termwise zero | clarify Check |
| §3.6 semistable tubes, degenerate indices | m=s, intersection versus union | Intersection boundary=whole,complement=∅,complex=0; union boundary=∅,restriction=id | Empty conventions different | retain |
| §3.6 unfiltered versus filtered comparison | P¹ boundary ∞,closed dagger unit disc | H_dR=(K,0) on affine line and disc; f=(1−πT)⁻¹ regular on disc,pole at π⁻¹ on affine line | gr⁰ map not surjective | retain |
| §3.7 tube definition | One equation f=T,ε=|π| | Tube {|T|≤|π|}; T=π belongs,T=1 does not | Nontrivial subset determined | retain |
| §3.7 integral transition API | f↦af,|a|=1 | |aπ|=|π|,|a|=1; same membership for π and 1 | Unit changes preserve tube | retain |
| §3.7 non-unit rescaling API | f↦πf,ε=|π| | New inequality |πT|≤|π| is |T|≤1, radius ε/|π|=1 | T=1 now belongs | retain |
| §3.7 monotonicity API | ε=|π|² and ε′=|π| | π² belongs to both; π belongs only to larger | Inclusion direction fixed | retain |
| §3.7 intersection/union API | c=0; c=2 at (T,S)=(1,π) | c=0 tubes whole/empty; c=2 ∃(|f|>ε)=true,∀=false | Both complement directions tested | retain |
| §3.7 codimension requirement | c=1 smooth point in P¹; repeated equation in P² | First codim 1; (T,T) cuts codim 1≠2 | Repeated-equation example excluded | retain |
| §3.7 open versus closed tube complement | P¹, f=S=1/T, ε=|π| | Closed tube complement |T|<|π|⁻¹; GK boundary piece |T|≤|π|⁻¹ | Boundary circle distinguishes domains | retain |
| §3.7 divisible radius Check | Q_p,ε=|p|; n=2,3 | No Q_p value between |p| and 1; ε′₂=|p|^(1/2),ε′₃=|p|^(2/3),ε′₃<ε′₂,limits |p| | K̄ values supply exhaustion | clarify value group |
| §3.7 derived limit route | Constant cohomology C[0] on the geometric closed-disc exhaustion | lim C=C,lim¹C=0; limit H¹=0 | Matches affine line and open disc after base change | clarify coefficient field |
| §4.1 exhaustion definition | X_n=X and increasing finite sets of points | Constant RΓ recovered; increasing finite sets yield H⁰=∏Q_p,B⁰=∏R | Global object is derived descent | retain |
| §4.1 restriction API | Disc maps restricting T | [T] restricts to [T],d[T]=dT on each stage | Maps preserve differential term | retain |
| §4.1 Fbar API | Disc,r=i=1 | F=A=O/C,Fbar=Fil=0 | Replacing F by Fbar loses nonzero [T] | retain |
| §4.1 cofinality API | Constant tower; subsequence 2n | Limits Q_p and Q_p; δ sections give lim¹0 on both | Canonical restriction an isomorphism | retain |
| §4.1 classical period limit API | Finite subsets of countable points | X⁰⁰=∏Q_p,B⁰=∏R; projection transitions onto,lim¹=0 | Period corners agree with ordinary limits | retain |
| §4.1 unbounded amplitude | Disjoint union of polyannuli Aᵐ | Hⁿ(Aⁿ) contains dlog T₁∧…∧dlog T_n≠0 for every n | No uniform upper degree bound | retain |
| §4.2 Milnor sequence | Constant disc tower; i=0 | lim O/C=O/C,lim¹=0; negative cohomology=0 | Correct group in degree i | retain |
| §4.2 obstruction negative control | Tail ⊕_(j≥n)Q_p | lim=0; lim¹=∏Q_p/⊕Q_p includes [(1,1,…)]≠0 | Obstruction appears one degree higher | retain |
| §4.2 six-term sequence | Constant point comparison tower | lim terms Q_p,Q_p⊕R,R; all lim¹ terms 0 | Exact kernel diagonal Q_p | retain |
| §4.2 vanishing implication | Same constant comparison | Global H=Q_p,F=R,X=Q_p,B=R,all error groups 0 | Global sequence exact | retain |
| §4.3 de Rham criterion | Constant D†,r=i=1 | lim¹DR=lim¹A=lim¹H=0; H/A=0 | Both implications and quotient vanishing hold | retain |
| §4.3 finite-BC quotient mechanism | Constant annulus; unit point | H/A finite Q_p line,lim¹0; point H/A=Q_p,lim¹0 | Not a theorem for all infinite-dimensional towers | retain |
| §4.4 rational étale Künneth | Y=P¹,T=point | Dimensions 1,0,1; Hⁱ(T)⊕Hⁱ⁻²(T)(−1) gives same | Correct degree-two twist | retain |
| §4.4 integral Künneth | Y=P¹,T=point | (Z_p⊕Z_p(−1)[−2])⊗ᴸZ_p unchanged | Ordinary cohomology tensor not used integrally | retain |
| §4.4 non-quasi-compact coefficients | Countable T of points,Y=P¹ | H⁰_et=(∏Z_p)[1/p]; (p⁻ⁿ) not in it but in ∏Q_p | Étale/pro-étale distinction retained | retain |
| §4.5 proper-times-Stein lim¹ | Y=point,P¹; S=D | Proper factors Q_p[0] and Q_p[0]⊕Q_p(−1)[−2]; finite sums of Stein lim¹0 | All resulting lim¹ vanish | retain |
| §4.5 Stein differential limit | j=0 and j=1 on disc exhaustion | j=0 Ω⁻¹=0; j=1 quotients O(S_n)/C,lim¹0 though Fbar=0 | Needs its own coherent-section proof | retain |
| §4.5 interleaving route | Successive discs of radii ρ_n<ρ_(n+1) | Coefficient T^m restricts to T^m in both rigid/dagger subsequences; both limits are O(D) | No termwise cohomology equivalence claimed | retain |
| §4.6 pro-étale Künneth | P¹×D | Degrees 0–3: Q_p,H¹(D),Q_p(−1),H¹(D)(−1); higher 0 | Finite-factor topology and degree 3 retained | retain |
| §4.7 global fundamental square | Countably many points,proper factor point | Q_p-products→Q_p-products over R-products→R-products; v(x,f)=x−f onto,ker diagonal | Non-small global example passes | retain |
| §5.1 differential error Hom | Disc,i=1; i=0 | [T]≠0, but c↦ψ(T⊗c) is G_L-equivariant C→B and equals 0; i=0 source 0 | Density and continuity force ψ=0 | retain |
| §5.2 torsion-kernel Hom | Disc,r=i=1; point | A=O/C and 0; both period Hom groups=0 | Infinite-dimensional A allowed | retain |
| §5.3 arithmetic B_st recovery | Point and P¹ in degree 2 | Hom^sm values Fⁿʳ and Fⁿʳt⁻¹; ranks 1; φ on second p⁻¹ | Dual of HK φ=p | retain |
| §5.3 arithmetic filtered recovery | Same two spaces | Hom_GK values K and Kt⁻¹; filtration jumps 0 and −1 | Dual of de Rham jumps 0 and 1 | retain |
| §5.3 arithmetic topology | Point at i=0 | Evaluation ψ↦ψ(1) identifies weak Hom with K; scalar inclusion and evaluation inverse | Strictness consistent with actual weak topology | retain |
| §5.3 differential negative control | Disc,i=1 | Pro-étale H¹=O/C≠0,but HK¹=H¹_dR=0 and Hom values 0 | Recovery is not dimension of representation | retain |
| §5.4 geometric B_st recovery | Constant Q_p^d,d=0,1,2 | Hom_TVS=B_st^d; Hom_Fⁿʳ((Fⁿʳ)^d,B_st)=B_st^d | Ranks 0,1,2 agree | retain |
| §5.4 geometric B_dR recovery | Same constants | Hom_TVS=B^d=Hom_R(R^d,B) | Natural maps recover extended modules | retain |
| §5.4 torsion-Pair vanishing | Disc and D†⨿D,degree 1 | A=H,HK=B¹=0; Hom_TVS(A,B)=Hom_TVS(A,B_st)=0 | Does not need reasonable mixed Pair | retain |
| §5.5 affinoid positive equality | Point,i=0 | Hom(Q_p,B_cris⁺)=B_cris⁺=M∨⊗B_cris⁺ | Base case agrees | retain |
| §5.5 positive sandwich limitation | Trivial line,i=1 | B_cris⁺⊊t⁻¹B_cris⁺ since t⁻¹ outside first; λ(t)=1 alone gives no bound | Equality remains separate proof obligation | retain |
| §5.5 full positivity test | Same λ=t⁻¹,θ(x)=1 in U₁ | λ(x)=x/t has negative t-valuation −1,so is not in R or B_cris⁺ | Extra all-evaluations hypothesis excludes it | retain |
| §5.5 monodromy untwisting | N²=0 | exp(−uN)(e₁+ue₀)=e₁,φ(e₁)=pe₁ | Crystalline eigenspace has same vector-space data after untwisting | retain |
| §5.5 affinoid filtration | Point,i=0; annulus,i=1 | Point FilᵏB=tᵏR; annulus Fil¹⁺ᵏB=tᵏB for k=0,1 | Hodge jump tied to cohomological degree | retain |
| §5.6 limits of geometric recovery | Good reduction and Tate elliptic curves | Both geometric Hom ranks 2; ranks of N=0 and 1 | Free extended module alone does not determine N | retain |
| Worked trivial-line example | m=−1,0,1 | Degrees 1,0,−1; admissible sublattice of t⁻¹R is R; none inside tR | Consistent with §§0.2–0.4 | retain |
| Worked proper-curve example | Geometrically connected g=0,1; two disjoint projective lines | Ranks/heights (1,0,1),(1,2,1); disjoint union (2,0,2) | Rank-one endpoints need geometric connectedness | add hypothesis and negative control |
| Worked disc example | [T] in O(D†)/C | [T]↦dT≠0,HK image 0,Fil image 0,height 0 | Agrees with square and Pair | retain |
| Worked rational-function example | f=ΣπⁿTⁿ at T=0 and T=π⁻¹ | f(0)=1; formal denominator at π⁻¹ is 0; disc/affine H_dR=(K,0) | Unfiltered invariance survives failed function extension | retain |

## Unresolved obligations

No unresolved build, gate, declaration, dependency-direction or port-format issue is left. This does **not** turn the accepted conditional mathematical inputs into proved supplier theorems. The accepted review records sixteen grouped extension gaps; the README retains all twenty-four more finely named exact contracts. The list includes the C-valued de Rham extensions, tube and proper-pair inputs, bounded arithmetic filtration/reconstruction, positive crystalline positivity, Galois Hom vanishing, period-lattice gluing, TVS/qBC/period Hom and countable BC limits, bounded-below strict derived limits, analytic complexes/stable-range comparison/exhaustion, continuous quotient splitting, overconvergent crystalline realization, algebraic-over-C/GAGA/log-period inputs and integral proper-factor étale comparison. None is discharged merely by the successful empty-namespace build or by the finite computations above.

The source package's distinction between the main comparison/recovery branch and the two extra obligations (continuous syntomic splitting and positive crystalline equality) is retained. No new source theorem is claimed to prove either of those obligations. The unrestricted smooth-dagger conjectures are still identified as research statements.

No suspicious instruction asking for commands, credentials or external writes was encountered in the source or review text used. Repository-wide execution and editing remained within the brief; no credentials were read and no downloaded code was run.


Pull request: #1759 (roadmap/cst-conjecture-for-dagger-varieties at 2ad4b9a)
