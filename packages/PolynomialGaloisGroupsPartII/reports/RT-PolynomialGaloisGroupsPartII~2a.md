<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/171#issuecomment-6353216251 -->
Red team round 2 pass a (codex) of 133e06d

Verdict: needs_changes

1. **F01** (P3) Checks and elementary API declarations pad the acceptance test

   **Location:** `packages/PolynomialGaloisGroupsPartII/Suggested.lean:49`: “theorem equalPartMerging_forbidden”; line 95: “σ ∈ BadTransitive α”; line 382: “:= h r hr”.

   **Claim:** These declarations are suitable acceptance-test milestones.

   **Witness:** `badTransitive_witness` is exactly `⟨G, ht, ha, hs, hσ⟩`; `goodEvent_five_four` is already proved by `h r hr`. The forbidden merging and the named small-degree computations reproduce README Checks.

   **Exact repair text:** Delete the padding declarations from `Suggested.lean`; keep their mathematical statements as prose API targets or Checks in the README, without undeclared backticked local identifiers. Do not turn the padding into proved theorem declarations. The following is the exact deletion inventory (45 theorem declarations and 15 routine examples); the declaration audit below computes their values. Retain the nontransitivity example at line 30 and the two occurrence-sensitive event examples at lines 319 and 337 as the three nontrivial definition tests.

   | Delete from Suggested.lean | Witness for classification |
   |---|---|
   | `equalPartMerging_forbidden`, `mergePerms_identity`, `mergePerms_five_cycle`, `badTransitive_small_degree`, `badTransitive_identity_five`, `badTransitive_five_cycle` | Named mirrors of README §§0.1–0.3 Checks, including boundary degrees and one five-cycle. |
   | `maxFactorMultiplicity_repeated_distinct`, `maxFactorMultiplicity_zero`, `maxFactorMultiplicity_unit` | Polynomial values 3,1,0,0; zero proof already is `simp`; unit proof is the same after `normalizedFactors_of_isUnit` (Mathlib/RingTheory/UniqueFactorizationDomain/NormalizedFactors.lean:306). |
   | `tupleRootField_quadratic`, `tupleRootField_split`, `tupleRootQuotient_all_roots_monic`, `tupleRootQuotient_nonmonic`, `kfold_cyclotomic_eleven`, `kfold_repeated_quadratic` | The exact README field, endpoint quotient, Φ₁₁ and repeated-quadratic Checks. |
   | `partitionLaw_singleton`, `goodEvent_log_one`, `goodEvent_two_three`, `minSupport_alternating_three`, `minSupport_symmetric_two`, `orbitalDistinguishers_symmetric` | The exact singleton-law, degree-one, `{3,3}`, A₃, S₂ and symmetric-stabilizer Checks. |
   | `EqualPartMerging.pullback_submultiset`, `mergePerms_mono`, `mergePerms_card`, `mergePerms_conj`, `mergePerms_permCongr`, `badTransitive_witness`, `badTransitive_conj`, `badTransitive_permCongr` | Definition API, not headline results. The witness constructor is immediate; the two full-cycle invariances are `simpa [MergePerms]` from TauCeti/GroupTheory/Perm/Partition.lean:392,406. |
   | `maxFactorMultiplicity_le_iff`, `maxFactorMultiplicity_eq_one_iff`, `tupleRootQuotient_factor`, `tupleRootQuotient_natDegree`, `tupleRootQuotient_separable`, `IsKFoldIrreducible.one_iff` | Finite-maximum and remaining-root API; the bound iff is `simp [maxFactorMultiplicity, Finset.sup_le_iff]` (Mathlib/Data/Finset/Lattice/Fold.lean:99). These remain README subsidiary targets. |
   | `PartitionLaw.pair_diagonal`, `goodEvent_one_diagonal`, `goodEvent_two_complement`, `goodEvent_five_four` | Specialization of a structure field, diagonal substitution, multiset sum conservation, and literal application `h r hr`. The file’s line-283 proof already demonstrates the diagonal specialization. |
   | `minSupport_eq_none`, `minSupport_eq_some`, `minSupport_le`, `minSupport_two_le`, `orbitalDistinguishers_symm`, `orbitalDistinguishers_subset_support` | Minimum-definition/attainment and stabilizer-transport API, not headline theorems; `minSupport_le` extracts the right conjunct of the preceding iff. |
   | Examples at lines 27, 61, 116, 151, 154, 182, 207, 224, 254, 258, 283, 291, 407, 430, 439 | Routine value, empty/singleton, guard, field-specialization and diagonal tests. Their bodies are present and were read; proving a boundary Check does not turn it into an acceptance headline. |

   Deleting these leaves all thirteen headline signatures and all thirteen required real-bodied definitions/structures/instances. No mathematical conclusion is weakened.

2. **F02** (P2) The Mertens gap now requests an existing supplier target

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:238`: “What AnalyticNumberTheoryPartI must provide (gap:mertens-prime-product)”; `packages/PolynomialGaloisGroupsPartII/design/plan.json:4`.

   **Claim:** The exact bounded-error Mertens product and identification of its coefficient remain missing supplier work.

   **Witness:** `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:596`, §0.26, already states the reciprocal product as exp(γ) log x + O(1), x≥2; line 598 explicitly requires identifying κ=γ and the tilted-product, prime-tail and Euler-constant comparisons.

   **Exact repair text:** “From AnalyticNumberTheoryPartI, §0.26 (Mertens’s third theorem): there are absolute D≥0 and x₀≥2 such that for real x≥x₀, the inclusive reciprocal prime product differs from exp(Real.eulerMascheroniConstant) log x by at most D. The supplier owns the coefficient-identification proof.” Replace this gap’s references by §0.26 and remove only its `gaps` entry. For x=n^(1/8), the error remains D and the leading term remains exp(γ) log n/8, exactly what §3.4 uses.

   Re-raised: F02 (pass a) in the repair report. Its reason says the exact theorem must still be supplied. At the supplier’s indexed open head it is already a target, including the coefficient proof. A planned supplier target is an admissible contract; this finding does not demand implementing it in this package. The gap is precise and consistently registered, but is no longer minimal.

3. **F03** (P3) The divisor supplier name has drifted

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:230`: “`eventualDivisorSubpower` supplies”; also lines 44 and 822.

   **Claim:** ErdosProgressionPowers §0.9 contains that named declaration.

   **Witness:** The supplied head’s `TauCetiRoadmap/ErdosProgressionPowers/README.md:514` contains the eventual divisor-subpower statement in prose. Neither that README nor its complete Suggested.lean contains `eventualDivisorSubpower`. The section and the mathematical bound do exist.

   **Exact repair text:** “ErdosProgressionPowers, §0.9, eventual divisor-subpower bound: for each η>0, τ(n)≤n^η for every sufficiently large positive n, including nonsquarefree n. Enlarge the constant over the finite positive exceptions.” Remove the obsolete backticked name at all three occurrences. At n=p^a, the counted divisors are a+1; the eventual and finite-exception arguments cover this instance unchanged. Alternatively the earlier AnalyticNumberTheoryPartI §3.26 directly supplies the all-positive-integer bound.

