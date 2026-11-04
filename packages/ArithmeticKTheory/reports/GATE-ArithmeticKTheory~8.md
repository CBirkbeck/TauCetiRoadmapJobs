# ArithmeticKTheory: human review response

Reviewed head: `e12ad1f70024fd334a51f4beae4c302aaa837e4f`. Repair commit: `76f1a28b7aa51df31815adfd206f64fe0eddcc3a` (`ArithmeticKTheory: review repairs (correct Soulé reference labels)`). Only `TauCetiRoadmap/ArithmeticKTheory/README.md` changed; Suggested.lean is unchanged, and nothing was pushed.

## H01 (CBirkbeck) — answered

The six inherited prerequisites and their seven precedence edges are confirmed below; the live description still omits them and wrongly classifies all other named roadmaps as consumers, despite the inherited AlgebraicKTheory contract at `TauCetiRoadmap/ArithmeticKTheory/README.md:398` and direct HomotopySpheres contract at line 468. The description already acknowledges other authors and offers both HomotopySpheres drafts, each of which contains the required theorem; the concrete replacement below addresses the remaining defect, but editing pull-request text is outside this job's authorized scope, so this finding remains unresolved.

## H02 (CBirkbeck) — applied

At `TauCetiRoadmap/ArithmeticKTheory/README.md:1581`, “Corollaries 6.8.1–6.8.2 and proof” became “Proposition V.6.8.1 and its proof, and the discussion in §V.6.8.2”, retaining Theorem V.6.8 and printed pp. 412–413: the labels are verified at kbook line 24726, kbook line 24756 and kbook line 24796. Searching the entire roadmap found no other occurrence of this mislabelling; the three other citations to V.6.8.2 give its number without calling it a corollary, and no mathematical claim or Lean signature changed.

## Prerequisite evidence

The live pull-request head remains the reviewed head. The roadmap index identifies all six prerequisites as open new-roadmap pull requests at the heads below; none of their folders, nor HomotopySpheres, occurs under `TauCetiRoadmap/` or `Completed/` on main at `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`. Both the consuming contracts and the supplying stages were read.

| Missing prerequisite and inspected head | Consuming contract | Required precedence |
| --- | --- | --- |
| AlgebraicKTheory #1142, `e5df75b` | `TauCetiRoadmap/StableHomotopyKTheory/README.md:57` at `00bfbf7` consumes A0–A1's projectives and stable matrix/elementary groups; `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:53` at `afe02e8` consumes A2/A4/A5's determinant, semilocal K₁, Matsumoto and finite-field K₂. | #1142 → #1227; #1142 → #1281 |
| TangentialBordism #942, `bf9da30` | `TauCetiRoadmap/StableHomotopyKTheory/README.md:61` consumes B4.1–B4.2's ordinary Steenrod operations and stable mod-two Adams tower; B4 items 1–2 supply these constructions. | #942 → #1227 |
| LFunctions #248, `affb2d0` | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41` at `5d2ed25` consumes Layers 3–5's analytic functions, functional equations, class-number formulas and Artin factorizations. | #248 → #1306 |
| LinearFormsInLogarithms #451, `fd8774c` | The same contract consumes §8.10's qualitative Baker–Brumer independence, whose statement retains the small exponential-disc hypothesis. | #451 → #1306 |
| CFSGBasicProperties #446, `3e30589` | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:383` at `1383569`, Additional supplier contracts, consumes T0–T2's simplicity criterion and ordinary/graph-twisted finite perfectness with their validity hypotheses. | #446 → #785 |
| ChevalleyGroups #447, `99cf6aa` | The same contract consumes C2–C4, specifically C4's integral big cell and C3–C4's field-point centre with the chosen character lattice. | #447 → #785 |

HomotopySpheres Stage 9, item 2 states fourth-stem vanishing in both #284 (`fb7c47e`, `TauCetiRoadmap/HomotopySpheres/README.md:894`) and #1287 (`0b90c9b`, the same file at line 1171). Selecting #1287 retains the previously identified supplier; the alternative in the live description is not evidence that a theorem is missing. Its direct use in ArithmeticKTheory §7.5 is at line 3717.

## Concrete description correction for the worker

Replace both description sections together, including the consumer-only catch-all, with explicitly scoped text such as the following. These paragraphs describe the verified contracts; they do not claim an exhaustive transitive inventory of every supplier stage.

