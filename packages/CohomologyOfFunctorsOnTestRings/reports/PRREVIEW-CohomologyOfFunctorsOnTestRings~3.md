# Review of CohomologyOfFunctorsOnTestRings (pull request #3175 at d9a72b0)
Folder: `TauCetiRoadmap/ShortGRH/CohomologyOfFunctorsOnTestRings/`
**Verdict:** needs changes

**Summary.** Needs changes. The fifteen sampled sections agree with the formal proof at the cited commit, and every check I computed on the stated results came out right. The findings concern the plan:
- the theory stands in for étale and coherent Hodge cohomology but states no comparison with them, so Layers 3–7 re-prove for a private theory what EtaleCohomologyFoundations and IndexTheory plan for the standard ones (P1);
- this roadmap and PadicComparisonForFunctorCohomology supply each other;
- proper base change can be stated at the pins, yet `Suggested.lean` states nothing and names no headline;
- the method sketches reuse the formal proof's comments, and the sections follow its files.

There are four small corrections and one format note. The human reviewers have three questions to decide: whether this family may plan a formal proof's own devices, the licence of the reused comments, and the scope given its single unpublished source.

## R01 (P1) — The roadmap builds a stand-in for étale and coherent Hodge cohomology and states no comparison with them, so it re-proves base change, the projective line formula and a Lefschetz formula for a private theory instead of building on the roadmaps that own them

An implementer of Layers 3–7 would produce a second cohomology theory that the rest of the library cannot use. No theorem moves a class between these groups and étale cohomology, and the étale and coherent roadmaps on main gain nothing from the work. This is the bypassed theory that the planning principles exclude.

The README says so itself. The overview (lines 28–31) states that these groups stand in for étale and Hodge cohomology and adds "no comparison with them is stated or used, and every property is proved for these theories directly". Line 216 repeats this for 1.3, and lines 1083–1084 for Hodge cohomology. 1.4 (d) says that charted schemes stand in for smooth ones. The closing sentences of 4.3 (lines 824–825) and 5.6 (lines 1056–1057) name EtaleCohomologyFoundations §§F.2.1 and F.2.2 and add "the proof here avoids the general theorem". The closing sentences of 5.2, 5.5, 6.6 and 7.5 (lines 931, 1029, 1243, 1407) do the same for §§F.2.6 and 0.9 of that roadmap and for IndexTheory §8.3.

The comparison is within reach of sections on main:
- torsion étale cohomology satisfies arc descent (PrismaticCohomology §2.0; BM21 line 1560, Theorem 5.4);
- every ring has a v-cover by a product of aic valuation domains (ArcTopologyAndDescent §3.10);
- the torsion étale cohomology of an aic valuation domain is its closed stalk (ArcTopologyAndDescent §6.1).

A test ring with connected spectrum has only the idempotents 0 and 1. By 1.2 (iii) its elements are then totally ordered by divisibility, and since the ring is reduced it is a domain, hence an aic valuation ring. So every connected component of a test ring is an aic valuation ring, its higher étale cohomology vanishes, and `LC_Λ` is its `H⁰`. Then Ext of presheaves on test rings computes v-cohomology, which for qcqs schemes and torsion `Λ` is étale cohomology. The formal proof's own index cites exactly these inputs for its descent file: BM21 Theorem 5.4, and Scholze's Berkovich motives, Theorem 4.1 (Scholze24BerkovichMotives line 791), whose strictly totally disconnected rings play the part of test rings.

The smallest change has three parts:
- Add a target: `Hⁿ_Λ(X) ≅ Hⁿ_ét(X, Λ)`, naturally in qcqs schemes `X` and for torsion `Λ`, with *Needs:* PrismaticCohomology §2.0 and ArcTopologyAndDescent §§3.10, 6.1.
- For schemes, take 4.3 (c), 5.5 and 5.6 from EtaleCohomologyFoundations §§F.2.1, F.2.2 and 0.9 through it. Keep a functor-level statement only where the route needs a functor that is not a scheme (the spaces of places of 4.1 in 4.3 (a)), and say in one clause why.
- Do the same for Layer 6: compare `H^q_Hdg(X)` with `⊕_p H^q(X, Ω^p)` for `X` smooth and separated over a field.