4. **F04** (P3) README API identifiers and the module contract disagree with the acceptance file

   **Location:** `packages/PolynomialGaloisGroupsPartII/README.md:270`: “Prove `EqualPartMerging.refl`”; `packages/PolynomialGaloisGroupsPartII/Suggested.lean:8`: “light definitions and representative theorem signatures ... it is not exhaustive.”

   **Claim:** Backticked local target names are declared in Suggested.lean, and that file specifies the finished roadmap’s headline acceptance theorems.

   **Witness:** No declaration supplies `EqualPartMerging.refl`, `mem_mergePerms`, `mem_badTransitive`, `count_le_maxFactorMultiplicity`, or `tuple_stabilizer_eq_fixingSubgroup`. The module instead promises representative signatures and gives no headline inventory or missing-carrier account.

   **Exact repair text:** Replace undeclared local API identifiers by prose descriptions, including merging reflexivity/monotonicity/sum conservation/equality below two; membership APIs; factor-count bound; higher-irreducibility monotonicity/degree bound; law constant enlargement/κ weakening; and orbital membership. Describe fibre cardinality, tuple stabilizers, uniform harmonic intervals, the four individual anatomy failure bounds, orbital connectivity and block-orbit arithmetic in prose as well; their statements and section locators remain unchanged. Keep the mathematical specifications and locators. Replace the module opening by:

   ```lean
   /-!
   # PolynomialGaloisGroupsPartII: target signatures

   The roadmap is README.md; this file is not the roadmap. It states the roadmap’s
   headline theorems against the pinned Mathlib and Tau Ceti APIs. All headline
   theorems are statable here using the real-bodied definitions below. The complete
   API and subsidiary proof targets are specified in the README.
   -/
   ```

   Replace README lines 51–53 consistently: “Suggested.lean states the headline acceptance theorems and the simple definitions needed to express them; this README specifies the complete API and proof obligations.” This repair preserves, for example, the three-part merging counterexample and all subsidiary specifications without adding the padding prohibited in S01.

## Verification of the earlier findings

Review identifiers below use `a` and `b` for the two first-round passes. Quotations are from the reviewed head. “Repaired” concerns the original defect, not the newly introduced padding.

| Earlier finding | Status at this head | Repaired passage and independently checked witness |
|---|---|---|
| a F01, admitted examples | Repaired; new S01 regression | Suggested.lean:28: “by decide, by decide, by simp”; all 18 examples now have proofs. None contains `sorry`; former hard Checks became named admitted theorems, which S01 removes. |
| a F02, missing Mertens supplier | Partly repaired; S02 | README:238: “What AnalyticNumberTheoryPartI must provide (gap:mertens-prime-product)”. The matching slug, supplier, section and coefficient obligation occur in design/plan.json:4. The supplier’s §0.26 now already owns the whole estimate. |
| a F03, stale divisor owner | Partly repaired; S03 | README:228: “From ErdosProgressionPowers, §0.9”; that head’s README:514 supplies τ(n)≤n^η eventually for every η>0. The appended Lean name has disappeared at that head. Finite exceptions still yield Dη≥1. |
| a F04, wrong pins | Repaired | README:116: “6b7abb3c7686292736be2955bd3eb9ebf63b456a”; README:161: “a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039”. Both equal lake-manifest.json and the two library HEADs. |
| a F05, missing Check mirrors | Repaired under the earlier instruction; S01 supersedes the requested expansion | Suggested.lean:224: “¬ IsKFoldIrreducible f 0 ∧ ¬ IsKFoldIrreducible f k”; lines 32, 49, 78, 90, 116, 154, 167, 171, 202, 254, 365 and 439 cover the formerly missing instances. The new rules keep Checks primarily in prose. |
| a F06, zero-index harmonic control | Repaired | README:680: “total real inversion makes an added zero term numerically invisible”. The two sums are 1+1/2=3/2 and 0+1+1/2=3/2. |
| a F07, omitted support headlines | Repaired | Suggested.lean:452: “theorem babai_distinguishers”; line 457: “theorem bochert_minSupport”. Printed signatures retain n≥5/non-double-transitivity and n≥38/alternating noncontainment, respectively. |
| a F08, missing manifest | Repaired | sources.toml:1: “schema = "tauceti-roadmap-sources/v1"”. Four unique work keys carry legal provenance, hashes and explicit preprint/exposition numbering. All four cached source texts were read at their cited passages. |
| a F09, nondiscriminating fifth-event Check | Repaired | README:735: “The partition `{1,2}` of three at `α = 1` passes the one-witness variant”. At r=2 the qualifying count is 1; at r≥3 it is 2. All are <4, while 1 lies between 1/3 and 3/log 3. |
| a F10, undocumented instance | Repaired | Suggested.lean:247: “The finite partition carrier has the discrete measurable structure.” README:78 names `partitionMeasurableSpace`; its body is `⊤`. |
| a F11, Dedekind ownership | Repaired | README:27: “NumberFieldArithmetic, §3.10, owns the factorization/cycle-type equality”. Completed/NumberFieldArithmetic/README.md:1039 and TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164 impose polynomial-discriminant nondivisibility; the parent imports it. |
| b F01, twelve easy admitted examples | Repaired; S01 limits their retention | Suggested.lean:117: “by simp [maxFactorMultiplicity]”; lines 28, 30–42, 63, 151, 185, 256, 283–294, 319–335, 363, 408, 430–433 contain real proofs corresponding to the supplied probes. |
| b F02, redundant separability | Repaired | Suggested.lean:503: “(hirr : Irreducible (A.map (Int.castRingHom ℚ)))”; no `hsep` binder remains in the certificate. Mathlib/FieldTheory/Separable.lean:509 gives `hirr.separable`. Optional positive fibre/cycle hypotheses remain consistently explicit. |
| b F03, invented downstream owner | Repaired | README:1351: “A continuation of ArithmeticStatistics for random polynomials would use the certificate”. No invented RandomPolynomials roadmap name or dependency remains. |
| b F04, temporal/process wording | Repaired | README:195: “From Tau Ceti, cycle-fibre arithmetic”. The six “current” occurrences and research-blueprint links are absent. |

## Verified sound

Read all 1,387 README lines and all 525 Suggested.lean lines, both repository rule documents, both earlier reviews and the complete repair report. The actual Lean inventory is **89 explicit declarations: 58 theorems (54 admitted, four proved), nine definitions, two abbreviations, one structure, one local instance, and 18 proved examples**. The README has **32 numbered mathematical target groups**, no bold mathematical target headings, and **41 Check bullets**, all evaluated below. All **32 target locator blocks** were resolved against **20 grouped passages in four legal cached works**. The 10 PartitionLaw fields were checked individually. **Seven cross-roadmap contract claims** were resolved: parent Layers 0,1,5,9, NumberFieldArithmetic §3.10, the ErdosProgressionPowers §0.9 claim, and the Mertens supplier. Two further supplier targets (§0.26 and §3.26 of AnalyticNumberTheoryPartI) were inspected. The name/gap defects are S02–S03.

The thirteen headline signatures are §0.4 equivariant cycle fibres; §1.3 ramified merging; §§2.4–2.5 higher-transitivity and alternating recognition; §3.4 nonsmooth harmonic mass; §3.9 four nondivisible parts; §§4.4–4.6 Babai, Bochert and primitive support bounds; §§5.2–5.3 primitive and imprimitive exclusions; and §§6.1–6.2 the arbitrary-law criterion and Galois certificate. All thirteen are present and statable on pinned carriers. The other anatomy estimates, tuple restriction, orbital connectivity and block-union arithmetic are subsidiary proof targets; their omission is not treated as an absent-headline defect. S04 fixes how their README-only identifiers are presented.

No false headline, lost hypothesis in a printed signature, sorry-defined data, placeholder predicate, algorithm specification, `lemma` declaration or `set_option` was found in the package's two mathematical files. The trivial, degree-zero, characteristic-two, inseparable and infinite-measure cases do not contradict any headline: the actual restrictions and computations are recorded below. The finite-action and field assumptions exclude infinite carriers and the zero coefficient ring. A zero source ring in §1.2 has no unital homomorphism to its field target. Flatness, smoothness, schemes, topological groups and universe shifts do not occur in these targets.

The required dependency check exited 0:

```text
depcheck: 14 roadmaps, 103 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The current order already permits both named suppliers; S02's replacement uses the same earlier supplier. The read-only git diff at the reviewed head contains only seven files inside packages/PolynomialGaloisGroupsPartII (2,241 insertions). No package source, manifest, merge-order or git state was edited in this review; the report is the only added repository file. No Lean process or build was run.

### Declaration and binder audit

All line numbers in this table refer to packages/PolynomialGaloisGroupsPartII/Suggested.lean. Context `A` means universe-polymorphic α with Fintype and DecidableEq; `B` adds an independently polymorphic finite decidable β. `F` means universe-polymorphic F with Field F and explicit polynomial f. `P` means the fixed discrete partition measurable structure, never an arbitrary σ-algebra. Explicit hypotheses appear after the context abbreviation. Each row is one actual declaration, including anonymous examples.

The supplied signature transcript was read in full and compared with every corresponding README statement. It prints **70 real named signatures**, plus a spurious `signatures` entry parsed from docstring line 9; its error concerns that spurious scratch `#check`, not the package. It omits the local instance. Thus its advertised “71” does not certify 71 actual named declarations. The omitted instance has explicit n and body ⊤ and was audited directly. The 18 examples were inspected with their binders and proofs. No fresh elaboration is claimed.

