# Human-review response: ArithmeticKTheory

The six inherited-supplier omissions and the prerequisite classification error are confirmed in the live description at head `76f1a28`; their correction remains outstanding in the PR description, which this job cannot edit. No mathematical repair is warranted in `TauCetiRoadmap/ArithmeticKTheory/README.md` or `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean`, so both files remain unchanged and no commit was created.

## H01 (CBirkbeck) — answered

AlgebraicKTheory A0–A1 at `e5df75b` supplies StableHomotopyKTheory's projective/stable-linear inputs (`TauCetiRoadmap/StableHomotopyKTheory/README.md:55`, head `00bfbf7`), while A2/A4/A5 supplies KTheoryFiniteLocalFields' determinant, semilocal K₁ and field K₂ inputs (`TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:53`, head `afe02e8`), already acknowledged in `TauCetiRoadmap/ArithmeticKTheory/README.md:398`. The description needs AlgebraicKTheory #1142 and both precedence relations #1142 → #1227 and #1142 → #1281; these inherited constructions retain their existing owner.

## H02 (CBirkbeck) — answered

TangentialBordism B4.1–B4.2 at `bf9da30` supplies the mod-two operations and bounded-below finite-type Adams convergence expressly consumed at `TauCetiRoadmap/StableHomotopyKTheory/README.md:59` (head `00bfbf7`), and its B4 items 1–2 construct those inputs. The description needs TangentialBordism #942 and #942 → #1227, without adding a direct ArithmeticKTheory construction or supplier contract.

## H03 (CBirkbeck) — answered

LFunctions Layers 3–5 at `affb2d0` supplies the continued Dedekind, Dirichlet and finite-order Hecke functions, functional equations, class-number identities and factorizations consumed at `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41` (head `5d2ed25`). The description needs LFunctions #248 and #248 → #1306; the analytic constructions remain in LFunctions.

## H04 (CBirkbeck) — answered

LinearFormsInLogarithms §8.10 at `fd8774c` supplies precisely the qualitative Baker–Brumer statement consumed at `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41` (head `5d2ed25`), retaining the small exponential disc, algebraic exponentials and rational linear independence. The description needs LinearFormsInLogarithms #451 and #451 → #1306, with no new transcendence target here.

## H05 (CBirkbeck) — answered

CFSGBasicProperties T0–T2 at `3e30589` supplies the perfectness and nontrivial central-quotient inputs explicitly required by ReductiveGroupsPartII's Additional supplier contracts (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`, head `1383569`), including the validity restrictions on ordinary and graph-twisted finite groups. The description needs CFSGBasicProperties #446 and #446 → #785; no simplicity or perfectness theory is reassigned to ArithmeticKTheory.

## H06 (CBirkbeck) — answered

ChevalleyGroups C2–C4 at `99cf6aa` supplies the integral big cell and field-point centre expressly consumed by the same ReductiveGroupsPartII contract (`TauCetiRoadmap/ReductiveGroupsPartII/README.md:383`, head `1383569`), distinguishing arbitrary Chevalley data from the simply connected full-weight datum. The description needs ChevalleyGroups #447 and #447 → #785, preserving the existing merge prerequisites.

## H07 (CBirkbeck) — answered

AlgebraicKTheory is an inherited prerequisite at `TauCetiRoadmap/ArithmeticKTheory/README.md:398`, while HomotopySpheres is a direct supplier at line 466 and in §7.5's Needs at line 3768: Stage 9, item 2 states π₄ˢ = 0 in both inspected drafts (`fb7c47e` and `0b90c9b`). Replace the consumer-only sentence with: “Direct mathematical prerequisites are the stages listed under Exact supplier contracts in the README, including HomotopySpheres Stage 9, item 2; the merge plan also includes inherited prerequisites of those suppliers, and downstream consumers are identified in Downstream consumers.”

## H08 (CBirkbeck) — answered

The embedded imperative “The worker must add AlgebraicKTheory #1142 to the description” in issuecomment-6388660032 is an external action request, not authorization to change GitHub state. Its dependency claim was independently verified in H01; no description edit, comment, push or other GitHub mutation was performed, and the description correction is not reported as applied.

**Evidence and scope.** The six supplier heads above match the supplied open-roadmap index; all six are new-roadmap PRs and none of their folders occurs in either `TauCetiRoadmap/` or `Completed/` on inspected main `b41e47b`. All six PR numbers remain absent from both the live Dependencies paragraph and merge block at head `76f1a28`; the merge block already retains the HomotopySpheres alternatives and acknowledges other authors, so those closed sub-findings are not reopened. The seven precedence relations above are additions to the existing account, not a replacement total order or a claim to have audited every transitive dependency of every supplier.