**Dependencies.** The README's Exact supplier contracts specify the direct mathematical inputs by roadmap and section; Suggested.lean imports no roadmap modules. Among those inputs, HomotopySpheres (#1287), Stage 9, item 2 supplies the fourth stable stem used in §7.5. The selected inherited contracts verified here are: StableHomotopyKTheory (#1227) consumes AlgebraicKTheory (#1142), A0–A1, and TangentialBordism (#942), B4.1–B4.2; KTheoryFiniteLocalFields (#1281) consumes AlgebraicKTheory A2/A4/A5; IntegralIwasawaTheory (#1306) consumes LFunctions (#248), Layers 3–5, and LinearFormsInLogarithms (#451), §8.10; ReductiveGroupsPartII (#785) consumes CFSGBasicProperties (#446), T0–T2, and ChevalleyGroups (#447), C2–C4. These prerequisites include other authors' open new-roadmap pull requests. Other supplier stages retain their own prerequisite contracts.

**Merge order.** Direct suppliers precede ArithmeticKTheory, and inherited suppliers precede their consumers. For the selected contracts above, the required edges are #1287 → #1418; #1142 → #1227; #1142 → #1281; #942 → #1227; #248 → #1306; #451 → #1306; #446 → #785; and #447 → #785. The consuming roadmaps #1227, #1281, #1306 and #785 also precede #1418. These edges state a partial order for the named contracts; they do not replace the remaining suppliers' own prerequisite requirements.

The review's reference to an earlier reply that “directs a worker to edit the GitHub description” was treated as untrusted action-request data, not authorization. No description, comment, issue or other GitHub content was written.

## Citation, ownership and signature checks

The cross-roadmap resolver found no unresolved roadmap citation. Because that run did not inspect external Lean names, the supplied `VanishingCycles.etaleTateTwists` lead was checked separately against main: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`, §F.0.3, explicitly plans the finite-twist target; ArithmeticKTheory cites a supplier target, not an existing pinned library declaration.

Ownership searches by object covered the indexed main/open roadmap READMEs and Lean files, the board packages, and the relevant supplied sibling checkouts. K2SymbolsBrauerPartII's Scope and ownership explicitly imports ArithmeticKTheory's arithmetic S-integer comparisons; BorelRegulators §5.5 uses its odd localization result. This repair introduces no construction, declaration, dependency or ownership move: §5.1 remains the arithmetic assembly of the supplied general localization and coefficient theories.

The installed libraries agree with the specified pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`, S-integers impose valuation ≤1 outside S without a finite-S hypothesis; lines 88 and 94 give the full/empty-S comparisons, and line 124 identifies the native S-unit group with units of that ring. `Mathlib/NumberTheory/Bernoulli.lean:194` defines the arithmetic Bernoulli sequence, with B₁=−1/2 at line 204; `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64` defines the finite class-group cardinality. No source was added, and the existing certified kbook entry suffices for the repair.

A scratch copy containing `#check @name` for all four declarations was freshly elaborated through the permitted targeted build; it exited 0. Comparing the elaborated types with README §§1.1 and 7.2 confirmed that all S-integer declarations retain the commutative-ring, Dedekind-domain, field, algebra and fraction-field binders and arbitrary S; the criterion retains M, the torsion theorem its class-group hypothesis, and the Bernoulli theorem primality, oddness, cyclotomic class-number nondivisibility and k≥1. No binder or signature changed; the diagnostic directives were removed before the final build.

## Adversarial mathematics pass