| Line / layer | Declaration | Context retained | Instances and computed values on both sides | Result / change |
|---|---|---|---|---|
| 22 / 0 | EqualPartMerging | y:ℝ; a,b:Multiset ℕ | ∅→∅ at y=−1: blocks ∅, sums 0=0; {0,0}→{0} at y=2: block cardinal 2, output sum 0; {1,2}→{3}: equality-of-entries demands 1=2 | Real body; no positivity assumption silently added |
| 27 / 0 | example, permitted merging | Closed | Block sizes 1,1,1,2,1≤2; block sums {1,1,2,4,3}, total 11=11 | True; S01 delete routine example |
| 30 / 0 | example, nontransitivity and empty input | Closed; ∀y:ℝ in last conjunct | {1,1,2}→{2,2}→{4}: sums 4=4=4; direct single block would require 1=2; empty blocks have sums 0=0 for every y | True; retain nontrivial definition test |
| 45 / 0 | EqualPartMerging.pullback_submultiset | y,a,b,v; merging and v≤b | a={1,1,2}, b={2,2}, v={2}: preimage can be {1,1} or {2}; each sum 2=2; v=∅ gives u=∅, 0=0 | True; S01 API deletion |
| 49 / 0 | equalPartMerging_forbidden | Closed | Total 11=11 passes; a 6-block requires 3 copies of 2 (>2 allowed), 2 copies of 3 (>1 available), or six 1s (>2 available) | True; S01 Check deletion |
| 54 / 0 | MergePerms | A,n,y,ρ | Fin 0: parts ∅=full type ∅; Fin 2 identity: full type {1,1}, not ∅; degree-1 ρ versus Fin 2: sums 1≠2 | Real body; degree mismatch excluded by relation |
| 57 / 0 | mergePerms_identity | A; ρ:Partition(card α) | n=2: ρ={1,1} gives True↔True; ρ={2} gives False↔False; n=0 gives True↔True | True; S01 boundary Check deletion |
| 61 / 0 | example, empty permutation | σ:Perm(Fin 0) | Input ∅, output ∅, witness ∅; degree 0=0 | True; S01 delete |
| 65 / 0 | mergePerms_mono | A,n,y,z,ρ; y≤z | {1,1}→{2}: bound 1 rejects, bound 2 accepts; bound 2→3 preserves the size-2 witness | True; S01 API deletion |
| 68 / 0 | mergePerms_card | A,n,y,ρ,σ; membership | ρ={1,2}, σ=(12) in S₃: sum 3=card 3; using the same ρ on Fin 4 gives 3≠4, hence no membership | True; S01 API deletion |
| 71 / 0 | mergePerms_conj | A,n,y,ρ,g,σ | In S₃, (123)(12)(123)⁻¹=(23); both full types {1,2}; merging truth values equal | True; native fullCycleType_conj; S01 delete |
| 74 / 0 | mergePerms_permCongr | B,n,y,ρ,e,σ | Relabel the Fin 2 swap onto {a,b}: full types {2}={2}; identity types {1,1}={1,1} | True; native fullCycleType_permCongr; S01 delete |
| 78 / 0 | mergePerms_five_cycle | σ:Perm(Fin 5); type={5} | Singleton block {5}, cardinal 1≤1, sum 5=5 | True; S01 Check deletion |
| 82 / 0 | BadTransitive | Explicit A | n=0,1: A=S={1}, union empty; n=5: C₅ contains identity and 5-cycle, orders 5≠60≠120 | Real existential union, not an odd-permutation test |
| 86 / 0 | badTransitive_small_degree | n≤3 | n=0,1: only group has order1; n=2: transitive order2=S₂; n=3: transitive orders3,6=A₃,S₃; union ∅=∅ | True; S01 boundary deletion |
| 88 / 0 | badTransitive_identity_five | Closed | 1∈C₅, card(C₅)=5 versus card(A₅)=60 and card(S₅)=120; existential True | True; S01 Check deletion |
| 90 / 0 | badTransitive_five_cycle | σ:Perm(Fin5); type={5} | Generated subgroup has orbit cardinal5 and order5; both prohibited equality tests False | True; S01 Check deletion |
| 93 / 0 | badTransitive_witness | A,G; transitive, G≠A, G≠top, σ∈G | G=C₅,σ=1 supplies exactly the five fields; conclusion witness is (C₅,transitivity,5≠60,5≠120,1∈C₅) | Definition constructor; S01 delete |
| 97 / 0 | badTransitive_conj | A,g,σ | C₅→gC₅g⁻¹ keeps order5, orbit5 and element membership; identity conjugates to identity | True; S01 API deletion |
| 100 / 0 | badTransitive_permCongr | B,e,σ | Label change preserves subgroup orders5,60,120 and orbit cardinal5; both existential truth values True | True; S01 API deletion |
| 104 / 0 | equivariant_cycle_fibres | B,σ,ψ,r; surjective/equivariant; d,m>0; typeψ={d}; all fibres m | (d,m)=(1,2): return sizes {1,1} or {2}, types {1,1} or {2}; (3,2): lengths {3,3} or {6}; sizes sum2=m | True; all needed binders explicit |
| 113 / 1 | maxFactorMultiplicity | Field F; f | f=0,1: factors ∅, max0; (X+1)³/F₂: count3; X(X−1)/F₃: two distinct counts1, max1 | Real body; factor degrees do not replace factors |
| 116 / 1 | example, zero/unit values | Closed over F₂ | sup∅=0 at 0 and 1; conjunction 0=0 and 0=0 | True; S01 delete |
| 119 / 1 | maxFactorMultiplicity_repeated_distinct | Closed F₂/F₃ | max{3}=3 and max{1,1}=1; degree-count mutation gives2 in second case | True; S01 Check deletion |
| 122 / 1 | maxFactorMultiplicity_zero | Field F | normalizedFactors 0=∅; sup∅=0 | Already simp proof; S01 delete |
| 125 / 1 | maxFactorMultiplicity_unit | Field F,f; IsUnit f | f=C 2 over ℚ: factors∅, max0; f=X is excluded (nonunit) with max1 | True; S01 delete |
| 128 / 1 | maxFactorMultiplicity_le_iff | Field F,f,m | f=(X+1)³: m=2 gives 3≤2↔3≤2=False; m=3 gives True↔True; f=1 gives 0≤m↔empty universal=True | Finset.sup_le_iff; S01 delete |
| 131 / 1 | maxFactorMultiplicity_eq_one_iff | Field F,f; f≠0, nonunit | X(X−1)/F₃ gives 1=1↔squarefree=True; (X+1)³/F₂ gives 3=1↔squarefree=False; unit1 would give False↔True and is excluded | True; S01 API deletion |
| 134 / 1 | ramified_merging | A:ℤ[X], monic, ℚ-separable, positive degree; p, Fact prime | X²−2,p=2: reduction X², degrees{1,1}, M=2, possible types{1,1},{2}; X−1,p=3: M=1,{1}={1}; A=1 excluded by degree0 | True including ramification |
| 148 / 2 | TupleRootField | F,f,j,x embedding | j=0: adjoin∅=⊥; root √2: degree2; selected root0 of X(X−1): degree1/base field | Actual adjoin, not a free extension |
| 151 / 2 | example, empty tuple field | F,f; x:Fin0↪roots | range∅=∅, adjoin∅=⊥, including f=0 | True; S01 delete |
| 154 / 2 | example, singleton field | F,f; x:Fin1↪roots | Fin1 has sole index0; range={x₀}; both adjoins equal F⟮x₀⟯ | True; S01 delete |
| 167 / 2 | tupleRootField_quadratic | Closed ℚ,X²−2; one-root x | Both roots ±√2 generate degree2 fields; finrank2=2 | True; S01 Check deletion |
| 171 / 2 | tupleRootField_split | Closed ℚ,X(X−1); one-root x | Root0 or1 is rational; adjoinℚ{0}=adjoinℚ{1}=⊥ | True; S01 Check deletion |
| 176 / 2 | tupleRootQuotient | F,f,j,x | j=0: f/ₘ1=f; 2X(X−1),j=2: quotient2; X²−t in characteristic2,j=1: quotient X−√t, despite original inseparability | Real body on all f; later separability explicit |
| 182 / 2 | example, empty quotient | F,f; empty x | f=0 gives0=0; f=C2 givesC2=C2; f=X²−2 unchanged after map | True; S01 delete |
| 187 / 2 | tupleRootQuotient_all_roots_monic | F,f monic/separable; tuple length degree | f=1,j=0:1/1=1; X²−2,j=2:(X²−2)/((X−√2)(X+√2))=1 | True; S01 endpoint Check deletion |
| 190 / 2 | tupleRootQuotient_factor | F,f separable,j,x | 2X(X−1),j=1 root0: [2(X−1)]X=2X(X−1); j=0: f·1=f | True; S01 API deletion |
| 195 / 2 | tupleRootQuotient_natDegree | F,f separable,j,x | 2X(X−1): j=0,1,2 gives degrees2,1,0 = 2−j; no embedding j>2 exists | True; natural subtraction never masks an admissible excessive j; S01 delete |
| 199 / 2 | tupleRootQuotient_separable | F,f separable,j,x | X(X−1)/F₂ gives quotients X(X−1),X−1,1; all separable (derivative1,1,0 with unit gcd) | True; S01 API deletion |
| 202 / 2 | tupleRootQuotient_nonmonic | Closed ℚ,2X(X−1); two-root tuple | Remaining polynomial C2=C2, not1 | True; S01 Check deletion |
| 207 / 2 | example, singleton quotient | F,f; one-root x | Product over Fin1 equals X−x₀; both sides f/ₘ(X−x₀) | Definition simplification; S01 delete |
| 213 / 2 | IsKFoldIrreducible | F,f,k | f=X,k=0: guard1≤0 False; k=1: irreducible quotient X True; k=2:2≤1 False; inseparable X²−t/F₂(t): separability False | Real guarded predicate |
| 218 / 2 | kfold_cyclotomic_eleven | Closed ℚ | Φ₁₁ degree10, C₁₀ transitive; root stabilizer order1 has nine singleton complement orbits, so k=1 True, k=2 False | True; S01 Check deletion |
| 221 / 2 | kfold_repeated_quadratic | Closed ℚ | (X²−2)² has degree4, two distinct roots, repeated multiplicity2; separability False, hence kfold False | True; S01 Check deletion |
| 224 / 2 | example, degree guards | F,f,k; degree<k | f=X: k=0 false by1≤0; k=2 false by2≤1 | Direct conjunction extraction; S01 delete |
| 231 / 2 | IsKFoldIrreducible.one_iff | F,f separable, degree>0 | X: True↔True; X(X−1): False↔False; empty-tuple quotient equals mapped f | True; S01 API deletion |
| 234 / 2 | kfold_iff_multiplyPretransitive | F,f separable, degree>0,1≤k≤degree | X/F₂,k=1: True↔True; X²+X+1/F₂,k=1,2: C₂ acts transitively on 2 roots and 2 ordered pairs, True↔True; split quadratic k=1:False↔False | True; guards forbid k>n vacuity |
| 240 / 2 | kfold_degree_sub_two | F,f separable, degree≥3 | X³−2/ℚ: n−2=1, irreducible True and A₃≤S₃ True; X(X−1)(X+1)/ℚ: False↔False; n=2 excluded, since n−2=0 | True; faithful image explicit |
| 248 / 3 | partitionMeasurableSpace | Explicit n | n=0: one partition, both subsets measurable; n=2: two partitions, all 2²=4 subsets measurable | Real ⊤ instance; absent from supplied printed transcript |
| 251 / 3 | harmonicMass | Boolean f,m | false,m=0 or4 gives0; indicator2,m=4 gives1/2; true,m=2 gives3/2; including index0 adds0 | Real sum; corrected zero-index Check |
| 254 / 3 | example, harmonic values | Closed | 1/2=1/2 and1+1/2=3/2 | True; S01 delete |
| 258 / 3 | example, zero indicator | m:ℕ | m=0:empty sum0; m=2:0+0=0 | True; S01 delete |
| 261 / 3 | PartitionLaw | P,n,ν,C,t,κ,δ | C=1,t=1/2,κ=1,δ=1/10: seven range fields True; ν=0 makes event masses0≤positive RHS; n=1 has no k,l,m in tested ranges, so Dirac{1} satisfies law; probability still separate | Ten fields retained; infinite ν.real may totalize to0 and is excluded only at probability endpoints |
| 279 / 3 | partitionLaw_singleton | P,law;4≤n/log n | Indicator2 gives L=1/2, count=countρ2; RHS C exp(−κ/2); for κ=1,C=1 it is≈0.60653 | True; S01 Check deletion |
| 283 / 3 | example, diagonal law | P,law,n≥8 | {2,2,4}:count2=2, event True; {2,6}:count2=1, event False; denominator2·2=4 | True; S01 delete |
| 291 / 3 | example, zero-indicator law | P,law;7≤n/log n | L=0,count=0; event0≤0=univ; RHS C exp0=C, normalized LHS1 | True; S01 delete |
| 296 / 3 | PartitionLaw.pair_diagonal | P,law,k≥2,k≤n/4 | k=2,n=8: pair multiset{2,2}≤ρ iff count≥2; RHS C/(2²)=C/4 | True; S01 field specialization deletion |
| 302 / 3 | GoodEvent | i:Fin5,n,t,κ,δ,α | At n=0,α=0: E₁,E₂,E₃,E₄ True (no parts, zero thresholds), E₅ False (count0<4); n=1 E₃ threshold0 and count0; remaining five README tests below | Real five-branch sets; no out-of-range index |
| 319 / 3 | example, two occurrence models | ρ,η:Partition8; specified parts | {2,2,4}:gcd2=2<1 False; {2,6}:only eligible part2 once, no two-occurrence pair, E₁ True | True; retain discriminating example |
| 337 / 3 | example, one versus four witnesses | ρ:Partition3;parts={1,2} | Lower endpoint3⁻¹=1/3; upper≈2.7307; r=2 count1, r≥3 count2; both≥1 but<4 | True; retain discriminating example |
| 362 / 3 | goodEvent_log_one | ρ:Partition1 | log1=0; interval lower1>upper1/0=0, count0; required0≤0 True | True; S01 boundary deletion |
| 365 / 3 | goodEvent_two_three | ρ:Partition6;parts={3,3} | r=2,j=1,u={3}: sum3=6·1/2; forbidden inequality3≠3 False | True; S01 Check deletion |
| 372 / 3 | goodEvent_one_diagonal | P,ρ,E₁; cutoff≤k≤n/4 | n=8,κa=0,k=2: duplicate makes gcd2≥cutoff1, contradicting E₁; {2,6} has count1≤1 | True; S01 API deletion |
| 376 / 3 | goodEvent_two_complement | ρ:Partition n;u≤parts | {3,3}−{3} has sum3=6−3; u=∅ gives6=6−0; u=whole gives0=6−6 | True; S01 API deletion |
| 379 / 3 | goodEvent_five_four | P,ρ,E₅;r≥2 | At each r the hypothesis already reads4≤the identical filtered cardinal; on {1,2},r=2 both conditions4≤1 are False | Exact application; S01 delete |
| 384 / 3 | nonsmooth_harmonic_mass | ∃N≥3 before all n | At n=10⁸: cutoff3333.333, prime threshold10 excludes smooth prime2 and includes prime11; asymptotic coefficient1/2−exp(γ)/8≈0.277366>0.25, margin≈0.027366 log n | True eventually; do not assert the unknown N equals10⁸; S02 supply repair |
| 392 / 3 | four_nondivisible_parts_failure | P; fixed C,t,κ,δ,ε; ∃B,N before n,ν,θ; probability+law | δ=.1,ε=.02,κ=1: θ=0 gives α=.025; θ=.03 givesα=.01; r=2 exponent−α, r≥3 exponent≤−4α/3, large-r union exponent−2α+α=−α | Uniform rates match; no lost probability binder |
| 402 / 4 | minSupport | A,G | G=⊥:none; S₂:nonidentity support set{2}, some2; A₃:{3},some3; regular Q₈:{8},some8 | Real attained minimum; excludes identity |
| 407 / 4 | example, empty carrier | Closed | S₀ has one element1; nonidentity set∅; result none=none | True; S01 delete |
| 410 / 4 | minSupport_alternating_three | Closed | A₃ nonidentities (123),(132), supports3,3; min3 | True; S01 Check deletion |
| 412 / 4 | minSupport_symmetric_two | Closed | S₂ sole nonidentity swap has support2; min2 | True; S01 Check deletion |
| 414 / 4 | minSupport_eq_none | A,G | ⊥:True↔True; S₂:some2≠none and G≠⊥, False↔False | True; S01 definition API deletion |
| 416 / 4 | minSupport_eq_some | A,G,m | S₃,m=2:attained2 and2≤{2,3}; m=3:attained3 but3≤2 False, so iff False↔False; ⊥ has no attaining element | True; S01 definition API deletion |
| 420 / 4 | minSupport_le | A,G;minimum some m;σ∈G,σ≠1 | S₃: m=2, swap2 gives2≤2; 3-cycle gives2≤3 | Direct extraction; S01 delete |
| 423 / 4 | minSupport_two_le | A,G;minimum some m | S₂:2≤2; A₃:2≤3; regular Q₈:2≤8; ⊥ has no some m | True; S01 API deletion |
| 427 / 4 | orbitalDistinguishers | A,G,x,y | x=y gives∅; G=⊥,x≠y givesΩ; S₃ gives{x,y},size2; regular C₅ givesΩ,size5; D₅ gives size4 (one reflecting stabilizer transports) | Real stabilizer condition; nonabelian test included |
| 430 / 4 | example, trivial group | A,x≠y | Only g=1; equation g x=y is x=y False at every z, hence all n points distinguish | True; S01 delete |
| 435 / 4 | orbitalDistinguishers_symmetric | A,x≠y | S₂:both endpoints, cardinal2; S₃:third point fixed by swap(x,y), so D={x,y},card2 | True; S01 Check deletion |
| 439 / 4 | example, diagonal | A,G,x | g=1 fixes x and every z; each negated-existence test False; finset∅ | True; S01 delete |
| 445 / 4 | orbitalDistinguishers_symm | A,G,x,y | S₃:(0,1)/(1,0) each D={0,1}; D₅ both ordered pairs have same four distinguishers by inverse reflection | True; S01 API deletion |
| 448 / 4 | orbitalDistinguishers_subset_support | A,G,g∈G,x | S₃,g=(01),x=0: D={0,1}=support; x=2: D=∅⊆{0,1}; g=1:∅⊆∅ | True; S01 API deletion |
| 452 / 4 | babai_distinguishers | A,G primitive, not2-transitive,n≥5,x≠y | C₅:D=5≥√5/2≈1.118; D₅:D=4≥1.118; S₂₅ has D=2<2.5 but fails non-double-transitivity | True; essential exception tested |
| 457 / 4 | bochert_minSupport | A,G2-transitive,A not≤G,n≥38,min=m | AGL₁(F₄₁):n=41,m=40≥10.25; Sn:m=2<n/4 at n=40, excluded by A≤G; m=4,…,9 yields upper n≤22,23,26,29.5,33.2,37 | True; denominator m−3>0 before cancellation |
| 462 / 4 | primitive_minSupport | A,G primitive,G≠A/top,n≥5,min=m | C₅:m=5≥.618; D₅:m=4≥.618; n=37 target≈2.541<4; n=38 n/4=9.5≥(√38−1)/2≈2.582 | True in both branches |
| 469 / 5 | primitive_exclusion | t>0,0<κ≤1,0<δ≤.1,0<ε<δ/2; uniform N; E₁,E₄ | δ=.1,κ=1,θ=0:κα=.025<.125; chosen p>n^.125 exceeds merge factor. k=p², other cycles prime-to-p: power p·q leaves p cycles of length p, support p²=k, not p | Cutoff and prime-power reasoning sound |
| 480 / 5 | imprimitive_exclusion | Same deterministic range; all five events; transitive/nonprimitive G | θ=0,α=.025: δ/2−α−θ=.025=α; strict middle r cutoff supplies strict gcd bound. At θ=.03,α=.01: large-range exponent1−3α−θ=.94>.01; 5−1−3=1 and4−3=1 eligible unions | Sound four/five-witness argument |
| 491 / 6 | generalized_luczak_pyber | P; fixed parameters; ∃B,N before n,ν,θ; probability+law | δ=.1,κ=1,ε=.02 gives exponent−.025 at θ=0 and−.01 at θ=.03; subsum−δ/4=−.025, large-prime−κ/4=−.25; both dominate−α; log exponentκ=1≤2 | True conditional on named analytic supply; S02 regularizes it |
| 502 / 6 | galois_merging_certificate | A monic/ℚ-irreducible,p prime,y≥M; image≠A/top | Φ₁₁,p=11: reduction(X−1)¹⁰, M=10, degrees ten1s; root image C₁₀ (order10≠10!/2,10!), identity type ten1s is allowed at y=10; X²−2 is excluded by its image=S₂ | Sound bad-group witness; irreducibility supplies separability |

