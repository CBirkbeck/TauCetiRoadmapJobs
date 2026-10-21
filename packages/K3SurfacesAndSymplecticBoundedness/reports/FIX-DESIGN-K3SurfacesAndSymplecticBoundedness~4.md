# Design repair: K3 surfaces and symplectic boundedness

## F01 (P1) — applied

Implicit later K3 inputs → independent §§6.0–6.0c before §6.1, explicit rank-at-least-21 ⇒ rank-22 and Jacobian interfaces, and complete nonsquare-determinant prerequisites. Former §§6.7, 6.7a–6.7c are renumbered; §6.7d stays after the fixed-point table. Updated consumers, source section references, gap consumer lists and Layer 6 dependencies. Added `rank21_excluded`.

Evidence: dolgachev-keum lines 465–470 require the rank-22 Picard discriminant. Lines 493–505 require the Jacobian K3 and its vertical root lattice. Artin's height inequality is artin-supersingular line 40; its elliptic rank theorem and Jacobian comparison are lines 192 and 204–210. Finite height excludes rank 21; infinite height plus the rank-five pencil gives rank 22, including the quasi-elliptic branch. For the Jacobian, the section–fibre plane and rank-zero Mordell–Weil discriminant relation give `det R(J)=m²p^(2σ′)`, contradicting the prime-to-p determinant. Those general genus-one comparison requirements are explicit in the existing genus-one supplier gap.

## F02 (P2) — applied

Unrestricted smooth-complete-intersection connectedness → positive-dimensional intersections of an ordered regular sequence of ample effective Cartier divisors. The unrestricted regular-immersion conormal/Koszul inputs have separate existing suppliers. Added both disconnected negative controls and verified the quartic and Wehler hypotheses in the contract and consuming Checks. Synchronized `needs` and `detail`.

Evidence: sga2 lines 4277–4287, Exposé XII Corollary 3.5, p.120, proves connectedness for a regular ample cut with depth at least two. Iteration applies because intermediate complete intersections are Cohen–Macaulay and have dimension at least two before each cut. Apply after algebraic closure. The divisor of bidegree (2,0) in ℙ¹×ℙ² fails ampleness; the two-point divisor in ℙ¹ fails positive dimension. The conormal calculations at huybrechts lines 160–166 and 12221–12231 remain application locators.

## F03 (P2) — applied

New finite-field Brauer comparison gap → the composite of SchemeAndStackFoundations §§2.10, 2.15 and the inverse of pinned `TauCeti.brauerCohomologyEquiv`, followed by pinned finite-field triviality. Deleted `gap:galois-brauer-descent`. Updated §§4.6, 8.5 and their plan prerequisites. The independent finite-descent proof of Picard-action continuity is preserved.

Evidence: SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison` applies to smooth G_m in every degree; §2.15 `etale_galois_comparison` applies in degree two. At pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` defines `TauCeti.brauerCohomologyEquiv` on `Additive (BrauerGroup K)`. `TauCeti/Algebra/BrauerGroup/Trivial.lean` states `subsingleton_brauerGroup_of_finite [Finite K] : Subsingleton (BrauerGroup K)`. Both files were read at that pin; discovery search results at later commits were not used as evidence for the pin.

## F04 (P2) — applied differently

Requested construction of Hochschild–Serre → the existing SchemeAndStackFoundations §2.15 theorem. Narrowed equivariant Brauer descent to Kummer/restriction compatibility of its filtration and edge maps, retaining units and differentials. Deleted the rational quotient-invariants gap: finite-level descent and the existing adic realization already derive that formula. Updated both consumers and layer dependencies.

Evidence: `hochschildSerre_galois_covering` covers every abelian étale sheaf on a finite étale G-torsor, including G_m. For ℤ/ℓⁿ coefficients, EtaleCohomologyFoundations F.4.2–F.4.6 supply derived inverse limit, finiteness, rationalization and equivariance. Finite group cochains use finite products; after rationalization the averaging projector makes invariants exact. Thus no additional general quotient-cohomology theorem needs a supplier. The derivation retains Rlim and allows ℓ dividing |G|. Dolgachev-keum lines 599–615 support the K3 application, not a sequence with units omitted.

## F05 (P2) — applied