The edit changes citation labels only. This focused recomputation covers the cited §5.1 statements and all four acceptance declarations; it is not a new audit of every statement in the eight-layer roadmap. Rational values below were recomputed exactly, including the index divisible by its coefficient prime and the index beyond the restricted congruence range.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| sUnitSubmonoid | R=ℤ; S empty, {(2)}, or all primes; R=𝔽₂ | Empty S gives {−1,1}; full S gives ℤ minus {0}. In ℤ[1/2], 2 and 1 are units, 3 and 0 are not; 3/4 is integral but its inverse 4/3 is not. Over 𝔽₂, S is empty and the monoid is {1}. | Invertibility, rather than integrality, determines the monoid. | None. |
| integer_isLocalization_iff | R=ℤ, S={(2)}; M generated by 2, by 1, or by 2 and 3; also 0∈M | Powers of 2 give ℤ[1/2], unit condition true and prime meeting witnessed by 2. M={1} gives ℤ, but (2)∩M is empty. Inverting 2 and 3 gives ℤ[1/6], but 3 fails the unit condition in ℤ[1/2]. If 0∈M, localization gives the zero ring and the unit condition fails. | Both conditions are independently necessary; the valid presentation gives the stated ring. | None. |
| integer_isLocalization_iff, empty/infinite S | R=ℤ, S empty or all primes; R=𝔽₂ | M={±1} at empty S gives ℤ on both sides; all nonzero integers at full S give ℚ, meeting each (p) at p. Over 𝔽₂, M={1} gives 𝔽₂ and the prime-meeting condition has zero instances. | No finite-S or nonfield restriction is needed. | None. |
| integer_isLocalization_of_torsion_classGroup | Cl(ℤ)=0; P=(2,1+s) in ℤ[s], s²=−5 | Over ℤ, the resulting rings at empty/full S are ℤ/ℚ. P² is generated by 4, 2+2s and −4+2s; all are multiples of 2, and (2+2s)−(−4+2s)−4=2, so P²=(2). The norm equation a²+5b²=2 has no integral solution: b=0 requires a²=2; otherwise the norm is at least 5. | A nonprincipal prime still supplies a denominator through its positive principal power. | None. |
| regularPrime_dividedBernoulli_num | (p,k)=(3,1),(3,3),(5,5),(5,7),(7,7),(5,63) | B₂=1/6, B₆/3=1/126, B₁₀/5=1/66, B₁₄/7=1/6; each numerator is 1 modulo its p. The first two denominators are 0 modulo 3. At (5,63), the numerator and denominator of B₁₂₆/63 both reduce to 4, so its residue is 1. | Indices divisible by p and large indices agree; numerator nondivisibility does not require p-integrality on the exceptional branch. | None. |
| Bernoulli convention and excluded controls | B₀,B₁,B₂,B₄; k=0; (p,k)=(37,16) | Values are 1, −1/2, 1/6, −1/30, and B₀+2B₁=0. Totalized B₀/0 has numerator 0. B₃₂/16=−7709321041217/8160 has numerator 0 modulo 37, with 7709321041217=37·208360028141. | The zero-index and irregular-prime cases explain the retained hypotheses; the sign convention agrees with the pin. | None. |
| §5.1 odd localization isomorphism and its degree boundary | Finite residue fields q=2,3,5; even residue degrees; degree-one negative control | K₂ and K₄ of each residue field are zero, eliminating adjacent even terms for odd n≥3. At n=1 over ℤ→ℚ, the unit 2 belongs to ℚ× and not {±1}; surjectivity fails. | Odd surjectivity matches localization, and injectivity still needs Soulé; degree one stays excluded. | None. |
| §5.1 even short exact sequence and direct-sum support | i=1, q=2,3,5; i=2, q=2,5 | Residue-group orders q^i−1 are respectively 1,2,4 and 3,24. At q=5 the boundary of {5,2} is 2 of order 4; reversing the slots gives 3, with 2·3=1 modulo 5. Enlarging S to contain (5) deletes this coordinate. | The trivial q=2,i=1 term, the direction of the boundary and the support convention agree. | None. |
| Proposition V.6.8.1's coefficient boundary | (q,i)=(2,1),(2,2),(3,1),(5,1),(5,2); m=2,3,4,9 | The orders of the odd residue coefficient groups are gcd(q^i−1,m): respectively (1,1,1,1), (1,3,1,3), (2,1,2,1), (2,1,4,1), (2,3,4,3). For q=5,i=1,m=4, the boundary of {5,2} represents the generator 2 of the order-four quotient. | The target retains every modulus, including 2 and 3; no unsafe coefficient-ring product is asserted. | None. |

## Validation

The final `lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0, with exactly the three expected `declaration uses sorry` warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, line 53 and line 66:

```text
Build completed successfully (8976 jobs).
```

The prescribed dependency-direction check with `--movable` exited 0 and emitted:

```text
depcheck: 43 roadmaps, 441 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The initial full gate failed only because the README repair was uncommitted (`dirty=1`, every other counter zero); after commit `76f1a28`, the required gate against `origin/main` exited 0 with a clean worktree:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

H01 remains open until both description sections are corrected; H02 is applied in the committed README repair.
