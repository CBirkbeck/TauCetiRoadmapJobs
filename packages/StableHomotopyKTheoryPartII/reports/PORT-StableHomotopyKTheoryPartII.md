# PORT-StableHomotopyKTheoryPartII

Branch: `roadmap/stable-homotopy-k-theory-part-ii`.
Head: `aec0155bb43cf8e233c4e7f586469d6b4049802a`.
Commit: `StableHomotopyKTheoryPartII: roadmap (README, Suggested.lean, metadata)`.

The initial worktree was clean at `c994070`. The commit adds only `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md`, `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` and `TauCetiRoadmap/StableHomotopyKTheoryPartII/metadata.toml`. The worktree is clean. No push, pull-request write, issue write or comment was made.

## Validation

Command: `lake build TauCetiRoadmap.StableHomotopyKTheoryPartII.Suggested`.

Exact final outcome line:

```text
Build completed successfully (8954 jobs).
```

Warning count: **0**. The module has no admitted declarations, so it has no `sorry` warnings either. An initial build without the `module` header produced the module-system import warning; retaining the package's `module` header and changing only `public import Mathlib` to `import Mathlib` eliminated it. The final Lean file was built after that change and has not changed since.

Exact push-gate summary on the committed tree:

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The first push-gate run, before the new folder was committed, failed only with `dirty=1`; every other counter was zero. The committed-tree run above exits 0.

Exact output of the separately requested dependency-direction command, with `--movable`, the supplied merge-order file and the supplied content checkout:

