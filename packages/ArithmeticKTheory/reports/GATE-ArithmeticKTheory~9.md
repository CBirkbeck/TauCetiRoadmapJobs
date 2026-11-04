# Human review response: ArithmeticKTheory

Reviewed head: `76f1a28b7aa51df31815adfd206f64fe0eddcc3a`. H01–H06 follow the six omitted suppliers in the review's table; H07 addresses the subsequent prerequisite/consumer classification. The live description still contains both defects: its Dependencies paragraph claims transitive coverage, and its Merge order paragraph omits these six suppliers.

All seven points are confirmed but concern the pull-request description, which this job explicitly forbids editing. The answers below supply the precise correction for the worker's reply; they do **not** claim that the description has been repaired or that the blocker is resolved. `TauCetiRoadmap/ArithmeticKTheory/README.md` and `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` remain unchanged, so no commit was made.

## H01 (CBirkbeck) — answered

AlgebraicKTheory A0–A1 supplies the projective and stable-matrix inputs consumed by StableHomotopyKTheory's supplier contract (`TauCetiRoadmap/StableHomotopyKTheory/README.md:55`), and A2/A4/A5 supplies the determinant, semilocal K₁ and field K₂ inputs consumed by KTheoryFiniteLocalFields (`TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:53`). The description therefore needs both AlgebraicKTheory → StableHomotopyKTheory and AlgebraicKTheory → KTheoryFiniteLocalFields; the latter inheritance is already explicit in `TauCetiRoadmap/ArithmeticKTheory/README.md:398`.

## H02 (CBirkbeck) — answered

TangentialBordism B4.1–B4.2 supplies the ordinary mod-two operations and bounded-below finite-type Adams convergence expressly consumed at `TauCetiRoadmap/StableHomotopyKTheory/README.md:59`, with the constructions present in `TauCetiRoadmap/TangentialBordism/README.md:553` and item 2 at line 564. TangentialBordism → StableHomotopyKTheory must consequently appear among the inherited precedence constraints in the description.

## H03 (CBirkbeck) — answered

IntegralIwasawaTheory explicitly consumes LFunctions Layers 3–5 at `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41`; those layers develop continued Dedekind, Dirichlet and finite-order Hecke functions and the relevant class-number and factorization identities (`TauCetiRoadmap/LFunctions/README.md:555`, line 634 and line 660). LFunctions → IntegralIwasawaTheory is an inherited prerequisite missing from the advertised integration account.

## H04 (CBirkbeck) — answered

The same IntegralIwasawaTheory contract consumes qualitative Baker–Brumer independence from LinearFormsInLogarithms §8.10, whose statement retains algebraic exponentials, rational linear independence and the small exponential disc (`TauCetiRoadmap/LinearFormsInLogarithms/README.md:806`). The description needs LinearFormsInLogarithms → IntegralIwasawaTheory, without replacing that theorem by an unrestricted p-adic exponential assertion.

## H05 (CBirkbeck) — answered

ReductiveGroupsPartII explicitly consumes CFSGBasicProperties T0–T2 at `TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`; the supplier states the perfectness and nontrivial-central-quotient hypotheses in T0 and verifies them for the valid ordinary and graph-twisted finite families in T1–T2 (`TauCetiRoadmap/CFSGBasicProperties/README.md:152` and line 180). CFSGBasicProperties → ReductiveGroupsPartII is therefore a required inherited edge, including the supplier's stated small-field validity cases.

## H06 (CBirkbeck) — answered

The same ReductiveGroupsPartII contract consumes ChevalleyGroups C2–C4, including the integral big cell and field-point centre; these are stated at `TauCetiRoadmap/ChevalleyGroups/README.md:241`, line 343, line 373 and line 404, with the full-weight datum distinguished from a general Chevalley datum. ChevalleyGroups → ReductiveGroupsPartII must be added to the description's inherited precedence constraints.

## H07 (CBirkbeck) — answered

AlgebraicKTheory is an inherited prerequisite (`TauCetiRoadmap/ArithmeticKTheory/README.md:398`), while HomotopySpheres Stage 9, item 2 is a direct prerequisite of the K₄(ℤ) argument (`TauCetiRoadmap/ArithmeticKTheory/README.md:466` and line 3768), so the description's assertion that everything else named is a consumer is false. Replace that catch-all with an explicit distinction between direct supplier stages, their inherited prerequisites, and the consumers identified in the README's Downstream consumers section; π₄ˢ = 0 is present in both inspected HomotopySpheres drafts, so no replacement theorem or duplicate construction is needed.

