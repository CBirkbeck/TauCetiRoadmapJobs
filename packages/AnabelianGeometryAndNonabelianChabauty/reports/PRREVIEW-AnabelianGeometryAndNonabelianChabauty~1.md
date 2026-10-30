# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 63d51d5)

**Verdict:** needs changes

## R01 (P1) — The foundational nonabelian supplier is outside the pins

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:53–57`, also §§0.1–0.18 and 4.2–4.5. The contract says “Adoption requires a Tau Ceti dependency containing these modules”.

**Claim:** Continuous cocycles, the gauge quotient, maps, descent and inflation are supplied by Tau Ceti, so this roadmap constructs only their extensions.

**Witness:** At Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, neither `ContCohomology/Nonabelian/Basic.lean` nor `Inflation.lean` exists; searching that source tree finds no `NonabelianH1`. The README instead cites `ce47fe1`. No supplier gap is declared.

**Repair:** Give the absent construction an owner within the permitted dependency graph. In this package, make the missing continuous cocycle/gauge quotient, compatible-pair maps and inflation results explicit prerequisite targets of Layer 0, with the intended native interface and proofs. Replace the claims of supply from the nonpinned commit; do not make implementation wait for a dependency change. Alternatively, resolve an exact contract with a permitted earlier owner and declare the gap in both required places. A link to another library revision is not that contract.

**Repair test:** The owned carrier must give four continuous cocycles and two conjugacy classes for trivial `C₂` acting on `S₃`; it must also support the nonsplit `C₄` example in the table. Those constructions currently have no supplied declaration at the pins. This finding concerns ownership, not the truth of the cocycle formulas or the successful Lean build.

## R02 (P2) — Retain the generality of the cited Hom theorem

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:5774–5807`, especially “restricted here to proper one-dimensional curves”.

**Claim:** The sub-p-adic and full profinite Hom endpoints cover only proper hyperbolic source and target curves.

**Witness:** `m99 line 95–115`, Theorem A, author p. 3: smooth pro-variety sources and hyperbolic pro-curve targets are allowed. Ordinary smooth varieties and affine hyperbolic curves are explicitly included.

**Repair:** State and develop the general relative Hom theorem of the cited source, retaining its continuous open maps and geometric conjugacy, over sub-p-adic fields. Name the additional source/target constructions and proof steps it needs. Keep proper-curve reconstruction as a specialization and its statable Lean acceptance theorem. Do not use the proper dominant-Hom scheme argument as a reason to omit affine targets or general smooth sources.

**Repair test:** For `U = P¹ − {0,1,∞}` over ℚ, `id_U` has degree 1 and induces the identity open arithmetic group map, of index 1. It is covered by Mochizuki's theorem but by neither of the stated proper-curve endpoints. The repaired theorem must recover this map, as well as the existing proper genus-two example.

## R03 (P2) — Arithmetic K-group finiteness already has an earlier owner

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7794–7808`, §7.0.

**Claim:** Arithmetic higher K-group finite generation, its Steinberg-homology proof inputs and the finite-even/rank consequences are targets here.

**Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:994–1078` owns projective Steinberg-homology finiteness and finite generation of every `K_n(O_F)`; `:1156–1192` owns the Borel ranks and finite positive-even groups. ArithmeticKTheory precedes this roadmap.

**Repair:** Delete the duplicated arithmetic finiteness construction and import ArithmeticKTheory §§3.2–3.4 by name and section in the supplier contracts and the higher-Chern target's dependencies. Keep the new higher étale Chern/rational Tate comparison here, after checking its separate ownership. Do not import its roadmap Lean module.

**Repair test:** Over ℚ, the supplier gives ranks 0 and 1 in degrees 3 and 5, and finiteness in degree 2; over ℚ(i), both odd ranks are 1. These are exactly the inputs required by the retained Soulé argument. At rank one, `St₁ = ℤ` and `H₀(Aut(ℤ),St₁) = ℤ`; no second Steinberg construction is needed here.

## R04 (P2) — The S-integral finiteness signature restates the S-unit theorem on main

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/Suggested.lean:83–87`; `README.md:8299–8303`.

**Claim:** Finiteness of S-integers x with both x and `1 − x` units is a new headline acceptance theorem.

**Witness:** On main, `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:2936` and `Suggested.lean:2855` already state finiteness of rational S-unit solutions `x+y=1`. The correspondence is `x ↦ (x,1−x)`.

**Repair:** Cite that existing theorem in Scope and ownership and delete `thricePuncturedLine_sIntegralPoints_finite` from this Lean file. Retain the new geometric result in §7.5: Kim's dimension inequality for the actual unipotent Selmer schemes. Its missing geometric carriers can continue to be identified in the module docstring. The integer-ring presentation is an adapter to the existing theorem, not a separate deep endpoint.

**Repair test:** For `S=∅`, both solution sets are empty. For `S={2}`, the x-values are `−1, 1/2, 2`, corresponding to `(-1,2), (1/2,1/2), (2,-1)`. Mathlib's `Set.unitEquivUnitsInteger` supplies the unit/integer-ring equivalence. This is an ownership finding, not a claim that the theorem follows from a single pinned-library tactic.

## R05 (P3) — Remove the 647 gate failures

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:51`, repeated throughout the file, for example `:178`, `:191` and `:192`.

**Claim:** The README uses explicit HTML anchor tags for its internal references.

**Witness:** The worker's gate reports `residue=647` and `FAIL`; its rule explicitly forbids `<a id=` tags. The other reported counters, including build and dependency order, are zero.

**Repair:** Remove the forbidden residue and point internal links to Markdown heading anchors. Where an API item needs its own link, use a prose subsection heading rather than an HTML tag. Preserve the mathematical statements and their dependency references.