Whether this family may instead plan a formal proof's own devices is a question for the human reviewers (last section); until they decide, the principle applies.

## R02 (P2) — This roadmap and PadicComparisonForFunctorCohomology supply each other, so neither can precede the other in the merge order

The principles require one direction of supply between roadmaps. Here a reader cannot tell which of the two is the supplier, and the merge order cannot place either before the other.

In this direction, the *Needs:* lines of 3.4, 5.3, 5.4, 5.6, 7.2, 7.3, 7.4 and 7.5 (lines 692, 958, 993, 1050, 1320, 1347, 1373, 1401) cite PadicComparisonForFunctorCohomology §§1.1–1.3, 2.1, 3.1, 3.2, 4.1–4.3, 5.1 and 6.1–6.3. In the other direction, 19 of that roadmap's 25 sections cite this one, for example its §1.1 (§§1.2, 1.3 here), §4.1 (§§1.1, 2.1, 2.2, 2.7, 5.1), §5.2 (§§5.4–5.6) and §6.3 (§§1.4, 6.1).

The sections themselves form no cycle as far as I followed them: 5.6 here needs PadicComparisonForFunctorCohomology §4.3, which needs §§1.1, 1.4, 2.4, 4.4 and 5.1 here, and none of those needs that roadmap. The dependency check reports no problem only because PadicComparisonForFunctorCohomology is not in the merge order.

Smallest change: give each object one owner so that supply runs one way. One option is to move 3.4 (b)–(d), together with 3.5 (which uses 3.4 (d)), 5.3–5.6 and 7.2–7.5 into PadicComparisonForFunctorCohomology. All their needs on that roadmap then become internal, and it keeps citing only sections here that cite nothing there. The other option is to move that roadmap's §§1.1–1.3, 2.1, 3.1, 3.2, 4.1–4.3, 5.1 and 6.1–6.3 here.

## R03 (P2) — `Suggested.lean` states nothing although the proper base change theorem can be stated at the pins, and its docstring names none of the five headline theorems

A reader cannot tell which headlines the acceptance test should contain, or why it contains none.

Mathlib's `HasExt.standard` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:92`) gives Ext groups in every abelian category, including functors from test rings to abelian groups. I wrote a scratch file with ten definitions, each with a real body and no `sorry`'d data:
- the aic predicate and the test-ring predicate of 1.2;
- the full subcategory of test rings;
- `LC_Λ`, through `LocallyConstant.comapAddMonoidHom`;
- `ℤ[Y|_Test]` and its map on morphisms;
- `h_D`;
- the properness of 1.4 (a);
- the closed fibre.

On these I stated 4.3 (a), with the hypotheses of the README, as bijectivity of the pull-back on `Abelian.Ext` for every `n`. The file elaborates against the pinned Mathlib with `sorry` as its only warning.

Smallest change:
- State 4.3 (a) this way.
- Name 5.5 (c), 6.6 (c) and 7.5 in the module docstring as not statable, each with what it lacks: the class `η` of 5.1 (defining it needs the exactness of the Kummer sequence proved inside a definition); the classes of points and `δ` of 6.3 and 6.5 (defined by existence); and the Hodge–Tate maps `λ_h` of PadicComparisonForFunctorCohomology §6.3, which this file cannot import.
- State 5.6 (b) in the same way as 4.3 (a), or name the carrier it lacks.

## R04 (P2) — The method sketches reproduce the proof comments of the formal proof, several for long runs of words

Roadmap text must be the author's own words. Six sketches I compared take the formal proof's comments over clause by clause, so in those places the published roadmap would carry another text's expression.