### README target, API and proof-route audit

The table has one row for each numbered target group. README-only subsidiary identities and APIs receive separate rows afterward. Values shared with a Lean declaration above are recomputed here where they affect a proof route, rather than assuming a successful `sorry` elaboration proves them.

| README target / lines | Instances tried and computed values | Result / change |
|---|---|---|
| 0.1 / 262 | Empty input at y<0 gives empty blocks and 0=0; nonempty input at y<1 has no admissible block; 1≤y<2 permits only cardinal1, hence a=b. For {0,0} at y=2, merging to {0} preserves sum0 but changes cardinal2→1 | Raw natural multisets are handled; not falsely assumed positive |
| 0.2 / 297 | S₃ identity gives type{1,1,1}, sum3; (12) gives{1,2}, sum3. Bounds1 and1.9 permit no nontrivial merge. A partition of2 cannot match either S₃ type since2≠3 | Sound full-cycle convention; S01/S04 cleanup |
| 0.3 / 323 | C₅ witnesses even identity; nonabelian S₃ in degree3 is excluded; C₄ regular on4 points has order4 versus A₄ order12 and S₄ order24, so its identity is bad | Sound existential union; a subgroup or oddness predicate is the wrong model |
| 0.4 / 352 | Identity quotient d=1,m=2: upstairs lengths1+1 or2; d=3,m=2:3+3 or6. Return sizes add1+1=2 or2=2, giving all occurrence blocks, not just divisibility | Supplied individual period formula plus new global assembly |
| 1.1 / 388 | f=0,1,(X+1)³/F₂,X(X−1)/F₃ gives maxima0,0,3,1. For f=X, possible exponent0 is not the greatest; maximum1. Units have no irreducible divisor and are excluded from the exponent characterization | Guards and normalized-factor convention sound |
| 1.2 / 417 | S=∅ gives polynomial1,multiplicity0=fibre0. Identity ℚ→ℚ on{0,2}: at0 multiplicity1=fibre1, at1 zero=0. ℤ→F₂ on{0,2}: productX², multiplicity2=fibre2. Nonreduced R=F₂[ε]/ε² mapping ε→0 on{0,ε}: again2=2 | No source-domain/reducedness hypothesis needed; arbitrary-ring extension is valid |
| 1.3 / 440 | X²−2 at2 gives factors{1,1},M2; X²−2 at3 gives irreducible reduction degree2,M1, type{2}; X(X−1) at2 gives{1,1},M1, identity type{1,1}; monic constant1 has degree0 and is excluded | No good-prime restriction; ramified and split models both covered |
| 2.1 / 486 | Empty tuple yields base field and quotientf; √2 tuple yields degree2 and quotientX+√2; all roots of2X(X−1) yieldC2 with degree0; all roots of monic1 are empty and quotient1 | Actual fields, inclusion directions and leading coefficient sound |
| 2.2 / 536 | k0:False; k>n:False; linear k1:True; Φ₁₁ k1:True,k2:False; X²−t/F₂(t):irreducible but inseparable, predicateFalse. No nonexistent tuple makes an excessive k true | Explicit guard is necessary |
| 2.3 / 566 | Empty tuple:stabilizer=whole Gal, fixing subgroup of⊥=whole Gal. √2 singleton:both subgroups order1; rational root0:both whole Gal. Inseparable X²−t:unique root and trivial automorphism group, equality1=1 remains valid | Restriction comparison uses normality over the actual adjoin; no claim minimal splitting field=L |
| 2.4 / 585 | F₂ irreducible quadratic has root groupC₂: one-root complement cardinal1, so both k1 andk2 true; split quadratic group1 has two orbits, k1 false. Quotient sizes n−j are2,1, never0 for j<k≤2 | Induction uses owned tuple restriction and pinned stabilizer recursion |
| 2.5 / 607 | Irreducible cubic imageC₃ orS₃ containsA₃; split cubic image1 does not. For n2 the unguarded containmentA₂≤G is always true while kfold0 is false, and hd≥3 excludes it | Both iff directions correct; index-two reasoning applies |
| 3.1 / 638 | C1,t1/2,κ1,δ1/10 satisfy all seven ranges; zero indicator gives0-count≤0 and ν(univ)≤C; singleton2 gives L1/2 and RHS C e⁻¹/²; pair{2,2} gives denominator4. ν=0 satisfies inequalities but is not probability | Probability normalization retained only where claimed; no inference from ν.real alone |
| 3.2 / 700 | {2,2,4}/8 has E₁ false (2<1 false); {2,6}/8 E₁ true; {3,3}/6,δ2 has E₂ false (3≠3 false); n1 E₃ true (0≤0); {1,2}/3,α1 has qualifying count1 or2, so E₅ false | All five Check bullets correct; index0 corresponds E₁ and index4 E₅ |
| 3.3 / 750 | n=10¹⁰⁰⁰,α=.01: log n≈2302.5851; first mass main term15.28406; r2 nondivisible main term19.15496. Integral comparison and rounding errors are less than1 in each case since lower endpoints are10⁹⁹⁰ and10⁹⁸⁰/2. At r≤n^α, divided lower endpoint≥n^.97 | Uniform error/threshold exist; no r-dependent bound hidden |
| 3.4 / 771 | Prime set{2}: total smooth reciprocal sum1+1/2+1/4+…=2=product(1−1/2)⁻¹. Finite cutoff2 has smooth sum1.5≤2, so a finite-sum equality to product would be false. General coefficient .5−e^γ/8≈.277366>.25 | Source's dropped-cutoff equality is correctly used as an upper bound; S02 |
| 3.5 / 793 | At a diagonal pair k=l=2 the pair contribution isC/4, notC/2. A common divisor r supplies denominatorr²ij. For cutoffR≥2, tail bound≤2/R and harmonic factors≤(1+log n)² | Correct reciprocal-square exponent; native Mathlib/Analysis/PSeries.lean:406 supplies tail estimate |
| 3.6 / 813 | n=64,r=4,j=3: subsum48 complements to16=64·1/4. For prime powers n=p^a, τ(n)=a+1, not2; summing r≤n^(δ/2) gives n^(−δ/2)τ(n), then η=δ/4 gives n^(−δ/4) | Complement, integrality and divisor dependence correct; S03 name repair |
| 3.7 / 830 | n=10¹⁰⁰⁰,α=.01,t=.5: E₃ threshold≈5.75646; t times harmonic main term≈7.64203 (rounding <.5); failed count is contained in count≤tL. Exponential of −κ(αlog n−loglog n) equals n^(−κα)(log n)^κ | Uniformity needs ε>0 and has it |
| 3.8 / 846 | The eventual nonsmooth mass is≥log n/4; tL≥t log n/4, exactly E₄'s threshold. κ=1 gives boundC n⁻¹/⁴. θ does not occur in either indicator or threshold | Direction of event inclusion and exponent correct |
| 3.9 / 860 | Same n,α,t: r2 has tL≈9.57748>3; failure of four witnesses means count≤3. At least5 long distinct parts minus at most1 divisible part leaves4. Rates for r2, r≥3, r>log n are n⁻κα, n⁻⁴κα/³, and n⁻²κα times at mostn^κα moduli | Four-witness strengthening proved by the given route; no independent randomness used |
| 4.1 / 912 | Trivial group:none; S₂:some2; A₃:some3; regularQ₈:some8; S₃ has support sizes{2,3},minimum2 | No artificial zero minimum |
| 4.2 / 938 | D(x,x)=∅; regularC₅ D(x,y)=five points; fullS₅ D(x,y)={x,y}; D₅ has four distinguishers because its unique reflection sending x to y fixes one other point | Pair-orbit/stabilizer equivalence correct in cyclic and nonabelian models |
| 4.3 / 963 | RegularC₅ orbital±1 is a5-cycle, diameter2, one component of size5; regularC₇ orbital±1 has diameter3 and one component of size7. Diagonal orbital instead has7 singleton components, excluded by x≠y | Primitive orbital connectivity correct; does not imply diameter2 for the orbital itself |
| 4.4 / 982 | C₅:valency1,D5; D₅:valency2,D4. C₇:valency1,D7, complement diameter2 while symmetrized orbital diameter3. Bounds D≥2v/3 andD≥(n−1)/v give D²≥2(n−1)/3=4 for n7, exceeding7/4 | Complement/graph direction and ordered-pair counting sound |
| 4.5 / 1033 | u=(012),v=(234) in S₅: Δ={2}; left-action commutator uvu⁻¹v⁻¹ has support{0,2,3}=Δ∪uΔ∪vΔ. Incidence inequality gives n≤4m+6/(m−3); m9 upper37, m10 upper40+6/7 | Convention checked explicitly; no invalid independence or zero denominator |
| 4.6 / 1070 | n5 target.618≤C₅ minimum5 andD₅ minimum4; n37 target≈2.541<4; n38 n/4=9.5≥2.582. A group containingA has index dividing2, so onlyA orS | Small-degree branch does not misuse Bochert |
| 5.1 / 1112 | Two blocks size3: internal swap ℓ2,r′1,s′2,U size3; row-interchange ℓ2,r′2,s′1,U size6; fixed point ℓ1, cycleOf support0, correction0+1=1 | Actual block orbit and invariant-union cardinality correct |
| 5.2 / 1135 | At most3 parts>n/4; at most8 primes>n^1/8 in each gives bound24. k=p² survives powerp q with supportp², while other cycles prime-to-p die. For n16, √n/3=4/3<(4−1)/2=1.5; n>9 is necessary for that strict comparison | Exponent and support proof correct; final N can absorb all cutoffs |
| 5.3 / 1173 | For n6,blocks2×3,internal2-cycle has r′1 and union sum3=6·1/2, illustrating the small-r pullback. Middle-r: r>n^δ/2 gives strict gcd>n^α even atθ0,κ1. Five unions−one filled−three long=one; four−three=one | Corrects the source's uncontrolled companion part; all E₁ calls concern two actual small occurrences |
| 6.1 / 1267 | Atδ=.1,κ1,ε.02: α ranges .01–.025 and final exponent −.01 to−.025; compare subsum−.025 and large-prime−.25. Probability normalization makes union bounds valid, and finitely many thresholds combine by a maximum before θ andν | Sound constants' quantifier order; S02 supply repair |
| 6.2 / 1297 | Φ₁₁,p11,y10 yields M10, degrees ten1s, root imageC₁₀; its identity is a merging witness and bad-transitive. If y9, the multiplicity hypothesis10≤9 fails and M>y holds in the inclusion. Reducible (X²−2)² fails hirr | All-prime certificate and coefficient-event inclusion correct |

