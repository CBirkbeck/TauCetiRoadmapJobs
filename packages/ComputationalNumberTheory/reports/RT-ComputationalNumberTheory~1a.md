<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/131#issuecomment-6313619707 -->
Red team round 1 pass a (codex) of 6f8b9e0

Verdict: needs_changes

1. **F01** (P3) Computational algorithms are explicitly in scope

   Location: `packages/ComputationalNumberTheory/README.md:27–33`: “prove completeness and termination for the discovery algorithm.”

   Claim: The roadmap plans executable verifiers, discovery procedures and running-time analysis.

   Witness: `README.md:281` specifies repeated powering and the extended Euclidean algorithm; `Suggested.lean:79–88` implements RAM execution. The binding brief excludes computational algorithms.

   Exact repair text: “This roadmap specifies arithmetic objects, certificate predicates and mathematical soundness and existence theorems. Computational algorithms, executable verifiers, implementation costs and termination specifications are outside its scope.” Remove the RAM development and algorithm targets, replacing applicable claims with intrinsic mathematical existence statements.

2. **F02** (P3) Forbidden linter overrides

   Location: `packages/ComputationalNumberTheory/Suggested.lean:32–33`: “set_option linter.unusedVariables false”.

   Claim: File-level options suppress unused-variable and unused-section-variable checks.

   Witness: Both lines are `set_option`; the brief forbids every such command.

   Exact repair text: Delete lines 32–33 and repair unused binders individually.

3. **F03** (P3) Checks are admitted instead of proved

   Location: `packages/ComputationalNumberTheory/Suggested.lean:132–135`: the magnitude-bound `example` ends with `sorry`.

   Claim: The file presents admitted examples as Checks.

   Witness: Additional admitted examples occur at lines 179–181, 244–255, 289–291 and 306–307; `sorry` occurs even inside certificate fields in the last example.

   Exact repair text: There are 34 admitted examples among 59. Prove each retained `example` completely. Where a boundary case cannot yet be proved, replace it by a named theorem target with a README entry and locator; retain at most two proved examples per kept definition.

4. **F04** (P1) Class and unit theory is replanned despite an existing owner

   Location: `packages/ComputationalNumberTheory/README.md:989–1035`, targets 2.10–2.15; `Suggested.lean:721–778`.

   Claim: This roadmap owns relation lattices, relation-index divisibility, Minkowski generation and regulator completeness.

   Witness: Main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:11158` defines the same relation kernel; lines 11461 and 11705 state the relation-index and joint class–unit implications. Its introduction, line 23, explicitly makes ComputationalNumberTheory a consumer.

   Exact repair text: “ClassicalArithmeticCompletion §§5.1–5.3, 5.10–5.11, 5.16 and 5.22 supply the relation-lattice, class-group quotient and class-number–regulator comparisons. This roadmap consumes them.” Remove the duplicate targets and Lean signatures after matching each to that owner's precise hypotheses; retain only genuinely additional certificate adapters. Delete the reverse supplier assertion at lines 1967–1968.

5. **F05** (P1) Named normal-form supplier targets do not exist on main

   Location: `packages/ComputationalNumberTheory/README.md:230–232`: “hermite-normal-form-certificate”.

   Claim: ClassicalArithmeticCompletion CA.3 supplies four named hyphenated targets.

   Witness: Main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:5341,5412,6073,6131` instead specifies `IntMatrix.IsSmithDecomposition`, `IntMatrix.IsHermiteNormalForm`, `IntMatrix.IsHermiteDecomposition` and §3.27's pivot-index theorem. None of the four cited names occurs there.

   Exact repair text: “ClassicalArithmeticCompletion §§3.3, 3.5, 3.25, 3.27 and 3.48 supply Smith decompositions, column-style upper Hermite forms and decompositions, the pivot-index formula, and Hermite bases of sublattices.” Replace every CA.3 citation by the exact subsection and current declaration consumed, preserving the column convention.