Characteristic-zero vanishing requested from a new bundle gap → AlgebraicModuliForArithmeticGeometry §9.10 `algebraicAdjointVanishing`. Updated the supplier inventory, §7.4, plan prerequisites and Layer 7 dependencies. The remaining gap owns adjoint separation in both characteristics and positive-characteristic vanishing with the stated Terakawa hypotheses.

Evidence: the supplier statement was read at commit `98fd03823a4797777f298cf65d50ff0cafb51c43`. An integral nef big divisor has empty fractional support and its round-up is itself. Consequently the supplied smooth-projective characteristic-zero statement gives Hⁱ(K+A)=0 for i>0. The positive-characteristic K3 application remains inside Terakawa Theorem 1.6, terakawa line 183; no positive-characteristic Kawamata–Viehweg assertion is introduced.

## F06 (P3) — applied differently

Application-only or absent general locators → exact general references or derivations from named supplier statements. Replaced Liu by Stacks 0C5P, added six legally read sources, distinguished the primary Shioda locator as uncertified, and added Mukai's group-order locator. Original source authors, access records, certification states and waivers are preserved; necessary section references and the supplementary Mukai locator are updated.

| Contract | General evidence and resulting boundary |
| --- | --- |
| Projectivity | Stacks Lemma 54.16.11, tag 0C5P, stacks-surface-resolution line 2327, covers proper regular surfaces over Noetherian bases. Its proof uses 0C2N–0C5N, lines 2274–2326. This replaces the unread Liu citation. |
| Complete intersections | SchemeAndStackFoundations §5.5 `conormal_regular`, §2.20 regular-section Koszul comparison, JacobianChallenge Layer C, and sga2 line 4277. Connectedness receives the hypotheses in F02. |
| Arithmetic numerical quotient | SchemeAndStackFoundations §5.9 `Chow.intersectionNumber`, §5.6 `projection_formula`, and §5.2 flat base change give the defining relation and comparison. For finite K/k, the formula is `[K:k](D_K·C′)_K=(D·π_*C′)_k`. Added a real/complex line Check to fix this factor. |
| Quotient and resolution | Quotient existence is imported from SchemeAndStackFoundations §1.17 `finiteGroupQuotient_projective`; it is no longer requested again. Normality follows on invariant affine rings. Resolution is Stacks 0BGP, stacks-surface-resolution line 1880; contractions and projectivity use 0C2N and 0C5P. Canonical and coherent comparisons are maps, without asserting wild higher-direct-image vanishing. |
| Tame ADE resolution | Liedtke arXiv v2 §4.6, Definition 4.11 and Theorem 4.12, liedtke-mckay lines 786–815; Theorem 4.5 at line 650. Rational Gorenstein quotients are rational double points. Rationality gives R¹π_*O=0; adjunction and negative definiteness force zero discrepancy. The group-order/determinant calculation remains dolgachev-keum lines 450–463. |
| Quotient transcendental comparison | Shioda (1986), Proposition 5, DOI 10.2307/2374678, is recorded as an uncertified published locator. Keum lines 305–325 and dolgachev-keum lines 590–594 remain explicitly secondary applications. No unread primary text is certified. |
| Birational two-forms | Stacks 0C5R–0C5S, stacks-surface-resolution lines 2335–2399, plus SchemeAndStackFoundations §0.4 `reflexive_extension_normal`: a form descends off the blowup centre and extends across codimension two. On a ℙ¹-bundle, Ω² restricts to O(−2) on a fibre. Rizov line 1075 is retained as an application. |
| General Brauer–Kummer | SchemeAndStackFoundations §2.11 Kummer and EtaleCohomologyFoundations F.4.2–F.4.5 yield the direct-limit and coefficient-triangle sequences. The finite term is H³(ℤ_ℓ(1))[ℓ∞]; only the abstract divisible group is identified with a standard power, without a canonical equivariant splitting. Dolgachev-keum's K3 formulas remain application locators. |
| Equivariant Brauer and finite quotient invariants | The explicit supplier derivations in F04 replace duplicate construction requests; Kummer/restriction compatibility remains a named gap. |
| Formal Brauer | Artin–Mazur II Corollaries (4.1)–(4.4), artin-mazur-formal lines 902–938, give representability and realization. II (1.3)–(1.4), lines 658–685, describe infinitesimal units. Pullback and determinant norm give functoriality and degree; Stacks 0AGS, stacks-surface-resolution lines 289–295, and factorization give blowup/birational comparison by induction on the nilpotent ideal. Nygaard's degeneration locator is retained for that assertion alone. |
| Crystalline Gauss–Bonnet | CrystallineCohomology CR.3:duality.1 diagonal coevaluation, combined with Gros IV Theorem 2.1.1, gros-chern line 2317, and its crystalline comparison III §2.1, line 1950. The diagonal normal bundle is T_X, so self-intersection and the coevaluation Euler trace give the identity for smooth proper varieties. Deligne's K3 calculation is explicitly an application. |
| Crystalline degree one | Illusie II Proposition 3.11 and Remark 3.11.2, illusie-witt lines 4202–4223, give the general Picard/Albanese comparison. The covariant Picard convention is specified. Deligne's K3 calculation remains an application. |
| Mathieu orders | Mukai §3, p.201, mukai line 756, gives the order of M₂₃. Index 24 gives the order of M₂₄. The character table remains Mukai (0.2). |

