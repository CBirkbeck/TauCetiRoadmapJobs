# Review of PolynomialGaloisGroups (pull request #986 at 82f088f)

**Verdict:** rejected

The completed base roadmap is being planned again. Its new work needs a separately named continuation importing the completed base; this is a scope rejection, not a claim that the radical criterion is false. There are also independently repairable mathematical defects below. The gate and Lean build pass.

## R01 (P2) — Extend the completed roadmap instead of planning its library again

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:485`, “Everything that concerns labels. At the pinned version there is”; `README.md:1565`, “Layer 10: finite Galois extensions and radicals”.

**Claim:** Layers 0–9 are presented as work to build, followed by a new radical layer, inside the completed base's folder. This contradicts both ownership and the pinned library. The declaration table at lines 343–369 acknowledges the native implementations, but the subsequent missing-work list and milestone catalogue still plan them again.

**Witness:** `Completed/PolynomialGaloisGroups/README.md:31` owns the same low-degree classification and symmetric-group realization; `TauCetiRoadmap/PolynomialGaloisGroups/STATUS.md:34` says nothing within scope remains. `TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.lean:44` proves the realization at this pin.

**Exact repair:** submit the genuinely new field-transport/radical work as a separate continuation, with an introduction explaining where the completed base stops. Import the base by layer and the native declarations by name; delete its repeated targets and obsolete missing-work claims. Coordinate the continuation's name with the existing Part II, which owns ramified cycle-type refinements, not this radical criterion. Test of the ownership distinction: the realization wrapper already closes with one native theorem, whereas the characteristic-zero radical equivalence is not supplied by that base. This cannot be accepted as another plan for `PolynomialGaloisGroups`.

## R02 (P1) — An abstract Galois group and point stabilizer do not determine the field

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:613`, “The field `K` is determined by `f.Gal` together with its point stabilizer up to conjugacy.”

**Claim:** the sentence forgets the particular normal extension and its action on field elements. An abstract permutation representation remembers less than a field.

**Witness:** over ℚ, both ℚ(√2) and ℚ(√3) give the regular action of C₂, with trivial point stabilizer. They are not ℚ-isomorphic: `(a+b√3)²=2` has no solution with rational `a,b`.

**Exact repair:** restrict the determination statement to subfields of one specified normal extension `L/F`, with its actual automorphism action. Then conjugate subgroups give F-isomorphic fixed fields. Say separately that the abstract pair determines the transitive permutation representation. Retest: inside ℚ(√2,√3), the two quadratic fields have distinct, nonconjugate order-two subgroups of V₄, so the repaired claim distinguishes them. The later worked example distinguishing these fields agrees with this repair.

## R03 (P1) — The proposed negative check for X^n fails in degrees zero and one

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1505`, “A regression test states that `X ^ n` does not satisfy the predicate.”

**Claim:** the statement has no lower bound on `n`. The preceding one-distinct-root assertion also fails for `n=0`.

**Witness:** at `n=0`, `X^n=1` has no roots and the full symmetric predicate is true. At `n=1`, `X` is separable and Gal → S₁ is bijective. Both positive instances were proved in a scratch Lean file.

**Exact repair:** state the negative control with `2 ≤ n`, and retain `n=0,1` as positive boundary checks. The same scratch file proves the negative case `X²`; the native theorem `not_hasFullSymmetricGaloisGroup_X_pow` at `TauCeti/FieldTheory/GaloisGroups/Symmetric/Basic.lean:105` has precisely this bound. Keep these checks in the README.

## R04 (P2) — Bound the Vieta index before subtracting natural numbers

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:933`, “the `(k+1)`-st elementary symmetric polynomial at `x` is `(−1)^(k+1) · g.coeff (n − (k+1))`”.

**Claim:** the equality is stated without `k < n`. Natural-number subtraction makes out-of-range indices read the constant coefficient.

**Witness:** take `g=X−1`, `n=1`, `k=1`. The left side is `e₂(1)=0`; the right side is `(+1)·g.coeff 0=−1`. The coefficient evaluation was also elaborated in Lean.

**Exact repair:** quantify `k : Fin n`, or require `k < n`; use a separately stated zero formula beyond the degree. Retest: `k=0` gives `e₁(1)=1=−g.coeff 0`; `k=1` is excluded and its correct elementary-symmetric value remains zero. Mathlib's bounded Vieta statement is in `Mathlib/RingTheory/Polynomial/Vieta.lean:116`.

## R05 (P2) — Normalize the irreducible polynomial in the intermediate-field dictionary

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:773`, “For `E = F`, `minpoly E α = p` and the block is the whole root set.” Layer 2 assumes irreducibility and separability, not monicity.

**Claim:** the equality of polynomials is stronger than the root-set equality needed by the dictionary.

**Witness:** `p=2X²−4` over ℚ is irreducible and separable. At `α=√2`, the minimal polynomial is `X²−2`, with leading coefficient 1; `p` has leading coefficient 2.

**Exact repair:** replace the equality by `minpoly F α = C(p.leadingCoeff⁻¹) * p`, or its native monic-normalization form, and deduce equality of root sets. Keep the dictionary general for nonmonic irreducibles. Retest: multiplying `2X²−4` by `1/2` gives `X²−2`, and both have roots `±√2`; the whole-block endpoint survives.

## R06 (P2) — Restore the full Dummit criterion, including the separation argument

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1134`, “under separation evidence”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:100`, the quintic criterion with the additional `hres` premise.

**Claim:** this supplies a conditional native resolvent theorem but omits the stronger classical headline. The collision example `X⁵−X` is reducible and does not justify weakening the irreducible-quintic result.

**Witness:** `dummit-quintics` lines 100–116, Theorem 1, printed p. 389, states the criterion for irreducible quintics over ℚ without a sextic-separability premise. `chapman-quintics` lines 8–30 supplies the missing distinctness argument.

**Exact repair:** in the continuation, add the automatic-separation target for irreducible separable quintics in the characteristic range justified by the argument, and state the full root/solvability criterion without `hres` there (in particular in characteristic zero). Cite the existing conditional theorem as input. The carriers already exist, so the full headline belongs in `Suggested.lean`. Test the separation step: a five-cycle permutes five of the six invariant values; a collision forces those five to coincide. Chapman's two identities force `2x₂=x₁+x₃=x₄+x₅`, hence `5x₂=Σxᵢ`, contradicting irreducibility when 5 is invertible (characteristic two gives an even earlier collision of original roots). For `X⁵−X` the original input is reducible, so its sextic `(X−2)⁴(X²+16)` remains a valid excluded negative control. For `X⁵−2`, the sextic `X⁶−50000X` is separable and has root zero, with solvable group F₂₀. See [Dummit's author page and linked Chapman correction](https://site.uvm.edu/ddummit/).

## R07 (P2) — Match the characteristic range of the conditional quintic theorem

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1140`, “`ringChar F ∉ {2,5}`”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:100`, `{F : Type*} [Field F]` with no characteristic restriction.

**Claim:** the README and Lean acceptance signature describe different generalities. Depression and the discriminant test need restrictions that the conditional subgroup/resolvent theorem does not.

**Witness:** over 𝔽₂, `f=X⁵+X²+1` is irreducible. In 𝔽₃₂ its six invariant values are distinct and one is 1; Gal is C₅. Thus both sides of the Lean equivalence are true in an excluded README instance.

**Exact repair:** state the conditional theorem over arbitrary fields, as the native theorem does, and attach characteristic restrictions only to depression, the discriminant criterion, and the automatic-separation theorem where needed. Retest in 𝔽₂: six distinct values, rational root 1, and solvable C₅ are admitted by both descriptions. This is independent of R06's demand for the stronger characteristic-zero headline.

## R08 (P3) — Delete ten native-theorem wrappers from Suggested.lean

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:25`, “The headline theorems of those layers are stated on them and closed by the Tau Ceti proofs”.