**Repair test:** Replacing the anchor at line 178 with the existing §0.1 heading anchor removes that witness without deleting the cocycle target. Repeat across all gate locations and rerun the gate; acceptance is unavailable while it fails.

## R06 (P3) — The README still presents an undeclared Lean API catalogue

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:186–204`, with the same pattern throughout Layers 0–7.

**Claim:** Backticked own names such as `TauCeti.NonabelianCohomology.Z1.mem_iff` and `TauCeti.NonabelianCohomology.tests.trivial_group` label API statements and Checks.

**Witness:** `Suggested.lean:44–89` declares only `anabelian_isom` and `thricePuncturedLine_sIntegralPoints_finite`. It contains none of those API or test declarations.

**Repair:** Keep the mathematics, API bullets and Checks as prose. Remove the promised own Lean identifiers unless they name retained headline declarations or their indispensable definitions. Remove Lean counterpart names from every Check. Do not expand Suggested.lean into the catalogue to satisfy these names. Keep exact identifiers for genuine pinned or roadmap suppliers, clearly identified as such.

**Repair test:** The §0.1 Check must still say that trivial `C₂` acting on `S₃` gives four cocycles; deleting its invented test name loses no mathematical assertion. After R04, the one retained own theorem name must still occur in both files.

## R07 (P3) — The coset-action definition lacks discriminating Checks

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:2284–2294`, the coset-action definition; compare `:2320` and the subsequent invariant-coset constructions.

**Claim:** A generic equivariant-subgroup quotient action is defined, but its only Check is the trivial action on the three cosets of a transposition subgroup of `S₃`.

**Witness:** The displayed Checks block has one bullet. It never tests a nontrivial descended action or failure of subgroup stability, so the constant action passes its sole test.

**Repair:** Supply at least three discriminating prose Checks for each definition. Here retain the nonnormal `S₃` example, add inversion on `C₆/{0,3} ≅ C₃`, and reject the `C₂` coordinate-swap action on `C₂²` with subgroup generated by `(1,0)`, which is not stable. Audit the other short definition blocks similarly.

**Repair test:** In the `C₆` example, the class 1 must go to class 2, not class 1. In the coordinate-swap example, `(1,0)` goes to `(0,1)`, outside the subgroup, so no quotient action is induced. Together with the three nonnormal cosets, these test three different requirements.

## R08 (P3) — Record the cited works in the source manifest

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:8400–8588`; missing `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/sources.toml`.

**Claim:** The bibliography supplies versions and URLs, but there is no source manifest for their provenance and verification status.

**Witness:** The folder has no `sources.toml`; the review brief likewise records no cached manifest sources. Achinger's cited published Proposition 4.2 and the readable preprint's Proposition 4.1.2 illustrate why version tracking matters.

**Repair:** Add the required manifest, one key per work, with exact locators, cited targets and the sources service's provenance/status. Combine versions of the same work under one key, including the two Stix cuspidal-section entries. Preserve `uncertified` status where only a paywalled locator is available; do not label a fetched document's every theorem verified.

**Repair test:** The Achinger entry must distinguish the published locator from the preprint actually read. The BD1 entry must select arXiv v2, whose Theorem 6.3 appears on PDF page 26. No source text belongs in the repository.

## Verified sound

The following is positive evidence for the specified checks, not a claim that a `sorry` build proves the mathematics. The four blocking findings above are repairable; this is not a rejection of the roadmap's whole scope.

**Gate, pins and Lean.** Confirmed the requested head. The outside-folder diff against `origin/main` is empty. The worker's gate has exactly one failing rule, residue, with 647 hits; every other counter is zero. Independently ran the requested dependency command, which returned:

```text
depcheck: 208 roadmaps, 1496 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The mechanically passing dependency graph does not recognize the nonpinned-library prerequisite in R01.

Built `TauCeti.AlgebraicGeometry.Cohomology.Genus`, then elaborated `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/Suggested.lean` using `lake env lean`. Result: success, exactly two `sorry` warnings. A scratch copy with `#check @` for both declarations also elaborated. Prime, field embedding, finite field-generation, relative smoothness, properness, geometric connectedness, both finite-dimensional H¹ assumptions and both genus inequalities survive in the first signature. The second retains the finite set of height-one primes. No binder silently disappeared, and no source file was changed.

Both sorried declarations were tried with `rfl`, `infer_instance` and `simp` on a copy; neither closed. Object searches found no single pinned lemma proving either complete statement. There are no local definitions, sorry'd data, admitted examples or `set_option` commands. R04 is duplication against an existing roadmap, not one-tactic padding.

**Headline inventory.** The README's deep endpoints are: topological nonabelian torsor classification/twisting/exactness; étale K(π,1) criteria for curves and Artin towers; unipotent tensor-path realization and crystalline comparison; finite-field tame and sub-p-adic Hom/Isom reconstruction; all-algebra nonabelian cohomology and Selmer representability; Albanese density and dimension-conditional finiteness; quadratic Chabauty rank, height and determinant finiteness; section-map injectivity; rational Tate cohomology; conditional dimension implications; punctured-line dimension growth and finiteness. Section and eventual-equality conjectures are explicitly propositions, not promised proofs. The module docstring identifies the unavailable carriers for these families and states the proper Isom and S-integral consequences on native carriers. The latter is R04. I found no one-tactic padding in the former. R02 concerns the omitted general Hom endpoint, not a false proper Isom signature.