The following covers the README-only APIs not already represented by individual Lean rows. These are mathematical specifications; S04 changes only their presentation as undeclared local names.

| README-only statement / line | Instances and computed values | Result |
|---|---|---|
| EqualPartMerging.refl / 270 | y1,a={0,2}: singleton block sizes1,1≤1, sums{0,2}=a; y.5,a={2} has no permissible block and is outside premise | True at exactly the claimed bound |
| EqualPartMerging.mono / 270 | {1,1}→{2}: block2 at bound2 still has2≤3; empty witness persists from bound−2 to−1 | True |
| EqualPartMerging.sum_eq / 270 | {0,0,2,2}→{0,4}: sums4=4 although cardinal4≠2 | True; not a cardinality identity |
| EqualPartMerging.eq_of_lt_two / 271 | y1.5 requires positive integer cardinal≤1.5, hence1; a={0,2} thenb={0,2}; y2 admits{0,0}→{0} and is excluded | True with strict cutoff |
| mem_mergePerms / 302 | Identity on2,ρ={1,1},y1: membership True and raw merging True; ρ={2}:both False | Definitional equivalence |
| mem_badTransitive / 329 | 1 on5 has C₅ witness:both True; 1 on2 has no permitted subgroup:both False | Definitional equivalence |
| count_le_maxFactorMultiplicity / 396 | f=X(X−1),counts1 for either factor,0 for absent X+1 overℚ; each≤max1; f=1 all counts0≤0 | True even for absent proposed factor |
| tuple quotient splits/complement / 501 | f=2X(X−1),selected0: quotient2(X−1),roots{1}={0,1}\{0}; selectboth:quotient2,roots∅ | Correct and owned in2.1 |
| IsKFoldIrreducible.mono / 544 | F₂ irreducible quadratic:k2 True impliesk1 True; lowering to0 would fail but1≤l is imposed | True |
| IsKFoldIrreducible.degree_bound / 545 | X:k1 gives1≤1≤1; Φ₁₁:k1 gives1≤1≤10; excessive11 excluded by11≤10 False | Guard extraction |
| Tuple-stabilizer restriction / 573 | √2 overℚ:stabilizer1,complement root−√2 fixed, quotient Galois group1; split quadratic root0:whole original group1 maps onto quotient group1 | Correct source/target; normal extension supplies surjectivity |
| harmonic zero / 665 | f=false,m0 or2:sum0=0 | True |
| harmonic singleton / 665 | a2,m4:sum1/2; a5,m4 would give0≠1/5 but violatesa≤m; a0 is excluded | True with both bounds |
| harmonic indicator monotonicity / 666 | indicator2≤true at m2:1/2≤3/2 | True by term nonnegativity |
| harmonic cutoff monotonicity / 666 | indicator2:m1 sum0≤m2 sum1/2 | True |
| PartitionLaw.enlarge_constant / 670 | C1→D2:pair at2 RHS1/4→1/2; lower mass1/2 RHS e⁻κ/²→2e⁻κ/² | Bounds weaken, D≥1 retained |
| PartitionLaw.weaken_kappa / 671 | κ1→κ′.5,L.5:exp(−.5)≈.60653≤exp(−.25)≈.77880 | Direction correct; κ′>0 and≤1 retained |
| mem_orbitalDistinguishers / 944 | S₃,x0,y1,z2:swap fixes2 and transports0→1, same stabilizer orbit so membership False; z0:orbit{0} excludes1, membership True | Correct equivalence |
| primitive support consequence / 984 | D₅,x moved by reflection:support4 contains D(x,gx) of size4; 4≥√5/2 | Extracts support bound without assuming one prime cycle |
| equal/disjoint block orbits / 1118 | Quotient permutation(01)(23):cycles above rows0,1 have orbit{0,1}; above row2 orbit{2,3}; intersections either2 or0 | Actual quotient orbits, not arbitrary divisors |
| coefficient-event inclusion / 1317 | A=Φ₁₁,p11:at y10,M>y False but bad partition True; at y9,M>y True. In both cases bad root group True is covered | Sound pointwise inclusion; measurability only needed when taking probabilities |

