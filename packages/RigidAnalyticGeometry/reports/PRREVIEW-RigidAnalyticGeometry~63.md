# Review of RigidAnalyticGeometry (pull request #1807 at f58ded6)

**Verdict:** needs changes

## R01 (P2) — Gerritzen–Grauert for locally closed immersions has two owners

**Location:** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 1306–1309 (§4.3): "Prove the Gerritzen–Grauert theorem: for a locally closed immersion `φ` there are finitely many rational subdomains `X₁,…,X_r` covering `Sp A` such that every restriction `φ⁻¹(Xᵢ)→Xᵢ` is a Runge immersion"; with it lines 1282–1304 (the Runge predicate, its density criterion, composition and restriction).

**Claim:** §4.3 states as its own targets the Runge-immersion predicate, its stability laws, the dense-image criterion and the immersion form of Gerritzen–Grauert. AdicSpacesPartIV, on main and unchanged by this pull request, states the same four and declares itself the owner. Main's §§3–4 of this roadmap had no Runge immersions, so the overlap is new at this head.

**Witness:** `TauCetiRoadmap/AdicSpacesPartIV/README.md` lines 4148–4161 (F1.6, *rigid-locally-closed-immersion-runge*, BGR 7.3.5/1): "Construct the Runge-immersion predicate … Part IV owns this Runge theorem". Same file line 4177 derives *gerritzen-grauert* from it.

**Repair:** This roadmap is the owner: §4.3's finite-union headline and §5.1 need the theorem, and Part IV consumes this roadmap. (1) Add to **Scope and ownership**: "§4.3 owns the Runge-immersion predicate, its dense-image criterion and stability laws, and the Gerritzen–Grauert theorem for locally closed immersions; AdicSpacesPartIV F1.6 *rigid-locally-closed-immersion-runge* cites §4.3 for them." (2) Add F1.6 to the AdicSpacesPartIV bullet of **Downstream consumers**. (3) Either add `TauCetiRoadmap/AdicSpacesPartIV/` to this pull request, replacing the statement of F1.6 lines 4148–4161 and the sentence "Part IV owns this Runge theorem" by a citation of §4.3, or name F1.6 in the description's list of roadmaps on main that are to cite this pull request.

## R02 (P3) — the description does not say that main's `Suggested.lean` is replaced

**Location:** pull-request description, RigidAnalyticGeometry paragraph: "Its Suggested.lean states twelve headlines, among them finite-union Gerritzen–Grauert, and names immersion Gerritzen–Grauert, rigid spaces, properness, the identity principle, analytification, the rigid–adic equivalence and quantifier elimination as not statable."

**Claim:** A reader is not told that all 33 declarations of main's file are removed, nor that the README is rewritten (855 lines on main, 2360 at the head). The paragraphs for the other folders give these counts ("drops 34 of 66", "rewritten in the house shape").

**Witness:** the worker's diff against `origin/main`: 33 declarations removed, 12 added, 0 restated; removed names include `IsAffinoidAlgebra`, `supSeminorm`, `banachFunctionAlgebra`, `IsSlopeDecomposition`, `IsPresentationRing`, `stable_filtration_cofinal`.

**Repair:** Replace the sentence's opening by: "RigidAnalyticGeometry is rewritten in the house shape. Its Suggested.lean replaces all 33 declarations of main's file (definitions and theorems now pinned in Tau Ceti, and the presentation-ring and filtration statements that moved with §§7.1–7.5 to AdicSpacesPartIII) by twelve headlines, among them …", after checking each of the 33 against that description.

## R03 (P3) — page locators into [Conrad] do not say which pagination they use

**Location:** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 2309–2312: "**[Conrad]** B. Conrad, *Irreducible components of rigid spaces*, Ann. Inst. Fourier 49 (1999), 473–541, especially §1.1 with Theorems 1.1.1 and 1.1.3, Lemma 2.1.4, Lemma 2.1.5, §3.1 and Appendix A."

**Claim:** The README cites [Conrad] by pages 3–7 and 12–13 (lines 631, 646, 715, 799, 1336, 1579, 1893). The entry gives the journal pages 473–541 and, unlike the [Bosch] and [FK] entries, does not say that the page numbers are those of the linked author text.

**Witness:** Conrad line 193 and line 201: Theorem 1.1.3 is on page 5 of the 38-page author text; no journal page is 5.