**Pinned definitions opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Declaration/file at the pin | What the definition actually supplies |
| --- | --- |
| `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`, `Set.integer` | Valuation ≤1 outside S, as a subalgebra; S itself need not be finite in this definition. The theorem's `Finset` is essential. |
| Same file `:108`, `Set.unit`; `:124`, `Set.unitEquivUnitsInteger` | Valuation =1 outside S on field units; an actual multiplicative equivalence with units of the S-integer ring. |
| `Mathlib/GroupTheory/Coset/Defs.lean:71`, `QuotientGroup.leftRel_apply` | The relation is `x⁻¹*y ∈ H`, giving cosets xH; it does not assume H normal. |
| `Mathlib/GroupTheory/GroupAction/Quotient.lean:51`, `MulAction.QuotientAction`; `:82`, `MulAction.quotient` | Subgroup-relation preservation is needed to descend an action. No quotient group law is supplied for a nonnormal H. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:203`, `FixedPoints.subgroup` | The fixed elements form the subgroup used for H⁰. |
| `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`, `Scheme.genus` | Coherent H¹ finrank with an explicit finite-dimensionality guard. It does not encode smoothness/properness or a rational point; the Lean theorem separately supplies the first two. |
| `TauCeti/Topology/Algebra/Group/Profinite/MaximalProP.lean:102`, `maximalProPQuotient`; `:346`, `lift` | The actual quotient and its continuous universal property; the arithmetic construction applies it to the geometric kernel. |
| `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:216`, `fppfHomogeneousQuotient`; `Homogeneous/Torsor.lean:152,158` | The sheaf quotient, local surjectivity and torsor pullback. They do not assert that raw pointwise cosets equal sheaf points for every group. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188`, `fgPointTensorIsoEquiv` | Reconstruction of points for a specified Hopf algebra's finite-comodule functor; general neutral reconstruction remains a separate supplier. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/AllDegreeColimit.lean:247,383`; `ClosedSubgroup.lean:273` | The finite-quotient comparison/colimit and killing a smooth-discrete class after open restriction. These are abelian results, not the missing R01 carrier. |

**Ownership and supplier resolution.** Searched by objects in the pinned libraries, main, the board packages and the roadmap service; checked relevant supplied sibling files. No other roadmap declares either of this folder's fully qualified Lean names. Object duplication nevertheless occurs in R03–R04. The following resolved contracts show the significant boundaries checked; source-service display header lines are not included in the repository line numbers.