```text
depcheck: 188 roadmaps, 1151 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. `git diff --cached --check` passed before committing. The citation resolver, against main `c994070` and the supplied open-head index, reports no cross-roadmap citations found nowhere and no Lean names found nowhere. Its note that external Lean names were not checked automatically was addressed by direct searches and source reads in the actual pinned Lake packages.

## Draft pull request body

Build the Singer constructions and controlled Adams comparisons needed to prove the prime-order generalized Segal conjecture for every bounded-below spectrum. Compare the Tate-valued Frobenius with power operations in all integer degrees, identify its Steenrod and localized KU forms, and prove the simply connected free-loop Segal theorem, with explicit counterexamples preserving the necessary boundedness hypotheses.

The roadmap retains the full construction APIs, coefficient and representation conventions, exact supplier contracts and worked examples. The target-signature companion records the headline results whose spectral carriers are absent at the pins. The additional finite Steenrod Hopf-chain and finite-field Witt étale/Frobenius supplier contracts remain explicit.

AI assistance: Codex (GPT-6) performed this port, source and ownership checks, and the computed mathematics pass.

## Supplier roadmaps still in pull requests

The direct suppliers absent from main are **StableHomotopyKTheory**, **TangentialBordism**, **KTheoryFiniteLocalFields**, **AInfCohomology** and **RefinedTraceMethods**. The checked main-branch suppliers are **GeneralizedCohomology**, **BordismFormalGroups**, **EnhancedDerivedSheaves**, **AlgebraicTopology** and **TopologicalKTheory**. All are permitted by the supplied merge order or already on main.

The supplier read-through checked these exact interfaces, rather than inferring them from roadmap titles:

| Supplier | Interface checked and consumed |
| --- | --- |
| StableHomotopyKTheory | Layer 5's stable comparisons; §7.9 Milnor sequence; §§7.14–7.18 completeness/detection/closure; §7.19 rational spectra; §§7.21–7.26 filtration pages and convergence |
| GeneralizedCohomology | G2.8 extended powers; G3.8 homotopy limits; G3.9 function-spectrum completion; G4.2 and G5.3 Thom objects; G5.4 ku/KU |
| TangentialBordism | B4 items 1–2 mod-2 operations and Adams; item 7 odd-prime operations, actual stable operation algebra and Adams; item 8's infinite exterior change of rings distinguished from the exhaustive finite-chain contract |
| BordismFormalGroups | F3 ku/BP and Johnson–Wilson Bott comparison; F6.1 localization; F6.3 finite Hopf/Margolis constructions; F6.4 smashing; F6.5 coherent Borel actions, norm/Tate, transfers and finite-height descent |
| KTheoryFiniteLocalFields | §4.0 genuine cyclic models; §4.4 residual/genuine comparison; §4.5 algebraic cyclic resolution, Eilenberg–MacLane/Tate comparison and homotopy Tate spectral sequence |
| AInfCohomology | AI.7.2 spectral tensor-Tate diagonal and Tate orbit lemma, including boundedness and residual actions |
| RefinedTraceMethods | §§2.1, 2.3–2.4 action, truncation, completion and parametrized interfaces; §§2.5–2.6 cyclic/THH; §2.8 E∞ Frobenius; §2.10 spherical group-ring/free-loop model; §§2.11–2.13 genuine/representation models; §2.16 restriction pullbacks; §5.1 localized stable Adams; §5.3 KU orientation; §6.1 spectral étale lifting |
| EnhancedDerivedSheaves | E3 coherent Kan extensions/adjunctions; E5:abstract monoidal stable and operadic objects |
| AlgebraicTopology | Stage 6 ordinary cohomology, products and comparison |
| TopologicalKTheory | T1–T5, particularly T2.5 Adams operations and T4's chosen Bott comparison |

Main-branch copies, not progress/revision heads, were used for suppliers on main. For the other direct suppliers the indexed head was read with `roadmaps show`. The pin revisions are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, matching `lake-manifest.json` and both dependency checkouts.

## Port changes and upstream mathematics pass

The package's eight layers, **38 numbered subsections**, ten construction API lists, conventions, supplier contracts, layer dependencies and worked examples are retained. Direct counting gives **147 package Check bullets and 148 port Check bullets**, in 43 Check lists. Every numbered subsection has at least three Checks. The new Check is the equivariant duality test below.

1. **Corrected §1.2's dual spectral-sequence page.** Pagewise duality at the same filtration indices gives `Hom_(𝔽_p)(Ĥ^(−s)(G;H_tX),𝔽_p)`, equivalently Tate homology `Ĥ_(−s)(G;H^tX)`, not Tate cohomology `Ĥ^(−s)(G;H^tX)`. The README now distinguishes Tate homology and its `Ĥ^(s−1)` convention explicitly. The source constructs the two exact couples and dualizes the complete-resolution terms (lnr12 line 1451, Definition 4.12 and Remark 4.13, pp.891–892). At p=5 and Weyl element 2, the homological class t in bidegree (2,0) has weight 2; its dual has weight 3=2⁻¹, agreeing with the H¹ class and disagreeing with the original weight 2. This computed negative control was added to §1.2. The homological page, unit argument, strong-convergence hypotheses and all headlines are unchanged.
2. **Verified the accepted non-blocking locator note.** IV.1.14 is a Remark (ns18 line 5067). The supplied package already says “Remarks IV.1.13–IV.1.14” at both §7.3 occurrences, so that correction was retained without introducing a redundant edit. The Bott witness remains `(1+β)^p=1+pβ` with β²=0 on S².
3. **Made the bibliography self-contained within the permitted three-file folder.** It no longer refers to an absent adjacent `sources.toml`. Editions, exact section/page locators and source-id line locators remain in References. Kuhn and Malkiewich hyperlinks now specify the manifest's actual arXiv versions, v1 and v4 respectively.
4. **Reworded supplier-gap process labels as mathematical contracts.** The exhaustive-chain and finite-field Witt contracts retain all their hypotheses and conclusions, owners and dependency uses. Their unresolved status is recorded below; the rewording does not pretend that either contract has been discharged.
5. **Repaired the import spelling.** The package's single `public import Mathlib` is the required single `import Mathlib`; no Tau Ceti import is needed. The existing `module` header is necessary for a warning-free build at these pins. Metadata remains `topic = "math.AT"`, matching main's GeneralizedCohomology folder.

The README was reread as a mathematical specification, including all layer examples and cross-layer signs: Euler normalization, the degree-dependent odd coefficient, the p-fold rank in the Thom adjunction, the distinction between the two KU actions, and the p-adic genuine fixed-point conclusion. No mathematical scope was narrowed.

## Lean retention, signature audit and pinned declarations

**Nothing moved from Lean to README.** The accepted Lean file already contains only its module docstring and empty namespace. Its docstring lists the actual headline theorems and the missing spectral carriers; all supporting finite-set and ordinary Witt statements already live in the README. No API padding, admitted data or substitute predicates were present to relocate. The port changes only the import spelling.

The object search at the pins found algebraic Tate cohomology, Witt vectors, general category-theoretic spectral objects and ordinary homology/cohomology, but no supplied symmetric-spectrum category with derived spectral smash, Eilenberg–MacLane spectra, spectral norms/Tate, stable Steenrod-module/Singer functors, coherent KU or genuine cyclotomic carriers needed by these headlines. Algebraic Tate complexes do not make the spectral results statable. Ordinary Witt vectors alone do not make the spherical Witt result statable. The acceptance-test file therefore correctly contains no theorem declarations.

The requested `#check @name` audit has **zero local declarations to enumerate**: a mechanical scan finds no `def`, `abbrev`, `instance`, `opaque`, `theorem` or `lemma` in `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean`. There are no section variables, hidden hypotheses or elaborated local signatures to compare, and no binder change was required. The module was elaborated by the targeted Lake build. No empty placeholder theorem was introduced to manufacture a signature check.

Direct native-source checks, at the pins rather than the earlier package review's revisions:

| Declaration | Pinned file and line | Content and limits checked |
| --- | --- | --- |
| CategoryTheory.Functor.sections | Mathlib/CategoryTheory/Types/Basic.lean:222 | Compatible dependent functions; its body imposes transition equations, not finiteness or nonemptiness |
| nonempty_sections_of_finite_cofiltered_system | Mathlib/CategoryTheory/CofilteredSystem.lean:79 | Cofiltered, finite nonempty stages; cannot simply be applied to empty eventual ranges |
| CategoryTheory.Functor.eventualRange | Mathlib/CategoryTheory/CofilteredSystem.lean:125 | Intersection of incoming transition ranges |
| CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range | Mathlib/CategoryTheory/CofilteredSystem.lean:230 | Finite incoming ranges give stabilization |
| CategoryTheory.Functor.toEventualRangesSectionsEquiv | Mathlib/CategoryTheory/CofilteredSystem.lean:255 | Native equivalence of compatible-section types |
| CategoryTheory.Functor.surjective_toEventualRanges | Mathlib/CategoryTheory/CofilteredSystem.lean:262 | Requires Mittag–Leffler |
| CategoryTheory.Functor.eval_section_surjective_of_surjective | Mathlib/CategoryTheory/CofilteredSystem.lean:312 | Finite nonempty stages, cofilteredness and surjective transition maps |
| CategoryTheory.Functor.eventually_injective | Mathlib/CategoryTheory/CofilteredSystem.lean:323 | Same finite/surjective context, plus nonempty index and finite section type |
| frobenius | Mathlib/Algebra/CharP/Lemmas.lean:321 | Real body x↦x^p on CommSemiring with ExpChar |
| WittVector.frobenius | Mathlib/RingTheory/WittVector/Frobenius.lean:218 | Native ring endomorphism, p prime, commutative coefficient ring |
| WittVector.coeff_frobenius_charP | Mathlib/RingTheory/WittVector/Frobenius.lean:255 | Coefficient pth powers require CharP |
| WittVector.frobenius_zmodp | Mathlib/RingTheory/WittVector/Frobenius.lean:275 | Identity specifically over ZMod p |
| WittVector.equiv | Mathlib/RingTheory/WittVector/Compare.lean:199 | W(ZMod p)≃+*ℤ_[p], with the prime instance |