6. **F06** (P3) Supplier pins are stale

   Location: `packages/ComputationalNumberTheory/README.md:164,192`: “pinned at”.

   Claim: The package claims Mathlib `082e2d37…` and Tau Ceti `f7904748…` as its pins.

   Witness: The content `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the read-only cached checkouts match both commits.

   Exact repair text: Replace the two hashes by the manifest hashes above. Reclassify the “after the pinned commit” declarations at lines 76–84 as pinned inputs where they now exist, and give each supplier declaration its module path.

7. **F07** (P3) Cited works have no source manifest

   Location: `packages/ComputationalNumberTheory/README.md:1972–2069`, References.

   Claim: Twenty-two works support the targets, but their legal provenance and locator records are not recorded in the package.

   Witness: The package contains no `sources.toml`; its four original files are README.md, Suggested.lean, metadata.toml and review.json.

   Exact repair text: Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one record per cited work, exact version and locators, cited targets, and the source service's provenance/status fields. All 22 works were legally fetched in this pass; no unavailable-text exception is needed.

8. **F08** (P1) Local descent and saturation duplicate an earlier roadmap

   Location: `packages/ComputationalNumberTheory/README.md:1353–1414,1954–1958`; `Suggested.lean:934–1007`.

   Claim: Local-image certificates, completeness, good-odd-prime images and p-saturation are owned here and supplied to EffectiveDiophantineMethods.

   Witness: `TauCetiRoadmap/EffectiveDiophantineMethods/README.md:3238–3346` at head `076ace7d0c8f02a54de2d33dd3847b7b48bc2bd6` already owns `ED3.LocalImageData`, its span/completeness comparison and the identical good-odd-prime equality; §3.17 owns saturation. EffectiveDiophantineMethods precedes this roadmap in ORDER.txt.

   Exact repair text: “EffectiveDiophantineMethods §§3.2–3.4 and §3.17 supply exact local descent images, their completeness and unramified comparisons, and p-saturation. We use those interfaces with the stated arithmetic inputs.” Remove the duplicate carriers/theorems and reverse downstream attribution. Retain only new adapters or new divisibility results with explicit dependencies on the earlier owner; do not move ownership into the later roadmap.

9. **F09** (P1) AnalyticNumberTheory AN.4 is not a current supplier

   Location: `packages/ComputationalNumberTheory/README.md:115–119,236,863,1145`: “AnalyticNumberTheory AN.4”.

   Claim: A roadmap of that name and section supplies the Hecke/Dedekind comparison used by CN.2.

   Witness: ORDER.txt contains AnalyticNumberTheoryPartI and PartII, not AnalyticNumberTheory. PartI head `23d3de1ceddedf160130057c5e7c58a2173a7468`, §§2.3, 2.5, 2.11–2.12, carries Hecke comparison targets; PartII's Layer 4 concerns sieve theory.

   Exact repair text: “AnalyticNumberTheoryPartI §§2.3, 2.5, 2.11–2.12 supplies the ideal-series and completed Hecke comparisons, together with AutomorphicLFunctionsAndLocalFactors AL.1.” Give the exact declaration and hypotheses for each use. If a rigorous Dedekind-residue enclosure is still required, declare it as a separate owned target or a precise supplier gap; the comparison alone is not an enclosure theorem.

10. **F10** (P2) An easy headline is explicitly omitted

   Location: `packages/ComputationalNumberTheory/Suggested.lean:1267`: “ctTailKernel_alternating_tail”.

   Claim: This theorem is grouped among targets needing unavailable constructions.

   Witness: The kernel already has a real body at line 1120, and the companion nonalternating series theorem is stated at lines 1131–1134. Alternating real sums use only Mathlib carriers.

   Exact repair text: Add the following signature in the ExplicitFormula section, with a docstring citing README 4.16:

   ```lean
   theorem ctTailKernel_alternating_tail (α b : ℝ)
       (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ) :
       |(∑' n : ℕ, (-1 : ℝ) ^ n * ctTailKernel (α * (b + n))) -
         ∑ n ∈ Finset.range N, (-1 : ℝ) ^ n * ctTailKernel (α * (b + n))| ≤
           ctTailKernel (α * (b + N)) := by
     sorry
   ```

   Remove its entry from the omitted-target catalogue. Its N=0 and b=0 cases are valid.

11. **F11** (P2) Algorithm termination is represented by a weaker existence theorem

   Location: `packages/ComputationalNumberTheory/Suggested.lean:700–703`: “The integral-basis algorithm terminates with a certificate”.

   Claim: `integralBasisAlgorithm` expresses the construction and termination of the README algorithm.

   Witness: Its conclusion is only `∃ c : IntegralBasisCertificate K n, b.lattice ≤ c.lattice`; neither an algorithm nor an execution appears. The same mismatch affects `certifiedRationalFactorization` at lines 590–594 and root isolation at lines 1138–1143.

   Exact repair text: Rename these to mathematical existence targets, including `exists_integralBasisCertificate_extending`, `exists_rationalFactorCertificate` and `exists_disjoint_root_certificates`, and change their README contracts and docstrings accordingly. Do not describe existential signatures as executable procedures or termination theorems. This also implements the scope repair in R01.

12. **F12** (P2) The local square theorem is restricted to the base p-adic field

   Location: `packages/ComputationalNumberTheory/Suggested.lean:818–822`: “the case L = ℚ_p”.

   Claim: The Lean name mirrors README 2.22, whose square criterion is for every finite extension L/ℚ_p.

   Witness: The Lean binder is only `u : ℤ_[p]ˣ`. It cannot be applied to the ramified or unramified extension factors of the étale algebra required at README line 1363.

   Exact repair text: State the theorem for a characteristic-zero nonarchimedean local field L, its native valuation ring O, a uniformizer π and u∈Oˣ: `IsSquare (u : L) ↔ ∃ w : O, (u : O) - w^2 ∈ Ideal.span {4*π}`. Use `TauCeti.unitFiltration_le_range_powMonoidHom_two` from pinned `TauCeti/NumberTheory/LocalField/Squares.lean:121` for the deep-unit step; carry all instances explicitly. Make the ℚ_p version a proved specialization Check, including a dyadic extension example.

13. **F13** (P3) Lean names and declaration documentation are not synchronized

   Location: `packages/ComputationalNumberTheory/Suggested.lean:156,240,872`.

   Claim: Every Lean target should have the same named README contract and its own mathematical docstring.

   Witness: `AlgebraicRootCertificate.value_mem_algebraicClosure`, `RabinCertificate.of_irreducible`, and `exists_millerBasis` are absent verbatim from README. README instead names `RabinCertificate.exists_of_irreducible` and `millerBasis`. Twenty-three named declarations lack their own docstring.

   Exact repair text: Use the README's exact target names for theorems, or explicitly record the Lean alias and its full contract in that target. Remove implementation helpers from Suggested.lean when removing algorithms; document every remaining declaration individually. Synchronize `RAMExecution.bitCost`, `RAMExecution.bitCost_le`, `FiniteFieldPresentation.lift/bijective`, and `OrderBasisCertificate.lattice/mul_mem` if retained.

14. **F14** (P3) Statable README Checks have no proved Lean mirror

   Location: `packages/ComputationalNumberTheory/README.md:1477–1481,1499–1503,1559–1563`.

   Claim: The interval and integer-recovery definitions are covered by their listed Checks.

   Witness: Lean only tests intervalMul's lower endpoint on [-1,1], intervalInv at zero, and uniqueInteger on singleton 1. It never tests [-2,3]·[-4,5], either signed reciprocal, or uniqueInteger's three listed intervals.

   Exact repair text: Add proved examples for the listed Checks, bundling related assertions to keep at most two examples per definition: signed interval products and zero, both signed reciprocals and rejection, and uniqueInteger on [3/4,5/4], [0,1], [1/2,1/2]. Apply the same reconciliation to the remaining statable Checks; admitted examples do not discharge it.

15. **F15** (P3) Unrelated numerical examples and too many examples per definition

   Location: `packages/ComputationalNumberTheory/Suggested.lean:767–769,1241–1247`.

   Claim: These examples test the roadmap's joint class–unit and multiplicity definitions.

   Witness: The first proves only `1 ∣ 0 ∧ 0 < 2 ∧ 0 ≠ 1`; the second evaluates a literal matrix and `30-(4+24+36)`. Neither mentions a definition introduced here. IsPSaturated additionally has four examples.

   Exact repair text: Delete the standalone arithmetic examples or replace them by proved examples instantiating retained roadmap definitions. Consolidate IsPSaturated's boundary and torsion checks into at most two examples; include the actual multiplicity lift construction in any retained normalization test.

16. **F16** (P3) README uses Lemma targets

   Location: `packages/ComputationalNumberTheory/README.md:365,1271,1529,1905`: “**Lemma.**”.

   Claim: Four target statements are classified as lemmas.

   Witness: The binding form rule requires theorem, never lemma; the four Lean declarations are already `theorem`.

   Exact repair text: Replace each of the four `**Lemma.**` labels by `**Theorem.**`.

17. **F17** (P1) Root Hensel is cited as polynomial-factor Hensel

   Location: `packages/ComputationalNumberTheory/README.md:805`: “Apply Hensel's lemma … to get monic g, h”.

   Claim: The listed Mathlib input supplies a coprime factorization lift in ℤ_p[X].

   Witness: Pinned `Mathlib/NumberTheory/Padics/Hensel.lean:459` supplies a root in ℤ_p, not factors. `Mathlib/RingTheory/Henselian.lean:49` explicitly lists lifting coprime factors as future work. MilneANT line 5346 states the stronger theorem.

   Exact repair text: “Prove `henselLift` directly by induction on k using degree-bounded Bézout corrections; the correction degrees are strictly below the degrees of g₀ and h₀. This proof does not invoke Mathlib's root-only `hensels_lemma` as a factorization theorem.” Alternatively add a named general coprime-factor Hensel theorem over a complete discrete valuation ring before this specialization, with MilneANT Theorem 7.33 as locator.

18. **F18** (P1) Ore's proof imports unowned φ-polygon theorems

   Location: `packages/ComputationalNumberTheory/README.md:1105`: “Use the product theorem … the polygon factorization theorem and residual factorization theorem.”

   Claim: Those three substantial inputs are available before target 2.20.

   Witness: Targets 2.16–2.19 provide definitions, degrees and endpoint facts only. GMN line 495, line 575 and line 684 state the missing product, polygon-factorization and residual-factorization theorems; ordinary Newton polygons do not supply them.

   Exact repair text: Insert named targets `phiPolygon_mul`, `phiResidual_mul`, `phiPolygon_factorization` and `phiResidual_factorization` before 2.20, with explicit monicity, nonzero-polynomial, residue-irreducibility and local-field hypotheses matching GMN Theorems 1.13, 1.15 and 1.19. State these over finite extensions of ℚ_p as in GMN, with integral-polynomial specializations as Checks. Cite these targets in 2.20's Needs line. No later roadmap is required.

19. **F19** (P3) Elliptic source locators do not support the cited steps

   Location: `packages/ComputationalNumberTheory/README.md:1363,1381`: “§3.3, p.69”; “for the density argument”.

   Claim: Cremona §3.3 supports the real-component criterion, and FPS Lemma 4 supplies the general rational-abscissa density argument.

   Witness: Cremona line 364 concerns integral coordinates of rational torsion; the real-component discussion is at line 1474. FPS line 662 proves two particular generators and contains no general density theorem.

   Exact repair text: Replace the real-component locator by “Cremona §3.6, printed p.93, discussion of the two signs of the discriminant.” Describe FPS §7, Lemma 4 as a concrete local-generator example only. Attribute the general density argument to the owned local-image target after R08, with its local constancy and rational-density inputs named explicitly.

20. **F20** (P3) The full nonordinary weight table has only a partial locator

   Location: `packages/ComputationalNumberTheory/README.md:1307,1335`: “Remark 3.3”; “appendix table C”.

   Claim: These locators identify the detailed nonordinary pairs and the ordinary-companion table.

   Witness: BCG line 453 gives the first primes and gcd-filtered list, not all sixteen weight-prime pairs. CG13 line 522 starts one appendix table; C and N label ordinary-companion and nonordinary entries, not separate tables.

   Exact repair text: For 3.12–3.13 cite “BCG Remark 3.3, p.518, for the filtered primes; CG13 Appendix, Table of results, p.14, N-marked entries, with the companion-weight relation.” For 3.16 replace “appendix table C” by “Appendix, Table of results, p.14, C-marked entries.” Keep the exact finite verification as the proof of the stated exhaustive list.

21. **F21** (P1) Certified special-function remainders have no owned contract

   Location: `packages/ComputationalNumberTheory/README.md:1717`: “The special-function remainder and termination proof are additional construction requirements.”

   Claim: The existing Needs list suffices to produce arbitrarily narrow rigorous enclosures for ψ and ψ′.

   Witness: Pinned `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:72` is a recurrence identity, not a truncation-error estimate. No preceding target states a ψ or ψ′ remainder with its domain, bound and decay; neither cited supplier does so here.

   Exact repair text: Add a named mathematical target before 4.18 giving a finite-sum approximation and explicit remainder bound for ψ and ψ′ on the actual right-half-plane arguments, with the bound tending to zero and every denominator nonzero. Cite a precise legal source for that estimate and add it to 4.18's Needs line. Likewise name the uniform Dirichlet and cusp-form tail bounds consumed by 4.20–4.21; a functional equation alone supplies no quantitative remainder.

22. **F22** (P3) Some Checks merely repeat the specification

   Location: `packages/ComputationalNumberTheory/README.md:1771`: “At precision eight both widths are at most 1/256.”

   Claim: This is a computed-value Check for `cuspLBox`.

   Witness: Substituting P=8 into the defining width bound gives this sentence without evaluating any form or L-value. The surrounding generic rectangle Checks do not evaluate `cuspLBox` either.

   Exact repair text: Replace the width restatement by a specified cusp form, rational argument, rational output bounds and an independently justified exact-value or nonvanishing comparison. Retain the generic rectangle facts only as Checks of `complexBoxSet`. Reconcile these with the zero-form case so `cuspLBox` has three discriminating mathematical Checks. Apply the same rule to definition restatements elsewhere, such as raw RAM syntax and subgroup-closure Checks.

23. **F23** (P3) Suggested.lean contains a prohibited name catalogue

   Location: `packages/ComputationalNumberTheory/Suggested.lean:1250–1270`: “Targets stated only in README.md”.

   Claim: A final module comment inventories omitted target names and process explanations.

   Witness: The block lists 34 names instead of mathematical declarations. The brief expressly excludes catalogues of names from Suggested.lean; the README already carries those targets.

   Exact repair text: Delete this final catalogue. Keep the opening module docstring's statement that Suggested.lean is not exhaustive, and add the easy omitted theorem identified in R10.

## Verified sound

Read all 2,069 README lines and all 1,272 Lean lines. Inventoried 128 bold mathematical targets and 201 Lean declarations: 76 theorems, 49 definitions, 15 structures, 2 inductives and 59 examples. Of those examples, 25 have proof bodies without `sorry`, and 34 are admitted. Read and tested the stated cases in all 71 Checks blocks (221 Check bullets); tests here include direct mathematical substitution and source comparison, not Lean execution. The tables below record the boundary audit for every headline and the ambient context for every declaration.

All 22 cited works were obtained through the legal source service. The source table records 22 grouped locator audits, including the failed attributions R19–R20; each row specifies the actual theorem/page locations read. Thirteen roadmap supplier/ownership contracts were examined, as recorded below. The three explicitly supplied sibling checkouts were searched by object; no supplier citation in this package names QWittVectors, ArithmeticDynamics or ErdosProgressionPowers. ErdosProgressionPowers' `gap:small-conductor-zeros` at `TauCetiRoadmap/ErdosProgressionPowers/README.md:286` is a declared contract and is not a finding.

The mathematical tests found no explicit counterexample to a retained headline theorem under its written hypotheses. In particular, checks confirmed the torsion clause in saturation, the distinction between entrywise and Loewner bounds, the reciprocal treatment of negative intervals, the zero-centred p-adic valuation convention, and the multiplicity lift tᵢ/mᵢ. This does not certify the missing proof inputs in R17–R18 and R21.

Independent integer q-series calculations gave:

- The coefficient at 107 of ΔE₄²E₆ is 35830422465487817813321292, congruent to 106 modulo 107.
- In the normalized weight-38 basis, T₇₉ modulo 79 is [[3,17],[25,10]], with determinant −395, hence zero modulo 79.
- All sixteen nonordinary pairs in target 3.13 and its eight gcd-filtered pairs agree with exhaustive exact coefficient/matrix calculations over the stated finite range.

The pins were checked against the content manifest and the cached repositories' commit IDs. No package source was modified and no Lean command was run. The original PR diff contains exactly README.md, Suggested.lean, metadata.toml and review.json inside the package: 4 files, 3,350 insertions. The only new repository path from this pass is this report. Imports have one `import Mathlib` and six individual Tau Ceti modules; no pending-roadmap import, sorry-bodied data declaration or `True` placeholder was found.

The required dependency command returned exit status 1 and exactly:

```text
NOT IN ORDER: ComputationalNumberTheory (insert it after its last supplier)
depcheck: 4 roadmaps, 25 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Absence from ORDER.txt is not raised as a defect under the brief's explicit rule. The gate's four-roadmap coverage does not validate the nonexistent supplier name in R09 or the reverse ownership claims in R04/R08; those were checked manually. No move from a later roadmap into this one is needed for the recorded repairs.

Source locator audit (line references identify cached legal extractions, not copied passages):

| Source | Locators read | Witness lines and result |
|---|---|---|
| Shoup | §§3.2,3.6; Theorem10.3; Theorems19.10,19.14; Exercise20.2(a); Theorem20.5; Figure21.1 and Lemmas21.6–21.11 | Shoup line 2304, line 2962, line 12442, line 20086, line 20193, line 20535, line 20706, line 21541, line 21678: model, finite-field and primality statements agree. |
| Stein | Algorithm2.18; Lemma2.20; Remark2.21; Proposition2.31; Theorem9.18 | Stein line 1096, line 1134, line 1162, line 1324, line 7638: Miller basis, Hecke recurrence and Sturm bound agree. |
| Arb | §§2.3,3.1,5,5.3 | Arb line 306, line 484, line 814, line 933: enclosure semantics and branch handling only; not an exact root-count theorem or a certified ψ remainder. |
| CT | Equation(2.4.4); Remark2.11; Algorithms2.4.4–2.4.5; Proposition4.4 | CT line 755, line 880, line 896, line 934, line 1537: multiplicity, effective-vector restriction and scalar normalizations agree. |
| BCG | Theorem2.4 proof; Corollary3.2; Remark3.3 | BCG line 321, line 453, line 457: coefficient and companion convention agree; detailed table attribution needs R20. |
| NumberRings | §9 equation(9-2), Proposition9.3; §12 relation and regulator comparisons | NumberRings line 1104, line 1125, line 1664, line 1679, line 1688: multiplier criterion and class–unit index reasoning agree. |
| GMN | Definitions1.6,1.9; Theorems1.13,1.15,1.19; Corollary1.20 | GMN line 314, line 385, line 495, line 575, line 684, line 713: slope and residual normalizations agree; R18 concerns ownership of inputs. |
| CarusoPublished | Proposition2.1.1, Definition2.1.2, Proposition2.1.3 and equation(2.5) | CarusoPublished line 922, line 941, line 955, line 987: zero-ball valuation and all three precision laws agree. |
| BennettSiksek | §7, Proposition7.2 proof, p.376 | BennettSiksek line 891, line 914: use of Platt's small-conductor exclusion is as claimed. |
| Thery | Theorems6.1–6.2, p.9 | Thery line 248, line 265: prime-divisor congruence and corrected strict square-root threshold agree; roadmap does not copy the displayed misprint. |
| Platt | Theorems7.1–7.2, pp.14–15 | Platt line 955, line 976: modulus-parity heights and separate central nonvanishing agree. |
| PrattNotes | Formal proof system and size argument, pp.1–4 | PrattNotes line 4 through line 117: leaf, recursive prime factors and quadratic total length support the targets. |
| CL | French Proposition3.17 and numerical comments(3), pp.304–307 | CL line 11644, line 11659, line 11666, line 11763: eight scalar quantities and tail signs checked in the cited French version. |
| CG13 | Appendix, Table of results, p.14 | CG13 line 522, line 536, line 547, line 556, line 564: C/N entries agree with corrected examples; R20 fixes table naming. |
| MilneANT | Theorems7.32–7.33, Lemma7.34; Proposition8.2 | MilneANT line 5320, line 5346, line 5358, line 5929: Newton, factor Hensel and completion-product statements agree; R17 concerns the pinned Lean supplier. |
| Sutherland | §7.2 equation(1), p.2 | Sutherland line 56, line 83: odd-characteristic point-count sum and trace sign agree. |
| Cremona | §3.3 pp.69–70; §3.6 pp.80,93 | Cremona line 364, line 368, line 850, line 1474: torsion and local-solubility context valid; real-component locator repaired by R19. |
| FPS | §7 Lemmas3–4, pp.16–17 | FPS line 631, line 642, line 662: dimension-two local index and concrete generators checked; not a general density theorem. |
| Siksek | §4 equations(39)–(41), pp.17–19 | Siksek line 813, line 843, line 875: saturation, reduction sieve and p=2 representatives agree. |
| deWeger | §3.6, Figure2, pp.51–52; translated centre p.53 | deWeger line 2357, line 2459, line 2471: finite lattice enumeration and translation are present; OCR limits noted below. |
| LLL82 | Proof of Proposition2.13; Algorithm3.5; Theorem3.6, report pp.20,25–26 | LLL82 line 638, line 779, line 820: coefficient bound and rational factorization support the stated background; exhaustive recombination is correctly distinguished from LLL. |
| Mattuck | Theorem7, printed p.114 | Mattuck line 1030: local analytic subgroup; finite index requires local compactness, present for the finite p-adic extensions here. |

Roadmap supplier and ownership audit (paths refer to the content repository):

| Roadmap | Contract examined | Result |
|---|---|---|
| ModularForms | Layers7–11, functional equations, integral Hecke algebra and dimensions | General owner exists; CN's all-prime coefficient recurrence has an explicit normalization. |
| EllipticCurves | Layers4,6, reduction and Mordell–Weil/torsion | Existing owner; finite tests do not prove Mordell–Weil afresh. |
| LocalFieldsRamification | Layers0–2, native finite extensions, unit filtration, unramified norms | Native contracts exist, including the deep-square theorem used in R12's repair. |
| RealAlgebraicGeometry | Layers1–4, real root counts, separation and matching | Real theory exists; no automatic complex-rectangle counting contract inferred. |
| PolynomialGaloisGroups | Layer5, Frobenius orbit/factor degrees | Current README line 1114 distinguishes Rabin certificates from its own theory. |
| NumberFieldArithmetic | Layers3,7, index–discriminant, Kummer–Dedekind and bases | Existing input retained with its index hypotheses. |
| ClassicalArithmeticCompletion | Layer3 and §§5.1–5.3,5.10–5.11,5.16,5.22 | R04–R05; exact current owner and column convention checked. |
| AlgebraicModularFormsAndSerreWeights | R15.2, R15.3, R15.5 | Integral q-expansion lattice, theta/Hasse and lifting targets exist at head 256555e38f36b7545e8245a756015f187defc343. |
| AutomorphicLFunctionsAndLocalFactors | AL.1, rank-one Hecke continuation and comparison | Contract exists at head 691b4b3310d33d5ad6b2b5224005a407eff9a1f8; it is not a numerical remainder estimate. |
| AnalyticNumberTheoryPartI/PartII | Current §§2.3,2.5,2.11–2.12 versus alleged AN.4 | R09; heads 23d3de1ceddedf160130057c5e7c58a2173a7468 and abee65e665923232f6ba2944e203407ada6e5afe checked. |
| HeightsRationalPointsAndObstructions | §1.17, local indices of [2] | Contract present at head cec11c9f9ad58d1ea3331743765559e901725707, including normalized local absolute value. |
| EffectiveDiophantineMethods | §§3.2–3.4,3.17–3.18 | R08; identical local-image/saturation ownership at head 076ace7d0c8f02a54de2d33dd3847b7b48bc2bd6. |
| ComplexMultiplicationAndExplicitReciprocity | Claimed downstream use of arithmetic data | No reverse prerequisite was inserted; head 8b8948009c74f2154f08871085797110ad3e09ba checked. |

The seven open-roadmap heads used for these supplier comparisons were confirmed by read-only GitHub metadata. The three named sibling checkouts were used locally as instructed.

Adversarial target table. A dash means no target-specific change beyond the cross-cutting policy and Check findings. “Agrees” records the tested instances and source statement, not a completed formal proof. All locations below are in `packages/ComputationalNumberTheory/README.md`.

| Statement (line) | Instances tried | Result | Change |
|---|---|---|---|
| 0.1 RAM instruction (`RAMInstruction`) (285) | halt; literal 2+3; different branch targets | Syntax distinctions hold | R01,R22 |
| 0.2 RAM operand evaluation (`ramRead`) (301) | negative literal; zero memory; indirect −1 | Negative address rejected, not truncated | R01 |
| 0.3 Partial RAM transition (`ramStep`) (317) | 3/(−2); halt; missing instruction; 2+3 | −2; distinct error and halt | R01 |
| 0.4 Finite RAM execution (`RAMExecution`) (333) | halt-only; empty program; self-loop | Length≥1 matters; no false successful trace | R01 |
| 0.5 Cost of a RAM execution (`bitCost`) (349) | charge 0,1,2; length one | Finite sum and strict comparison hold | R01 |
| 0.6 Bounded instruction costs give a total bound (`bitCost_le`) (365) | zero bound; length one | Pointwise bounds sum correctly | R01 |
| 0.7 Polynomial magnitude bound for RAM memory (`PolynomialRAMMagnitude`) (371) | zero memory; unused cell 7; zero bound | Quantification includes unused cells | R01,R03 |
| 0.8 Isolated algebraic root certificate (`AlgebraicRootCertificate`) (387) | X; X²; X²−1 with two roots; zero polynomial | Distinct-root uniqueness; zero polynomial excluded | R03 |
| 0.9 Exact rational root presentation (`rationalRootCertificate`) (403) | 0; 1/2; 1/3; their sum | Rational singleton construction consistent | R14 |
| 0.10 Addition of isolated algebraic numbers (`algebraic_add_certificate`) (419) | 0+0; opposite roots | Algebraic closure and isolation suffice for existence | — |
| 0.11 Multiplication of isolated algebraic numbers (`algebraic_mul_certificate`) (425) | 0 times a root; two irrational roots | Closure gives existence even when product is zero | — |
| 0.12 Inversion of a nonzero algebraic number (`algebraic_inv_certificate`) (431) | zero; nonzero rational; irrational root | Nonzero guard excludes inversion at zero | — |
| 0.13 Equality of isolated algebraic numbers (`algebraicEqual`) (437) | two zero presentations; 1/2 versus 1/3 | Semantic equality consistent; executable claim needs scope repair | R01 |
| 0.14 Canonical finite p-adic approximation (`PadicApproximation`) (453) | zero ball; v=−1,N=0; divisible mantissa | Canonical tuple agrees with Caruso | R14 |
| 0.15 Rabin irreducibility certificate (`RabinCertificate`) (470) | linear f; F₂ quadratic; split F₅ quadratic; X⁴+1 | Remainders, Bézout guard and reducibility cases hold | R03 |
| 0.16 Certified presentation of a finite field (`FiniteFieldPresentation`) (488) | degree-one extension; F₄; zero degree | Positive finrank plus degree hypothesis excludes infinite-dimensional loophole | R03 |
| 0.17 Change of presentation with an explicit inverse (`presentationChange`) (508) | identity; F₃ translations; F₇ scaling | Inverse and composition direction correct | R03 |
| 1.1 Recursive Pratt certificate (`PrattCertificate`) (550) | leaf2; node3; malformed1 | Raw syntax correctly permits invalid candidates | R01 |
| 1.2 Pratt certificate checker (`PrattCertificate.check`) (566) | 3,9,1; empty children | Checks reject invalid arithmetic | R01 |
| 1.3 Soundness of Pratt certificates (`PrattCertificate.sound`) (582) | base leaf; composite node | Recursive validity entails Lucas hypotheses | — |
| 1.4 Completeness of Pratt certificates (`PrattCertificate.complete`) (588) | 2;3; repeated factors of p−1 | Prime factor list supplies valid tree | — |
| 1.5 Bit size of a Pratt tree (`prattBitSize`) (594) | leaf; tree3; repeated children | Sizes1,7; multiplicities charged | R01 |
| 1.6 Quadratic bit-size bound for Pratt certificates (`pratt_small_certificate`) (610) | 2; primes with many factors of p−1 | Quadratic tree bound has absolute existential constant | — |
| 1.7 Strong Miller–Rabin liar (`StrongLiar`) (616) | 1;7 base3;2047 base2; a=0 | 2047 passes while composite; base guard retained | R03 |
| 1.8 Prime inputs pass every admissible base (`strongLiar_of_prime`) (632) | odd prime3; a=1; excluded p=2 | Oddness explicit, no assertion for p=2 | — |
| 1.9 Miller–Rabin strong-liar bound (`strongLiar_card_le`) (638) | 9;15; prime powers; a=0 | Bound uses n−1, not φ(n) | — |
| 1.10 Error bound for independent Miller–Rabin rounds (`millerRabin_rounds_bound`) (644) | k=0; n=9; repeated correlated bases | Empty tuple gives1≤1; independence encoded by product count | — |
| 1.11 AKS order parameter (`aksParameter`) (650) | n=0,1,2,9 | Sentinel0; parameters2,3 | R01 |
| 1.12 AKS polynomial congruences (`AKSIdentities`) (666) | r=0; empty range; n=5 | Equality remains true at r=0; empty test not primality | R03 |
| 1.13 Shoup’s AKS algorithm (`aks`) (682) | 0,1,2,9; perfect powers | Branches and length convention match Shoup | R01 |
| 1.14 Correctness of the AKS algorithm (`aks_correct`) (700) | 2; odd prime; perfect power | No counterexample in boundary branches | R01 |
| 1.15 Pocklington prime-divisor congruence (`pocklington_prime_divisor`) (706) | n=17,F=8; empty prime set excluded | Prime-divisor congruence consistent | — |
| 1.16 Pocklington primality criterion (`pocklington_prime`) (712) | F²=n; F=1;17,F=8 | Strict bound and nontrivial F retained | — |
| 1.17 Finite Pocklington certificate (`PocklingtonCertificate`) (718) | empty factors; one2; three2,witness3 | 17 passes only adequate factor size | R01 |
| 1.18 Soundness of finite Pocklington certificates (`PocklingtonCertificate.sound`) (734) | n=0,1;17; repeated factors | Pocklington hypotheses follow from validity | — |
| 1.19 Integer factorization with prime certificates (`IntegerFactorCertificate`) (740) | −1;12;0 | Sign and empty product handle units; zero impossible | R01 |
| 1.20 Soundness of integer factorization certificates (`IntegerFactorCertificate.sound`) (756) | −1;12; repeated factors | Product and primality conclusions supported | — |
| 1.21 Every nonzero integer admits a factor certificate (`IntegerFactorCertificate.complete`) (762) | 0 excluded;±1;negative composite | Prime factors of absolute value suffice | — |
| 1.22 Factorization certificate over a finite field (`FiniteFieldFactorCertificate`) (768) | 1; X²+1 over F₅;0 | Scalar nonzero and factor irreducibility exclude0 | R03 |
| 1.23 Soundness of finite-field factorization certificates (`FiniteFieldFactorCertificate.sound`) (785) | constant; repeated factors; split quadratic | Soundness respects multiplicity | — |
| 1.24 Every nonzero polynomial over a finite field has a factorization certificate (`FiniteFieldFactorCertificate.complete`) (791) | constant; inseparable pth power;0 excluded | Finite fields perfect; repeated irreducibles allowed | — |
| 1.25 Transport of certified finite-field factors (`transport_finite_factorization`) (797) | identity; nontrivial presentation change | Algebra equivalence preserves products and irreducibility | — |
| 1.26 Hensel lifting of a coprime factorization modulo a prime power (`henselLift`) (803) | k=1; degree-zero factor1; p=2; repeated residue factor | Coprimality and monic degree bounds essential; statement sound | R17 |
| 1.27 Rational polynomial factor certificate (`RationalFactorCertificate`) (809) | 1; (X−1)²;0 | Repeated factors and scalar correct | R03 |
| 1.28 Certified rational polynomial factorization (`certifiedRationalFactorization`) (825) | constant; repeated factor;2X²+3X+1;X²+1 | Monic transform gives Y²+3Y+2; existential signature weaker | R01,R11 |
| 2.1 Finite order basis certificate (`OrderBasisCertificate`) (867) | rank0; basis1; basis1/2 in ℚ | Rank0 impossible; half-lattice not multiplicatively closed | R03 |
| 2.2 Multiplier ring of an integral lattice (`multiplierRing`) (883) | zero lattice;ℤ;1/2 multiplier | Zero lattice has whole field of multipliers; not claimed finite | — |
| 2.3 Local maximality of an order (`IsPMaximal`) (899) | p=0,1; maximal order; overorder | At1 no denominator; prime hypotheses retained in theorem | — |
| 2.4 Nilradical from a Frobenius kernel (`nilpotent_iff_frobenius_zero`) (915) | zero algebra; Fₚ; Fₚ[t]/t²; k=0 | Dimension bound controls nilpotence; no reducedness assumed | — |
| 2.5 The p-radical in field coordinates (`pRadicalLattice`) (921) | p=0;ℤ,p prime; element1 | Zero radical0 in domain; prime radical pℤ | — |
| 2.6 Multiplier criterion for p-maximality (`pRadical_multiplier_eq_iff`) (937) | ℤ in ℚ; nonmaximal order; p=2 | Multiplier criterion matches NumberRings with finite full order | — |
| 2.7 Integral basis certificate (`IntegralBasisCertificate`) (943) | ℚ rank1; rank0; element1/2 | Integral closure equality excludes1/2 | R03 |
| 2.8 Certified integral-basis algorithm (`integralBasisAlgorithm`) (959) | maximal input; every ℚ order | Existence is valid; no termination encoded | R11 |
| 2.9 Prime-ideal decomposition certificate (`PrimeIdealFactorCertificate`) (975) | ℚ prime; zero ideal; exponent0 | All excluded/preserved as required | — |
| 2.10 Checked class-group relation lattice (`classRelationLattice`) (991) | empty factor base;unit ideals;subtraction | Kernel definition correct but already owned | R04 |
| 2.11 Relation quotient covers the class group (`classNumber_dvd_relation_index`) (1007) | empty class group;incomplete relations | Surjectivity and finite-index guard retained | R04 |
| 2.12 Certified Minkowski factor-base generation (`minkowski_factorBase_generates`) (1013) | ℚ;unit ideal;Minkowski bound endpoint | Small-prime generation valid, already owned | R04 |
| 2.13 Fundamental units from a regulator index bound (`units_complete_of_regulator_bound`) (1019) | unit rank0;index1,2;torsion omission | Torsion adjoining and strict2 bound correct | R04 |
| 2.14 Joint class and unit stopping bound (`joint_class_unit_bound`) (1025) | indices1,2;lower bound0 excluded | Integer factor≥2 contradicts strict upper bound | R04 |
| 2.15 Certified completion of class and unit computations (`certified_class_unit_complete`) (1033) | rank0;incomplete class relations;missing torsion | Combined criterion correct under hypotheses | R04,R09 |
| 2.16 Exact φ-adic polynomial expansion (`phiExpansion`) (1039) | f=0;φ=X;φ=X−1;zero ring | Coefficients0; standard coefficients;1,2,1; hypotheses exclude invalid φ | — |
| 2.17 Valuation of a φ-coefficient (`coefficientValuation`) (1055) | zero;3X+9;X² | ∞,1,0 with no v(0)=0 contamination | — |
| 2.18 A finite negative φ-Newton side (`IsPhiNewtonSide`) (1071) | X²−3;zero polynomial;wrong slope−1 | Full-side endpoint and supporting inequalities discriminate | R03 |
| 2.19 Residual polynomial of a φ-Newton side (`phiResidualPolynomial`) (1087) | X²−3;(X−3)²;zero input | Residuals Y−1 and (Y−1)²; zero raw value | — |
| 2.20 Ore residual irreducibility criterion (`ore_residual_irreducible`) (1103) | Eisenstein X²−3;repeated residual;ramified e=2 | Irreducibility criterion and invariants match GMN | R18 |
| 2.21 Finite local expansion certificate (`LocalExpansionCertificate`) (1109) | N=0;zero;π⁻¹;bad precision-one centre | Norm inequality valid; digits not asserted canonical | R03 |
| 2.22 Squares of units in a finite extension of ℚ_p (`isSquare_iff_isSquare_mod`) (1125) | p=2:17,5;p=5:6;ramified dyadic extension | 4π threshold correct; Lean only ℚₚ | R12 |
| 2.23 Roots in ℚ_p from the decomposition of p (`card_padicRoots_eq`) (1131) | X²−2,p=7,2;linear polynomial | Two unramified degree-one factors versus none ramified | — |
| 3.1 Integral q-expansion lattice (`integralModularLattice`) (1163) | weight0;E₄;E₄/2 | Integral coefficient predicate discriminates | R14 |
| 3.2 Integral cusp-form lattice (`integralCuspLattice`) (1179) | weight0;Δ;Δ/2 | Zero space and first coefficient consistent | R14 |
| 3.3 Integral Miller basis (`millerBasis`) (1195) | weights0,2,12;rank0 | Empty basis; Δ normalization; existence correct | R13 |
| 3.4 Level-one congruence Sturm bound (`levelOne_congruence_sturm`) (1211) | k=0,2,12;p=2,3;zero form | Constant coefficient and inclusive floor bound retained | — |
| 3.5 Exact equality of certified modular data (`modularDataEqual`) (1217) | bound0;Δ versus0;identical arrays | Constant-only comparison insufficient at12 | R01 |
| 3.6 Level-one Hecke recurrence contract (`HasLevelOnePrimeRecurrence`) (1233) | weight2;Δ,T₂;zero map | Recurrence determines operator; T₂Δ=−24Δ | R14 |
| 3.7 Integral Hecke matrix in the Miller basis (`integralHeckeMatrix`) (1249) | weight2;weight12,p=2 | Empty determinant1; one-dimensional determinant−24 | — |
| 3.8 The coefficient at 107 of ΔE₄²E₆ (`weight26_coeff_107`) (1265) | coefficient107 of ΔE₄²E₆ | Exact independent computation agrees | — |
| 3.9 Ordinary reduction at 107 (`weight26_ordinary_107`) (1271) | reduction of that coefficient mod107 | 106, hence nonzero | — |
| 3.10 Nonordinary determinant at weight 38 and prime 79 (`weight38_nonordinary_det`) (1277) | weight38,p=79 | Matrix [[3,17],[25,10]], determinant−395≡0 | — |
| 3.11 Certified nonordinary weight-prime pair (`NonordinaryLevelOnePair`) (1283) | weight2;38,79;26,107 | Empty determinant fails; intended pairs discriminate | — |
| 3.12 The first two nonordinary level-one primes (`small_nonordinary_primes`) (1299) | all eligible p≤79,k<p | Only59 and79, four pairs reproduced | R20 |
| 3.13 Nonordinary pairs below 200 (`nonordinary_pairs_lt_200`) (1305) | all eligible p<200,k<p | All16 pairs and gcd filter reproduced | R20 |
| 3.14 Complete companion eigensystem at weight 82 (`weight82_companion_system`) (1311) | ℓ≠107;exponents25,81 | 25+81=106; cohomological twist direction agrees with BCG | — |
| 3.15 Ordinary level-one companion pair (`OrdinaryCompanionPair`) (1317) | p=2;weight2;26↔82 at107 | Weight and simultaneous-eigenvector guards retained | — |
| 3.16 Corrected ordinary companion witnesses (`corrected_ordinary_companion_list`) (1333) | six listed pairs;excluded151 | Listed gcds1;151 gcds3; source gives C entries | R20 |
| 3.17 Point counts over a finite field as a character sum (`pointCount_eq_charSum`) (1339) | F₃:4;F₅:9;singular cusp6;F₂ failure | Character-sum sign and odd-characteristic restriction correct | R03 |
| 3.18 Certified local image of the 2-descent map (`LocalImageCertificate`) (1355) | real split cubic;real one-root cubic;dyadic incomplete span | Image orders2,1,8 as stated | R08,R19 |
| 3.19 The size check completes a local image (`LocalImageCertificate.eq_range_of_isComplete`) (1373) | trivial span;equal finite cardinality;real place | Finite group order argument valid | R08 |
| 3.20 Complete local images exist and are found by search (`exists_complete_localImageCertificate`) (1379) | torsion-only candidates;open nonempty cosets | Rational abscissa density argument plausible, locator wrong | R08,R19 |
| 3.21 Local images at good odd primes (`localImage_of_good_odd`) (1385) | cubic splitting types3,1+2,1+1+1 | Norm-kernel sizes1,2,4; good odd restrictions appropriate | R08 |
| 3.22 p-saturated subgroups (`IsPSaturated`) (1391) | 6ℤ;p=2,3,5;ℤ×ℤ/2 missing torsion | Correct iff includes A[p]⊆G | R08,R15 |
| 3.23 p-saturation reduces to finitely many divisibility tests (`isPSaturated_iff_forall_not_dvd`) (1408) | rank0;dependent generators;missing torsion | Injectivity and torsion conditions both necessary | R08 |
| 3.24 Exact test for divisibility of a rational point by p (`mem_nsmul_iff_exists_root`) (1418) | P=O;p=2;nontorsion P;extraneous x roots | O separate; candidate points checked by group law | — |
| 3.25 The reduction sieve for p-saturation (`saturationSieve_sound`) (1424) | empty sieve;q-order prime to p;p² divides group order | Only necessary conditions asserted; quotient handles p² | R08 |
| 3.26 A terminating p-saturation test (`pSaturationTest`) (1430) | rank0 with full torsion;2Q;Q,2Q | Dependent generators cannot certify basis; finite tests well specified | R01,R08 |
| 4.1 Rational interval multiplication (`intervalMul`) (1469) | [−2,3]·[−4,5];zero;[−1,1]² | [−12,15];zero;[−1,1] | R14 |
| 4.2 Enclosure under multiplication (`intervalMul_sound`) (1485) | mixed signs;singleton endpoints | Four corners give enclosure | — |
| 4.3 Partial interval reciprocal (`intervalInv`) (1491) | [2,4];[−4,−2];zero-crossing | Reciprocals reversed;zero rejected | R14 |
| 4.4 Enclosure under reciprocal (`intervalInv_sound`) (1507) | positive and negative intervals;zero excluded | Field inverse order reversal valid | — |
| 4.5 Outward dyadic rounding (`dyadicHull`) (1513) | 1/3,p=2;−1/3,p=0;0 | [1/4,1/2];[−1,0];0 | R14 |
| 4.6 Width added by dyadic rounding (`dyadicHull_width`) (1529) | exact dyadic endpoints;p=0 | Two strict endpoint errors give strict2·2⁻ᵖ | — |
| 4.7 Rational complex-box denotation (`complexBoxSet`) (1535) | singleton0;singleton i;positive real lower bound | Cartesian real/imaginary bounds correct | R14 |
| 4.8 Unique integer extraction (`uniqueInteger`) (1551) | [3/4,5/4];[0,1];{1/2} | some1;none;none | R14 |
| 4.9 Recovery of a known integral value (`uniqueInteger_sound`) (1567) | negative integer;endpoint integer;two integers | Uniqueness implication valid | — |
| 4.10 Normalize a rational p-adic ball (`padicNormalize`) (1573) | 0,N=5;5 mod3;9,N=2 | Canonical zero and valuation normalization agree | — |
| 4.11 Certified p-adic addition (`padicAdd`) (1590) | zero balls;1+O(9)+2+O(27) | Minimum precision and cancellation correct | — |
| 4.12 Certified p-adic multiplication (`padicMul`) (1606) | O(9)·O(81);3 times1/3 balls | Precision6 and3 respectively; zero-centre valuation=N | — |
| 4.13 Partial p-adic inversion (`padicInverse`) (1623) | zero ball;unit;3+O(3⁴) | Reject0;precisionN;precision2 | — |
| 4.14 Odlyzko tail kernel (`ctTailKernel`) (1639) | x=0,1,−1 | 2/π²;strict decay for x≥0;not even | R03 |
| 4.15 Geometric bound for the Odlyzko tail (`ctTailKernel_tail`) (1655) | b=0;N=0;α→0 positive | Positive geometric denominator; bound remains valid | — |
| 4.16 Alternating Odlyzko tail bound (`ctTailKernel_alternating_tail`) (1661) | b=0;N=0;weighted threshold α(N+1)=1 | Alternating terms decrease in stated range | R10 |
| 4.17 Closed scalar formulas for CT evaluation (`ctExplicitFormula`) (1667) | ℓ>0;w=0;shared indices1,4 | Eight formulas agree with CL/CT;zero only for shared extension | — |
| 4.18 Certified rational enclosures of CT quantities (`ctEnclosure`) (1711) | ℓ=1,P=8;w=0;singleton rational | 8/π²≈0.81057;singleton impossible | R21 |
| 4.19 Complete isolation of rational-polynomial roots (`isolatePolynomialRoots`) (1727) | nonzero constant;X²;X²+1 | 0,1,2 distinct roots; existence signature only | R11 |
| 4.20 Certified continued Dirichlet L-values (`dirichletLBox`) (1744) | q=1,z=2;q=1,z=1;central value | Pole guard correct;continuation distinct from raw series | R21 |
| 4.21 Certified cusp-form L-value enclosure (`cuspLBox`) (1760) | zero form;P=8;box containing0 | Enclosure cannot prove zero unless singleton;Checks weak | R21,R22 |
| 4.22 Platt’s finite-conductor zero certificate target (`platt_bounded_height`) (1777) | q=1;even/odd q;Im=0;strip endpoints | Modulus parity and strip bounds match Platt | — |
| 4.23 Platt’s central nonvanishing target (`platt_central_nonvanishing`) (1783) | q=1;central point;conductor endpoint | Separate nonvanishing theorem matches Platt | — |
| 4.24 No real zeros for conductor at most 400000 (`small_conductor_no_real_zero`) (1789) | real s;principal q=1;central zero candidate | Height theorem plus central nonvanishing excludes all | — |
| 4.25 Entrywise lower bounds on effective vectors (`effectiveGram_lower`) (1795) | nonnegative vector;negative coordinate | Entrywise order requires coordinate signs | — |
| 4.26 Fincke–Pohst enumeration of an ellipsoid (`fpEnumeration`) (1801) | n=0;R<0;I₂;coupled2×2;centre1/2;zero pivot | 0/1 cardinality;5,7,2 vectors;invalid pivot rejected | R01 |
| 4.27 Soundness and completeness of the Fincke–Pohst enumeration (`fpEnumeration_complete`) (1822) | negative budget;boundary vectors;translation | Completeness iff correct under positive-definite hypothesis | R01 |
| 4.28 Loewner lower bounds on unrestricted vectors (`loewnerGram_lower`) (1828) | zero difference;negative coordinates | PSD difference handles unrestricted vectors | — |
| 4.29 Rational witness of Gram negativity (`NegativeGramCertificate`) (1834) | n=0;[−2,−1];[−1,1] | No zero-dimensional witness;upper endpoint determines sign | — |
| 4.30 Soundness of the negativity certificate (`NegativeGramCertificate.sound`) (1851) | singleton negative;straddling zero;nonzero vector | Upper quadratic bound implies true negative value | — |
| 4.31 Effective vectors from a certified ellipsoid cover (`effectiveEllipsoidCover`) (1857) | zero;negative coordinate;boundary | Supplied-cover completeness retained as hypothesis | R01 |
| 4.32 Finite Gram-negativity checker (`checkNegativeGram`) (1873) | upper−1;zero vector;straddling interval | Predicate is exactly sound certificate condition | R01 |
| 4.33 Finite family of Gram certificates (`checkGramDataset`) (1889) | empty list;one valid row;zero-vector row | Vacuous empty soundness does not claim completeness | R01 |
| 4.34 Correct multiplicity lift for Gram witnesses (`multiplicityGram_lift`) (1905) | m=1,2;empty blocks;two multiplicities | Each coordinate tᵢ/mᵢ;diagonal α/mᵢ normalization correct | R15 |

Declaration/context table. Locations are in `packages/ComputationalNumberTheory/Suggested.lean`. Ambient contexts are syntactic: a sorry theorem retains only binders used by its type. “Own” means the declaration's own binders, not an assumption-free theorem. The field, finite-dimensional, primality, ellipticity, finite-index and positivity guards were inspected in the signatures; no additional missing-standing-instance counterexample was found. Unused ambient number-field parameters on unrelated theorems do not strengthen those theorems.

| Line | Declaration | Layer / section | Ambient variables and instances | Own binders | Audit |
|---|---|---|---|---|---|
| 48 | inductive `RAMInstruction` | Layer CN.0 / RAM | `Own` | `none` | Signature/body read; target cases above; R01 |
| 56 | def `ramRead` | Layer CN.0 / RAM | `Own` | `(m : ℕ → ℤ)` | Signature/body read; target cases above; R01 |
| 62 | def `ramDest` | Layer CN.0 / RAM | `Own` | `(m : ℕ → ℤ)` | Signature/body read; target cases above; R01 |
| 67 | def `ramArith` | Layer CN.0 / RAM | `Own` | `(op : Fin 4) (x y : ℤ)` | Signature/body read; target cases above; R01 |
| 72 | def `ramCompare` | Layer CN.0 / RAM | `Own` | `(cmp : Fin 6) (x y : ℤ)` | Signature/body read; target cases above; R01 |
| 79 | def `ramStep` | Layer CN.0 / RAM | `Own` | `(P : List RAMInstruction) (c : ℕ × (ℕ → ℤ))` | Signature/body read; target cases above; R01 |
| 90 | example `example 1` | Layer CN.0 / RAM | `Own` | `none` | Proof body present; no Lean run; R01 |
| 92 | example `example 2` | Layer CN.0 / RAM | `Own` | `none` | Proof body present; no Lean run; R01 |
| 95 | example `example 3` | Layer CN.0 / RAM | `Own` | `none` | Proof body present; no Lean run; R01 |
| 98 | example `example 4` | Layer CN.0 / RAM | `Own` | `none` | Proof body present; no Lean run; R01 |
| 102 | structure `RAMExecution` | Layer CN.0 / RAM | `Own` | `(P : List RAMInstruction)` | Signature/body read; target cases above; R01 |
| 112 | def `RAMExecution.bitCost` | Layer CN.0 / RAM | `Own` | `{P : List RAMInstruction} (e : RAMExecution P) (C : ℕ × (ℕ → ℤ) → ℕ)` | Signature/body read; target cases above; R01 |
| 117 | theorem `RAMExecution.bitCost_le` | Layer CN.0 / RAM | `Own` | `{P : List RAMInstruction} (e : RAMExecution P) (C : ℕ × (ℕ → ℤ) → ℕ) (B : ℕ) (h : ∀ i, C (e.config i) ≤ B)` | Signature/body read; target cases above; R01 |
| 123 | example `example 5` | Layer CN.0 / RAM | `Own` | `none` | Proof body present; no Lean run; R01 |
| 129 | def `PolynomialRAMMagnitude` | Layer CN.0 / RAM | `Own` | `{P : List RAMInstruction} (e : RAMExecution P) (n A b C : ℕ)` | Signature/body read; target cases above; R01 |
| 133 | example `example 6` | Layer CN.0 / RAM | `Own` | `none` | R03: admitted; R01 |
| 144 | structure `AlgebraicRootCertificate` | Layer CN.0 / Algebraic | `Own` | `none` | Signature/body read; target cases above |
| 153 | def `AlgebraicRootCertificate.value` | Layer CN.0 / Algebraic | `Own` | `(c : AlgebraicRootCertificate)` | Signature/body read; target cases above |
| 156 | theorem `AlgebraicRootCertificate.value_mem_algebraicClosure` | Layer CN.0 / Algebraic | `Own` | `(c : AlgebraicRootCertificate)` | Signature/body read; target cases above |
| 160 | theorem `AlgebraicRootCertificate.value_unique` | Layer CN.0 / Algebraic | `Own` | `(c : AlgebraicRootCertificate) (z : ℂ) (hz : aeval z c.poly = 0) (hre : (c.re.fst : ℝ) ≤ z.re ∧ z.re ≤ c.re.snd) (him : (c.im.fst : ℝ) ≤ z.im ∧ z.im ≤ c.im.snd)` | Signature/body read; target cases above |
| 166 | theorem `algebraic_add_certificate` | Layer CN.0 / Algebraic | `Own` | `(a b : AlgebraicRootCertificate)` | Signature/body read; target cases above |
| 170 | theorem `algebraic_mul_certificate` | Layer CN.0 / Algebraic | `Own` | `(a b : AlgebraicRootCertificate)` | Signature/body read; target cases above |
| 174 | theorem `algebraic_inv_certificate` | Layer CN.0 / Algebraic | `Own` | `(a : AlgebraicRootCertificate) (ha : a.value ≠ 0)` | Signature/body read; target cases above |
| 179 | example `example 7` | Layer CN.0 / Algebraic | `Own` | `none` | R03: admitted |
| 189 | structure `PadicApproximation` | Layer CN.0 / Padic | `Own` | `(p : ℕ)` | Signature/body read; target cases above |
| 198 | def `PadicApproximation.center` | Layer CN.0 / Padic | `Own` | `{p : ℕ} (a : PadicApproximation p)` | Signature/body read; target cases above |
| 202 | def `PadicApproximation.denotation` | Layer CN.0 / Padic | `Own` | `{p : ℕ} [Fact p.Prime] (a : PadicApproximation p)` | Signature/body read; target cases above |
| 206 | theorem `PadicApproximation.center_mem` | Layer CN.0 / Padic | `Own` | `{p : ℕ} [Fact p.Prime] (a : PadicApproximation p)` | Signature/body read; target cases above |
| 211 | example `example 8` | Layer CN.0 / Padic | `Own` | `none` | Proof body present; no Lean run |
| 215 | example `example 9` | Layer CN.0 / Padic | `Own` | `none` | Proof body present; no Lean run |
| 230 | structure `RabinCertificate` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `(f : F[X])` | Signature/body read; target cases above |
| 237 | theorem `RabinCertificate.irreducible` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{f : F[X]} (h : RabinCertificate f)` | Signature/body read; target cases above |
| 240 | theorem `RabinCertificate.of_irreducible` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{f : F[X]} (hm : f.Monic) (hf : Irreducible f)` | Signature/body read; target cases above |
| 244 | example `example 10` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `none` | R03: admitted |
| 248 | example `example 11` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `none` | R03: admitted |
| 252 | example `example 12` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `none` | R03: admitted |
| 258 | structure `FiniteFieldPresentation` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `(F K : Type*) [Field F] [Fintype F] [Field K] [Algebra F K]` | Signature/body read; target cases above |
| 266 | def `FiniteFieldPresentation.lift` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` | Signature/body read; target cases above |
| 270 | theorem `FiniteFieldPresentation.bijective` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` | Signature/body read; target cases above |
| 275 | def `FiniteFieldPresentation.equiv` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` | Signature/body read; target cases above |
| 279 | theorem `FiniteFieldPresentation.equiv_root` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{K : Type*} [Field K] [Algebra F K] (P : FiniteFieldPresentation F K)` | Signature/body read; target cases above |
| 284 | theorem `FiniteFieldPresentation.exists` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `(K : Type*) [Field K] [Algebra F K] [FiniteDimensional F K]` | Signature/body read; target cases above |
| 289 | example `example 13` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `none` | R03: admitted |
| 294 | structure `PresentationChange` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `(f g : F[X])` | Signature/body read; target cases above |
| 301 | theorem `exists_presentationChange` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `{f g : F[X]} (hfm : f.Monic) (hgm : g.Monic) (hf : Irreducible f) (hg : Irreducible g) (hdeg : f.natDegree = g.natDegree)` | Signature/body read; target cases above |
| 306 | example `example 14` | Layer CN.0 / FiniteFields | `{F : Type*} [Field F] [Fintype F]` | `none` | R03: admitted |
| 317 | inductive `PrattCertificate` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 322 | def `PrattCertificate.value` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 328 | def `PrattCertificate.nodeOK` | Layer CN.1 / Primality | `Own` | `(n a : ℕ) (cs : List PrattCertificate)` | Signature/body read; target cases above |
| 335 | def `PrattCertificate.check` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 339 | def `PrattCertificate.checkList` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 344 | example `example 15` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 347 | example `example 16` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 350 | theorem `PrattCertificate.sound` | Layer CN.1 / Primality | `Own` | `(c : PrattCertificate) (h : c.check = true)` | Signature/body read; target cases above |
| 354 | theorem `PrattCertificate.complete` | Layer CN.1 / Primality | `Own` | `(n : ℕ) (hn : n.Prime)` | Signature/body read; target cases above |
| 361 | def `prattBitSize` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 366 | def `prattBitSizeList` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 371 | example `example 17` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 374 | theorem `pratt_small_certificate` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 381 | def `StrongLiar` | Layer CN.1 / Primality | `Own` | `(n a : ℕ)` | Signature/body read; target cases above |
| 388 | example `example 18` | Layer CN.1 / Primality | `Own` | `none` | R03: admitted |
| 392 | theorem `strongLiar_of_prime` | Layer CN.1 / Primality | `Own` | `(n a : ℕ) (hn : n.Prime) (hodd : Odd n) (ha : 0 < a) (han : a < n)` | Signature/body read; target cases above |
| 398 | theorem `strongLiar_card_le` | Layer CN.1 / Primality | `Own` | `(n : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime)` | Signature/body read; target cases above |
| 403 | theorem `millerRabin_rounds_bound` | Layer CN.1 / Primality | `Own` | `(n k : ℕ) (hn : 1 < n) (hodd : Odd n) (hc : ¬ n.Prime)` | Signature/body read; target cases above |
| 408 | def `aksOrder` | Layer CN.1 / Primality | `Own` | `(n r : ℕ)` | Signature/body read; target cases above |
| 412 | def `aksLen` | Layer CN.1 / Primality | `Own` | `(n : ℕ)` | Signature/body read; target cases above |
| 416 | def `aksParameter` | Layer CN.1 / Primality | `Own` | `(n : ℕ)` | Signature/body read; target cases above |
| 421 | example `example 19` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 425 | def `AKSIdentities` | Layer CN.1 / Primality | `Own` | `(n r ℓ : ℕ)` | Signature/body read; target cases above |
| 430 | example `example 20` | Layer CN.1 / Primality | `Own` | `none` | R03: admitted |
| 436 | def `AKSAccepts` | Layer CN.1 / Primality | `Own` | `(n : ℕ)` | Signature/body read; target cases above |
| 442 | example `example 21` | Layer CN.1 / Primality | `Own` | `none` | R03: admitted |
| 446 | theorem `aks_correct` | Layer CN.1 / Primality | `Own` | `(n : ℕ)` | Signature/body read; target cases above |
| 451 | theorem `pocklington_prime_divisor` | Layer CN.1 / Primality | `Own` | `(n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (h : ∀ q, q.Prime → q ∣ F → ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n) (p : ℕ) (hp : p.Prime) (hpn : p ∣ n)` | Signature/body read; target cases above |
| 461 | theorem `pocklington_prime` | Layer CN.1 / Primality | `Own` | `(n F : ℕ) (hn : 1 < n) (hF1 : 1 < F) (hF : F ∣ n - 1) (hF2 : n < F ^ 2) (h : ∀ q, q.Prime → q ∣ F → ∃ a : ℕ, a ^ (n - 1) ≡ 1 [MOD n] ∧ Nat.Coprime (a ^ ((n - 1) / q) - 1) n)` | Signature/body read; target cases above |
| 469 | structure `PocklingtonCertificate` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 473 | def `PocklingtonCertificate.factor` | Layer CN.1 / Primality | `Own` | `(c : PocklingtonCertificate)` | Signature/body read; target cases above |
| 477 | def `PocklingtonCertificate.check` | Layer CN.1 / Primality | `Own` | `(c : PocklingtonCertificate) (n : ℕ)` | Signature/body read; target cases above |
| 484 | example `example 22` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 488 | theorem `PocklingtonCertificate.sound` | Layer CN.1 / Primality | `Own` | `(c : PocklingtonCertificate) (n : ℕ) (h : c.check n = true)` | Signature/body read; target cases above |
| 493 | structure `IntegerFactorCertificate` | Layer CN.1 / Primality | `Own` | `none` | Signature/body read; target cases above |
| 498 | def `IntegerFactorCertificate.value` | Layer CN.1 / Primality | `Own` | `(c : IntegerFactorCertificate)` | Signature/body read; target cases above |
| 502 | def `IntegerFactorCertificate.check` | Layer CN.1 / Primality | `Own` | `(c : IntegerFactorCertificate) (z : ℤ)` | Signature/body read; target cases above |
| 505 | example `example 23` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 508 | example `example 24` | Layer CN.1 / Primality | `Own` | `none` | Proof body present; no Lean run |
| 511 | theorem `IntegerFactorCertificate.sound` | Layer CN.1 / Primality | `Own` | `(c : IntegerFactorCertificate) (z : ℤ) (h : c.check z = true)` | Signature/body read; target cases above |
| 516 | theorem `IntegerFactorCertificate.complete` | Layer CN.1 / Primality | `Own` | `(z : ℤ) (hz : z ≠ 0)` | Signature/body read; target cases above |
| 528 | structure `FiniteFieldFactorCertificate` | Layer CN.1 / Factorization | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` | `(f : F[X])` | Signature/body read; target cases above |
| 538 | example `example 25` | Layer CN.1 / Factorization | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` | `none` | R03: admitted |
| 544 | theorem `FiniteFieldFactorCertificate.sound` | Layer CN.1 / Factorization | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` | `{f : F[X]} (c : FiniteFieldFactorCertificate f)` | Signature/body read; target cases above |
| 551 | theorem `FiniteFieldFactorCertificate.complete` | Layer CN.1 / Factorization | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` | `{f : F[X]} (hf : f ≠ 0)` | Signature/body read; target cases above |
| 556 | theorem `transport_finite_factorization` | Layer CN.1 / Factorization | `{F : Type*} [Field F] [Fintype F] [DecidableEq F]` | `{K : Type*} [Field K] [Fintype K] [DecidableEq K] (e : F ≃+* K) {f : F[X]} (c : FiniteFieldFactorCertificate f)` | Signature/body read; target cases above |
| 566 | theorem `henselLift` | Layer CN.1 /  | `Own` | `(p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 1 ≤ k) (f : ℤ[X]) (hf : f.Monic) (g₀ h₀ : (ZMod p)[X]) (hg₀ : g₀.Monic) (hh₀ : h₀.Monic) (hcop : IsCoprime g₀ h₀) (hfac : f.map (Int.castRingHom (ZMod p)) = g₀ * h₀)` | Signature/body read; target cases above |
| 578 | structure `RationalFactorCertificate` | Layer CN.1 /  | `Own` | `(f : ℚ[X])` | Signature/body read; target cases above |
| 587 | example `example 26` | Layer CN.1 /  | `Own` | `none` | R03: admitted |
| 592 | theorem `certifiedRationalFactorization` | Layer CN.1 /  | `Own` | `(f : ℚ[X]) (hf : f ≠ 0)` | Signature/body read; target cases above; R11 |
| 607 | structure `OrderBasisCertificate` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(K : Type*) [Field K] [NumberField K] (n : ℕ)` | Signature/body read; target cases above |
| 617 | def `OrderBasisCertificate.lattice` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (b : OrderBasisCertificate K n)` | Signature/body read; target cases above |
| 620 | theorem `OrderBasisCertificate.mul_mem` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (b : OrderBasisCertificate K n) {x y : K} (hx : x ∈ b.lattice) (hy : y ∈ b.lattice)` | Signature/body read; target cases above |
| 626 | def `multiplierRing` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L)` | Signature/body read; target cases above |
| 634 | theorem `mem_multiplierRing` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{L : Type*} [Field L] [CharZero L] (I : Submodule ℤ L) (x : L)` | Signature/body read; target cases above |
| 637 | example `example 27` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | Proof body present; no Lean run |
| 641 | example `example 28` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted |
| 645 | example `example 29` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted |
| 651 | def `IsPMaximal` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(R : Subalgebra ℤ K) (p : ℕ)` | Signature/body read; target cases above |
| 655 | example `example 30` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | Proof body present; no Lean run |
| 661 | theorem `nilpotent_iff_frobenius_zero` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(p : ℕ) [Fact p.Prime] {A : Type*} [CommRing A] [Algebra (ZMod p) A] [FiniteDimensional (ZMod p) A] (k : ℕ) (hk : Module.finrank (ZMod p) A ≤ p ^ k) (x : A)` | Signature/body read; target cases above |
| 669 | def `pRadicalLattice` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(R : Subalgebra ℤ K) (p : ℕ)` | Signature/body read; target cases above |
| 672 | theorem `mem_pRadicalLattice` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(R : Subalgebra ℤ K) (p : ℕ) (hp : p.Prime) (hR : (Subalgebra.toSubmodule R).FG) (x : K)` | Signature/body read; target cases above |
| 678 | example `example 31` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted |
| 684 | theorem `pRadical_multiplier_eq_iff` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(R : Subalgebra ℤ K) (hfg : (Subalgebra.toSubmodule R).FG) (hspan : Submodule.span ℚ (R : Set K) = ⊤) (p : ℕ) [Fact p.Prime]` | Signature/body read; target cases above |
| 692 | structure `IntegralBasisCertificate` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(K : Type*) [Field K] [NumberField K] (n : ℕ)` | Signature/body read; target cases above |
| 697 | example `example 32` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted |
| 701 | theorem `integralBasisAlgorithm` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (b : OrderBasisCertificate K n)` | Signature/body read; target cases above; R11 |
| 706 | structure `PrimeIdealFactorCertificate` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(K : Type*) [Field K] [NumberField K] (p : ℕ)` | Signature/body read; target cases above |
| 712 | theorem `PrimeIdealFactorCertificate.nonempty` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{p : ℕ} (hp : p.Prime) (c : PrimeIdealFactorCertificate K p)` | Signature/body read; target cases above |
| 717 | example `example 33` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted |
| 722 | def `classRelationLattice` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰)` | Signature/body read; target cases above; R04 |
| 733 | example `example 34` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | R03: admitted; R04 |
| 737 | theorem `classNumber_dvd_relation_index` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰) (L : AddSubgroup (Fin n → ℤ)) (hL : L ≤ classRelationLattice I) (hgen : Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤) (hfin : L.FiniteIndex)` | Signature/body read; target cases above; R04 |
| 744 | theorem `minkowski_factorBase_generates` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰) (B : ℝ) (hB : (4 / Real.pi) ^ InfinitePlace.nrComplexPlaces K * ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K : ℝ) ^ (Module.finrank ℚ K) * Real.sqrt \|(discr K : ℝ)\|) ≤ B) (hcover : ∀ P : (Ideal (𝓞 K))⁰, (P : Ideal (𝓞 K)).IsPrime → (Ideal.absNorm (P : Ideal (𝓞 K)) : ℝ) ≤ B → P ∈ Set.range I)` | Signature/body read; target cases above; R04 |
| 755 | theorem `units_complete_of_regulator_bound` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(u : Fin (Units.rank K) → (𝓞 K)ˣ) (hu : Units.IsMaxRank u) (h : Units.regOfFamily u < 2 * Units.regulator K)` | Signature/body read; target cases above; R04 |
| 761 | theorem `joint_class_unit_bound` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `(u : Fin (Units.rank K) → (𝓞 K)ˣ) (hu : Units.IsMaxRank u) (h h' : ℕ) (hh : 0 < h) (hh' : 0 < h') (hd : h ∣ h') (hb : (h' : ℝ) * Units.regOfFamily u < 2 * h * Units.regulator K)` | Signature/body read; target cases above; R04 |
| 768 | example `example 35` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `none` | Proof body present; no Lean run; R04; R15 |
| 772 | theorem `certified_class_unit_complete` | Layer CN.2 / NumberFields | `{K : Type*} [Field K] [NumberField K]` | `{n : ℕ} (I : Fin n → (Ideal (𝓞 K))⁰) (L : AddSubgroup (Fin n → ℤ)) (hL : L ≤ classRelationLattice I) (hgen : Subgroup.closure (Set.range fun i => ClassGroup.mk0 (I i)) = ⊤) (hfin : L.FiniteIndex) (u : Fin (Units.rank K) → (𝓞 K)ˣ) (hu : Units.IsMaxRank u) (hb : (L.index : ℝ) * Units.regOfFamily u < 2 * classNumber K * Units.regulator K)` | Signature/body read; target cases above; R04 |
| 786 | def `phiExpansion` | Layer CN.2 / Newton | `Own` | `{R : Type*} [CommRing R] (φ f : R[X]) (i : ℕ)` | Signature/body read; target cases above |
| 789 | theorem `phiExpansion_reconstruct` | Layer CN.2 / Newton | `Own` | `{R : Type*} [CommRing R] (φ f : R[X]) (hφ : φ.Monic) (hm : 0 < φ.natDegree)` | Signature/body read; target cases above |
| 794 | example `example 36` | Layer CN.2 / Newton | `Own` | `none` | R03: admitted |
| 798 | def `coefficientValuation` | Layer CN.2 / Newton | `Own` | `(p : ℕ) (a : ℤ[X])` | Signature/body read; target cases above |
| 801 | example `example 37` | Layer CN.2 / Newton | `Own` | `none` | Proof body present; no Lean run |
| 806 | def `IsPhiNewtonSide` | Layer CN.2 / Newton | `Own` | `(p : ℕ) (φ f : ℤ[X]) (s u e h d : ℕ)` | Signature/body read; target cases above |
| 814 | example `example 38` | Layer CN.2 / Newton | `Own` | `none` | R03: admitted |
| 820 | theorem `isSquare_iff_isSquare_mod` | Layer CN.2 / Newton | `Own` | `(p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ)` | Signature/body read; target cases above; R12 |
| 827 | structure `LocalExpansionCertificate` | Layer CN.2 /  | `Own` | `(L : Type*) [NormedField L] (π x : L) (N : ℕ)` | Signature/body read; target cases above |
| 836 | example `example 39` | Layer CN.2 /  | `Own` | `none` | R03: admitted |
| 849 | def `integralModularLattice` | Layer CN.3 / Modular | `Own` | `(k : ℤ)` | Signature/body read; target cases above |
| 852 | theorem `mem_integralModularLattice` | Layer CN.3 / Modular | `Own` | `(k : ℤ) (f : ModularForm 𝒮ℒ k)` | Signature/body read; target cases above |
| 857 | def `integralCuspLattice` | Layer CN.3 / Modular | `Own` | `(k : ℤ)` | Signature/body read; target cases above |
| 860 | theorem `mem_integralCuspLattice` | Layer CN.3 / Modular | `Own` | `(k : ℤ) (f : CuspForm 𝒮ℒ k)` | Signature/body read; target cases above |
| 864 | example `example 40` | Layer CN.3 / Modular | `Own` | `none` | R03: admitted |
| 867 | example `example 41` | Layer CN.3 / Modular | `Own` | `none` | R03: admitted |
| 872 | theorem `exists_millerBasis` | Layer CN.3 / Modular | `Own` | `(k : ℕ) (hk : Even k)` | Signature/body read; target cases above |
| 879 | theorem `levelOne_congruence_sturm` | Layer CN.3 / Modular | `Own` | `(k : ℕ) (p : ℕ) (hp : p.Prime) (f : integralModularLattice (k : ℤ)) (h : ∀ n ≤ k / 12, ∃ a : ℤ, (p : ℤ) ∣ a ∧ (qExpansion 1 (f : ModularForm 𝒮ℒ (k : ℤ))).coeff n = a)` | Signature/body read; target cases above |
| 887 | def `HasLevelOnePrimeRecurrence` | Layer CN.3 / Modular | `Own` | `(k p : ℕ) (T : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ)))` | Signature/body read; target cases above |
| 891 | theorem `heckeRecurrence_unique` | Layer CN.3 / Modular | `Own` | `(k p : ℕ) (T U : Module.End ℂ (CuspForm 𝒮ℒ (k : ℤ))) (hT : HasLevelOnePrimeRecurrence k p T) (hU : HasLevelOnePrimeRecurrence k p U)` | Signature/body read; target cases above |
| 896 | example `example 42` | Layer CN.3 / Modular | `Own` | `none` | R03: admitted |
| 900 | theorem `weight26_coeff_107` | Layer CN.3 / Modular | `Own` | `none` | Signature/body read; target cases above |
| 906 | theorem `weight26_ordinary_107` | Layer CN.3 / Modular | `Own` | `none` | Signature/body read; target cases above |
| 914 | theorem `pointCount_eq_charSum` | Layer CN.3 / EllipticCurves | `Own` | `{F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0)` | Signature/body read; target cases above |
| 920 | theorem `frobeniusTrace_eq_neg_charSum` | Layer CN.3 / EllipticCurves | `Own` | `{F : Type*} [Field F] [Fintype F] [DecidableEq F] (hF : ringChar F ≠ 2) (W : WeierstrassCurve F) (h₁ : W.a₁ = 0) (h₃ : W.a₃ = 0)` | Signature/body read; target cases above |
| 926 | example `example 43` | Layer CN.3 / EllipticCurves | `Own` | `none` | R03: admitted |
| 937 | def `localImageSpan` | Layer CN.3 / EllipticCurves/LocalImage | `{K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic] [W.IsCharNeTwoNF]` | `(xs : List K)` | Signature/body read; target cases above; R08 |
| 941 | example `example 44` | Layer CN.3 / EllipticCurves/LocalImage | `{K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic] [W.IsCharNeTwoNF]` | `none` | R03: admitted; R08 |
| 945 | theorem `localImageSpan_le_range` | Layer CN.3 / EllipticCurves/LocalImage | `{K : Type*} [Field K] [DecidableEq K] (W : WeierstrassCurve.Affine K) [W.IsElliptic] [W.IsCharNeTwoNF]` | `(xs : List K) (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x))` | Signature/body read; target cases above; R08 |
| 953 | theorem `localImageSpan_eq_range_of_card_padic` | Layer CN.3 / EllipticCurves | `Own` | `(p : ℕ) [Fact p.Prime] [DecidableEq ℚ_[p]] (W : WeierstrassCurve.Affine ℚ_[p]) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℚ_[p]) (hxs : ∀ x ∈ xs, W.f.eval x ≠ 0 ∧ IsSquare (W.f.eval x)) (hcard : Nat.card (localImageSpan W xs) = (1 + Nat.card {x : ℚ_[p] // W.f.eval x = 0}) * (if p = 2 then 2 else 1))` | Signature/body read; target cases above; R08 |
| 962 | theorem `localImageSpan_eq_range_of_card_real` | Layer CN.3 / EllipticCurves | `Own` | `[DecidableEq ℝ] (W : WeierstrassCurve.Affine ℝ) [W.IsElliptic] [W.IsCharNeTwoNF] (xs : List ℝ) (hxs : ∀ x ∈ xs, 0 < W.f.eval x) (hcard : 2 * Nat.card (localImageSpan W xs) = 1 + Nat.card {x : ℝ // W.f.eval x = 0})` | Signature/body read; target cases above; R08 |
| 970 | def `IsPSaturated` | Layer CN.3 / EllipticCurves | `Own` | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ)` | Signature/body read; target cases above; R08 |
| 973 | example `example 45` | Layer CN.3 / EllipticCurves | `Own` | `none` | Proof body present; no Lean run; R08 |
| 977 | example `example 46` | Layer CN.3 / EllipticCurves | `Own` | `none` | R03: admitted; R08 |
| 981 | theorem `isPSaturated_iff_not_dvd_index` | Layer CN.3 / EllipticCurves | `Own` | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) (hG : G.FiniteIndex)` | Signature/body read; target cases above; R08 |
| 988 | theorem `isPSaturated_iff_forall_not_dvd` | Layer CN.3 / EllipticCurves | `Own` | `{A : Type*} [AddCommGroup A] (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A)` | Signature/body read; target cases above; R08 |
| 999 | theorem `isPSaturated_iff_forall_not_dvd_of_span_quotient` | Layer CN.3 / EllipticCurves | `Own` | `{A : Type*} [AddCommGroup A] (G : AddSubgroup A) (p : ℕ) (hp : p.Prime) {m : ℕ} (g : Fin m → A) (hg : ∀ i, g i ∈ G) (hgen : ∀ x ∈ G, ∃ b : Fin m → ℤ, ∃ y ∈ G, x = ∑ i, b i • g i + p • y)` | Signature/body read; target cases above; R08 |
| 1010 | example `example 47` | Layer CN.3 / EllipticCurves | `Own` | `none` | R03: admitted |
| 1015 | example `example 48` | Layer CN.3 / EllipticCurves | `Own` | `none` | R03: admitted |
| 1020 | theorem `mem_nsmul_iff_exists_root` | Layer CN.3 / EllipticCurves | `Own` | `(W : WeierstrassCurve ℚ) [W.IsElliptic] (p : ℕ) (hp : p.Prime) (x y : ℚ) (h : W.toAffine.Nonsingular x y)` | Signature/body read; target cases above |
| 1029 | theorem `saturationSieve_sound` | Layer CN.3 / EllipticCurves | `Own` | `{A : Type*} [AddCommGroup A] (p : ℕ) {m : ℕ} (g : Fin m → A) {ι : Type*} (C : ι → Type*) [∀ i, AddCommGroup (C i)] (ψ : ∀ i, A →+ C i) (hC : ∀ i (c : C i), p • c = 0) (b : Fin m → ℤ) (hb : ∃ y : A, ∑ j, b j • g j = p • y)` | Signature/body read; target cases above |
| 1043 | def `intervalMul` | Layer CN.4 / Intervals | `Own` | `(I J : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1049 | theorem `intervalMul_sound` | Layer CN.4 / Intervals | `Own` | `(I J : NonemptyInterval ℚ) (x y : ℝ) (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd) (hy : (J.fst : ℝ) ≤ y ∧ y ≤ J.snd)` | Signature/body read; target cases above |
| 1055 | example `example 49` | Layer CN.4 / Intervals | `Own` | `none` | Proof body present; no Lean run |
| 1059 | def `intervalInv` | Layer CN.4 / Intervals | `Own` | `(I : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1070 | theorem `intervalInv_sound` | Layer CN.4 / Intervals | `Own` | `(I J : NonemptyInterval ℚ) (h : intervalInv I = some J) (x : ℝ) (hx : (I.fst : ℝ) ≤ x ∧ x ≤ I.snd)` | Signature/body read; target cases above |
| 1074 | example `example 50` | Layer CN.4 / Intervals | `Own` | `none` | Proof body present; no Lean run |
| 1077 | def `dyadicHull` | Layer CN.4 / Intervals | `Own` | `(p : ℕ) (I : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1084 | example `example 51` | Layer CN.4 / Intervals | `Own` | `none` | Proof body present; no Lean run |
| 1089 | theorem `dyadicHull_width` | Layer CN.4 / Intervals | `Own` | `(p : ℕ) (I : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1094 | def `complexBoxSet` | Layer CN.4 / Intervals | `Own` | `(R I : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1098 | example `example 52` | Layer CN.4 / Intervals | `Own` | `none` | R03: admitted |
| 1103 | def `uniqueInteger` | Layer CN.4 / Intervals | `Own` | `(I : NonemptyInterval ℚ)` | Signature/body read; target cases above |
| 1107 | theorem `uniqueInteger_sound` | Layer CN.4 / Intervals | `Own` | `(I : NonemptyInterval ℚ) (z w : ℤ) (hz : (I.fst : ℝ) ≤ z ∧ (z : ℝ) ≤ I.snd) (h : uniqueInteger I = some w)` | Signature/body read; target cases above |
| 1111 | example `example 53` | Layer CN.4 / Intervals | `Own` | `none` | Proof body present; no Lean run |
| 1120 | def `ctTailKernel` | Layer CN.4 / ExplicitFormula | `Own` | `(x : ℝ)` | Signature/body read; target cases above |
| 1124 | example `example 54` | Layer CN.4 / ExplicitFormula | `Own` | `none` | R03: admitted |
| 1127 | theorem `ctTailKernel_pos` | Layer CN.4 / ExplicitFormula | `Own` | `(x : ℝ)` | Signature/body read; target cases above |
| 1131 | theorem `ctTailKernel_tail` | Layer CN.4 / ExplicitFormula | `Own` | `(α b : ℝ) (hα : 0 < α) (hb : 0 ≤ b) (N : ℕ)` | Signature/body read; target cases above |
| 1139 | theorem `isolatePolynomialRoots` | Layer CN.4 /  | `Own` | `(f : ℚ[X]) (hf : f ≠ 0)` | Signature/body read; target cases above; R11 |
| 1148 | theorem `platt_bounded_height` | Layer CN.4 /  | `Own` | `{q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℂ) (hs : 0 < s.re ∧ s.re < 1) (ht : \|s.im\| ≤ if Even q then max (10 ^ 8 / (q : ℝ)) (7.5 * 10 ^ 7 / (q : ℝ) + 200) else max (10 ^ 8 / (q : ℝ)) (3.75 * 10 ^ 7 / (q : ℝ) + 200)) (h0 : χ.LFunction s = 0)` | Signature/body read; target cases above |
| 1156 | theorem `platt_central_nonvanishing` | Layer CN.4 /  | `Own` | `{q : ℕ} [NeZero q] (hq : q ≤ 2000000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)` | Signature/body read; target cases above |
| 1161 | theorem `small_conductor_no_real_zero` | Layer CN.4 /  | `Own` | `{q : ℕ} [NeZero q] (hq : q ≤ 400000) (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive) (s : ℝ) (hs : 0 < s ∧ s < 1)` | Signature/body read; target cases above |
| 1171 | theorem `effectiveGram_lower` | Layer CN.4 / Gram | `{n : ℕ}` | `(A B : Matrix (Fin n) (Fin n) ℝ) (hAB : ∀ i j, B i j ≤ A i j) (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i)` | Signature/body read; target cases above |
| 1178 | theorem `loewnerGram_lower` | Layer CN.4 / Gram | `{n : ℕ}` | `(A B : Matrix (Fin n) (Fin n) ℝ) (h : (A - B).PosSemidef) (x : Fin n → ℝ)` | Signature/body read; target cases above |
| 1184 | structure `NegativeGramCertificate` | Layer CN.4 / Gram | `{n : ℕ}` | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ))` | Signature/body read; target cases above |
| 1191 | example `example 55` | Layer CN.4 / Gram | `{n : ℕ}` | `none` | R03: admitted |
| 1197 | theorem `NegativeGramCertificate.sound` | Layer CN.4 / Gram | `{n : ℕ}` | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (c : NegativeGramCertificate I) (A : Matrix (Fin n) (Fin n) ℝ) (hA : ∀ i j, ((I i j).fst : ℝ) ≤ A i j ∧ A i j ≤ (I i j).snd)` | Signature/body read; target cases above |
| 1204 | def `checkNegativeGram` | Layer CN.4 / Gram | `{n : ℕ}` | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ)` | Signature/body read; target cases above |
| 1208 | example `example 56` | Layer CN.4 / Gram | `{n : ℕ}` | `none` | R03: admitted |
| 1212 | theorem `checkNegativeGram_certificate` | Layer CN.4 / Gram | `{n : ℕ}` | `(I : Matrix (Fin n) (Fin n) (NonemptyInterval ℚ)) (t : Fin n → ℚ) (h : checkNegativeGram I t = true)` | Signature/body read; target cases above |
| 1220 | def `checkGramDataset` | Layer CN.4 /  | `Own` | `(rows : List (Σ n : ℕ, Matrix (Fin n) (Fin n) (NonemptyInterval ℚ) × (Fin n → ℚ)))` | Signature/body read; target cases above |
| 1224 | example `example 57` | Layer CN.4 /  | `Own` | `none` | Proof body present; no Lean run |
| 1227 | example `example 58` | Layer CN.4 /  | `Own` | `none` | R03: admitted |
| 1234 | theorem `multiplicityGram_lift` | Layer CN.4 /  | `Own` | `{n : ℕ} (m : Fin n → ℕ) (hm : ∀ i, 0 < m i) (A : ℝ) (Kmat : Matrix (Fin n) (Fin n) ℝ) (t : Fin n → ℝ)` | Signature/body read; target cases above |
| 1242 | example `example 59` | Layer CN.4 /  | `Own` | `none` | Proof body present; no Lean run; R15 |

## Not verifiable

- Lean elaboration, elaborated implicit arguments and proof execution: no Lean command was authorized in this read-only pass. The 25 non-admitted examples were read, not executed. Existing review metadata was not treated as proof of truth or current elaboration.
- Platt's large numerical computation and all six ordinary-companion eigensystems: source theorem statements and normalizations were checked, but the underlying large datasets/full simultaneous eigensystem certificates were not independently replayed. The finite nonordinary determinant enumeration was independently recomputed as described above.
- The complete proposed complex-root and analytic-enclosure constructions: no implementations or quantitative remainder contracts are present to validate. The visible existential signatures do not establish executable termination (R11), and R21 identifies missing analytic prerequisites.
- Some scanned formulas in deWeger and LLL82 have degraded OCR. Their section/theorem locations and surrounding mathematical statements were readable; every symbol in the full algorithms was not certified. No source was inaccessible, paywall bypassed, or missing-reference request left pending.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6f8b9e077f17c4839cf9914544c2f9c48b43614e", "job": "RT-ComputationalNumberTheory~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
