# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 8cf11a2)

**Verdict:** needs changes

## R01 (P1) — Remove the remaining nonexistent native dependencies

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3408`: “This layer uses the native `TauCeti.RepresentationTheory.Homological.ContCohomology.Nonabelian.Basic` and `TauCeti.RepresentationTheory.Homological.ContCohomology.Nonabelian.Inflation` modules”.

**Claim:** The final dependency list still imports the nonabelian foundation from the pinned library. This contradicts the repaired ownership contract at lines 53–57, which correctly constructs it here.

**Witness:** Neither module exists at Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The pinned continuous low-degree and inflation constructions have additive abelian coefficients; they do not supply these nonabelian modules.

**Repair:** Delete these two native-module dependencies and point to the owned cocycle and quotient constructions in §0.1 and descent/inflation in §§0.16–0.18. Retain the actual abelian pinned modules only for the abelian comparison. No dependency update or new supplier is needed. This is the surviving part of previous R01, not a claim that the newly added Layer 0 constructions are absent.

**Repair test:** Trivial C₂-action on S₃ gives four cocycles and two H¹ classes. Those are obtained from the owned nonabelian subtype and gauge quotient; the additive supplier cannot be instantiated with S₃. The repaired dependency list must reach this example without either missing module.

## R02 (P2) — Keep the any-characteristic smooth-curve K(π,1) theorem

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4157–4161`: “This target keeps the characteristic-zero geometric-curve scope.”

**Claim:** The smooth-curve endpoint is restricted to characteristic zero even though the same paragraph acknowledges that its sources prove the any-field result. This violates the general-library requirement; it is not a missing hypothesis needed for this theorem.

**Witness:** `schmidt-stix-2016 line 412`, Lemma 2.7(a), printed p. 827, allows any field. `schmidt-curve-1996 line 309`, Proposition 15, printed pp. 243–244, proves the connected smooth affine-or-positive-genus curve statement, including residue-characteristic coefficients.

**Repair:** State the curve endpoint over arbitrary fields and extend the geometric effacement route accordingly. Separate invertible-prime Kummer covers from the residue-characteristic Artin–Schreier/cohomological-dimension branch; include the descent/base-change inputs needed over imperfect fields. Keep characteristic zero where the separately cited product and Artin-tower arguments require it. Do not merely delete the characteristic assumption from the prime-degree-cover construction: a supersingular elliptic curve need not have a connected étale cover of degree equal to the characteristic.

**Repair test:** Over an algebraic closure of F₂, A¹ has the nonzero Artin–Schreier class of t, killed by the étale cover y²−y=t, and H^q(A¹,F₂)=0 for q≥2. On the supersingular elliptic curve y²+y=x³, H²(E,F₂)=0, so this case needs no degree-two étale cover. For coefficient F₃, a degree-three cover kills the degree-two class by multiplication by 3=0. Conversely P¹ still fails: its F₃ degree-two cohomology is F₃ while its geometric fundamental group is trivial. The repair includes the first two curves and continues to exclude the last.

## R03 (P3) — Finish removing undeclared own API identifiers

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7677–7679`, and `:7705`: “`MixedExtension.pi1` and `MixedExtension.pi2`”; “`MixedExtension.baerSum₁` and `MixedExtension.baerSum₂`”; “`localHeight_biadditive` and `localHeight_symm`”.

**Claim:** These API bullets still promise own Lean declarations. They are neither retained acceptance declarations nor identified supplier declarations.

**Witness:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/Suggested.lean:48` contains the sole own declaration, `anabelian_isom`. None of the six identifiers above is declared there. The first four are also among the worker's unresolved-name leads.

**Repair:** Keep the adjacent-extension, partial-Baer-sum, bi-additivity and symmetry statements as prose API bullets, without these proposed Lean identifiers. Keep exact names for actual supplier declarations. Do not add these API statements to Suggested.lean to satisfy the naming rule.

**Repair test:** The split mixed extension still has both adjacent classes zero and height zero after removing the identifiers; its mathematics is unchanged. The one retained headline identifier must continue to occur in both files. Previous R06 is only partly repaired.

## R04 (P3) — Supply the required source manifest

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/sources.toml` is absent; the references are in `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md`.

**Claim:** Bibliography links and version descriptions do not record the source-service provenance and verification status required by the roadmap contract.

**Witness:** The folder contains README.md, Suggested.lean and metadata.toml, but no sources.toml. The bibliography has 47 reference entries, including multiple versions of a work; the brief records no manifest sources.

**Repair:** Add the required manifest with one lifetime key per work, exact version/locator and cited targets, and the source service's provenance and status. Combine versions rather than inventing a second key. Preserve uncertified status for paywalled locators; distinguish successful retrieval from verification of a particular theorem. Do not copy source text into the folder.

**Repair test:** The Achinger entry must distinguish the readable preprint's Proposition 4.1.2 from published Proposition 4.2; Kim 2008 must distinguish the readable arXiv version from the uncollated published pagination. The two Stix cuspidal-section versions must share one work entry. Previous R08 remains.

## R05 (P3) — Give the obstruction-on-classes definition three actual Checks

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:2296–2306`, §0.28. Its only Check begins “A choice of an algebraic section supplies continuity only after the point-topology theorem”.

**Claim:** This defines δ on gauge classes, but its lone Check is a prerequisite warning. It computes neither δ nor the effect of changing a lift. It does not meet the three-discriminating-Checks requirement.

**Witness:** The Checks block at line 2306 has one bullet. It gives no value of δ and cannot distinguish δ from the zero map or its negative.

**Repair:** Add at least three concrete prose Checks for this map. For example: the nonsplit C₉→C₃ extension, a split C₃×C₃→C₃ extension, and a change of continuous lift by a central cochain. These belong in the README, not Suggested.lean.