- 5.5 (README lines 1004–1011) and [ShortProof] `Lib/Cohomology/ProjectiveLine/ConstantLineFormula.lean` lines 379–381 and 456–460: 28 consecutive words shared; the rest follows the comment clause by clause.
- 6.4 (lines 1169–1172) and `Hodge/Kunneth.lean` lines 294–295: 20 consecutive words.
- 4.3 (lines 797–799) and `ProperBaseChange/Theorem.lean` line 657: an 18-word sentence taken over whole.
- 7.4 (lines 1360–1364) and `PointClass/LinearIndependence.lean` lines 19–23: 15 consecutive words, the same clauses in the same order.
- 4.2 (lines 770–774) and `ProperBaseChange/LineCharts.lean` lines 10–12: 14 consecutive words.
- 1.2 (lines 172–176) and `Etale/Basic.lean` lines 630–632: runs of 9 and 10 words, clause by clause.

Smallest change: rewrite these sketches in the roadmap's own words, saying which route and which inputs (by section number) each proof uses, rather than retelling the formal proof's steps.

## R05 (P2) — The sections follow the formal proof's files one to one, with the scope of each file and a paraphrase of its title

When each section is one source file, the roadmap's organisation is that source's arrangement rather than one derived from what its consumers need. The repository README asks for the opposite: do not write the roadmap merely to follow an existing formalisation, and keep any file-by-file map in a secondary provenance section.

The correspondence, against the formal proof's file list (its `CONTENTS.md`):
- 6.1–6.6 and `Hodge/` Site, DepthVanishing, GrothendieckSymbol, Kunneth, DiagonalClass, FixedPointFormula (its lines 670–675, in this order);
- 7.1–7.4 and `PointClass/` NoetherNormalization, ProjectiveSpace, ProjectiveNonvanishing, LinearIndependence (lines 679–682), and 7.5 and `WoodsHole`;
- 4.1–4.4 and `ProperBaseChange/` PlaceSpace, SubringSplitting with LineCharts, Theorem, Theorem;
- 5.1, 5.3, 5.5, 5.6 and ChernClass, PerfectLine, ConstantLineFormula, SmoothBaseChange;
- 2.1–2.7 and LerayHirsch, CupProduct, BijectiveComparisons, DenseSubfunctors, RelativeChains, TorsionTheories (twice).

The *Needs:* lines force the order inside Layers 6 and 7 (6.2 on 6.1, 6.3 on 6.2, 6.5 on 6.3, 6.6 on 6.4–6.5; 7.2 on 7.1 through 7.5 on 7.4), so the order is no finding. The scope is: each section is exactly one file, and its heading paraphrases the file's title. For example, 6.2 "Vanishing below the depth, and Zariski descent for Hodge cohomology" corresponds to the file titled "Vanishing of Hodge cohomology with supports below the depth, and Zariski descent".

Smallest change:
- Organise the layers by the targets that consumers use. Make 4.3 the target of Layer 4, with 4.1 and 4.2 as steps of its route. Merge 6.1 and 6.2 into one section (Hodge cohomology, its Zariski descent and the depth bound). Make 7.4 the target of Layer 7, with 7.1–7.3 as its route.
- Move the `[ShortProof]` pointers into one closing provenance table.
- For the main results, cite at least BM21 Theorem 5.4 (BM21 line 1560) and Scholze24BerkovichMotives Theorem 4.1 (line 791) beside 3.1–3.3.

## C01 — Five Tau Ceti declarations that the README says the library provides do not exist at the pins

An implementer who looks them up finds nothing. The closing list (lines 1425–1444), the sentence after 3.4 (line 699) and the sentence after 7.1 (line 1293) name:
- `TauCeti.IsAbsolutelyIntegrallyClosed` with `.quotient`, `.localization` and `.pi`;
- `TauCeti.isAbsolutelyIntegrallyClosed_iff_isAlgClosed`;
- `ValuationSubring.isAbsolutelyIntegrallyClosed`;
- `TauCeti.IsDerivedComplete` with `.of_isAdicComplete` and `.pi`;
- `TauCeti.exists_linear_normalization`.