**Claim:** ten declarations restate supplied results and close in one application; they are not acceptance targets for new work. Two also reuse fully qualified names already present in the completed base's acceptance file.

**Witness:** lines 46, 57, 65, 77, 89, 100, 111, 132, 152 and 162 each have a one-native-theorem proof. The completed file already declares the Jordan and factor-degree membership names at lines 760 and 937.

**Exact repair:** delete these ten declarations from `Suggested.lean`; keep the mathematics as cited supplier contracts. Do not replace their proofs by `sorry`. The pin-to-wrapper correspondence is listed below (Imprimitivity, product primitivity, Jordan, Blocks, discriminant, Quintic/Solvable, Tschirnhaus transport, Reduction, Certificate/Check, and Symmetric/Realization, respectively). Their native proofs already test that deletion loses no new obligation. Retain only genuinely new headlines in the separately scoped continuation. The three currently admitted declarations did not close with `simp`, `rfl`, or `infer_instance` in nine independent probes.

## R09 (P3) — Give retained definitions discriminating Checks and the required prose structure

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:31`, “Scope”; `README.md:508`, “The build, in layers”; `README.md:1045`, the Tschirnhaus development.

**Claim:** the document uses a catalogue of bold targets and field lists rather than the required layer/subsection prose. Definitions are not each followed by three explicit discriminating Checks; mentioning cases without their values does not supply those checks.

**Witness:** there is no opening `Summary`, `Scope and ownership`, or `Exact supplier contracts` section in the required form, nor an `Examples` and `Dependencies` ending for each layer. The Tschirnhaus definition lacks three such computed controls.

**Exact repair:** apply the required structure to the retained continuation, keeping an API list and at least three computed Checks per definition. For Tschirnhaus transport, useful existing-object controls are `T=X`, `T=0`, and `T=X+1` on `f=X²−2`: the transforms are respectively `X²−2`, `X²`, and `X²−2X−1`; only the constant transform fails injectivity on the two roots. Use these as README checks, not extra Lean declarations. Repeated base definitions should instead be cited under R01.

## R10 (P3) — Supply exact locators and correct the source inventory

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1122`, “This invariant is Dummit's, in *Solving solvable quintics* §1”; also the unlocated orbit/factor target at line 540 and specialization target at line 944.

**Claim:** the invariant locator is wrong, and many claims have only a book/section reference, “standard”, or no locator at all. There is no `sources.toml` recording the cited works and their access status. The reference paragraph claiming that no milestone rests on an uninspected source is not supported by the inventory.

**Witness:** `dummit-quintics` lines 34–73 places the invariant and its six conjugates in §2, printed pp. 387–388, not §1. The 15-target source audit below distinguishes verified passages from unavailable or absent locators.

**Exact repair:** cite §2, p. 388 for the invariant and formula (2′), p. 389 for the specialization; give every retained target an exact theorem/section/page and hypotheses. Record one manifest key per work, retaining legal-access or uncertified status. Replace stale claims of library absence by the actual pin contracts, including the obsolete `IsSolvableByRad` mention at line 325. Rechecking the corrected Dummit locator finds all ten monomials, stabilizer order 20 and orbit size 6; the computed orbit below agrees. No source or manifest was edited in this review.

## R11 (P3) — Keep mathematical recognition implications, not a certificate interface

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1453`, “`QuinticCertificate` is a finite package of evidence”; line 1455, “`check` is the Boolean decision of those conditions”.

**Claim:** this plans a certificate/checker interface, which the review contract excludes from a mathematical roadmap. Its implementation already exists in the completed base in any event.

**Witness:** `TauCeti/FieldTheory/GaloisGroups/Certificate/Check.lean:74` defines the certificate; lines 109 and 120 define verification and its Boolean decision; line 209 proves soundness. The Boolean definition uses classical decision, so this finding does not claim an executable algorithm.

**Exact repair:** delete the certificate construction/checker milestone and its acceptance wrapper. Retain the five mathematical recognition implications only as native supplier citations or worked examples. Retest the F₂₀ example: irreducibility of `X⁵−2` modulo 11, nonsquare discriminant 50000, and resolvent root 0 imply the same label without introducing a certificate carrier.

## Previous findings

The supplied previous report identifies **pull request #763 at `0cf0006`**, despite being supplied under this job's previous-review name. It concerns a Part III document and two companion files that are not this head's content. I did not treat its source reads, build, or mathematical table as evidence for this head, nor assume its claimed unchanged diff applies here.

- Previous R01: “The continuation still occupies the completed roadmap's folder.” **Partly addressed, but the underlying ownership defect remains.** This head has the base title at `README.md:1` and base namespace at `Suggested.lean:35`, not the previous Part III title/namespace. Its new Layer 10 nevertheless extends a completed base while replanning that base. The freshly verified scope defect is R01 above; the old degree-six-to-eleven mismatch is not attributed to this head.
- Previous R02: “Both companion Lean files still duplicate base-library material.” **Repaired as to those files:** `Compatibility.lean` and `PrescribedGenerators.lean` are absent. This does not repair the distinct ten-wrapper problem in the actual `Suggested.lean`, raised with current witnesses as R08.

No supplied repair disposition marked either finding “not actionable in this package”; no settled disposition is overridden.

## Verified sound

This is a fresh review of the two requested files, not an incremental carry-forward. The worktree head is `82f088f12c893bd33f5b4f671b2602a22f23d210`. No tracked file was changed. The diff outside the roadmap folder is empty. The normative README and contribution rules were read, as were main's completed PolynomialGaloisGroups and NewtonPolygons roadmaps for shape. Main was checked at `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`.

**Gate and signatures.** The worker's gate reports zero failures and `OK`, including `build=0`. A fresh targeted build of `TauCetiRoadmap.PolynomialGaloisGroups.Suggested` succeeded (9070 jobs), followed by direct `lake env lean` elaboration. The only warnings were the three admitted theorems at lines 145, 184 and 196. All 13 declarations were checked with `#check @name` in a scratch copy: the characteristic-zero, finite-dimensionality, Galois, splitting, faithfulness and chosen-embedding binders are retained where used. R07 is a prose/signature discrepancy, not a silently dropped section binder. No sorry-defined data, `set_option`, stand-in carrier, foreign roadmap import or admitted example occurs. All imports resolve at the pins. Nine separate one-tactic probes (three tactics for each admitted theorem) failed to close those theorems; ten other declarations already prove their own one-step redundancy.

