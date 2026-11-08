# Review of GrothendieckNotesLemmas (pull request #1431 at 1fe3ecc)

**Verdict:** needs changes

Full review of the repaired head (326 changed lines since 30d3e77: five new targets 1.8, 1.9,
2.11, 2.12, 5.7, and new Scope deferrals). The pins moved with the merge of main: Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9` (the worktree's `lake-manifest.json`); every library claim below
was re-checked at these pins, not at the previous review's. The gate passes every check, the
dependency check reports no problem, `Suggested.lean` elaborates with `sorry` as its only warning,
and no declaration closes under the one-tactic probe. Four findings are blocking: three statements
are pinned Tau Ceti declarations (closed by `exact` or `inferInstance` in a scratch probe), and
one target re-plans a section of a roadmap on main.

## Status of the previous review's findings (r4 at 30d3e77)

- **R01 (locators on nineteen targets): not repaired.** The nineteen targets still carry no
  source; the five new targets add "(classical)" without a locator (README 282, 308, 527, 549,
  795). Re-raised as R09.
- **R02 (process narrative in Downstream consumers): not repaired.** README 830–831 still reads
  "No roadmap on main names this one (`git grep -w GrothendieckNotesLemmas` on main and on the
  heads of the open roadmap pull requests)." Re-raised as R10.
- **R03 (1.1 route names `Nat.Prime.dvd_choose_pow`): not repaired.** README 163–164 still reads
  "the forward direction is `Nat.Prime.dvd_choose_pow` applied to the base-`p` digits".
  Re-raised as R11.
- **R04 (namespace of `quotTensorEquivQuotSMul`; unused Tau Ceti import): not repaired.** README
  116 and 506 still write `quotTensorEquivQuotSMul` without `TensorProduct.`; `Suggested.lean`
  line 4 still imports `TauCeti.RingTheory.Flat.Pi`, which no statement uses. Re-raised as R12.

## R01 (P2) — 2.9's Baer criterion is a pinned Tau Ceti declaration

**Location.** `TauCetiRoadmap/GrothendieckNotesLemmas/README.md` 481–482: "Prove
`Module.Baer.of_isPrincipalIdealRing`: over a commutative principal ideal ring `R`, a module on
which every `r ≠ 0` acts surjectively satisfies Baer's criterion"; `Suggested.lean` 224–227.

**Claim.** What exists at the pins is cited, not restated.

**Witness.** Tau Ceti `Module.Baer.of_surjective_smul`
(`TauCeti/Algebra/Module/Injective/PrincipalIdealRing.lean` line 38) states exactly this for
`[Ring R] [IsPrincipalIdealRing R]`, so more generally than the README (no commutativity). On a
scratch copy, `exact Module.Baer.of_surjective_smul hQ` closes the roadmap's statement (probe
`Dup.lean`, 5 s, no error). The Scope sentence "none restates one" (README 41–42) is false here.

**Repair.** Delete `Module.Baer.of_isPrincipalIdealRing` from `Suggested.lean`; in README 2.9
cite `Module.Baer.of_surjective_smul` as the input and keep the two statements that are new (the
equivalence with divisibility over a principal ideal domain and the quotient statement); list the
declaration under "Supplied at the pins" in Scope and in the Tau Ceti supplier contract. The
sentence "Mathlib has the first statement only over `ℤ`" becomes "Tau Ceti has the first
statement over every principal ideal ring".

## R02 (P2) — 2.11's injectivity of `K ⁄ A` is a pinned Tau Ceti instance

**Location.** README 523–525: "Prove `IsFractionRing.baer_quotient_range`: when `A` is a principal
ideal ring, `K ⁄ A` satisfies Baer's criterion, hence is an injective `A`-module";
`Suggested.lean` 261–264.

**Claim.** The statement is a special case of a pinned instance.

**Witness.** Tau Ceti `Submodule.injective_quotient_of_divisionRing`
(`TauCeti/Algebra/Module/Injective/PrincipalIdealRing.lean` line 58): for `[CommRing R]
[IsPrincipalIdealRing R] [DivisionRing K] [Algebra R K] [FaithfulSMul R K]` and every submodule
`S` of `K`, `Module.Injective R (K ⧸ S)`; its docstring names `ℚ_p ⁄ ℤ_p` as the intended case.
`IsFractionRing A K` supplies `FaithfulSMul A K` (Mathlib
`RingTheory/Localization/FractionRing.lean` line 170). In the probe,
`Module.Injective A (K ⧸ LinearMap.range (Algebra.linearMap A K))` closes by `inferInstance`, and
the Baer form closes in four lines from `Module.Baer.of_surjective_smul` and `mkQ_surjective`.

**Repair.** Delete `IsFractionRing.baer_quotient_range` from `Suggested.lean`; README 2.11 keeps
only the torsion isomorphism `(K ⁄ A)[t] ≅ A ⁄ (t)` (which is new) and cites the instance for
injectivity; Scope lists the instance under "Supplied at the pins". The "How to read the build"
sentence "2.9 → 2.11" and the Layer 2 Dependencies sentence "the first statement of 2.11 uses 2.9"
go with it.

## R03 (P2) — 3.1's `Derivation.leibniz_prod` is a pinned Tau Ceti declaration

**Location.** README 584–585: "Prove `Derivation.leibniz_prod`: for a derivation `D` of a
commutative algebra and a finite set `s`, `D (∏ i ∈ s, f i) = ∑ i ∈ s, (∏ j ∈ s.erase i, f j) •
D (f i)`"; `Suggested.lean` 285–289.

**Claim.** Same statement, same name, same generality as a pinned declaration.

**Witness.** Tau Ceti `Derivation.leibniz_prod` (`TauCeti/RingTheory/Derivation/Basic.lean`
line 57), over `[CommSemiring R] [CommSemiring A] [AddCommMonoid M]`, with the sum written
`∑ j ∈ s, (∏ i ∈ s.erase j, f i) • D (f j)`. In the probe the roadmap's statement closes by
`exact Derivation.leibniz_prod D s f`. The Layer 3 Examples bullet (README 617–618) describes the
pinned theorem.

**Repair.** Delete `Derivation.leibniz_prod` from `Suggested.lean`; 3.1 keeps
`Derivation.leibniz_zpow_units` (not at the pins: Mathlib's `Derivation.leibniz_zpow`,
`RingTheory/Derivation/Basic.lean` line 511, is over a field, and no Tau Ceti file states the
unit form) and cites Tau Ceti's `leibniz_prod` in its `*Needs:*` line; Scope lists it under
"Supplied at the pins"; the Examples bullet moves to Scope or is dropped.

## R04 (P2) — 5.2 re-plans Cauchy–Binet, owned by PadicMeasuresIwasawaAlgebras §6.4 on main

**Location.** README 697–704: "Prove `Matrix.det_submatrix_mul`: … the minor of `A B` on rows `I`
and columns `K` is the sum over `s ∈ Set.powersetCard ι n` of the minor of `A` on rows `I` and
columns `s` times the minor of `B` on rows `s` and columns `K`"; `Suggested.lean` 359–364.

**Claim.** What a roadmap on main plans is imported by name and section, never planned again.

**Witness.** PadicMeasuresIwasawaAlgebras (on main) §6.4 "Compound matrices and higher adjugates"
(`TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` line 3845) defines `Matrix.compound`
(`C_r(A)_{S,T} = det A[S, T]` on `Set.powersetCard`, through `ofFinEmbEquiv`) and states
`Matrix.compound_mul`, "`C_r(AB) = C_r(A) C_r(B)`, Cauchy–Binet" (its `Suggested.lean` lines
1035–1038, same carriers `Set.powersetCard ι r`, `ofFinEmbEquiv.symm`). The same object is also
stated on main by DiophantineApproximationAndTranscendence §2.5 (`plucker_cauchyBinet`, README
line 1390, `Suggested.lean` 84–86, the Gram case `det (x yᵀ)`), and the pinned Tau Ceti has the
`2 × 2` case `Matrix.pairMinor_mul` (`TauCeti/LinearAlgebra/Matrix/Minor.lean` line 127) and the
multilinear expansion `Matrix.det_mul_eq_sum_prod_mul_det_submatrix`
(`TauCeti/LinearAlgebra/Matrix/MaximalMinor.lean`, section `Int`, lines 130–150) whose docstring
says that collecting its terms by image gives Cauchy–Binet. The roadmap's statement for arbitrary
`I : Fin n → l`, `K : Fin n → o` is `compound_mul` at the increasing enumerations composed with
the sign rule for a non-increasing enumeration (Tau Ceti
`exists_det_submatrix_eq_sign_mul_plucker`, used at `MaximalMinor.lean` line 145).

**Repair.** Delete 5.2 and `Matrix.det_submatrix_mul`; add to Scope "Left to other roadmaps":
"*The Cauchy–Binet formula for `r × r` minors*, as `Matrix.compound_mul` on compound matrices:
PadicMeasuresIwasawaAlgebras, §6.4; the `2 × 2` case is Tau Ceti `Matrix.pairMinor_mul`." The
Layer 5 Examples bullet "5.2 with `n = card ι` gives `det (A B) = det A · det B`" (README 817)
goes too. Renumber or keep the numbering with a one-line note; no roadmap cites 5.2.

## R05 (P3) — 1.9 follows in two rewrites from pinned Mathlib lemmas

**Location.** README 299–303: "No hypothesis on `R`: Mathlib's `Polynomial.resultant_eq_prod_eval`
asks for a domain and a split polynomial, and its file records this statement as the goal it is
after"; `Suggested.lean` 124–145 (three declarations).

**Claim.** Padding: a headline that follows from the library in a few lines, and a stale
description of what the pin has.

**Witness.** At the pin, `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` has
`resultant_prod_left` (line 637, any commutative ring, hypothesis `∏ leadingCoeff ≠ 0`),
`resultant_X_sub_C_left` (371), `resultant_comm` (149) and `resultant_prod_right` (650); the
file's TODO (lines 23–27) is stale. A scratch file proves all three statements of 1.9 from them:
the first by `nontriviality R; rw [resultant_prod_left s _ Q n (by simp) hn]; simp [hn]`, the
reversed order by `resultant_comm` and `natDegree_prod_of_monic`, the two-product form by the
first and `simp [eval_prod]` (probe `Res.lean`, 8 s, no error). The one-tactic probe fails only
because `simp` rewrites `(∏ …).natDegree` to `s.card` before `resultant_prod_left` can fire.

**Repair.** Delete the three declarations from `Suggested.lean`; the README keeps 1.9 as a
remark in Scope ("Supplied at the pins": `resultant_prod_left` with `resultant_X_sub_C_left`
give `Res(∏ (X − αᵢ), Q) = ∏ Q(αᵢ)` over every commutative ring, `resultant_comm` the reversed
order), and corrects the sentence about Mathlib's file. The Layer 1 Examples bullet on
`X ² − 1` and `X − 3` (README 334–335) becomes a Check of that remark or is dropped.

## R06 (P3) — 2.1 claims the instance `Module.Flat R (M × N)`, which is Tau Ceti's

**Location.** README 348–350: "`Module.Flat.prod_iff`: `M × N` is flat iff `M` and `N` are, with
the instance that `M × N` is flat when both are."

**Witness.** Tau Ceti `Module.Flat.prod` (`TauCeti/RingTheory/Flat/Extensions.lean` line 101),
`[CommRing R] [Module.Flat R M] [Module.Flat R P] : Module.Flat R (M × P)`; the probe closes
`Module.Flat R (M × N)` by `inferInstance`. The Tau Ceti supplier contract (README 140) lists
only `Module.Flat.pi`.

**Repair.** Cite `Module.Flat.prod` in 2.1's `*Needs:*` line and in the Tau Ceti contract as the
instance direction; the target keeps the two equivalences (Tau Ceti's instance is over
`CommRing`, the Lean statements over `CommSemiring`: say so in one clause, or state the
equivalences over `CommRing`).

## R07 (P3) — 5.4's carrier is ClassicalArithmeticCompletion §3.6's `Int(D)`

**Location.** README 40: "the one carrier this roadmap defines, the subalgebra
`Polynomial.intValued` of `ℚ[X]`"; README 733–734.

**Witness.** ClassicalArithmeticCompletion (on main) §3.6 "The ring Int(D) of integer-valued
polynomials" (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` line 5447) defines
`intValuedPolynomials`, Int(D) as a D-subalgebra of K[X] for a domain `D` with fraction field
`K`, "the main case is Int(ℤ) ⊆ ℚ[X]", with `IntValuedPolynomials.ringChoose_X_mem` (line 5460:
every `Ring.choose X n` lies in Int(ℤ)), which is 5.4's first Check. It does not state the
ℕ-values criterion or Pólya's basis.