**Repair test:** With trivial actions and least-residue lift, the C₉ defect at (2,1) is 3, or 1 in the central C₃; the inverse convention gives −1. The identity C₃ cocycle has no homomorphic lift, so its obstruction is nonzero. The split extension gives zero. For a central cochain a with a(0)=0, a(1)=1, a(2)=0, the changed defect at (1,1) differs by d¹a=2 in C₃, but its H² class is unchanged. These distinguish sign, nontriviality and independence of choices.

## R06 (P3) — Correct the Strassmann application’s Kim locator

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7412`: “§3, proof of Theorem 1, pp. 119–121”.

**Claim:** This identifies the cited compact-zero argument as the proof of Theorem 1. Theorem 1 is the density theorem; its proof is elsewhere.

**Witness:** `kim2009 line 872` starts the proof of Theorem 1, printed pp. 111–114. `kim2009 line 1211` starts §3 Comments I, whose finiteness argument at pp. 120–121 uses that theorem.

**Repair:** Cite §3 Comments I, the dimension-to-finiteness argument, printed pp. 120–121. Retain RestrictedPowerSeries §2.4 as the supplier of Strassmann itself. If citing the density proof, give its separate pp. 111–114 locator.

**Repair test:** For the restricted series s−a with |a|≤1, the supplied theorem gives N=1 and one root. The Kim passage explains its role in finiteness; it is not a second proof or owner of the restricted-series theorem.

## Verified sound

### Previous findings, checked against this head

All eight previous findings were reconsidered before the new pass. No finding was treated as an instruction or presumed correct. No supplied repair disposition marked any of these not actionable.

| Previous finding | Current passage or deletion | Result |
|---|---|---|
| R01, missing nonabelian foundation | README:55: “Layer 0 owns the ordered continuous cocycle carrier”; :57 lists the owned descent and inflation targets. | **Partly repaired.** Ownership and the constructive route are present; the contradictory native dependency remains at :3408, current R01. |
| R02, proper-curve-only Hom | README:6436: “every smooth pro-variety X/K and hyperbolic pro-curve Y/K”. The preceding subsections construct the pro-source and open-curve reduction. | **Repaired.** The affine identity and higher-dimensional projection tests below are included by this statement. |
| R03, arithmetic K-theory duplication | README:61: “ArithmeticKTheory §§3.2–3.4 supplies projective Steinberg-homology finite generation”. Layer 7 retains the higher étale Chern comparison. | **Repaired.** The earlier owner's targets were reopened, not inferred from the old review. |
| R04, duplicated S-unit finiteness | Suggested.lean:13–14: “the S-unit theorem of DiophantineApproximationAndTranscendence §4.5”; its former theorem has been deleted. | **Repaired.** The geometric Selmer-dimension endpoint remains distinct. |
| R05, HTML-anchor gate residue | The forbidden anchors are absent; the worker reports `residue=0`, with every gate counter zero. | **Repaired.** No previous gate failure is carried forward. |
| R06, own API catalogue | README:7677 still has “`MixedExtension.pi1` and `MixedExtension.pi2`”. Many earlier identifiers were removed. | **Partly repaired.** Six concrete remaining witnesses are current R03. |
| R07, coset-action Checks | README:2914: “Its class 1 is sent to class 2”; :2915 rejects the coordinate-swap example. | **Repaired.** Recomputed all three examples below. Current R05 concerns a different definition. |
| R08, source manifest | No sources.toml exists at this head. | **Not repaired.** Current R04. |

### Gate, dependency order and Lean acceptance test

The requested Git head is `8cf11a2d03d9442a394c401922e10ef59666ed7d`. The outside-folder diff against origin/main is empty. The worker's gate at this head passes: all 28 reported counters are zero, including build, dependency order, stray files, outside-folder changes, forbidden imports, sorry-data and set_option. Its missing-identifier scanner did not detect the manual witnesses in R03.

The independent dependency check returned:

```text
depcheck: 207 roadmaps, 1502 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This is evidence about the parsed roadmap graph; it does not establish the existence of the two native modules in R01. No merge-order or tooling file was changed.

The pinned revisions inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. After building the one missing imported module, `TauCeti.AlgebraicGeometry.Cohomology.Genus`, direct `lake env lean` elaboration of Suggested.lean succeeded with only the expected sorry warning. The file has 75 lines, one theorem, no data definitions, no set_option, and the prescribed imports. The PR files were not edited.

A scratch copy with `#check @TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.anabelian_isom` was elaborated. Its explicit signature retains primality, both fields, the p-adic algebra structure, the embedding and finite-generation witness, both relative smoothness/properness/geometric-connectedness instances, both coherent-H¹ finite-dimensionality instances, and both genus bounds. No standing hypothesis silently disappeared. The pullback is along f.inv, correctly carrying covers of X to covers of Y. Compatibility is with constant covers over the same Spec K; neither rational points nor a rational fibre functor are assumed.

The one-tactic scratch probe using rfl, infer_instance and simp did not close the theorem. Reading the pinned constructions found no one-lemma anabelian reconstruction result to substitute. This is a substantive headline, not a boundary computation or definitional restatement; no Lean-padding finding is raised.

### Headline inventory

The README's end results and deep intermediate endpoints, grouped by mathematical theorem family, are:

| Layer | Headline | Acceptance-file treatment |
|---|---|---|
| 0 | Continuous nonabelian torsor classification, twisting, exactness and finite-quotient descent | Docstring names the missing continuous nonabelian H¹ carrier; README owns its construction. |
| 1 | Curve, product and Artin-tower étale K(π,1), and cohomological comparison | Docstring names étale fundamental groups and their comparison; R02 concerns the curve target's scope. |
| 2 | Unipotent path realizations and crystalline/de Rham comparison | Missing geometric tensor categories, torsors and filtered realizations are named. Abstract Tannakian reconstruction is imported. |
| 3 | Arithmetic Isom for proper hyperbolic curves over sub-p-adic fields | Stated as `anabelian_isom` on native scheme/finite-étale-category carriers. |
| 3 | General relative pro-p and full profinite Hom for smooth pro-varieties and hyperbolic pro-curves | Docstring names arithmetic extensions, relative quotients and their finite-cover/limit comparison. |
| 4 | Finite-type nonabelian cohomology and Selmer representability | Algebra-valued unipotent cohomology and represented Selmer varieties are named as missing. |
| 5 | Discwise density, dimension-implies-finiteness, depth-one logarithm and classical comparison | Albanese/period maps, represented Selmer varieties and rational Jacobian Kummer maps are named as missing. |
| 6 | Quadratic rank criterion, mixed-extension height equations and corrected determinant equations | Mixed extensions and Nekovář heights are named as missing; the determinant arithmetic alone is not substituted. |
| 7 | Section-map injectivity and the stated section conjectures | Geometric section classes and the rational-point map are named as missing. Conjectural statements are not silently asserted as proved theorems. |
| 7 | Soulé's Tate-cohomology calculation and resulting dimension, vanishing and eventual-equality statements | Restricted-ramification Galois/Tate carriers and graded geometric unipotent/Selmer/Kim loci are named as missing. |
| 7 | S-integral finiteness for P¹ minus three points | Its existing S-unit owner is cited, rather than restated. The new dimension result still depends on the missing geometric carriers. |

No additional statable missing headline was established by the pinned-carrier audit. Simple determinant identities, group identities and scalar dimension inequalities do not replace these geometric endpoints.

### Seeded source verification

All 15 requested sections were inspected. The table distinguishes a source theorem from a derived extension of its formulas. “Supports” means the stated part and its hypotheses were checked at the indicated passage; it does not certify every downstream construction in the section. Source identifiers below are the bibliography/source-fetch identifiers. No source passage is reproduced.

| Seeded section | Text and locator opened | Result |
|---|---|---|
| 0.6 Restriction of cocycles | kim2005 lines 223–246, §1 pp. 5–6 | Ordered cocycle/gauge conventions support restriction by precomposition. Continuity uses the explicit continuous group map. The general topological statement is a direct derivation, not a separately numbered theorem in Kim. |
| 0.9 Inner twists | kim2005 lines 223–305, §1 pp. 5–7, Proposition 1 and torsor conventions | Recomputed twisted action and d(g)c(g) translation; the inverse and gauge formulas agree. The arbitrary-topological-group extension is checked algebraically with the stated continuity assumptions. |
| 0.26 Twisted quotient topology | kim2005 §1 pp. 5–7; Mathlib quotient constructions below | Kim supplies the coefficient/torsor setting, not a theorem that every continuous surjection is quotient. The roadmap explicitly adds IsQuotientMap, which is necessary; topology counterexample below. |
| 0.32 Trivial connecting classes | kim2005 lines 408–410, Proposition 2 proof, p. 9, with pp. 5–6 conventions | The invariant-lift/neutral-boundary criterion has the correct orientation. Both implications were tested on C₄ with inversion, including an invariant coset without a fixed representative. |
| 0.37 Gauge stabilizers and kernel injectivity | kim2005 §1 pp. 5–6 and p. 9 | The source's gauge relation yields the stabilizer criterion. The target correctly retains invariant-action ambiguity; A₃⊂S₃ gives a concrete failure of unconditional H¹ injectivity. |
| 1.6 Raw étale K(π,1) comparison | schmidt-stix-2016 lines 401–407 and 1912–1964, §2.3 and Appendix A, Proposition A.16/Definition A.17/Corollary A.18, pp. 826–827, 864–866 | Raw pro-homotopy and finite-coefficient formulations are separated, retaining the geometric-unibranch qualifications. The adjacent curve endpoint has R02. |
| 2.9 Depth-one realization | kim2009 lines 145–169, introduction p. 93; bdmtv lines 1649–1676, Lemma 5.4 proof, pp. 923–924 | Supports path orientation and the proper depth-one logarithm interpretation. The reduced-boundary generalized-Jacobian extension has additional owned prerequisites; the Serre source for that part remains uncertified, as recorded below. |
| 3.5 Centre-freeness | t97 lines 1608–1618, Proposition 1.11, p. 146; m99 lines 3163–3211, Lemmas 15.6–15.8, pp. 78–79 | Hyperbolic geometric groups and the stated local/sub-p-adic Galois cases have their requisite hypotheses. Rank-one abelian geometric groups are not imported as centre-free. |
| 3.10 Relative extension comparison | t97 lines 9820–9870, Lemma 7.1, p. 188 | Conjugation identifies the centre-free extension with the Aut/Out pullback. Continuity and the profinite topology are retained; the C₂ negative control shows why centre-freeness is essential. |
| 4.1 Galois coefficient families | kim2005 §1 pp. 5–9; Proposition 2 at lines 313–328 | Kim uses algebra-valued points and finite cohomology assumptions. The roadmap distinguishes its weak final-coordinate topology from an ordinary product-topology group, and does not infer representability from the family axioms alone. |
| 5.3 Kim density on residue discs | kim2009 lines 872–985, Theorem 1 proof, pp. 111–114; lines 1218–1223, p. 121 | The proof uses the chosen residue disc, and the later argument explicitly uses nonvanishing on every residue disc. The distinction between K-Zariski density and density in a Qp Weil restriction is retained. |
| 5.6 Compact-chart Strassmann | kim2009 lines 1211–1223, §3 pp. 120–121; RestrictedPowerSeries §2.4 | Rescaling by a nonzero uniformizer and the nonzero-series restriction are sound. The source locator mislabels the density proof: R06. |
| 5.11 Classical Chabauty | kim2009 lines 242–248, introduction p. 95, and §3 p. 121 | The source distinguishes Mordell–Weil from Selmer. The README preserves this distinction and requires the extra equality/dimension hypothesis; double-annihilator algebra is separately supplied. |
| 6.5 Local height realization | bdmtv lines 825–873, §3.6/Proposition 3.7 and equation (17), pp. 905–906; lines 966–969 and 1649–1702, Definition 3.11 and Lemmas 5.4–5.5, pp. 908, 923–924 | Projection order, both correction terms, the degree-zero divisor correction and graded comparison were checked. The concrete −2 height computation below discriminates the two projections. |
| 6.7 Determinants and equivariant features | bdmtv lines 260–281, Lemma 1.5/equation (6), pp. 891–892; bdii lines 1026–1071, Lemmas 4.4 and 5.3, pp. 22–23 | Independent anchor features and individually subtracted residuals are retained. Balanced tensor factorization requires the stated equivariant splitting/balancing law; it is not linearity of a Qp-valued form over an unspecified larger field. |