The sources service obtained Artin–Mazur, Illusie, SGA 2, Stacks, Liedtke and Gros legally. Their read versions and exact locators are in `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`. Liu's DOI fetch failed with HTTP 403; the Stacks replacement settles that need. An initial unused Shioda 1975 lead failed; the actual cited reference is the 1986 work identified in Keum's bibliography. Its DOI fetch reached JSTOR without obtaining readable text, so the manifest records only the published locator as `uncertified`, as permitted by the brief. No outstanding missing-text request remains. Existing waived references were not reopened.

## F07 (P3) — applied

Missing first-consumer edge → `gap:ample-space-scheme` in §7.3's Needs, the target's plan prerequisites, Layer 7 dependencies, and the gap's Required by/neededBy lists. The criterion is consumed by `PolarizedK3Family.localRepresentative` before its uses in §§8.2 and 8.5.

Evidence: choosing a local relatively ample representative on a proper algebraic-space family is precisely the input to the existing declared criterion. No field-only scheme criterion can replace this arbitrary-base edge.

## Checks

The required dependency gate exited 0 with this exact output:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge-order file and tooling were not edited. This check's three available candidates do not replace the mathematical prerequisite audit above.

JSON and TOML parsing passed. The consistency audit found 60 target headings in plan order, 84 API entries, 187 target Checks, 28 supplier gaps and 25 source entries. Every target/API/Check name occurs in the README; every target dependency points to an earlier target; gap `needs`, `detail` and consumers agree between files; source identifiers and required source metadata are present. No old §§6.7–6.7c references, deleted gap references or machine paths remain in the deliverables. `git diff --check` passed.

Lean elaboration was not run: this design package has no `Suggested.lean`, it is outside the editable file list, and the brief supplies no executable Lean check. No Lean result is claimed. The new K3/Jacobian signatures require the roadmap's geometric carriers and remain README targets.

Read the main IntegralLattices, JacobianChallenge, GlobalQuadraticForms and relevant SchemeAndStackFoundations/EtaleCohomologyFoundations sections. The ArithmeticDynamics and ErdosProgressionPowers package scopes add no overlapping K3 target. The changed library contract was read at the pinned Tau Ceti commit; the additional supplier adjoint statement and crystalline diagonal statement were read at their identified new-roadmap commits.

## Adversarial mathematics pass