**Repair.** Scope names ClassicalArithmeticCompletion §3.6 as the owner of the carrier
(`intValuedPolynomials` at `D = ℤ`), and 5.4 states its two theorems on that carrier; the local
definition in `Suggested.lean` stays only because the basis theorem is not statable without it
(say so in its docstring and in the module docstring), or the two theorems are moved to
ClassicalArithmeticCompletion as a Part II. Either way the sentence "the one carrier this roadmap
defines" goes.

## R08 (P3) — 5.7 does not cite the pinned trace theorem it refines

**Location.** README 790–801 (target 5.7) and the Mathlib contract 130–132.

**Witness.** Tau Ceti `IsSemisimpleModule.nonempty_linearEquiv_of_trace_eq`
(`TauCeti/RingTheory/Semisimple/Trace/Basic.lean` line 109): over a field `k` with `[CharZero k]`,
two finite-dimensional semisimple `A`-modules with the same trace function
`a ↦ trace (Algebra.lsmul k k M a)` are isomorphic, with no finiteness on `A` (the file cites
Lang, *Algebra*, XVII Cor. 3.8). 5.7 is the complementary case: simple modules, `k` algebraically
closed, any characteristic. The roadmap's second Check (semisimple fails in characteristic `p`)
is exactly why the two statements are different; neither README nor Scope mentions the pinned one.