Additionally, the general Hom endpoint was checked at m99 lines 3107–3157 and 3456–3491, Definitions 15.4/16.4, Corollary 15.5, Theorem 16.5 and the following full-profinite remark, author pp. 77–79 and 85–86. The source supports the repaired source/target generality.

### Computed adversarial tests

The finite-group tests were computed explicitly, including an exhaustive S₃ test: all 10 homomorphisms S₃→S₃, all pairs c,e, and d(g)=e(g)c(g)⁻¹ satisfy the twisted cocycle and gauge-translation identities in 7,200 checked equalities. The 108 rows below record further finite calculations and direct algebraic/geometric test instances. A passing row establishes the stated test, not a proof of the general theorem. “Retain” means that no change is indicated by that test.

| Statement | Instance | Computed values on the two sides | Result/change |
|---|---|---|---|
| §0.1 cocycles and H¹ | Trivial C₂-action on S₃ | Possible generator images: identity and 3 transpositions; 4 cocycles, 2 conjugacy orbits | Retain; requires owned carrier, R01. |
| §0.1 neutral case | G=1, U=S₃ | Cocycle value at 1=1; quotient has 1 class | Retain. |
| §0.2 abelian comparison | Trivial C₂-action on C₂ | Z¹ has 2 elements; every coboundary=0; H¹ has 2 elements on both presentations | Retain. |
| §0.6 restriction | Transposition cocycle C₂→S₃, restrict to 1 | Restricted value=1; restricted neutral class=neutral class | Retain. |
| §0.6 gauge compatibility | Conjugate (01) by (12), then restrict | Image generator (02); restriction gives 1 in either order | Retain. |
| §0.8 twisted action | Identity cocycle S₃→S₃, initially trivial action | Twisted fixed subgroup=Z(S₃)={1}; original fixed subgroup has 6 elements | Retain; excludes unchanged action. |
| §0.9 twisting equation | All pairs of S₃ homomorphisms c,e | d(gh)=d(g)·Ad(c(g))(d(h)); 3,600 cocycle equalities hold | Retain. |
| §0.9 translation and gauges | Same pairs and all x,g∈S₃ | Gauging then translating equals translating then gauging in 3,600 equalities | Retain. |
| §0.9 multiplication order | g=(12), d(g)=(021) | d(g)g=(02), whereas gd(g)=(01) | Retain d(g)c(g); reversed order fails. |
| §0.11 twisted invariants | C₂ cocycle with image (01) | Centralizer={1,(01)}, order 2; untwisted invariant group order 6 | Retain. |
| §0.16 quotient descent | Trivial cocycle on G, quotient by G | Descended source=1; value=1; inflated value=1 | Retain. |
| §0.17 same-kernel gauge reflection | Inflate from C₂ with kernel N acting trivially | Gauge equation at n∈N is 1=u·n(u)⁻¹, hence n(u)=u | Retain; no refinement needed. |
| §0.18 finite quotients | Continuous character Z₂→C₂ | Factors through Z₂/2Z₂ of order 2; quotient character and original have values 0,1 | Retain. |
| §0.22 neutral inclusion fibre | A={0,2}⊂C₄ with inversion | H¹(A) has classes 0,2; both map to the even neutral orbit in H¹(C₄) | Retain; inclusion need not inject. |
| §0.26 quotient homeomorphism | Discrete sign map S₃→C₂ | Quotient has 2 points, target 2 points; inverse of each singleton is open | Retain. |
| §0.26 topology hypothesis | Identity R_discrete→R_usual, trivial actions | Continuous bijection with kernel 0; quotient topology discrete; inverse preimage of {0} is not open in R_usual | Correctly excluded by IsQuotientMap. |
| §0.27 positive defect | C₉→C₃, lift least residues, (2,1) | D=2+1−0=3; inverse defect=6; central coordinates 1 versus 2 | Retain positive sign. |
| §0.28 nonzero obstruction | Identity C₃→C₃ in that extension | Homomorphic lifts send generator to 0,3,6, all mapping to 0; identity generator image is 1 | Nonzero H² class; add Check, R05. |
| §0.28 split obstruction | C₃×C₃→C₃ | Homomorphic section gives D(g,h)=0 for all 9 pairs | Zero class; add Check, R05. |
| §0.28 change of lift | a(0)=0,a(1)=1,a(2)=0 in central C₃ | d¹a(1,1)=1−0+1=2; [D+d¹a]=[D] in H² | Add Check, R05. |
| §0.29 invariant action | C₃ acts trivially on A₃⊂S₃ | H¹(A₃) has 3 classes; quotient C₂ orbits are {0},{1,2}; ambient image has 2 classes | Retain orbit quotient. |
| §0.32 trivial connecting class | C₄ with inversion, quotient by {0,2} | Even coset has fixed lifts 0,2 and boundary 0; odd coset has no fixed lift and boundary 2 | Both directions pass. |
| §0.34 nonnormal cosets | Transposition subgroup of S₃ | Subgroup order 2, index 3; quotient set has 3 points despite nonnormality | Previous R07 repaired. |
| §0.34 nonconstant action | Inversion on C₆/{0,3} | Class 1 maps to −1=2 modulo 3, not 1 | Previous R07 repaired. |
| §0.34 stability failure | Swap coordinates on C₂², H=⟨(1,0)⟩ | Representatives 0 and (1,0) map to 0 and (0,1), different H-cosets | Correctly rejected; previous R07 repaired. |
| §0.37 gauge stabilizer | Neutral S₃ cocycle versus transposition C₂ cocycle | Stabilizer orders 6 versus 2; identity S₃ twist has stabilizer order 1 | Retain twisted invariants. |
| §0.37 kernel injectivity | A₃⊂S₃, trivial C₃-action | 3 domain H¹ classes map to 2 classes; classes 1 and 2 coincide in target | Correctly requires invariant-action condition. |
| §1 finite-cover classifier | G_m power map t↦t², characteristic zero | Finite étale degree=2; additive Qp group has no nontrivial finite quotient | Retain distinction from unipotent points. |
| §1.6 raw comparison | Spec algebraically closed field | π₁=1; positive-degree finite constant cohomology=0 on both sides | Retain. |
| §1.6 negative control | P¹ over algebraically closed field, ℓ invertible | H²(π₁,Fℓ)=0; H²_et(P¹,Fℓ)=Fℓ, dimension 1 | Correctly not K(π,1). |
| §1 coefficient class | Empty prime set | Only zero finite coefficients; every positive-degree group=0 | Restricted criterion vacuous as expected, not full K(π,1). |
| Curve effacement, R02 | A¹ over algebraic closure of F₂ | Class t≠0 in k[t]/(F−1); pullback t=y²−y has class 0 | Include this characteristic-two curve. |
| Curve effacement, R02 | Supersingular elliptic y²+y=x³ in characteristic 2 | H²_et(E,F₂)=0; connected étale degree-two covers=0 | Use residue-characteristic vanishing, not Kummer-cover existence. |
| Curve effacement, R02 | Same E, coefficients F₃ | H²=F₃; degree-three pullback on top degree is multiplication by 3=0 | Any-characteristic repair tested. |
| Prime-cover genus | Characteristic-zero genus 2, degree 3 étale cover | 2g′−2=3(2·2−2)=6; g′=4 | Retain. |
| Finite-family effacement | Empty family | Identity cover degree 1 kills all 0 requested classes | Retain quantifier order. |
| §2 tensor reconstruction | Finite-dimensional vector spaces over k | Tensor automorphism group=1; tensor-Isom torsor has 1 point | Retain imported reconstruction. |
| §2 nonneutral torsor | μ₂ over Q, square-root-of-2 torsor | Q-points=0; over Q(√2), points=2 | No rational point falsely assumed. |
| §2 word shuffle | Two copies of letter a | Shuffle a*a=2aa; concatenation aa has coefficient 1 | Retain distinction. |
| §2 inverse word | I=1+aA+bB+cAB+… | Coefficient AB in I⁻¹ is ab−c; product coefficient is c+(ab−c)−ab=0 | Retain inversion convention. |
| §2 finite length | Single generator T, quotient by T² | Δ(T²) mod T² has term 2T⊗T≠0 in characteristic zero | Correctly not a Hopf quotient. |
| §2 lower central depth | Additive group, depths 0,1,2 | Quotients 1,G_a,G_a; dimensions 0,1,1 | Retain indexing. |
| §2 Frobenius fixed point | φ(x)=2x versus φ(x)=x on G_a | φ(x)−x=x versus 0; equation with target 1 has one versus zero solutions | Fixed-vector exclusion matters. |
| §2 coefficient fields | Ramified K/K₀ of degree e, unit representation | dim_K D_dR=1; dim_K₀ D_cris=1; dim_K₀(K⊗D_cris)=e | Retain scalar extension. |
| §2.9 base point | x=b | Path/Kummer class=0; log_J([b−b])=0 | Retain. |
| §2.9 open depth one | G_m, b=1, x=1+p in a logarithm disc | Kummer period=log(1+p); normalized integral of dt/t=log(1+p) | Retain boundary-torus direction and sign. |
| §2.9 proper Hodge quotient | Proper genus 2 | dim H¹_dR=4, dim F⁰ of its dual=2, quotient dim=2=dim Lie J | Retain. |
| §3.5 centre-freeness control | S₃ and Q₈ | Centres have orders 1 and 2 respectively | Centre-free assertion cannot hold for arbitrary profinite groups. |
| §3.5 nonhyperbolic geometric group | Elliptic pro-p geometric group Z_p² | Centre=whole rank-two group, not 1 | Correctly excluded from hyperbolic theorem. |
| §3 Frobenius orientation | Tame relation at q=3 | Arithmetic F gives FτF⁻¹=τ³; inverse convention gives τ^(1/3) | Retain explicit arithmetic convention. |
| §3.10 extension pullback | Δ=S₃, Π=S₃×C₂ | Out(S₃)=1; Aut(S₃)×C₂ has 6·2=12 elements=|Π| | Retain. |
| §3.10 centre obstruction | Δ=C₂, Π=C₂, quotient=1 | Conjugation maps 2 elements to Aut(C₂)=1 element | Correctly excluded. |
| §3.11 general Hom | U=P¹−{0,1,∞}, identity | Degree 1; group image index 1; properness false | Previous R02 repaired. |
| §3.11 general source | C×A¹→C, C positive genus hyperbolic | Source dimension 2, target dimension 1; induced geometric π₁ map is identity in characteristic zero | Included by repaired general theorem. |
| §3.11 openness | Spec K→hyperbolic curve | Dominant morphisms=0; any section image has infinite index | Both sides exclude a section as an open Hom. |
| Lean Isom uniqueness | Proper genus-two curve, identity and hyperelliptic involution | Degree 1 each; induced H⁰(Ω¹) maps +I and −I | Two distinct equivalence classes, not a uniqueness contradiction. |
| §4.1 nilpotent coefficients | Dual numbers k[ε]/ε² | ε≠0, ε²=0; reduction sends ε to 0 | All-algebra requirement detects data lost on field points. |
| §4.1 noncommutative family | Heisenberg coordinates over dual numbers | (ε,0,0)(0,1,0) has central ε; reverse product has central 0 | Coefficient family cannot be replaced by additive coordinates. |
| §4.1 zero algebra | Affine unipotent group on the zero algebra | Unique algebra point; cocycle and H¹ sets each singleton | Harmless degenerate coefficient object. |
| §4.2 topology | Independent vectors e_n in the final finite-dimensional topology | Any finite-dimensional subspace meets {e_n} finitely; subset is closed discrete and infinite, hence not compact | Supports finite-dimensional containment argument without subsequences. |
| §4 representability | Trivial coefficient group, any G | Z¹=H¹=singleton; representing scheme Spec k, dimension 0 | Retain. |
| §4 finite-cohomology safeguard | Infinite product of Z_p with independent coordinate characters | Infinitely many linearly independent Qp-valued H¹ classes | Invariant vanishing alone cannot imply finite type. |
| §5 period quotient | p_H=p_φ, then change p_H by h∈F⁰ | Quotient representatives 1 and h give same coset [1] | Retain. |
| §5.3 disc nonvanishing | G_m at 1, p=3 | d(log t)/dt at 1=1; log(4)≠0 on 1+3Z₃ | Local map not constant. |
| §5.3 Weil restriction caution | Qp⊂K=Qp(√d) | Qp is K-Zariski dense in A¹_K; second coordinate is 0 in Res A¹=A²_Qp | K-density does not imply Qp-density in the restriction. |
| §5 exact versus closed image | Squaring G_m over Q₃ | 2 is not a Q₃-square; geometric image closure is all G_m | Retain only appropriate locus inclusion. |
| §5 reduced image equation | Spec k[ε]/ε²→A¹, t↦ε | t vanishes on reduced image {0}, but its scheme pullback is ε≠0 | Retain reduced-point qualification. |
| §5 empty image | Empty Selmer scheme | Annihilator f=1; pullback zero set empty | Retain. |
| §5.6 root bound | f(s)=s−a, |a|≤1 | Last maximal coefficient index N=1; distinct roots=1 | Pass; locator repair R06. |
| §5.6 unit/zero series | f=1 and f=0 | For 1: N=0, roots=0; for 0: every O_K point is a root, N unavailable | Nonzero hypothesis necessary. |
| §5.6 ramified chart | f(t)=t, t=πs | f(πs)=πs; N=1 and one root; replacing π by p changes coefficient π to p | Retain actual uniformizer. |
| §5.7 density necessity | Target A¹, closed image {0}, j(t)=t versus j=0 | Pullback of t has 1 zero versus all O_K as zeros | Nonvanishing condition excludes false finiteness. |
| §5.7 finite cover of charts | Two compact charts with bounds N₁=1,N₂=2 | Union has at most 1+2=3 roots | Retain finite residue-field/chart input. |
| §5 logarithm radius | p=2, point −1=1−2 | log(−1)=0 but −1≠1; deeper disc 1+4Z₂ excludes −1 | Retain strict injectivity radius. |
| §5.11 Selmer versus MW | g=2, W_MW=0, W_S=Qp² | Annihilator dimensions 2 versus 0; full Selmer locus is all local curve | Rank bound alone does not give Selmer finiteness. |
| §5.11 equality condition | W_MW=W_S a line in Qp² | Both annihilators dimension 1 and identical; both locus equations identical | Retain conditional equality. |
| §6.1 class/groupoid distinction | G=1, two trivial graded lines | H¹(1,G_a) has 1 class; split extension automorphisms indexed by λ∈k | Class bijection does not kill automorphisms. |
| §6.1 isotropic splitting | Symplectic a₁,a₂,b₁,b₂ | Pairing(b₁,b₂)=0; pairing(b₁+a₂,b₂)=1 | Isotropic complement condition necessary. |
| §6.1 away height | Uniformizer π and unit u at v≠p | ord(π)=1, ord(u)=0; height values χ(π),0 | Retain local normalization. |
| §6.2 rank bound | g=2, ρ_Q=2, r=2 or 3 | 2<2+2−1=3 true; 3<3 false | Retain strict inequality. |
| §6.2 zero correspondence | Correspondence class 0 | Cup and trace are 0, but required nonzero class condition fails | Avoids vacuous central quotient. |
| §6.5 divisor correction | Degrees Δ*Z=5, i_b*Z=2, i_x*Z=1 | Correction coefficient 2+1−5=−2; total 5−2−1−2=0 | Retain sign. |
| §6.5 local formula | γφ=7, γFil=1, α=(1,2), βφ=2·pr₁, βFil=3·pr₂ | 7−1−βφ(1,0)−βFil(0,2)=7−1−2−6=−2 | Retain. |
| §6.5 projection order | Swap the two projections in preceding row | Both cross evaluations become 0; result 7−1=6, not −2 | Wrong projection convention excluded. |
| §6.5 changed top-right entry | Increase γφ from 7 to 8 | Height −2→−1, difference 1 | Detects the height coordinate. |
| §6.6 signed correction | One away height 3; global height 7, p-height 4 | θ−h=4−7=−3; correction set {−3}, not {3} | Retain. |
| §6.6 empty away set | No away terms | Empty sum=0; correction set {0}, not empty | Retain. |
| §6.7 determinant, m=0 | θ=7, α=2 | det(7−2)=5; residual=5 | Retain as README Check only. |
| §6.7 corrected anchors | Rows (5,2),(10,4) | det=20−20=0; anchor functional value on feature 2 is 5 | Retain. |
| §6.7 omitted corrections | Rows (7,2),(9,4) | det=28−18=10, versus corrected 0 | Separate residual subtractions necessary. |
| §6.7 dependent feature | Both feature entries zero, candidate residual 7 | Determinant=0 although residual=7≠0 | Basis hypothesis excludes spurious equation. |
| §6.7 balanced tensor | K_p=Qp×Qp, W=K_p | Balanced dimension 2, ordinary tensor dimension 4; e₁⊗e₂=0 only in balanced tensor | Retain balancing law. |
| §6.8 character change | Multiply χ by 2, away height 3 | Residual −3→−6; correction {−3}→{−6}; membership preserved | Retain nonzero scalar. |
| §6.8 zero character | χ=0 | All heights and residuals=0; zero locus whole curve | Correctly excluded for finite height equations. |
| §7 arithmetic supplier | Q, K₃ and K₅; Q(i), same degrees | Ranks (0,1) and (1,1); positive even ranks 0 | Earlier owner supplies these, previous R03 repaired. |
| §7 Soulé parity | Q, Tate exponents k=2,3 | H¹ dimensions 0,1; H² dimensions 0,0 | Retain k≥2 and separate k=1. |
| §7 extra prime | ℓ=2,k=2 versus k=1 | ℓ^(k−1)−1=1 versus 0 | Weight-one case cannot use same invertibility argument. |
| §7 section classes | C₃⋊C₂ with inversion | 3 cocycles/sections, one conjugacy class | Retain sections modulo geometric conjugacy. |
| §7 Kummer coefficient | Multiplication n=1 | Torsion A[1]=0; Kummer class=0 | Retain. |
| §7 characteristic-p Kummer | Supersingular elliptic, n=p | Multiplication p has inseparable part; étale-kernel hypothesis false | Correctly requires invertible coefficient order. |
| §7 free Lie | Two generators, n=1,2,3 | Witt dimensions 2,1,2; n=2 gives (4−2)/2=1 | Retain; n=0 is not a division formula. |
| §7 surface relation | Proper genus 2, degree 2 | Free dimension (16−4)/2=6; one relation gives 5 | Retain relation. |
| §7 open conjugation | P¹−3 with real punctures, n=1,2 | (dimension,trace,negative dimension)=(2,−2,2),(1,1,0) | Half-dimension shortcut fails in open case. |
| §7 weight splitting | Exact extension with W₀V=0 | W₀E→Qp has kernel 0 and cokernel 0, hence rank 1 | Retain strictness input. |
| §7 pseudo-nullity | Z_p[[T₁,T₂]]/(p,T₁) | Infinite Fp dimension; rationalization 0 | Rational finiteness does not assert integral finite generation. |
| §7.5 existing S-unit theorem | S empty versus S={2} | x-set empty versus {−1,1/2,2}; pair-set sizes 0 versus 3 | Existing owner cited; previous R04 repaired. |
| §7.5 new dimension bound | P¹−3, S={2}, depths 1,2 | Selmer bounds 2,2; de Rham dimensions 2,3 | Equality at depth 1 insufficient; strict inequality at depth 2. |
| §7.6 root-of-unity test | p=3,5,7 | Primitive sixth roots in Qp: 0,0,2; at p=7 residues 3,5 | Split-prime depth-two case retains dilogarithm nonvanishing input. |

