# ArithmeticKTheory: human review response

Reviewed head: `e12ad1f70024fd334a51f4beae4c302aaa837e4f`. The review contains one consolidated finding about prerequisite accounting in the description. Neither permitted roadmap file changed; no commit, push or GitHub write was made.

## H01 (CBirkbeck) — answered

The seven prerequisite relationships below are supported by the supplier contracts: the live Dependencies paragraph omits all seven, while Merge order omits six and presents HomotopySpheres as #284 or #1287 instead of retaining the selected #1287. The live description already acknowledges other authors' prerequisites, so that part of the quoted criticism is obsolete; both description sections still need correction, but this job forbids editing pull-request text, and the finding remains outstanding.

## Verified contracts and remaining omissions

The live pull-request head agrees with the reviewed head. The indexed supplier heads agree with those cited in the review; all seven prerequisites are indexed as open new-roadmap pull requests, and none of their folders occurs under `TauCetiRoadmap/` or `Completed/` on main at `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`.

| Prerequisite and indexed head | Evidence read at the consumer | Required precedence | Live description |
| --- | --- | --- | --- |
| HomotopySpheres #1287, `0b90c9b`, kim-em | `TauCetiRoadmap/ArithmeticKTheory/README.md:468` consumes Stage 9, item 2's fourth stable stem; §7.5 uses it at line 3717. | #1287 → #1418 | Absent from Dependencies; Merge order offers #284 or #1287. |
| AlgebraicKTheory #1142, `e5df75b`, kim-em | StableHomotopyKTheory `00bfbf7`, `TauCetiRoadmap/StableHomotopyKTheory/README.md:57`, consumes A0–A1. KTheoryFiniteLocalFields `afe02e8`, `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:53`, consumes A2/A4/A5; ArithmeticKTheory explicitly records this inheritance at lines 398–400. | #1142 → #1227; #1142 → #1281 | Absent from both sections. |
| TangentialBordism #942, `bf9da30`, kim-em | StableHomotopyKTheory `00bfbf7`, `TauCetiRoadmap/StableHomotopyKTheory/README.md:61`, consumes B4.1–B4.2's Steenrod squares and mod-two Adams tower. | #942 → #1227 | Absent from both sections. |
| LFunctions #248, `affb2d0`, roed-math | IntegralIwasawaTheory `5d2ed25`, `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41`, consumes Layers 3–5's analytic functions, functional equations, class-number formulas and Artin factorizations. | #248 → #1306 | Absent from both sections. |
| LinearFormsInLogarithms #451, `fd8774c`, mkaratarakis | The same IntegralIwasawaTheory contract consumes §8.10's qualitative Baker–Brumer independence on the small exponential disc. | #451 → #1306 | Absent from both sections. |
| CFSGBasicProperties #446, `3e30589`, kim-em | ReductiveGroupsPartII `1383569`, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`, “Additional supplier contracts”, consumes T0–T2's simplicity criterion and finite ordinary/graph-twisted perfectness in their stated validity range. | #446 → #785 | Absent from both sections. |
| ChevalleyGroups #447, `99cf6aa`, kim-em | The same ReductiveGroupsPartII contract consumes C2–C4, specifically C4's integral big cell and C3–C4's field-point centre. | #447 → #785 | Absent from both sections. |

These contracts establish inherited prerequisites even when ArithmeticKTheory imports no roadmap module. Adding direct mathematical imports or duplicate constructions here would not repair the description defect. The live Merge order sentence acknowledges other authors but does not enumerate these inherited inputs; correcting that sentence alone therefore does not complete H01.

## Concrete description correction for the worker

Both existing sections should be replaced together, including the assertion that everything else named in the README is a consumer. The following replacement is expressly scoped to the contracts examined here, rather than claiming a complete transitive inventory of every stage of every supplier:

**Dependencies.** The README's Exact supplier contracts specify the mathematical inputs by roadmap and section; Suggested.lean imports no roadmap modules. For the selected contracts discussed here, HomotopySpheres (#1287), Stage 9, item 2 supplies the fourth stable stem used in §7.5; StableHomotopyKTheory (#1227) consumes AlgebraicKTheory (#1142), A0–A1, and TangentialBordism (#942), B4.1–B4.2; KTheoryFiniteLocalFields (#1281) consumes AlgebraicKTheory A2/A4/A5; IntegralIwasawaTheory (#1306) consumes LFunctions (#248), Layers 3–5, and LinearFormsInLogarithms (#451), §8.10; ReductiveGroupsPartII (#785) consumes CFSGBasicProperties (#446), T0–T2, and ChevalleyGroups (#447), C2–C4. These include other authors' open new-roadmap pull requests. This paragraph identifies these selected prerequisite chains, not the complete transitive prerequisites of all supplier stages.

**Merge order.** Direct suppliers precede ArithmeticKTheory, and inherited suppliers precede their consuming roadmaps. For the selected contracts above, the required edges are #1287 → #1418; #1142 → #1227 and #1281; #942 → #1227; #248 → #1306; #451 → #1306; #446 → #785; and #447 → #785. The consumers #1227, #1281, #1306 and #785 also precede #1418. This is a partial order for these contracts; other stages retain their own supplier requirements.