Each target row covers its statement, API and defining conventions. These are mathematical substitutions and interface checks, not implementation proofs or independent acceptance.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Intersection, half-norm and sign | Quartic H; rational C; zero | H²=4, Q(H)=2; C²=−2; rank-22 determinant negative | Preserved |
| Pullback and contraction | Identity; two composites; e₁,e₂; p=2 | Pullback reverses order; contraction sends e₁ to e₂* and e₂ to −e₁* | Preserved |
| Twists and exponential | Point; quartic; unit circle | Trace 1, cup square 4, exponential lift increment +1 | Preserved |
| §1.1 | Empty, plane, abelian surface, quartic | The five conditions separate all four | Preserved |
| §1.2 | Identity, tower, inseparable extension | Faithful scalar extension detects canonical triviality | Preserved |
| §1.3 | Imperfect field; dimension three | Smooth surfaces are regular; no higher-dimensional projectivity claim | General locator replaced |
| §1.4 | O; quartic H; p=2 | 2χ=4,8; alternating contraction remains invertible at 2 | Preserved |
| §1.5 | O; torsion; effective (−2)-curve | RR and ample intersection kill only the trivial numerical class | Preserved |
| §1.6 | t=0,1; Fermat at 2; two points in ℙ¹ | χ=2,4; nonreduced Fermat; dimension-zero connectedness fails | Boundary Check added |
| §2.1 | Field fibre; rank jump; zero class | Unramified relative Picard need not be flat/étale over the base | Preserved |
| §2.1a | Zero kernel candidate; p=2; finite height | Nonzero witness required; finite height has a different proof | Preserved |
| §2.2 | Zero form; Cartier iterates; p=2 | K3 argument does not assert general surface degeneration | Preserved |
| §2.3 | Abelian surface; characteristic zero; p=2 | H¹(O) excludes abelian example; Oda retains its domain | Preserved |
| §2.4 | Degrees 0–4 and outside; p=2 | Euler 24; rational ranks alone do not establish integral freeness | General sources repaired |
| §2.5 | Dual numbers; unmarked automorphisms | Marked tangent dimension 20; no fine unmarked functor inferred | Preserved |
| §2.6 | L=O; p divides 2d; good degree | O has dimension-20 locus; bad primes retain flatness only | Preserved |
| §2.7 | p=2; ramified trait | A suitable ramified lift is allowed | Preserved |
| §3.1 | Empty manifold; torus; quartic | Nonempty compact connected surface and H¹ condition discriminate | Preserved |
| §3.2 | Projective embedding; nonprojective analytic K3 | Algebraic essential image is the projective analytic locus | Preserved |
| §3.3 | Torsion candidate; quartic; exponential circle | Picard torsion-freeness and duality eliminate integral torsion | Preserved |
| §3.4 | ℓ=p; ℓ=2≠p; point trace | Exclusion and twists remain necessary | Preserved |
| §4.1 | Identity; algebraically closed extension; Brauer obstruction | Rational and integral descent remain distinct | Preserved |
| §4.2 | Gram [4]; zero; rational curve; ℂ/ℝ | Pairing stays integral and even; finite pushforward carries degree factor 2 | Degree Check added |
| §4.3 | Rank zero; geometric closure; supersingular rank 22 | Ample class excludes zero; h¹¹ is not Picard rank | Preserved |
| §4.4 | Multiplication by ℓ; rank 22; characteristic zero | Equal rank needs saturation; characteristic-zero bound is 20 | Preserved |
| §4.5 | n=0,1; ℓ=2,3; I+3E₁₂ | Dyadic −1 is torsion; unipotent positive powers remain nontrivial | Preserved |
| §4.6 | Closed field; imperfect field; finite field; rational point | Finite basis gives open kernel; obstruction comparison is supplied | Duplicate gap deleted |
| §5.1 | Identity; product; rescaled volume; −1 at 2 | Kernel is inverse-pullback kernel; −1=1 at 2 | Preserved |
| §5.2 | Identity; scalar line isomorphism; Lⁿ | Scalars add no automorphisms; Picard torsion-freeness compares stabilizers | Preserved |
| §5.3 | Nontrivial involution; nonclosed field; p=2 | Finite étale does not mean trivial or all points rational | Preserved |
| §5.4 | Two involutions; their product; nonample divisor | Determinant −12, product trace 14 and determinant 1; positivity matters | Boundary Check added |
| §6.0 | σ=0,11; p=2 | Milgram excludes endpoints; rescaled evenness is explicitly supplied | Moved before quotient |
| §6.0a | h=1,10,11; infinite height | Bounds 20,2,0; infinite height is not substituted as an integer | Moved before quotient |
| §6.0b | Rank one; F and 2F; p=2,3 | Primitive nef isotropic class required; quasi-elliptic branch retained | Moved before quotient |
| §6.0c | No section; rank 21; quasi-elliptic pencil | Jacobian comparison and rank-21 exclusion close both branches | Named APIs and Check added |
| §6.1 | G=1; involution; root rank 20 | Empty determinant 1; 2⁸ for eight A₁; rank-20 proof needs K3 discriminants | Dependencies repaired |
| §6.1a | n=2,4,11,15 | 24=8·3; 72=4·15+2·2·3; extra candidates have square determinant | Repaired prerequisite inherited |
| §6.2 | Identity; order 2,7; wild element | Identity excluded; counts 8,3; wild table not asserted | Repaired prerequisite inherited |
| §6.2a | Empty locus; κ=0,1; D²=2,d=1 | Free characteristic-two branch retained; zero denominator gives no prime bound | Preserved |
| §6.3 | Rational quotient; free C₂ at p=2 | Rational H² algebraic; free quotient has e=12 and b₂=10 | Existing rational descent imported |
| §6.3a | p=11,13; quasi-elliptic p=2,3 | Exceptional p=11 branch and small-characteristic pencils retained | Preserved |
| §6.4 | p=2,13; nonsymplectic subgroup | Order-p elements are symplectic; p=13 forces tameness | Preserved |
| §6.4a | Identity; p=2; degree-two deck involution | Full Picard action and rank 22 essential | Preserved; waived source status unchanged |
| §6.5 | ℓ=p; free Enriques; rational quotient | Invariant-rank contradictions use correct coefficient restrictions | Existing descent imported |
| §6.6 | Trivial group; characteristic 3; wild subgroup | ℓ=5 works at characteristic 3; no averaging in group order | Preserved |
| §6.7d | Identity; swapping integral involution; p=2,3 | Integral involution need not be identity mod 2; small-characteristic branch retained | Existing target retained with narrower descent gap |
| §6.8 | p=3; disc −9,+9,−81; rank 20 | Predicate tests signed determinant and rank 22 | Section references updated |
| §6.8a | Trivial group; C₇; order 21; exceptional pair | Invariants 24,6,6; exceptional pair has no universal five bound | Earlier rank/discriminant closure repaired |
| §6.9 | n=1,2,7; wild element | Empty product gives 24; character values 8,3 | Preserved |
| §6.10 | Trivial subgroup; involution; 23-cycle | Orbit counts 24,16,2; containment does not assert realization | Order source supplemented |
| §6.11 | Characteristic 2; even tame order; exceptional branch | Tame order odd at 2; ℚ₂ used only when available | Preserved |
| §7.1 | Zero; generator; double; squarefree d | Zero/double fail primitivity; n² divides d in divisible ample case | Preserved |
| §7.2 | n=0,3; characteristic 3 | Zero excluded; cube-root locus remains closed at 3 | Preserved |
| §7.3 | Constant family; d=0; obstructed representative | Local representative needs arbitrary-base ample-space criterion | Missing edge added |
| §7.4 | m=0,1,−1; d=2; p=2 | Positive m only; h⁰ values 4,10,20; Terakawa domain retained | Characteristic-zero supplier corrected |
| §7.5 | d=1,2; p=2 | Cube dimensions 10,19; evenness excludes D²=1 obstruction | Preserved |
| §7.6 | Smooth quartic; singular degeneration; nontrivial rank-one line | Canonical-class equality is stronger than rank equality | Preserved |
| §7.7 | Characteristic 3; frames; no global root line | Root section and local projective frames retain all primes | Preserved |
| §8.1 | Nontrivial stabilizer; p divides 2d | DM groupoid retains automorphisms and all-prime finite-type atlas | Preserved |
| §8.2 | Generic identity; ruled special fibre; absent smooth model | Extends isomorphisms of given families; ruled hypothesis essential | General two-form proof supplied |
| §8.3 | Stabilizer; distinct k-forms | Geometric coarse points do not identify rational forms | Preserved |
| §8.4 | d=1; prime dividing 2d | Smoothness only over stated localization | Preserved |
| §8.5 | Fixed k,d; twists; representative obstruction | Every actual object receives a frame after Brauer vanishing | Duplicate gap deleted |

