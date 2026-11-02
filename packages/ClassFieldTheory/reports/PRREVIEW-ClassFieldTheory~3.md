# Review of ClassFieldTheory (pull request #1215 at 9eebcb3)

**Verdict:** needs changes

Eight findings: six blocking (one P1 and five P2), two P3. No pull-request file was changed.

**Previous findings, checked first.** The supplied previous artifact identifies #1411 at 90bf034, not this #1215 head. Its eleven findings were compared with the requested files; its old lines, pins and build results were not assumed current. No repair report marking a finding “not actionable in this package” was available.

| Previous finding | Passage or evidence at this head | Assessment |
|---|---|---|
| R01 dependency warnings | `Suggested.lean:1–12` now imports only Mathlib and individual Tau Ceti modules. | Repaired for the former import/warning defect. Direct elaboration has only sorry warnings. A different consumer-build failure remains: R01 below. |
| R02 nonexistent absolute-filtration supplier | `README.md:1401`: “for a finite abelian Galois extension”. | Repaired: the claimed LocalFieldsRamification §4a.1 and absolute upper-filtration contract have been removed. The finite theorem uses the existing finite filtration. |
| R03 admitted data / headline inventory | `Suggested.lean:19`: “the two small definitions they need”. | Admitted data repaired: both definitions have real bodies. Inventory partly repaired; Weil reciprocity, principal ideal and the retained Nakayama–Rim lattice target need R02. |
| R04 native-library duplication | `README.md:90`: “The local Brauer group … its invariant map”. | Partly repaired in Lean and the consumed table; redevelopment remains in Scope and the layers: R03. |
| R05 equal-characteristic overlap | `README.md:1402`: “of nonarchimedean local fields”. | Not repaired: FunctionFieldArithmetic §4.2 still owns the equal-characteristic extension of the base theory: R04. |
| R06 quadratic-only ring class fields | `README.md:1918`: “the quadratic hypothesis … is load-bearing”. | Not repaired: the special formula for an order is still used to exclude the general theorem: R05. |
| R07 arbitrary symbol coordinate | `README.md:1001`: “cup product followed by the invariant”. | Repaired at the public-definition level: no free-coordinate symbol is defined in Suggested.lean; the prose specifies the invariant. An explicit cubic sign Check is still needed under R08, but the former admitted definition is gone. |
| R08 forbidden imports | `Suggested.lean:1–12`. | Repaired; the supplied gate reports imports=0. |
| R09 padding | `Suggested.lean:82,91`: the ordinary and strict dimension theorems. | Former API/check catalogue removed; two native-theorem restatements remain: R07. |
| R10 shape / locators / Checks | `README.md:3`: “Purpose”; `README.md:2188`: “Sections 1–5”. | Not repaired: R08. |
| R11 fences / anchors | Supplied gate: residue=0, long-fences=0, tex=0. | Repaired. No repeat finding for these categories. |

## R01 (P1) — The required build gate still fails

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1–12` and its changed public interface; the supplied gate for this head reports `build=17 FAIL`.

**Claim:** Successful elaboration of this file does not satisfy the required four-module build. Consumers still refer to declarations removed by the acceptance-test rewrite, and also contain stale native names.

**Witness:** `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:2540` cannot resolve `ClassFieldTheory.H`; lines2541 and2583 cannot resolve `ClassFieldTheory.localSymbol` and `ClassFieldTheory.hilbertProductFormula`. The supplied build exits1.

**Repair:** Coordinate migration of the affected consumer to native cohomology/symbol carriers and the surviving arithmetic headline, and replace its stale quadratic trace/norm references with declarations actually present at the pin. Do not restore admitted data or the API catalogue to this acceptance test. Rerun `lake build TauCetiRoadmap.ClassFieldTheory.Suggested TauCetiRoadmap.GlobalQuadraticForms.Suggested TauCetiRoadmap.IntegralLattices.Suggested TauCetiRoadmap.QuadraticFormInvariants.Suggested` and the gate. This review makes no consumer edits. Direct elaboration here succeeds, so the verified control is a passing ClassFieldTheory module alongside the failing required consumer build; no claim that the whole gate is repaired is warranted.

The remaining diagnostics in that same failing category concern `finiteHilbertSupport`, `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, resulting metavariables/goals, and the trace/norm names at consumer lines2852,2858,2920,2924. These are one build failure, not seventeen independent mathematical findings.

## R02 (P2) — Native carriers support omitted headline statements

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:43–46`: “no Weil-group carrier with its own topology … exists”; `TauCetiRoadmap/ClassFieldTheory/README.md:1867`: “the principal ideal theorem”; lines632–637 retain the arbitrary-rank projectivity target.

**Claim:** The module docstring incorrectly declares Weil reciprocity unstatable. The principal ideal theorem and the retained Nakayama–Rim lattice theorem are neither stated nor classified in the docstring.

**Witness:** `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181` defines `WeilGroup`; `WeilGroup/Topology.lean:78` gives its topology. Scratch signatures for Weil reciprocity, Hilbert-field principalization and the lattice projectivity criterion all elaborate at the pins.

**Repair:** Import the native Weil topology and state the mixed-characteristic topological reciprocity isomorphism with compatibility with the native absolute Artin map. State principalization in the Hilbert field, for example as a clause on the same existential field in `exists_hilbertClassField`: every extended integral ideal is principal. Inventory Layer0's remaining deep results as well; the cohomologically trivial, underlying-free representation criterion can use native `Rep`, `tateCohomology`, `Module.Free` and `Module.Projective`, carrying the stated PID/characteristic/prime hypotheses. Delete the inaccurate missing-carrier explanation. Do not introduce surrogate predicates.

**Test of the repair:** All three scratch signatures elaborated under default options. The Weil statement distinguishes degree1 on a uniformizer from degree0 on a unit; principalization at K=Q gives the ordinary principal ideal `(2)`; the lattice statement includes the rank-zero representation and the regular Z[C₂]-module, and excludes the nontrivial Tate cohomology of the trivial Z-module. These probes establish statability, not truth. The global conductor/ray headline is already named as unavailable in the docstring.

## R03 (P2) — The README still plans objects already proved at the pin

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:90–105`, `939–989`, `1041`, `1195`, `1286`, `1534–1558`, `1952`; also lines642–645 on arbitrary-rank PID freeness. Representative claim: “This roadmap owns the following constructions and theorems”.

**Claim:** The consumed table and Lean docstring defer native objects, but the ownership list and build layers still construct their identical carriers and prove their existing laws. This leaves two contradictory accounts of the work.