**Repair.** Add the Tau Ceti theorem to the Tau Ceti supplier contract and to Scope ("Supplied
at the pins"), and say in 5.7 in one clause how it differs (algebraically closed, simple, every
characteristic, versus characteristic zero, semisimple, every field). Optionally state the trace
with `Algebra.lsmul k k S a` to match it.

## R09 (P3) — Targets without a locator (previous R01, re-raised)

**Location.** Targets 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.3, 2.4, 2.6, 2.8, 2.9, 2.10, 2.11, 2.12,
3.1, 3.2, 4.1, 4.2, 5.1, 5.2, 5.3, 5.6, 5.7.

**Claim.** Every theorem carries a locator; "(classical)" (README 282, 308, 527, 549, 795) is not
one. Re-raised: r4 R01.

**Repair.** One locator per surviving target. Candidates checked or standard: 1.8 Robinson, *A
Course in the Theory of Groups*, §5.1 (normal closure) with the perfectness argument as the
roadmap's own; 2.11 and 2.9 Lam, *Lectures on Modules and Rings*, §3 (3.17–3.19, divisible modules
over principal ideal domains, `K ⁄ A`); 2.12 Atiyah–Macdonald, Prop. 6.8 and Thm 8.5 (finite
length and Artinian quotients), or Matsumura, *Commutative Ring Theory*, Thm 6.5 and §2; 5.7
Lang, *Algebra*, XVII §3 (the Tau Ceti reference) with Jacobson density XVII Thm 3.2; 4.2 EGA
IV₁ §1.10; 5.1, 5.3, 5.6 a standard text or "the author's own, by the route given".

## R10 (P3) — Process narrative in Downstream consumers (previous R02, re-raised)

**Location.** README 830–831: "No roadmap on main names this one (`git grep -w
GrothendieckNotesLemmas` on main and on the heads of the open roadmap pull requests)."

**Repair.** Delete the sentence; keep "PCurvature (Layers 1.1 and 1.4) consumes 3.2: …" (the
citation resolves: PCurvature README lines 126–127 cite §3.2 with the two names).

## R11 (P3) — 1.1's route names a lemma that does not apply (previous R03, re-raised)

**Location.** README 163–164: "the forward direction is `Nat.Prime.dvd_choose_pow` applied to
the base-`p` digits".

**Witness.** `Nat.Prime.dvd_choose_pow` (`Mathlib/Data/Nat/Multiplicity.lean` line 253) is
`p ∣ (p ^ n).choose k` for `k ≠ 0`, `k ≠ p ^ n`; for `n = 6`, `p = 2`, `e = 1`, `k = 1` the
target needs `2 ∣ 6.choose 1`, and no `(2 ^ m).choose k` occurs.

**Repair.** Both directions are Lucas: for `0 < k < p ^ e` some digit `k_i`, `i < e`, is nonzero
while `n_i = 0` when `p ^ e ∣ n`, so `n_i.choose k_i = 0` in `Choose.choose_modEq_prod_range_choose`
(`Mathlib/Data/Nat/Choose/Lucas.lean` line 89); or cite Kummer. Replace the lemma name in the route
and in the Mathlib contract (README 101).

## R12 (P3) — Namespace and unused import (previous R04, re-raised)

**Location.** README 116 and 506 (`quotTensorEquivQuotSMul`); `Suggested.lean` line 4.

**Witness.** The declaration is `TensorProduct.quotTensorEquivQuotSMul`
(`Mathlib/LinearAlgebra/TensorProduct/Quotient.lean` line 153). No statement of `Suggested.lean`
uses `Module.Flat.pi` (the instance is one direction of `Module.Flat.pi_iff`'s proof); the file
elaborates without the import.

**Repair.** Write the full name; drop the import line (or keep it only if a statement comes to
use the instance).

## Verified sound

**Gate and build.** The worker's gate at 1fe3ecc passes every check (`depcheck=0`, `build=0`,
`sorry-data=0`, `set_option=0`, `stray-files=0`, `outside-folder=0`); `git diff --stat
origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`,
`metadata.toml` only. `lake env lean` on `Suggested.lean` from the worktree: 46 `declaration uses
sorry` warnings, nothing else, 13 s. Dependency check with `--movable` on the candidate merge
order: `depcheck: 240 roadmaps, 2350 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

