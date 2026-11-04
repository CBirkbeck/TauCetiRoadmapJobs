# ArithmeticKTheory: human review response

Reviewed head: `8d6efc7bc7947bd9b71f6dc0cb3aedd305cd76d6`. Repair commit: `e12ad1f` (`ArithmeticKTheory: review repairs (finite coefficients in the real comparison)`). Only `TauCetiRoadmap/ArithmeticKTheory/README.md` changed; `Suggested.lean` is unchanged. No push or GitHub write was made.

## H01 (CBirkbeck) — answered

HomotopySpheres Stage 9, item 2 supplies π₄ˢ=0; the AlgebraicKTheory and TangentialBordism contracts of StableHomotopyKTheory, the foundational contract of KTheoryFiniteLocalFields, and the LFunctions and LinearFormsInLogarithms contracts of IntegralIwasawaTheory confirm all five prerequisite omissions. Both description declarations still need the precedence corrections below and replacement of the assertion that no other author's open pull request is required; this job prohibits editing pull-request text, so that correction remains outstanding for the worker.

## H02 (CBirkbeck) — applied

At `TauCetiRoadmap/ArithmeticKTheory/README.md:1807`, comparison with integral ko → the explicit map K(k) ∧ S/m → ko ∧ S/m, with matching complexification ko ∧ S/m → ku ∧ S/m, as required by kbook line 28767 (VI.3.1(c), printed p. 475). The checks at lines 1824 and 1831 now compute π₀=ℤ/m on both sides and complexification modulo two as the identity in degree zero and zero in degree four, retaining the integral KO/KU normalization and the degree-two ℤ/4 extension.

## Prerequisite evidence and concrete description correction

The description read at head `8d6efc7` still claims a transitive dependency account, omits all five suppliers, and ends its merge-order declaration with the assertion disputed in H01. The registry identifies all five as open new-roadmap pull requests by other authors; none of their roadmap directories exists under `TauCetiRoadmap/` on main at `82e5289`.

| Supplier | Verified mathematical contract | Required precedence |
| --- | --- | --- |
| HomotopySpheres #1287, kim-em, `0b90c9b` | Stage 9, item 2 proves π₄ˢ=0, consumed by ArithmeticKTheory §7.5; the selected supplier remains #1287. | #1287 before #1418 |
| AlgebraicKTheory #1142, kim-em, `e5df75b` | StableHomotopyKTheory's “From AlgebraicKTheory” contract at `00bfbf7` consumes A0–A1; KTheoryFiniteLocalFields' foundational contract at `afe02e8` consumes A2/A4/A5 for determinant, semilocal K₁ and field K₂. | #1142 before #1227 and #1281 |
| TangentialBordism #942, kim-em, `bf9da30` | StableHomotopyKTheory's “From TangentialBordism” contract at `00bfbf7` consumes B4.1–B4.2 for Steenrod operations and the mod-two Adams tower. | #942 before #1227 |
| LFunctions #248, roed-math, `affb2d0` | IntegralIwasawaTheory's supplier contract at `5d2ed25` consumes Layers 3–5 for continued L-functions, functional equations and class-number identities. | #248 before #1306 |
| LinearFormsInLogarithms #451, mkaratarakis, `fd8774c` | The same IntegralIwasawaTheory contract consumes §8.10's small-disc Baker–Brumer theorem; §4.2 passes to algebraic-number logarithms. | #451 before #1306 |

For both declarations, retain the existing prerequisites and add the five suppliers with these precedence relations. Suitable replacement scope wording is: “The README specifies the mathematical inputs by roadmap and section; the merge prerequisites also include the inherited suppliers and precedence relations listed here.” Replace the other-author assertion with: “These prerequisites include other authors' open roadmap pull requests: #1287, #1142, #942, #248 and #451, each preceding its consumers.” This wording avoids claiming an exhaustive transitive closure, which this focused response has not certified. No additional direct mathematical imports or duplicate targets are needed in the README.

## Source, ownership and citation checks

The finite-coefficient convention is spectrum smash with the Moore spectrum, not tensoring the integral homotopy groups: kbook line 16275 (IV.2.3.1, p. 279) and kbook line 16320 (IV.2.5, p. 280). The real comparison is kbook line 28762 (VI.3.1, p. 475), with the same finite modulus explicitly present at kbook line 28767; the nonsplit degree-two group is independently specified at kbook line 16329 (IV.2.5.1, p. 280). The integral Bott table and complexification factor are kbook line 4722 and kbook line 4726 (II.3.1.1–3.1.2, pp. 83–84). The existing certified `kbook` manifest entry covers this source; no new source or manifest change is needed.