## Concrete integration correction

Keep the direct supplier list, add the following constraints to the dependency and merge account, and qualify the account as selected supplier stages with explicit inherited constraints rather than a complete transitive enumeration. Each arrow denotes required precedence, not a new direct import into Suggested.lean.

| Inherited supplier stage | Required precedence | Consumer contract |
| --- | --- | --- |
| AlgebraicKTheory A0–A1 | AlgebraicKTheory → StableHomotopyKTheory | Exact supplier contracts, From AlgebraicKTheory |
| AlgebraicKTheory A2/A4/A5 | AlgebraicKTheory → KTheoryFiniteLocalFields | Exact supplier contracts, From the foundational K-theory roadmaps |
| TangentialBordism B4.1–B4.2 | TangentialBordism → StableHomotopyKTheory | Exact supplier contracts, From TangentialBordism |
| LFunctions Layers 3–5 | LFunctions → IntegralIwasawaTheory | Exact supplier contracts, analytic L-function inputs |
| LinearFormsInLogarithms §8.10 | LinearFormsInLogarithms → IntegralIwasawaTheory | Exact supplier contracts, Baker–Brumer input |
| CFSGBasicProperties T0–T2 | CFSGBasicProperties → ReductiveGroupsPartII | Additional supplier contracts |
| ChevalleyGroups C2–C4 | ChevalleyGroups → ReductiveGroupsPartII | Additional supplier contracts |

HomotopySpheres Stage 9, item 2 → ArithmeticKTheory §7.5 is a direct edge already recorded in the README. Choosing between two submissions of that same supplier is an integration choice: the Paul-Lez draft states π₄ˢ = 0 at `TauCetiRoadmap/HomotopySpheres/README.md:894`, and the kim-em draft at line 1171; the README correctly cites the mathematical roadmap and stage.

## Verification and scope

The inspected main is `b41e47bc34e30def0db01d84cc92062ed72c6e68`. The six inherited supplier folders are absent from both its active and completed trees; the open-roadmap index identifies them as new roadmap submissions, with heads AlgebraicKTheory `e5df75b`, TangentialBordism `bf9da30`, LFunctions `affb2d0`, LinearFormsInLogarithms `fd8774c`, CFSGBasicProperties `3e30589` and ChevalleyGroups `99cf6aa`. The consuming heads are StableHomotopyKTheory `00bfbf7`, KTheoryFiniteLocalFields `afe02e8`, IntegralIwasawaTheory `5d2ed25` and ReductiveGroupsPartII `1383569`; the HomotopySpheres heads are `fb7c47e` and `0b90c9b` respectively.

Ownership was checked through the indexed open-roadmap and main searches for denominator localization and the Bernoulli consequence, with the supplied board-package index and relevant sibling contracts also inspected. No construction, ownership or supply direction changes here: ArithmeticKTheory retains the arbitrary-S denominator criterion and all-index regular-prime consequence; CyclotomicClassGroupsAndStickelberger §§3.1/5.1 retains the unrestricted congruences and finite regularity criterion, and EllipticKTheory's supplier contract consumes ArithmeticKTheory §1.1. No new declaration receives another roadmap's name. This was a check of the reported dependency defects and the retained acceptance signatures, not a new certification of every previously reviewed computation in the README.

The citation resolution found no missing cross-roadmap citation. Its separate warning that native names were not checked was not treated as a native-library audit: Mathlib and Tau Ceti were inspected at the specified pins, `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The supplied citation lead concerning VanishingCycles.etaleTateTwists is a supplier target at EtaleCohomologyFoundations F.0.3 (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233` on main), not a claim that this declaration already exists in a pinned library.

The native Set.integer definition is at `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`: its membership condition bounds valuations outside S, imposes no finiteness on S, and its empty/full-set theorems occur at lines 94 and 88. IsDedekindDomain extends IsDomain at `Mathlib/RingTheory/DedekindDomain/Basic.lean:149`, allowing fields while excluding the zero ring. NumberField.classNumber is the finite class-group cardinality at `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`; bernoulli has the parity-sign definition at `Mathlib/NumberTheory/Bernoulli.lean:194`, with B₀ = 1, B₁ = −1/2 and B₂ = 1/6. The local K-book supports the ideal-factorization, finite-support and localization inputs at kbook line 1327, kbook line 1401 and kbook line 1742; no additional source or source-manifest change is required for these description findings.