This uses the review's offered alternative of stating the selected stages and prerequisite scope explicitly. An exhaustive whole-roadmap merge declaration needs a complete transitive audit; merely appending the seven names would not certify an exhaustive claim. No description correction has been applied, and the thread should remain unresolved until the worker changes both sections.

## Citation, ownership and pinned-interface checks

The citation resolver found no unresolved cross-roadmap citations. Its run did not inspect external Lean names, so the supplied `VanishingCycles.etaleTateTwists` lead was checked separately: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`, §F.0.3 on main, explicitly plans that supplier target. It is not a missing declaration claimed to exist in the pinned libraries.

The installed revisions agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65` defines S-integers by valuation ≤1 outside S, without finite-S data; lines 88 and 94 identify full and empty S. `Mathlib/NumberTheory/Bernoulli.lean:194` defines the arithmetic Bernoulli sequence, with B₁=−1/2 at line 204; `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64` defines the finite class-group cardinality. The relevant existing source passages were read at sharifi line 3545, line 3547, line 4230, line 4262 and line 4267. No additional source or reopening of a settled source was needed.

No construction, carrier, declaration or supplier contract is added or moved, so no new ownership claim is made. Ownership against open pull requests without supplied files was not checked. This response checks the dependency finding and unchanged acceptance signatures; it does not claim a fresh statement-by-statement audit of the entire eight-layer README or a complete transitive closure audit.

## Elaborated signatures

The scratch module was compared byte-for-byte, apart from its appended directives, with Suggested.lean, and elaborated with `#check @name` for all four declarations; elaboration exited 0 with the three expected admitted-theorem warnings. Comparison with README §§1.1 and 7.2 found no missing binder: all three S-integer declarations retain R, its commutative-ring and Dedekind-domain instances, arbitrary S, F, its field, algebra and fraction-field instances; the criterion also retains M and the torsion theorem its class-group hypothesis. The Bernoulli theorem retains primality, oddness, class-number nondivisibility and k≥1. Nothing changed.

## Adversarial mathematics pass

No mathematical statement was added or changed. The following focused pass recomputes the four acceptance declarations and their convention witnesses; the Bernoulli values use exact rational arithmetic.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| sUnitSubmonoid | R=ℤ, S empty, {(2)}, or all primes; R=𝔽₂ | Empty S gives {−1,1}; for {(2)}, 2 is a unit and 3 is not; full S gives all nonzero integers. Over 𝔽₂, the monoid is {1}. In ℤ[1/2], 3/4 is integral but its inverse 4/3 is not. | Allowed support is S; integrality alone does not give membership. | None. |
| integer_isLocalization_iff | R=ℤ, S={(2)}, M generated by 2, by 1, by 2 and 3, or containing 0 | Powers of 2 give ℤ[1/2] and both conditions true. M={1} gives ℤ and fails to meet (2). Inverting 2 and 3 gives ℤ[1/6], but 3 is not a unit in ℤ[1/2]. If 0∈M, localization is the zero ring and the unit condition fails. | Each necessary condition independently excludes an incorrect localization. | None. |
| integer_isLocalization_iff at empty and infinite S | R=ℤ, S empty or all primes; R=𝔽₂ | At empty S, M={±1} gives ℤ on both sides. For all primes, nonzero integer denominators give ℚ and meet every (p) at p. For 𝔽₂, M={1} gives 𝔽₂ and an empty prime-meeting condition. | Neither finite S nor a nonfield hypothesis is required. | None. |
| integer_isLocalization_of_torsion_classGroup | Cl(ℤ)=0; P=(2,1+s), s²=−5 | Over ℤ, empty and full S give ℤ and ℚ. P² has generators 4, 2+2s and −4+2s, all in (2), and their combination (2+2s)−(−4+2s)−4=2 gives P²=(2). The norm equation a²+5b²=2 has no integral solution: b=0 requires a²=2 and |b|≥1 gives norm≥5. | A nonprincipal prime has a positive principal power supplying a denominator. | None. |
| regularPrime_dividedBernoulli_num and its even-index convention | (p,k)=(3,1),(3,3),(5,5),(5,7),(7,7) | B₂=1/6, B₆/3=1/126, B₁₀/5=1/66, and B₁₄/7=1/6. Every numerator has residue 1 modulo its p; the first two denominators have residue 0 modulo 3. B₁=−1/2. | Divisibility of k is permitted; numerator nondivisibility does not assert p-integrality on the exceptional branch. | None. |
| regularPrime_dividedBernoulli_num beyond restricted congruence bounds and excluded controls | (p,k)=(5,63),(37,16), and k=0 | For B₁₂₆/63 the reduced numerator and denominator both have residue 4 modulo 5, giving value 1; B₁₂₆/126 and B₂/2 both have residue 3. B₃₂/16=−7709321041217/8160 has numerator residue 0 modulo 37, with 7709321041217=37·208360028141. Totalized B₀/0 has numerator 0. | The large-index witness agrees; the irregular-prime and zero-index controls explain the excluded cases. | None. |

## Validation

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0, with exactly three `declaration uses sorry` warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, `:53` and `:66`:

```text
Build completed successfully (8976 jobs).
```

The prescribed dependency-direction check with `--movable` exited 0 and emitted exactly:

```text
depcheck: 41 roadmaps, 410 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The full gate against `origin/main` exited 0 with a clean worktree:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The passing file checks do not resolve the outstanding description correction.
