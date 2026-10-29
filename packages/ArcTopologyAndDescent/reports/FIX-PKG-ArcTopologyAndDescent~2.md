# ArcTopologyAndDescent repair report

## F01 (P2) — applied differently

Deligne and qcqs vocabulary in the gap → AdicEtaleGeometry §A1.15 and AdicSpacesPartII §R0.19.10. Narrowed the matching README/plan gap to coherence, coherent quotients and monic pushouts. The general supplier criterion uses finite coproducts; bounded-site disjoint unions combine these into one representable. Updated §§5.2–5.3, 5.5, 8.6 and layer dependencies. Evidence: BM21 lines 1381–1388, 1449–1469.

## F02 (P2) — applied

An entirely missing comparison → the normalized comparison and tilt analogue of ClassicalAdicEtaleCohomology §2.6. Narrowed the README/plan gap to integral-model, open-restriction and tilting compatibility. Updated §12.2, contracts and dependencies, with normalized, torsion and empty-generic-fibre Checks. Torsion removal is PerfectoidQuotients §0.4; the powerbounded model uses PerfectoidSpaces §§P1.20 and P1.25, rather than identifying p-root closure with powerbounded saturation.

## F03 (P2) — applied

Arbitrary characteristic-primary sheaf gap → constant-coefficient dévissage using SchemeAndStackFoundations §§2.11, 2.5 and 2.15. Deleted the gap from README and plan, updated §10.1 and dependencies, and removed its obsolete manifest citation. Added cyclic-power, unbounded-exponent and zero-dimensional nonreduced Checks. Evidence: BM21 line 2320; supplier §2.11's Artin–Schreier sequence and vanishing, §2.5's filtered cohomology comparison, §2.15's strict-local test.

## F04 (P2) — applied

Ultraproduct spectra as components of every quasi-compact open → ultraproduct spectra as ambient components, and their valuation localizations as open components. Updated §11.2's statement and route; added one-factor D(t), two-factor D((t,1)) and empty-spectrum Checks. Evidence: CS24 lines 774–797. Section 3.6 concerns the ambient spectrum and needs no correction.

## F05 (P2) — applied

Cancellation falsely imported from PrismaticCohomology §2.0 → locally owned lifting consequences in §§1.6, 2.5 and 2.7. Added §2.7 to §4.6's Needs and polynomial-stage cancellation Checks. On rings, cancellation retains A→B from A→B→C; on schemes, it retains the second arrow. Evidence: BM21 line 364; RYD10 lines 350–352, together with the lifting definition.

## F06 (P3) — applied

BS22 Remark 8.9 p. 68 → p. 67 in §§8.4, 11.3 and the manifest. Added direct aic-completion support from CS24 §2.2.1 p. 18 and corresponding manifest coverage. Evidence: BS22 lines 2590, 2610, 2630; CS24 lines 729–736. Other citations spanning Definition 8.7 through Proposition 8.10 correctly retain pp. 67–68.

## F07 (P3) — applied

Repeated v-to-arc and strict-henselianity targets → explicit use of PrismaticCohomology §2.0 and ClassicalAdicEtaleCohomology §6.1. Retained the noetherian/rank-one comparisons in §2.2 and closed-stalk/FinSet conclusions in §6.1. Updated the strict-henselian contract and Needs; §2.2's Needs already named PrismaticCohomology. Both supplier sections state exactly the imported assertions.

## F08 (P3) — applied

Non-strict outward extensions → q⊋p and r⊊q in §4.4. Added field, three-point-chain and infinite-chain Checks. On the last chain, intervals avoiding 0 together with [0,0] satisfy the non-strict conditions but omit [0,p₁]. Evidence: BM21 lines 1120–1127 and 519–526. The strict upward condition at 0 excludes this counterexample.

## F09 (P3) — applied

Milnor data attributed to GeneralAlgebraicKTheory → the elementary datum in Conventions. Removed its supplier contract and all Milnor-data Needs/dependency edges in §§2.3, 4.3, 5.5 and Layers 2, 4, 5. Retained K-theory ownership in Scope. Evidence: GeneralAlgebraicKTheory §§8.5–8.6 concern K₁/K₀ exactness; BM21 lines 390–405 use the ideal-isomorphism pullback without K-theory.

## F10 (P3) — applied