**Witness:** Actual native bodies occur at `Brauer/Invariant.lean:195` (`invMap`), `Local/Duality/Basic.lean:95` (`tateDual`), `Local/ArtinMap.lean:109` (`artinMap`), and `TauCeti/LinearAlgebra/FreeModule/PID.lean:36` (arbitrary-rank freeness).

The first three paths are under `TauCeti/NumberTheory/ClassFieldTheory/`. Further opened witnesses are `Local/ClassFormation.lean:119`, the Weil carrier/topology listed in R02, `TauCeti/RepresentationTheory/Homological/TateCohomology/Projective.lean:50` (`Rep.isZero_res_of_projective`), and Mathlib's `legendreSym.quadratic_reciprocity` at `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107`.

**Repair:** Delete the redevelopment targets for these objects and already-proved laws; put their exact declarations and hypotheses in supplier contracts and the Scope deferrals. Keep genuinely new comparisons and arithmetic conclusions, explicitly identifying what differs. The finite-Galois-character conductor adapter is distinguishable from the native continuous-character definition and need not be deleted on name similarity alone. Test the retained comparisons on invariant1/4 restricting to1/2 in degree2, arithmetic Frobenius ζ₅↦ζ₅², and the free submodule `⊕ᵢ 2Z eᵢ ⊆ ⊕ᵢ Z eᵢ` of infinite rank; native definitions give exactly the intended objects in all three cases. A different proof route for ordinary quadratic reciprocity is a worked example, not ownership of a new theorem.

## R04 (P2) — The equal-characteristic extension has another owner

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:1401–1409`; `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:105`. The theorem ranges over “nonarchimedean local fields” in both characteristics.

**Claim:** The roadmap omits the existing extension boundary and replans the equal-characteristic unit-filtration comparison. It excludes the corresponding full existence theorem without naming its owner.

**Witness:** The supplied open head of `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1101–1155`, §4.2, states full equal-characteristic reciprocity/existence and the same `U^r ↦ G^r` comparison at lines1115–1122.

**Repair:** Cite FunctionFieldArithmetic §4.2 for the equal-characteristic extension and retain the genuinely new mixed-characteristic filtered-norm work here. Assemble the general theorem from the two cases; do not narrow the general library statement. FunctionFieldArithmetic's base formation/reciprocity inputs must be read from the already pinned base theory, rather than creating a dependency back onto this new comparison. Record the boundary in Scope and ownership. For both sides use F₂((t)), y²−y=t⁻¹: degree2, norm index2, upper break1, conductor2, image at depth1=C₂ and at depth2=1. The two purported owners cover exactly this instance. No new Artin–Schreier–Witt implementation belongs here.

## R05 (P2) — A quadratic proof formula is used to restrict the ring class field theorem

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:1918–1926`: “This roadmap therefore asserts no ring class field for a general nonmaximal order”.

**Claim:** Failure of the description `O = Z + f O_K` outside quadratic fields is treated as failure of the general order-class-field construction. That is a restriction imposed by the chosen route, not by the object or theorem.

**Witness:** Kopp–Lagarias v3, Theorems1.1–1.3, pp.3–5, quantify over every number field and every order: `kopp-lagarias line 128`, line160, line174. The arithmetic Artin isomorphism specializes to the ring class field.