**Repair:** Append to the entry: "Page numbers are those of the author text, pp. 1–38."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Tate package (Checks) | `(X₁+ϖX₂)²`; `p+T²` over `ℚ_p`; `p+T+pT²`; `n=0` | coefficients `1`, `2ϖ`, `ϖ²`, Gauss norm 1; sup 1 at `T=1`, `|p|` at 0; reduction `T`; `T₀=K` | agree | none |
| §0.2 weak stability, `isWeaklyStable_gaussFractionField` | `n=0`; char `p`, `S=T^(1/p)`; char 0 | `n=0`: the field is `K`, complete, pinned case; `K⟨T⟩[S]=⊕_{r<p}S^r K⟨S^p⟩=K⟨S⟩`, rank `p`; char 0 perfect | true; pin has only the perfect and complete cases | none |
| §1.2 `isJapanese_of_isAffinoidAlgebra` | field `ℚ_p⟨T⟩/(T²−p)`; `K⟨T⟩×K` | field: Japanese by pinned `of_field`; product is no domain, excluded by `[IsDomain A]` | true | none |
| §1.2 J-2 criterion (a) | `R=0`; Stacks 07PC (4)⇒(1) | `R=0`: `B=0`, regular locus `∅`, open; Stacks line 5651 matches the cited implication | true | none |
| §1.2 G-ring criterion (b) | `K⟨T⟩` at `(T)`; dimension one; Stacks 00PB ring | only prime over 0 is `(0)`, `K((T))`; input ⇔ `Â_𝔯` reduced; `k⟦x⟧[y]/((y−b)^p)` nonreduced | criterion and negative control hold | none |
| §1.2 `isGRing_of_isAffinoidAlgebra`, `isOpen_regularLocus_of_finiteType` | `A=K`; `A=0`; cusp; `K⟨T⟩×K` | field: G-ring; `A=0`: `B=0`, locus `∅`; cusp locus = complement of `(X,Y)`, Jacobian `(−3X²,2Y)` | true; Kiehl-AR Theorem 3.3 at p. 94 | none |
| §1.4 fraction algebras (Checks) | `A⟨T/ϖ⟩`; `A⟨ϖ/T⟩`; `g=1,f=T/ϖ`; iteration | `K⟨T,S⟩/(ϖS−T)≅K⟨S⟩`; `T⁻¹=U/ϖ`; disc `|T|≤|ϖ|`; `T↦ϖ²R`, disc `|T|≤|ϖ|²` | agree | none |
| §2.2 `exists_norm_le_mul_supSeminorm` | `A=0`; `K⟨T⟩/(T²)`; annulus `K⟨X,Y⟩/(XY−c)` | `A=0`: `0≤C·0`; dual numbers: `‖T‖=1`, sup 0, excluded by `IsReduced`; annulus `|XY|sup=|c|<1` | true; reverse bound pinned | none |
| §2.3 reduction and presentation rings | `ℚ_p⟨T,S⟩/(S²−p²T)`; `ℤ_p/p²` | `(S/p)²=T`, `S/p∉B`, `B/pB=𝔽_p[T,S]/(S²)`; `B=A°` with `B/p²` nonreduced | agree; FK line 10033 is B.1.3(1), printed p. 236 | none |
| §3.1 affinoid spaces (Checks) | `Sp 0`; `K⟨T⟩/(T²)`; `K⟨T⟩×K` | no points; one point, `dim_K=2`; idempotents `(1,0)`,`(0,1)` | agree | none |
| §4.2 stalks | origin of disc; `Σϖ^(−n)T^(n!)`; cusp | `A_𝔪/𝔪ⁿ=K[T]/(Tⁿ)`; norm on `|T|=r` is `sup|ϖ|^(−n)r^(n!)→∞`; completion `K⟦t²,t³⟧` | agree; Bosch §4.1 Props 1, 2, 6 at lines 2549, 2568, 2634 | none |
| §4.3 immersions, Gerritzen–Grauert, refinement, Kisin | cusp normalisation; `K→K×K`; annulus; covers by `ϖ²,T` and by `ϖ,T`; `I=(T)` | image in `K+t²𝒪`; products `ϖT,ϖ²,T²` give circle, disc, annulus; `Ỹₙ` decrease to `V(I)` | true; Bosch Theorem 10 line 2924, Cor. 12 line 2938, Lemma 4 line 3256 | R01 |
| §4.3 `exists_eq_iUnion_rationalDomain` | `A=0`; `U=∅`; `U=Sp A`; annulus; `g=T`, no numerators | `n=0` in the first two; `g=1`; `R(ϖ/T)`, `(T,ϖ)=A`; punctured disc excluded by the span clause | true | none |
| §5.1 `isSheaf_affinoidSubdomain_presheaf`, `exactAt_cechComplex_of_cover` | Laurent cover; one-member cover; `ι=∅`; `A=0` | `0→K⟨T⟩→K⟨T/ϖ⟩×K⟨ϖ/T⟩→K⟨T/ϖ,ϖ/T⟩→0`; ordered complex `A,A,…` with `0,1,0,…`; `ι=∅` forces `A=0` | true for `n≥1`; `H⁰=A` | none |
| §5.2 Čech complexes of modules | `M=K⟨T⟩/(T)` on the Laurent cover; `M=0`; `⊕_ℕ A` | `0→K→K→0→0`, exact; flat terms keep bounded exactness | agree | none |
| §5.3 `isGRing_stalk`, `isUniversallyCatenary_stalk` | cusp; `K⟨X,Y,Z⟩/(XY,XZ)`; node `y²=x²(x+1)` | generic formal fibre `K((t))`; `(XY,XZ)=(X)∩(Y,Z)`, chains 2 and 1; `x+1` prime in `K⟨x⟩`, `A` a domain | true; Conrad line 201 is Theorem 1.1.3 | none |
| §6.1 G-sites (Checks) | `ℕ` with finite covers; two-point space; empty cover | bounded functions glue on finite covers, not on singletons; sheafification `ℤ×ℤ`; `F(∅)` terminal | agree | none |
| §6.2 rigid category (Checks) | `ℙ¹` glued by `S↦T⁻¹` and by `S↦T`; punctured disc | coefficients of `Tⁿ`, `n≠0`, vanish: `𝒪(ℙ¹)=K`; `S↦T` gives `K⟨T⟩` | agree | none |
| §6.3 properness (definition and Checks) | unit disc in itself; `ℙ¹`; finite `B/A` | `K̃[T]` not integral over `K̃`; `|ϖT|sup=|ϖ|<1` on the unit disc; scaled module generators | agree with Bosch Definitions 6, 8 at lines 4933, 4956 | none |
| §7.3 identity principle | disc; `K⟨X,Y⟩/(XY)`; `K⟨T⟩×K`; skyscraper | nonzero series has finitely many zeros; `Y` vanishes on `X≠0`; `(0,1)` vanishes on the disc | hypotheses needed; Conrad line 554 is Lemma 2.1.4 | none |
| §8.1 analytification | affine line at 0; node; cusp; finite `A` | completions `K⟦x⟧`; two branches `y=±x√(1+x)`; `K⟦t²,t³⟧`, `t=y/x∉`; `Sp A=Spec A` | agree; Conrad-RA line 854 is Example 2.2.11 | none |
| §8.2 `closure_range_maximalSpectrumToSpa` | `A=0`; `A=K`; `v(Σaₙ Tⁿ)=|a_k|ε^k` | both sides `∅`; one point, trivial valuation excluded by `v(ϖ)<1`; `v∈L_A`, `v(T)=ε<|ϖ|ⁿ` | true; Huber-CV line 775 is Theorem 4.1, p. 472; `vle a 1` is `v(a)≤1` | none |
| §8.2 `dense_range_maximalSpectrumToSpa` | `A=0`; rank-two point of the disc | empty range dense in `∅`; singleton proconstructible, not constructible | true; Huber-CV line 818 is Corollary 4.2, p. 473 | none |
| §8.2 ACVF axioms and quantifier elimination | axioms on a field; `ℚ̄` trivial versus `ℚ((t))` closure; `ℚ(i)` at 5 and 3 | `{x:1∣x}` is a valuation ring, `0∣x⇒x=0`; quantifier-free sentences agree, `∃x¬(1∣x)` differs; `5=(2+i)(2−i)` | axioms determine the model; Checks hold | none |
| §8.3 rigid–adic functor | `Sp K`; open disc; `T=c`, `|c|ⁿ⁺¹=|ϖ|` | one point; `|c|ⁿ=|ϖ|^(n/(n+1))>|ϖ|`, so no finite subcover | agree; Huber-FR line 1436 is Proposition 4.5 (i)–(v) | none |

