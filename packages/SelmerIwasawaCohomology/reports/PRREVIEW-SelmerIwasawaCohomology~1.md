# Review of SelmerIwasawaCohomology (pull request #869 at 1fa1c7d)

**Verdict:** needs changes

## R01 (P2) — Move the L-function-record comparison to its consumer

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2031` and `:2082`: “For such a list `f` and a supplied LFunctions `AnalyticLFunctionData d`”.

**Claim:** §4.14 consumes the analytic L-function record and its Gamma product.

**Witness:** The dependency check places SelmerIwasawaCohomology at 57 and LFunctions at 306. Moving the former after the latter would cross its consumer ArithmeticKTheory at 98. LFunctions Layer 0 owns the record.

**Repair:** Move only the record/product comparison to LFunctions, which can consume the Hodge factor list and order formulas here. Remove its supplier edge here and the corresponding not-statable item from the module docstring. Keep both native Hodge Gamma headline statements. Test: a list with two real zero shifts and one complex zero shift still has product Γℝ(s)²Γℂ(s) and order −3 at zero without any L-function record. Re-run the dependency check. This accounts for the substantive failure in the supplied push gate.

## R02 (P2) — Import the supplier's module-level Selmer objects too

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:12`, `:494`, `:519`, `:562`, `:589`, `:645` and `:1641`: “compact, rational and discrete Selmer data and Selmer groups”.

**Claim:** The ownership paragraph and these targets reconstruct unramified/Greenberg conditions, arithmetic Selmer groups and their duals, and the number-field étale comparison. The contract at line 85 imports complexes but omits these shared module-level objects.

**Witness:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1752` and `:1761`, §F.4, explicitly own these objects on the number-field lattice domain, including the continuous étale comparison and the contragredient dual action.

**Repair:** Extend the contract to those module-level constructions. Delete their reconstruction targets on the shared domain; retain the genuinely wider coefficient/profinite-group variants with an explicit statement of the extension and comparison maps. Keep the new Kato `j_*` comparison distinguished from the supplied basic étale comparison. Test the shared domain with T=ℤ₃(1): F⁺=T gives the full Greenberg condition, F⁺=0 gives the unramified condition, and the dual action sends a scalar u to u⁻¹ in both roadmaps. There should be one owner of these objects, not two.

## R03 (P2) — Reuse the arithmetic class and unit towers

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2117`–`:2149`: “Define `Y_n` as the p-primary ideal class group” and “Define `X_n` as the maximal abelian pro-p Galois group unramified outside `p`”.

**Claim:** §§4.16–4.17 construct the class norm limit, p-ramified module, principal-unit and closed-global-unit towers, their Artin comparisons and reciprocity sequence from class field theory.

**Witness:** `TauCetiRoadmap/IntegralIwasawaTheory/README.md:297`, `:310`, `:330`, `:332`, `:389` already own those constructions and maps. CyclotomicClassGroupsAndStickelberger §§7.1–7.2 explicitly transport that same class norm limit and Artin identification.

**Repair:** Import IntegralIwasawaTheory §§2.1–2.3 and 2.7, specifying the index change and the notation dictionary: its unramified X is this section's Y; its p-ramified 𝔛 is this section's X. Import the closure comparison as well. Retain the plus projection, arbitrary closed C quotient and Selmer interpretation only as genuinely additional comparisons. Test: on a constant C₃ class tower both norm limits are C₃; for E=3ℤ₃⊂U=ℤ₃ and C=0, both reciprocity kernels are U/E=C₃, never E/U. This preserves the corrected quotient direction without a second construction.

## R04 (P2) — Do not re-prove the supplied Fontaine–Laffaille realization

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1867`–`:1871`: “the covariant period realization gives an exact fully faithful functor” and “Reduce exactness and rank to simple residual filtered objects”.

**Claim:** §4.7 plans the period functor, torsion exactness/full faithfulness, free-lattice limit and crystalline rationalization as new work, despite naming the supplier's inputs.

**Witness:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4696`, `:4960`, `:4983`, `:5093`, `:5154` already supply interval realization, exactness, full faithfulness, the lattice functor and admissibility. Its §R07.3.17 supplies the lattice correspondence.

**Repair:** Import §§R07.3.3a, R07.3.10–R07.3.11, R07.3.14 and R07.3.16–R07.3.17. Restrict this target to the explicitly named covariant/sign conversion and any remaining comparison with the quotient-lattice predicate; do not repeat the simple-object proof or lattice realization. Test at p=5: the jump −1 line realizes covariantly to ℤ₅(1), has this roadmap's weight −1 and the supplier's weight +1; its mod-5 realization is nonzero. Dualization and interval reindexing preserve these values and do not require another realization functor.

## R05 (P3) — Correct the rank-one supplier locator

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1130`: “ArithmeticGaloisDuality §R02.5.2b *Rank-one Selmer numerics*”.

**Claim:** The rational-number-field comparison Check cites that target.

**Witness:** The cited supplier has *Rank-one Selmer numerics* at `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:6744`, §R02.5.2; there is no §R02.5.2b.

**Repair:** Cite §R02.5.2. Its ℚ Check gives both Selmer dimensions zero and 0=−(1+0−1), exactly the comparison used here. This is locator drift, not an unowned mathematical prerequisite.

## R06 (P3) — Remove undeclared own API names from README bullets

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:5`, `:358`–`:362`, `:455`–`:459`, `:2008`–`:2015` and the analogous API lists: “The Lean names in the targets specify the intended library API”.

**Claim:** Backticked names such as `SelmerData.withCond`, `propagate_gc`, `archRealization_sum` and `archRealization_tateDual` advertise declarations absent from Suggested.lean.

**Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean` contains 17 declarations and none of those four. The standing form rule allows own backticked API names only for declarations actually retained there.

**Repair:** Write those API bullets as mathematical prose and remove the introductory exception. Retain backticked names for the 17 actual declarations and for accurately attributed library/supplier declarations. Do not expand Suggested.lean into an API catalogue. Test: the forward-image/backward-preimage adjunction remains the same mathematical assertion, already expressed by Mathlib's `Submodule.map_le_iff_le_comap`; the spelling is not a new target signature.

## R07 (P3) — Complete the layer form in both files

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:978`–`:1315` and `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean:46`, `:114`, `:134`.

**Claim:** Layer 2A ends without its required Examples and Dependencies subsections; the Lean file spans Layers 0, 2 and 4 without the required layer comments. The roadmap title also starts with upper-case “Selmer”.

**Witness:** The README's Examples/Dependencies pairs occur after Layers 0, 2, 3 and 4 only. Lean uses `section Kummer`, `section PrimaryDecomposition` and `section Archimedean`, with no `/-! ## Layer … -/` markers.

