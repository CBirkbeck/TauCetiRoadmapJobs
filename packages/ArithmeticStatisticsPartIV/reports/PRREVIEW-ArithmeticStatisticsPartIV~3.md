# Review of ArithmeticStatisticsPartIV (pull request #1172 at 87e4cd8)

**Verdict:** needs changes

Incremental re-review of the 2 changed lines since `56759b5`. The changed locator sentence is correct. The gate fails at this head on `statement-hygiene` (5 hits, all P3), and one sentence of the description is out of date. No P1 or P2 finding.

## R01 (P3) — gate `statement-hygiene`: `[Fintype F]` beside `[Field F]` (4 hits)

**Location.** `TauCetiRoadmap/ArithmeticStatisticsPartIV/Suggested.lean` lines 114, 120, 134, 140: `(F : Type*) [Field F] [Fintype F]` in `matrixKernelLaw`, `matrix_rank_count`, `symmetricKernelLaw`, `macwilliams_symmetric_rank_count`.

**Claim.** The statements need a `Fintype` instance on the field.

**Witness.** Gate at `87e4cd8`: `statement-hygiene=5 … FAIL`; rule: "`[Finite k]` and not `[Fintype k]` beside `[Field k]`". Only `Fintype.card F` uses the instance (lines 117, 124–126, 137, 144–146).

**Repair.** Replace `[Field F] [Fintype F]` by `[Field F] [Finite F]` in the four declarations and every `Fintype.card F` by `Nat.card F`. Tested on a scratch copy: the file elaborates with the same 16 `sorry` warnings and nothing else, including `koymansPaganoRankIdentity` and the three `ZMod 2` limit theorems that use the two definitions. In `README.md` line 786 the `*Needs:*` item `Fintype.one_lt_card` then becomes `Finite.one_lt_card`.

## R02 (P3) — gate `statement-hygiene`: `fk_good_subspace_bijection` concludes `Nonempty (… ≃ …)`

**Location.** `Suggested.lean` lines 177–178: "`theorem fk_good_subspace_bijection (k : ℕ) : Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2))`".

**Claim.** This states the bijection of `README.md` line 878 ("the bijection sends `F≤X=span(b_{j,1})` to `F⊕F^⊥≤X⊕Y`").

**Witness.** The Lean asserts only that some bijection exists, that is, equality of two cardinalities; the README names the map. Gate rule: no theorem concluding `Nonempty (A ≃ B)` unless named `nonempty_*`.

**Repair.** State the map and its bijectivity (tested: elaborates, the three structure fields are proved, `sorry` only on the theorem):

```lean
/-- The plane `F ⊕ F^⊥` attached to a subspace `F` of `𝔽₂^k`, in the basis
`b_{j,1} = e_{j,1} + e_{j,2}`, `b_{j,2} = e_{j,2}`. -/
def fkGoodPlaneOf (k : ℕ) (F : Submodule (ZMod 2) (Fin k → ZMod 2)) :
    Submodule (ZMod 2) (FKSpace k) where
  carrier := {u | (fun j => (u j).1) ∈ F ∧ ∀ f ∈ F, ∑ j, f j * ((u j).1 + (u j).2) = 0}
  add_mem' := by
    rintro u v ⟨hu, hu'⟩ ⟨hv, hv'⟩
    refine ⟨F.add_mem hu hv, fun f hf => ?_⟩
    have := congrArg₂ (· + ·) (hu' f hf) (hv' f hf)
    simp only [add_zero] at this
    rw [← this, ← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun j _ => ?_
    simp only [Pi.add_apply, Prod.fst_add, Prod.snd_add]; ring
  zero_mem' := ⟨F.zero_mem, fun f _ => by simp⟩
  smul_mem' := by
    rintro c u ⟨hu, hu'⟩
    refine ⟨F.smul_mem c hu, fun f hf => ?_⟩
    have := congrArg (c * ·) (hu' f hf)
    simp only [mul_zero] at this
    rw [← this, Finset.mul_sum]
    refine Finset.sum_congr rfl fun j _ => ?_
    simp only [Pi.smul_apply, Prod.smul_fst, Prod.smul_snd, smul_eq_mul]; ring

/-- The FK good k-planes are exactly the planes `F ⊕ F^⊥`, one for each subspace of F₂^k. -/
theorem fk_good_subspace_bijection (k : ℕ) :
    Set.BijOn (fkGoodPlaneOf k) Set.univ (fkGoodPlanes k) := by sorry
```

In `README.md` add, before the bullet of line 886, "`FieldStatistics.fkGoodPlaneOf`: the plane `{u : (u_{j,1})_j ∈ F, Σ_j f_j(u_{j,1}+u_{j,2}) = 0 for all f ∈ F}`, which is `F⊕F^⊥` in the basis `b`", and reword line 886 to "`FieldStatistics.fk_good_subspace_bijection`: `F ↦ F⊕F^⊥` is a bijection from the subspaces of `𝔽₂^k` onto the good planes, including `k=0`". The target's name, which ArithmeticStatisticsPartV cites, is unchanged.

## R03 (P3) — description: "red-team passes to follow"

**Location.** Pull request description, the validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim.** No red-team pass has been made on this head.

**Witness.** The folder's history at `87e4cd8` has four commits titled "red-team repairs" (`902b51e`, `830d7eb`, `6b52f94`, `e39ae24`) and two rounds of review repairs (`56759b5`, `87e4cd8`).