The finite inverse-system target uses these existing objects and adds the nonsurjective/empty-limit pro-isomorphism. It does not introduce another section, eventual-range or surjectivity API.

## Sources and ownership sweep

The package's eleven legal-source texts were available by the hashes in `packages/StableHomotopyKTheoryPartII/sources.toml`. The source labels in this report refer to those numbered extractions. Source passages were read as evidence, not instructions; no source passages were copied into the port. The corrections and key proof-route inputs were checked at the following locators:

| Source | Locators used in the port audit |
| --- | --- |
| lnr12 | line 265 for inverse-limit Adams; line 641 for Singer formulas/augmentation; line 722 for the Tor/Ext comparison; line 1451 for the dual complete-resolution page; line 1488 for homological convergence; line 1550 for the smash/continuous-homology comparison; line 1608 for products; line 1935 for the extended-power stage comparison; line 1964 for the continuous Singer theorem and its following-page proof |
| agm85 | line 214 for the exhaustive finite chain; line 236 for the localized bimodule; line 290 for the freeness used by the Tor argument |
| ns18 | line 3236 for the actual diagonal; line 3271 and line 3331 for bounded-below Segal and finite pro-constancy; line 4833 for Frobenius; line 4858 for the marked spherical Witt object; line 4868 for Weyl refinement; line 4920 for the space factorization; line 4972 for the transfer discussion; line 5002 and line 5067 for KU and the corrected Remark label; line 5098 and line 5132 for the coefficient splittings and stable-operation comparison |
| bmms86 | line 4297 for extended/internal powers and transfers; line 4481 and line 4501 for the Euler normalization underlying the accepted odd-primary sign corrections |
| milnor58 | line 406 for the dual polynomial/exterior algebra and following triangular-pairing proof |
| cartan55-I, cartan55-II, cartan55-III | line 131, line 153 and line 114 respectively, with the exposé sections/pages retained in References |
| kuhn04 | line 596 and line 625: finite-complex comparison, with its actual connectivity hypotheses |
| malkiewich17 | line 609 and line 619: simply connected arbitrary-space comparison; normalized fiber terms at line 623 give bottoms n,n+2 for S² |
| ns19-correction | line 18 and its listed typesetting corrections; it does not supply a replacement for the mathematical sign/transfer normalizations retained here |

Ownership searches used the mathematical objects: Singer modules, stable Steenrod operations and finite Hopf pieces, extended powers, continuous Greenlees cohomology/homology, tensor-Tate diagonal, finite-field spherical Witt lifts, virtual Thom twists, KU Tate coefficients/Adams operations and free-loop totalization. `roadmaps list`, `roadmaps grep` and `roadmaps show` were used; the sweep included main, the supplied open-head index and the board's package READMEs. Searches by object were also made in both pinned libraries. No local Lean declaration exists that could duplicate a supplier's fully qualified name.

**Supplier replacements and duplication removals:** no further target deletion or supplier replacement was needed beyond the package's accepted ownership decisions, which are preserved in Scope and ownership. General Steenrod operations, the Adams tower, extended powers, spectral Tate and its diagonal, ordinary Thom objects, ku/KU and stable localized Adams maps remain with their existing named owners. The sphere fixpoint counterexample remains a derived example, not a second local headline target. The continuous homological Greenlees theorem adds a different comparison to the supplied homotopy Tate sequence.

The overlap checks distinguished two potentially misleading object matches. ChromaticHomotopyTheory §9.5 treats p-completed KU with its completion/Tate comparison, whereas §7.2 here treats uncompleted KU and also C_(p²) and Weyl invariants; it is not imported as a supplier. HabiroCohomologyFoundationsPartII's general spherical-lift direction includes finite-field inputs, but the accepted earlier owner of the finite-field case remains §4.8 here. No supply edge was added toward either later roadmap. AlgebraicTopologyPartII's unstable loop/H-space work and EllipticKTheory's arithmetic elliptic-curve K-theory do not replace the spectral Singer/Frobenius targets here.

Ownership against the supplied open-head files was checked. The index-wide grep was broader, but unprovided open heads were not individually sought for a separate ownership review. No claim of a full review of unprovided open work is made.

## Unresolved accepted supplier obligations

