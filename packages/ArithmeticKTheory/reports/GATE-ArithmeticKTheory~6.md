# ArithmeticKTheory: human review response

Reviewed head: `e12ad1f70024fd334a51f4beae4c302aaa837e4f`. There is one distinct finding: the two description declarations are instances of the same prerequisite-accounting defect. The roadmap files are unchanged; no commit, push or GitHub write was made.

## H01 (CBirkbeck) — answered

The description omits all seven prerequisite roadmaps below; in particular, ReductiveGroupsPartII's “Additional supplier contracts” consumes CFSGBasicProperties T0–T2 and ChevalleyGroups C2–C4, so these are inherited merge prerequisites even without direct imports into ArithmeticKTheory. Both description sections need the concrete correction below, but pull-request text is outside this job's permitted edits: the finding remains outstanding, and no description correction is claimed as applied.

## Verified prerequisite evidence

The description was read at the reviewed head: its Dependencies paragraph claims to include the named suppliers and their prerequisites, while its Merge order paragraph omits the seven suppliers and denies dependence on other authors' open pull requests. The indexed heads below are all open new-roadmap pull requests by other authors. None of the seven roadmap folders exists on main at either the index's `82e5289` or the local `origin/main`/content head `ae2562c`; the intervening main changes affect only LocalFieldsRamification's status and progress files.

| Omitted supplier, author, indexed head | Contract checked at the consumer's indexed head | Required precedence |
| --- | --- | --- |
| HomotopySpheres #1287, kim-em, `0b90c9b` | Stage 9, item 2 supplies π₄ˢ=0, explicitly consumed by `TauCetiRoadmap/ArithmeticKTheory/README.md:468` and §7.5. The selected supplier remains #1287, rather than the overlapping #284. | #1287 → #1418 |
| AlgebraicKTheory #1142, kim-em, `e5df75b` | StableHomotopyKTheory `00bfbf7`, “From AlgebraicKTheory”, consumes A0–A1. KTheoryFiniteLocalFields `afe02e8`, “From the foundational K-theory roadmaps”, consumes A2/A4 for determinant and semilocal K₁, and A5 for Matsumoto and finite-field K₂. | #1142 → #1227 and #1281 |
| TangentialBordism #942, kim-em, `bf9da30` | StableHomotopyKTheory `00bfbf7`, “From TangentialBordism”, consumes B4.1–B4.2's Steenrod operations and mod-two Adams input. | #942 → #1227 |
| LFunctions #248, roed-math, `affb2d0` | IntegralIwasawaTheory `5d2ed25`, “From TauCetiRoadmap.GlobalNumberFields, ClassFieldTheory, and ProfiniteCohomology”, consumes Layers 3–5's continued L-functions, functional equations, Euler-factor comparisons and class-number identities. | #248 → #1306 |
| LinearFormsInLogarithms #451, mkaratarakis, `fd8774c` | The same IntegralIwasawaTheory contract consumes §8.10's qualitative small-disc Baker–Brumer independence; its §4.2 explicitly uses that input in the algebraic-number version. | #451 → #1306 |
| CFSGBasicProperties #446, kim-em, `3e30589` | ReductiveGroupsPartII `1383569`, “Additional supplier contracts” and RG2.4.4, consumes T0's normal-subgroup/central-quotient criterion and T1–T2's finite ordinary perfectness inputs in their common validity range. The supplying T0 and T1–T2 statements are present. | #446 → #785 |
| ChevalleyGroups #447, kim-em, `99cf6aa` | The same ReductiveGroupsPartII contract and RG2.3.1/RG2.5.2 consume C4's integral big cell and C3–C4's field-point centre. The supplied centre is Hom(Λ(D)/Q,k×), with P/Q only for the simply connected datum; the integral open immersion is on the chosen Chevalley datum. | #447 → #785 |

These are genuine contracts, not merely bibliographic mentions. No extra direct import, duplicate construction or widening of ArithmeticKTheory is needed. The existing KTheoryFiniteLocalFields inherited acknowledgement at `TauCetiRoadmap/ArithmeticKTheory/README.md:398` and the HomotopySpheres contract remain correct. The two new omissions belong in the inherited description account, not in new direct mathematical supplier contracts here.

## Concrete description correction for the worker

Replace both existing prerequisite paragraphs, including their exhaustive-transitivity and other-author assertions. The following replacement deliberately defines a selected-contract scope; it does not certify the existing long list or linear chain as a complete transitive schedule.

**Dependencies.** The mathematical inputs are specified by roadmap and section in the README's Exact supplier contracts; Suggested.lean imports no roadmap modules. Selected additional prerequisites inherited through those inputs are AlgebraicKTheory (#1142), TangentialBordism (#942), LFunctions (#248), LinearFormsInLogarithms (#451), CFSGBasicProperties (#446), and ChevalleyGroups (#447); HomotopySpheres (#1287) directly supplies the fourth stable stem used in §7.5. These include other authors' open new-roadmap pull requests. This paragraph identifies the selected contracts discussed here, not an exhaustive inventory of whole-roadmap merge prerequisites.

**Merge order.** Every direct supplier must precede ArithmeticKTheory, and inherited suppliers must precede their own consumers. For the selected contracts above, the required edges are #1142 → #1227, #1142 → #1281, #942 → #1227, #248 → #1306, #451 → #1306, #446 → #785, #447 → #785, and #1287 → #1418. The consuming roadmaps #1227, #1281, #1306 and #785 precede #1418. These edges describe a partial order for the selected inputs; whole-roadmap merge prerequisites additionally include the suppliers of every other stage and must follow those roadmaps' contracts.

This replacement answers the review's explicitly offered scoped-account alternative. An exhaustive transitive list would require a separate closure audit; simply appending seven names while retaining the present exhaustive claim would not establish its accuracy. The description action remains for the worker, and the review thread should remain unresolved until both paragraphs are actually corrected.