None of these occurs in the pinned Tau Ceti (2fd255d) or Mathlib (1b1ccf4); I searched both trees for the stems. Mathlib does have `PreValuationRing` (`RingTheory/Valuation/ValuationRing.lean:54`) and a Noether normalisation, `Algebra.exists_finite_inj_algHom_of_fg` (`RingTheory/NoetherNormalization.lean:292`). Drop the three claims or cite what the pins have. Aic rings are already supplied by ArcTopologyAndDescent §0.1 and derived completeness by PadicComparisonForFunctorCohomology §3.1.

## C02 — The *Origin:* lines say "adapted from the published theory of …" without naming any published source, although the formal proof's index gives one for most sections

The family index (`TauCetiRoadmap/ShortGRH/README.md`, line 200 onwards) asks for the source wherever one is given, and the README has no references at all. The formal proof's index gives, for example:
- for 3.1–3.3: BM21 Proposition 5.2 and Theorem 5.4, and Scholze, Berkovich motives, Theorem 4.1 and Lemmas 4.7–4.8;
- for 4.3: SGA 4 XII 5.1, 5.4, 5.5 and Stacks Tag 095S;
- for 5.6: SGA 4 XV 2.1 and XVI 1.2, and Stacks Tag 0EYQ;
- for 6.6: Stacks Tags 0BEC and 0G82, and Hartshorne, Residues and Duality III.9;
- for 7.5: Atiyah–Bott 1968 and Kondyrev–Prikhodko 2022.

Add these to the *Origin:* lines, with their locators.

## C03 — Headline (4) of the overview omits the hypotheses on `W` that 6.6 (c) carries

Line 51 and the lines after it state the fixed point formula for arbitrary `u, c : W → X` with reduced coincidences. But `cl(w)` is only defined for `W` separated with its field points in charts of dimension `d` (6.3), and 6.6 (c) also asks for a finite set listing the coincidences. Add "for `W` separated, with its field points in charts of dimension `d`, and finitely many coincidences".

## C04 — The description says the references of the formal proof's index "are recorded", but none is recorded for this roadmap

The sentence under *Known limits*, "The references the shorter proof's own index gives are recorded and can be added in a later pass", does not hold for this folder: it has no references section and no manifest, and the pull request's diff contains none of those references. Write "are not yet recorded", or record them (C02).

## N01 — The conventions leave the universes open ("Questions of size are ignored")

One sentence would pin them: rings in the smallest universe, functors to the next universe, values in abelian groups of that universe, and Ext in the universe above. This is the choice the formal proof makes, and the one under which the R03 statement elaborates.

## Questions for the author

- Is 5.6 (b) statable at the pins in the same way as 4.3 (a)? I did not test it. It additionally needs the étale charts, open subfunctors and closed classes of 1.4 (c), (d), each of which is a predicate with a body in the formal proof.

## Verified sound