**Repair:** Add a worked-example summary and dependencies at the end of Layer 2A, add the three corresponding Lean layer comments, and use the lower-case title form. Reuse the existing nontrivial examples: the function-field difference 1 versus the ℚ difference 0, the characteristic-two trace boundary, and H²[p] in coefficient change. No new admitted examples are needed.

## Verified sound

The head and scope were checked: the head is exactly `1fa1c7d7447988efdf08df5936d6da2ffc2a009f`; the outside-folder diff is empty. The two target files were read in full. No sorry'd data, `set_option`, computational algorithm, source passage copied into the targets, arbitrary free predicate standing for missing theory, or false Lean headline was found. This is a repairable roadmap, rather than grounds for rejecting its entire scope.

The recorded gate passes its text, file-scope and targeted-build checks and fails dependency checking. Building `TauCeti.Geometry.Hodge.Dimension`, then `TauCetiRoadmap.SelmerIwasawaCohomology.Suggested`, succeeded. Direct elaboration of the original Suggested.lean succeeded with exactly six `sorry` warnings. A scratch copy with `#check @name` for all 17 declarations elaborated; the DVR theorem retains `IsFractionRing`, `Module.Free` and `Module.Finite`, Kummer retains `NeZero (p : K)`, and both Hodge formulas retain finite dimension. No signature repair was needed. In a separate scratch copy, replacing each of the six admissions by the single tactic `simp` closed none. Reading the native definitions and searching by object found no one-lemma replacement for those six results; no padding finding is made.

The source sample has **15 targets**, all with readable text at the cited locators, including visual inspection of Deligne's printed pages. No additional locator was flagged unverified in the README. Fetching a work was not treated as verification of every result in it. The following records what was actually read; numerical tests follow in the adversarial table.

| Sample target | Text and locator inspected | Conclusion and limits |
| --- | --- | --- |
| 0.4 | rjw lines 3000–3087, §10.5, (10.8), pp.52–53 | The source uses algebraic tensor notation incorrectly; the roadmap's completion comparison and noninjectivity correction are valid. |
| 0.5 | rubin lines 6550–6637, Appendix B §§2.3, 2.7, pp.152–153 | Finite local quotients and the inverse-limit comparison give the stated profinite topology. This does not assert finite global power-class groups. |
| 2.8a | rjw lines 3942–3949, Definition 13.19(1), p.70 | Filtration/graded inertia formula resolved; the roadmap correctly imposes local decomposition-group stability. |
| 2.11 | burungale-tian lines 24–35, §1.0.1/(1.1), p.1 | Supports the elliptic Selmer corank usage; the general corank is defined by the compact dual, not by this paper's converse theorem. |
| 2.15 | rubin lines 459–499 and 518–528, I.3.5, I.3.7–3.8, pp.6–7 | Lattice, residue-characteristic and archimedean qualifications agree; finite quotients need Lemma 3.8 as used in the sketch. |
| 3.2 | nekovar lines 7740–7894, §§8.4.1–8.4.4.2, pp.204–207 | The semilocal extension is explicitly proved in the README; the cited proof is local. The corrected iota exponent was also checked visually on p.206. |
| 3.5 | rubin lines 6652–6751, B.3.3–3.5, pp.154–155 | Infinite decomposition and finite-generation conditions are retained; the subsequent corollaries supply the global/semilocal use. |
| 3.7 | kato lines 4039–4074, Theorem 12.5(1), p.221; rubin lines 6651–6667, B.3.1; burungale-tian lines 165–182, 230–249, pp.4,6 | These support the chosen compatible Tate generator and inverse-character specialization. The general cochain twist is the roadmap's extension, not an assertion that Kato states it for arbitrary coefficients. |
| 3.13 | kato lines 4004–4035, §12.2, p.220; 4297–4355, §13.8, pp.227–229 | Kato's displayed case is over ℚ. The general-number-field formula is explicitly routed through ArithmeticGaloisDuality; global weak Leopoldt is not assumed proved by the rank formula. |
| 3.21 | greenberg lines 4–150 and 722–775, §1 pp.1–4, Proposition 4.1.1 pp.19–20 | Greenberg supplies the arithmetic no-pseudo-null input, not the Fitting formula. The README correctly routes the latter through the dimension-two and square-presentation suppliers. |
| 4.7 | fontaine-laffaille lines 612–637, 1297–1334, 1754–1789, 1820–1851; Theorems 3.3,6.1,8.4, Propositions 7.15,7.17, Remark 8.5; niziol lines 129–176, §2 pp.750–751 | Safe interval, exactness/full faithfulness, finite period object and rationalization agree. Ownership repair R04 remains necessary. |
| 4.10 | breuil lines 244–274, Proposition 6/Remark 8, p.465; liu-tian-xiao-zhang-zhu lines 697–728, Lemma 2.2.6, journal pp.124–125 | Unramified field, free lattice, interval containing zero, and width bound all retained. The published journal version, not just preprint p.14, was read. |
| 4.13 | deligne §5.2/Table 5.3, printed pp.328–329, visually; rjw lines 4013–4041, §13.5.3 pp.71–72 | Real linear involution is separate from coefficient conjugation; Gamma signs and the complex-place multiplicity agree. |
| 4.16 | rjw lines 3767–3803, 3829–3854, §13.2, Definition 13.12, Proposition 13.13/Corollary 13.14, pp.66–68 | Closed unit images and Artin direction resolved; the reversed quotient in the source is corrected. R03 concerns duplicate ownership, not the corrected sequence's truth. |
| 4.20 | rjw lines 3960–4012, §13.5.2, pp.70–71 | The roadmap repairs the source's field label and inequality; even positive n uses X⁺, odd positive n uses X⁻, nonpositive n uses Y. |

The pin audit used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native declarations/definitions were opened, not inferred from their names:

| Native file and line | Object and scope checked |
| --- | --- |
| `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:319` | The tensor/completion bijection requires a finite module over a Noetherian ring. It says nothing permitting the algebraic tensor of arbitrary local multiplicative groups. |
| `Mathlib/Algebra/Module/Submodule/Map.lean:213` | Image/preimage adjunction, with the semilinear scalar-surjectivity assumption in scope; ordinary linear maps specialize it. |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`, `Basic.lean:54` | TopRep bundles a topological module and groupwise continuous linear maps. It does not itself assert continuity in the group variable, compactness or Hausdorffness. The actual Tate coefficient has its supplied topology/action. |
| `TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean:195`, `:220`, `:244` | Native Galois representation, cyclotomic scalar action and its continuity; the Lean adapter uses this action rather than an arbitrary topology. |
| `TauCeti/NumberTheory/Padics/MultiplicativeCompletion/Basic.lean:59`, `:77`, `:94`, `:102` | Power-quotient transitions, compatible-family carrier, membership and the canonical map. |
| `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:384`, `:463`, `:480` | Finite-level Kummer isomorphism, actual coefficient-transition square and surjectivity; invertibility in the field is required. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean:454` | Shapiro for a closed subgroup of a profinite group and smooth discrete coefficients; it is not the compact arithmetic Iwasawa comparison. |
| `TauCeti/Algebra/Group/PrimaryDecomposition.lean:119` | Decomposition of a finite abelian group into prime components; it does not prove finite-cotype decomposition with Prüfer summands. |
| `TauCeti/Geometry/Hodge/Structure.lean:62` | Opposed exhaustive decreasing filtration; finite dimension is not a structure field and is correctly separately bound in Suggested.lean. |
| `TauCeti/Geometry/Hodge/Dimension.lean:73`, `:82`, `:88`, `:97` | Hodge number, finite support, symmetry, dimension sum. Infinite-dimensional finrank junk values are excluded in the headline signatures. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, `:53`, `:76`, `:94`, `:103`, `:109` | Γℝ/Γℂ definitions, totalized zeros, analytic reciprocals and the residue at zero. Orders are meromorphic orders, not pointwise nonzero tests. |