The accepted review explicitly conditions acceptance on `finite-field-witt-etale-frobenius`. The finite-field contract remains in Exact supplier contracts and in §4.8's Needs: W(k)/ℤ_p must be finite étale and free of degree d, and reduction must identify its algebra endomorphisms with those of k, carrying Witt Frobenius to the p-power map. The pinned `WittVector.equiv` supplies only W(𝔽_p)≃ℤ_p. RefinedTraceMethods §6.1 states spectral étale lifting and general spherical input conditions, but does not itself state this integral finite-field theorem. Nothing outside the permitted folder was edited to add it.

The accepted package also records `steenrod-finite-hopf-chain`. BordismFormalGroups F6.3 on main constructs the finite E(Q_i), T_t and Margolis tools; its cited finite subalgebras do not themselves state the exhaustive AGM chain and left/right freeness contract. TangentialBordism B4 item 8's exterior change of rings does not discharge it. The exact additional contract and its low-dimensional Checks remain explicit. These two supplier additions are outstanding mathematical inputs, not build/gate failures and not new port findings disguised as completed suppliers. Their ownership was not moved in this port, preserving the accepted review/design decisions.

There are no other unresolved port changes. No suspicious instructions were encountered in the fetched or local mathematical text.

## Adversarial mathematics pass

The following are computations performed for this port, not a claim that a `sorry` build proves truth. Section numbers refer to `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md`. An API row identifies the bullet by its order within that definition. Supplier results are tested as inputs, not added as local targets. Connectivity is measured by the lowest potentially nonzero homotopy degree.