### Pinned objects and ownership checks

Object searches covered continuous cocycles, gauge orbits, quotient topology, torsors, finite quotient cohomology, finite étale cover categories, genus, generalized Jacobians, tensor reconstruction, Coleman words, formal logarithms, mixed extensions, restricted series and arithmetic K-groups. These were searched by their mathematical data as well as by identifier. The following eight pinned interfaces were opened directly; their restrictions matter here:

| Pinned file and line | Interface and what it does not supply |
|---|---|
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:620–625` | `groupCohomology.IsMulCocycle₁` has commutative coefficient-group hypotheses; it supplies neither S₃-valued cohomology nor continuity. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:461–478` | Continuous Z¹, Z² and B² use additive abelian coefficients; the cochain differential fixes the additive obstruction sign. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean:572` | `explicitFiniteQuotientColimit1` is an abelian categorical colimit. It is a comparison input, not the nonabelian pointed-set colimit. |
| `Mathlib/Topology/Algebra/Group/Quotient.lean:38–52` | Canonical quotient maps have the quotient/open-map topology. This does not make every continuous surjective homomorphism a quotient map. |
| `Mathlib/GroupTheory/QuotientGroup/Basic.lean:159` | `quotientKerEquivOfSurjective` is the algebraic quotient equivalence; inverse continuity needs its own argument. |
| `Mathlib/Topology/Algebra/Group/Torsor.lean:35` | `IsTopologicalTorsor` supplies continuity of the action and division. It does not itself impose Hausdorffness. |
| `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64–80` | Genus is defined through coherent cohomology finrank. The acceptance theorem explicitly retains the finite-dimensionality hypotheses rather than relying on finrank's junk value. |
| `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:40–61` and `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:39–70` | The actual scheme morphism properties are used in the elaborated finite-étale cover category. Their base-change instances are explicitly installed in the theorem. No surrogate finite-set carrier is substituted. |

The last row was also checked through the successful elaborated signature; all eight rows have direct source-line witnesses. The absence assertion in R01 is against the pinned Tau Ceti source tree, not against a newer checkout.

The 42 named supplier roadmaps were retrieved from main where present, otherwise from the supplied open heads. The dependency lines and the worker's eight unresolved-citation leads were inspected. Four of those leads are the own mixed-extension names in R03. The other four resolve to actual roadmap targets, rather than missing pinned declarations:

| Citation reopened | Resolved location and contract |
|---|---|
| AlgebraicVectorBundles “Layers 0” | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215` and `:228`, Layers 0A and 0B. The resolver's literal-heading failure is not a missing supplier. |
| `GaloisRep.deRhamSupplierEquiv` | FiniteFlatGroupsAndIntegralPadicHodgeTheory, §R07.P3, `README.md:1554`: filtered de Rham comparison with the specified scalar fields and finite-base-change compatibility. It is a planned supplier target. |
| `VanishingCycles.etaleKunneth` | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:647`, §F.2.6. It is a supplied cohomological target, not alleged existing Mathlib code. |
| `SmoothGroup.formalIdentityChart` | HeightsRationalPointsAndObstructions, `README.md:806`, with formal logarithm at :816. The supplier retains complete-DVR, smooth-group and convergence-radius hypotheses. |
| Arithmetic finite generation/ranks | ArithmeticKTheory §§3.2–3.4, `README.md:916`, :1104 and :1156. Building/Steinberg finiteness, finite-S comparisons and Borel ranks are earlier inputs; the higher étale Chern bridge remains here. |
| S-unit finiteness | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2936`, §4.5. This is the existing owner of the removed arithmetic acceptance theorem. |
| Restricted series/Strassmann | `TauCetiRoadmap/RestrictedPowerSeries/README.md:364–370`, §2.4. It supplies the general-radius theorem and complete isometric field extensions; the compact residue-chart application is retained here. |
| Neutral tensor reconstruction and fibre-functor torsors | MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8, `README.md:1100`, :1114, :1133 and :1213. The general reconstruction is imported; the geometric unipotent realization and path conventions are the retained specialization. |
| Continuous Aut/Out | `TauCetiRoadmap/Completed/ProfiniteArithmetic/README.md:443–514`, §2.1. The congruence topology is supplied; the centre-free arithmetic extension pullback is a separate theorem here. |
| Coleman words and uniqueness | ColemanIntegration §§L1.12, L1.18 and L1.22–L1.23, `README.md:887`, :1040, :1133 and :1143. Word/shuffle and continuation/Frobenius hypotheses were reopened. The tensor-dual word realization here is not a second construction of the analytic integration carrier. |
| Abelian Kummer/Selmer/Sha | SelmerIwasawaCohomology §2.12a, `README.md:675`, and its Layer 4 conditions. This supplies the abelian inputs; it does not assert the equality of Mordell–Weil and full Selmer spaces without a Sha condition. |