| Supplier | Resolved contract and boundary |
| --- | --- |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215,228` on main | L0A and L0B supply sheaf tensor and finite-locally-free operations. The resolver's “no Layer 0” is a parsing false positive: it truncated 0A/0B. The revision's new numbering is not used. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`, §§6.1–6.3, 6.8 | General neutral reconstruction and the affine fpqc tensor-Isom torsor, no tensor-generator restriction. §2.1's unipotent specialization is distinct. Right precomposition and left postcomposition agree. |
| `Completed/ProfiniteArithmetic/README.md:538` | Continuous outer action of an extension. The centre-free pullback identification in §3.10 is additional; it is not a second Aut/Out construction. |
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`, IG.0.T1 | Finite-level curve/Jacobian H¹ and rational limit comparison, with ℓ invertible; the target correctly dualizes for `V_pJ`. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`, A4.4 | Étale H¹/Tate-module and exterior cohomology structures; the path realization comparison is additional. |
| `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, R07.P7.1 | Tensor-order adapter and coefficient extension, graded `D_dR→D_HT`; cyclotomic filtration jump −1 and labelled weight +1. |
| `TauCetiRoadmap/SelmerIwasawaCohomology/README.md`, §2.12a | Abelian isogeny Kummer, finite Selmer and Sha interfaces, with all-place conditions. No finiteness of full Sha is imported. |
| `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`, §§1.15a–1.16 | Integral formal groups, identity charts and convergence for radius `r>e/(p−1)`. The target's global abelian logarithm is an extension of this interface. |
| `TauCetiRoadmap/RestrictedPowerSeries/README.md`, Layers 0–1, §§2.1–2.4 | Native restricted series and Strassmann; the roadmap retains the residue-chart adapter. |
| `TauCetiRoadmap/RigidAnalyticGeometry/README.md:479,617` | §6.2 rigid geometry and §7.3 identity principle exist; compact K-valued charts still require the target's rescaling. |
| `TauCetiRoadmap/ColemanIntegration/README.md`, L1.12–L1.23 and L2.3–L2.18 | Word realization, primitives and polylogarithms; first-letter-outermost order agrees with the tensor-path comparison. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md`, R02.3.2 and D7 | Function-field reciprocity and compact/derived arithmetic cohomology; these do not themselves supply mixed-extension heights. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md`, §§3.2–3.4 | Existing owner of R03, inspected at the supplied open head. |
| `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md`, §4.5 | Existing owner of R04, inspected on main. |

For other authors' open work without a supplied checkout, ownership was not certified from an inferred or remembered head. The roadmap-service searches were used as leads, not as proof of an absent declaration. No source file, external PR or issue was modified.

**Additional comparison source.** The author’s 24 March 2008 Olsson manuscript is readable. `olsson line 37–40` and `line 131–141` give the unramified Witt-vector base, smooth proper normal-crossings pair, integral base point and reductivity hypotheses. The unit coefficient object satisfies the last condition. Theorems 1.8, 1.10 and 1.11, manuscript p. 5 (`line 161–187`), supply the group, Lie and coordinate-path comparisons used here; §§8.27–8.32, pp. 83–85 (`line 3407–3488`), treat paths and descend the comparison from the localized period ring to `B_cris`. Assumption 9.2 and Remark 9.3, p. 85 (`line 3496–3504`), match the stated boundary restriction; Theorems 9.28 and 9.46, pp. 96 and 104 (`line 4001–4014`, `line 4295–4309`), supply the tangential comparison and local-monodromy compatibility. This verifies those locators, not a ramified-base generalization.

**Seeded source sample: all 15 requested sections were examined.** No README locator is expressly marked unverified. Sources were fetched through the sources service, not copied into the repository. The following identifies the text read and distinguishes elementary extensions from the source's own narrower setting.

| Target | Text and locator checked | Result |
| --- | --- | --- |
| §0.1 | `kim2005 line 226–243`, §1, PDF pp. 5–6 | Ordered cocycles and gauge convention agree after inverting the source's gauge parameter. The roadmap's topological-group definition is more general than the source's unipotent coefficient setting, with its elementary proof supplied. R01 is independent. |
| §0.22 | `kim2005 line 403–412`, §1 p. 9; Kim 2009 §2 pp. 118–119 | The subgroup exact sequence supports neutral-fibre identification. The general topological formula is verified directly below; no normality or continuous quotient section is used. |
| §0.29 | `kim2005 line 327–401`, Proposition 2, pp. 7–9, especially invariant projection in the freeness proof | The source's H⁰-vanishing specialization does not assert general injectivity. The roadmap explicitly builds the general invariant action and tests the nontrivial action below. |
| §0.34 | `kim2005 line 403–412`, p. 9; pinned quotient-action definitions above | Exactness is of pointed sets, with invariant cosets and fixed-element orbits. R07 concerns missing discriminating Checks, not this exactness claim. |
| §1.8 | Achinger preprint, `achinger-all-primes-2017 line 665–714`, Proposition 4.1.2 and proof | Finite-cover effacement and coefficient dévissage support the argument. The published Proposition 4.2 numbering/pagination is not certified: see Not verifiable. |
| §2.1 | `deligne-milne line 944–947`, Thm. 2.11 p. 21; `line 1170–1195`, Prop. 2.21 p. 26; `line 1392–1444`, Thm. 3.2/Remark 3.3 pp. 31–32; `besser line 274–277`, Prop. 2.13 p. 7 | Neutral reconstruction and tensor torsors are supplied, not owned again; extension-generated unipotent categories are the specialization. The torsor need not have a rational point. |
| §2.10 | `kim2009`, introduction pp. 93–95 and §1 pp. 100–104; `bd1 line 312–331`; `bdmtv line 1651–1676`, Lemma 5.4 pp. 923–924 | Proper depth one is the Tate module and dual H¹; the Hodge quotient is the Lie algebra. The G_m finite-cover distinction is also checked directly. The generalized-Jacobian source remains uncertified. |
| §3.3 | `t97 line 5790–5911`, Lemma 4.7 pp. 167–168; `line 5023–5134`, Thm. 4.3 pp. 164–165, using §§2–3 | Algebraically closed function fields, normalized valuations and principal-unit congruences at three points are retained. Tame reconstruction retains affine hyperbolicity and the full arithmetic quotient. |
| §3.10 | `t97 line 9820–9890`, Lemma 7.1 and pullback proof, p. 188 | Centre-freeness gives the algebraic pullback; topological finite generation supplies the continuous profinite Aut/Out setting. The central counterexample below explains the hypothesis. |
| §6.1 | `bd1 line 545–622`, Definitions 4.1–4.6/Lemma 4.7 pp. 13–14; §4.3 pp. 14–17; `besser-heights2002 line 258–338`, diagram (4.4), Definitions 4.1/4.3, pp. 6–7 | The paragraph after the headline explicitly requires crystalline/semistable graded pieces, polarization for the involution, and finite cohomology for representability. These qualifications prevent the split noncrystalline and infinite-H¹ counterexamples. |
| §6.5 | `bd1 line 1203–1219`, Definition 6.2/Thm. 6.3 p. 26; `bdmtv line 856–873`, (16)–(17) p. 906; `line 1649–1708`, Lemmas 5.4–5.5/Remark 5.6 pp. 923–925 | The height formula and divisor degree correction agree. The extra twist printed in BD1 is corrected. Olsson’s comparison was also checked: see the paragraph below. |
| §6.6 | `bdmtv line 905–953`, (18)–(19), Lemma 3.7, pp. 907–908 | The roadmap's negative correction set repairs equation (19). It explicitly requires discwise density and the Mordell–Weil logarithmic identification. |
| §6.7 | `bdmtv line 270–292`, (6), Lemma 1.5/Remark 1.6 pp. 891–892; `line 954–958`, Remark 3.9 p. 908 | Independent anchors are required for the converse. The balanced tensor is evaluated by a Q_p-linear functional; no unjustified K_p-linearity into Q_p is asserted. |
| §7.2 | `kim2009 line 254–260`, Conjecture 1, p. 96 | Strict dimension inequality at some positive depth remains a hypothesis/conjecture; the index shift is explicit. |
| §7.4 | `kim2009 line 1240–1353`, Observations 1–2, Prop. 2, Lemma 6 pp. 121–125; `line 1360–1413`, Observation 3 pp. 125–126; `line 1494–1567`, CM arguments pp. 129–131 | The roadmap repairs the open-curve weights, complex-conjugation parity and initial H² terms; retains extra linear-Selmer and CM-image hypotheses; uses only rational finite-dimensionality in the pseudo-null argument. See computed tests and source issues. |

**Adversarial values (105 rows).** The table records explicit tests of the sampled targets, headline families, important interfaces and all mathematical targets touched by findings. Finite-group and numerical calculations were also independently enumerated in scratch. The finite S-unit enumeration used exponents −10 through 10 as a check; the asserted complete three-element answer for S={2} follows separately from the coprime powers-of-two equation. The table is a collection of tests, not proofs of the general theorems.

| Statement | Instance | Values on the compared sides / wrong model | Result; change |
| --- | --- | --- | --- |
| §0.1 cocycle normalization | G=1, U=S₃ | `c(1)=c(1)²` forces `c(1)=1`; 1 cocycle, 1 class | Pass; R01 ownership remains. |
| §0.1 trivial-action cocycles | G=C₂, U=S₃ | Images of generator: identity + 3 transpositions =4; conjugacy orbits=2 | Pass. |
| §0.1 multiplication order | S₃ identity cocycle, a=(01), b=(12) | ab=(012); ba=(021), unequal | Pass; reversed convention rejected. |
| §0.1 invariants | C₂ acts by negation on ℤ | `z=−z` gives z=0; trivial action fixes all ℤ | Pass. |
| Gauge and torsor repointing | G=C₂ acts by negation on C₄; c=0, u=1 | Gauge by u adds 2; repointing by u gives gauge by −u, also 2 here | Pass; sign separately tested with C₉ below. |
| Twisting neutral class | G=C₂, U=C₂, trivial action, nontrivial c | Translation sends neutral twisted class 0 to c=1, not 0 | Pass; only repointed target is pointed. |
| Restriction | C₂→1, trivial C₂ coefficients | Two H¹ classes restrict to one; restriction is not generally injective | Pass. |
| Inflation | G=C₂×C₂, N=first factor, U=C₂ trivial | H¹(G/N,U) has 2 classes; kernel of restriction among 4 global classes has 2 | Pass; native input missing, R01. |
| Central positive defect | C₉→C₃, section 0,1,2, inputs 2,1 | Lift sum minus lift of sum=3 mod9; inverse defect=6 mod9, or +1 versus −1 in kernel C₃ | Pass; orientation discriminated. |
| §0.22 neutral inclusion fibre | A={0,2}⊂C₄, sign C₂-action | H¹(A)={0,2}; both map to neutral even orbit in H¹(C₄) | Pass; inclusion need not be injective. |
| §0.22 identity inclusion | A=B with same action | Neutral fibre consists of exactly one class | Pass. |
| §0.29 kernel action | C₃ acts trivially on A₃⊂S₃; sign quotient | H¹(A₃) has 3 classes; a transposition exchanges c and c⁻¹; invariant-action orbit set has 2 | Pass; matches ambient H¹-image size 2. |
| §0.29 lift independence | Same example; conjugators differing by A₃ | c and c⁻¹ are the two nonneutral outputs; changing the lift by A₃ keeps each output class | Pass. |
| §0.34 coset action | Transposition subgroup of S₃, trivial G | 6/2=3 cosets; subgroup is nonnormal | Pass; R07 needs further tests. |
| §0.34 nonconstant quotient action | Inversion on C₆/{0,3} | [1]↦[−1]=[2], not [1] | Proposed R07 repair excludes constant action. |
| §0.34 stability failure | Coordinate swap on C₂²; H=span(1,0) | (1,0)∈H maps to (0,1)∉H | Proposed R07 repair correctly rejects it. |
| §0.34 fixed representatives | Sign action on C₄, quotient by {0,2} | Fixed B={0,2}; quotient fixed set has 2 cosets, odd coset has 0 fixed representatives | Pass. |
| §0.34 connecting exactness | Same C₄ example | δ(even)=0, δ(odd)=2; image has 2 elements and equals inclusion's neutral fibre | Pass, both directions. |
| Finite-cover versus full quotient | Geometric C₃, arithmetic C₂, p=3 | Quotienting geometry retains arithmetic quotient order 2; pro-3 completion of whole C₆ loses it | Pass; arithmetic quotient retained. |
| §1.8 empty prime set | P=∅ | Only zero finite coefficients; H^q=0, effacement condition vacuous | Pass. |
| §1.8 positive control | Spec algebraically closed field | π=1; positive-degree cohomology of every finite constant coefficient=0 on both sides | Pass. |
| §1.8 negative control | P¹ over algebraically closed characteristic-zero field | π=1 gives H²(π,F_p)=0; H²_et(P¹,F_p)=F_p, dimension1, cannot be killed by a connected finite étale cover | Pass: both criterion and K(π,1) property fail. |
| Prime-degree curve cover | Elliptic curve, p=2 | Nonzero character yields degree2 cover; multiplication-by-2 has degree4 | Pass. |
| Kummer cohomology | Proper genus g curve, p invertible | H¹(C,μ_p) has p^(2g) elements; g=0 gives1, g=1,p=2 gives4 | Pass; zero character is not a connected cover. |
| Unipotent homogeneous quotient | Heisenberg (a,b,c), H={(s,0,0)} | Right multiply: (a+s,b,c); quotient coordinates (b,c) unchanged; conjugation adds −sb centrally | Pass, including nonnormal H. |
| All-algebra quotient limitation | α_p⊂G_a, R=k[t], char p | H(R)=0; quotient point map sends r↦r^p and misses t | Pass; characteristic-zero hypothesis matters. |
| Sheaf versus raw quotient | G_m/μ₂ over ℚ | Point 2 of quotient has no ℚ-valued square-root lift | Pass; imported sheaf is not replaced by raw cosets. |
| §2.0 Tate normalization | H²(P¹), then its dual | Frobenius pσ, filtration jump+1; dual p⁻¹σ, jump−1 | Pass. |
| Ramified coefficient fields | [K:K₀]=e>1, unit representation | dim_K D_dR=1, dim_K₀ D_cris=1; K-extension has K₀-dimension e | Pass; no false scalar-field identification. |
| §2.1 neutral reconstruction | Finite-dimensional vector spaces | Tensor automorphism group=1; tensor-Isom torsor=one point | Pass. |
| §2.1 nonneutral fibre | μ₂/ℚ, torsor ℚ(√2) | Rational sections=0; after ℚ(√2), sections=2 and torsor becomes trivial | Pass; no rational-point claim. |
| §2.1 action order | a=[[1,1],[0,1]], b=[[1,0],[1,1]] | ab=[[2,1],[1,1]], ba=[[1,1],[1,2]] | Pass; precomposition order is material. |
| Universal length versus Hopf quotient | One generator T, n=1 | Δ(T²)=T²⊗1+2T⊗T+1⊗T²; mod T² the middle term is nonzero in char0 | Pass; finite length module is not a Hopf quotient. |
| Lower central depth | Abelian G_a, n=0,1,2 | Quotients 1,G_a,G_a; dimensions0,1,1 | Pass; index shift retained. |
| Two-step Malcev relation | Affine m=2 versus proper g=2 | ∧² dimensions1 and6; H₂ relations0 and1; central dimensions1 and5 | Pass. |
| Frobenius-Lang need | Additive group, φ(x)=2x versus φ=id | φ(x)−x=x, uniquely solves target1 at x=1; identity gives0 for every x | Pass; fixed-vector exclusion necessary. |
| §2.10 proper depth one | Genus0,1,2 | Dimensions of (U₁,F⁰,Q₁)=(0,0,0),(2,1,1),(4,2,2) | Pass. |
| §2.10 open depth one | G_m and thrice-punctured line | (dim U₁,dim Q₁)=(1,1),(2,2); proper Jacobian alone would give0 | Pass. |
| §2.10 finite covers | G_m, degree2 power cover | Cover degree2; finite abstract quotients of additive Q_p have order1 | Pass; objects are not conflated. |
| Tangential normalization | Tangent scaled by a unit u | Kummer change κ(u); for u=1 change0; uniformizer has valuation1 and is not a unit tangent | Pass. |
| §3.3 valuation/addition | P¹, marked0,1,∞, f=t | valuations(1,0,−1); for 1−t: (0,1,−1); (1−t)∈1+m₀ | Pass; evaluations at the marked points are retained. |
| §3.3 finite-field hyperbolicity | P¹−{0,1,∞}/F₂ | 2g−2+r=1>0; #k=2; U(F₂) has0 points | Pass; reconstruction does not demand a rational interior point. |
| §3.3 arithmetic conjugacy | Identity group map composed with Int(γ) | One full-inner class, one identity scheme map; raw maps can differ | Pass. |
| §3.10 centre-free pullback | Δ=S₃, G=1 | Aut(S₃)=Inn(S₃), order6; pullback order6=orderΔ | Pass. |
| §3.10 missing centre control | Δ=C₂, Π=C₂, G=1 | Aut(C₂)=1; proposed pullback order1 versus Π order2 | Correctly excluded. |
| Proper Hom/Lean Isom | Genus2 hyperelliptic curve, id and involution | Degrees1,1; action on H⁰(Ω¹) is +I versus −I, so equivalence classes differ | Pass; not collapsed by uniqueness. |
| R02 general Hom | U=P¹−{0,1,∞}/ℚ, id | Degree1; group-image index1; properness=false | Source covers it; present roadmap omits it. |
| §4 coefficient functor | Trivial coefficient group, arbitrary R | Z¹=H¹=singleton; every coefficient map=id on singleton | Pass. |
| §4 representability | V=0, central tower all trivial | H⁰,H¹,H² dimensions0; representing scheme Spec K, dimension0 | Pass. |
| Finite-cohomology requirement | G=(∏Z_p)⋊C₂, inversion; V=Q_p with sign | H⁰=0, infinitely many independent coordinate classes in H¹ | Correctly excluded by §4 finite-cohomology assumptions. |
| Nilpotent coefficient tests | R=K[ε]/ε²; G_a | ε≠0, ε²=0; reduction ε↦0 loses a nonzero R-point | Pass; field-points-only classification is insufficient. |
| Central obstruction | Heisenberg pairing, a=b=1 | Positive defect β(1,1)=1; reversed pairing sign would be −1 | Pass; nonzero local Tate cup product obstructs lifting. |
| Selmer fibre inequality | Empty obstruction fibre versus trivial vector fibre | Empty fibre has0 points; nonempty rank-d fibre has dimension d, not arbitrary larger dimension | Pass; no surjectivity assertion. |
| §5 period coset | p_H=p_φ, then p_H→p_Hh | u=1 then u=h; both give [1] in U/H | Pass. |
| §5 noncommutative period | I=a, γ=b as above | I⁻¹γ=[[0,−1],[1,1]]; γI⁻¹=[[1,−1],[1,0]] | Pass; products cannot be exchanged. |
| Exact versus closed image locus | Squaring G_m→G_m over Q₃ | 2 has no Q₃-square root but lies in the geometric image closure | Pass; only inclusion asserted. |
| Nilpotent image equation | Spec K[ε]/ε²→A¹, t↦ε | Reduced image is{0}; t vanishes there, but pullback ε≠0 | Pass; target does not assert scheme-theoretic zero pullback. |
| Empty Selmer image | S=∅ scheme | Z=∅; regular annihilator f=1; zero locus empty | Pass. |
| Compact-chart Strassmann | f(t)=t on t=πs | Rescaled f=πs; largest maximal coefficient index1; one root s=0 | Pass; zero series excluded. |
| §5 dimension finiteness | Target A¹, image{0}, j(t)=t on O_K | dim image0<1; pullback t has one zero | Pass. |
| §5 absent density | Same image, j=0 | Pullback t=0; locus=all O_K, infinite | Correctly excluded. |
| Abelian logarithm normalization | Rank0 abelian variety; multiplicative formal chart | Lie dimension0 and one point; log(1+T)=T−T²/2+… with derivative1 | Pass. |
| Formal logarithm radius | p=2, e=1, r=1, point −1=1−2 | log(−1)=0 despite −1≠1; strict radius requires r>1 | Pass; supplier's strict inequality retained. |
| Classical versus Selmer Chabauty | g=2, dim W_MW=1, dim W_S=2 | Annihilator dimensions1 versus0; MW rank<g does not cut the full Selmer locus | Pass; additional equality/bound is required. |
| §6.1 split mixed extension | Graded Q_p,V,Q_p(1), split M | Class=1; adjacent extension classes0,0; height0 | Pass. |
| §6.1 automorphisms | W₀=W₁=Q_p, G=1 | Class-set size1; automorphisms indexed by λ∈Q_p | Correctly distinguishes classes from automorphism freeness. |
| §6.1 period qualification | Split Q_p⊕ramified quadratic character over Q₃ | Torsor class1 is in H¹_f, but crystalline dimension1<representation dimension2 | Correctly excluded by the explicit crystalline-grades paragraph. |
| §6.1 local height | Away-place uniformizer π and unit u | ord(π)=1, ord(u)=0; heights χ(π),0 | Pass. |
| §6.1 isotropy | Symplectic basis a₁,a₂,b₁,b₂ | Pairing(b₁,b₂)=0; pairing(b₁+a₂,b₂)=1 | Pass; being a complement alone is insufficient. |
| §6.1 semistable central term | Kummer of p(1+p) | ord=1; logarithmic coordinate log(1+p); crystalline-only condition would discard ord=1 | Pass; adjacent-finite domain retained. |
| Nice correspondence | Zero cycle class | cup0=0 and trace0=0, but nonzero condition=false | Pass; vacuous height quotient excluded. |
| Height quotient | Proper g=1 versus g=2 | dim∧²V−1=0 versus5; genus1 has no nonzero quotient from the zero central grade | Pass; rank criterion requires g>1. |
| Quadratic rank inequality | g=2, ρ_Q=2 | r=2 gives2<3; r=3 gives3<3 false | Pass; strictness retained. |
| §6.5 divisor correction | Degrees Δ*Z=a, i_b*Z=b, i_x*Z=c | degree D=a−b−c+(b+c−a)=0 | Pass. |
| §6.5 adjacent classes at b | AJ_b(b)=0 | π₁=0; π₂=c_Z, not necessarily0 | Pass. |
| §6.5 local height formula | γφ=7,γFil=1; s₁α=1,s₂α=2; βφ=2,βFil=3 | 7−1−2−6=−2; swapped projections give−1; omitted corrections give6 | Pass. |
| §6.5 height coordinates | h=a(γ−F), a=2,F=3,h=8 | γ=8/2+3=7; a=0 collapses every γ to h=0 | Pass; nonzero character needed. |
| §6.6 correction sign | Single away-place height3 | h_p−h_global=−3; Υ={−3}, not{3} | Pass; source misprint corrected. |
| §6.6 empty bad set | T₀=∅ | Empty sum0; Υ={0}, not∅ | Pass. |
| §6.6 zero-map wrong pair | AJ=θ=0 on an infinite disc | Polynomial T vanishes on image but T≠0; density=false | Correctly excluded. |
| §6.7 determinant m=0 | θ=7,α=2 | 1×1 determinant=5=residual5 | Pass. |
| §6.7 independent anchor | Corrected rows(5,2),(10,4) | determinant0; residual relation5=(10/4)·2 | Pass. |
| §6.7 separate corrections | Uncorrected rows(7,2),(9,4) | determinant28−18=10, versus corrected0 | Pass. |
| §6.7 dependent features | Both feature entries0; candidate residual7 | determinant0 despite residual7≠0 | Correctly excluded by basis condition. |
| §6.7 balanced features | W rank1 over étale algebra of Q_p-dimension2 or3 | Balanced dimensions2 or3; unbalanced dimensions4 or9 | Pass. |
| §6.8 choice independence | Scale χ by2, away value3 | Residual−3→−6; Υ{−3}→{−6}; membership unchanged | Pass; scale0 excluded. |
| §7.0 K-group ranks | F=ℚ, then ℚ(i), degrees3,5 | (0,1), then(1,1) from both target and existing supplier | R03: cite owner. |
| §7.0 Tate weights | k=2,3, F=ℚ, odd p | H¹ dimensions0,1; H² dimensions0,0 | Pass; k=1 treated separately. |
| §7.1 section classes | X=Spec k | Arithmetic projection=id; exactly one section and one class | Pass. |
| §7.1 abelian Kummer | Point0, multiplication n=1 | Kummer0=0; A[1]=0; identity-cover class0 | Pass. |
| §7.1 positive-characteristic bound | Supersingular elliptic curve, n=p | [p] has inseparable part and is not étale | Correctly excluded by invertible-n hypothesis. |
| §7.2 strict inequality | P¹−3, S={2}, depths1,2 | Bounds on(dim S_n,dim Q_n)=(2,2),(2,3) | Depth1 equality does not suffice; depth2 strict bound does. |
| §7.2 hyperbolicity | G_m, S={2} | Unipotent depth dimensions remain1,1; S-units ±2^n are infinite | Correctly excluded. |
| §7.3 free Lie dimensions | m=2, n=1,…,6 | 2,1,2,3,6,9; divisor sums reproduce2^n | Pass. |
| §7.3 surface relation | g=2, n=1,…,4 | 4,5,16,45; one quadratic relation changes6 to5 at n=2 | Pass. |
| §7.4 open conjugation parity | P¹−3, all punctures real | At n=1: d=2, trace−2, d⁻=2, not d/2=1; n=2: d=1,trace1,d⁻=0 | Pass; source's proper-only simplification not copied. |
| §7.4 initial H² constant | P¹−3, S={2}, p=3, n=1 | dimH¹=4, d⁻=2, dimH²=2; P(1)g¹=0 for g=0 | Pass: finite initial constant C retains2. |
| §7.4 open weights | G_m, V_n=H¹⊗n(1), n=3 | Weight2n−2=4; not proper weight n−2=1; W₀=0 in either positive-weight case | Pass. |
| §7.4 weight splitting | 0→V→E→Q_p→0, W₀V=0, strict W | W₀E→Q_p is surjective with kernel0; dimension1, hence gives a splitting | Pass; strictness is used. |
| §7.4 negative K-index | n=2,3 in K_(1−n) | Indices−1,−2; regular smooth schemes have zero negative K-groups | Pass; n=1 is not covered. |
| §7.4 CM depth2 | dim linear Selmer1, central finite Selmer0 | dim Sel₂≤1+0=1; dim Q₂=3−1=2 | Pass; rank alone is not substituted for Selmer dimension. |
| §7.4 pseudo-nullity | Λ=Z_p[[T₁,T₂]], M=Λ/(p,T₁) | dim_Fp M=∞; M⊗Q_p=0 | Pass; roadmap uses rational finiteness, not integral finite generation. |
| §7.5 S-integral finiteness | S=∅; S={2} | Empty set; {−1,1/2,2}; pair-set cardinalities0 and3 | Sound arithmetic, duplicated owner R04. |
| §7.5 dimension bound | S={2}, depths1,2,3,4 | Selmer bounds2,2,4,4; target dimensions2,3,5,8 | Pass; retained new geometric content. |
| §7.6 depth-one equality test | p=3,5,7 on P¹−3 | Primitive sixth roots in Q_p:0,0,2; at p=7 residues3,5 lift | Pass; depth2 at split primes retains the dilogarithm nonvanishing hypothesis. |

The supplied Checks often already contain the needed safeguards: all-algebra rather than field-point representability, explicit scalar fields, no raw pointwise quotient substitution, finite initial H² contributions, rational rather than geometric Picard rank, and nonzero height characters. The negative controls above verify those specific distinctions.

## Not verifiable

- **Achinger's version of record:** the publisher article and PDF endpoints for `achinger-all-primes-2017` were classified `uncertified`. A readable arXiv version supports Proposition 4.1.2 and the constant-coefficient dévissage, but I did not certify that the published Proposition 4.2 has the same numbering and page. Do not conflate those locators.
- **Hadian's thesis:** the cited German National Library endpoint returned HTTP 429 through the sources service. The title search also found a short later MPI note, which is not the cited thesis and does not replace its universal-Hodge-filtration locators.
- **Serre, Algebraic Groups and Class Fields, Chapter V**, and **Stix 2013, Introduction:** the publisher entries were `uncertified`. Their exact stated locators remain uncertified; the generalized-Jacobian and section-conjecture citations are not represented as directly read source proofs.
- **Kim's survey:** the cited DNB endpoint failed; arXiv:0804.1008v1 was retrieved as an alternative. Published-versus-preprint pagination was not independently collated in this review.
- Fetching the whole bibliography does not certify every unsampled locator. The source table identifies the 15 seeded sections and the additional texts actually checked. In particular the Hadian-dependent universal Hodge filtration is not a certified construction merely because its downstream formulas pass the tests.
- The table gives explicit computed tests for the sampled sections, headline families and finding targets; it is not an individual countermodel search for every named API bullet in this 8,588-line README. No clean whole-folder mathematical certificate is claimed. Likewise, the resolved supplier table is positive evidence for those contracts, not an assertion that the resolver's remaining hundreds of own-API names exist at the pins.

The missing/unavailable-source inventory is preserved in the scratch reference-request file. This review is completed with a needs-changes verdict; it is not awaiting or requesting permission to fetch a text.

## Source issues

- **Gap** in kim2005 at Lemma 4, PDF p. 3: the source says compactness supplies a convergent subsequence of independent vectors; it should use a closed-discrete-subset argument or justify sequential compactness; affects the proof.
- **Error** in bd1 at §4.2 after Lemma 4.7, PDF p. 14: the source says invariant vanishing alone makes arbitrary profinite-group H¹ finite type; it should also require finite-dimensional continuous cohomology of the graded coefficient representations; affects a stated result.
- **Gap** in bd1 at §4.2 after Lemma 4.7, PDF p. 14: the source says crystalline and semistable mixed extensions correspond to neutral-period torsor classes; it should specify crystalline and semistable graded representations respectively; affects a stated result.
- **Misprint** in bd1 at Theorem 6.3, PDF p. 26: the source says the compared divisor mixed extension has an additional Tate twist −1; it should have no additional twist, as the following height comparison and graded pieces require; affects a stated result.
- **Misprint** in bdmtv at equation (19), printed p. 907: the source says the correction set is the positive sum of away-place heights; it should be the negative sum for the residual theta minus global height; affects a stated result.
- **Error** in kim2009 at Observation 2 proof, printed p. 122: the source says the tensor representation is pure of weight n−2; it should allow weights from n−2 through 2n−2 for open curves; affects the proof.
- **Error** in kim2009 at Proposition 2 proof, printed p. 123: the source says the negative conjugation eigenspace has dimension d_n/2 for odd n; it should restrict that assertion to the proper case and use the full character for open curves; affects the proof.
- **Error** in kim2009 at Lemma 6, printed p. 124: the source says the polynomial-times-g^n bound without a degree threshold; it should assert sufficiently large n and retain a finite initial contribution in cumulative estimates; affects a stated result.
- **Gap** in kim2009 at Observation 4 proof, printed p. 131: the source says pseudo-nullity implies finite generation over Z_p; it should discard p-power torsion and prove finite-dimensionality after rationalization, which is all the argument needs; affects the proof.
- **Gap** in besser-heights2002 at end of §3, PDF p. 5: the source says vanishing on principal divisors rules out the remaining global minus sign; it should compute a sign-sensitive nonzero comparison, since vanishing holds for both signs; affects the proof.