Ownership was searched by real-closed-field comparison, real topological K-theory, Moore coefficients and ko/ku objects across main, the board packages, the supplied sibling roadmap heads and the open-roadmap index. GeneralizedCohomology G5.4 on main constructs the topological spectra and connective covers and fixes c(a)=2u²; StableHomotopyKTheory §§7.1–7.7 supplies the Moore coefficients and Bocksteins. KTheoryFiniteLocalFields §6.5a at `afe02e8` explicitly excludes real closed fields at ℓ=2 from its finite-cohomological-dimension comparison, so the retained algebraic-to-real comparison belongs to ArithmeticKTheory §5.4 on those supplied carriers. No carrier was introduced or moved, no later roadmap became a supplier, and no Lean declaration was added. Ownership against open pull requests without supplied files was not checked beyond the registry search and the specifically cited supplier contracts.

The fresh citation resolution finds no unresolved cross-roadmap citation. The supplied warning about `VanishingCycles.etaleTateTwists` is resolved by `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`, §F.0.3, on main: it is a planned supplier target, not a claim of an implemented pinned declaration. Relevant declarations were inspected at Mathlib `6b7abb3` and Tau Ceti `a91d3aa`; the real comparison still needs the higher K-spectrum, ko/ku and Moore-smash carriers and has no replacement statement in `Suggested.lean`.

## Adversarial mathematics pass

This pass covers every changed mathematical assertion and coefficient convention, the adjacent extension and connective-cover checks, and all four acceptance declarations. It does not claim a fresh audit of every unchanged theorem in the roadmap. In the table, ko/m and ku/m mean smash with S/m.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Finite coefficients in realKTheoryComparison, including degree zero | k=ℝ, m=2 and 3, n=0 | K₀(ℝ;ℤ/2)=ℤ/2=π₀(ko/2); K₀(ℝ;ℤ/3)=ℤ/3=π₀(ko/3). Integral π₀ko=ℤ in both cases. | The finite groups agree; the integral target fails. | Both source and target now display S/m; a degree-zero negative control was added. |
| Nonnegative comparison and the retained coefficient table | k=ℝ, n=0,…,7, m=2 and 3 | On both sides, m=2 gives (ℤ/2,ℤ/2,ℤ/4,ℤ/2,ℤ/2,0,0,0), of orders (2,2,4,2,2,1,1,1). For m=3 both sides give (ℤ/3,0,0,0,ℤ/3,0,0,0). | Odd coefficients kill the integral 2-torsion; mod-two coefficients retain the extra torsion and extension. | The existing table is retained with an explicit finite target. |
| Spectrum coefficients and Bockstein compatibility | k=ℝ, m=2, degrees two and three | At n=2, both coefficient sequences are 0→ℤ/2→ℤ/4→ℤ/2→0: a generator b has 2b≠0, 4b=0 and boundary the nonzero order-two class. At n=3 the boundary ℤ/2→ℤ/2 is an isomorphism. Merely tensoring π₃ko=0 would instead give 0. | The extension and the degree −1 Bockstein agree; a split ℤ/2⊕ℤ/2 model fails the order-four test. | No new splitting or unsafe-modulus product was asserted. |
| Real-closed hypothesis | k=ℝ versus k=ℂ, n=1, m=2 | ℝ×/(ℝ×)²={1,−1} gives K₁(ℝ;ℤ/2)=ℤ/2=π₁(ko/2). Every nonzero complex number is a square, giving K₁(ℂ;ℤ/2)=0≠π₁(ko/2). | The real hypothesis excludes an explicit counterexample. | The hypothesis is retained without an Archimedean restriction. |
| Modulus convention and excluded zero modulus | m=1 and m=0 over ℝ | S/1=0, so both coefficient spectra at m=1 have all groups zero. At m=0, K(ℝ)/0=K(ℝ)∨ΣK(ℝ) has π₁=ℝ×⊕ℤ, whereas ko/0 has π₁=ℤ/2⊕ℤ. | The zero-modulus extension would make the comparison false. | The standing m≥2 range is retained. |
| Finite-coefficient complexification and its integral normalization | Degrees zero and four, m=2,3,4 | Degree zero sends [0,1]→[0,1], [0,1,2]→[0,1,2], and [0,1,2,3]→[0,1,2,3]. Degree four sends those lists to [0,0], [0,2,1], and [0,2,0,2], respectively, by reducing the integral map x↦2x. | The same coefficient triangles give identity in degree zero and the factor two in degree four; a degree-four identity fails at m=2 and 4. | Complexification now displays S/m on both sides; the mod-two witness was added. |
| Connective rather than periodic negative-degree convention | n=−4, m=2 | π₋₄(ko/2)=0 and K₋₄(ℝ;ℤ/2)=0 for connective K; periodic π₋₄(KO/2)=ℤ/2 by eight-periodicity and KO₃=0. | Substituting periodic KO would violate connectivity. | The distinction between ko and KO is retained. |
| sUnitSubmonoid | R=ℤ, S empty, {(2)} or all primes; R=𝔽₂ | Empty S gives {−1,1}; at {(2)}, 2 is a unit in ℤ[1/2] and 3 is not; all primes give ℤ excluding 0. For 𝔽₂ the monoid is {1}; in every case 1 belongs and 0 does not. | The inverse-image definition has the intended support and excludes the zero element. | Unchanged. |
| integer_isLocalization_iff, both directions and both conditions | R=ℤ, S={(2)}, M generated by 2, M={1}, or M generated by 2 and 3; all primes with M=nonzero integers | Powers of 2 give ℤ[1/2], with both conditions true. M={1} localizes to ℤ and misses (2), although its unit condition is true. Powers of 2 and 3 meet (2), but 3 is not a unit in ℤ[1/2] and the localization is ℤ[1/6]. All primes with nonzero denominators give ℚ and meet (p) at p. | The two negative cases separately require the prime-meeting and unit conditions; the infinite-set case also agrees. | Unchanged. |
| integer_isLocalization_of_torsion_classGroup | Cl(ℤ)=0, S empty or all primes; P=(2,1+√−5) in ℤ[√−5] | The ℤ cases give localizations ℤ and ℚ. In the quadratic case, P is nonprincipal but P²=(2); the class has order two and 2 has prime support {P}, providing a valid denominator. | Torsion suffices without requiring each prime to be principal. | Unchanged. |
| regularPrime_dividedBernoulli_num | (p,k)=(3,1),(3,3),(5,5),(7,7); excluded controls (37,16) and k=0 | B₂/1=1/6, B₆/3=1/126, B₁₀/5=1/66 and B₁₄/7=1/6, with reduced numerator 1 modulo p in each case. B₃₂/16=−7709321041217/8160 has numerator 0 modulo 37. Total division at k=0 gives numerator 0. | The p-divisible indices pass; regularity and k≥1 exclude the failures. | Unchanged. |