**Signatures.** The worker's `#check @name` listing of all 47 declarations was compared with each
README statement: none lost a section binder. The eleven new declarations carry exactly the README
hypotheses: 1.8 `[Group.IsPerfect H]` on a `Subgroup G`; 1.9 `[CommRing R]` only, with
`Q.natDegree ≤ n` (resp. `≤ m`) and the product's own `natDegree`; 2.11 `[IsPrincipalIdealRing A]
[Field K] [IsFractionRing A K]` for the Baer statement and `t ≠ 0` for the torsion isomorphism;
2.12 `[IsNoetherianRing R] [Ring.KrullDimLE 1 R] [Module.Finite R M]` with `Module.IsTorsion R M`;
5.7 `[IsAlgClosed k] [Ring A] [Algebra k A]`, `[IsScalarTower k A S] [IsSimpleModule A S]
[FiniteDimensional k S]` and the same for `T`.

**One-tactic probe.** A copy with every `sorry` replaced by `first | rfl | simp | infer_instance
| (nontriviality R; simp) | (nontriviality R; simp [*]) | simp [*]` was elaborated from the
worktree: all 46 theorems fail (46 errors, one per declaration). Nothing closes in one tactic; the
1.9 statements close in two or three (R05). The only `def`, `Polynomial.intValued`, has a real body.

**Duplication witnesses** (scratch probe `Dup.lean` importing Mathlib and the three Tau Ceti
modules, oleans built with `lake build` of those modules, 5 s, no error): 2.9 first statement by
`exact Module.Baer.of_surjective_smul hQ`; `Module.Injective A (K ⧸ range (Algebra.linearMap A K))`
by `inferInstance`; 3.1 first statement by `exact Derivation.leibniz_prod D s f`;
`Module.Flat R (M × N)` by `inferInstance`.

**Library declarations opened at the pins** (file, line). Mathlib: `Polynomial.resultant` with
`optParam` degrees (`RingTheory/Polynomial/Resultant/Basic.lean` 131), `resultant_comm` (149,
`(-1) ^ (m * n)`), `resultant_C_right` (360, `f.coeff m ^ n * r ^ m`), `resultant_one_left` (364),
`resultant_X_sub_C_left` (371, `(X - C r).resultant g 1 n = eval r g` for `g.natDegree ≤ n`),
`resultant_X_sub_C_right` (389), `resultant_eq_prod_eval` (474, `[IsDomain R]`, `f.Splits`),
`resultant_mul_left` (577), `resultant_prod_left` (637), `resultant_prod_right` (650);
`Group.IsPerfect` (`GroupTheory/IsPerfect.lean` 41, `commutator G = ⊤`), `Subgroup.isPerfect_iff`
(50, `⁅H, H⁆ = H`), no normal-closure statement in that file; `Subgroup.normalClosure_le_normal`
(`Algebra/Group/Subgroup/Basic.lean` 665); `isFiniteLength_quotient_span_singleton`
(`RingTheory/OrderOfVanishing/Basic.lean` 293, `[IsNoetherianRing R] [Ring.KrullDimLE 1 R]`,
`x ∈ nonZeroDivisors R`), `isFiniteLength_iff_isNoetherian_isArtinian`
(`RingTheory/FiniteLength.lean` 76), no torsion-module statement in either file;
`IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`
(`RepresentationTheory/AlgebraRepresentation/Basic.lean` 28, `[IsSimpleModule A V]
[FiniteDimensional k V] [IsAlgClosed k]`), `Module.Finite.toModuleEnd_moduleEnd_surjective`
(`RingTheory/SimpleModule/Basic.lean` 573, under `[IsSemisimpleModule R M]` at 557 and
`[Module.Finite (End R M) M]`), `Module.IsTorsion` (`Algebra/Module/Torsion/Basic.lean` 223,
annihilated by a nonzerodivisor), `IsAssociatedPrime` (`RingTheory/Ideal/AssociatedPrime/Basic.lean`
98, the radical of an annihilator, as the Conventions say), `Nat.Prime.dvd_choose_pow`
(`Data/Nat/Multiplicity.lean` 253), `Choose.choose_modEq_choose_mod_mul_choose_div` and
`choose_modEq_prod_range_choose` (`Data/Nat/Choose/Lucas.lean` 39, 89),
`TensorProduct.quotTensorEquivQuotSMul` (`LinearAlgebra/TensorProduct/Quotient.lean` 153),
`Derivation.leibniz_zpow` (`RingTheory/Derivation/Basic.lean` 511, over a field),
`Module.Baer.injective` and `of_injective` (`Algebra/Module/Injective.lean` 402, 407, the latter
with `[Small.{v} R]`), `ContinuousMap.continuous_curry` (`Topology/CompactOpen.lean` 450,
`[LocallyCompactSpace (X × Y)]`), `continuous_uncurry_of_continuous` (458, `[LocallyCompactSpace
Y]`), `continuous_uncurry` (471, both), the `FaithfulSMul R K` instance of a fraction ring
(`RingTheory/Localization/FractionRing.lean` 170), `PadicInt.mahlerEquiv`
(`NumberTheory/Padics/MahlerBasis.lean` 353), `Algebra.FormallySmooth.iff_split_injection`
(`RingTheory/Smooth/Basic.lean` 290, Stacks 031I, the conormal sequence of a surjection: not 2.7).
Tau Ceti: `Module.Flat.pi` (`RingTheory/Flat/Pi.lean` 62), `Module.Flat.prod`
(`RingTheory/Flat/Extensions.lean` 101), `Module.Baer.of_surjective_smul` and
`Submodule.injective_quotient_of_divisionRing` (`Algebra/Module/Injective/PrincipalIdealRing.lean`
38, 58), `Derivation.leibniz_prod` (`RingTheory/Derivation/Basic.lean` 57),
`IsSemisimpleModule.nonempty_linearEquiv_of_trace_eq` (`RingTheory/Semisimple/Trace/Basic.lean`
109), `Matrix.pairMinor_mul` (`LinearAlgebra/Matrix/Minor.lean` 127),
`Matrix.det_mul_eq_sum_prod_mul_det_submatrix` (`LinearAlgebra/Matrix/MaximalMinor.lean`, section
`Int`), `TauCeti.Units.coe_inv_mem_adjoin` (`RingTheory/Adjoin/Unit.lean`),
`IsEssential.primaryComponent_eq_top` (`Algebra/Module/Torsion/Essential.lean` 56, a step of the
Stacks route for 2.5, no injectivity statement), `Nat.forall_not_dvd_choose_iff` and
`card_filter_not_dvd_choose` (`Data/Nat/Choose/Digits.lean` 146, 101, counting consequences of
Lucas, not 1.1 or 1.2), `IsCompact.eq_sInter_of_stableUnderGeneralization`
(`Topology/Spectral/ConstructibleTopology.lean` 132, prespectral spaces, not 4.2). No Tau Ceti file
mentions `injective_primaryComponent`, a nilpotent-ideal adic completeness, `hasseDeriv` with
`expand`, an `iff` form of `isCoprime_X_sub_C`, a bijectivity of `piRightHom`, a Noetherian-ring
criterion by finite presentation, the range of `rTensor` in coordinates, a ℚ-smul membership
criterion, a retraction of `mapBaseChange`, associated primes under flatness, a perfect normal
closure, a torsion finite-length statement, a symmetric Pascal determinant, integer-valued
polynomials, a right-zero criterion, the Binet–Cauchy or Lagrange identity, the trace of odd powers
of a difference of idempotents, or common denominators in `GrothendieckGroup`.

**Cross-roadmap citations resolved.** Scope deferrals: AlgebraicKTheory (open head) §1.3
"Whitehead's lemma" (line 244) and §4.2 "Semilocal rings and Bass's bound" (432);
StableHomotopyKTheory (open head) §3.8 (1069–1071, the perfect radical with perfectness,
normality, maximality, functoriality); ArithmeticStatisticsPartIV (open head) §3.2 "Gaussian
coefficients" (129, the `q`-binomial theorem at 172); HomotopyTheoryOfCategories (open head) 0.1,
0.2, 0.3 (222, 257, 283) and 8.4 "The semi-simplex category" (1034), whose line 1549 names
GrothendieckNotesLemmas as deferring exactly these; QuantumEnvelopingAlgebras (main) §0.3 "Laurent
Gaussian binomials" (267); DerivedModuleAlgebra (main) §§0.4, 0.7, 0.8 (815, 949, 1018);
OperatorTheory/Majorization (main) MAJ-A26–MAJ-A31 (README 173, `Suggested.lean` 83, 90);
GrothendieckEulerForms (main) Layer 0 (178, "bicartesian characterization" at 194). Consumer:
PCurvature (open head) lines 126–127, 255, 340 cite GrothendieckNotesLemmas §3.2 with
`Derivation.lie_mulLeft` and `Derivation.mulLeft_mul_mul_mulLeft_inv`. `scratch/overlaps.md`: no
open pull request changes this roadmap, no cited id is dropped, no id of this roadmap is cited by
another; the closest roadmap in vocabulary, SemisimpleAlgebras (#989), owns semisimple algebras and
Wedderburn theory, not the objects here. Ownership against the open pull requests was checked
through `roadmaps grep` for each object (resultant products, normal closure, `K ⁄ A`, Baer,
integer-valued, finite length, Cauchy–Binet, Hasse derivatives, Pascal, right zero, primary
component, exponential law, Brauer–Nesbitt, traces): the only other owners found are those of
R04, R07 and R08 above; ArithmeticGaloisRepresentations §1.8 (Brauer–Nesbitt, characteristic
polynomials of semisimple representations) is a different statement from 5.7 and needs no citation.

**Sources.** Stacks algebra chapter (cache `b035a1f0`): Proposition 89.3, Tag 059K, line 9878,
printed page 210: `M` finitely presented iff `M ⊗ ∏ Q_α → ∏ (M ⊗ Q_α)` is bijective for every
family, proved (1) ⇒ (2) by a presentation `R^m → R^n → M`, as 2.2 says; Lemma 138.9, Tag 031K,
line 17350, printed page 370: for `A → B → C` with `B → C` formally smooth, `0 → Ω_{B/A} ⊗ C →
Ω_{C/A} → Ω_{C/B} → 0` is split exact, as 2.7 says for the formally smooth case. Stacks dualizing
complexes (cache `f69eee17`): Lemma 3.9, Tag 08XW, line 177, part (2): the `J`-power torsion of an
injective module over a Noetherian ring is injective, as 2.5 says. Chase 1960 (cache `1ce8c513`):
Theorem 2.1, line 139, printed page 460: products of flat right modules are flat iff every finitely
generated left ideal is finitely related, as 2.1's third Check says. The sampled targets 1.5, 1.6,
1.8, 1.9, 2.4, 2.8, 2.9, 2.10, 2.12, 3.1, 3.2, 4.1, 4.2 and 5.7 carry no locator (R09); their
statements were recomputed below.

**Adversarial table.** One row per statement, values on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `p ^ e ∣ n ↔ ∀ 0<k<p^e, p ∣ n.choose k` | n=0; e=0; (2,6,1); (2,6,2); (5,10,1); n=p^e, k=p^e excluded | n=0: both true. e=0: `1 ∣ n`, RHS vacuous. (2,6,1): C(6,1)=6 even. (2,6,2): 4∤6, C(6,2)=15 odd. (5,10): 10,45,120,210 ≡ 0. Converse: j=v_p(n)<e, k=p^j: Lucas C(n,p^j) ≡ n_j ≢ 0 | true | route lemma: R11 |
| 1.2 `(p^a−1).choose k ≡ (−1)^k [ZMOD p]`, k ≤ p^a−1 | a=0; (3,1); (2,2); k=4 for (3,1) | a=0: C(0,0)=1. (3,1): 1,2,1 ≡ 1,−1,1. (2,2): 1,3,3,1 odd. Digits all p−1, C(p−1,j)≡(−1)^j, parity of k = Σ k_i for odd p. k=4>2: C(2,4)=0 | true | none |
| 1.3 kernel of hasseDeriv k, 0<k<p^e, = image of expand (p^e) | ZMod 3: X^3, X^4; e=0; ℚ; zero ring | coeff of X^{n−k} is C(n,k)f_n; C(n,k) prime to p is a unit (ℤ/p ⊆ R). X^3: 3X², 3X = 0 = expand 3 X; X^4: 4X³ = X³ ≠ 0. e=0: expand 1 g = g. ℚ: 3X² ≠ 0. Zero ring excluded by `CharP R p` with p prime | true | none |
| 1.4 `hasseDeriv k (expand f * g) = expand f * hasseDeriv k g`, k<p^e | ZMod 2, f=g=X, k=1; k=2; k=0 | Leibniz Σ_{i+j=k} D_i(expand f) D_j g with D_i(expand f)=0 for 0<i≤k (1.3): hasseDeriv 1 (X³)=X² = X²·1. k=2: hasseDeriv 2 (X²)=1 ≠ 0. k=0: identity | true | none |
| 1.5 `IsCoprime (X − C a) q ↔ IsUnit (q.eval a)` | ℤ, a=1, q=X+1; a=0, q=X+1; zero ring | ⇒ evaluate Bézout at a. ⇐ q = c + (X−C a)h, c unit. q.eval 1 = 2, ℤ[X]/(X−1,X+1) ≅ ℤ/2 ≠ 0; q.eval 0 = 1, (X+1)−X = 1. Zero ring: both sides true | true | none |
| 1.6 symmetric Pascal determinant = 1 | n=0,2,3; indexing from 1 | 1; 1·2−1·1=1; 1(12−9)−1(6−3)+1(3−2)=1. Σ_k C(i,k)C(j,k)=C(i+j,i) gives L Lᵀ, L unitriangular. From 1: [[2,3],[3,6]], det 3 | true | none |
| 1.7 `(uv)^n = u^n v^n ⁅v,u⁆^{C(n,2)}` and prime form | n=0,1,2,3; Heisenberg; S₃; Q₈; p=3 | vu = d uv, v^n u = d^n u v^n; n=2: d¹, n=3: d³. Heisenberg corners (uv)²: 3 = 4−1, n=3: 6 = 9−3. S₃: d 3-cycle not commuting, (uv)² = d⁻¹ ≠ d. Q₈: d=−1, (ij)²=−1 ≠ 1 = i²j². p odd ∣ C(p,2) | true | none |
| 1.8 normal closure of a perfect subgroup is perfect | H=⊥; 𝔄₅×1 in (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃; 𝔄₄ ≤ 𝔄₅; 𝔄₅ ≤ 𝔖₅ | ⁅N,N⁆ normal, ⊇ ⁅H,H⁆ = H, so N ≤ ⁅N,N⁆ ≤ N. ⊥: closure ⊥. Wreath: closure 𝔄₅×𝔄₅, order 3600, perfect. 𝔖₃: closure 𝔖₃, ⁅𝔖₃,𝔖₃⁆ = 𝔄₃ ≠ 𝔖₃. 𝔄₄: ⁅𝔄₄,𝔄₄⁆ = V₄. 𝔄₅ normal in 𝔖₅ | true | locator: R09 |
| 1.9 `Res(∏(X−αᵢ), Q; #s, n) = ∏ Q(αᵢ)`, n ≥ deg Q | s=∅; Q=C c, n=0; α=(2), Q=X−5; α=(0,1), Q=X−2; α=(1,1); zero ring | s=∅: `resultant_one_left` gives (−1)^0·coeff^0 = 1. Q=C c: `resultant_C_right` 1^0·c^{#s}. Res(X−2,X−5) = −3; Res(X−5,X−2) = 3. X²−X vs X−2: (−2)(−1)=2 = P(2). (1,1): (−1)²=1. Zero ring: 0=0 | true | padding: R05 |
| 1.9 reversed order `(−1)^{m·#s} ∏ Q(αᵢ)`; two products `∏∏(αᵢ−βⱼ)` | m=1, α=(2), Q=X−5; m=1, α=(0,1), Q=X−2; (X²−1, X−3) | `resultant_comm`: (−1)^{1·1}(2−5)=3; (−1)^{1·2}·2 = 2 = P(2). Two products: (1−3)(−1−3) = 8 = Res(X²−1, X−3) | true | R05 |
| 2.1 `Flat (Π Mᵢ) ↔ ∀ i, Flat Mᵢ`, ι finite; `Flat (M × N) ↔ …` | ι=∅; ℤ×ℤ/2; ι infinite | ι=∅: zero module flat, RHS vacuous. ℤ/2 ⊗ (2·): 0 on ℤ/2, not injective; summand of a flat module is flat (`directSum_iff`, `of_linearEquiv`). Chase: `R^ℕ` not flat over a non-coherent R | true | instance: R06 |
| 2.2 `piRightHom` bijective, M finitely presented | M=R; ι finite; M=ℚ, Pₙ=ℤ/2ⁿ | M=R: identity on Π Pᵢ. ι finite: `piRight`. ℚ: Π(ℚ⊗ℤ/2ⁿ)=0 but (1,1,…) has infinite order so ℚ ⊗ Π ≠ 0 | true (059K) | none |
| 2.3 Noetherian ↔ every f.g. module in Type v f.p., `Small.{v} R` | ℤ; k[x₁,x₂,…]; left vs right | ℤ: diagonal presentations. k[x_i]: R/(x_i) ≅ k f.g., kernel not f.g. ⇐: Shrink (R ⧸ I) in Type v, f.p. forces I f.g.; left ideals match `IsNoetherianRing` | true | none |
| 2.4 range of `f.rTensor N` in basis coordinates | ℤ, f=2·, N=ℤ²; f surjective; f=0 | `f.rTensor N` = `Finsupp.mapRange f` in coordinates; (2,4) in, (2,3) out; all; only 0 | true | none |
| 2.5 `I.primaryComponent Q` injective, A Noetherian, Q injective | ℤ, ℚ/ℤ, (p); ℚ; I=0; I=⊤; ℤ/4 | Prüfer group divisible. ℚ: 0. I=0: I¹=0, all of Q. I=⊤: ⊤ⁿ=⊤, component 0. ℤ/4 its own (2)-component, 2· not surjective | true (08XW) | none |
| 2.6 `IsAdicComplete I M`, I nilpotent | ℤ/4, (2); I=0; ℤ, (p) | Iᴺ=0: Hausdorff and Cauchy sequences eventually constant. ℤ_p uncountable | true | none |
| 2.7 retraction of `mapBaseChange` when H¹=0, Ω projective | k→k[t]→k; T=S; k[t]/(t²), char≠2 | Jacobi–Zariski gives injectivity, projectivity splits. k dt → 0 not injective, H¹=(t)/(t²). T=S: isomorphism. t dt ↦ 0 in T dt/(2t dt), H¹=(t²)/(t⁴) ≠ 0 | true (031K) | none |
| 2.8 `q • x ∈ P ↔ q ∈ ℤ`, x indivisible | ℤ⊆ℚ, x=1; x=2; ℤ², (1,2), q=3/2; x=0 | q=a/b lowest terms, sa+tb=1 puts (1/b)x in P, b unit. (1/2)·1 ∉ ℤ; x=2=2·1 excluded, (1/2)·2 ∈ ℤ; (3/2,3) ∉ ℤ²; x=0 fails the hypothesis at m=0 | true | none |
| 2.9 Baer over a principal ideal ring; injective ↔ divisible over a PID; quotients | I=0; (r), r≠0; ℚ/ℤ; ℤ; ℤ/4 over ℤ/4; ℚ→ℚ/ℤ | g on (r): r q' = g r, x ↦ x q'. ℚ/ℤ divisible; 2· misses 1 in ℤ. ℤ/4 self-injective but 2· not surjective, ℤ/2 not injective ((2)→ℤ/2, 2↦1 has no extension) so `IsDomain` needed | true | Baer: R01 |
| 2.10 `a ∉ p` regular on F/pF; associated primes of F/(pB)F lie over p | ℤ, (2), a=3; p=(4); F=ℤ/2; ℤ→ℤ/4; ℤ→ℤ[i], (5) | F/pF ≅ A/p ⊗ F, a regular on the domain A/p. 3 acts as 1 on ℤ/2. 2·2=0 in ℤ/4. 2 kills ℤ/2. P = √ann(x̄), x̄ ≠ 0, a ∈ P∖p: aⁿx̄=0 contradicts regularity; (pB)•F = p•F as sets. ℤ/4: ann(2)=(2) over (2) ≠ (0). ℤ[i]/5 ≅ 𝔽₅²: (2±i) over (5) | true | none |
| 2.11 `K/A` Baer (A PIR); `(K/A)[t] ≅ A/(t)`, t ≠ 0 | ℤ⊆ℚ, t=6; t=0; t unit; k[x,y] | r ≠ 0 invertible in K: divisible. a ↦ a/t mod A: kernel {a : t ∣ a} = tA, image {k : tk ∈ A} = (K/A)[t]; (1/6)ℤ/ℤ ≅ ℤ/6. t=0: ℚ/ℤ torsion ≇ ℤ. Unit: 0 ≅ A/A. k[x,y]: K injective, K/A injective would give id A ≤ 1, Ext²(k,A) ≅ k ≠ 0 | true | injectivity: R02 |
| 2.12 f.g. torsion over Noetherian dim ≤ 1 has finite length | ℤ/12; ℤ; ℚ/ℤ; k[x,y]/(x); field; zero ring | x = ∏ aᵢ nonzerodivisor kills M, M quotient of (R/(x))ⁿ, finite length by `isFiniteLength_quotient_span_singleton`. ℤ/12: 0⊂6ℤ/12⊂3ℤ/12⊂ℤ/12, factors ℤ/2, ℤ/2, ℤ/3. ℤ not torsion. ℚ/ℤ not f.g., chain (1/2ⁿ)ℤ/ℤ. k[y]: chain (yⁿ). Field: M=0. Zero ring: 1 ∈ R⁰, M=0 | true | locator: R09 |
| 3.1 `leibniz_prod`; `leibniz_zpow_units` | s=∅; two-element s, f=a; n=0,1,−1,−2, u=x in ℚ[x,x⁻¹] | D 1 = 0; D(a²)=2a Da vs 2a² Da with s instead of s.erase. n=0: 0=0·…; −1: 0 = D(uu⁻¹) ⇒ D(u⁻¹)=−u⁻² Du; −2: −2x⁻³ | true | `leibniz_prod`: R03 |
| 3.2 `⁅D, mulLeft a⁆ = mulLeft (D a)`; `u D u⁻¹ = D − mulLeft (u⁻¹ Du)` | k[x], a=x; a ∈ k; u=x at 1 | D(ax')−aDx' = x'Da. a=x: identity; a∈k: 0. u D(u⁻¹x') = Dx' + u x' D(u⁻¹) = Dx' − u⁻¹x' Du; at 1: x·D(x⁻¹) = −x⁻¹ | true | none |
| 4.1 curry continuous (X locally compact; X R1); uncurry continuous (X R1, Y locally compact) | X=pt; ℚ×[0,1]; ℝ³; f(x,y)=x−y | Locally compact: for x ∈ K pick basic ⋂M(Lᵢ,Uᵢ) ⊆ V around f₀(x,·), compact nbhd Cₓ inside its preimage, finite subcover, N = ⋂M(Cⱼ×Lᵢ,Uᵢ). R1: compact K is R1, open covers shrink to closed (compact) pieces. Uncurry: for x ∈ π₁(C), Dₓ = π₂(C ∩ (cl{x}×Y)) compact with g₀(x)(Dₓ) ⊆ U (inseparable points have inseparable images), compact nbhd Lₓ ⊇ Dₓ with g₀(x)(Lₓ) ⊆ U, Eₓ = π₁(C ∩ (X×(Y∖int Lₓ))) compact missing cl{x}, so separated from x in R1; shrink the cover of π₁(C) to closed Fⱼ; N = ⋂M(Fⱼ, M(Lⱼ,U)). curry f 1 0 = 1 | true | none |
| 4.2 openness criterion | Spec ℤ, {(0)}; Spec ℤ∖{(2)}; Sierpiński | Noetherian induction on closed Y: reducible splits; irreducible with generic η: η ∉ E ⇒ E∩Y=∅; η ∈ E ⇒ W∩Y ⊆ E and E∩(Y∖W) open by induction. {(0)}: W=Spec ℤ ⊄ E. Complement of (2): W=E. {1}: stable and open; {0}: 1 generalises 0 | true | none |
| 5.1 right zero ↔ right ideals meet ∧ no group quotients | trivial; finite group; {1,a,b}; (ℤ/n,·) | ⇒ up=p=vp; f(u)f(p)=f(p). ⇐ minimal principal right ideal K=kM: ukM ∩ kM ∋ x, xM = kM ⊆ ukM, |ukM| ≤ |kM|, so u permutes K; u ↦ (k' ↦ uk') ∈ Perm K trivial, so any p ∈ K is a right zero. Group: identity nontrivial. Left zeros: aM={a}, bM={b} disjoint, f(a)=f(a)², ba=b. ℤ/n: 0 | true | none |
| 5.2 Cauchy–Binet for minors | n=0; n=1; card ι<n; A=[[1,0,1],[0,1,1]], B=Aᵀ | 1=1·1; matrix product; empty sum = 0 = det of rank ≤ card ι; det [[2,1],[1,2]] = 3 = 1²+1²+(−1)² | true | owner: R04 |
| 5.3 Binet–Cauchy over a ring; Lagrange over `RCLike` | a=(1,0), b=(0,1), c=a, d=b; a=b; a=(1,i), b=i·a | Expand: 2[(Σac)(Σbd) − (Σad)(Σbc)]; pairs (1,2),(2,1) give 1 each, 2 = 2(1−0). a=b: 0. ‖a_ib_j−a_jb_i‖² summed: 2(Σ‖a‖²)(Σ‖b‖²) − 2‖Σ ā_i b_i‖²: 0 = 2(4−4); without conj Σa_ib_i = 0 gives 8 | true | none |
| 5.4 `intValued` from ℕ-values; Pólya basis | C(X,2); X/2; X², X³; −1 | C(X,2) ∉ ℤ[X], integer-valued; X/2 at 1 is 1/2; Newton Σ(Δᵏ P)(0) C(X,k) with integer differences; X² = 2C(X,2)+C(X,1); X³ = 6C(X,3)+6C(X,2)+C(X,1); C(−1,2)=1; X/2 integral on evens, not at 1 | true | carrier: R07 |
| 5.5 `tr (P−Q)^{2k+1} = tr P − tr Q` | P=[[1,0],[0,0]], Q=[[0,0],[1,1]]; (2),(0); 𝔽₂ | C=(P−Q)² commutes with P,Q; (P−Q)C = (P−Q) − (PQP−QPQ); tr(D·PQP)=tr(D·QPQ) for D commuting with P,Q. Q²=Q, P−Q=[[1,0],[−1,−1]], trace 0 = 1−1, (P−Q)²=1, even powers trace 2. 8 ≠ 2. 𝔽₂: 1 = 1−0 | true | none |
| 5.6 common denominators in `GrothendieckGroup M` | (ℕ,·); Multiplicative ℕ; {1,e}; trivial | `surj` at ⊤: x = of a/of c₁, y = of b₁/of c₂, c = c₁c₂. (ℕ,·): of 2 = of 3 (c=0). ℤ: 1 = 3−2, −2 = 0−2. {1,e}: of e = of 1 with c=e | true | none |
| 5.7 simple modules with equal traces are isomorphic (k alg. closed, any char) | k[X]/(X−λ); k=𝔽̄_p, A=k, kᵖ vs 0; A=L×L over 𝔽_p(t), L=k(t^{1/p}) | S ≄ T: End_A(S×T) = k×k by Schur (`algebraMap_end_bijective_of_isAlgClosed`), density on the semisimple S×T gives a acting as a rank-one idempotent on S and 0 on T: traces 1 ≠ 0 in every characteristic. k[X]: trace of X is λ. kᵖ: trace p·a = 0 = trace on 0, not isomorphic (semisimple fails). L×0, 0×L: Tr_{L/k} = 0 (purely inseparable), equal traces, killed by different idempotents | true | cite Tau Ceti: R08 |
| Conventions: `⁅a,b⁆ = aba⁻¹b⁻¹`; Pascal from 0; ordered pairs; radical-of-colon; `curry f x y = f (x,y)`; resultant degrees | rows 1.7, 1.6, 5.3, 2.10, 4.1, 1.9 | Heisenberg corner −1; [[1,1],[1,2]]; witness 2; ℤ/4: √(4) = (2); curry f 1 0 = 1; `resultant f g m n` with `optParam` natDegrees, `resultant_comm` sign (−1)^{mn} | consistent with the pins | none |

**Checks.** All 96 Check bullets (three per target, including the fifteen new ones) were
recomputed in the rows above; none is false, vacuous, or a restatement of its definition.

**Declared gaps.** None declared, none needed: the roadmap consumes no roadmap.

## Not verifiable

- Lucas 1878 (*Amer. J. Math.* 1): the cached file (`lucas1878`, `32ed6315`) is a JSTOR challenge
  page, not the paper, although the manifest records it `certified`; the theorem is verified
  against Mathlib's `Choose.choose_modEq_prod_range_choose` instead. The worker should set the
  entry to `uncertified`.
- Avron–Seiler–Simon 1994 (`ass1994`) and Pólya 1915 (`polya1915`): settled `uncertified`; the
  identities 5.5 and 5.4 cite them for were recomputed (rows 5.5, 5.4).
- Cahen–Chabert 1997 (AMS Surveys 48): no open copy; the statement 5.4 cites it for is the same
  as Pólya's and was recomputed. ClassicalArithmeticCompletion §3.6 cites the open survey
  Cahen–Chabert 2016, "What you should know about integer-valued polynomials", §1, which the
  author may prefer.

## Source issues

- none