## Citation, ownership and pinned-interface checks

The relevant supplier contracts and their supplying sections were read at the indexed heads, with the registry used to disambiguate the two HomotopySpheres proposals. The cross-roadmap resolver reports no unresolved roadmap citation. Its earlier lead for `VanishingCycles.etaleTateTwists` resolves to EtaleCohomologyFoundations §F.0.3, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233` on main: this is a planned supplier target, not an implemented pinned declaration. The main revision change since the index does not change any roadmap README or Suggested.lean. No construction or carrier is added, moved or duplicated, and no later roadmap is introduced as a supplier. Ownership against unrelated open pull requests without supplied files was not checked; no new ownership claim depends on them.

The installed library revisions match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At the Mathlib pin, `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65` defines the native S-integer subalgebra by valuation ≤1 outside S, without a finite-S assumption; its full and empty set identifications are at lines 88 and 94. `Mathlib/NumberTheory/Bernoulli.lean:194` fixes the arithmetic sequence, with B₁=−1/2 at line 204, and `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64` defines the finite class-group cardinality. These match README §§1.1 and 7.2. No new source is required; settled waived sources are not reopened.

## Elaborated signatures

A scratch file was confirmed to contain exactly the unchanged acceptance declarations followed by `#check @name` for all four, then elaborated successfully. Each resulting type was compared with README §§1.1 and 7.2: the definition and both localization theorems retain the commutative ring R, its Dedekind-domain instance, arbitrary S, the field F, its R-algebra and fraction-field instances; the criterion also retains M, and the torsion theorem its class-group torsion hypothesis. The Bernoulli theorem retains primality, oddness, cyclotomic-class-number nondivisibility and k≥1. No binder or signature changed; the scratch elaboration exited 0 with the same three admitted-theorem warnings.

## Adversarial mathematics pass

No mathematical assertion, definition or convention was added or changed. This pass recomputes the four acceptance declarations and the convention witnesses they use; it does not claim a fresh statement-by-statement audit of the unchanged eight-layer README. Exact rational arithmetic supplies the Bernoulli values below, including an index beyond the restricted source's range.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| sUnitSubmonoid and allowed prime support | R=ℤ, S empty, {(2)}, or all primes; R=𝔽₂ | Empty S gives {−1,1}; at {(2)}, 2 is a unit and 3 is not; all primes give ℤ excluding 0. Over 𝔽₂, S is empty and the monoid is {1}. In ℤ[1/2], 1/2 and −1/8 are units, 3/4 is integral but not a unit, and 1/3 is not integral. | The inverse-image definition distinguishes integrality from invertibility and puts allowed support on S. A zero ring cannot embed as a fraction subring of a field. | None. |
| integer_isLocalization_iff, including both necessary conditions | R=ℤ, S={(2)}, M generated by 2, by 1, by 2 and 3, or containing 0 | For powers of 2, both conditions hold and M⁻¹ℤ=ℤ[1/2]. For M={1}, the unit condition holds but M∩(2) is empty and M⁻¹ℤ=ℤ. For powers of 2 and 3, the prime is met but 3 is not a unit, and M⁻¹ℤ=ℤ[1/6]. If 0∈M, the unit condition fails and the zero localization cannot equal ℤ[1/2]. | The equivalence survives independent failures of each condition; the zero denominator is excluded. | None. |
| integer_isLocalization_iff, empty and infinite sets | R=ℤ, S empty or all primes; R=𝔽₂, S empty | M={±1} gives ℤ on both sides for empty S. All nonzero integer denominators give ℚ on both sides and meet (p) at p for every p. For 𝔽₂, M={1} gives 𝔽₂ and the prime-meeting condition is empty. | No finite-S or nonfield restriction is needed. | None. |
| integer_isLocalization_of_torsion_classGroup | Cl(ℤ)=0; P=(2,1+√−5) in ℤ[√−5] | Empty and full S over ℤ give ℤ and ℚ. For the nonprincipal quadratic ideal, P²=(2) and Norm(P)²=2²=4=Norm((2)); the class has order two, while 2 has support only at P and becomes invertible on allowing P. | The nonprincipal example supplies a denominator through a positive ideal power; principality of P is unnecessary. | None. |
| regularPrime_dividedBernoulli_num and the arithmetic Bernoulli convention | (p,k)=(3,1),(3,3),(5,5),(5,7),(7,7) | B₂/1=1/6, B₆/3=1/126, B₁₀/5=1/66, B₁₄/7=1/6, and B₁₄/7=1/6; every reduced numerator has residue 1 modulo its p. For p=3, the first two denominators have residue 0, so numerator nondivisibility does not assert p-integrality. | Divided indices and the exceptional branch agree with the statement; B₁'s sign cannot affect the even indices. | None. |
| regularPrime_dividedBernoulli_num beyond the bounded source range and excluded controls | (p,k)=(5,63),(37,16), and k=0 | At (5,63), the reduced numerator and denominator of B₁₂₆/63 both have residue 4, hence the value has residue 1 modulo 5. At (37,16), B₃₂/16=−7709321041217/8160 has numerator residue 0 modulo 37. Totalized B₀/0=0 has numerator 0. | The all-index theorem survives a large k; regularity and k≥1 exclude the two failures. | None. |

## Validation

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0 with exactly three `declaration uses sorry` warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, `:53` and `:66`:

```text
Build completed successfully (8976 jobs).
```

The required dependency-direction check with `--movable` exited 0 and emitted exactly:

```text
depcheck: 34 roadmaps, 326 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The full gate against `origin/main` exited 0 with a clean worktree:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

These checks validate the permitted roadmap files, not the still-uncorrected PR description.