A shared Perf/reconstruction obstruction → separate explanations for perfect-complex descent, algebraic-space mapping descent and the effective-epimorphism criterion in the module docstring. The last requires the category of qcqs perfect F_p-schemes; Perf is a proof input. Evidence: BM21 lines 1875–1889. Pinned Mathlib has ring perfection, but no native perfect-scheme category; no substitute declaration was added.

## F11 (P3) — applied

Doubled/process wording → a direct statement of the extra kernel hypothesis in §4.1. Removed the duplicated approximation contract in §8.9. Split §10.0's torsion API into subobject/quotient/extension, étale-pullback and affine-basis bullets, retaining the same predicate and Checks. The local-lift/finite-cover explanation makes the quotient and extension assertions precise.

## F12 (P3) — applied

The CS24 locator embedded in BS22's locator → only BS22 locators under BS22. The existing CS24 Lemmas 2.2.3–2.2.4 locator already includes the displaced reference, so no duplicate was added. Corrected “Lemmas 8.8” to “Lemma 8.8”; synchronized the page correction of F06. Sources TOML parses with 14 distinct lifetime keys.

## Validation outcomes

- **Acceptance elaboration:** ran `lake env lean` on `packages/ArcTopologyAndDescent/Suggested.lean` from the content checkout at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Exit 0. Exactly four warnings, all `declaration uses sorry`, at lines 58, 76, 108 and 118. No errors. The individual Tau Ceti import's object file was available; no build was necessary. No Lean processes remain running.
- **Binder audit:** elaborated one scratch copy of the final module with `#check @name` for each of its nine declarations. Exit 0, the same four expected warnings, and all nine types printed. Compared each with README §§2.5, 2.7, 10.0 and 10.8. No dropped binder, no signature change and no new or deleted declaration. The four headline theorems remain admitted acceptance targets.
- **Signature details:** the affine criterion retains every valuation rank/domain and module binder; the spectral criterion retains qcqs source, target, morphism and every qcqs base change. Both affinoid theorems retain completeness, algebraic closedness, nontrivial ultrametric norm, dimension bound and the correct coefficient predicate. The sharper theorem retains primality and norm one. The presentation predicate intentionally does not require completeness of K; the theorems do.
- **Citation resolution:** exit 0 against content main `b41e47bc34e30def0db01d84cc92062ed72c6e68` and the index of 352 open heads. No missing cross-roadmap citations and no missing roadmap Lean names. The resolver explicitly did not check names outside TauCetiRoadmap because it did not discover the pinned Lake packages from the board path; library verification used the actual content pins directly.
- **Dependency direction:** ran the required `gate --depcheck` for this README with `--name ArcTopologyAndDescent --order merge-order/ORDER.txt --movable`. Exit 0. Its complete output was:

```text
depcheck: 48 roadmaps, 542 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was edited.

- **File and schema checks:** `git diff --check` exits 0. Sources TOML and plan JSON parse. The plan before and after is identical after deleting only the top-level `gaps` member from both objects; all other plan content is untouched. Every remaining gap has slug, needs, supplier and section, and exactly matching README needs text. All nine Lean declaration names occur in the README. No forbidden imports, options, admitted data or admitted examples were introduced.
- **Gate failure `tex=1`:** replaced the braced exponent in README §12.2 with parenthesized Unicode/plain-text notation, and synchronized the matching adversarial-pass row below. The mathematical example is unchanged. A whole-README scan finds zero TeX commands, math delimiters or braced superscripts/subscripts; `git diff --check` exits 0. Suggested.lean is unchanged from the successful elaboration and binder audit above. The citation lead about `sources.toml` was a filename, not a mathematical declaration; the final resolver has no missing-name lead.

## Source, library and ownership verification

The legally cached versions were used directly; no new source or duplicate source key was needed. HUB96 remains settled as uncertified and was not requested again. No unavailable new text blocks the repairs.

Changed supplier assertions were read in content main for SchemeAndStackFoundations §§2.5, 2.11 and 2.15, AdicEtaleGeometry §A1.15, AdicSpacesPartII §R0.19.10 and PerfectoidSpaces §§P1.20, P1.25 and P3.20; indexed open heads were read for ClassicalAdicEtaleCohomology §§2.6 and 6.1, PrismaticCohomology §2.0, PerfectoidQuotients §§0.4–0.5 and GeneralAlgebraicKTheory §§8.5–8.6. AdicEtaleGeometry and AdicSpacesPartII were also read as house-style examples before editing. The general topos gap is independent of this roadmap's arc-site construction; §5.2 applies it to the bounded site, avoiding a reverse supplier dependency.

At the pins, `Mathlib/RingTheory/Valuation/ValuationRing.lean:64` requires a domain; `Mathlib/Algebra/Group/Units/Hom.lean:270` makes locality reflect units; `Mathlib/RingTheory/KrullDimension/Basic.lean:30` gives the dimension upper bound. `Mathlib/Topology/Spectral/Basic.lean:38` includes T₀, compactness, quasi-sobriety and quasi-separatedness, while `Mathlib/Topology/Spectral/Hom.lean:42` preserves compact opens without reflecting openness. `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` defines H by Ext. `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:313` gives the coefficient algebra actually used by the presentation predicate. `Mathlib/FieldTheory/Perfect.lean:44` is a ring predicate; searches of both pinned algebraic-geometry trees found no perfect-scheme category. No claim of mathematical nondefinability is made by the docstring's carrier inventory.

Object searches used `roadmaps grep` over main and the accessible indexed open heads, plus local board-package searches: scheme arc topology, arc sheaves, universal spectral submersions, Milnor excision and affinoid Artin–Grothendieck vanishing. The supplied primitive cover predicates and the newly cited foundational results retain their owners. The cancellation consequences and BM21 Props. 2.11, 2.19 and Thm. 7.3 remain here. Banach arc-topology in MotivesAndAlgebraicCyclesPartII is a different object. An exact search for all nine acceptance names in main/open Suggested.lean files returned no match. Ownership against separately supplied sibling pull-request checkouts was not checked: the brief names siblings but provides no separate checkout paths; indexed head searches were used instead.

## Adversarial mathematics pass

Each row records an explicit computation, including the repaired statements and their consumers. Boundary tests remain prose in the README; none was added as Lean padding. For RΓ values, a module written without a shift is in degree zero.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Valuation extension convention | V→V; V→Frac V; V→V/m, V nonfield | identity injective/local; t≠0 nonunit becomes a unit in Frac V; nonzero m maps to 0 in V/m | both injectivity and locality are necessary | none |
| Rank convention | field; nonfield rank-one V | spectra have 1 and 2 points, dimensions 0 and 1 | fields are allowed tests | none |
| Milnor datum, Conventions | node A=k[x,y]/(xy); I=(x) | B=k[x], J=(x), A/I=k[y], B/J=k; B×_k k[y]=A | ideal-isomorphism pullback, without Tor-independence | F09 ownership |
| Cohomological shift | Z[−1] | H¹=Z; H⁰=0 | shift direction fixed | none |
| Constructible versus finite Tor | Λ=Z/4, M=Z/2 | tensoring the periodic ·2 resolution gives zero differentials and Tor_i=Z/2 for every i≥0 | bounded constructibility does not imply finite Tor dimension | none |
| Bounded-site convention | terminal Spec R; empty scheme; two affine charts | sizes ≤max(|R|,ℵ₀)<κ; empty family covers only ∅; finite tensor products remain <κ | finite limits and finite covers apply | F01 Check |
| Residue norm convention | C₂, C₃; prime ℓ≠p | norms of p are 1/2, 1/3; other prime norms are 1 | sharper bound excludes residue-primary coefficients | none |
| §0.1 aic ring | Q; k×k with k algebraically closed; 0 | T²−2 has 0 rational roots; monic roots are coordinatewise; positive-degree obligation in 0 is vacuous | determines the intended ring predicate | none |
| §0.3 bounded aic subring | A=Q̄ inside aic V | generated algebraic field has cardinal ℵ₀; its valuation intersection has size ≤ℵ₀=max(|A|,ℵ₀) | bound is on the subring | none |
| §0.4 finite-rank approximation | lex valuation of k(x,y), k algebraically closed | restriction to k(x) has rank 1; to k(x,y) rank 2 | no common rank-one bound | none |
| §0.5 prime square | v(y)=(1,0), v(x)=(0,1); p=0 | v(y/xⁿ)=(1,−n)>0; y/xⁿ∈p; at p=0 the quotient is V and an edge is identity | localization and quotient directions agree | none |
| §0.6 interval rings | [p,p], [0,p], [p,m] in a three-point spectrum | κ(p), V_p, V/p; restriction maps go from V to the interval rings | endpoint convention fixed | none |
| §0.7 smooth approximation | k; k[t]_(t); k[ε]/ε² | Ω¹=0; Ω¹=Vdt; ε²=0 with ε≠0 prevents a reduced filtered smooth colimit | domain/characteristic-zero setting respected | none |
| §1.1 universal descent | identity, F=Z[0] | whole totalization is Z[0]; two-arrow homotopy equalizer is Z[0]⊕Z[−1], with H¹=Z | full nerve required | none |
| §1.3 abstract blowup datum | Z=X,Y=∅; Z=∅ | covers are id_X and Y≅X respectively; exceptional object empty | Y need not surject by itself | none |
| §1.4 blowup criterion | Bl₀(A²), Z={0} | exceptional fibre P¹; Y×_X Y is covered by its diagonal and E×_Z E | square encodes cover descent | none |
| §1.5 perfect-scheme restriction | perfect rank-two split | generic and closed points cannot lift together to either component, while perfect representables satisfy its effective descent | canonical topology is finer than v | none |
| §1.6 v cancellation | A→A[x₁,…,x_n]→A[x₁,x₂,…] | all variables map to 0 in V; restricting that lift still has W=V and unchanged A-map | correct retained scheme arrow | F05 |
| §1.6 approximation | A≠0, infinitely many variables | x_(n+1) is absent from every n-variable stage; all finite stages have valuation lifts | no finite-presentation assumption on B | F05 Check |
| §1.7 subtrusiveness | rank-two split | 0 and m have separate preimages; comparable lift of 0⇝m has count 0 | arc does not imply v | none |
| §2.2 comparison | three-point rank-two split; identity Spec k | split passes rank-one intervals but fails identity rank-two test; identity over the noetherian point has W=V and satisfies both tests | primitive v⇒arc is the supplier's | F07 |
| §2.3 Milnor arc cover | I=0; I=A | first cover has identity Spec A summand; second forces B=A and has identity summand | degenerate squares pass | F09 |
| §2.4 specialization criterion | Spec Frac V→Spec V, rank one | closed fibre empty; lifted generic-to-closed pair count 0 | not a cover | none |
| IsRingArcCover | id_A; k→0; 0→0; dual numbers→k | W=V,e=id; no map 0→W for a domain; no test 0→V; ε maps to 0 | true, false, true, true respectively | none |
| §2.5 ring cancellation | A→B→C, lift b_C:C→W | restricted lift b_C∘(B→C) composes with A→B to the original A→W | retains A→B | F05 |
| arc_affine_purity | id_V; V→Frac V; k→0; 0→0 | identity sends [1] to [1]; V/(t) tensors to 0 so [1]↦0; k tensors to 0; no valuation tests for 0 | both sides true, false, false, true | none |
| IsSchemeArcCover | id; generic-only inclusion | W=V gives identity square; a lift of the closed point through Frac V would invert t | true versus false | none |
| §2.7 scheme cancellation | Y→Z→X and a valuation lift to Y | projection to Z uses the same e:V→W and satisfies g∘f∘b=a∘Spec(e) | retains Z→X | F05 |
| arc_spectral_characterization | rank-two split; generic inclusion; ∅→∅ | split has exactly 4 open-inverse-image subsets among 8, namely ∅,{0},{0,p},{0,p,m}; {m} has empty inverse image under generic inclusion; empty identity is surjective | both directions survive tests | none |
| §2.7 limits | BM21 infinite chain | f⁻¹({0}) is βN minus N, closed but not open; compact opens still descend | spectral reflection does not imply quotientness | none |
| §3.1 cotruncation | finite sets; all spaces | maps from a finite set are 0-truncated; Map(*,K(Z,n)) has π_n=Z for arbitrarily large n | all spaces fail a fixed bound | none |
| §3.2 finitary functor | terminal; infinitely generated affine representable | value is a point; identity needs x_(n+1) outside each finite stage | one passes, the other fails | none |
| §3.3 filtered totalizations | constant cosimplicial finite sets | Tot of constant {0,1} is {0,1}; filtered union of finite constant subsets has the same totalization as its union | finite truncation route consistent | none |
| §3.4 h-to-v | constant Λ on algebraically closed Spec k, identity | both cohomologies are Λ in degree 0 and 0 above | cohomological continuity input retained | none |
| §3.5 detecting families | identity; empty family for affine-line sections | identity pullback changes nothing; empty cover comparison k→one point is nonbijective but has zero tests | empty family is not detecting | none |
| §3.6 ultraproduct components | one factor; two factors | fibres are Spec V and Spec V₁,Spec V₂; ultrafilter counts 1 and 2 | assertion concerns ambient components | F04 pattern audit |
| §3.7 rank-one obstruction | rank-two valuation centred on k[x,y] | a local injective map would require a surjection from ≤2 primes onto 3 primes | impossible | none |
| §3.8 Boolean sheaf | I empty; I={1,2} | F(0)=terminal; sections F(A₁)×F(A₂), with exactly two stalks | product convention fixed | none |
| §3.9 ultraproduct detection | I={1,2} | both ultrafilters principal; two projections recover F(A₁)×F(A₂) | finite test agrees with Boolean description | none |
| §3.10 aic v detection | A algebraically closed field | one identity aic factor suffices; sections and their descent comparison are unchanged | nonempty identity test | none |
| §4.1 largest prime | field V⊂W a positive-rank aic valuation, p=0 | pW=0; largest prime over 0 is m_W; W⊗_V V=W_(m_W)=W | largest prime is not always pW | F11 wording only |
| §4.2 persistence | constant finitely presented identity diagram | B_i=A_i and every base change is id; stage j=i already covers | cartesian transition hypothesis retained | none |
| §4.3 excision | node base change to k[y] and k[x] | pullbacks are k[y]×_k k=k[y] and k×_k k[x]=k[x] | no K-theory supplier needed | F09 |
| §4.4 interval induction | field; {0,p,m} | [0,0] initial; strict end intervals overlap at p and have union [0,m] | boundary cases included | F08 |
| §4.4 strictness | {0}∪{p_n}, P avoids 0 except [0,0] | singleton extensions satisfy non-strict tests; [0,p₁]∉P; strict upward extension at 0 has no witness | old wording false | F08 strict inequalities |
| §4.5 kernel-below-prime case | s∈ker f minus p | s becomes a unit in V_p but maps to 0; W⊗V_p=W⊗κ(p)=0; pW=0 | surviving square is W→W over 0→0 | none |
| §4.6 criterion | terminal functor; constant Λ étale cohomology on aic prime square | terminal comparisons are identities; Λ→Λ×_ΛΛ=Λ | excision/descent agree in both tests | F05/F09 Needs |
| §4.7 rank-one detection | terminal natural transformation; (−1)-truncated values | all component maps id; a (−1)-truncated value is ∅ or a point, distinguished by existence of one section | bounded truncation clause matters | none |
| §5.1 site | Spec Q and all Spec Z_(p) over Spec Z | any finite subfamily misses some test Z→F_q | infinitely many lifts do not constitute a finite cover | none |
| §5.2 coherent quotient | X=X₁⊔X₂ | h_X^#=h_(X₁)^#⊔h_(X₂)^#; the single X combines two cover objects | generic criterion must allow finite coproducts | F01 |
| §5.2 enough points | bounded site | terminal and finite fibre products stay <κ; finite covering subfamily exists by definition | supplied coherent-site theorem applies | F01 |
| §5.2 monic pushout | A={a}⊂B={a,b}, A→C={c} | D={b,c}; relation sizes B×_D B=2, B×_D C=1, C×_D C=1; A=∅ gives disjoint union | pointwise pushout convention correct | F01 |
| §5.3 source compactness | infinite Q,Z_(p) family | every bounded valuation lifts somewhere but no finite subfamily does | cannot discard quasi-compact source | F01 supplier citation |
| §5.4 cutoffs | X=Spec k of size <κ<κ′ | inverse image of h_X^# is h_X^#; identity map stays identity | comparison is directional, not an equivalence claim | none |
| §5.5 unrestricted Milnor pushout | I=0; I=A | identity side makes the sheaf pushout h_A^# in each case | excision comparison is identity | F01/F09 Needs |
| §5.6 non-subcanonicity | k[ε]/ε²→k, affine-line representable | sections k[ε]/ε²→k kill nonzero ε; Čech equalizer is k | unsheafified representable fails | none |
| §6.1 strict henselianity | aic V; Z_p | aic residue field algebraically closed; Z_p has residue F_p, and T²+T+1 over F₂ has no root | existing supplier input has necessary field hypothesis | F07 |
| §6.1 closed stalk and finite étale objects | algebraically closed field k; two-sheet cover V⊔V | RΓ(k,Z/ℓ)=Z/ℓ[0]; cover corresponds to a two-element set | retained targets agree with supplier input | F07 |
| §6.2 stalk descent | identity map over strict henselization | whole augmented comparison is id and its stalk comparison id | universal formulation stable in this test | none |
| §6.5 étale objects | rank 0; rank 1; fold | one vertex; closed-to-generic map {a,b}→{*} is noninjective and excluded by separated representability; fold {1,2}→{*} is a natural transformation | object injections do not constrain all morphisms | none |
| §6.6 categorical arc descent | prime split over rank-one V | one interval piece is the whole spectrum and matching over κ(m) is identity | categorical pullback recovers original category | none |
| §7.3 constructible chain | rank 0; rank 1; Z/4 coefficients | one derived stalk; two stalks with closed-to-generic map; Z/2 has Tor_i=Z/2 | no implicit finite Tor bound | none |
| §7.4 h-forms | k; k[t]; dual numbers | F₀(k)=k; F₁(k[t])=k[t]dt; F₀(k[ε]/ε²)=k | h-sheafification differs from naive forms | none |
| §7.5 smooth comparison | affine line over characteristic-zero k | Ω¹=k[t]dt and H^q_Zar=0 for q>0 | derived value is that module in degree 0 | none |
| §7.6 differential splitting | aic valuation, x∈p | choose y with y²=x; prime property gives y∈p, so x∈p² and p=p² | idempotent-prime input computed | none |
| §7.7 Perf arc descent | p=0 or p=m in valuation square | one ring map is identity; matching Perf pullback is Perf(V) | Tor-amplitude structure retained | none |
| §7.8 effective epimorphisms | identity perfect scheme; empty map to Spec F_p | identity is effective; empty map is not epi since its maps to A¹ cannot distinguish 0 and 1 | criterion statement uses schemes, not Perf | F10 docstring |
| §8.1 formal datum | I=0; I=A; Z→Z_p, I=(p) | first forces A≅B; unit quotients are all 0; finite quotients both Z/pⁿ | full quotient and open data retained | none |
| §8.4 completion | t a unit; complete rank-one V; aic V | unit completion 0; complete V unchanged; completed algebraically closed fraction field remains algebraically closed | exclusions and aic conclusion consistent | F06 citation |
| §8.5 completion/open cover | lex rank two, f=x | y∈xⁿV for every n; y maps to 0 in completion; open inverts nonunit x | not a v-cover, while rank-one tests pass | none |
| §8.6 formal glueing | I=0; I=A | identity completion square; identity open square | coherent pushout supplies unchanged boundary values | F01 Needs |
| §8.7 rigidity | ring functor Z_p→F_p | kernel pZ_p≠0, hence map not an equivalence | arbitrary ring functor is not henselian-rigid | none |
| §8.8 henselian comparison | strictly henselian complete V, nonunit t and constant Λ | both V and V/t give Λ in degree 0; higher groups 0 | whole affine comparison consistent | none |
| §8.9 open/support comparison | complete A; empty support Z | completion map id_A; RΓ_empty=0 on both sides | no regularity weakened by duplicate removal | F11 citation list |
| §9.1 arc_t | t unit; V→V[1/t], t nonzero nonunit | no tests in first case; identity V test would force t unit in second | every map versus failed cover | none |
| §9.2 Tate rank-one points | identity Tate pair | identity on rank-one points and Berkovich spectrum | both surjective | none |
| §9.3 arc_t equivalence | Z_p[x]/(px)→Z_p | every map to a p-torsion-free valuation sends x to 0 | precomposition bijective | none |
| §9.4 E_t | complete aic V; t=0; t unit | Λ[0]; localized zero ring; completion zero ring | values Λ,0,0 | none |
| §9.5 hyperdescent | identity hypercover of complete aic V | every nerve value Λ[0], totalization Λ[0] | augmented comparison id | none |
| §9.7 uniform integral denominator | Z_p, x=p⁻¹ | v(p^c xⁿ)=c−n; negative for n=c+1 | no uniform c, so x excluded | none |
| §9.8 invariance | remove px=0 torsion as in §9.3 | complete valuation maps force x=0; E_p is unchanged by descent | cover plus unique lifting is essential | none |
| §9.9 universal homeomorphism | purely inseparable k→k^(1/p); nilthickening | diagonal is a surjective nilimmersion; étale descent identifies the same value | no separability hypothesis introduced | none |
| §9.10 total-closure excision | integral t-regular map | if t^c bⁿ∈A, then tⁿbⁿ∈t^(n−c)A for n≥c | high powers of tb lie in tA; special kernel elementwise nil | none |
| HasAffinoidPresentation | n=0; A=0; K⟨T⟩/(T²) | Tate algebra T₀=K; K→0 surjective; T² quotient has nonzero square-zero T | no positive-rank or reducedness restriction | none |
| IsTorsionEtaleSheaf | Z/6; Z; ⊕_r Z/ℓ^r | 6x=0; n·1=n≠0; finite-support section killed by ℓ^max(r) | sectionwise exponent, not global bound | F11 formatting |
| Torsion API: subobjects | Z/2⊂Z/4 | image element 2 killed by 2 | torsion passes to subobjects | F11 bullet |
| Torsion API: quotients | Z/4→Z/2 | quotient section 1 killed by 2 | local lifting combines finite annihilators | F11 bullet |
| Torsion API: extensions | 0→Z/2→Z/4→Z/2→0 | end exponents 2; middle exponent 4=2·2 | multiplicative annihilator suffices | F11 bullet |
| Torsion API: étale pullback | two-point scheme→one-point scheme | constant Z/6 pulls back to two Z/6 stalks, both killed by 6 | restriction preserves condition | F11 bullet |
| Torsion API: affine-basis detection | two affine pieces with annihilators 2 and 3 | product 6 annihilates restrictions, hence the glued section | finite cover essential | F11 bullet |
| IsPrimePowerTorsionEtaleSheaf | ℓ=0,1; Z/r for prime r≠ℓ | 0¹x=0; 1ⁿx=x; ℓⁿ·1 is nonzero modulo r | prime and residue hypotheses not hidden in definition | none |
| §10.1 coefficient dévissage | r=1,2,3 | Z/p, Z/p², Z/p³ have H^q=0 for q≥2 by the coefficient exact sequences | constant-coefficient input suffices | F03 |
| §10.1 dimensions | char K=p; n=1 and n=0 | q>1 means q≥2; K[ε]/ε² is artinian strictly local, so H^q=0 for q≥1 | both dimension bounds correct | F03 Checks |
| §10.1 unbounded coefficients | Λ=⊕_(r≥1) Z/p^r | each finite subgroup has zero H^q in the range; filtered colimit of those zero groups is 0 | no common exponent required | F03 Check |
| §10.1 rational generators | (X,1) at X=0 | max(0,1)=1, min(0,1)=0 | maximum supplies nonzero bound | recomputed |
| §10.2 rational square | f=1,g=0 | first rational piece R⟨1/0⟩=0, second R⟨0/1⟩=R, overlap 0 | square reduces to identity on RΓ(R) | none |
| §10.3 tube transition | r=0,1; U_r↦πU_(r+1) | πʳ·πU_(r+1)=f; equations U₀=f and πU₁=f; intersection πʳV=0 gives f=U_r=0 | direction and shrinking values agree | none |
| §10.5 valuation Künneth | two complete aic V tests with prime ℓ invertible in residue | E_π(V)=F_ℓ; F_ℓ⊗F_ℓ=F_ℓ | monoidal unit agrees | none |
| §10.6 affinoid Künneth | A=B=K | K completed-tensor_K K=K; F_ℓ⊗F_ℓ=F_ℓ | target tensor convention agrees | none |
| §10.7 dimension contradiction | d=0,1,2 | 2d+2=2,4,6 exceeds 2d+1=1,3,5 | Künneth contradiction in asserted vanishing range | none |
| affinoid_artin_grothendieck | A=K,d=0; A=0; A=K×K | H^q=0 for q≥1, hence q>1; all groups 0; H⁰=(Z/ℓ)² | arbitrary torsion headline includes nonconnected/zero algebras | none |
| affinoid_artin_grothendieck_prime_to_residue | C₂,ℓ=2; C₃,ℓ=3; char K=p,ℓ=p | norms 1/2,1/3,0 are all ≠1 | sharper headline excludes these coefficients | none |
| §10.8 trace reduction | S₃,ℓ=2,3; cyclic C_ℓ | indices 3≡1 mod2 and 2 with inverse 2 mod3; (g−1)^ℓ=0 | nonabelian and cyclic cases agree | none |
| §11.1 complete covers | I=0; I=A; Z_p→Q_p | all valuations complete; no nonzero separated complete test; p nonunit would become unit | ordinary arc, vacuous condition, failed cover | none |
| §11.2 product completeness | I=(f₁,…,f_r), product of complete factors | quotient by Iⁿ commutes with product because Iⁿ has finitely many generators; inverse limit gives the original product | finite-ideal hypothesis used | none |
| §11.2 ambient components | single rank-one V | ambient component Spec V has 2 points | ultraproduct formula applies to the ambient spectrum | F04 |
| §11.2 open components | D(t) in that V | V[1/t]=Frac V=V_(0); component has 1 point, not 2 | previous open-component clause false | F04 localization |
| §11.2 two factors | D((t,1))⊂Spec(V₁×V₂) | components Spec Frac V₁ and Spec V₂ | only first ambient component localizes | F04 Check |
| §11.2 empty product and étale splitting | empty product; algebraically closed field | ring 0, spectrum ∅, zero components, unique empty section; finite étale field covers are disjoint unions of points | nonemptiness not silently required | F04 Check |
| §11.3 formal comparison | p-complete field K; dual numbers over F_p | p=0 in K; K embeds in completed algebraic closure of K((s)); ε maps to 0 in every valuation test | rank-zero tests are recovered, nilpotents undetected | none |
| §11.4 punctured boundary | I=0; I=A; I=(x,y) | R/I=R; unit-ideal opens cover; (0,1),(1,0) lie in union D(x)∪D(y) and neither in D(xy) | union and all generators required | none |
| §11.5 completed/punctured descent | I=0; I=A; complete henselian V | whole completion R, puncture ∅; completion 0, puncture ∅; RΓ(V)=RΓ(V/I) | zero/unit cases consistent | none |
| §12.2 normalized comparison | A=completed Z_p[p^(1/p^∞)] | A[p^∞]=0; R=A; generic ring unchanged | existing §2.6 applies directly | F02 |
| §12.2 torsion removal | A=F_p×O_(C_p) | A[p^∞]=F_p×0; A_tf=O_(C_p); A[1/p]=C_p | normalized comparison uses same generic ring | F02 Check |
| §12.2 empty generic fibre | A perfect characteristic p, including 0 | A[1/p]=0; scheme and adic generic fibres ∅; H^q=0 for every q | Tate normalization invoked only when nonempty | F02 Check |
| §12.2 aic local degree zero | one complete aic rank-one V | generic field algebraically closed; H⁰=Z/p^n and H^q=0 for q>0 | local cohomology concentration unchanged | F04/F02 consumer |
| §12.4 formal maps | affine target Spf Z_p, source Spf F_p | continuous structural map Z_p→F_p is unique | set-valued descent and multiplicative units agree | none |
| §12.5 proper henselian comparison | X=Spec A for strictly henselian complete local A | both A and its residue field have RΓ(−,Λ)=Λ[0] | proper identity test works | none |
| §12.6 tilt cover comparison | identity perfectoid A; ϖ=0 in perfect characteristic p | identity remains identity on A♭; 0-adic completeness gives ordinary arc tests on both | iff works in boundary case | none |
| §12.7 integral/tilt/Witt hyperdescent | identity hypercover of perfect k of characteristic p | A=k, A♭=k, A_inf=W(k); three constant totalizations are k,k,W(k); ξ=p | all three augmentations identities | none |
| §12.7 excluded nilpotent ring | F_p[ε]/ε² | Frobenius sends ε to 0, not onto ε, so ring is not perfectoid | formal cover does not extend structure acyclicity outside Perfd | none |

## Maintainer consequences

Five supplier gaps remain. The coherent-topos and perfectoid-comparison gaps have strictly narrower needs; the characteristic-primary gap is gone. Their completion is a supplier responsibility, not a claim that this package edited another roadmap. The remaining three gaps are unchanged.

No acceptance theorem or definition was renamed, removed or added, and no consumer name needs migration. GeneralAlgebraicKTheory is no longer an input for elementary Milnor data. Metadata is unchanged. Only README.md, Suggested.lean, sources.toml and the plan's top-level gaps list were edited, together with this requested report; there is no commit, push, issue or pull-request write.