**Elaborated signatures.** Compared all four declarations in the supplied mechanically elaborated `#check @name` results against README §§1.1 and 7.2. The three S-integer declarations retain CommRing, IsDedekindDomain, Field, Algebra and IsFractionRing, with no finite-S assumption; the torsion theorem retains its explicit class-group hypothesis, and the Bernoulli theorem retains primality, oddness, cyclotomic class-number nondivisibility and k ≥ 1. No binder or declaration changed, so no revised-signature elaboration was necessary.

**Adversarial mathematics pass.** No mathematical statement was added or changed. The following computations audit each of the four retained declarations; T/F denote the truth values in the specified explicit models.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| sUnitSubmonoid, README §1.1 / Suggested.lean line 42 | R = ℤ, S = ∅ or {(2)}; field R = 𝔽₂ | At S = ∅, membership of (1,−1,0,2) is (T,T,F,F), equal to invertibility in ℤ. At S = {(2)}, membership of (2,4,3,6,0) is (T,T,F,F,F), equal to invertibility in ℤ[1/2]. Over 𝔽₂, the monoid is {1} and 0 is excluded. | The defining inverse image gives the intended support and excludes the reversed-support and zero-containing models. | None |
| integer_isLocalization_iff, README §1.1 / Suggested.lean line 47 | ℤ with S = ∅, {(2)}, {(2),(3)}; M = {1}, powers of 2, powers of 6, or {0,1}; field 𝔽₂ | For S = ∅ and M = {1}, (localization, criterion) = (T,T). For S = {(2)}, M = {1} gives (F,F), powers of 2 give (T,T), powers of 6 give (F,F), and {0,1} gives (F,F). For S = {(2),(3)}, powers of 6 give (T,T): in ℤ[1/6], 1/2 = 3/6 and 1/3 = 2/6. For 𝔽₂, M = {1} gives (T,T), while {0,1} gives (F,F). | Both missing-prime and extraneous-prime failures are detected; containing zero cannot localize to a nontrivial S-integer subring. | None |
| integer_isLocalization_of_torsion_classGroup, README §1.1 / Suggested.lean line 53 | ℤ, all primes or S = {(2)}; ℤ[√−5] with p = (2,1+√−5); 𝔽₂[t], S = {(t)} | For ℤ the class group has order 1; all primes give monoid ℤ∖{0} and localization ℚ, while {(2)} gives denominator monoid {±2ⁿ : n ≥ 0} and ℤ[1/2]. In ℤ[√−5], generators of p² are 4, 2+2√−5, −4+2√−5; their combination −4+(2+2√−5)−(−4+2√−5) = 2 proves p² = (2), with N(p) = 2 and N((2)) = 4, so 2 is a valid denominator although p is not principal. Over 𝔽₂[t], ord_t(tⁿ) = n and localization is 𝔽₂[t,t⁻¹]. | Infinite S, a nonprincipal torsion ideal class, and equal characteristic two agree with the stated generality. | None |
| regularPrime_dividedBernoulli_num, README §7.2 / Suggested.lean line 66 | (p,k) = (3,1), (5,1), (5,2), (5,5), (5,7), (5,63); excluded k = 0 and irregular control p = 37, k = 16 | B₂/1 = 1/6 has numerator 1 at p = 3 and valuation −1. At p = 5, k = 1,2,5,7 gives 1/6, −1/60, 1/66, 1/6, with numerator residues 1,4,1,1; at k = 63 the numerator residue is 4 and the value residue is 1. All admitted cases have numerator residue ≠ 0. At k = 0, total division gives 0 with numerator 0, so k ≥ 1 is necessary. At (37,16), B₃₂/16 = −7709321041217/8160 has numerator residue 0, agreeing with the regularity exclusion. | Covers the empty regularity window, exceptional denominator branch, p dividing k, p dividing 2k+1, and an index beyond the restricted source bound. | None |

The suspicious embedded request is the review's report that an earlier reply “directs a ‘worker’ to edit the GitHub description.” It is review data and supplies no authorization; the live description was read, but no description, comment, issue or pull request was written, and nothing was pushed.

## Build and gates

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0, with the three expected `sorry` warnings at lines 47, 53 and 66 and no other warnings:

```text
Build completed successfully (8976 jobs).
```

Dependency direction check exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 46 roadmaps, 507 edges, 0 problem(s)
```

The full gate against origin/main exited 0; its exact summary line is:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