Ownership was searched by object using the roadmap tools across main and indexed open heads, the supplied sibling heads and board packages. Main-roadmap form was compared with EllipticCurves, ClassFieldTheory and PadicMeasuresIwasawaAlgebras. The following cross-roadmap boundaries were resolved (line numbers are the actual README, excluding the tool's synthetic header):

| Supplier file under `TauCetiRoadmap/`, unless marked Completed | Resolved sections / evidence |
| --- | --- |
| `ArithmeticGaloisDuality/README.md:598`, `:699`, `:1189`, `:1303`, `:1401`, `:1617`, `:1664`, `:1694`, `:1835` | R02.1.2–1.3, R02.2.1–2.3, completion/global-unit/S-unit and restricted-ramification contracts. |
| `ArithmeticGaloisDuality/README.md:3119`, `:3438`, `:3507`, `:3871`, `:5068`, `:5387`, `:5571`, `:6013`, `:6227`, `:6427`, `:6481`, `:6513`, `:6595`, `:6744`, `:6807` | Local/global finite duality; function-field input; D7 compact coefficients, local/global duality, abelian pairings and dual local conditions; Greenberg–Wiles and deformation cocycles. The one bad locator is R05. |
| `IntegralIwasawaTheory/README.md:274`, `:1304`, `:1320`, `:1336`, `:1355` | §2.0 and §§10.0–10.3 match the common arithmetic cochains, ordinary/modified distinction, Shapiro and all-Tor descent. §§2.1–2.3/2.7 additionally force R03. |
| `NoncommutativeAndEquivariantIwasawa/README.md:1750` | F.4 resolves the named complex APIs and the omitted module-level ownership in R02. |
| `FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1350`, `:1392`, `:1466`, `:1503`, `:4696`, `:4833`, `:4875`, `:4960`, `:4983`, `:5122`, `:5154` | Period structures, fundamental sequences, crystalline predicates, translated interval realization and period comparison; opposite Hodge–Tate signs are explicitly reindexed. R04 is the remaining overlap. |
| `PadicMeasuresIwasawaAlgebras/README.md:909`, `:2361`, `:2409`, `:2530`, `:2710`, `:3172`, `:3447`, `:3736` | §§1.7,4.1–4.2,4.4,4.6,5.1,6.1,6.3: completed algebra, structure, characteristic ideals, determinants and square presentations. |
| `DerivedModuleAlgebra/README.md:1403`, `:2316`; `PerfectoidTowers/README.md:1849` | Tower kernel/cokernel, Milnor and spectral-sequence inputs; continuous cochains into limits. |
| `SchemeAndStackFoundations/README.md:2071`, `:3265`, `:3309`, `:3656`, `:3867`, `:4428` | §§1.1,2.1,2.2,2.11,2.15,2.22 are the named sheaf/cohomology/Brauer inputs. |
| `ClassFieldTheory/README.md:920`, `:1552`, `:1683`, `:1724`, `:1799`; `Completed/ProfiniteProPGroups/README.md:1656` | Main/completed suppliers exist independently of their later revision entries in the order. The two mechanical upward labels are false positives, explained below. |
| `EllipticCurves/README.md:647`, `:1262`; `LocalGaloisGroups/README.md:447`, `:654`; `LocalFieldsRamification/README.md:267`, `:705`, `:1132`; `ProfiniteCohomology/README.md:960`, `:1060`, `:1168`, `:1363`, `:1549`, `:1739`, `:2091`; `HeightsAndUnits/README.md:419` | Weil/Kummer/Selmer discrete interfaces, local completion and ramification, all-degree cohomology operations, and S-unit rank. The new compact Kummer limit and finite-cotype theorem are not those supplied finite/discrete statements. |
| `PadicPeriodRings/README.md:74`, `:214`, `:333`, `:359`; `NeronModelsAndSemistableAbelianVarieties/README.md:1656`, `:1759`, `:1826`, `:2923`; `AbelianSchemesAndArithmeticModuli/README.md:1024`, `:1066`, `:1331`, `:1453`, `:1571`, `:1842`, `:2435` | Period carriers, semistable/Raynaud comparison and geometric duality/uniformization interfaces named by §§2.12a and 4.26–4.29. |
| `CyclotomicClassGroupsAndStickelberger/README.md:940`, `:961`; `LFunctions/README.md:346` | The former transports IntegralIwasawaTheory's class modules; the latter owns the analytic record. These give R03 and R01 respectively. |

The own Lean namespace was searched against the supplied sibling files and the roadmap object searches; no second declaration with any of these 17 fully qualified names was found. The base/Part II split was checked against `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/README.md:9`; it consumes this base's weak-semisimplicity work. The Hodge/Gamma and twist references in PeriodsAndSpecialValues and PadicHodgeRegulators are consumers/comparisons, not grounds for moving this base's native headline formulas upwards. The three reconstruction overlaps above are the ownership defects found.

Fresh dependency-check output (verbatim, containing no machine paths):

```text
not movable: SelmerIwasawaCohomology consumes LFunctions (#306) and is consumed by ArithmeticKTheory (#98), which comes first: moving SelmerIwasawaCohomology after LFunctions would put a supplier after a consumer, a cycle through SelmerIwasawaCohomology
UPWARD: SelmerIwasawaCohomology (#57) -> ClassFieldTheory (#291) at README lines [67,1741,1861,1976,2139,2365]
UPWARD: SelmerIwasawaCohomology (#57) -> LFunctions (#306) at README lines [2082]
UPWARD: SelmerIwasawaCohomology (#57) -> ProfiniteProPGroups (#283) at README lines [55,1356,1861]
depcheck: 158 roadmaps, 1099 edges, 3 problem(s)
```

The supplied gate used an earlier order snapshot and reported two upward lines: LFunctions (#293) and ProfiniteProPGroups (#274). Both versions fail. The ClassFieldTheory and ProfiniteProPGroups lines above are false positives under the brief's main/completed-supplier exemption: the consumed material exists on main, and the citations must continue to select that material rather than the later revision PRs. No order file or tooling was changed. LFunctions is a real upward dependency and remains blocking. No declared supplier gaps were supplied or assumed.

The README headline inventory is: p-adic Kummer; integral weak-semisimplicity lifting; finite-cotype decomposition; Selmer duality/Poitou–Tate and Greenberg–Wiles with deformation/base-change comparisons; Iwasawa Shapiro/descent/control/duality, Euler ranks and determinants; étale/Kato comparison; ordinary Selmer structure and Fitting/characteristic comparison; crystalline realization and finite/ordinary conditions; Hodge Gamma orders and criticality; unit/class-group and Tate-Selmer dictionaries with precisely stated main-conjecture propositions; elliptic finite-condition comparison and adjoint finiteness; ordinary-family parity; Cassels–Tate and congruent-number Selmer parity. Six statable headline theorems are present (the Gamma result has separate real and complex statements). The module docstring names the missing arithmetic, crystalline, determinant, infinite-Selmer and analytic-record carriers for the others. The local congruent-number statement quantifies over all squarefree integers; its negative parameters give the same curve because the equation depends on n², and the residue cases are invariant under n↦−n.

The following adversarial table records **130 computed probe rows**. “Pass” means the displayed instance agrees, not a substitute for a proof of the general target. Rows split the multiple statements inside a section where the witnesses differ. All numbered targets, all six Lean headlines, the sampled targets and the findings' mathematical objects occur below. Algebraic countermodels deliberately violate the indicated hypotheses; they are not asserted to be arithmetic examples.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: Tate action and dual | C₃ acting on 𝔽₇ by 2 | Action 2; contragredient 2⁻¹=4; product 1 | Pass. |
| Conventions: cone shift | 0→k in degree 0 | Fibre H¹=k; kernel complex 0 | Pass; kernel cannot replace fibre. |
| Conventions: determinant | Λ —X→ Λ in degrees 1,2 | H¹=0, H²=Λ/(X); det⁻¹ lattice (X) | Pass. |
| 0.4 tensor/completion | K=ℚ₃,p=3; K=ℚ₅,p=3 | Completions ℤ₃² and ℤ₃; multiplication sends a⊗1−1⊗a to 0; for a∉ℚ this tensor is nonzero after rationalization | Pass; algebraic comparison is not injective. |
| 0.4 dyadic completion | K=ℚ₂,p=2 | ℚ₂ˣ completion C₂×ℤ₂², with −1 retained; dropping torsion gives ℤ₂² | Pass. |
| 0.5 local topology | ℚ₅,p=3, level m | Power quotient C_(3^m); inverse limit ℤ₃; finite-level Kummer has the same 3^m elements | Pass. |
| 0.5 global negative control | ℚˣ/(ℚˣ)² | Independent prime classes give ⊕primes C₂ plus sign, infinitely many elements | Pass; local finiteness not exported globally. |
| 0.6 completion carrier/API | Zero group, ℤ, ℤ/9 at p=3 | Limits 0,ℤ₃,C₉; compatible tuples have respectively 1, infinitely many,9 values | Pass; p⁰ quotient is trivial. |
| 0.7 root tower ML | ℝ,p=2; finite field 𝔽₇,p=3 | At a fixed positive level, eventual root-power images are {1}; lim¹=0 in both cases | Pass; finite does not mean transition-surjective. |
| 0.8 Kummer headline | Separable closure; ℝ,p=2; 𝔽₇,p=3 | H¹/completion pairs 0/0, C₂/C₂, C₃/C₃ | Pass; characteristic p excluded by NeZero. |
| 0.8 characteristic-p control | K=𝔽_p(t) | Étale μ_p=1 gives H¹=0; t has nontrivial p-power class | Excluded correctly. |
| 0.9 S-unit Kummer | ℚ,S={3,∞},p=3 | Units ±3^ℤ complete to ℤ₃; restricted H¹=ℤ₃; class Tate module 0 | Pass. |
| 0.10 H¹ transitions | μ₉→μ₃ over ℚ, class of 2 | Kummer class [2] maps to [2]; quotient projection is onto despite infinite groups | Pass; lim¹ H¹=0. |
| 0.11 restriction/norm/cup | Constant finite coefficient, degree-2 extension; degree-one classes a,b | cor∘res multiplies by 2; cup transpose changes sign (−1)¹; res/cor projection formula gives 2(a cup b) both ways | Pass. |
| 0.12 invariant→coinvariant map | σ=id on k; σ=J₂(1); σ=J₂(2), char k=0 | Map ranks 1,0,0; source/target dimensions (1,1),(1,1),(0,0); bijective yes,no,yes | Pass; full semisimplicity is not required. |
| 0.13 Noetherian criterion | σ=id on O; σ−1 invertible | Maps O→O identity and 0→0; surjective and bijective in each | Pass. |
| 0.13 lifting headline | O=ℤ₃; σ=1,2,4 | Residual/fraction invariant dimensions (1,1),(0,0),(1,0); integral map bijective yes,yes,no | Pass; dimension inequality rejects σ=4. |
| 2.1 Selmer datum | H=k², local k, res(x,y)=x; L=0,k; empty places | Kernels ke₂,k²,k²; strict⊆relaxed has dimensions 1≤2 | Pass. |
| 2.2 kernel formula | Same datum | ker(H→k/L)=ke₂ for L=0; intersection of preimages also ke₂ | Pass. |
| 2.2 compact unrestricted ramification | Completion of ℚˣ at p, valuations p^j at distinct primes | Mod p^m only first m valuations survive; full tuple has infinitely many nonzero valuations | Pass; no finite ramification set inferred from compactness alone. |
| 2.3 changing conditions | H=k,res=id, L=0,L′=k; also H=0 | Selmer quotient k maps isomorphically to k; with H=0 image 0⊂k | Pass; no unjustified final surjectivity. |
| 2.4 functoriality | Identity, zero maps on the one-place datum | Identity induces identity on ke₂; zero induces zero | Pass. |
| 2.5 propagation | g:k²→k first coordinate, L=ke₂ | g(L)=0; g⁻¹(0)=ke₂; both sides of adjunction true; L=k² gives false/false | Pass; native map/comap API suffices. |
| 2.6 saturation/divisibility | T=ℤ₃², V=ℚ₃², finite line ℚ₃e₁ | Preimage ℤ₃e₁, quotient ℤ₃ torsion-free; discrete image (ℚ₃/ℤ₃)e₁ divisible | Pass. |
| 2.7 unramified condition | Trivial B=C₃, ℤ₃, ℚ₃ with procyclic quotient | H¹ur=B and B/(Fr−1)B=B in each case | Pass; shared arithmetic ownership R02. |
| 2.7 non-torsion discrete control | B=ℤ discrete, Fr=1 | Homcts(Ẑ,ℤ)=0 versus coinvariants ℤ | Excluded correctly. |
| 2.8 Greenberg condition | F⁺=0,T; split T=T⁺⊕T⁻ | Condition H¹ur, all H¹; quotient records only the T⁻ inertia class | Pass; R02 ownership. |
| 2.8a ordinary filtration | ℚ_p(n), n=−1,0,1 | Sole graded action χ⁻¹,1,χ; Fil¹ is 0,0,V | Pass; local stability is the required condition. |
| 2.9 restricted arithmetic Selmer | ℚ,μ₃,S={3,19,∞} | Kummer classes span 3,19; strict at 3 leaves [19]; strict at both gives 0 | Pass; R02 ownership. |
| 2.10 dual action/exactness | C₇ character action 2; zero and identity sequences | Dual scalar 4, double dual 2; dual of 0 is 0, of identity is identity | Pass; R02 common-domain ownership. |
| 2.11 corank | 0,C₉,ℚ₃/ℤ₃,(ℚ₃/ℤ₃)² | Compact dual ranks 0,0,1,2; coranks 0,0,1,2 | Pass. |
| 2.12 elliptic Selmer sequence | Mordell–Weil ℤ^r⊕finite, finite Sha[p∞] | Tensor term (ℚ_p/ℤ_p)^r; finite summands contribute corank 0, hence Selmer corank r | Pass; shared carrier R02. |
| 2.12a Kummer/Sha adapter | Surjective multiplication on divisible A(K); finite-level rank-r free part | Point quotient 0 in first case; (ℤ/p^m)^r in second; connecting kernel has the same values | Pass. |
| 2.12a finite-cotype headline | 0,C₉,ℚ₃/ℤ₃,(ℚ₃/ℤ₃)²⊕C₃ | (r,F)=(0,0),(0,C₉),(1,0),(2,C₃); p-torsion sizes 1,3,3,27 | Pass. |
| 2.12a negative finite-cotype control | ⊕ℕ C₃ | p-torsion infinite, whereas every finite-r/finite-F model has finite p-torsion | Excluded by the explicit hypothesis. |
| 2.12a all-place annihilators | Real trivial C₂; complex finite coefficient | Real H¹=C₂ can survive; complex positive cohomology 0 | Pass; dyadic real terms retained. |
| 2.13 perfect pairing/orthogonals | k² dot pairing, L=ke₁ | L⊥=ke₂, L⊥⊥=ke₁; 0⊥=k², (k²)⊥=0 | Pass. |
| 2.13 trace versus O-dual | O=ℤ_p[s],s²=p, p odd | Different (2s); trace dual lattice (2s)⁻¹O, not O; Tr(1/(2s))=0 | Pass; plain trace is not an O-dual identification. |
| 2.14 local dimensions away p | V=ℚ_p trivial over ℚ_ℓ, ℓ≠p | h⁰=1, h²=0; ur dimension 1, singular dimension 0 | Pass. |
| 2.15 finite/unramified error | 𝒲=C₃, Fr=1 or 2 | Fr invariants/coinvariants (C₃,C₃) or (0,0); finite discrepancy sizes 3 or1 on both sides | Pass. |
| 2.15 unramified lattice and real boundary | Unramified T; ℝ,ℤ₂(1) | 𝒲=0 gives finite=ur; real H¹(T)=C₂ while finite rational H¹=0 | Pass. |
| 2.16 rational orthogonality | Zero/full local subspaces under a perfect pairing | Annihilators full/zero; dimensions sum to dim H¹ | Pass. |
| 2.17 finite/lattice orthogonality | C₉ with evaluation pairing, subgroup 3C₉ | Annihilator 3C₉; sizes 3·3=9 | Pass. |
| 2.18 inverse/direct Selmer limits | Compatible C_(3^m) conditions; multiplication by 3 on ℤ₃ | Limits ℤ₃ and ℚ₃/ℤ₃; kernel of ×3 on ℤ₃ is 0 but reduced map on 𝔽₃ has kernel 𝔽₃ | Pass; reduction is not automatic control. |
| 2.19 strict/relaxed Poitou–Tate | Identity localization H=k→k and its dual | Relaxed/strict quotient k; localization rank1; dual obstruction 0 | Pass; with H=0 obstruction dimension1 is retained. |
| 2.20 limit Poitou–Tate | Exact multiplication sequences 0→C₃→C_(3^(m+1))→C_(3^m)→0 | Finite orders multiply; with reduction transitions the first tower has zero transitions, giving limits 0→0→ℤ₃→ℤ₃→0 | Pass. |
| 2.21 fibre and archimedean correction | Module k, odd p, one complex place | Cmod=0, Cord=k[0], Q∞=k[1]; fibre comparison contribution Q∞[−1]=k[0] | Pass. |
| 2.21 real dyadic convention | G=C₂, trivial 𝔽₂ | All differentials 0; Tate H^i=𝔽₂ for every integer i; ordinary negative H=0 | Pass; bounded modified model would fail. |
| 2.22 H⁰ correction | Global 0, local k[0], U=0 | Kernel-defined Selmer 0, fibre H¹=k, correction J=k | Pass. |
| 2.23 condition-change triangle | U=0,U′=k[0], other complexes 0 | Fibres 0,k[0]; cone(U→U′)=k[0] with no added shift | Pass. |
| 2.24 lattice-change error | Inclusion 3ℤ₃→ℤ₃ | Quotient C₃, rational quotient 0; error cone killed after tensor ℚ₃ | Pass. |
| 2.25 descent of vanishing | Index2 with p=3; index3 trivial C₃ | cor res=2 invertible; index3 gives 0 and H¹(C₃,C₃)=C₃ restricts to 0 | Pass; degree condition necessary. |
| 2A.1 arithmetic comparison | Strict condition U=0; local H⁰=k, global0 | Fibre is supplied compact support; H¹ correction k survives | Pass. |
| 2A.2 function-field formula | 𝔽₂(t),p=3, all unramified | Selmer dimensions 1,0; global invariant difference1; local excesses0 | Pass. |
| 2A.2 relaxed place and ℚ comparison | Degree2 place over 𝔽₂; ℚ,p=3 | 3 divides 2²−1: local H¹ dimension2, ur1; Selmer difference2. Over ℚ:0=1−1 | Pass; locator R05. |
| 2A.3 deformation tangents | Trivial n=1 representation over k[ε]/ε² | A cocycle c gives 1+εc; multiplication gives c(g)+c(h); framing term n²−h⁰=1−1=0 | Pass. |
| 2A.4 determinant derivative | Matrix 1+εA, n=2,p=2 | det=1+ε tr A; tr(I)=0, so scalar splitting by 1/2 is unavailable | Pass. |
| 2A.4 real adjoint boundary | char2, u=J₂(1) acting by conjugation | Fixed dimensions in ad/ad⁰ are2/2; norm ranks2/1; Tate dimensions0/1 | Pass; the two real terms cannot be conflated. |
| 2A.5 derived coefficient change | C=[ℤ₃ —3→ℤ₃] degrees1,2; reduce mod3 | H¹(C)=0,H²=C₃; derived H¹=𝔽₃=H²[3], ordinary tensor H¹=0 | Pass. |
| 3.0 coordinates/involution | Γ=ℤ₃; Λ=ℤ₃[[X]] | γ=1+X, ι(γ)=(1+X)⁻¹=1−X+X² mod X³ | Pass; X is not γ. |
| 3.0 torsion/nilpotent coefficients | 𝔽₃[C₃]; 𝔽₃[ε]/ε² | (δ−1)³=0; ε≠0,ε²=0 | Pass; no reduced/domain assumption imported. |
| 3.0 closed subgroup coordinates | 3ℤ₃⊂ℤ₃ | Quotient relation (1+X)³−1, not X | Pass; nonsaturated subgroup retained. |
| 3.1 Iwasawa limit | Infinite p-tower and trivial T=ℤ_p | H⁰ corestriction ×p; compatible sequence a₀∈∩p^mℤ_p=0 | Pass; finite tower has nonzero H⁰. |
| 3.2 induced-action sign | 𝔽₃[ε]/ε², γ=1+ε | γ⁻¹=1−ε; difference2ε≠0; iota-twisted +1 convention yields inverse action | Pass; source misprint not copied. |
| 3.2 semilocal topology | ℤ₅[[T]][C₂]=A×A | ∩J^n=0; for one maximal ideal m₊, ∩m₊^n=0×A | Pass; radical/product topology needed. |
| 3.2 p-torsion finite factor | ℤ_p[[T]][C_p] | (δ−1)^p∈pΛ; radical^p⊆J, J strictly smaller than radical | Pass. |
| 3.3 descent edge | C=[Λ —X→Λ] degrees1,2, augment X=0 | H¹Iw=0; H²Iw[X]=O; specialized H¹=O | Pass; Tor term essential. |
| 3.4 derived Nakayama | C=[Λ —1→Λ] and C=[Λ —X→Λ] | First specialization acyclic and C acyclic; second specialization has two copies of k and is not acyclic | Pass. |
| 3.5 universal norms | ℤ_p valuation direction, unramified p-tower away p | Norm valuations p^mℤ_p; intersection0; unit direction unramified | Pass; finite decomposition would not force intersection0. |
| 3.6 semilocal induction | Finite quotient with two primes, coefficient k | Semilocal module k×k dimension2=coinduced dimension2; choosing one prime alone gives1 | Pass. |
| 3.7 twist | χ(γ)=4 in ℤ₃, k=1,−1,0 | Semilinear scalars 1/4,4,1; dualization inverts again | Pass. |
| 3.8 Iwasawa Selmer adapter | All local conditions full, then strict | Local quotient0, then full local cochains; same supplied fibre for identical diagrams | Pass. |
| 3.9 local specialization error | U=[Λ —X→Λ], reduced at X=0 | Derived U has two O terms; ordinary cohomology tensor loses a term O | Pass; cone degree retained. |
| 3.10 full derived control | Same two-term model | Total-degree-one contribution Tor₁(Λ/(X),O)=O, not0 | Pass. |
| 3.11 classical control | H→Q zero with Q=k | Image I=0, coker(H→I)=0; coker(H→Q)=k | Pass; image and ambient target distinguished. |
| 3.12 duality shift | C=Λ in degree1 | RHom(C,Λ)[−3] lives in degree2; H¹/H² pair in total degree3 | Pass; ι also inverts γ. |
| 3.13 Euler ranks | F=ℚ,T=ℤ_p and ℤ_p(1), p odd | Global rank differences0 and1; real minus ranks0 and1; local ℚ_p rank H¹=1 in both | Pass. |
| 3.13 zero and complex place | T=0; rank-one T over imaginary quadratic F | Differences0 and1 respectively; complex contribution1 | Pass; H² torsion not inferred in general. |
| 3.14 determinant parity | ×X in degrees1,2 versus0,1 | Scalar lattices (X) and (X)⁻¹; valuations+1 and−1 | Pass. |
| 3.15 étale/Kummer comparison | ℚ,S={3,∞},μ₃ | Both H¹ groups ℤ[1/3]ˣ/(·)³=C₃; shared basic comparison has one owner | Pass; R02. |
| 3.15 ordinary dyadic tails | Real place, constant C₂ | H³=C₂ in ordinary Galois and étale models, not0 | Pass; no Tate modification in this comparison. |
| 3.15 j_* versus lisse extension | Inertia fixed space0 versus full V | j_* stalk0 versus V; local correction cannot be discarded uniformly | Pass. |
| 3.16 rational lattice independence | ℤ₃ and3ℤ₃ inside ℚ₃ | Both rationalize to ℚ₃; integral quotient C₃; localization kills it | Pass. |
| 3.17 cofreedom/exceptions | Exceptional residual characters1,ω | H⁰ or dual H⁰ has dimension1, not0; stated exclusion removes these cases | Pass; no unrestricted cofreedom conclusion. |
| 3.18 almost divisibility | Dual X=Λ/(f); compare X=k=Λ/(λ,T) | For primes π not dividing f, S/πS=0; k has every π acting0, so fails for infinitely many π | Pass. |
| 3.19 surjectivity criterion | Localization id:k→k; zero:k→k | Cokernels0,k; dimension/rank equality alone cannot turn the second into surjective | Pass; criterion retains its additional hypotheses. |
| 3.20 pseudo-null obstruction | Λ/(T) and residue field k | First has no finite submodule; second is itself finite/pseudo-null | Pass; hypothesis is substantive. |
| 3.21 Fitting=characteristic | X=Λ/(f),0,k | Ideals ((f),(f)),(Λ,Λ),((λ,T),Λ) respectively | Pass; k excluded. |
| 3.21 coefficient generality | O=𝔽₃[[λ]]; O=k[[λ]], k infinite | p=0, Λ/(p,T)=O infinite length; Λ/(λ,T)=k has length1. Infinite k has no finite-cardinality submodule | Pass; uniformizer and finite residue field are necessary as stated. |
| Source uniformizer control for 3.21 | O=ℤ₃[π],π²=3; X=Λ/(π) | Height-one length1; Λ/(3^a) has length2a, so p-powers cannot supply the elementary π-factor | Source error; roadmap uses λ correctly. |
| 4.7 period realization | p=5, weight0 W(k)/5; zero object | Realizations C₅ and0; Bcris tensor of either finite object0 | Pass; rational tensor is a wrong torsion model. R04 ownership. |
| 4.7 sign/interval conversion | Filtered jump−1; jump+1, p=5 | Covariant ℤ₅(1),ℤ₅(−1); local weights−1,+1 and supplier weights+1,−1 | Pass. |
| 4.8 crystalline extension submodule | Zero extension; trivial lattice extension with unramified class | Split middle R⊕ℤ_p; class0 included; Baer sum adds the unramified parameters | Pass; every finite reduction is tested. |
| 4.9 Bloch–Kato dimensions | K=ℚ_p,V=ℚ_p,ℚ_p(1) | (dim t,h⁰)=(0,1),(1,0); dim H¹f=1,1; full H¹ has dimensions2,2 | Pass. |
| 4.10 finite preimage | ℚ₅,ℤ₅ and ℤ₅(1) | Unramified ℤ₅ line in first; unit Kummer line in second; uniformizer valuation1 excluded in second | Pass. |
| 4.10 negative interval test | ℤ₅(1), all reductions in purported wrong supplier interval[−1,0] | Twisting would put ℚ₅(2) of weight2 in[0,1] | Contradiction excludes wrong sign, as README states. |
| 4.11 integral trace correction | s²=p, δ=1/(2s), z=1/(2s) | Tr(z)=0 but Tr(δz)=1/(2p)∉ℤ_p | Pass; scaled trace detects the missing O-dual character. |
| 4.12 finite/strict/Greenberg | ℚ_p trivial line; ℚ_p(1) | Trivial: strict0,finite dimension1; twist1: finite dimension1,Greenberg dimension2 | Pass; no blanket equality. |
| 4.13 real realization | Weight0 line with F∞=+1 or−1 | Same Hodge piece; Γℝ(s) orΓℝ(s+1); orders at0 −1 or0 | Pass; ω does not determine F∞. |
| 4.13 dual and twist | Tate type(n,n), F∞=(−1)^n | Dual-twist type(1−n,1−n), sign−(−1)^n=(−1)^(1−n) | Pass. |
| 4.14 real Gamma headline | Empty factors; real shift0 at m=0,−1,−2 | Products1,Γℝ; pole counts0,1,0,1; orders0,−1,0,−1 | Pass, including totalized value0 at poles. |
| 4.14 complex Gamma headline | Complex shift0, m=0,−1; weight-one pair(0,1),(1,0) | First orders−1,−1; real place Γℂ(s), complex place Γℂ(s)², order at0 −1/−2 | Pass. |
| 4.14 record comparison | Two real zero shifts plus one complex zero shift | Product Γℝ²Γℂ, count3, order−3 at0 with or without the matching record | Math passes; move comparison per R01. |
| 4.15 criticality | n=−1,0,1,2 | Orders of Γℝ(1−n),Γℝ(n) are (0,0),(0,−1),(−1,0),(0,0); critical yes,no,no,yes | Pass; n=0 not silently treated as critical. |
| 4.16 class/ramified carriers | Constant C₃ norm system; p=3,c=1 | Class limit C₃; plus C₃,minus0; e⁺=1,e⁻=0 | Pass; duplicate ownership R03. |
| 4.16 dyadic projector control | p=2, C₂ with c=1 | 1/2 absent from ℤ₂; integral plus/minus projector formula undefined | Excluded correctly. |
| 4.17 reciprocity quotient | E=3ℤ₃⊂U=ℤ₃, C=0 orE | U/E=C₃; quotient sequence kernels C₃ in both cases; E/U not a quotient by a subgroup | Pass; R03 imports maps. |
| 4.18 Leopoldt/strict Selmer | F=ℚ,p odd | Global-unit rank0; localization kernel0; defect0 and strict Tate-unit Selmer corank0 | Pass. |
| 4.19 norm/Kummer and Euler direction | Norm-compatible unit tuple; Frobenius action scalar a | Kummer norm of u_(n+1) equals class of u_n; Euler operator1−Fr⁻¹ acts1−a⁻¹, not1−a | Pass. |
| 4.20 Tate Selmer dictionary | n=−1,0,1,2 | Fil¹=0,0,V,V; modules used Y⁻,Y⁺,X⁻,X⁺ respectively; n=2 dual twistχ⁻² | Pass. |
| 4.20 real-tower descent | Order-two quotient, p=3 | Averaging denominator2 is a unit; nontrivial sign homomorphisms select the minus eigenspace | Pass; field is F∞⁺. |
| 4.21 components/corank | Finite tame Δ with character orbits of degrees d_i | A single free O_i[[T]] summand has base Λ-rank d_i; all components sum Σd_i | Pass; no split-character dimension assumed over too small a field. |
| 4.22 normalized main-conjecture proposition | Trivial/nontrivial tame components; twist k | a components γ−1 and1; twist sends first toχ(γ)^−kγ−1, notγ−1 | Pass; normalization factor transported. |
| 4.23 leading-term datum | Rank0 trivialization; rank1 regulator scaled by u∈Oˣ | Fractional lattice O in rank0; basis change multiplies scalar by u⁻¹ and basis by u, unchanged lattice | Pass; no existence theorem hidden in the datum. |
| 4.24 global finite reductions | S=ℤ_p, reduce modp; saturated image0 orS | Quotients0 or𝔽_p, torsion-free source ranks0 or1; modp dimensions0 or1 | Pass; independent local choices need not be global images. |
| 4.25 bounded away-p torsion | Rational H⁰ and dual H⁰ vanish | Local Euler dimension H¹=0; a finite integral group C_(p^a) is killed byp^a | Pass; unramified trivial line has H⁰=1 and is excluded. |
| 4.26 elliptic finite condition | Finite K/ℚ_p, elliptic curve, rank2 Tate module | dim Lie(E)=1 overK; finite H¹ dimension[K:ℚ_p]; no extra valuation line for a multiplicative uniformization quotient | Pass; all reductions retained. |
| 4.26 global finite Selmer | Mordell–Weil rank r, Sha divisible corank d | Rational finite Selmer dimension r+d; vanishes iff r=d=0; finite-cotype Sha then finite | Pass. |
| 4.27 finite-image adjoint | Trivial representation over ℚ; finite splitting group C_p | Unramified class quotient Clℚ[p]=0; H¹(C_p,O)=0 for torsion-free trivial O, H²=O/pO finite | Pass; finite group error retained even when p divides its order. |
| 4.28 alternating torsion parity | G=C₃² with determinant pairing; G=C₃ | First pairing perfect alternating, dim G[3]=2 even; on cyclic group every alternating pairing0, hence not perfect | Pass. |
| 4.28 filtration parity | Symplectic C₉² | Successive paired layers have dimensions2,2; total p-torsion dimension2, even | Pass. |
| 4.28 derived/family parity | Self-dual two-term rank2 model with alternating differential [[0,a],[−a,0]] | If a≠0 generic nullity0; if a=0 nullity2; parities0,0 | Pass; determinant a² and residual rank changes even. |
| 4.28 quadratic/odd-character comparison | E⊕E^χ; pair ψ,ψ⁻¹ distinct | Coranks add r+rχ; equal inverse-character coranks contribute2rψ≡0 mod2 | Pass under stated duality/invariant hypotheses. |
| 4.29 Cassels–Tate radicals | G=C₃² with determinant pairing; G=ℚ₃/ℤ₃ with zero pairing | First radicals0 and perfect quotient size9; second radical whole divisible group and reduced quotient0 | Pass; finiteness not inferred before quotienting. |
| 4.29 n-torsion annihilator | G=C₉² with determinant pairing, n=3 | G[3]=3G; annihilator3G=nG; each has order9 | Pass. |
| 4.29 elliptic alternating size | Reduced group with perfect alternating pairing | Symplectic C₃² has size9=3²; C₃ cannot satisfy perfect alternating hypothesis | Pass. |
| 4.29 local Kummer carrier | n=1, p=2, point(X,Y)=(2,4) | 4²=2³+4·2=16; image class2; O and(0,0) give1 | Pass; zero map would miss2. |
| 4.29 local cardinality headline | (p,n)=(2,1),(2,3),(2,5),(2,6),(3,3),(5,5),(3,1) | Image sizes4,2,2,1,1,2,2; displayed formula yields4,2,2,1,1,2,2 | Pass. |
| 4.29 signs/zero control | n=−1 versus1; n=0 | n² and local image unchanged; residues7/1 both select4 at2; Squarefree0 is false | Pass; no singular curve admitted. |
| 4.29 infinite Selmer parity | Positive squarefree n≡1,2,3,5,6,7 mod8 | Let r₃ count odd prime divisors ≡3 mod4. log₂ of the local-ratio product is −r₃ for odd n≡±1, −1−r₃ for odd n≡±3, −2−r₃ for even n; parities0,0,0,1,1,1 | Pass; theorem is about Selmer corank, not an asserted Mordell–Weil rank. |

## Not verifiable

- Greenberg, *Iwasawa theory for p-adic representations* (1989), is still unavailable as readable text: the legal Project Euclid endpoint returned an access/refusal page, and the author's bibliography supplied no usable copy. The attempted locations are recorded under the same `greenberg-iwasawa` source key in the scratch missing-reference list. RJW's readable Tate-Selmer account and the separate readable Greenberg structure preprint were checked; this does not certify all locators into the 1989 article.
- Ax, Tate's 1967 article, Neukirch–Schmidt–Wingberg and Silverman's *Arithmetic of Elliptic Curves* resolved only to paywalled/uncertified sources. Their exact published passages were not claimed verified and were not requested again under renamed keys. The fetched open primary sources and resolved supplier contracts support the sampled checks described above.
- Burns–Flach and Cassels IV/VIII were fetched legally as image-only scans. They are not part of the seeded sample; their full pairing/parity proofs were not visually certified in this review. Deligne's two sampled image-only pages were visually read and are not an access gap.
- The table is an adversarial calculation record, not a formal proof of every prose theorem. In particular the arithmetic hypotheses of the broad ordinary-family parity application are supplier-dependent; the algebraic sign, duality and boundary examples were computed, not a proof of that application from first principles. No acceptance is issued while the substantive gate and ownership issues remain.

## Source issues

- **Error** in rjw at §10.5, (10.8), printed preprint p.53, rjw lines 3071–3087: the source identifies the local completion with an unrestricted algebraic tensor; it should use the p-adic completion and its noninjective algebraic-tensor comparison; affects a stated result.
- **Error** in rjw at Theorem 13.1 and Definition 13.3, printed preprint p.65, rjw lines 3710–3746: the source uses powers of p for elementary uniformizer factors over arbitrary O_L; it should use a uniformizer of O_L, including ramified coefficients; affects a stated result.
- **Misprint** in rjw at Definition 13.12 discussion, printed preprint p.67, rjw lines 3833–3835: the source equates r₁+r₂−1 with p^(n−1)(p−1)/2; it should be p^(n−1)(p−1)/2−1 for this cyclotomic field; affects a stated result.
- **Gap** in rjw at proof of Proposition 13.13, printed preprint p.68, rjw lines 3842–3845: the source infers Mittag–Leffler from finite generation over ℤ_p; it should justify inverse-limit exactness by compactness or finite quotient systems; affects the proof.
- **Misprint** in rjw at proof of Corollary 13.14, printed preprint p.68, rjw lines 3851–3854: the source reverses the global-unit and local-unit quotients; it should use U/E and (U/C)/(E/C); affects the proof.
- **Misprint** in rjw at Definition 13.19(1), printed preprint p.70, rjw lines 3942–3945: the source asks for a globally stable ordinary filtration; it should ask for stability under the local decomposition group; affects a stated result.
- **Misprint** in rjw at §13.5.2(3), printed preprint p.71, rjw line 3995: the source gives n≥0 for the unramified branch; it should give n≤0; affects a stated result.
- **Misprint** in rjw at §13.5.2(3)–(4), printed preprint p.71, rjw lines 3998–4011: the source labels the descended Selmer group by F∞; it should label it by the real tower F=F∞⁺; affects a stated result.
- **Misprint** in nekovar at Proposition 8.4.4.1(i), printed p.206, nekovar lines 7842–7863, also visually inspected: the source puts exponent −1 on the middle iota-twisted tensor model; it should be +1, consistent with its scalar action and the proof; affects a stated result.