### Source locator audit

Only the four supplied legal cached works were needed. Source passages are identified by extraction locators, not reproduced. The README explicitly cites the versions actually read; journal/preprint numbering is not silently interchanged.

| Work / package claim | Locator checked | Result of comparison |
|---|---|---|
| bskk / higher irreducibility, §§2.1–2.5 | bskk line 200, line 210, line 213 | Ordered-root quotient and k-transitivity match. Guards and arbitrary-field extension are expressly local; pinned normal-extension/alternating APIs support the extension. |
| bskk / bad-transitive set §0.3 | bskk line 3323 | Union ranges over transitive subgroups unequal to A and S; no parity restriction on individual elements. |
| bskk / merging §0.1 | bskk line 3490, line 3496 | Occurrence blocks, bound and equal-entry condition agree; disjointness is explicit in source footnote at line3505. |
| bskk / ramified specialization §§1.1–1.3 | bskk line 3498, line 3508, line 3530 | Monic squarefree characteristic-zero polynomial, arbitrary prime; collision fibre cardinal equals factor exponent. |
| bskk / cyclic quotient §0.4 | bskk line 3535, line 3539 | Orbit length d·m′, positive m′≤m; assembling all return orbits adds the needed global witness. |
| bskk / polynomial certificate §6.2 | bskk line 3544, line 3549 | Bad root image itself witnesses the bad-transitive set; reduction multiplicity is the alternative exceptional event. |
| bskk / law and final criterion §§3.1,6.1 | bskk line 3611, line 3625, line 3633, line 3900 | Parameter ranges, occurrence counts and uniform exponent match; constants precede law and θ. |
| bskk / anatomy §§3.2–3.3,3.5–3.9 | bskk line 3653, line 3673, line 3701, line 3717, line 3751, line 3787 | Four witnesses strengthen the source's one; the extra proof supplies them without changing the rate. |
| bskk / nonsmooth mass §3.4 | bskk line 3727, line 3741, line 3745, line 3748 | Source's uncapped smooth sum must bound, not equal, the subtracted finite mass. README uses the inequality correctly. Exact exp(γ) coefficient is required. |
| bskk / merged permutations, minimum and exclusions | bskk line 3819, line 3826, line 3829, line 3855 | Option convention is disclosed; README reverses the source's erroneous cutoff comparison at line3836 and supplies controlled short companions absent at lines3884–3888. |
| babai / orbital connectivity §4.3 | babai line 115, line 121, line 133, line 144 | Pair-orbit configurations and primitive connectivity support the group formulation. |
| babai / distinguisher definition §4.2 | babai line 160, line 167 | Color comparison agrees with different stabilizer orbits; diagonal gives empty set. |
| babai / headline §4.4 | babai line 178 | √n/2 bound matches; n≥5 is sufficient for the chosen proof's valency estimate. |
| babai / complement and average steps | babai line 222, line 230, line 241 | Complement diameter and regular degree count supply n−vmax>√n; the orbital itself may have larger diameter. |
| babai / path and weighted suborbit steps | babai line 251, line 260, line 274, line 292, line 302 | Path-union inequality, weighted connected suborbit graph and ordered-pair counts give the two lower bounds used. |
| babai / support consequence | babai line 335, line 337 | Distinguishers of a moved pair lie in the moving permutation's support. |
| schomburg / commutator support | schomburg line 31, line 39 | Cardinal bound ≤3·intersection cardinal is valid; an explicit left-action commutator was computed above. |
| schomburg / incidence counts | schomburg line 76, line 88, line 95 | Counts are on distinct conjugates under a point stabilizer; no independence assertion. |
| schomburg / Bochert target | schomburg line 120, line 122, line 147 | Noncontainment of A and n≥38 are retained; arithmetic reduction and m−3 denominator agree. |
| bary-soroker-kozma / primitive minimum | bary-soroker-kozma line 438, line 444 | Two branches support the square-root bound. README proves the small-degree branch separately rather than importing the unrestricted n/4 assertion in that proof. |