Open-head locations in this table refer to the roadmap files themselves, excluding the display header inserted by the show tool. This table records resolved contracts with their actual hypotheses; the graph check alone was not used to certify their content.

Ownership searches also included the board packages and the accessible open-roadmap files. In particular:

- `packages/ColemanIntegrationPartII/README.md:7` and :76 consume this roadmap's finite-field-model abelian logarithm, and add arbitrary-Cp-coefficient integration. `packages/TropicalAndBerkovichArithmetic/README.md:13` and :77 likewise consume that logarithm. They are consumers, not suppliers to be added here.
- `packages/EllAdicHomotopyTypesAndWeights/README.md:13` and :131 consume the geometric unipotent group and compare it to minimal models. That later comparison does not replace this roadmap's earlier unipotent construction. Its raw-homotopy suppliers were not silently substituted for the finite-coefficient K(π,1) comparison here.
- The generalized-Jacobian search found stable/nodal Jacobian and Raynaud interfaces in NeronModelsAndSemistableAbelianVarieties and JacobianChallengePartII. Those do not by themselves construct the reduced-modulus Jacobian of every open curve with its path/Tate/de Rham comparisons. The retained adapter has a distinct object and hypotheses.
- The mixed-extension search found downstream uses and unrelated mixed-cohomology constructions, not a second earlier owner of the filtered unipotent torsor/height interface. Scheme-sheaf or discrete nonabelian H¹ in other roadmaps is not the continuous topological/algebra-valued H¹ defined here.
- Searching the retained fully qualified theorem name found no other roadmap owner. No second declaration of the acceptance theorem was introduced.