- Source locators checked against the text: 60 in 13 sources (Conrad 13, Kiehl-AR 14, Bosch 14, Huber-CV 4, Stacks 5, Kiehl-E 3, Kiehl-AB 1, FK 1, Huber-FR 1, Conrad-RA 1, Lütkebohmert 1, Temkin 1, Urban 1); all agree with the README.
- Library declarations: all 157 pinned names in the README resolve. Opened: `TauCeti/Analysis/Normed/Field/WeaklyStable.lean:36`, `TauCeti/RingTheory/Japanese.lean:125`, `TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`, `TauCeti/RingTheory/UniversallyCatenary.lean:56`, `TauCeti/RingTheory/Affinoid/Subdomain/Rational.lean:79`, `TauCeti/RingTheory/Affinoid/Subdomain/Basic.lean:70`, `TauCeti/AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237`, `Mathlib/Topology/Spectral/ConstructibleTopology.lean:43`. None of the twelve headlines is proved at the pins.
- Cross-roadmap citations resolved: RestrictedPowerSeries (11 sections), PadicFunctionalAnalysis §1.4 and §2.4, SchemeAndStackFoundations §0.21 with *IsGRing.of_finiteType* (it states neither criterion of §1.2), AdicSpaces §§2.3, 2.4, 3.1, AdicSpacesPartII R0.3–R0.5, R0.9, R1.1, R1.7, R1.9, the 16 AdicSpacesPartIII targets, AdicSpacesPartIV F1.1 and R5.7, LocallyAnalyticDistributions §4.16.
- Dependency check: `depcheck: 237 roadmaps, 2249 edges, 0 problem(s)`. No supplier cites this roadmap back.
- Gate at f58ded6: every check passes. `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else. One-tactic probe (`infer_instance`, `rfl`, `simp`, `assumption`) closes none of the twelve. The twelve elaborated signatures agree with their README statements; no binder is lost.
- Headlines of the Summary: twelve stated; the immersion form of Gerritzen–Grauert, rigid spaces, properness, the identity principle, analytification, the rigid–adic equivalence and quantifier elimination are named in the docstring with the missing carrier.
- Pull request #1808 also changes this folder; the description's merge-order block places this pull request first. The ids §7.1, §7.3, §7.4, §7.5 and §8.4 that others cite are mapped by the table at README lines 69–75.
- Overlap check: read AdicSpacesPartII, AdicSpacesPartIV, AdicSpacesPartIII, LocallyAnalyticDistributions, PadicDifferentialEquationsAndRigidCohomology, PadicFunctionalAnalysis; Runge immersions and Gerritzen–Grauert for immersions are shared with AdicSpacesPartIV F1.6, owner this roadmap (R01); slope predicates: owner here (§7.2, pinned), comparison in LocallyAnalyticDistributions §4.16; AdicSpacesPartV, ClassicalAdicEtaleCohomology and PerfectoidSpacesPartII were not read.
- Source independence: 14 passages compared with 8 sources, none shared (longest run 7 words, README line 1584 against Conrad line 203); largest share BGR, 29 of 127 locators, text and contents page not readable; contents compared with Bosch and with the BGR section numbers the README cites: independent. Layers 1–6 run in the order of BGR 6.1, 6.2–6.3, 7.1, 7.2–7.3, 8, 9.1–9.3, which the *Needs:* lines of §§2.1, 3.1, 4.1, 4.3, 5.1 and 6.2 force; the scopes differ (Layer 1 holds Kiehl's excellence and the field extension, Layer 5 the stalk excellence, Layers 0, 7 and 8 have no counterpart).

## Not verifiable

- [BGR] locators (2.3.2/7, 3.5.1–3.5.3, 3.7.5, 3.8.1/7, 3.8.3/7, 4.1/3–4, 4.4/2, 5.3.1/1, 6.1.1–6.1.5, 6.1.1/12, 6.2.1–6.2.4, 6.3.1/4–6, 6.3.4–6.3.5, Chapter 7, 8.2.1/1, 9.1–9.3): the manifest records the book as uncertified. This covers the sampled §§0.2, 1.4, 3.1, 5.2 and 6.1, whose only source it is.
- [Prestel] 4.17: uncertified. Huber-CV line 798 confirms that Huber cites item 4.17 for the result.
- [Matsumura] Theorem 102: no cached text. Conrad line 131 confirms that Conrad applies it to Tate algebras in characteristic zero.

## Source issues

- none

## For the human reviewers

- **Not tested.** BGR has the largest share of the locators (29 of 127) and is uncertified; the publisher's contents page returned 404. Wording and arrangement were not compared with its text.
- **Licence.** The cached Bosch text comes from a seminar page at `math.purdue.edu` and the cached Huber-CV text from a seminar reference page at `virtualmath1.stanford.edu`; neither host is the author's or the publisher's.
- **Licence.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md` lines 2344–2360 name the repository WilliamCoram/PhD at a fixed commit as secondary implementation references; its licence was not read, and `Suggested.lean` was not compared with it.
- **Scope.** README lines 79–88 exclude the composition law for Kiehl-proper morphisms and the inner-cover form over every affinoid of the base, because their proofs need formal models or Berkovich spaces; no roadmap is named as their owner.