| Statement | Instances tried | README side | Other side (Lean at 72fead1, or computation) | Result |
|---|---|---|---|---|
| 1.1 (f), (g); density | `Y = h_A`; `Y = ∅`; `Y₁ ⊔ Y₂` | `Ext⁰ = F(A)`, `Extⁿ = 0` for n>0; `H(∅) = 0`; product | `homReprEquiv` (Basic.lean:1109), `H.sigma_bijective`; additive Yoneda makes `ℤ[h_A]` projective | agree |
| 1.2 test rings | ℤ̄; ℂ×ℂ; zero ring; connected test ring | ℤ̄: a=2, b=3, idempotents {0,1}, neither divides: not test; ℂ×ℂ, e=(1,0): test; zero ring: test | connected: total divisibility, reduced ⇒ domain ⇒ aic valuation ring, as 1.2 (c); `IsTest` Basic.lean:362 | agree |
| 2.1 (b) Leray–Hirsch | I={∗}, d=0, θ = id, φ = id; I = ∅ | map is identity ⇒ basis at every S; I=∅: basis iff `H*(h_c∘φ, F) = 0` | `isLerayHirschBasis_of_reprBy` (LerayHirsch.lean:299): I finite, φ : C → A | agree |
| 2.4 (a), (c), (e) | U=V=Y; empty family; e=0 | `0→ℤ[Y]→ℤ[Y]²→ℤ[Y]→0` exact; `ℤ[∅]=0 ∈ P`; maps killing 0 are all maps | `mayer_vietoris_shortExact`, `IsClosedClass.freeAb_iSup` (Finite ι), `isCohomDense_partition` | agree |
| 2.7 (b) closed loci | I=(1) everywhere; I=0 | `(ℤ[pt]/ℤ[O])/ℓ = 0 = LC_{I=0}`; I=0: `ℤ/ℓ → LC`, 1 ↦ constant 1 | `isCohomEquiv_constToZeros` (TorsionTheories.lean:913); (c) is the I=0 case | agree |
| 3.2 (b) (ii), (iii) | T finitely generated over S; constant family | T is a member, colimit = `H(Y_T)`; constant system has colimit `H(Y)` | `isFilteredColimit_adjoin`; `isFilteredColimit_antitoneFamily` (upper bound, `V(m) ⊇ ⋂`) | agree |
| 3.3 (d), (e) | c = id; Y with no points in algebraically closed fields, U = ∅ | identity is onto ⇒ dense; (e) vacuous, U=∅ dense | nonzero test rings have algebraically closed residue fields ⇒ Y(B)=∅ for B≠0; `LC(0)=0` ⇒ `H(∅)=H(h_0)` | agree |
| 4.2 splitting | J = D; B a valuation ring | J=D: `LC_J = 0`, sequence `0→0→0→0→0`; valuation B excluded | `exists_isSplitting_isMayerVietorisExact` (SubringSplitting.lean:458): `PreValuationRing D`, ℓ unit | agree |
| 4.3 (a), headline 1 | A = K a field; Y = h_A; Y = 𝔸¹_A | 𝔪=0 ⇒ fibre = Y; `H⁰(h_A) = LC(A) = ℤ/ℓ = LC(κ)` | 𝔸¹ fails 1.4 (a) (z(t) ∉ O has no lift), excluded; `proper_base_change` (Theorem.lean:625) | agree |
| 5.1 ℙ¹ and 𝕋 | local B, row (a,b), a unit or not | a unit: u=0, v=b/a; else v=1, u=a/b−1; rows `(1+uv, v)` unimodular | `𝕋(c) = Hom(ℚ/ℤ, g(c)^×)`, all primes (`tateModule`, ChernClass.lean:88) | agree |
| 5.5 (c), headline 2 | A = ℚ̄ ⊂ ℂ_ℓ; S = point | `H*(ℙ¹)` free on 1, η over `ℤ/ℓ`: rank 1 in degrees 0 and 2 | `hasLineFormula_locallyConstant` (ConstantLineFormula.lean:454): `PreValuationRing`, `InvertsPrime`, `FaithfulSMul A ℂ_[ℓ]` | agree |
| 5.6 (b), headline 3 | Y = 𝔾_m over A ⊂ ℚ̄, p ∈ 𝔪 | `H¹(Y_A) → H¹(Y_Ω)` bijective | étale: `A[t^±]^×/ℓ = ℤ/ℓ = Ω[t^±]^×/ℓ` (A^× ℓ-divisible); `isTestCohomEquiv_baseChangeTransition` (SmoothBaseChange.lean:266) | agree |
| 6.1 Hodge cohomology | étale chart R of dim d; point | `H⁰(h_R) = ⋀_R R^d = ⊕_p Ω^p_R`, `s_t = t^p` on `⋀^p`; point: `H⁰ = k` | `(R, R^d)` represents `Hom(R, A ⊕ M)` (`exists_univPoint`, Site.lean:387, k a field) | agree |
| 6.4 Künneth | X = point; X = ∅ | `H(pt×pt) = k = k⊗k`; 0 | `kunneth` (Kunneth.lean:287): `Field k`, `CharZero k`, `HasAtlas d X` | agree |
| 6.6 (a), (c), headline 4 | d=1, u=id, c=const p; u=const p, c=id; `du = dc·A` | n = t; n = 1; `det N = det(1−tA)/det(1−A) = P(t)/P(1)` | `δ = [pt]⊗1 + 1⊗[pt]`: pull-backs `t·cl(p)` and `cl(p)` | agree |
| 7.2 (a) map to ℙ^{d+1} | w₀ = 0; w₀ ≠ 0, field, char 0 | w₀=0: entries `w₁v_i`, unimodular; else `(λ−i)v_i = 0` ⇒ `v = c·e_j`, first entry `w₀c ≠ 0` | fibre `([e_j], [1:j])` as stated; char 0 keeps 0,…,d distinct | agree |
| 7.3 (c) | d = 0 | ℙ⁰ = point, cl = 1, `λ_0(1) ≠ 0` | `hodgeTateMap_pointClass_ne_zero` (ProjectiveNonvanishing.lean:871), `EmbeddedInQpBar p k` | agree |
| 7.5, headline 5 | d=0 (W, Y finite); h ≥ 1; h = 0 | h≥1: `det(1−tA) = 1`, `[t^h] = 0`; h=0: `Σ b_i·#coincidences` | x = cl(c(y)) gives `Σ_i b_i[u_i(y)=c(y)] = 0` for each y; summing gives 0 | agree |
| R01 comparison | test ring A; qcqs X | no comparison stated (lines 28–31, 216) | components of Spec A are aic valuation rings ⇒ `H^{>0}_ét(A) = 0`; arc descent (BM21 line 1560) | comparison available, not stated |
| R02 direction | 5.6 here and PadicComparison §4.3 | 5.6 needs its §§4.1–4.3 | its §4.3 needs §§1.1, 1.4, 2.4, 4.4, 5.1 here, none of which needs it | acyclic by section, two-way by roadmap |
| R03 statability | scratch file stating 4.3 (a) | `Suggested.lean`: empty namespace, no headline named | 10 definitions with bodies, `HasExt.standard`; elaborates with one `sorry` warning | statable |
| C01 library claims | Tau Ceti 2fd255d, Mathlib 1b1ccf4 | five `TauCeti.*` names; "the library has" (lines 699, 1293) | no match in either tree; Mathlib has `PreValuationRing`, `Algebra.exists_finite_inj_algHom_of_fg` | claims false at the pins |