The supplier-contract pass also retains all stated general domains:

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| surface-projectivity | Imperfect field; dimension three | Regular surface criterion applies; no dimension-three claim | Stacks replacement |
| hypersurface-cohomology | Two fibres; two points; two K3 intersections | Positivity and positive dimension both necessary | F02 |
| surface-arithmetic-quotient | Finite extension of degree two; geometric curve descending finitely | Pushforward has degree factor; two pulled-back divisor intersections unchanged | Derivation and witness |
| surface-quotient-resolutions | Trivial group; wild group | Invariant normality and resolution require no averaging | Existing quotient imported |
| tame-quotient-singularities | A₁; E₈; p dividing local order | ADE determinants 2,1; wild case excluded | General resolution source |
| quotient-transcendental-comparison | Trivial group; cyclic quotient; ℓ dividing order | Rational statement retained, without integral averaging | Primary locator marked uncertified |
| ruled-surface-two-forms | Point blowup; ℙ¹-bundle | Hartogs comparison and fibre O(−2) give the assertions | General proof supplied |
| matsusaka-mumford | Generic identity; ruled special fibre | Non-ruledness essential | Existing waiver preserved |
| ample-space-scheme | Relative ample representative over nonfield base | First used by localRepresentative | Consumer edge added |
| elliptic-surface-geometry | Index 1,2; no section; p=2,3 | Index multiplier 1,4; Jacobian and quasi-elliptic cases retained | Comparisons made explicit |
| rational-surface-cohomology | ℙ²; inseparable dominant map | Nonzero degree invertible in ℚ_ℓ | Preserved |
| adjoint-positivity | m=0; nef big integral class; characteristic 2 | Vanishing needs positive powers; Terakawa restrictions retained | Earlier zero-characteristic owner imported |
| tame-lefschetz | Identity; isolated tame point; wild element | Euler version accommodates identity; wild hypothesis excluded | Preserved |
| surface-brauer-localization | Missing points; exceptional trees; arbitrary divisor | Residue term cannot be dropped for arbitrary divisors | Preserved |
| surface-brauer-kummer | H³=0; nonzero finite H³ torsion | Finite quotient retained; no equivariant splitting asserted | General derivation supplied |
| equivariant-brauer-descent | Trivial G; C₂; nonzero units terms | Retain units and d₂,d₃ | Existing spectral sequence imported |
| integral-topology | Unit circle; O(1) | Increment and Chern degree +1 | Preserved |
| oda-interface | Rational point after closure; p=2 | Oda's point and perfect-field hypotheses retained | Preserved |
| witt-formal-brauer | Finite height; additive group; inseparable finite flat map; blowup | Rank h; Hom vanishings; norm multiplies by degree; birational invariance | General sources and derivations |
| crystalline-gauss-bonnet | Point; projective line; surface | Euler values 1,2,24; diagonal normal is tangent bundle | General self-intersection source |
| crystalline-picard-degree-one | Pic⁰=0; elliptic curve | Degree-one ranks 0,2; dual degree-three comparison for surfaces | General Illusie locator |
| crystalline-chern-derivative | Trivial and nontrivial line | Trivial class has zero obstruction; derivative compatibility needed | Preserved |
| artin-discriminant | σ=11; p=2; primitive versus p-divisible class | Even rescaling and 𝔽_p-linearity retained | Consumers renumbered |
| cross-realization | Identity; finite and infinite order | Identity characteristic polynomial implies identity only with semisimplicity | Preserved |
| tame-linear-groups | Trivial group; wild p-group | Prime-to-characteristic classification only | Preserved |
| mathieu-permutation-model | Identity; involution; 23-cycle | Fixed letters 24,8,1; point stabilizer index 24 | Order locator added |
| mukai-eleven-groups-recognition | Q₈; p=2; even tame order | Rational/dyadic obstruction domains retained | Preserved |
| exceptional-mathieu-embeddings | Same-order distinct extensions | Actual extension structures and embeddings required | Preserved |

## Maintainer notes

Only the three authorized design/source files and this report were changed. No commit, push, pull-request edit, supplier edit or Lean command was performed.

Theorem names already exported by this roadmap are unchanged. Section citations to former §§6.7, 6.7a, 6.7b and 6.7c must use §§6.0, 6.0a, 6.0b and 6.0c. Two K3 API names are added: `IsK3.picardRank_ge21_iff_eq22` and `IsK3.genusOneJacobian_isK3`. The deleted gap identifiers are `gap:galois-brauer-descent` and `gap:finite-etale-quotient-invariants`; their consumers now import existing suppliers. Remaining general theory stays assigned to its named supplier gaps. The Shioda primary is an explicitly uncertified locator, not a newly verified source. The involution-pencil theorem remains a target; this repair does not claim to have implemented a replacement for the source's invalid integral-involution step.
