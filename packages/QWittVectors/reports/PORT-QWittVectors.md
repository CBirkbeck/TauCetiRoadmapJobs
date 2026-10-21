# PORT-QWittVectors

Branch: `roadmap/q-witt-vectors`.
Head commit: 4605fbb0a2d9279b561f9467ab5cce09d7f2469e.
Base: `c21298d`, verified with an empty initial `git status --short`.

The commit contains only `TauCetiRoadmap/QWittVectors/README.md`, `TauCetiRoadmap/QWittVectors/Suggested.lean` and `TauCetiRoadmap/QWittVectors/metadata.toml`. No push or GitHub write was performed. This report is outside the content commit.

## Validation

Command: `lake build TauCetiRoadmap.QWittVectors.Suggested`.
Exact outcome: `Build completed successfully (8976 jobs).`
Warning count: **9**, all for admitted theorem proofs (`sorry`); no other warnings or errors. The file has two real-bodied definitions (one structure and one function), nine admitted theorem targets and four proved examples, two for each definition. All necessary hypotheses are explicit declaration binders; there are no ambient section variables to disappear.

Exact push-gate summary:

```text
gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The first push-gate invocation failed only its `dirty` check on the three staged additions. The clean-tree requirement makes the passing invocation necessarily follow the commit. All other counters were already zero before committing.

Dependency command: the requested `gate --depcheck` on `TauCetiRoadmap/QWittVectors/README.md`, with name `QWittVectors` and the supplied merge order. Exact output:

```text
depcheck: 3 roadmaps, 21 edges, 0 problem(s)
```

No UPWARD or CYCLE line. BordismFormalGroups, DGAInfinity, DerivedModuleAlgebra, EnhancedDerivedSheaves and SchemeAndStackFoundations are on main. The named off-main suppliers occur earlier than QWittVectors in the supplied order. No later-roadmap notion was moved into this roadmap.

## Draft pull request body

This roadmap builds arithmetic Λ-rings and big and q-Witt vectors, from integral ghost polynomials through relative rings, differential operations and complete framed difference calculus. It culminates in smooth integer torsion-freeness, degreewise completion and the functorial p-complete E∞ de Rham comparison, supplying the algebraic interfaces for Habiro rings and cohomology across every prime and positive truncation index.

AI assistance: GPT-6 (Codex) performed the package port, supplier and overlap checks, mathematical self-review and Lean validation. No helper agents were used.

## Dependencies outside main

Neither of the supplied open roadmap heads, ArithmeticDynamics or ErdosProgressionPowers, is a dependency. The off-main supplier roadmap names are **HabiroCyclotomicCompletions**, **DerivedDeRhamCohomology** and **PrismaticCohomology**. Their supplied merge-order positions are earlier than QWittVectors. The supplied open-pull-request inventory contains neither these names nor the Part II extensions below; no additional pull-request status is asserted.

The accepted seven explicit supplier interfaces remain conditional mathematical contracts: `cyclotomic-contract`, `ordinary-derham`, `cohomology-completion`, `prismatic-frobenius`, `pd-presentation`, `dga-bockstein` and `dga-quotient`. The unbounded completion extension is assigned to DerivedModuleAlgebra, Part II, and the two DGA extensions to DGAInfinity, Part II, with the base-roadmap boundaries and exact required statements preserved. They are not claimed as pinned declarations or existing sections on main.

## Changes and final reviewer pass

- Preserved all ten layers, 53 numbered subsections, their public API statements, all 162 Check bullets, layer examples, dependencies, supplier contracts and the opening Summary. The bibliography retains all eight legal sources, versions and exact result/page/extraction locators. `metadata.toml` retains the single `topic = "math.NT"` key, matching main's format.
- The accepted review's two non-blocking notes were already applied in the package. Reverified Borger Theorem 9.2 at borger line 1995 and Corollary 9.4 at borger line 2095; retained those numbers in §1.6 and References. Reverified that §9.5 points to §9.3 for its Bockstein, independently of its §9.4 product-homotopy dependency.
- Replaced the bibliography's reference to a nonexistent local `sources.toml`. The three-file content folder instead carries its complete bibliography directly. No locators were discarded.
- Fixed the empty-coordinate-product proof by eliminating the empty subtype membership directly. The earlier simplification turned the supplied hypothesis into `True` instead of closing the contradiction.
- Completed the characteristic-two ghost example with a proved finite decision after normalization left the concrete equality `2 = 0` in `ZMod 2`. The characteristic-two failure of ghost injectivity remains the same mathematical example.
- Replaced a line-broken singleton expression in `QWitt.framedTwoTermCohomology_kernel` by a local, explicitly defined geometric sum `g` in its theorem type. This repairs parsing and states the identical annihilator ideal; `g` has a real body and is not an admitted declaration.
- Removed unnecessary `simpa` and tactic sequencing warnings from the two truncation-set and symbolic ghost examples. No statement was weakened, no binder was dropped, and no override was introduced.
- The final whole-README reread found the all-prime detection overlap described below. Its supplied provenance now appears in Scope and ownership and the exact supplier contracts, while §1.8 retains its finite-prime theorem.

## Lean-to-README moves

None. Every package statement permitted on the existing carriers remains in `Suggested.lean`, with the same generality and the proof/parsing repairs above. Heavy big Witt, Λ, q-Witt, DGA and derived-comparison constructions remain fully specified in the README. The easy frame-automorphism, radical, unit and kernel milestones are retained in Lean; no endpoint is represented by admitted data or a weakened substitute.

## Supplier replacements and duplication sweep

The sweep covered every active and completed roadmap on main and both supplied open roadmap heads, searching mathematical objects and laws as well as names: Witt indices, ghosts, Λ-coactions and Adams lifts, perfection, cyclotomic ideals, commuting endomorphism Koszul complexes, arithmetic squares, differentials, Bocksteins, framed derivatives and completion. It also covered the pinned Mathlib and Tau Ceti source trees at the manifest revisions.

The additional removal is the generic rational-and-all-prime-completion detection clause of §1.8. BordismFormalGroups §F6.5 supplies the all-prime arithmetic square for arbitrary spectra; EnhancedDerivedSheaves Layer E5:spectra-comparison supplies `moduleSpectra_equiv_derived` and `symmetricSpectra_towerComparison` for transport to module complexes. The content records this ownership only in Scope and ownership, cites those contracts exactly, and keeps the distinct finite-prime localization square and coefficient-algebra compatibility. Rationalization is outside the infinite product.

No further target was removed. The package already consumes the p-typical `WittVector` and `TruncatedWittVector` carriers, operations and topology; cyclotomic divisor, expansion and characteristic-p identities; Kähler differentials and the formally étale basis; scalar Koszul complexes, derived completion and complete-flat descent; and DG carriers from their named owners. Grepped every named library supplier in its actual source file, including the qualified definitions `KaehlerDifferential.D` and `KaehlerDifferential.linearMapEquivDerivation`. The Tau Ceti Witt completeness and continuity hypotheses match the README.

The endomorphism Koszul bridge is distinct from DerivedModuleAlgebra §0.K.1 and EnhancedDerivedSheaves §E1.5's scalar complex and reindexing comparison. The generic DGA Bockstein contract is distinct from Tau Ceti's continuous-group-cohomology connecting maps. The cyclotomic completion radical target is an ideal-theoretic consequence of the supplied polynomial identities, not a second polynomial-identity target. The all-prime source transport and finite-prime distinction are explicit rather than a second spectrum construction.

The online Mathlib/Zulip search found no additional matching q-Witt or big-Witt declaration or implementation to adopt. The relevant primary discussion distinguishes big Witt vectors from the p-typical carrier: [Symmetric Functions discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Symmetric.20Functions.html). This supplements, and does not replace, the pinned source search.

## Adversarial mathematics pass

Each row covers the named construction and **all its associated named API laws** in the indicated subsection, including constructors, extensionality, functoriality, composition, comparisons and naturality. The conventions row covers standing coefficient, universe, indexing, degree, completion and sign choices. Instances are mathematical substitutions and hand calculations; only the four examples are kernel-proved. The build establishes elaboration of the admitted targets, not their truth.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | Zero ring; empty set; m=1; q=1; p=2,3; two coordinates; derived versus ordinary completion | Positive divisors and p-typical length differ by one; quotient divisions are geometric polynomials; d¹(a,b)=D₁b−D₂a; β_h(T)=dT; coefficient Frobenius fixes q and framed Frobenius sends q to q^p | None |
| §1.1 Truncation sets and ghost polynomials | Empty set, Div(1), Div(2), Div(6), {2} | Div(6) has four terms in w₆; {2} fails divisor closure; empty coordinate product has one element | Empty-product proof and tactic repairs only |
| §1.2 Ghost image, injectivity and unit equivalence | ℤ with identity prime lifts; ghosts (1,3) and (0,1); 𝔽₂ coordinates (0,1); empty S | Dwork congruences give existence without commutation; injectivity needs index regularity; uniqueness is only on S | Completed the proved characteristic-two Check |
| §1.3 Big Witt ring | τ(1)+τ(1) over ℤ; empty S; zero coefficient ring; nonunital zero multiplication | Div(2) sum is (2,−1); degenerate rings are zero; square-zero multiplication gives the listed componentwise operations | None |
| §1.4 F, V and τ | n=1; Div(2); a=b=2; coprime indices | F₂(a,b)=a²+2b, V₂(a)=(0,a); FV=2; τ is multiplicative, not additive; gcd formula has the shifted truncations | None |
| §1.5 p-typical comparison | a=0; p=2,a=1; p=3,a=2; length zero | Length is a+1; final ghosts agree with the pinned carrier | None |
| §1.6 Witt étale base change | Empty S; S={1}; diagonal ℤ→ℤ×ℤ; a=1; coprime a,b | Empty pushout is zero; singleton recovers R; both product factors survive | Correct review locators retained |
| §1.7 Endomorphism Koszul bridge | r=0,1,2; M=0; noncommuting two-by-two integer operators; scalar operators | d² is the commutator; displayed noncommuting pair gives u₁e₁∧e₂; maps are induced from intertwining degree-zero maps | None |
| §1.8 Finite arithmetic fracture | N=1; M=ℤ,N=2; M=ℤ[1/p]; unbounded M | Finite localization/completion square has the listed vertices; completion alone does not detect M | Generic all-prime detection imported from its main owner |
| §2.1 Λ-coactions and Adams maps | ℤ; toric ℤ[T]; identity Adams maps on 𝔽₂ | ψ₂(2)=2; ψ₂(T)=T²; δ₂(2)=−1 excludes the torsion-ring Adams-only substitute | None |
| §2.2 Prime sets and free objects | P empty; P={2}; no free generators; one free generator | Empty P gives rings; singleton P gives infinite p-typical coalgebras; free object on no generators is ℤ; faithful-flat free Adams is not a permutation claim | None |
| §2.3 Arithmetic perfection | ℤ; toric ℤ[T]; stage m dividing n | Rational-exponent monomials invert all Adams operations; T has no ψ₂-preimage before perfection; stage map is ψ_(n/m) | None |
| §2.4 Perfect coverage | ℤ; zero ring; toric ℤ[T]; ℤ[ε]/ε² with ψ_n(ε)=nε | Monomial bases give faithful flatness; dual-number ψ₂ is not flat modulo 2; injective δ-Frobenius kills p-torsion as at bhatt-scholze line 778 | None |
| §2.5 Relative perfection | R=A with nonsurjective base Adams; ℤ[T]/ℤ; perfect R/ℤ | Linearization uses the right scalar factor; R=A is relatively perfect; toric T has no relative square-root | None |
| §3.1 Absolute FV systems | ℤ,q at level 2; zero nonunital ring; m=d | FV=2 and VF=1+q differ; identity level is retained | None |
| §3.2 Absolute q-Witt presentation | m=1,2; R=0; q=1 | Q₁=R; V₂(1)=1+q; q=1 specialization does not assert ordinary Witt equality | None |
| §3.3 Absolute ghosts | m=1,2; q=−1; ordinary restriction on V₂(1) | First ghost kills 1+q; q=1 reduction sends it to 2 and cannot model ordinary restriction | None |
| §3.4 V-resolution | m=1,6,2^a; nonunital inputs | Composite on Q₁→Q₃⊕Q₂→Q₆ vanishes with the deletion sign; absolute V is injective without coefficient torsion-freeness | None |
| §3.5 Localization and torsion | ℤ; 𝔽₂,m=2; m=1; fixed m and varying p | 𝔽₂'s nonzero V₂(1) has zero ghosts; the prime-specific hypotheses are necessary; bounds are not uniform in m | None |
| §3.6 Absolute completion | R=ℤ,m=2; m=1; m=n=2; d dividing n | Completion at zero acts as identity; unit-ideal completion is zero; cyclotomic p-power and mixed-prime cases differ | None |
| §3.7 Witt injectivity and exactness | R=0; m=1; R=𝔽₂,m=2; p-local prime power | Kernel rings need the nonunital theory; injectivity does not follow from ghosts on torsion rings | None |
| §4.1 Λ comparisons | ℤ,m=1,2; toric ℤ[T] | Perfect base comparisons are equivalences; toric c₂ misses T; c_ms_m=ψ_m | None |
| §4.2 Relative FV systems | R=A; R=0; toric A=R=ℤ[T] | F fixes right-hand T; ψ₂-semilinearity would send T to T² incorrectly | None |
| §4.3 Relative presentation | R=A; R=0; m=1; toric A[X],m=2 | The dual-number witness separates V₂(TX)⊗1 from V₂(X)⊗T before the additional relations; coefficients used in the half-coefficient map are even | None |
| §4.4 Relative ghosts | m=d=1,2; toric A=R; A=ℤ | a⊗1=1⊗ψ_m(a); toric T gives T², not T or T⁴ | None |
| §4.5 Relative base change and colimits | A′=A,0; polynomial R; toric T↦2 | The coefficient map T↦2 is not a Λ-map; arbitrary flatness is not imposed on Λ-base change | None |
| §4.6 Perfect-cover comparisons | R=A; toric ℤ[T]/ℤ; torsion R over ℤ | Relative perfection differs from perfect coverage; exactness includes torsion coefficients after the base hypothesis | None |
| §5.1 Étale preservation | Identity; m=1; ℤ→𝔽₂ | Tor₁ detects nonflatness of the quotient map; derived pushout uses étale flatness | None |
| §5.2 Ghost pushouts | m=d=1; R=A; ℤ→𝔽₂ at m=2 | Periodic q±1 resolution yields Tor₁=𝔽₂ after maps 2 and 0; ordinary pushout alone is insufficient | None |
| §5.3 Relative completion | A=ℤ; R=ℤ/4,m=1; R=A | Perfect coverage of A does not kill coefficient torsion; scalar extension is completed before descent | None |
| §5.4 Finite type | r=0,1; m=1,2; infinitely many variables | Rank-m base quotient and generators 1,T agree; infinite polynomial ring has a strict ideal chain | None |
| §6.1 Completed étale Frobenius | R=A; p invertible; ℤ×ℤ at p=2; ℤ[T] smooth | Zero completions are allowed; smooth coordinate Frobenius is not an equivalence modulo 2 | None |
| §6.2 Cyclotomic overlap and ideals | p=2,3,d=1; p dividing d; d=0; A=0; R=A | Radicals agree, ideals need not; d=0 gives the unit ideal; q and right scalars remain fixed | Parsing-independent signatures retained; radical theorem already covers d=0 |
| §6.3 Ghost Frobenius | m=p,d=1; A=R=ℤ,p=2 | Teichmüller paths give r^p; q-fixed deformation sends 1+h to 1+h, not 1+2h+h² | None |
| §7.1 Differential V systems | Level one exterior de Rham; characteristic 2 odd square; even generator quotient; ideal (T) | Strict odd alternation is additional to sign commutativity; (T) is not a differential ideal since dT survives | None |
| §7.2 Initial differential system | m=1; R=0; R=A; A[T] at characteristic 2 | Degree zero is Q_m; positive-degree relations preserve it; odd coordinate square vanishes | None |
| §7.3 Differential FV systems | m=d=1; m=2,3 on τ(T); mod 3 | dF_n=nF_nd; F₃(dτ(T)) remains T²dT mod 3 while dF₃τ(T) vanishes | None |
| §7.4 Prime V-differential identity | p=2; x=0; truncated q=1 de Rham system with degree-i V₂=2^(i+1) | γ₂ needs no inverse of 2; dV₂(T²)=4T dT; no positive-degree F is needed | None |
| §7.5 Positive-degree F | p=m=2 on τ(T), V₂(T), τ(T)²; m=1 | θ₂(V₂T)=dT; semilinear Leibniz gives 2T³dT rather than 2T²dT | None |
| §7.6 Differential ghosts | m=1,2; degrees zero and one | V₂ has coefficients 2 and 4 respectively; the scaled F law has n^i | None |
| §7.7 Differential base change | Identity; m=1; ℤ[T,T⁻¹]; noncentral associative square-zero DGA | d(T⁻¹)=−T⁻²dT; naive scalar tensor differential fails; étale-extension contract needs central degree zero | None |
| §8.1 Framed coordinate automorphisms | Polynomial T²; zero variables; zero ring; uncompleted A[T,q] | γ(T²)=(1+2h+h²)T²; h and regular coordinates permit cancellation; uncompleted q need not be a unit | None |
| §8.2 Jackson derivatives | 1,T²,T³; characteristic 2 at q=1; Laurent localization | D(T²)=(1+q)T; D(T⁻¹)=−q⁻¹T⁻²; frame is étale without being finite | None |
| §8.3 Framed complexes | Rank zero; T²; dT times T; h=0 | C and H have different specializations; skew multiplication gives dT·T=qT dT | None |
| §8.4 Framed Frobenius | p=2; rank zero; C versus H | φ(h)=2h+h²; H sends dT to T dT, while C needs factor 1+q; coefficient injectivity uses reduced mod-p base | None |
| §9.1 Frobenius decomposition | r=0,1; α=0,1; p=2; zero exponent | Basis 1,T corresponds to T dT,dT in degree one; zero exponent has no inverse T; scalar differential description follows quotient reduction | None |
| §9.2 Two-term cohomology | p=2,α=1,e=0; e=α; α=0; u prime to p | Kernel of h modulo h(h+2) is (h+2); complementary geometric factor is 1 at e=α; [u] has unit constant term; wrong ambient tensor gives extra Tor | Geometric sum named locally to repair parsing |
| §9.3 Framed Bocksteins | m=1,2; T,T²; rank zero | Positive sign gives β₁(T)=dT and β₂(T²)=T dT; quotient differential is distinct; regularity of q^m−1 follows from first coefficient m | None |
| §9.4 Product homotopy | Rank zero, one, two and three; closed YdX+XdY; degrees two and one | H(a dT,b dT)=−Tab dT; mixed-coordinate commutators are the listed nonzero boundaries; no coefficientwise invariance is inferred | None |
| §9.5 Framed cohomology system | m=1,2; zero variables; T versus T² | β₁ is the de Rham differential; T² is closed at m=2 but T is not; torsion-freeness forces odd squares to vanish | Correct §9.3 pointer retained |
| §9.6 Simultaneous induction | α=0; p=2 polynomial T dT; dV₂(T) | Induction uses the preceding exponent; both V and dV must be killed in the ghost quotient; quasi-isomorphism is not degreewise isomorphism | None |
| §9.7 Smooth de Rham comparison | R=0; m=1; p=2,m=6; p=3,m=2; A=R toric | The d=3 factor uses ψ₆; p=2 does not split q²−1 into comaximal factors; derived tensor is over C_α in the intermediate comparison | None |
| §10.1 Smooth integer torsion-freeness | R=A; m=1; ℤ[x]/x²; p=2 | Smooth differential powers are torsion-free; nonsmooth x dx is nonzero 2-torsion | None |
| §10.2 Difference torsion and completion | m=1; A=R=ℤ,m=2; mod 2 | h-torsion bound is 1 integrally and 2 mod 2 in degree zero; fixed degree/index bounds do not assert a uniform bound | None |
| Cyclotomic supplier contract | m=1,2,6; equal versus distinct indices; Φ₁ and Φ₂; Φ₁ and Φ₃ | m>1 and distinctness exclusions are essential; quotients at prime-power ratios have the listed mod-p coefficients | None |
| Ordinary de Rham supplier contract | Characteristic 2; arbitrary characteristic-p base; noncentral degree zero; Laurent localization | Strict alternation, relative Cartier twist and graded-commutative étale extension all remain explicit | None |
| Unbounded completion supplier contract | Zero complex; h=0 action; degree-dependent bounds; missing mod-p bound | Three separate term/cohomology/reduction conditions match wagner line 3198; no uniform degree bound was substituted | None |
| Prismatic Frobenius supplier contract | α=0; p=2; rank zero | Empty décalage product is the identity ideal; φ(q)=q^p and the C-frame convention agree | None |
| PD-presentation supplier contract | Identity presentation when available; zero algebra; polynomial smooth algebra | Comparison is multiplicative and functorial for δ-compatible presentation maps; it is a separate input from the framed comparison | None |
| DGA Bockstein supplier contract | f=1; f=0 on a nonzero term; f=ag; two-term d=f | Unit quotient is zero; zero is excluded by regularity; parameter change gives Fβ_fV=β_g with positive sign | None |
| DGA quotient supplier contract | Zero and unit differential ideals; de Rham ideal (T); odd square at p=2 | Stability under d is necessary; differential closure includes dT; quotient preserves imposed strict alternation | None |

## Remaining limitations and untrusted command text

The seven accepted supplier contracts remain the only unresolved mathematical inputs. Their implementations and exact eventual Part II section names are not supplied by this port. They remain explicit contracts rather than invented pinned declarations. No other unresolved build, gate, ownership or mathematical defect was found in this self-review.

Repository prose contains the command examples `lake exe cache get` and bare `lake build` in its Building sections. Those out-of-scope command passages were treated as data and were not executed. Likewise, review repair snippets were checked as claims; the brief's allowed build and gate commands governed execution. No credentials were read and no fetched code was executed.


Pull request: #1351 (roadmap/q-witt-vectors at 4605fbb)