## Elaborated signatures

Elaborated one scratch file containing the exact unchanged `Suggested.lean` declarations and `#check @name` for all four, then compared every resulting type with README §§1.1 and 7.2. The definition and both localization theorems retain R, its commutative-ring and Dedekind-domain instances, S, the field F, its R-algebra and fraction-field instances; the criterion retains M and the torsion theorem retains its class-group torsion hypothesis. The Bernoulli theorem retains p, primality, oddness, cyclotomic-class-number nondivisibility, k and k≥1. No binder or signature changed; the scratch elaboration exited 0 with the same three admitted-theorem warnings.

At the Mathlib pin, `Set.integer` in `Mathlib/RingTheory/DedekindDomain/SInteger.lean:65` is the native subalgebra defined by valuation ≤1 outside S, with no finite-S restriction; the empty and full-set comparisons are at lines 94 and 88. `bernoulli` in `Mathlib/NumberTheory/Bernoulli.lean:194` uses the parity-adjusted primed sequence, with B₁=−1/2 at line 204. `NumberField.classNumber` in `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64` is the finite cardinality of the native class group. These definitions agree with the retained acceptance statements.

## Validation

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0 with exactly three `declaration uses sorry` warnings at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, `:53` and `:66`:

```text
Build completed successfully (8976 jobs).
```

The required dependency-direction check with `--movable` exited 0 and emitted exactly:

```text
depcheck: 33 roadmaps, 310 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This concerns roadmap dependencies and does not certify the still-uncorrected PR description.

The initial full gate found only the uncommitted README (`dirty=1`); after the required commit, the full gate against `origin/main` exited 0 with a clean worktree:

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