- Source locators: 15 sampled sections checked against [ShortProof] (grh-lean at 72fead1), about 90 declarations and docstrings opened; all agree in hypotheses and conclusion.
- Published texts read: Scholze24BerkovichMotives line 791 (Theorem 4.1) and BM21 line 1560 (Theorem 5.4), both from arXiv.
- Library declarations opened at the pins: `CategoryTheory.Abelian.Ext` (`Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`), `Ext.comp` (:128), `HasExt.standard` (:92), `ShortComplex.ShortExact.extClass` (`ExtClass.lean:76`), `Ext.contravariant_sequence_exact₁'/₂'/₃'` (`ExactSequences.lean:235/215/252`), `PreValuationRing` (`ValuationRing.lean:54`), `Algebra.exists_finite_inj_algHom_of_fg` (`NoetherNormalization.lean:292`); the five Tau Ceti names of C01 are absent.
- Cross-roadmap citations resolved: on main (947be81), ArcTopologyAndDescent §§0.1, 3.2, 3.10, 4.6, 6.1; EtaleCohomologyFoundations §§F.2.1, F.2.2, F.2.6, 0.9; PrismaticCohomology §2.0 (its arc-descent statement for torsion étale cohomology); IndexTheory §8.3. At this head, PadicComparisonForFunctorCohomology §§1.1–1.3, 2.1, 3.1, 3.2, 4.1–4.3, 5.1, 6.1–6.3. All exist with the cited content.
- Dependency check output: `depcheck: 115 roadmaps, 1309 edges, 0 problem(s)`. It misses R02 because PadicComparisonForFunctorCohomology is not in the merge order.
- Elaboration: `Suggested.lean` elaborates with no message. It declares nothing, so no `#check` comparison and no one-tactic probe applies. The 4.3 (a) scratch file elaborates with only the `sorry` warning.
- Wording: six sketches compared by hand. 66 of 185 paragraphs share a run of at least nine words with the formal proof's comments, most of them inside formulas.