**Ownership and citations.** Object-based searches across main and the supplied open-roadmap heads, and inspection of the board package inventory, leave all reviewed constructions with the named owners; no object moved and no direct supplier edge or Lean declaration was added. The roadmap citation resolver reports no unresolved cross-roadmap citation; its native-library scan was unavailable, so pinned declarations were inspected separately where relevant. The supplied `VanishingCycles.etaleTateTwists` lead is a planned supplier target at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`, §F.0.3 on main, rather than a claim that it is implemented at the pins. The two main-roadmap examples read for repository form were DerivedModuleAlgebra and ClassifyingSpaces. This response audits the description findings and the four unchanged Lean declarations; it does not claim a fresh mathematical audit of all eight README layers.

**Pinned signatures.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching both manifests. I compared every supplied mechanically elaborated `#check @name` signature with README §§1.1 and 7.2, and verified that the supplied scratch checking module consists of the byte-identical unchanged `Suggested.lean` followed by all four checks: the definition and both localization theorems retain the Dedekind domain, fraction field and algebra binders; the torsion theorem retains its class-group hypothesis; the Bernoulli theorem retains primality, oddness, full cyclotomic class-number nondivisibility and k ≥ 1. No binder or signature changed.

**Adversarial pass.** No statement, definition or convention was added or changed. The following computed witnesses recheck all four existing declarations; numerical cases test their hypotheses and conclusions without treating admitted proofs as established mathematics.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `sUnitSubmonoid`, Lean line 42; README §1.1 | R = ℤ, S = ∅ and S = {(2)}; R = F a field | For S = ∅, membership of 0, 1, −1, 2 is false, true, true, false, equal to unit membership in ℤ; for S = {(2)}, 8·(1/8) = 1, whereas 3 has valuation 1 at the uninverted prime (3), so 8 belongs and 3 does not. For a field, Spec¹(F) = ∅ and the monoid is F without 0. | Agreement; the zero-map and reversed-support models fail these values. | None. |
| `integer_isLocalization_iff`, Lean line 47; README §1.1 | R = ℤ, S = {(2)}, M = powers of 2, {1}, powers of 3; S = ∅ with M = {1}; M containing 0 | Powers of 2: left true, right true, using 2 ∈ (2). M = {1}: left false since 1/2 is absent, right false since 1 ∉ (2). Powers of 3: left false since ℤ[1/3] differs from ℤ[1/2], right false since 3 is not a unit and no 3ⁿ is in (2). Empty S and M = {1}: true ↔ true. If 0 ∈ M: false ↔ false since 0 cannot become a unit in the embedded nonzero ring. | Both directions distinguish valid denominators, insufficient denominators and wrong support. | None. |
| `integer_isLocalization_of_torsion_classGroup`, Lean line 53; README §1.1 | ℤ with empty, full and infinite odd-prime S; R = ℤ[√−5], 𝔭 = (2, 1+√−5) | The first two denominator monoids are {±1} and ℤ without 0; for odd-prime S, each odd q meets (q) while 2 is excluded, with no finite-S hypothesis. With a = √−5, 𝔭² has generators 4, 2+2a, −4+2a, all in (2), and 2 = 2·4 − (2+2a) + (−4+2a), so 𝔭² = (2); 2 supplies the denominator despite 𝔭 being nonprincipal. | Torsion, rather than principality or finiteness of S, is the relevant input. | None. |
| `regularPrime_dividedBernoulli_num`, Lean line 66; README §7.2 | (p,k) = (3,1), (5,1), (5,2), (5,3), (5,5), (5,7); (37,16); k = 0 | B₂/1 = 1/6, B₄/2 = −1/60, B₆/3 = 1/126, B₁₀/5 = 1/66, B₁₄/7 = 1/6: every corresponding numerator is prime to 3 or 5, including k divisible by 5 and the exceptional denominator branch. For (37,16), numerator −7709321041217 = −37·208360028141 is divisible by 37, excluded by regularity through the supplied finite criterion. At k = 0 total division gives B₀/0 = 0 with numerator 0, excluded by k ≥ 1. | Agreement; no p-integrality is claimed for exceptional indices, and arbitrary k must retain the unrestricted supplier congruence. | None. |

Mathlib's native `Set.integer` is the subalgebra defined by valuation bounds at primes outside S (`Mathlib/RingTheory/DedekindDomain/SInteger.lean:65`); this definition alone does not assert the new denominator-localization criterion. The all-index Bernoulli inputs remain owned by CyclotomicClassGroupsAndStickelberger §§3.1 and 5.1 at `9c9a49a`; the README's cited smoothed-distribution route is supported by sharifi line 4230, line 4262 and line 4267. No new source or citation is introduced.

**Build outcome.** `lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0, with exactly three warnings that declarations at `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47`, line 53 and line 66 use `sorry`:

```text
Build completed successfully (8976 jobs).
```

**Dependency direction output** (exit 0; no UPWARD, CYCLE or moved line):

```text
depcheck: 47 roadmaps, 528 edges, 0 problem(s)
```

**Gate summary** (exit 0, base `origin/main`):

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