The exact dependency-check output was:

```text
depcheck: 208 roadmaps, 1451 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The pure-group degree-five classification needed by the resolvent criterion precedes that application in the explicit build-order table at `README.md:1838`; the numerical layer labels alone do not create a cycle.

**Ownership and suppliers.** Object searches used the roadmap service's `grep` and `show`, the pinned libraries, main, the board packages and relevant supplied open checkouts. The completed base owns the carriers and results listed in R01/R08; its `Suggested.lean` also supplies the two identical fully qualified names noted in R08. Part II's open `README.md:1`–54 assigns itself ramified cycle-type merging and related permutation refinements. It does not supply Layer 10's radical equivalence. NumberFieldArithmetic §3.10, `README.md:1040`–1073 in the service's main copy, supplies the monic integral polynomial factorization theorem including linear factors; the native theorem is `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`, `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164`. This agrees with the one actual external supplier contract and Layer 5's `Needs` line. There are no declared gaps.

BelyiMaps at the supplied open head was read at its dependency and consumer passages (`README.md:204`, `:546`, `:976`): it is a consumer, not a reverse supplier. Its wider degree-six-to-eleven expectation does not expand this base's degree-at-most-five contract. References to Chebotarev, character tables and Hilbert irreducibility are exclusions or downstream context, not hidden inputs to the proofs checked here. The roadmap citation resolver was supplemented by searches at the actual pins; local radical declaration names resolve in the elaborated file. Ownership against the provided relevant open folders was checked by object. Other revisions appearing in service search results without a supplied checkout were not independently reviewed or treated as suppliers.

**Pinned declarations opened.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are file-and-line witnesses, not claims about a newer library:

| Object or input | Declaration and file at the pin | Hypothesis/semantic check |
|---|---|---|
| Polynomial Galois group/action | `Polynomial.Gal`, `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:56`; transitivity :181; injectivity :212 | Splitting-field automorphisms; irreducible gives transitivity; action injection uses a splitting extension. |
| Roots versus embeddings | `TauCeti.rootSetEquivAlgHomAdjoin`, `TauCeti/FieldTheory/IntermediateField/Adjoin/Embeddings.lean:36`, generator laws :45, :52 | Integral generator; both maps and generator equations, not an unmarked cardinality equality. |
| Wreath embedding | `MulAction.IsBlock.toWreathProduct_injective_iff`, `TauCeti/GroupTheory/Perm/Imprimitivity.lean:186` | Nonempty block and transitive action; injection iff faithfulness. |
| Product primitivity | `TauCeti.WreathProduct.isPreprimitive_product`, `TauCeti/GroupTheory/Perm/WreathProduct/Primitive.lean:101` | Finite index type, faithful primitive nonfree base action on nontrivial carrier. |
| Jordan | `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`, `TauCeti/GroupTheory/Perm/Jordan.lean:154` | Prime cycle support, primitive action and `p+3 ≤ card`. |
| Blocks/fields | `TauCeti.isPreprimitive_iff_isAtom_adjoin_simple`, `TauCeti/FieldTheory/GaloisGroups/Blocks.lean:198`; order correspondence :59 | Irreducible, separable and degree >1; endpoints :101, :112. |
| Conjugate fields | `TauCeti/FieldTheory/GaloisGroups/ConjugateFields.lean:59`, :113, :208, :373, :387 | Actual subfields in a fixed splitting field; quotient by normalizer, not only point stabilizer. |
| Discriminant | `Polynomial.discr`, `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935`; `discr_C` :939 | Native determinant/sign; even zero constant has discriminant 1. |
| Square test | `Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup`, `TauCeti/FieldTheory/GaloisGroups/Discriminant/Basic.lean:145` | Monic, separable, splitting Galois extension, characteristic ≠2. |
| Universal resolvent | `TauCeti.ResolventSpec`, `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean:69`; uniqueness :93; base change :161; monicity/degree :172; root product :190 | Exact integral stabilizer and integral symmetric descent; formal orbit is taken before specialization. |
| Symmetric descent | `MvPolynomial.esymmAlgHom_fin_bijective`, `Mathlib/RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean:293` | Supplies integral coefficients and uniqueness; does not justify unbounded Vieta indexing. |
| Quintic conditional criterion | `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`, `TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.lean:104`; forward implication :89 | Conditional iff arbitrary field; solvable-to-root direction does not require resolvent separation. |
| Tschirnhaus | `Polynomial.tschirnhausPolynomial`, `TauCeti/RingTheory/Polynomial/Tschirnhaus.lean:83`; identity :236; constant :249; admissibility :406 | Resultant with real body; admissibility is injection on roots. Transport theorem: `TauCeti/FieldTheory/GaloisGroups/Resolvent/Tschirnhaus.lean:74`. |
| Factor degrees and adapter | `Polynomial.factorDegrees`, `TauCeti/RingTheory/Polynomial/FactorDegrees.lean:55`, zero :91; `TauCeti/FieldTheory/GaloisGroups/Reduction.lean:119` | Prime coefficient field, normalized factors with multiplicity; adapter excludes discriminant primes. |
| Labels | `TauCeti.numTransitiveGroups`, `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66`; representatives :116–145; `TauCeti.HasGaloisLabel`, `TauCeti/FieldTheory/GaloisGroups/Label.lean:111` | Counts 1,1,2,5,5 and zero outside range; separability and degree are in polynomial label predicate. |
| Low-degree completeness | `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.lean:431`, :468, :783, :805; label transfer `TauCeti/FieldTheory/GaloisGroups/Label.lean:240` | Existence and uniqueness in degrees four and five; generic label-transfer theorem takes both as input. |
| Full symmetric predicate/existence | `Polynomial.HasFullSymmetricGaloisGroup`, `TauCeti/FieldTheory/GaloisGroups/Symmetric/Basic.lean:35`; cardinal equivalence :59; `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`, `TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.lean:44` | Predicate includes separability; existence is for every positive degree. |
| Prime-index normal subgroup | `Group.IsSolvable.exists_normal_index_prime`, `TauCeti/GroupTheory/Solvable.lean:78` | Finite, solvable, nontrivial group; cannot apply at the induction endpoint. |
| Radical closure/one-way theorem | `solvableByRad`, `Mathlib/FieldTheory/AbelRuffini.lean:194`; `rad_mem` :201; minimal-polynomial result :301; irreducible result :313 | Actual intermediate field; nonzero radical exponent; irreducibility in the some-root implication. No current `IsSolvableByRad` alias found. |
| Kummer and restriction | `isCyclic_tfae`, `Mathlib/FieldTheory/KummerExtension.lean:563`; `IsGalois.sup_right`, `Mathlib/FieldTheory/Galois/Basic.lean:575`; restriction :626, injection :641 | Finite-dimensional cyclic Galois extension and enough primitive roots; compositum injection needs the stated supremum equality. |
| Induction endpoint and primitive element | `IntermediateField.finrank_eq_one_iff_eq_top`, `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:329`; `Field.exists_primitive_element`, `Mathlib/FieldTheory/PrimitiveElement.lean:209` | Degree-one endpoint; finite separable extension for primitive element. |
| Roots of unity | `IsPrimitiveRoot.pow`, `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:262`; injective pullback :306 | Positive order, factorization of order, and injective map in the correct direction. |

**Headline coverage.** The README's list at lines 358–369 and Layer 10 yields 13 declared headlines: the imprimitivity embedding; product-action primitivity; Jordan's prime-cycle theorem; block/field primitivity; discriminant parity test; conditional quintic criterion; Tschirnhaus transport; Frobenius factor-degree membership; unique low-degree polynomial label; certificate soundness; symmetric-group realization; finite-Galois radical criterion; polynomial radical criterion. All 13 are statable and present. The docstring says no carrier is missing, correctly for this list. R06 identifies the additional full-strength classical headline that should be included, not an unavailable-carrier excuse. R08 accounts for ten already supplied headlines; the three admitted ones are the unique-label combination and the two radical equivalences.

**Source sample and access.** The brief describes a seeded sample of 15 but supplies no target identifiers (“none found by heading”). To make selection reproducible, I sampled the bold target paragraphs between lines 510 and 1718 with seed `int("82f088f",16)`. The following are all 15 selected targets; mathematical values for every one appear in the adversarial tables. All references marked uninspected in the README were also attempted through the sources service. No source text was copied into the repository or report, and no manifest was edited.

| Sampled target (README line) | Locator check and result |
|---|---|
| Orbits and irreducible factors (540) | No exact external locator attached. Native orbit/minimal-polynomial inputs checked; missing locator is R10. |
| Primitivity/intermediate fields (778) | Native Blocks theorem :198 has the stated degree >1 guard. Book-level block correspondence locators remain uncertified. |
| Reducible polynomials (807) | No exact external locator attached; verified on two disjoint quadratic root orbits below. R10. |
| Square root of discriminant (840) | Cohen §6.3 unavailable as text; native parity theorem read. Conrad's quadratic/cubic discussion independently supports the computed cases. |
| Worked discriminants (870) | `conrad-cubicquartic` lines 245–322, Definition 3.1 and Theorems 3.4/3.6, printed pp. 6–8: cubic resolvent formula, discriminant test and quartic table checked. |
| ResolventSpec (883) | Exact formal stabilizer and orbit product checked at native Spec :69. Dummit §2 supports the quintic instance, not every abstract coefficient-ring assertion; general locator incomplete. |
| Specialization (944) | Native Spec :161, :172, :190 separates unconditional coefficient substitution from monic/root-product agreement. No exact source locator attached. |
| Factorization theorem (1007) | Cohen §6.3 cited, text unavailable. Native resolvent orbit-factor statement and explicit factor/orbit examples checked. |
| Degenerate resolvent (1021) | `dummit-quintics` formula (2′), lines 97–99, p. 389 gives `(X−2)⁴(X²+16)` at `a=−1,b=0`; computed against orbit values. |
| Linear resolvents (1155) | Quintic pair-sum stabilizer/order computed: 12 and 10. No exact external locator attached. |
| Finite-field Frobenius (1217) | Supplier NumberFieldArithmetic §3.10 and native theorem resolved; traditional Cohen/van der Waerden text not certified. Finite-field orbit computed below. |
| Label API (1309) | `lmfdb-galois` lines 176–346 of degree-1-to-5 search: all 14 labels and invariants agree; `chm-transitive` Table 2, printed p. 7, lines 282–285 verifies counts starting at degree 2. |
| Discriminant/resolvent classification (1418) | Conrad Theorems 3.6/4.1 and quartic table checked; Dummit Theorem 1, p. 389 and Chapman correction checked. Conditional-versus-full quintic discrepancy is R06. |
| Normal subgroup input (1583) | Native Solvable :78 supplies it with finite/nontrivial hypotheses. `milne-fields` Theorem 5.34 proof, p. 77, lines 3409–3440 gives the group-chain route. |
| Relative induction (1615) | `milne-fields` Proposition 5.27, p. 74, lines 3267–3277; Lemma 5.33, pp. 76–77, lines 3400–3408; Theorem 5.34, p. 77 checked with primitive-root, cyclicity, and restriction hypotheses retained. |

Additional source checks: `hulpke-transitive` §3.2, Theorem 3.1, p. 4, lines 196–201 supports the faithful imprimitive embedding; it does not replace an unread locator for the product-action theorem. `milne-fields` Proposition 4.16, p. 52, lines 2217–2225 proves the prime-degree/two-nonreal-root symmetric-group criterion; nonsolvability needs the roadmap's extra `p ≥ 5`. Milne is version 5.10, matching the cited numbering. Conrad's Theorem A.1, pp. 16–17, lines 813–823 was also checked. The LMFDB landing page says completeness through 47 **except 32** (`lmfdb-galois` line 90); the README's unqualified description should preserve that exception. Stauduhar's legal AMS text was obtained as contextual reference; no unexamined theorem from it is counted as verified evidence.

**Adversarial computations.** The two tables contain 118 computed rows (104 statement/instance rows and 14 reference-group rows). These are finite tests and counterexamples, not proofs of universal statements. Every bold target family, the 15 selected targets, all 13 Lean headlines, and every mathematical finding have entries below. The 14 reference groups were generated from the listed permutations, with closure, derived subgroups, parity and block systems computed independently. Polynomial discriminants used determinant resultants, reductions used finite-field division, and the quintic invariant used all 120 variable permutations. Values in rows marked “holds” support that instance only. “Keep” means no repair to that mathematical statement, not permission to replan supplied work.

| Statement / target | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Permutation composition and rename convention | `(01)(12)` and its reverse on three letters | First sends 0 to 1; reverse sends 0 to 2; rename of `x₀` gives corresponding `x₁` or `x₂` | Left action agrees | Keep explicit convention |
| Root-set degree bookkeeping | `1`, `X−1`, `X²−2` over ℚ | Root counts 0,1,2 = degrees 0,1,2; automorphism orders 1,1,2 | Holds | Keep |
| Nonzero/separability guards | `0`; `(X²−2)²` | Zero's rootSet is empty; repeated polynomial has 2 roots but degree 4 | Guards distinguish false extension | Keep |
| Faithful root action | `X³−2` | Splitting-field group order 6; root permutation image order 6; kernel order 1 | Holds | Keep |
| Full cycle type | identity on 4 points; `(01)`; `(012)` | Bare types `[]`, `[2]`, `[3]`; full types `[1,1,1,1]`, `[2,1,1]`, `[3,1]`; each sum 4 | Fixed points correctly restored | Keep |
| Numbering independence | swap on three roots, relabel by `(012)` | `(01)` becomes `(12)`; both full type `[2,1]`, sign −1, order 2 | Conjugation retains stated invariants | Keep |
| Orbit/factor equivalence (sample 540) | `(X²−2)(X−1)` | Two factors degrees 2,1; root orbits `{±√2}`, `{1}` sizes 2,1 | Both directions match | Keep |
| Reducible dictionary (sample 807) | `(X²−2)(X²−3)` | Two irreducible factors; two orbits of size 2; group V₄ order 4, no transitivity on all 4 roots | Orbitwise extension correct | Keep |
| Root/embedding transport | ℚ(√2) into algebraic closure; into ℚ(√3) | Roots of `X²−2`: 2 and 0; ℚ-algebra embeddings: 2 and 0 | Actual maps, not cardinality alone | Keep |
| Base-field isomorphism transport | complex conjugation on coefficients, `X−i` | Mapped polynomial `X+i`; mapped root `−i`; both evaluation values 0 | Generator equation agrees | Keep |
| Irreducible iff transitive with guards | `X²−2`; `(X−1)(X+1)` | Irreducibility true/false; orbit counts 1/2 | Both directions agree | Keep |
| Normal closure / splitting field | real `ℚ(∛2)` | Degree 3; normal closure degree 6; root action S₃ order 6 | Distinguishes root field from splitting field | Keep |
| Conjugate-field count | `X³−2`, H order 2 in S₃ | `[G:H]=3` embeddings; normalizer order 2; `[G:N(H)]=3` conjugate subfields | Holds | Keep |
| Normalizer quotient differs from root quotient | quadratic G=C₂,H=1 | 2 embeddings but 1 conjugate subfield; indices 2 and 1 | Necessary distinction | Keep |
| Abstract pair determines field | ℚ(√2), ℚ(√3) | Pair `(C₂,1)` on both; square equation in second gives `2ab=0`, `a²+3b²=2`, no rational solution | False | R02 |
| Block/stabilizer order correspondence | regular C₄, marked 0 | Blocks `{0}`, `{0,2}`, all; stabilizer orders 1,2,4; subgroup indices 4,2,1 | Increasing on blocks | Keep |
| Transitivity guard for block dictionary | trivial group on two points | Blocks containing 0: 2; subgroup interval: 1 | Fails without guard | Keep transitivity |
| Wreath construction | C₂ wreath S₂ in imprimitive action | Order `2²·2=8`, degree 4; multiplication preserves 2 blocks | Correct group/action | Keep |
| Wreath boundary carriers | empty index; one index; trivial base | Orders respectively 1, order(D), order(Sym(index)); empty product action has one point | Correct total definitions | Keep |
| Imprimitivity embedding headline | regular C₄, block `{0,2}` | Domain order 4, target order 8, kernel order 1 | Injective instance | Keep supplier |
| Imprimitivity faithfulness control | C₃×C₄ acting through C₄ | Domain order 12, target order 8, action kernel order 3 | Injection impossible | Faithfulness retained |
| Product action headline | S₃ wreath S₂ on `{0,1,2}²` | Degree 9, group order 72; primitive product action, point stabilizer order 8 | Primitive nonregular base satisfies input | Keep supplier |
| Product-action faithfulness control | C₂×C₃ acting through C₃, two coordinates | Nine points; diagonal cosets form 3 blocks of size 3; kernel nontrivial | Nonfree alone insufficient | Faithfulness retained |
| Jordan prime-cycle headline | S₅ with a swap; A₆ with a 3-cycle | `2+3=5`, `3+3=6`; contained alternating orders 60 and 360 | Bounds and conclusions agree | Keep supplier |
| Jordan bound control | regular C₅ with its 5-cycle | `5+3>5`; group order 5 cannot contain A₅ order 60 | Excluded | Keep bound |
| Long-cycle recognition | transitive S₄ with `(012)` | Stabilizer of point 3 acts transitively on other 3; ordered distinct pairs orbit size 12 | 2-transitivity | Keep |
| Odd-power swap extraction | `(01)(234)` | Cube is `(01)`, cube of 3-cycle is identity | Sign/cycle convention correct | Keep |
| Primitive plus swap | C₄ plus `(01)` | Generated group has 24 elements = S₄, versus C₄ alone order 4 | Recognition agrees | Keep |
| Blocks/fields anti-isomorphism | ℚ(2^(1/4)), D₄ splitting group | Whole 4-root block maps to ℚ; 2-root block to ℚ(√2); singleton to degree-4 field | Block inclusion reverses field inclusion | Keep |
| Minimal-polynomial endpoint | `p=2X²−4` | `minpoly=X²−2`, not `2X²−4`; root sets both size 2 | Equality false | R05 normalize |
| Primitive/atom headline (sample 778) | quadratic; linear | Quadratic: primitive true, degree-2 field atom true. Linear: primitive true, bottom field atom false | Degree >1 necessary | Keep guard |
| 2-transitivity/root-factor criterion | `X³−2` over ℚ(∛2) | Remaining factor `X²+αX+α²` irreducible (negative discriminant `−3α²`); stabilizer C₂ transitive on 2 roots | Both true | Keep |
| 2-transitivity negative control | irreducible cyclic cubic | Root field already splitting; remaining quadratic splits; regular C₃ stabilizer trivial on 2 points | Both false | Keep |
| Product splitting fields | two different quadratic fields; same quadratic twice | Compositum degrees 4 versus 2; image V₄ versus diagonal C₂ | Independence must be supplied | Keep disjointness condition |
| Discriminant product/sign | roots 1,−1; roots i,−i | Squared differences 4,−4 = polynomial discriminants 4,−4 | Sign fixed | Keep |
| Product cross term | `f=X−1`, `g=X+1` | Individual discs 1,1; resultant 2; product disc `1·1·2²=4` | Holds | Keep |
| Discriminant field/domain distinction | `X²−1` over ℤ and ℚ | Discriminant 4 in both; integral Bezout would give `2∣1`; over ℚ derivative coprime | Field separability only | Keep |
| Degree-preserving base change | `X²−1` reduced mod 2 | Discriminant `4 mod 2=0`; reduced `(X+1)²` discriminant 0 | Agrees | Keep |
| Constant discriminant boundary | monic constant 1; zero excluded from monic theorem | Native discriminants both 1; separability true for 1, false for 0 | Monicity matters | Keep Layer 3 guard; state it in conventions too |
| Square-root character (sample 840) | `X²−2`, δ=`2√2` | δ²=8; nontrivial automorphism sends δ to `−δ`, sign −1 | Character law correct | Keep |
| Discriminant headline | `X³−3X−1`; `X³−2` | Discs 81 square / −108 nonsquare; images C₃ even / S₃ not even | Iff both sides tested | Keep |
| Characteristic-two negative control | `X²+X+1` over 𝔽₂ | Disc 1 square; Galois image C₂=S₂ not contained in A₂=1 | Excluded counterexample | Keep char ≠2 |
| Quadratic discriminant subfield | S₃ polynomial `X³−2`; cyclic cubic | Fixed field of even subgroup ℚ(√−3), degree 2; cyclic case fixed field ℚ, degree 1 | Matches square/nonsquare | Keep |
| Worked quartic discriminants (sample 870) | `X⁴+X+1`; `X⁴+8X+12` | 229 nonsquare; 331776=576²; groups S₄ and A₄ | Both cases agree | Keep |
| Power-basis versus field discriminant | ℚ(√5), basis `1,√5` | Polynomial/power-basis disc 20; maximal-order field disc 5, index squared 4 | Not interchangeable | Keep power-basis qualifier |
| Resolvent specification (sample 883) | H=Sₙ, invariant 0; H=1, distinct weighted linear invariant | First orbit size 1/product X; second formal stabilizer 1/orbit size n! | Exact stabilizer excludes wrong H | Keep native spec |
| Symmetric descent uniqueness | n=2, invariant x₀ | Orbit product `X²−(x₀+x₁)X+x₀x₁`; coefficient form `X²−e₁X+e₂` | Unique descent matches | Keep |
| Vieta index | `X−1`, n=1, k=0 and 1 | k=0: `1=1`; k=1: `0≠−1` | Unbounded statement false | R04 |
| Specialization/base change (sample 944) | preceding n=2 spec at `X²−2`, then mod 2 | Integral result `X²−2`; reduction X² on both routes | Coefficient substitution unconditional | Keep |
| Orbit-before-base-change convention | invariant `x₀−x₁`, roots 0,1 over ℤ then 𝔽₂ | Integral orbit has 2 elements; after reduction values coincide; specialized product `(X+1)²`, recomputed set product `X+1` | Recomputing orbit is wrong model | Keep |
| Resolvent degree and zero ring | monic degree-2 orbit product over 𝔽₂; zero ring | Product degree 2 even with repeated root; in zero ring polynomial is 0, natDegree 0 | Nontrivial-ring guard required for degree | Native guard present |
| Root enumeration independence | roots ±√2 swapped | Products `(X−√2)(X+√2)` and reverse both `X²−2` | No chosen-order dependence | Keep |
| Resolvent factor/orbit theorem (sample 1007) | n=2, H=1, f=`X²−2` | One Galois orbit size 2; one irreducible resolvent factor degree 2 | Match | Keep separation |
| Degenerate specialization (sample 1021) | n=2 difference invariant at roots 0,1 mod 2 | Two formal orbit points collapse to 1 value; product `(X+1)²`, distinct irreducible factor set size 1 | Orbit/factor bijection would fail | Keep separation |
| Tschirnhaus definition and identity | f=`X²−2`, T=X | Resultant transform `X²−2`; root map identity on two roots | Correct | Keep native definition |
| Tschirnhaus admissibility | same f, T=0 and T=X+1 | Transforms X² and `X²−2X−1`; image root counts 1 and 2 | Constant fails; shift succeeds | Add explicit Checks under R09 |
| Tschirnhaus transport headline | same f, shift, n=2 H=S₂ | Transform splits at `1±√2`; original and transformed image both S₂ order 2, bound is equality | Transport directions agree | Keep supplier |
| Quartic cubic resolvent formula | f=`X⁴−2` | Cubic `X³+8X`; root 0; discriminants both −2048 | Formula and sign match | Keep |
| Quartic decision: S₄ | `X⁴+X+1` | Cubic irreducible, discriminant 229 nonsquare; label order 24 | S₄ | Keep |
| Quartic decision: A₄ | `X⁴+8X+12` | Cubic irreducible, discriminant 331776 square; label order 12 | A₄ | Keep |
| Quartic decision: D₄ | `X⁴−2` | Cubic degrees 1+2; disc −2048 nonsquare; normal closure degree 8 | D₄ | Keep extra quadratic test |
| Quartic decision: C₄ | `X⁴+X³+X²+X+1` | Disc 125 nonsquare; cyclic splitting degree 4, cubic degrees 1+2 | C₄ | Resolvent factor type alone insufficient |
| Quartic decision: V₄ | `X⁴+1` | Disc 256 square; splitting field degree 4; cubic three rational roots | V₄ | Keep |
| Quintic invariant normalization | all 120 renamings of ten monomials | Stabilizer size 20; distinct orbit size 6; `120/20=6` | Correct F₂₀ specification | Correct locator R10 |
| Quintic formula/root check | `X⁵−2` | Sextic `X⁶−50000X`; value at 0 is 0 | Correct | Keep |
| Quintic formula/root check | `X⁵−5X−12` | Descending coefficients `[1,−40,1000,−20000,250000,−66400000,976000000]`; value at 40 is 0 | Correct sign differs from source misprint | Keep |
| Quintic collision control | `X⁵−X` roots `0,1,−1,i,−i` | Orbit values `2,2,2,2,4i,−4i`; product `(X−2)⁴(X²+16)` | Collision is real, input reducible | R06 distinguish irreducible case |
| Full Dummit separation argument | equal five-cycle orbit values | `2x₂=x₁+x₃=x₄+x₅` implies `5x₂=Σxᵢ`; degree of x₂ then 1 versus required 5 | Contradiction in char ≠5 | R06 add target |
| Conditional quintic headline/general range | 𝔽₂ polynomial `X⁵+X²+1` | In bit encoding modulo `t⁵+t²+1`, roots `[2,4,16,13,27]`, invariant values `[1,8,10,14,19,30]`; C₅ solvable, rational root 1 | Both sides true | R07 align range |
| Pair-sum resolvent (sample 1155) | invariant `x₀+x₁` in 5 variables | Stabilizer `2!·3!=12`; orbit `5 choose 2=10`; resolvent degree 10 | Correct | Add locator |
| FactorDegrees total definition | zero; one; `(X−1)²` over finite field | Multisets `[]`, `[]`, `[1,1]`; sums 0,0,2 | Includes multiplicity and junk values | Keep |
| Monic/degree-preserving guard | `2X+1` reduced mod 2 | Original degree 1, reduced degree 0 and factorDegrees `[]` | No degree-one permutation type | Keep monicity |
| Frobenius orbit sizes (sample 1217) | 𝔽₈=𝔽₂[u]/(u³+u+1) | `u → u² → u⁴=u²+u → u`; orbit size 3 = irreducible factor degree | Arithmetic Frobenius convention | Keep |
| Membership headline | `(X²−2)(X−1)` mod 5 | Factors degrees 2,1; nontrivial Galois element full type `[2,1]` | Correct reducible case | Keep supplier |
| Bad-prime exclusion | `X⁴+1` mod 2 | `(X+1)⁴`, factor degrees `[1,1,1,1]` with repeats; discriminant 256 divisible by 2 | Excluded; not four distinct Frobenius roots | Keep |
| Index-prime control | `X³+X²−2X+8` mod 2 | `X²(X+1)` and polynomial discriminant −2012 divisible by 2 | Not an allowed polynomial reduction prime | Keep distinction from field discriminant |
| Separability of f versus resolvent | `X⁵−X`, p=3 | Polynomial disc −256 nonzero mod 3; sextic disc 0 | Good prime for f does not certify resolvent separation | Keep separate hypotheses |
| Factor types supply lower bounds only | D₅ versus A₅ | D₅ types `1⁵,5,1·2²` all occur in A₅; orders 10 and 60 | Same observed types need not determine group | Keep limitation |
| Count/index definition | degrees 0,1,2,3,4,5,6 | Counts `0,1,1,2,5,5,0`; degree-6 index Fin 0, not a classification of degree 6 | Intended restricted carrier | Keep native citation |
| Label conjugacy API (sample 1309) | C₄ under relabeling; V₄ versus C₄ | Conjugation preserves order/type; V₄ has 0 four-cycles, C₄ has 2 | Isomorphic-order shortcut excluded | Keep |
| Polynomial label uniqueness headline | `X−1`; `X²−2`; `(X−1)(X+1)` | First two have one label each, degrees 1,2; third has 0 labels (image order 1 versus degree-2 transitive order 2) | Guards distinguish reducible input | Keep only new obligation |
| Quartic/quintic classification from invariants (sample 1418) | C₅ and D₅ examples | Discs `14641=121²` and `64000000=8000²`; both resolvents have rational roots; orders 5 and 10 differ | Pair of invariants insufficient for exact solvable label | Keep added recognition data |
| Certificate C₅ route | cyclic quintic in worked table | Mod 2 degree 5 irreducible; group order 5, square disc 14641 | Label 5T1 | Cite mathematics, R11 |
| Certificate D₅ route | `X⁵−5X−12` | Mod 7 degree 5; mod 3 degrees `[1,2,2]`; square disc; sextic root 40 | Label 5T2 | Cite mathematics, R11 |
| Certificate F₂₀ route | `X⁵−2` | Mod 11 degree 5; nonsquare disc 50000; sextic root 0 | Label 5T3 | Cite mathematics, R11 |
| Certificate A₅ route | `X⁵+20X−16` | Mod 3 degree 5; mod 7 degrees `[1,1,3]`; disc `1024000000=32000²` | Label 5T4 | Cite mathematics, R11 |
| Certificate S₅ route | `X⁵−X−1` | Mod 3 degree 5; mod 2 degrees `[2,3]`; cube of such permutation is a swap | Label 5T5 | Cite mathematics, R11 |
| Full symmetric predicate | 1, X, X² | Separability true,true,false; Gal surjective onto S₀,S₁,S₁ in all three; predicate true,true,false | README negative check false | R03 |
| Symmetric realization headline | n=1,2; f=X, X²−2 | Monic degrees 1,2; irreducible; Galois orders `1=1!`, `2=2!` | Boundary existence holds | Keep supplied theorem |
| Three-prime construction patterns | n=4 | Needed types `[4]`, `[3,1]`, `[2,1,1]`; transitive + 3-cycle + swap gives S₄ order 24 | Group route valid | Keep; no new algorithm |
| Alternating examples | cubic, quartic, quintic above | Square discs `81`, `331776`, `1024000000`; alternating orders 3,12,60 | Exactly three listed examples | Keep finite scope |
| Prime-index normal subgroup (sample 1583) | S₃; C₃; trivial group | A₃ index 2; trivial subgroup index 3; no prime index in group of order 1 | Nontrivial guard essential | Keep supplied lemma |
| Roots-of-unity enlargement | splitting field of `X³−2`, N=6 | ζ₆⁶=1; F₁=ℚ(ζ₃); relative degree 3; ζ₆² has order 3 | Kummer input holds | Keep |
| Compositum restriction injection | same example | Gal(L/F₁)=C₃ order 3 injects into S₃ order 6; E₀∨F₁=L | No disjointness needed | Keep |
| Relative induction (sample 1615) | same example, K=F₁ then K'=L | Dimensions 3 then 1; prime quotient 3; generator α³=2∈K | Strict decrease and closure step | Keep |
| Induction endpoint | E=F, N=1 | ζ₁=1; compositum F; finrank 1; radical containment just F≤closure | Base case nonvacuous and true | Keep |
| Radical generator transfer | K⊆R, α^p=a∈K | In cubic example α³=2; after inclusion same equation in Ω; K(α) degree 3 lies in closure | Source/target and nonzero p correct | Keep |
| Reverse radical implication | E=ℚ(√2) | Primitive polynomial X²−2, solvable C₂; embedded generator radical since square 2 | Native one-way theorem applies | Keep |
| Field radical headline | E=F; splitting fields of `X³−2`, `X⁵−X−1` | Groups 1,S₃,S₅: solvable true,true,false; all-elements radical true,true,false | Both directions tested | Keep new theorem |
| Ambient algebraic closure requirement | real cyclic cubic | Group C₃ solvable; real cyclic cubic contains no nontrivial pure radical step over ℚ; radical expressions require enlarged ambient field | Internal-closure replacement wrong | Keep Ω |
| Polynomial radical headline | 0, 1, `(X²−2)²` | First two rootSets empty and groups trivial; third roots ±√2 and group C₂ | Both sides true, repeated factors allowed | Keep new theorem |
| All roots versus some root | `(X⁵−X−1)(X−1)` | Root 1 radical; splitting group S₅ nonsolvable | Some-root replacement false | Keep universal root quantifier |
| Prime degree and two nonreal roots | `X³−2` | Three complex roots, one real; S₃ solvable despite two nonreal roots | p≥5 essential for nonsolvability | Keep bound |
| Prime-degree nonsolvability | `X⁵−4X+2` | Eisenstein at 2; exactly 3 real roots and 2 nonreal; image S₅, derived subgroup A₅ nontrivial perfect | Nonsolvable, no radical root | Keep |

The reference-row calculations separately test every line of the low-degree table. In the following table the computed tuple is **(order, all permutations even, primitive, solvable)**, followed by the orders in the derived series. It is compared with the README row and the LMFDB low-degree record; all 14 agree. Primitivity on one point uses Mathlib's `IsPreprimitive` convention.

| Reference statement | Instances / computed tuple and derived orders | Claimed tuple | Result / change |
|---|---|---|---|
| 1T1 | trivial action: `(1,true,true,true)`; `[1]` | Same | Equal; cite base |
| 2T1 | swap: `(2,false,true,true)`; `[2,1]` | Same | Equal; cite base |
| 3T1 | 3-cycle: `(3,true,true,true)`; `[3,1]` | Same | Equal; cite base |
| 3T2 | two generating swaps: `(6,false,true,true)`; `[6,3,1]` | Same | Equal; cite base |
| 4T1 | 4-cycle: `(4,false,false,true)`; `[4,1]` | Same | Equal; cite base |
| 4T2 | two double swaps: `(4,true,false,true)`; `[4,1]` | Same | Equal; cite base |
| 4T3 | dihedral generators: `(8,false,false,true)`; `[8,2,1]` | Same | Equal; cite base |
| 4T4 | two 3-cycles: `(12,true,true,true)`; `[12,4,1]` | Same | Equal; cite base |
| 4T5 | 4-cycle and swap: `(24,false,true,true)`; `[24,12,4,1]` | Same | Equal; cite base |
| 5T1 | 5-cycle: `(5,true,true,true)`; `[5,1]` | Same | Equal; cite base |
| 5T2 | dihedral generators: `(10,true,true,true)`; `[10,5,1]` | Same | Equal; cite base |
| 5T3 | affine generators: `(20,false,true,true)`; `[20,5,1]` | Same | Equal; cite base |
| 5T4 | two 3-cycles: `(60,true,true,false)`; `[60,60]` | Same | Equal; cite base |
| 5T5 | swap and 5-cycle: `(120,false,true,false)`; `[120,60,60]` | Same | Equal; cite base |

## Not verifiable

- Dixon–Mortimer, *Permutation Groups*, Theorem 2.6A and §2.7; Cohen, *A Course in Computational Algebraic Number Theory*, §6.3/§6.3.2; Soicher–McKay; Geissler–Klüners; Berlekamp: the sources service reached only paywalled/uncertified records. Their text and page-specific hypotheses were not certified here. Native declarations and the legal texts above give independent evidence for the instances stated, not permission to claim these books were read.
- Wielandt, *Finite Permutation Groups*, Theorems 7.5 and 13.9; van der Waerden, *Algebra I*, §61; Serre, *Topics in Galois Theory*, §4.4: the service's author/title searches found no readable legal text. These unresolved source requests remain in the scratch missing-reference list. No contents were guessed.
- Kappe–Warren, “An Elementary Test for the Galois Group of a Quartic Polynomial”, pp. 133–137: publisher DOI request returned HTTP 403. Conrad's legal exposition was read, including his stated quartic criterion, but it does not certify the primary paper's pagination or wording.
- Butler–McKay, *The transitive groups of degree up to eleven*, pp. 863–911: the prior record already treated this as uncertified; it was not reopened as a new missing-source request. The accessible Conway–Hulpke–McKay table and LMFDB low-degree entries supply the checked counts, not a verification of the unread paper's exact locators.
- Individual LMFDB number-field records and their maximal-order discriminants were not all fetched. The polynomial discriminants and group examples in this report were recomputed; these should not be read as certification of every external database field label.
- The worker's precise random sample cannot be reconstructed from unnamed targets. The reproducible 15-target replacement is identified above. The previous report's different PR/head was not used to fill any missing evidence.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the source says the remaining five resolvent values form an irreducible quintic without establishing their distinctness; it should exclude coincident values using the argument in Chapman's correction; affects the proof.
- **Misprint** in dummit-quintics at second example, printed p. 399: the source says the sextic's cubic coefficient is +20000; it should be −20000, as formula (2′) and the author's errata give; affects a stated result.
- **Misprint** in dummit-quintics at third example, printed p. 400: the source says the constant coefficient is −36026068564469671875; it should be −360260685644469671875, as the author's errata records; affects a stated result.