**Repair.** Write "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; red-team passes and two rounds of review repairs followed (§3.1 rebuilt on ArithmeticStatisticsPartI §0.7, the all-prime limits moved to §3.12, headline theorems stated in `Suggested.lean`)."

## Previous findings

- R01 — repaired: line 151 now reads "the recursion (1.67) in the mirrored form `[n k] = [n−1 k] + t^{n−k}[n−1 k−1]`, from which the displayed recursion follows by the symmetry … (here the displayed recursion is the definition and (1.67) is derived)".
- R02 — repaired: it asked no change in this folder; §3.2 keeps the prose names "Gaussian polynomial" and "Gaussian binomial coefficient" (lines 136–137). ArithmeticStatisticsPartV now links section headings (`#31-field-counts-and-class-group-statistics`), which resolve.

## Verified sound

| Statement | Instances | Values each side | Result | Change |
|---|---|---|---|---|
| Gaussian recursion locator (§3.2, line 151) | (1.67) with `n→n+1, k→n−k`, then symmetry; `t=2`: `[3 1]`, `[4 1]`, `[4 2]` | gives `[n+1 k+1] = [n k] + t^{k+1}[n k+1]`; displayed: `1+2·3=7`, `1+2·7=15`, `7+4·7=35`; (1.67): `3+4·1=7`, `7+8·1=15`, `7+4·7=35`; unmirrored misreading `[n−1 k]+t^k[n−1 k−1]` gives `[3 1]=5` | holds | none |
| Cauchy proof's "equivalent form" (line 167) against (1.67) | (1.67) at `(n+1, k+1)` | `[n+1 k+1] = [n k+1] + t^{n−k}[n k]`, the form quoted | consistent with the new sentence | none |
| `matrix_rank_count` with `Nat.card F` (R01) | `q=2, m=n=r=1`; `q=2, m=n=2, r=1` | `(2−1)(2−1)/(2−1)=1` = one nonzero `1×1` matrix; `(4−1)(4−1)/(2−1)=9` = 9 rank-one `2×2` matrices | repair keeps the statement | R01 |
| `macwilliams_symmetric_rank_count` with `Nat.card F` (R01) | `q=2, s=2, k=1` | `h=0`, `2²−1 = 3` = symmetric rank-one `2×2` matrices over `𝔽₂` | repair keeps the statement | R01 |
| `fkGoodPlaneOf` (R02) | `k=0`; `k=1`, `F=0` and `F=𝔽₂`; the third line | singletons; `{0,(0,1)}`, `{0,(1,1)}`, both with `L=0`; `{0,(1,0)}` has `L=1`, not good; in the basis `b`, `L(u,v)=Σ x_j y'_j`, `dim = dim F + (k − dim F) = k` | bijective onto the 2 = `N(1,2)` good planes | R02 |

Rows for untouched statements stand as in the previous review, of `56759b5`.

- Source locators checked against the text: 1 (Stanley EC1, source `f669d7b0` lines 3051–3062, printed p. 62: (1.67) is the form now quoted; lines 3063–3070, polynomiality by induction, same page). No locator is flagged unverified in the README; the seeded sample falls in the changed passage only at §3.2.
- Gate, run at `87e4cd8`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=5 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL` (R01, R02); the worker's run adds `build=0`.
- Dependency check: `depcheck: 247 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 16 `declaration uses 'sorry'` warnings (lines 58, 62, 67, 86, 95, 105, 120, 129, 140, 149, 155, 162, 177, 181, 196, 221) and nothing else; the Lean file is unchanged since `56759b5`, so the signature comparison and the one-tactic probe of that review stand. The scratch copy with the repairs of R01 and R02 also elaborates with 16 `sorry` warnings only.
- Cross-roadmap citations: the change adds none; the worker's resolver lists no unresolved cross-roadmap citation, and its six "Lean names found nowhere" are this file's own declarations in the `FieldStatistics` and `Distributions` namespaces (lines 169–237).
- Title and description against the head: the title, the summary block and the remaining prose agree with the README and `Suggested.lean` (new roadmap of three files; every prime including 2; EVW contraction for odd primes with the aggregate enlargement inequality, README lines 463–467; characteristic-free symmetric recurrence, line 784; suppliers Part I, PolynomialGaloisGroups, EffectiveBounds), except R03.
- Remark, generated block `depends-on`: it lists AnalyticNumberTheoryPartI and PartII, which the README's "Analytic boundary" paragraph says are not inputs; both are merged, so nothing waits on them.
- Overlap check: read ArithmeticStatisticsPartV, ArithmeticStatisticsPartVII, ArithmeticStatisticsPartI, ArithmeticStatisticsPartVIII, InductionRestrictionPartII, ClassicalArithmeticCompletion, AnalyticNumberTheoryPartII (grep at their heads for Cohen–Lenstra laws, Friedman–Washington, Gaussian coefficients, FK good planes, surjection counts); nothing shared: Parts V, VII, VIII and the q-series and Habiro roadmaps cite this roadmap as consumers, Part I §§0.1 and 0.7 is cited as supplier.
- Source independence: changed passages only; 1 passage compared with 1 source (`f669d7b0` lines 3051–3062), none shared (a formula and a locator); the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The three items of the previous review (MacWilliams 1969 Theorem 2; Cohen–Lenstra LNM 1068 Prop 4.1(ii) and Cor 3.7(i); Cauchy 1843 formula (18)) are untouched by this change and were not reopened.

## Source issues

- none

## For the human reviewers

- none