**Repair:** Use the actual order and its local unit/congruence data to define the general idelic Picard quotient and its class field. Generalize the Artin isomorphism, ramification and splitting statements; retain `Z + f O_K` as a quadratic specialization. `Completed/GlobalNumberFields/README.md:571–620` already supplies general orders and invertible Picard groups and explicitly leaves their class fields here. The higher-degree maximal-order control K=Q(ζ₇+ζ₇⁻¹) has degree3, discriminant49 and Minkowski bound14/9<2; thus Pic(O_K)=1 and H=K. The proposed general statement includes this endpoint. The source also covers nonmaximal orders without asserting that their conductor alone determines them. [Kopp–Lagarias v3](https://arxiv.org/abs/2212.09177v3).

## R06 (P2) — Finite Weil-group functoriality needs separability and a chosen embedding

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:1551–1554`: “continuous injection `W_L → W_K` with open image of index `[L:K]`”. Lines1567–1569 explicitly allow every nonarchimedean local field.

**Claim:** The index is asserted for arbitrary finite extensions, although inseparable extensions are permitted in equal characteristic. No embedding into the base separable closure is specified for this map.

**Witness:** Put K=F₂((t)), L=F₂((s)), t=s². Then [L:K]=2 and f=1; restriction identifies the absolute Galois and Weil groups, so the image index is1, not2.

**Repair:** State this functoriality for finite separable extensions with a chosen K-embedding L→Kˢ, and consume the native `weilTransfer K L ι`. Its pin explicitly has this embedding at `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Transfer.lean:71–74`; the index theorem is at167. The embedding cannot exist for this purely inseparable quadratic example, so the repaired statement excludes it. If arbitrary finite extensions are desired separately, use the separable degree for the index and distinguish that result. Keep the checks for an unramified quadratic extension (degree map multiplies by2; index2) and a separable totally ramified quadratic extension (degree map multiplies by1; index2).

## R07 (P3) — Delete the two native dimension restatements

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:82,91`: the ordinary and strict cohomological-dimension theorems.

**Claim:** Both statements are weaker specializations of native theorems already proved at this pin, so they are padding in the acceptance test.

**Witness:** `TauCeti/NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104` and `Strict.lean:235` prove the same equalities for every characteristic-zero nonarchimedean local field. Both scratch replacements close with one `exact` application.

**Repair:** Delete them from `Suggested.lean`; cite the native results in supplier contracts. Do not prove them in place. The one-tactic application supplies characteristic zero explicitly through the injective Q_p-algebra map, using `charZero_of_injective_algebraMap`; no option override is needed. The completed probe has fifteen remaining sorry warnings instead of seventeen and no errors. At K=Q₂ and ℓ=2 or3 both imported results give2, exactly as the removed statements require.

## R08 (P3) — Supply target-level locators, dependencies and discriminating Checks

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:3`, `245–508`, `596–693`, `1961–2122`, `2188–2190`. The reference assigns abstract existence to “Sections 1–5”.

**Claim:** The README lacks the required Summary/Exact supplier contracts/numbered-layer structure, per-target Needs, and per-definition APIs with three discriminating Checks. The seeded conventions and worked examples mostly have no theorem-and-page locator beside the claim. Layer0 still contains porting/audit instructions instead of resolved inputs or mathematical targets. Numerous own backticked API names do not denote declarations in this acceptance test.

**Witness:** Artin–Tate's published contents place abstract existence in XIV §6, p.163 (`artin-tate line 117`), not §§1–5. The current dependency table at README2158 gives Layer5 inputs1–4 although README881–889 explicitly separates it from those layers.

**Repair:** Use the specified headings and per-target prose. Keep imported material in Scope/contracts; resolve every generic-supplier instruction to an existing declaration or a precisely owned mathematical target. Give each remaining definition its API and three concrete Checks, including the cubic invariant1/3 versus its inverse2/3 for the Hilbert-symbol coordinate and the inseparable negative control in R06. Add per-layer Examples and Dependencies, and make the summary graph agree with the target-level dependencies. Use prose instead of speculative own backticked names. Correct the Artin–Tate locator to XIV §6, p.163; add exact locators for the sampled items using the evidence below or mark unavailable source text honestly. Removing the false §§1–5 attribution is verified directly against the contents; the normalization tests below distinguish the intended maps from their inverses. Preserve all general mathematics while reorganizing it.

## Verified sound

The full README (2,234 lines) and Lean file (305 lines) were read. This repairs the existing ClassFieldTheory roadmap on main; it is not a replacement roadmap. Shape comparisons used GlobalNumberFields, NumberFieldArithmetic and OrthogonalL2Bases on main. The outside-folder diff is empty; the worktree is clean. No algorithm, copied passage, `set_option`, admitted data or admitted example was found in these files.

**Build and binders.** Direct `lake env lean` on the requested Suggested.lean succeeded with exactly seventeen sorry warnings and no other diagnostics. A fresh scratch copy with `#check @name` for every actual declaration also succeeded: nineteen declarations, consisting of seventeen theorems and two definitions. The worker's extra twentieth name, `of`, is a comment-parser artifact. All nineteen signatures were compared with the README: coefficient, local-field, valuation-extension, Galois/abelian/cyclic, support and archimedean hypotheses survive. No dropped section binder was found and no target was edited. Smoothness is an explicit argument of the Euler theorem, which is sufficient; the prose's older description as an instance should be aligned when reformatted.

The padding probe tried `simp`, `rfl`, `infer_instance`, then native dimension lemmas: only the two dimension results closed. Three omitted-headline probes also elaborated. Missing native object files were built individually. No bare build, update, pin change or option override was used.

The supplied gate has every static category at0, including imports, sorry-data, depcheck, stray-files and outside-folder, but `build=17 FAIL`. Direct elaboration does not erase that result. The independent prescribed dependency check returned:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. All fifteen layer-wide Prerequisites lines and the supplier tables were read. There are no target-level Needs lines. No declared gap was available. The check is a roadmap-name graph check; it does not detect the overlapping ownership in R04 or the internal dependency-table disagreement in R08.

**Headline inventory.**

| README result family | Status at this head |
|---|---|
| Tate theorem, abstract Artin map, functoriality and norm limitation | Native declarations consumed; no need for another Lean catalogue. |
| Nakayama–Rim package and arbitrary-rank PID freeness (Layer0) | Partly already native, partly retained deep targets; missing lattice headline and duplication addressed by R02/R03. |
| Local Brauer invariant, finite Tate duality and finiteness | Already native; Lean defers them, README must do the same. |
| Local Euler characteristic | Present at Suggested.lean66, with finite discrete smooth coefficients and n≠0. |
| Local class formation and finite/absolute Artin maps | Native definitions consumed; cyclotomic normalization remains a prose comparison. |
| Ordinary/strict local dimensions | Present at82/91; native padding, R07. |
| Upper numbering and local conductor–discriminant | Present at105/132, using the real definition at119; equal-characteristic ownership, R04. |
| Local existence / correspondence | Mixed-characteristic and prime-to-residue-characteristic existence present at145/158; native uniqueness/dictionary consumed. Full equal-characteristic extension belongs to FunctionFieldArithmetic. |
| Weil reciprocity | Incorrectly called unstatable; R02. Carrier/topology already native, R03. |
| Albert–Brauer–Hasse–Noether | Three components at173/182/191: finite support and sum, injectivity, realization of admissible invariant families. |
| Global Artin reciprocity and existence/correspondence | Present at208/226/237; actual idele-class carrier, norm kernels and arithmetic Frobenius; order reversal has correct direction. |
| Cyclic Hasse norm | Present at249 on the native idelic norm; placewise bridge is specified in the README. |
| Hilbert class field / principal ideal theorem | Existence, unramified conditions, Frobenius-marked class-group isomorphism and maximality at262. Principalization missing, R02. |
| Kronecker–Weber | Present at277, with n≠0. |
| Global conductors, ray and ring class fields | Modulus/conductor family named as unavailable in the docstring. Ring-class generality needs R05; no invented carrier appears in Lean. |
| Hilbert reciprocity | Present at294 through the simple native-carrier quaternion norm form at286; both finite support and parity are asserted. |
| Ordinary quadratic reciprocity | Already Mathlib; R03. |

**Pinned library audit.** Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. These are the manifest pins, not those in the previous report. The following twenty object families were opened; paths are relative to their library repositories. 

| Object and declaration | File / line at the pin | Checked content and scope |
|---|---|---|
| Formation / finite layer | `TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.lean:149,232` | Fixed-point module, quotient action and norm quotient; compactness supplies finite quotient. Low degree −2 is sign-normalized, not an arbitrary equivalence. |
| `ClassFormation`, `fundamentalClass` | `TauCeti/NumberTheory/ClassFieldTheory/Formation/ClassFormation.lean:94,138` | Exact H² torsion image, H¹ vanishing, res/infl/conjugation laws; no existence axiom. |
| `tateTheorem` | `TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.lean:122` | Three separate subgroup hypotheses; actual cup-product equivalence. |
| `nakayamaNegTwo`, `artinEquiv`, `artinMap` | `TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean:126,139,169` | Artin is the inverse; kernel at210, surjectivity at215; transfer/inclusion squares at281 and311. |
| `Br`, `unitsRep` | `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Basic.lean:151,111` | Actual continuous H² of units, not a free placeholder. |
| `invMap`, res/cor | `TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:195,279,329` | Arithmetic normalization; res multiplies by degree, cor preserves invariant with native extension assumptions. |
| `tateDual` | `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Basic.lean:95` | Internal hom to μ_n, conjugation action and discrete topology. |
| `localSymbol` | `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:269` | General pairing and trace parameters. The canonical specialization must use the Kummer pairing and invariant, as the README now says. |
| Local class formation | `TauCeti/NumberTheory/ClassFieldTheory/Local/ClassFormation.lean:119` | Native invariant is the data of the actual formation. |
| Absolute local Artin map | `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:109` | Actual map to the topological abelianization, rather than a supplied arbitrary function. |
| Finite local cohomology | `TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean:97` | `finite_H` with finite smooth coefficients and invertible exponent. |
| Ordinary/strict local dimension | `TauCeti/NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`; `Strict.lean:235` in the same directory | Characteristic zero suffices; explicit Q_p-module finiteness is unnecessary for these specializations. |
| Conductors | `TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor.lean:89,184` | Norm-subgroup conductor and continuous-character conductor. The roadmap's finite-Galois-character adapter has a different input carrier. |
| Weil carrier/topology | `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`; `Topology.lean:78,123,141` in that directory | Subgroup synonym; topology induced by inclusion × discrete degree; fixed profinite inertia topology is required for uniqueness. |
| Weil finite-extension map | `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Transfer.lean:71,93,167` | Chosen embedding into the separable closure is a real binder; it excludes inseparable extensions. |
| Topological abelianization | `Mathlib/Topology/Algebra/Group/TopologicalAbelianization.lean:42` | Quotient by closure of the commutator subgroup. |
| PID submodules | `Mathlib/LinearAlgebra/FreeModule/PID.lean:278`; `TauCeti/LinearAlgebra/FreeModule/PID.lean:36` | Mathlib finite rank; Tau Ceti arbitrary rank, including infinite bases. |
| Projective representations | `TauCeti/RepresentationTheory/Homological/TateCohomology/Projective.lean:50` | Every finite subgroup and every integer Tate degree; no rank bound on the representation. |
| Normal basis | `Mathlib/FieldTheory/Galois/NormalBasis.lean:120,127` | Field-level finite Galois normal basis; does not assert an integral normal basis. |
| Quadratic reciprocity | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean:107` | Distinct odd primes and the parity factor; already proved. |

Also read `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean`: individual continuous operators do not imply open stabilizers. The Euler theorem correctly carries smoothness.

**Cross-roadmap and ownership audit.** Main was read at `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Completed roadmaps were resolved under `Completed/`; an open revision was never substituted for an existing main supplier. Object searches used the roadmap service, supplied open heads and board packages: formations, Tate–Nakayama, Weil groups, Picard/ring class fields, filtered reciprocity and new Lean names. No other general number-field class-field owner or distinct-roadmap name collision was established; R03/R04 record the overlaps found.

| Supplier or consumer checked | Resolved location and result |
|---|---|
| ProfiniteCohomology | `TauCetiRoadmap/ProfiniteCohomology/README.md:219–234`; `Suggested.lean:1608,2350,3066,3123,3150`: long exact sequence, cor/res, ordinary≤strict, closed-subgroup bound and strict criterion. Four unresolved-name leads resolve here. |
| ProfiniteProPGroups | `Completed/ProfiniteProPGroups/README.md:1129`; `Suggested.lean:3668,3756`: pro-p test and closed pro-p Sylow equality, with their topological hypotheses. |
| LocalFieldsRamification | `Completed/LocalFieldsRamification/README.md:408,451,724`: logarithm/power classes and finite upper filtration. `Suggested.lean:652` resolves `card_powerClasses_mixed`; the logarithm is also present. No nonexistent absolute §4a.1 is consumed now. |
| GlobalNumberFields | `Completed/GlobalNumberFields/README.md:571–620`: general orders, invertible ideals and Picard groups. Line618 leaves ring class fields to ClassFieldTheory; it does not impose degree2. |
| NumberFieldArithmetic | `Completed/NumberFieldArithmetic/README.md:1092,1123,1714`: relative discriminant, localization and valuation sum with residue-degree factors; the same roadmap owns ideal Artin/Frobenius. |
| RepresentationTheory/ModularInduction | `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md:174,257,294`: G₀, lattice defect and modular Artin induction. This supplies the Euler-characteristic route, not local class-field theory. |
| FunctionFieldArithmetic | Supplied head, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1101–1155`, §4.2: full equal-characteristic local theory and upper-numbering equality; R04. |
| Board consumers | `packages/ReductiveGroupsPartIII/design/README.md:349,1095` consumes Tate–Nakayama; `packages/GrossZagierAndArithmeticHeights/README.md:114` consumes ring class fields. These hits do not assign them another owner. |

Seven of the eight citation-tool leads resolve to the main supplier declarations above. The eighth, `IsAdmissibleModulus.mem_support_of_ramified`, is a proposed own target in README1872, not a nonexistent cited supplier; its speculative backticked presentation belongs to R08. Broad references to Hill/Xie/FLT and generic suppliers remain insufficiently pinned, as noted below.

**Source sample.** All sixteen requested subsection targets were examined. None is explicitly marked “unverified” in the README. Four full legal texts were obtained (Milne CFT v4.03, Milne ADT second edition, Kopp–Lagarias v3 and Weil1951), plus Artin–Tate's published contents. The table distinguishes mathematical support from the original attribution. Most sample paragraphs lack locators; an alternative source does not repair that omission.

| Seeded target | Text / locator actually inspected | Outcome |
|---|---|---|
| 2.1 Formations | `milne-adt line 747`, I §1, p.17; native Formation definition | Profinite/discrete framework supports the application. Artin–Tate XIV §1 p.143 confirmed in contents only; exact equivalence to its original distinguished-family axioms not certified from the book. |
| 2.2 Class formations | `milne-adt line 747` through789, I §1 pp.17–18; native fields | H¹/H²/invariant framework and inverse reciprocity direction supported. Artin–Tate's extra existence axioms need its unread §6 text. |
| 2.3 Fundamental classes | `milne-cft line 4772`, III §2 pp.105–106; `milne-adt line 774`, I §1 | Invariant1/n, unscaled restriction and scaled inflation; cor normalization also follows from CFT III(30), line4768. |
| 2.4 Tate and Tate–Nakayama | `milne-cft line 3911`, II Theorem3.11 p.84; `milne-adt line 303`, I Theorem0.2 p.3 | Exact subgroup hypotheses, every integer degree, and Tor₁(M,C)=0 for arbitrary M verified. Original Tate1952/Nakayama1957 locators remain unread; ADT provides an exact alternative. |
| 2.5 Reciprocity direction | `milne-cft line 4822`, III Theorem3.1 p.107; `milne-adt line 783`, I Theorem1.3 | Cup-product direction is G_ab→norm quotient; Artin is inverse. Native definition agrees. Source naturality typographical issues listed below. |
| 2.6 Frobenius | `milne-cft line 4641`, III Proposition1.9 p.102; line4882, III Corollary3.4 p.108; line10059, VII Example8.2 pp.221–222 | Arithmetic uniformizer, cyclotomic inverse on p-adic units, and global prime exponent verified. |
| 2.7 Further conventions | `milne-cft line 4764`, III(29)–(30) p.105; line8162, V Corollary5.6 p.179; native Weil topology | Degree/corestriction and order reversal verified. Weil modern topological statement lacks a pinpoint in the cited original sources. Quadratic-only scope is contradicted by Kopp–Lagarias, R05. |
| 5.1 Trivial layer | `milne-adt line 783`, I Theorem1.3; native kernel/map definitions | Degree1 gives trivial quotient and whole norm subgroup. This is a consequence, not a separate numbered theorem in the cited books. |
| 5.2 Kernel, quotient, cyclic layers | `milne-cft line 4822`, III Theorem3.1; native ArtinMap210–215 | Kernel and inverse are supported. Cyclicity is needed to replace abelianization order by full group order. |
| 5.3 Unramified local extensions | `milne-cft line 4641`, III Proposition1.9; line4882, III Corollary3.4; VII Example8.2 | Uniformizer arithmetic Frobenius and valuation formula supported. Root-of-unity exponent prime to residue characteristic is correctly explicit. |
| 5.4 Quadratic extensions | `milne-cft line 5041` onward, III §4 pp.112–114; line8142, V Corollary5.4 p.179 | Quadratic norm/Hilbert-symbol specialization supported with characteristic≠2 and the specified nonsquare extension. The paragraphs supply no precise locator for each numerical splitting example. |
| 5.5 Cyclotomic fields | `milne-cft line 10059`, VII Example8.2 pp.221–222 | Arithmetic exponents and local rational cyclotomic product verified; small mod5/mod8 computations recorded below. |
| 5.6 Towers | `milne-cft line 4844`, III Lemma3.2 p.107; native ArtinMap transfer/norm laws | The two diagrams are stated; Milne explicitly omits their proof. Native proofs and computed C₄/V₄ controls provide independent evidence. |
| 5.7 Downstream examples | `milne-cft line 10629`, VIII Theorem3.1 p.234; line10642, Remark3.2; line7252, V Theorem3.17 p.161; `kopp-lagarias line 160`, Theorem1.2 p.4 | Cyclic Hasse norm, biquadratic25 counterexample, principal ideal theorem and general order class fields supported. Cox's particular locator not certified. |
| 5.8 Mandatory suite | Earlier rows plus `milne-cft line 7423`, V Theorem3.27 p.165 | Degree1, quadratic norm kernel, ζ₅-at2 and conductor4∞ versus modulus1 are consistent; no theorem locator for the suite itself is supplied. |

Additional checked source inputs: local additive/units cohomology and Herbrand quotients are CFT III Lemmas2.3–2.6 pp.104–105 (`milne-cft line 4716`); the displayed proof of Lemma2.4 is characteristic zero, with a separate Serre reference for positive characteristic, so that proof was not certified in equal characteristic. ADT I Corollary2.3 p.28 (`milne-adt line 1138`) and Theorem2.8 p.31 (line1227) support finite-module duality/Euler characteristic. CFT VIII Theorems4.2/4.7 pp.241–242 (`milne-cft line 10937`, line11011) support the Brauer exact sequence and idele-class H² order. CFT V Theorem3.27 p.165 separates product and lcm (line7423). Weil1951 is readable, but its global setup at `weil-1951 line 139` is not a pinpoint proof of every modern local-topological assertion in Layer9.

**Adversarial mathematics.** The tables below record explicit values, not a claim that successful elaboration proves truth. The retained rows cover the seeded sample, headline theorems and finding witnesses; additional per-target rows are omitted for the comment limit. “Keep” means the computation found no counterexample, not a substitute for proof. Cₙ denotes the cyclic group of order n; invariant fractions lie in Q/Z, so1=0. Multiplicative identity is written1, trivial additive groups0. Findings and source limits above still apply.

| Statement | Instances tried | Values computed on the two sides / control | Result | Change |
|---|---|---|---|---|
| A001 2.1 Formation level | C₂ acts by sign on Z | A^{1}=Z; A^{C₂}=0 | Correct; excludes trivial action with fixed module Z | Keep |
| A002 2.1 Normal layer / ground equivalence | U=C₂,V=1, sign module | (A^V)^{U/V}=0=A^U; quotient order2 | Correct | Keep |
| A003 2.1 Finite quotient hypothesis | G=Z discrete,V=0 | index∞; Nat.card quotient=0, not a positive degree | Compactness excludes this input | Keep binder |
| A004 2.1 Universe convention | G=C₄, coefficient Z | both Type0; finite quotient cardinal4 | Within chosen universe | Keep |
| A005 2.2 H¹ axiom | C₄ acts trivially on Z | Hom(C₄,Z)=0; zero module also H¹=0 | H¹ alone does not determine formation | Keep full axioms |
| A006 2.2 H² and invariant range | C₄, C=Z versus C=0 | H²=Z/4, image{0,1/4,1/2,3/4}; zero module image{0} | Range axiom excludes zero model | Keep |
| A007 2.2 Restriction invariant | C₄→subgroup C₂, class1/4 | res invariant1/2=2·1/4 | Correct multiplier | Keep |
| A008 2.2 Inflation invariant | C₂ quotient of C₄, class1/2 | infl invariant1/2=2/4, not1/4 | Correct | Keep |
| A009 2.2 Conjugation | C₄, conjugation by generator | 1/4→1/4 on both sides | Correct | Keep |
| A010 2.2 No existence from finite-layer axioms | G=1, C=Z | all layer cohomology0; subgroup2Z has index2 but only quotient group1 | No degree2 field follows | Keep arithmetic existence separate |
| A011 2.3 Fundamental class | degrees1,2,4 | invariants0,1/2,1/4 respectively | Degree never0; no division-by-zero input | Keep |
| A012 2.3 Restriction of fundamental class | C₄ to C₂ | res u₄ has invariant1/2=inv u₂ | Unscaled class formula | Keep |
| A013 2.3 Inflation of fundamental class | C₂ quotient of C₄ | infl u₂=2u₄; invariants1/2=2/4 | Scaling necessary | Keep |
| A014 2.3 Corestriction of fundamental class | C₂ subgroup of C₄ | cor u₂=2u₄; invariant1/2 remains1/2 | Not inverse of restriction | Keep |
| A015 2.4 Tate cup theorem | C₄,C=Z,u generator,r=0 | Z/4→Z/4 sends1→1; replacing u by0 sends1→0 | Named cup distinguishes wrong map | Keep |
| A016 2.4 Negative-degree identification | C₄,r=−2 | Ĥ⁻²≅C₄, Ĥ⁰=Z/4; generator maps generator | Sign read through native normalized identification | Keep |
| A017 2.4 Tate–Nakayama tensor variant | C₄,C=Z,M=Z/2,r=0 | Tor₁(M,Z)=0; sourceZ/2,targetZ/2 | Correct; arbitrary M allowed | Exact ADT locator |
| A018 2.5 Nakayama versus Artin direction | C₄, marked uniformizer class1 | Nak(σ)=1; Art(1)=σ; inverse convention givesσ³ | Character values1/4 versus3/4 distinguish | Keep |
| A019 2.5 Kernel | C₄, ground value4 versus1 | Art4=1 and4∈4Z; Art1=σ and1∉4Z | Both directions tested | Keep |
| A020 2.5 Character formula | χ(σ)=1/4, a of valuation2 | χ(Art a)=1/2=inv(a cup δχ) | Correct | Keep |
| A021 2.6 Arithmetic Frobenius | Q₂(ζ₅), uniformizer2 | ζ₅↦ζ₅²; inverse sendsζ₅³ | Degree4 detects inversion | Keep |
| A022 2.6 Cyclotomic unit norm | unramified quadratic K/Q₃, base unit4, modulo9 | N(4)=16=7; inverse=4 mod9; omitting norm gives7 | Norm is necessary | Keep |
| A023 2.7 Absolute Artin / closure convention | Q_p, arithmetic uniformizer | unramified coordinate1 in Ẑ; geometric value−1 | Map into topological abelianization has required marking | Keep |
| A024 2.7 Norm limitation | S₃ and Q₈ layers | abelianization orders2 and4, versus full orders6 and8 | Norm subgroup determines maximal abelian layer | Keep |
| A025 2.7 Order direction | unramified fields of degrees1,2,4 | norm groups Z,2Z,4Z in valuation; field inclusions1⊂2⊂4 reverse these | Both directions consistent | Keep |
| A026 Layer0 projective ⇒ Tate trivial | regular Z[C₂] | norm e=1+g generates invariants; Ĥ⁰=0; Ĥ⁻¹=0 | Correct; native owner | R03 |
| A027 Layer0 lattice projectivity | trivial Z versus regular Z[C₂] | Ĥ⁰(Z)=Z/2≠0; regular module is projective with all Tate groups0 | Hypothesis distinguishes them | R02 |
| A030 Layer0 arbitrary-rank PID submodule | ⊕ᵢ 2Z eᵢ⊆⊕ᵢ Z eᵢ, i∈N | basis{2eᵢ}, rankℵ₀; zero submodule rank0 | Already native general theorem | R03 |
| A034 Layers1–4 norm/index | C₄ with trivial Z coefficients | N(a)=4a; quotient order4; Art surjective order4 | Native API | R03 deferral |
| A035 Layers1–4 transfer | C₄=<g>, H=<g²> | Ver(g)=g²; quotient sendsg to gH in a different group | Cannot interchange maps | Keep |
| A036 Layers1–4 norm/inclusion square | H=C₂⊂C₄, a with Art_H(a)=g² | included symbolg²; norm valuation doubles1→2 givingg² | Both paths equal | Keep |
| A037 Layers1–4 tower composition | C₈⊃C₄⊃C₂ | relative degrees2·2=4; res1/8→1/4→1/2=4/8 | Correct composition | Keep |
| A043 Layer5 H² bound and invariant | local Galois layer degree4 | H² order4, generator1/4; trivial layer order1 | Correct bound becomes equality | Keep |
| A044 Layer5 res/cor of invariant | degree2, x=1/3 | res x=2/3; cor(y=1/3)=1/3 | Different multipliers essential | Keep |
| A047 Layer5 canonical symbol coordinate | unramified cubic/Q₇, arithmetic generator, parameter7 | inv=1/3; coordinate1; inverse coordinate2 | Named invariant fixes coordinate | Add cubic Check, R08 |
| A051 Layer5 Tate dual action | trivial F₃-module over Q₂ | dual μ₃ has |H⁰|=1 versus original |H⁰|=3 | Conjugation/cyclotomic action necessary | Keep |
| A052 Layer5 Tate dual evaluation | zero module and rank1 F₂ | pairing zero→0; evaluation1·1=1 for rank1 | Distinguishes rank0 from zero pairing at rank1 | Keep |
| A053 Layer5 local duality | Q₂,F₂ with trivial action | |H⁰|=2,|H¹|=8,|H²|=2; opposite-degree dual orders2,8,2 | Perfectness sizes agree | Keep |
| A055 Euler headline | Q₂,A=F₂ | 8=2·2·2^(1·1) | Formula agrees | Keep |
| A056 Euler headline prime-to-p | Q₂,A=F₃ trivial | 3=3·1·2^0 | Formula agrees | Keep |
| A057 Euler headline p=3 | Q₃,A=F₃ trivial | 9=3·1·3^(1·1) | Formula agrees | Keep |
| A058 Euler headline zero module | Q₂,A=0,n=1 | 1=1·1·2^0 | Zero module cardinal is1, not0 | Keep |
| A060 Layer6 local formation invariant | Q₂ unramified degree4 | inv fundamental1/4, H¹=0, H² order4 | Native data match stated normalization | R03 deferral |
| A061 cd headline | Q₂, ℓ=2 and3 | cd₂=2,cd₃=2; F₂((t)) has cd₂=1 | Char0 restriction matters | Native lemma, R07 |
| A062 scd headline | Q₂, ℓ=2 and3 | scd₂=2,scd₃=2, equal to ordinary dimensions | Correct but already native | R07 |
| A068 Conductor definition at119 | trivial versus ramified quadratic character/Q₂ | least depths0 versus2 for Q₂(i) | No unbound continuous character variable | Keep |
| A070 Upper-numbering headline | unramified degree4,n=0,1 | Art(U⁰)=Art(U¹)=1; G⁰=G¹=1 | Correct endpoint | Keep |
| A071 Upper-numbering headline dyadic | Q₂(√2),n=2,3 | Art(U²)=C₂=G²; Art(U³)=1=G³ | Wrong one-step shift fails | Keep |
| A072 Equal-characteristic upper numbering | F₂((t)),y²−y=t⁻¹,n=1,2 | Art(U¹)=C₂,Art(U²)=1; G¹=C₂,G²=1 | Same target at both owners | R04 |
| A074 Conductor–discriminant headline | L=K | δ=0; unique trivial character exponent0; sum0 | No degree0 extension input | Keep |
| A075 Conductor–discriminant dyadic | Q₂(i) | δ=2; exponents0,2 sum2; maximum2 | Correct | Keep |
| A076 Discriminant versus different | Q₂(ζ₁₂),e=f=2 | d=2; δ=f d=4; exponents0,0,2,2 sum4 | Replacing δ by d fails | Keep |
| A077 Wild dyadic conductor | Q₂(√2) | δ=3; exponents0,3 sum3; max3 | Norm units±1 mod8 | Keep |
| A078 Tame conductor sum versus maximum | Q₅(μ₅) | exponents0,1,1,1; sum3=δ; max1 | Two constructions distinct | Keep |
| A080 Layer8 mixed existence | Q₂,N with valuation4Z and all units | index4; unramified degree4 field has exactly N | Correct realizability | Keep |
| A081 Layer8 prime-to-residue existence | F₂((t)),valuation3Z/all units | index3, gcd(3,2)=1; unramified degree3 | In stated scope | Keep |
| A082 Layer8 excluded p-primary case | F₂((t)), AS extension above | index2; gcd(2,2)=2, so restricted theorem inapplicable | Full theory owned elsewhere | R04 |
| A085 Layer9 Weil carrier | quotient by inertia | W/I=Z, G/I=Ẑ; integer1 in both, noninteger profinite points only latter | Dense proper subgroup | Native owner, R03 |
| A086 Layer9 topology / uniqueness | inertia coset0 | {0} open in discrete Z, not open in Ẑ; refining inertia to discrete changes its topology | Fixed profinite inertia embedding essential | Native owner, R03 |
| A089 Layer9 finite unramified embedding | unramified quadratic L/K | deg_L1↦deg_K2; index2=[L:K] | Correct | Keep separability |
| A090 Layer9 finite ramified embedding | Q₂(i)/Q₂ | deg_L1↦deg_K1; index2; f=1 | Residue degree, not field degree, scales map | Keep |
| A091 Layer9 inseparable negative control | F₂((s))/F₂((t)),t=s² | index1 versus [L:K]=2; f=1 | Claim false without separability | R06 |
| A092 Weil reciprocity omitted headline | Q_p,π and unit u | degree of reciprocal π=1; degree of reciprocal u=0; π^r givesr | Native carriers distinguish normalization | R02 |
| A101 ABHN finite support and sum | Hamilton quaternion over Q | finite support{2}; inv₂=inv∞=1/2; sum1=0 | Real term required | Keep |
| A102 ABHN injectivity | zero local invariant family | global class0; any nonzero class has a nonzero coordinate | Boundary agrees with theorem | Keep |
| A103 ABHN realization | two finite places with1/3 and2/3 | finite support2; sum1=0; realized class order3 | Admissible data | Keep |
| A104 ABHN real-place restriction | put1/3 at a real place | 2·1/3=2/3≠0 | Rejected by actual torsion hypothesis | Keep |
| A105 ABHN complex-place restriction | put1/2 at complex place | Br(C)=0 but prescribed value1/2≠0 | Rejected by actual zero hypothesis | Keep |
| A110 Global Artin headline | Q(ζ₅)/Q, prime2 | prime idele and prime ideal both exponent2 of order4 | Arithmetic marking, not arbitrary isomorphism | Keep |
| A118 Global existence headline | whole C_Q versus norm group of Q(i) | indices1 and2; fieldsQ andQ(i) realize them | Both finite/open cases | Keep |
| A119 Global order-reversal headline | L₁=Q,L₂=Q(i) | N₂⊂N₁=true; embedding Q→Q(i)=true; reverse containment/embedding=false | Both directions discriminated | Keep |
| A120 Cyclic Hasse norm headline | Q(i),x=1 and−1 | 1 global/local=true/true; −1 global/local=false/false via R | Real place retained | Keep |
| A121 Layer13 noncyclic Hasse failure / 5.7 | Q(√13,√17),x=25 | local everywhere=true; global=false (CFT VIII3.2); at5 valuation2, at13/17 square5² | Cyclic hypothesis necessary | Keep |
| A123 Hilbert class field headline | K=Q | class group1, maximal everywhere-unramified abelian fieldQ, degree1 | Correct endpoint | Keep |
| A124 Hilbert versus narrow | K=Q(√3) | ordinary class number1; no norm−1 unit, narrow class number2 | Ordinary infinite-unramified condition distinguishes | Keep |
| A125 Principal ideal omitted headline | K=Q, ideal(2) | extension to Hilbert fieldQ remains(2), principal=true | Statable without new ideal carrier | R02 |
| A127 Ring class nonmaximal quadratic | O=Z+2Z[i] | discriminant−16; Pic order1; ring class field Q(i) | Unit-index correction2/2=1 matters | Keep specialization |
| A128 Ring class higher-degree endpoint | Q(ζ₇+ζ₇⁻¹),maximal order | degree3,discriminant49,bound14/9<2; Pic1,Gal1 | Excluded by artificial quadratic binder | R05 |
| A130 Kronecker–Weber headline | Q,Q(i),Q(√5) | levels1,4,5 respectively; all nonzero | Native number-field signatures | Keep |
| A132 Global conductor product/lcm | Q(ζ₈)/Q | at2 exponents0,2,3,3: sum8,maximum3; disc exponent8,conductor exponent3 | Product versus lcm separated | Keep |
| A133 Global conductor-discriminant | Q(ζ₅)/Q | four exponents0,1,1,1: discriminant exponent3,conductor exponent1 | Correct p−2 versus1 | Keep |
| A134 Quaternion norm definition286 | F=R,a=b=−1;vector(1,0,0,0) | q=x₀²+x₁²+x₂²+x₃²; q(vector)=1 | Anisotropic; coefficients match norm | Keep |
| A135 Quaternion split control | F=R,a=1,b=−1;vector(1,1,0,0) | q=1−1=0 on nonzero vector | Isotropic; zero map not substituted | Keep |
| A136 Quaternion degenerate parameters | def at a=b=0 | q=x₀²; q(0,1,0,0)=0 | Definition total; theorem uses units, excluding0 | Keep |
| A137 Hilbert reciprocity headline | Q,a=b=−1 | anisotropic finite places{2},real{∞}; counts1+1=2,Even=true | Includes dyadic and real places | Keep |
| A138 Hilbert reciprocity split control | Q,a=1,b arbitrary unit | all norm forms isotropic; counts0+0=0,Even=true | Finite support and parity consistent | Keep |
| A140 Quadratic reciprocity / 5.7 | p=3,q=7 | (7/3)=1,(3/7)=−1; product−1=(-1)^3 | Correct, native owner | R03 |
| A141 Quadratic reciprocity second sign | p=3,q=5 | (5/3)=−1,(3/5)=−1; product1=(-1)^2 | Correct | R03 |
| A142 5.1 Trivial layer | U=V | N=id; quotient1; Art unique1→1 | Boundary correct | README only |
| A143 5.2 Generator test | cyclic degree4,valuation1 versus2 | orders4 versus2 on both quotient and Artin image | Iff separates generator/nongenerator | Keep |
| A144 5.3 Valuation formula | Q₂(ζ₅),x=2,unit,1/2 | Frob powers1,0,−1 give exponents2,1,3 mod5 | Negative valuation included | Keep |
| A145 5.3 Residue-unit restriction | Q₂,m=2,ζ₂=−1 | Art2 fixes−1; proposed q-power would give+1 | m=2 excluded by residue-unit hypothesis | Keep |
| A146 5.4 Local quadratic norm kernel | Q₂(i),a=2 and−1 | N(1+i)=2 givesArt1; −1 nonnorm givesconjugation | Both iff directions | Keep |
| A147 5.4 Quadratic extension marking | Q(√d,√e) instead ofQ(√d) | degree4,three nonidentity automorphisms versus degree2/one | Generation/degree hypothesis excludes wrong field | Keep |
| A148 5.4 Pairing negative control | zero μ₂ coefficient pairing | all outputs0 versus canonical nonnorm output1 in Z/2 | Named Kummer pairing excludes zero model | Keep |
| A149 5.4 Global quadratic splitting | Q(i),primes3 and5 | Kronecker(−4,3)=−1,Kronecker(−4,5)=1; Art conjugation/1 | Correct unramified restriction | Keep |
| A150 5.4 Second quadratic example | Q(√5),primes2 and11 | (5/2)=−1,(5/11)=1; Art τ/1 | Residues±2 versus±1 mod5 | Keep |
| A151 5.5 Cyclotomic arithmetic symbols | Q(ζ₅),primes2,3,11 | exponents2,3,1; orders4,4,1 | Inverse convention fails first two | Keep |
| A152 5.5 Cyclotomic dyadic symbols | Q(ζ₈),primes3,5,7 | exponents3,5,7, each order2 | Involutions alone cannot detect inversion | Keep mod5 control too |
| A153 5.5 Embedded quadratic conductors | Q(i),Q(√2),Q(√5) | cyclotomic levels4,8,5 | Correct | Keep |
| A154 5.6 Restriction tower | Q(ζ₅)→Q(√5),primes2 and11 | 2 nonsquare mod5 givesτ;11 square gives1 | Same as quadratic Artin | Keep |
| A155 5.6 Klein-four transfer | V₄→any order2 subgroup | Ver(g)=g²=1 for everyg; nontrivial quotient map still exists | Distinguishes transfer from quotient | Keep |
| A156 5.8 Minimal suite | degree1 / Q(i) / ζ₅-at2 / modulus1 | Art1; nonnorm−1↦τ; exponent2 not3; admissibility=false | All four control types nonvacuous | Keep in README |

There are 103 computed rows in this report. Zero rings and residue cardinality1 are excluded by the field/local-field structures. Finite Galois hypotheses exclude inseparability in the finite reciprocity theorems; the separate Weil prose does not, which is R06. Empty support and zero modules were tested explicitly. Degree0 and zero unit inputs were not substituted for genuine fields or units. The source misprint in the cocycle lift has a further control: at n=2 the omitted representative is σ, whose lift is1/2 and whose boundary at (σ,σ) is1.

## Not verifiable

These limits do not postpone the verdict. All acquisitions used the legal sources service; no source was copied into the repository and no manifest was edited. Missing-text attempts are recorded together in the scratch reference request. Numbering from a readable alternative does not certify an unread original.

- **artin-tate:** AMS legal endmatter certifies contents only, including XIV §6 p.163. The full formation axioms, Main Theorem and existence-axiom text were not available.
- **tate-1952, nakayama-1957, rim-1959:** DOI searches reached JSTOR landing pages without readable full texts. Milne CFT II3.11 and ADT I0.2 independently support Tate/Tate–Nakayama; they do not verify the original numbering or Rim's arbitrary-rank proof.
- **serre-local, serre-galois, neukirch-ant, brown:** Springer sources remained paywalled/uncertified. Their precise filtered-norm, ramification, dimension and projectivity locators are not certified. The equal-characteristic unit-cohomology proof referred to by Milne was not read.
- **nsw:** the authors' Heidelberg PDF URL redirected to a landing page. The exact (3.3.4), (3.3.6), (7.1.8), (7.2.5), (7.2.6), (7.3.1)–(7.3.4) numbering remains unverified.
- **cox:** Wiley DOI retrieval returned403; Proposition7.22 and Theorem9.18 were not read. Kopp–Lagarias v3 supports the general order result independently.
- **tate-corvallis:** the AMS DOI reached authentication. Weil1951 was obtained legally, but the README gives no pinpoint for the modern local Weil topology/abelianization theorem; its whole API is not certified by that title citation.
- **lang-algebra, cassels-frohlich:** legal-service searches failed or timed out. The former arbitrary-rank PID result now has a native proof; the latter contains the cited Tate and Serre class-field chapters, whose original statements were not read.
- **Portability:** kbuzzard/ClassFieldTheory and Hill/Xie/FLT references have no exact commits or declaration-level contracts. Their advertised portability is not verified. Unlisted open revisions were not treated as suppliers.

## Source issues

- **Misprint** in milne-cft at III §1 before Proposition1.9, printed p.101: the source says the lifted character uses indices 0≤i<n−1; it should be defined for 0≤i<n, including the last representative; affects the proof.
- **Misprint** in milne-cft at III Theorem3.1, naturality discussion, printed p.107: the source says the cup-product inputs have coefficients L× and E×; it should be integer coefficients on the input side of the Tate isomorphism; affects the proof.
- **Gap** in milne-cft at III Lemma3.2, printed p.107: the source states the norm/inclusion and inclusion/transfer squares without their proof; it should justify low-degree restriction/corestriction identifications and cup-product compatibility; affects the proof.

These are `milne-cft line 4619`, line4830 and line4862. They do not refute the arithmetic reciprocity convention; the native maps and the C₄/V₄ computations provide independent checks.
