# Review of GlobalGaloisDeformationsPartII (pull request #1837 at bffca34)

**Verdict:** needs changes

Incremental re-review of the 2 changed lines since a91aaea (one line of the README replaced, line 64 under `### From Tau Ceti`; `Suggested.lean` is unchanged since e91a4ff; nothing outside the folder). The repair added the full name and the correct file of the augmentation Hopf ideal but left the wrong file path of the generator lemma, which was the substance of the previous R01. That path is the one remaining finding (P3). The gate passes, the dependency check reports 0 problems, and the module elaborates with `sorry` as the only warning.

## R01 (P3) — The generator lemma is still cited at a file that does not exist at the pin

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:64`: "because every canonical generator does (`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`)".

**Claim.** The lemma that every canonical generator of U(𝔤) lies in the augmentation Hopf ideal is in that file.

**Witness.** At the Tau Ceti pin 358314d there is no directory `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/`. The lemma is `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`. Of the 10 Tau Ceti and 19 Mathlib paths the README cites, this is the only one missing.

**Repair.** On line 64 replace `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean` with `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean`, and make no other change. Tested at the pin: the declaration at that file's line 82 states `UniversalEnvelopingAlgebra.ι R x ∈ HopfIdeal.augmentation R U` under `[CommRing R] [LieRing L] [LieAlgebra R L]` (line 67). It therefore applies to 𝔤 over ℚ_p and over an algebraic closure. With it, the Casimir of sl₂, (ef+fe)/4 + h²/8, has counit 0 and lies in the ideal, which is what the sentence claims.

## Previous findings

- R01 — partly repaired: line 64 now writes "the augmentation ideal `TauCeti.HopfIdeal.augmentation` (`TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean`)" (correct), but still cites `ι_mem_augmentation` "in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`", which is missing at the pin. Carried as R01 above.

## Verified sound

**Gate.** The worker's gate at bffca34 passes every check (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `set_option=0`, `sorry-data=0`, `readme-ids-missing=0`, `statement-hygiene=0`). I reran it on this head and every check passed again (`... source-material=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** on this head:

```
depcheck: 242 roadmaps, 2452 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The diff adds no roadmap citation and no `*Needs:*` edge.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean` from the worktree gives one warning, `declaration uses sorry` at 113:8, and exits 0 in 26 s. The file is byte-identical to e91a4ff, so the earlier reports' checks carry forward:

- The `#check @name` binder comparison: `signatures.md` lists the same 4 real declarations, `ModPow`, `modPowSub`, `modPowRep` and `uniformTorsion_H1`, with no dropped binder. Its fifth entry, `in` at line 14, comes from the tool parsing docstring text; the build is clean.
- The one-tactic probe: `uniformTorsion_H1` closes under none of `simp`, `rfl`, `infer_instance`, `exact ⟨0, …⟩`, `exact ⟨1, …⟩` or `exact?`.

**Library declarations opened at the pins** (Tau Ceti 358314d, Mathlib f6090c7), for the changed line:

- `TauCeti.HopfIdeal.augmentation`, `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean:61`. Variables `[CommRing R] [Ring H] [HopfAlgebra R H]` (line 54); it is defined as the kernel Hopf ideal of the counit. The name and file now on line 64 are correct.
- `TauCeti.HopfIdeal.mem_augmentation`, same file line 75: x lies in the ideal iff its counit is zero.
- `TauCeti.HopfIdeal.augmentation_toIdeal_ne_top`, same file line 124: the ideal is proper over a nontrivial base ring.
- `TauCeti.HopfIdeal`, `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean:265`: the carrier is an `Ideal H` with the field `isTwoSided'`. So "an ideal is closed under products and sums" holds on both sides; the product ι(xᵢ)ι(yᵢ) needs only left-ideal closure anyway.
- `TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebra`, `TauCeti/Algebra/Lie/UniversalEnveloping/HopfAlgebra.lean:162`, under `[CommRing R] [LieRing L] [LieAlgebra R L]` (lines 53–54). This is the Hopf structure on U(𝔤) the augmentation needs, with no field or characteristic hypothesis.
- `TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation`, `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`. The name and statement are right; the README's path is wrong (R01).
- All other library paths in the README resolve at the pins, checked by script: 9 of 10 Tau Ceti paths (all except R01's) and 19 of 19 Mathlib paths. The seven other Tau Ceti declarations and four Mathlib declarations on line 64 are unchanged from a91aaea and were opened with their hypotheses in the previous report.

**Cross-roadmap citations on the changed line.** The changed line cites NoncommutativeAndEquivariantIwasawa §0.13a, unchanged and resolved by the previous report. The diff adds no other cross-roadmap citation. The other references to the Casimir (lines 15, 917, 925, 1000) and to the augmentation ideal (lines 174, 917) are unchanged and agree with line 64. Ownership: the change cites a pinned Tau Ceti declaration for an object no roadmap owns, so it adds no ownership question. The overlaps tool lists no other pull request changing this roadmap and no dropped id.

**Seeded sample.** None of the sampled targets (0.3, 0.4, 0.5, 1.5, 2.4, 3.1, 3.2, 3.4, 4.3, 5.4, 5.5, 7.4, 8.2, 8.8, 8.11) falls in the diff or cites the changed objects. A grep for `casimir|HopfIdeal` hits only lines 15, 64, 917, 925 and 1000, all in Scope, the supplier contracts and §4.4 or its Layer 4 Dependencies. The README flags no locator as unverified. The changed line cites no paper source.

**Declared gaps.** The diff changes no contract and no gap. The 26 gap slugs still match the 26 README contracts, as in the previous report.

**Shape and policy on the changed line.** It has no LaTeX, no process words, no pull-request numbers and no `lemma`. Library names are in backticks with their files.

**Adversarial table.** Each row gives the values computed on each side. Rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-GlobalGaloisDeformationsPartII_r3) and the reports before it.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Line 64: U(𝔤) carries the Hopf structure the augmentation needs | 𝔤 over ℚ_p; 𝔤 ⊗ K̄ over K̄ | `instHopfAlgebra` needs only `[CommRing R]` and a Lie algebra; `HopfIdeal.augmentation` needs `[CommRing R] [Ring H] [HopfAlgebra R H]`; both hold for R = ℚ_p and R = K̄ | applies as cited |
| Line 64: the Casimir lies in `TauCeti.HopfIdeal.augmentation` | sl₂ over ℚ with Killing form κ(h,h)=8, κ(e,f)=4; 𝔤 = 0 | Killing-dual basis h/8, f/4, e/4 gives Ω = (ef+fe)/4 + h²/8. ε(ι e)=ε(ι f)=ε(ι h)=0 and ε is multiplicative, so ε(Ω) = 0 and Ω is in the ideal by `mem_augmentation`. For 𝔤 = 0 the sum is empty and Ω = 0 is in the ideal | holds, including the empty case |
| Line 64: augmentation membership is not vacuous (negative control) | the central element 1 ∈ U(sl₂); Ω+1 | ε(1) = 1 ≠ 0, so 1 is not in the ideal (`augmentation_toIdeal_ne_top`, ℚ nontrivial). On the trivial module 1 and Ω+1 act by 1, invertibly, although invariants are nonzero; Ω acts by ε(Ω) = 0 = casimirScalar(0) | the membership is what §0.13a item 5 needs; it excludes 1 and Ω+1 |
| Line 64: the sl₂ Casimir values, recomputed on the changed line | standard module K², h = diag(1,−1) | ef = diag(1,0), fe = diag(0,1), h² = I. Ω = I/4 + I/8 = (3/8)·I, and n(n+2)/8 at n=1 is 3/8. Trace-form ef+fe+h²/2 = (3/2)·I = 4·(3/8)·I. Trivial module: n=0 gives 0 | the Check's values are right |
| Line 64: Casimir scalar formula, extension-of-scalars step, no-invariants versus 𝔤 = 0, trivial constituent, Cartan subalgebra and base | untouched in substance by the diff | carried from PRREVIEW-GlobalGaloisDeformationsPartII_r3, values unchanged (e.g. ((n+1)²−1)/8 = n(n+2)/8; Ω_{K̄} the image of Ω_K; V^𝔤 = V ≠ 0 for 𝔤 = 0) | no change |
| Finite-image semisimplification contract, scalar-extension paragraph, Levi clauses, §4.4 universal coefficients, §4.4 shrinking U, passage to Γ, fixed-quotient global obstruction contract, root cocycle lattice contract, §1.10 intermediate field, Pan p = 3 exclusion, AutomorphicGaloisRepresentations layers | untouched by the diff | carried from PRREVIEW-GlobalGaloisDeformationsPartII_r3 and the report it carries, values unchanged | no change |
| §4.4 and the Lean headline `uniformTorsion_H1`; §§0.3, 1.2, 1.3, 1.7, 1.9, 1.10, 1.12, 2.4, 2.7, 2.9, 3.2, 3.3, 4.2, 4.5, 4.7 cardinalities, 5.3, 6.2, 7.1, 7.3, 7.4, 7.7, 7.8, 8.3, 8.5, 8.9, 8.10, 8.11, 9.2, 10.1, 10.3, 10.4; Conventions B_G; Lean definitions `ModPow`, `modPowSub`, `modPowRep` | untouched by the diff (`Suggested.lean` byte-identical) | carried from the first report's table (rows with the same names), values unchanged | no change |

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10 and Propositions 11 and 32: these are settled as uncertified and are cited by locator only.
- The diff does not touch the seeded-sample targets, so their locators were not re-read this round; they carry from the previous reports.

## Source issues

- none