The README has the required scope, conventions, supplier contracts, build guide and eight ordered layers with examples and dependencies. The checked proof routes retain the distinction between algebraic and topological quotient maps, raw and completed étale types, field points and all coefficient algebras, crystalline and semistable conditions, exact and closed Selmer images, and classical versus Selmer Chabauty. R03–R06 identify concrete remaining shape/source defects rather than asking for more Lean API padding.

## Not verifiable

- **Hadian's thesis:** the cited German National Library endpoint returned HTTP 404. The source-service title search found the later Duke article, whose landing page did not provide the thesis text. The thesis-specific universal Hodge-filtration locators were not certified. A later paper is not a substitute for the cited thesis numbering.
- **Labute 1967:** the legal GDZ volume URL yielded catalogue HTML rather than the article, and the source-service title search did not locate readable article text. The specific one-relator source proof remains unverified; the low-degree dimension computations above are independent tests, not a source verification.
- **Achinger's published article, Serre's Algebraic Groups and Class Fields Chapter V, and Stix 2013:** the service classified the relevant publisher copies as uncertified. Those published locators remain uncertified. The readable Achinger preprint does not certify the version-of-record numbering. These settled paywalled items were not added as renewed missing-text requests.
- **Kim 2008:** arXiv:0804.1008v1 was readable; the cited published DNB endpoint returned HTTP 404. Published and preprint pagination were not fully collated. Statements depending specifically on the published survey's page numbering are not represented as verified from that version.
- All 47 bibliography entries were submitted to the sources service, with legal-author/publisher retries where needed. Retrieval is not certification of every locator. In particular, the seeded depth-one bridge's generalized-Jacobian portion retains the Serre limitation above. No README locator was explicitly labelled “unverified” or “uncertified”; the limitations here come from the actual source checks.
- The concrete table covers all 15 seeded sections, the headline families and all mathematical finding witnesses. It is not a separate exhaustive countermodel search for every auxiliary API bullet in the 9,161-line README. The eight-layer inspection, object searches and resolved-contract witnesses likewise do not certify every nested supplier proof. No clean whole-folder mathematical certificate is claimed, and the passing sorry build is not used as one.

The unresolved-text inventory retains Hadian and Labute, with places tried. Failed initial fetches that subsequently succeeded were removed from that inventory. No source manifest, source text or PR file was changed. This review is complete with the needs-changes verdict above; it is not parked awaiting a text.

## Source issues

- **Gap** in kim2005 at Lemma 4, preprint p. 3: the source says compactness supplies a convergent subsequence of independent vectors; it should use a closed-discrete-subset argument or justify sequential compactness; affects the proof.
- **Misprint** in kim2009 at §1 setup, printed p. 92: the source says the valuation defining the p-adic realization is archimedean; it should say nonarchimedean; affects nothing.
- **Misprint** in kim2009 at §3 Comments I, printed p. 121: the source says the vanishing function belongs to the étale quotient by the Hodge filtration; it should place it on the de Rham quotient; affects nothing.