| Statement | Instances tried | Values computed on the two sides or competing models | Result and change |
| --- | --- | --- | --- | --- |
| Universe and cardinality convention | Empty basis, two-element basis, uncountable small basis J | Direct-sum dimensions 0, 2, card(J); the constant-one function on infinite J belongs to the product but has infinite support | Retain smallness without a countability restriction |
| Homotopy/cohomology grading | R=ΣHℤ, degrees n=−1,0,1 | R⁻¹(*)=ℤ=π₁R; R⁰(*)=0=π₀R; R¹(*)=0=π₋₁R | Retain integer grading |
| Symmetry, composition and Bockstein conventions | Two degree-one or degree-two coordinates; odd x,z at p=3 | Swap signs −1,+1; β(xz)=yz−xw; Sq¹Sq²=Sq³ while Sq¹Sq¹=0 | Retain signs and right-to-left composition |
| Binomial convention | Upper −1, lower 1; lower −1 | binom(−1,1)=−1=1 mod 2; binom(r,−1)=0 | Total-function boundaries fixed |
| Completion versus finiteness conventions | S_p-completed p-inversion diagram; Hℚ | Completed colimit 0 but colim π₀ maps from S_p-complete is ℚ_p; Hℚ/p=0 while π₀Hℚ=ℚ | Retain finite-cell/retract condition, not categorical compactness |
| Laurent coefficients and right coefficients | e,z odd; degree-one and degree-two classes | ez=−ze; degrees of u²s and v³t² at p=2,3 are 2−1=1 and 6−4=2 | No ungraded infinite-series ring or unsigned interchange |
| Frobenius source/target convention | Sphere unit; H𝔽₄ at p=2 | Unit 1→1; a→a²=a+1 with a²+a+1=0 | Multiplication follows tensor diagonal; trivial action is on the output ring |
| Bott and p-series conventions | H=1+β on S²; x=0 at p=3 | H³=1+3β since β²=0; (1+0)³−1=0 while (0−1)³−1=−2 | Retain line and coordinate normalizations |
| Imported extended powers | k=0,1,3; zero input; G=S₃ | D₀(0)=S, D₁(0)=0, D₁(S)=S, π₀D_(S₃)(S)=ℤ=π₀Σ∞₊BS₃ | k≥1 retained for D_G |
| Imported Steenrod normalization | u in H¹RP∞; v in H²CP∞ at p=3 | Sq⁰u=u, Sq¹u=u², Sq²u=0; P¹v=v³ of degree 6, P²v=0 | Stable algebra is not quotiented by instability |
| Imported Milnor dual/coproduct | p=2 degrees 0,1,2; p=3 ξ₁,τ₀ | Dimensions 1,1,1; degrees 4,1; Δξ₁=ξ₁⊗1+1⊗ξ₁ and Δτ₀=τ₀⊗1+1⊗τ₀ | Unit and primitive cases agree |
| Imported Adams tower | B=0,H𝔽_p,S | Zero pages; Ext(A_p,𝔽_p) has scalar 𝔽_p in (0,0); sphere has positive Ext filtration; (t+r−1)−(s+r)=(t−s)−1 | Keep differential and completion hypotheses |
| Imported norm/Tate | Trivial group, induced object, trivial integral C₂ module | Norm=id gives Tate 0; induced Tate 0; integral π₀ norm 2 gives Tate ℤ/2 and odd group 0 | Unshifted cofiber retained |
| Imported finite-height descent | n=1,2 | Lower targets E(0)=Hℚ, E(1); raw height-one Tate is rational, not merely K(1)-acyclic | No weaker replacement |
| Exhaustive-chain contract | n=−1,0,1, p=2,3 | Dimensions 1,2,8 at 2; 1,2,12 at 3; E(Q₀,Q₁) has dimension 4 | Additional supplier obligation retained explicitly |
| Exhaustive-chain freeness | Sq¹ acting on 1,Sq¹,Sq²,Sq³ | Images Sq¹,0,Sq³,0; kernel/image agree in degrees 0–3; trivial 𝔽₂ module has homology 𝔽₂ | Margolis example does not replace the exhaustive chain |
| Imported ordinary cyclic resolution | Trivial ℤ,𝔽_p modules; p=2,3 | Differentials (0,p); mod p both become 0; integral even Tate ℤ/p and odd Tate 0 | Homotopy spectral sequence distinguished from continuous homology |
| Imported Tate diagonal/orbit input | X=0,S,Hℚ; bounded-below sphere orbit term | Δ(0)=0, unit 1→1, T_p(Hℚ)=0; residual Tate of S_(hC_p) is 0 | No sphere Segal equivalence used as supplier input |
| Imported fixpoint/completion input | X=H𝔽_p and S; p=2,3 | Fixpoint value for H𝔽_p is 0; sphere derived example has π₀ℤ₂ or ℤ₃ | Bounded-above hypothesis retained; sphere value derived locally |
| Imported spectral étale and finite-field contract | k=𝔽_p,𝔽₄ | Ranks 1,2; a→a+1→a; prime-field Witt Frobenius=id | Integral finite étale/endomorphism contract remains explicit |
| §1.1 coefficient algebra and W-invariants | p=2,3; a=−1 at 3 | Mod-2 one class per degree; at 3 weights(t,t²,e)=(−1,1,1), invariant period 4; integral π₀=𝔽_p, π₁=0 | Retain |
| §1.1 normalization | p=3, b→2b and (t,e)→(−t,−e) | New (u,t,e)=(2u,2t,e), (2t)²=t²; βe=1 versus β(−e)=−1 | Wrong model excluded |
| §1.2 continuous groups and comparison | X=S, G=C₂; X=0 | H^c_n=𝔽₂ for all n, ordinary H_n(S₂-complete;𝔽₂)=0 for n≠0; zero gives 0=0 | Tower dependence retained |
| §1.2 strong convergence and multiplication | Sphere at 2; C₃ at p=2; trivial group | E² has bottom row 𝔽₂ in all s, d_r=0; t·t⁻¹=1; prime-to-p/trivial Tate pages 0 instead of ordinary H₀=𝔽₂ | Retain complete filtration and Tate cup product |
| §1.2 dual page | X=S, C₅, a=2, bidegree (2,0) | Homological t has weight 2; dual weight 3=2⁻¹; Tate homology Ĥ₋₂≅Ĥ¹ has weight 3; erroneous Ĥ⁻² weight 2 | Corrected Tate cohomology to Tate homology; added negative control |
| §1.2 unit/detection route | X=H𝔽_p tensor-powers | Norm on unit coefficient is p=0; Ĥ⁰(C_p;𝔽_p)=𝔽_p and unit 1 survives in filtration 0 | Unit normalization retained |
| §2.1 continuous-cohomology definition | Constant H𝔽_p; zero-bonding suspended tower | Colimits A_p and 0; a direct sum in second example is nonzero | Retain actual transition maps |
| §2.1 API 1: stage maps | Constant 𝔽_p-cohomology; zero transitions | 1 maps to 1 in constant colimit; 1 maps to 0 for zero transitions | Compatibility holds |
| §2.1 API 2: universal property | Constant scalar module, maps multiplication by 2 at p=3 | Induced scalar map sends 1→2; zero stage maps give 0 | Retain uniqueness and linearity |
| §2.1 API 3: comparison to limit | Singer sphere tower at 2 | Continuous H⁻¹=𝔽₂, ordinary H⁻¹=0; comparison sends it to 0 | No isomorphism claimed |
| §2.1 API 4: cofinal reindexing | Constant tower; Singer even indices | Constant identity 1→1; even-index bottom degrees 1,−1,−3 remain unbounded below | Retain cofinal rather than fixed-index assertion |
| §2.2 inverse-limit Adams | Constant H𝔽_p, zero; Singer n=0,1,2 | E₂ scalar/abutment 𝔽_p in degree 0; zero/zero; lower bounds at 2 are 1,0,−1 | Individual bounds, no uniform bound |
| §2.3 Singer definition and action | M=0,𝔽_p; r=−1,s=1 at 2 | R₊0=0; Sq¹(x⁻¹⊗1)=binom(−1,1)·1=1; at odd p β(xy⁻¹)=1, β(y^r)=0 | Twisted action necessary |
| §2.3 API 1: functor/natural augmentation | M=N=𝔽₃, scalar 2 | ε(2Σxy⁻¹)=2=2ε(Σxy⁻¹) | Retain |
| §2.3 API 2: exactness | Split sequence 0→𝔽_p→𝔽_p²→𝔽_p→0 | Each Laurent monomial has dimensions 1→2→1, kernel and image each dimension 1 | Retain all graded modules |
| §2.3 API 3: surjectivity and degree | Unit at p=2,3 | Degrees of Σx⁻¹,Σxy⁻¹ both 0; both augment to 1 | Suspension essential |
| §2.3 API 4: trivial-module comparison | r=−1 at 2; xy⁻¹ at 3 | Localized usual operations give Sq¹x⁻¹=1 and β(xy⁻¹)=1, matching Singer formulas | Retain |
| §2.4 Tor-equivalence and Ext consequence | M=0,𝔽_p; N=𝔽_p,Σ⁻¹𝔽_p | Zero Tor on both sides; degree-zero scalar Hom dimensions 1=1; shift −1 on both scalar tests | No M bound added; N bounds retained |
| §2.5 Singer tower definition | B=S,ΣS at 2; n=0,1,2 | Bottom degrees of U_nS=1,0,−1; U₀ΣS bottom 3 versus ΣU₀S bottom 2 | Fixed-stage suspension commutation excluded |
| §2.5 API 1: functoriality | B=0 and identity sphere map | Maps 0→0 and identity on bottom-cell scalar 1 | Retain |
| §2.5 API 2: limit comparison | B=S,H𝔽_p | Limit target π₀ℤ_p and 𝔽_p; agrees with §2.7 | No extra suspension |
| §2.5 API 3: filtration index/maps | p=2,3; n=0,1,2 | Indices (1,0,−1) and (1,−1,−3); U_nΣB=ΣU_(n−1)B for n≥1 | Brackets are filtration, not suspension |
| §2.5 API 4: stage bounds/finite type | Sphere, p=2 | Stage bottoms 1−n; degreewise homology at a fixed stage has dimension 0 or 1 | Stagewise finiteness without uniform connectivity |
| §2.6 Singer cohomology comparison | B=0,S; p=2,3 | 0=0; degree-zero Σx⁻¹ and Σxy⁻¹ map to 1, while unshifted degrees are −1 | Comparison and augmentation retained |
| §2.6 map-identification route | H𝔽_p, suspension Σ^qH𝔽_p | g(1)=1, A_p-linearity gives g(a)=a; suspension sends unit degree 0→q | Naturality then tests each represented class; no genuine norm imported |
| §2.7 finite-type Segal | S,H𝔽_p,Hℚ at 2,3 | Completed source/target π₀ respectively ℤ_p/ℤ_p, 𝔽_p/𝔽_p, 0/0; uncompleted ℚ would be nonzero | Retain completion, not integral equivalence |
| §3.1 finite tower/pro-isomorphism | Constant ∅, singleton, two points; {a,b}←{a}; binary-word tower | Image/limit sizes 0/0,1/1,2/2,1/1; binary-word limit 2^ℵ₀ and evaluations not injective | Empty and nonsurjective cases retained |
| §3.1 uniform sum and group variants | Copies of same tower; constant S₃ and C₂ | One transition index works in every copy; identity maps preserve group orders 6 and 2 | No assertion for nonuniform families |
| §3.2 truncation definition | X=0,H𝔽_p, n=−1 | All stages at zero 0; negative truncation of connective tensor is 0 | Integer truncation convention retained |
| §3.2 API 1: tower/naturality | Identity/zero maps | Induced maps on each coefficient are identity/0 | Retain |
| §3.2 API 2: limit | H𝔽_p at i=0,1 | Limiting groups 𝔽_p,0, equal to π_iH𝔽_p | Diagonal compatibility retained |
| §3.2 API 3: arbitrary sums | Two summands at p=2,3; empty sum | Mixed word counts 2 and 6, free orbit counts 1 and 2, Tate contributions 0; diagonal count 2; empty sum 0 | Fixed truncation essential |
| §3.2 API 4: finite groups | n=−1,0, X=H𝔽_p | Stage −1 groups 0; stage 0 is trivial-action H𝔽_p Tate with one 𝔽_p per degree | Finiteness per degree, not boundedness of Tate output |
| §3.3 arbitrary-dimensional Segal | Dimensions 0,1,2,κ | π₀ dimensions on source/target 0/0,1/1,2/2,κ/κ; nonzero degrees vanish | No finite-dimensional restriction |
| §3.4 bounded-below Segal | Σ⁻¹H𝔽_p, arbitrary vector space; KU at 2 | Degree −1 group 𝔽_p/𝔽_p; π₀ dimension κ/κ; KU-completion/2 has π₋₂𝔽₂ versus tensor-Tate/2 group 0 | Boundedness retained |
| §4.1 Weyl refinement | p=2,3; sphere; S[ℕ] | W orders 1,2; 2⁻¹=2 mod 3; unit 1→1; monoid generator z→z² at 2, distinct from z | Unit-normalized refinement retained |
| §4.2 underlying-space lift | X=0,Hℤ at p=2; sphere | Contractible at 0; lift(2)=2u+Nm(1), restriction 4, Tate value 2; candidates 2u and 4u have restrictions/Tate values (2,2) and (4,4); sphere 1→1 | Set-level lift, not additive infinite-loop map |
| §4.3 norm splitting | X=0,H𝔽_p; H𝔽₂ at 2 | Zero/zero; degree-zero kernel and quotient each order p; at 2 middle ℤ/4 has twice lifted 1 equal nonzero kernel element | Positive degrees split, π₀ only set section |
| §4.4 power definition | Hℤ, H𝔽₄, KU, point | Values P₂(2)=4, P₂(a)=a+1, P₂^KU(2)=3·1+sign; scalar pullback gives 4·1 with character 4 instead of 2 | Distinguishes power from pullback and additive candidate |
| §4.4 API 1: naturality | ℤ→𝔽₃, element 2 | Reducing 2³=8 gives 2; powering reduction gives 2³=2 | Retain |
| §4.4 API 2: multiplication/unit/zero | Integers 2,3 at p=2; zero ring | P₂(6)=36=4·9; 1²=1,0²=0; zero ring 0=1 gives unique map | Retain multiplicativity without additivity |
| §4.4 API 3: restriction | KU rank two at p=2 | Dimension of 3·1+sign is 4=2² | Retain actual Borel class |
| §4.4 API 4: transfer sum | Hℤ, p=2, x=y=1; KU same | Defect 4−1−1=2=transfer(1); KU defect 1+sign=regular representation | Transfer, not additive power |
| §4.5 transfer-ideal definition | p=2,3,5; Hℤ at point | Young indices (2),(3,3),(5,10,10,5), gcds 2,3,5 | Actual subgroup transfers retained |
| §4.5 API 1: generators | p=5, i=2 | Transfer(1)=10∈(5) | Retain |
| §4.5 API 2: base change | ℤ→𝔽₅ at point | (5) maps to ideal 0 | Retain |
| §4.5 API 3: quotient is ring map | p=5, x=y=1 | Additive defect 2⁵−2=30 gives 0 mod 5 and 30 mod 120 | Correct ideal (5), not (120) |
| §4.5 API 4: factorization | Hℤ at point, class 5 | Transfer generators map to 0 in Tate π₀𝔽₅; quotient/Tate π₀ both 𝔽₅ in this test | Does not assert general equivalence |
| §4.6 degree-zero Frobenius | Hℤ at 2; H(𝔽₃[z]); empty X | 2→4 mod 2=0 on both routes; z→z³ on both, z³−z≠0; empty X gives unique 0 | Retain all spaces and rings |
| §4.7 ordinary/finite-cell comparison | A=ℤ,ℚ,0,𝔽₄; R=S_p-complete | 2³ mod 3=2; rational/zero targets 0; a→a+1; sphere φ(1)=1 | No identity claim for every coefficient field |
| §4.8 spherical Witt lift | d=1,2; k=𝔽₄ | Ranks 1,2; d=1 sphere, φ=id; at d=2 a→a+1→a | Marked finite-field scope retained |
| §4.8 API 1: π₀ | k=𝔽_p and 𝔽₄ | W(𝔽_p)=ℤ_p; W(𝔽₄)/2=𝔽₄ | Structural base map retained |
| §4.8 API 2: marked uniqueness | k=𝔽₄, marked versus unmarked | Unmarked endomorphisms reduce to two maps a→a,a+1; an automorphism respecting fixed π₀ marking reduces to a→a | Marking rules out ambiguity |
| §4.8 API 3: module rank | d=1,2 | π₀ base-module ranks 1,2; reduction dimensions 1,2 | Finite-cell hypothesis justified by finite freeness |
| §4.8 API 4: Frobenius identification | Teichmüller [a] over 𝔽₄ | [a]→[a²], twice [a]→[a⁴]=[a]; first iterate differs for a outside 𝔽₂ | Integral endomorphism contract retained |
| §5.1 virtual twist definition | V=0,−1 at point; Möbius line | Thom object Σ∞₊X at 0; rank −1 gives π₁R; Möbius integral cochain differential 2 gives ℤ/2 versus trivial-line differential 0 giving ℤ | Rank-only wrong model excluded |
| §5.1 API 1: pullback | Möbius line pulled back to point | Fiber becomes ℝ, determinant along point loop 1 versus −1 around base circle | Pullback retains actual bundle |
| §5.1 API 2: adjunction | X=point,V=−1,R=ΣHℤ | [ΣS,ΣHℤ]=ℤ=π₀(Σ⁻¹ΣHℤ) | Negative rank checked |
| §5.1 API 3: direct sum/inversion | ρ₂,−ρ₂; two ρ₂ copies | Ranks 0 and 4; signs (−1)(−1)=+1; inverse tensor gives sphere | Retain coherent inverse |
| §5.1 API 4: trivial rank | n=−1,0,1,R=ΣHℤ,X=point | Groups ℤ,0,0 on both grading descriptions | All integers retained |
| §5.2 Thom adjunction | n=0,−1; p=2; R=ΣHℤ,Σ²Hℤ | n=0 ordinary Borel groups agree; restricted n=−1 groups π₂R=0,ℤ; wrong π₁R gives ℤ,0 | Factor p retained |
| §5.3 all-degree power definition | Degree 1 mod 2; Bott degree −2 | P₂¹u has Thom expression ub+u², both nonzero; restriction P₂⁻²β=β², a unit | Both positive and negative degrees tested |
| §5.3 API 1: naturality | Pull u along S¹→RP∞; unit map to H𝔽₂ | u pulls to generator v with v²=0; ub+u² pulls to vb on both routes | Retain |
| §5.3 API 2: degree-zero comparison | KU, p=2, element 2 | P₂⁰(2)=P₂(2)=3·1+sign, character 2 | Retain |
| §5.3 API 3: restriction | Degree-one u; Bott β | b→0 gives u²; inverse-degree Bott gives β² | Actual graded pth power |
| §5.3 API 4: products | Units; two Bott factors; inverse twists | 1·1→1; β² maps to β⁴, product of two β²; (−ρ)+ρ rank 0 | Thom direct-sum/sign convention retained |
| §5.4 Tate suspension | Hℤ,p=2,n=1; reflection; n=−1 | Correct π₁𝔽₂,π₀0 versus trivial S² twist π₁0,π₀𝔽₂; sphere reflection Tate π₁ acts +1 versus underlying degree −1; inverse shift +1−1=0 | Orientation-only and dimension-only models excluded |
| §5.5 Thom/extended-power identity | X=point,V=0,1,−1 at 2 | V=0 gives Σ∞₊BΣ₂; V=1 pulled-back rank −2 determinant −1; V=−1 rank +2 | Virtual signs and full representation retained |
| §5.6 all-degree Frobenius comparison | n=0,1,−1 at 2 | 2 in Hℤ maps 0 mod 2; u maps u+u²s, degrees 1,1; negative/positive representation twists cancel to rank 0 | No boundedness added to ring R |
| §6.1 target splittings | p=3,j=0,1; integral/mod-2; sum/product | Mod-3 summand shifts 0,1,4,5; integral π₁0 versus mod-2 π₁𝔽₂; one nonzero factor in each degree | Factor 2 and correct scalar ring retained |
| §6.1 integral uniqueness | Integral summands at j=k,k±1 | Ext⁰=𝔽_p, Ext²=Ext⁻²=0; hypothetical unital H𝔽_p→Hℤ would take 0=p·1 to p≠0 | Hℤ-linear splitting, no scalars through nonexistent map |
| §6.2 even power signs | p=3,v degree 2; p=5,m=2 | v(v+u)(v+2u)=v³−vu²; division by −u² gives v−v³t²; (2!)²=4=−1 mod 5 | Accepted sign repair retained |
| §6.2 odd components/multiplicativity | x,z degree 1 at p=3 | (x−ye)(z−we)=xz+(yz−xw)e; unsigned products give xz+(xw−yz)e | Koszul and degree-dependent signs retained |
| §6.3 stable components/integral case | x,v,xz at 3; unit and u at 2 | θ₀x=−y, −P¹v=−v³, θ₀(xz)=yz−xw; left suspension sign (−1)^(n+1+i)(−1)=(−1)^(n+i); Sq⁰1=1,Sq¹u=u²; integral degree-0 component r | Full spectral equality, not π₀ agreement |
| §7.1 cyclic bundle power definition | Actual rank 2, zero, virtual −1 at p=2 | Images 3·1+sign,0,sign; characters 2,0,−1 | Complex/difference extension necessary |
| §7.1 API 1: actual bundles | Trivial rank 2,p=2 | Tensor square dimension 4 with trace 2, matching 3·1+sign | Retain |
| §7.1 API 2: pullback/restriction | Rank-two representation restricted to identity | Character at identity 4, matching ordinary tensor square | Retain |
| §7.1 API 3: virtual extension | Class 1+(−1)=0 at 2 | P₂1+P₂(−1)+tr(−1)=1+sign−(1+sign)=0 | Signed complex model agrees with transfer formula |
| §7.1 API 4: comparison with P₂⁰ | Rank 2, virtual −1, line L | Both give 3·1+sign, sign, L² respectively | Retain |
| §7.2 KU Tate coefficients | p=2,C₂,C₄; p=3,C₃; x=0 | Even ℚ₂-dimensions 1,3; odd 0; ℚ₃(ζ₃) degree 2, W-invariants degree 1; p-series(0)=0 | Uncompleted KU variant retained |
| §7.3 Frobenius/Adams | S²,β,β⁻¹ at p=2,3 | (1+β)^p=1+pβ; images pβ and β⁻¹/p multiply to 1, whereas unlocalized candidate product p | Localized target and corrected Remark locator retained |
| §7.4 orbit counterexample | p=2,3; rational Hℚ | Even comparison dimensions 3→1 and 8→2, odd 0→0; rational control 0→0 | Genuine non-equivalence for unbounded KU |
| §7.5 tensor-diagonal counterexample | KU, p=2, degrees −2,0,2 | Completed KU/2 groups 𝔽₂,𝔽₂,𝔽₂ versus rational tensor-Tate/2 groups 0,0,0 | Boundedness obstruction retained |
| Layer 7 sphere consequence | Trivial C_(p²) sphere, p=2,3; zero | Residual Tate π₀ℤ₂,ℤ₃ with quotients 𝔽₂,𝔽₃; zero input gives 0 | Derived example, not second construction target |
| §8.1 free-loop comparison | Point,S²,wedge_κS²,S¹ | Point S→S; normalized bottoms at n=1,2 are (1,3),(2,4), independent of κ; for S¹ first bottom 0 at every n | Simply connected generality retained |
| §8.2 controlled limit interchange | Constant/zero tower, fibers ΣⁿH𝔽_p, trivial group,S₃ | Constant comparisons id; π₀ orbit fibers vanish for n≥1; trivial-group norm=id and both Tate objects 0; finite S₃ preserves n lower bound | Connectivity imposed on orbit step, not fixed-point step |
| §8.3 free-loop cyclotomic theorem | Point,S²,wedge_κS²; n=0,1,2 | Point Tate π₀ℤ_p; genuine C_p sphere π₀ℤ² versus Borel ℤ⊕ℤ_p, both p-complete ℤ_p²; n=0 identity, n=1,2 one/two pullbacks | p-adic, not integral fixed-point equivalence |
| Worked examples across layers | Mod-2 u, mod-3 v,x, KU on S² | u+u²s degrees 1,1; v−v³t² degrees 2,2; x−βxe degrees 1,1; H^p=1+pβ versus constant H=1+β | Consistent with coefficient, twist and Bott conventions |

The inputs outside these hypotheses supply negative controls, not narrowed versions of the theorems: composite cyclic order is used only in the KU counterexample; S¹ is excluded from the simply connected theorem; infinite fields are excluded from the finite-field spherical lift; unbounded KU is excluded from Segal completion. Zero rings and empty spaces are allowed in the power and Frobenius comparisons. No denominators occur without p, a unit in 𝔽_p, a prime-to-p group order, or the specified localized coefficient field.


Pull request: #1733 (roadmap/stable-homotopy-k-theory-part-ii at aec0155)