### Pinned supply and ownership

The content checkout is main at a07e2024f391f3022520c3f8ad194912b3eab614. Mathlib HEAD and the manifest both identify 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti HEAD and the manifest both identify a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. All native declarations used as witnesses were read at these pins, including their surrounding variable/instance context.

| Supplier files / exact interfaces inspected | Contract and boundary verified |
|---|---|
| Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52,56,58 — Nat.Partition, parts_pos, parts_sum | Positive parts summing to n; it is not a set of distinct sizes. |
| Mathlib/FieldTheory/PolynomialGaloisGroup.lean:120,204,212 — restrict_surjective, galActionHom, galActionHom_injective | Restriction needs Normal and the splitting Fact; injectivity needs splitting, not irreducibility. |
| Mathlib/RingTheory/Ideal/GoingUp.lean:369 — Ideal.exists_maximal_ideal_liesOver_of_isIntegral | Integral, faithful algebra and maximal base ideal; no assumption the extension prime is unramified. |
| Mathlib/Algebra/Polynomial/RingDivision.lean:186,306 — rootMultiplicity_X_sub_C, rootMultiplicity_mul | Linear factors contribute0/1; additivity requires the product nonzero. Field-target monic products satisfy it. |
| Mathlib/GroupTheory/GroupAction/MultipleTransitivity.lean:122,302,350,576,601 — isMultiplyPretransitive_iff, isMultiplyPretransitive_of_le, SubMulAction.ofStabilizer.isMultiplyPretransitive, alternatingGroup.isMultiplyPretransitive, IsMultiplyPretransitive.alternatingGroup_le | Fin k embeddings; bounded lowering, pretransitivity in stabilizer recursion, both alternating-recognition directions. |
| Mathlib/GroupTheory/GroupAction/Primitive.lean:91; Jordan.lean:370,408 | IsPreprimitive extends IsPretransitive but does not impose cardinal≥5; the package supplies that separately. Primitive swap/3-cycle recognition has the needed small-degree coverage. |
| Mathlib/NumberTheory/Harmonic/Bounds.lean:24,33; EulerMascheroni.lean:172; Mathlib/Analysis/Complex/ExponentialBounds.lean:82 | log_add_one_le_harmonic, harmonic_le_one_add_log, eulerMascheroniConstant_lt_two_thirds and log_two_gt_d9 give γ<2/3<log2, hence expγ<2. |
| TauCeti/GroupTheory/Perm/Partition.lean:96,333,340,367,392,406 — fullCycleType, fullCycleType_eq_of_isConj, sum_fullCycleType, fullCycleType_of_isEmpty, fullCycleType_conj, fullCycleType_permCongr | Native body adds fixed-point 1s to cycleType; sum, empty case, conjugation and relabeling all agree. |
| TauCeti/RingTheory/Polynomial/FactorDegrees.lean:55,126 — Polynomial.factorDegrees, Polynomial.Monic.sum_factorDegrees | Normalized-factor occurrences map to degrees; monicity preserves total degree at every prime. |
| TauCeti/NumberTheory/NumberField/Frobenius.lean:97 — NumberField.exists_isArithFrobAt_int_of_liesOver | Finite Galois number-field context, rational prime and prime ideal lying over(p); arithmetic exponentp; no unramifiedness premise. |
| TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:54,76 — TauCeti.FiniteField.exists_orbit_eq_rootSet_factor | Finite base field, algebraic splitting extension, nonzero polynomial; orbit cardinal=irreducible degree. |
| TauCeti/FieldTheory/GaloisGroups/Orbits.lean:212; Stabilizer.lean:74; MultipleTransitivity.lean:88 | Separability/positive degree for orbit iff irreducible; no separability for fixing one generator; irreducible+separable+degree>1 for the one-root double-transitivity quotient. |
| TauCeti/GroupTheory/Perm/Semiconj.lean:46,54,82,104; CyclePower.lean:60 | Minimal period divisibility, return orbit identity, fibre-period product, orbit-count bound, and fixed-point criterion for cycle powers are genuine suppliers. |
| TauCeti/RingTheory/Polynomial/Roots.lean:111 — Polynomial.rootSet_divByMonic_X_sub_C | Root value0 and derivative value≠0; deletes exactly the selected simple root. |
| Mathlib/NumberTheory/EulerProduct/Basic.lean:297; Mathlib/Analysis/PSeries.lean:406 | The finite-prime smooth-number Euler product and reciprocal-square tail already exist. These are the native inputs underlying README §§3.4–3.5, not additional supplier gaps. |
| Mathlib/FieldTheory/Separable.lean:509 — Irreducible.separable | Characteristic-zero irreducibility supplies the certificate's omitted redundant hsep. |
| Mathlib/Data/Finset/Lattice/Fold.lean:99; Mathlib/RingTheory/UniqueFactorizationDomain/NormalizedFactors.lean:306 | Finset.sup_le_iff and normalizedFactors_of_isUnit give concrete one-tactic probes for S01. |