Overlap check: the three closest-roadmap lists are empty. I read the scope of ArcTopologyAndDescent, EtaleCohomologyFoundations, PrismaticCohomology §2.0 and IndexTheory §8.3 (main), and PadicComparisonForFunctorCohomology (this pull request). Aic rings are owned by ArcTopologyAndDescent §0.1 (cited). Étale proper and smooth base change, the projective bundle formula and Künneth are owned by EtaleCohomologyFoundations (bypassed, R01). The Ext-of-functors set-up is owned here and supplied in both directions with PadicComparisonForFunctorCohomology (R02). No other roadmap owns test rings.

Source independence: 6 sketches and 15 sampled statements compared with the 1 cited source (Scholze24BerkovichMotives and BM21 also read, not cited); largest share [ShortProof], 38 of 38 section locators; contents compared with its file list (`CONTENTS.md`): the sections follow its files (R05), and the sketches follow its comments (R04).

Research link: the test-ring cohomology is a discrete analogue of the finitary arc-sheaves of Scholze, Berkovich motives (2024), Theorem 4.1, and computes étale cohomology by Bhatt–Mathew (2021), Theorem 5.4. Headlines 4.3 and 5.6 are SGA 4 XII 5.1 and XVI 1.2 for it, and 6.6 and 7.5 are of Atiyah–Bott (1968) type. This rests on the formal proof's index and the two texts read.

## Not verifiable

- The published works the formal proof's index lists for these sections (SGA 4 XII and XV–XVII, SGA 5, Atiyah–Bott 1968, Kondyrev–Prikhodko 2022, Faltings 1988, Hartshorne's Residues and Duality) were not opened, because the README cites none of them.
- The statements of PadicComparisonForFunctorCohomology that this roadmap consumes were resolved by heading and *Needs:* line only; that roadmap's own review checks them.
- Whether 5.6 (b) is statable at the pins was not tested.

Automatic checks set aside as false positives: the three files outside the family folder are the repository's roadmap list, which its own consistency check requires to list the new area ShortGRH, and the umbrella GRH, which the repository's generator writes from the family's READMEs. The backticked `New.Variety.*` names on the pointer lines are declarations of the external formal proof, not claims about `Suggested.lean`.

## Source issues

- **Misprint** in ShortProof at `Lib/Cohomology/Etale/DenseSubfunctors.lean`, lemma `IsCohomDense.inf` (line 152): the docstring says that a subfunctor containing the preimage of a dense subfunctor is dense; it should say that the intersection of two dense subfunctors is dense; affects nothing.

## For the human reviewers

- Scope: the only source the README cites is [ShortProof] (grh-lean at 72fead1). Its README says the Lean text and documents were written by an AI, rewriting an unpublished proof (alpo.ge/remark.pdf). The roadmap gives no published locator anywhere (C02).
- Scope and principle: the family index (`TauCetiRoadmap/ShortGRH/README.md`, "A route, not a source of code") makes following one formal proof's route the family's purpose. Whether roadmaps that plan that proof's private devices fit the project is yours to decide; R01 applies the principle until you do.
- Licence: [ShortProof] is Apache-2.0, with `NOTICE` and `ATTRIBUTION.md` in the repository. The passages of R04 reproduce its comments. Whether reusing that AI-written text is acceptable under the project's licence is for you.
- Files outside the family folder: one line of the top-level roadmap list and the regenerated `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md`, which come from the family as a whole.