The parent main README was checked at Layers0,1,5,9, including the equal-block product identification at line603 and imported Dedekind contract at line1120. Completed/NumberFieldArithmetic §3.10 was checked at line1039 and its implemented theorem at TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164. The parent stops at discriminant-good equality and one-root/double-transitivity interfaces; this continuation's ramified occurrence merging and arbitrary ordered tuples are extensions, not replanning those suppliers.

Object searches covered all 118 main active README files, all 11 completed README files, the three other board-package READMEs, both files in each of the 13 supplied sibling checkouts, and the required indexed `roadmaps grep` search. The supplied sibling list checked was ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. No duplicate construction or fully qualified package declaration was found. The only matches in the first broad sibling object search were unrelated elliptic-descent statements in ComputationalNumberTheory. The divisor result was then located by its own object in ErdosProgressionPowers §0.9. AnalyticNumberTheoryPartI was resolved through `roadmaps show` at its indexed open head for S02, after the mandated ownership search found its exact Mertens and divisor targets.

This package is the owner of the new bounded equal-part relation and its global assembly, collision-allowing polynomial specialization, arbitrary ordered-root quotient criterion, arbitrary partition-law exclusion theorem, and its explicit group-support proof route. It imports the full-cycle/factor carriers, simple-root comparison, individual cycle-fibre arithmetic and general block quotient. No supplier later in the allowed order is needed and no ownership move is required.

## Not verifiable

- No fresh Lean elaboration, `#check` run, build or proof execution was performed, in accordance with the read-only/no-build instruction. The supplied audit provides 70 real printed signatures, omits the local measurable-space instance and contains the spurious docstring-derived `signatures` error described above. Binder and example conclusions beyond that evidence are source inspection, not new compiler certification.
- The future proofs admitted by 54 theorem declarations were not verified formally. The mathematical calculations, source comparisons and proof-route checks above are the basis of this review; they are not a claim that `sorry` theorems have proofs in the pin.
- S02 uses the supplier's indexed open-head target as a planning contract, not a verified implementation of Mertens's theorem. Whether that supplier's own required analytic inputs are eventually implemented is outside this package review.
- Ownership against unprovided open sibling checkouts was not certified by reading their complete files. The mandated index search was performed, and the named supplier found by it was inspected; the detailed sibling audit covers the 13 paths supplied in the brief.
- No cited source remained legally inaccessible. All four cached works were available; no additional source fetch or missing-reference request was needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "133e06daf746291f9568f2a51c22d0b7e87558e3", "job": "RT-PolynomialGaloisGroupsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
