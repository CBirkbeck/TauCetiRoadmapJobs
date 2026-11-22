# Review of MaxPlusSpectralTheory (pull request #2984 at 6984f90)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. Every Check was recomputed in exact arithmetic, the theorems of Layers 2–4 were tested on 5,609 small matrices without a failure, and every BCOQ locator agrees with the text. There is one small correction (the max-plus semiring does exist at the pin under another name) and one format note, neither blocking. The van der Woude–Olsder paper could not be read legally, so its locators are unverified, and how the author read it is left to the human reviewers.

## C01 — The max-plus semiring exists at the pinned Mathlib as `MinTropical (WithTop ℝᵒᵈ)`, so matrix powers over it are available

The Conventions (README line 45) say that `MaxTropical (WithBot ℝ)` has "no `Semiring` instance at the pin, so matrix powers over it do not exist", and 1.1 then asks an implementer to prove associativity, the identity laws, the addition law of powers and the compatibility of the action for `mpMul`, `mpOne`, `mpPow`, `mpMulVec`. A reader concludes that the library has no carrier for these laws. It has one: `CommSemiring (MinTropical R)` for `[LinearOrderedAddCommMonoidWithTop R]` (`Mathlib/Algebra/Tropical/Basic.lean`, line 583) applies to `R = WithTop ℝᵒᵈ`, whose minimum is the maximum of `ℝ` and whose `⊤` is `ε`. I checked at the pin that both `CommSemiring (MinTropical (WithTop ℝᵒᵈ))` and `Semiring (Matrix n n (MinTropical (WithTop ℝᵒᵈ)))` are found by instance search, and that `Semiring (MaxTropical (WithBot ℝ))` is not. The open roadmap SpanningTreesAndShortestPaths, 3.7, uses Mathlib's matrix powers over `MinTropical (WithTop R)` in exactly this way.

The definitions on `WithBot ℝ` can stay; the smallest change is to the sentence and to the first bullet of 1.1. The sentence would say that the max-plus semiring is available only as `MinTropical (WithTop ℝᵒᵈ)` and that the operations are written on `WithBot ℝ` for readability; the bullet would name, as its route, the entrywise order-reversing identification under which `mpMul`, `mpOne`, `mpPow` and `mpMulVec` become Mathlib's matrix product, `1`, `^` and `Matrix.mulVec`, so that the four algebraic laws are transported and not proved again. The same sentence in the Scope section ("only `MinTropical R` carries a semiring structure", line 601) and in the module docstring of `Suggested.lean` (line 12) would follow.

## N01 — One line of the route of 4.3 runs to about 190 characters

README line 524 ("…so assume `λ = 0`. Let `ρ_i = period (criticalPattern A) i`. The lengths…") is two lines joined; rewrap it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 product, identity, powers | `A=[[0,1],[1,ε]]`; `k=0`; empty type | `A²=[[2,1],[1,2]]`, `A³=[[2,3],[3,2]]`, `A⁴=[[4,3],[3,4]]`; empty sup `⊥` | as stated | C01 (carrier remark) |
| 1.2 `mpPow_apply` | `k=0` with `i=j`, `i≠j`; swap | `k=0`: sum over `Fin 0` is `0`, empty filter gives `⊥`, equal to `mpOne`; swap powers alternate `mpOne`, `A` | holds | none |
| 1.3 cycle means | `[[0,1],[1,ε]]` walks of length ≤ 4; `(ε)` | means `{0, 1/2, 2/3, 1}`, maximum 1; `(ε)`: empty | holds | none |
| 1.5 Kleene plus | swap; `(3)`; 5,609 matrices normalised | swap: all `0`; `(3)`: `A⁺=(3)`, `A²=(6)`; `A⁺ii=0` exactly at critical nodes, 0 failures | holds | none |
| 2.1 eigenpairs | `(ε)`, `x=(0)`; all-`⊥` vector | `A⊗x=(ε)≠μ+0`; all-`⊥` satisfies equation for every `μ`, excluded by finiteness clause | definition determines object | none |
| 2.2 both statements | `diag(0,1)`; `[[1,ε],[ε,2]]`; 1,296 `2×2` matrices, grid eigenpairs | `diag(0,1)`: eigenpairs `(0,(0,ε))`, `(1,(ε,0))`; 6,421 grid eigenpairs, none with `μ>λ` | holds | none |
| 2.3 irreducible eigenvalue | `(3)`; `3×3` example; `(ε)`; empty type; grid | `λ=1`, `A⊗(0,1,−1)=(1,2,0)`; `(ε)` not irreducible (no positive-length path); irreducible grid eigenpairs all `μ=λ`, no `⊥` entry | holds | none |
| 3.1 critical graph, projector | BCOQ Example 3.95 | `λ=0`; arcs `1→1, 3→4, 4→3, 4→4`; nodes `{1,3,4}`; `A⁺` equals the matrix of Example 3.102 | matches source | none |
| 3.2 closed critical walks | all closed walks of critical arcs, length ≤ 6, `n ≤ 3` | 88,703 walks, each of weight `length·λ`; `3→4→4→3` weight 0; `1→2→1` weight −1 | holds | none |
| 3.3 critical walks | `(3)` unnormalised; length 0 against closed walk | weights 3 and 6 without `λ=0`; with `λ=0` closed critical walk has weight 0 = empty walk | holds, hypothesis needed | none |
| 3.4 critical columns generate | Example 3.95; `diag(0,1)`; 15,583 eigenvectors | rhs `(0,−1,−2,−2)` = `x`; `diag(0,1)` unnormalised gives `(ε,ε)≠(0,ε)`; 0 failures | holds | none |
| 3.5 critical columns | `[[−2,−2],[−2,0]]`; 9,762 critical columns; reflexive case | noncritical column `(−2,−2)↦(−4,−2)`; all critical columns fixed; proportionality 0 failures; `i=j` needs `A⁺ii=0` | holds, `hi` needed | none |
| 4.1 critical cyclicity | `[[0,1],[1,ε]]`; swap; 3.95; no critical node | σ = 2, 2, 1; empty lcm = 1 (`Finset.lcm_empty`); noncritical node has `setGcd ∅ = 0` | holds | none |
| 4.2 cyclicity theorem | 3,964 irreducible matrices; `[[0,1],[1,ε]]` | `A^(k+σ)=σλ+A^k` on the tested window, 0 failures; example fails exactly at `k=0,1` | holds | none |
| 4.3 divisibility | 5,609 matrices, `p ≤ 12`, reducible included; nilpotent; block matrix | 46,833 observed eventual periods, all multiples of σ; nilpotent: σ=1; block: σ=2, `p=1` fails | holds | none |
| 4.4 convergence criterion | 585 irreducible matrices with `λ=0`; `η=1/4`; `3×3` example; swap | iff holds, 0 failures; `Q=[[−1,−1],[0,0]]`, equal from `k=4`; `3×3`: from `k=4`, differs at `(2,3)` for `k=3` | holds | none |

- Source locators checked against the text: 20 of BCOQ (§2.3.1 p. 43, §2.3.2 p. 46, §3.2.4, Theorem 3.23, Remark 3.24, Example 3.26, Definition 3.94 to Example 3.113; BCOQ lines 2486–2700, 5769–5880, 7279–7700); 0 of van der Woude–Olsder.
- Library declarations opened at the pin: 12 (`Matrix.IsIrreducible` Irreducible/Defs.lean:83, `Matrix.IsPrimitive` :89, `Matrix.pow_apply_pos_iff_nonempty_path` :116, `Matrix.IsPrimitive.isIrreducible` :183, `Quiver.IsSStronglyConnected` ConnectedComponent.lean:94, `Nat.setGcd` FrobeniusNumber.lean:85, `Nat.setGcd_dvd_of_mem` :90, `Finset.lcm_empty` GCDMonoid/Finset.lean:57, `Finset.lcm_dvd_iff` :61, `CommSemiring (MinTropical R)` Tropical/Basic.lean:583, Tau Ceti `Nat.eventually_mem_of_setGcd_dvd` FrobeniusNumber.lean:36, `Nat.eventually_mem_of_setGcd_eq_one` :50).
- Cross-roadmap citations resolved: PeriodicNonnegativeMatrices 1.1, 1.3, 1.4 at its open head, with `period` (identical body), `period_eq_period_of_isIrreducible`, `exists_cyclicClasses`, `isPrimitive_iff_period_eq_one`, `pow_period_block`; hypotheses as quoted in the supplier contracts.
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `TauCetiRoadmap/MaxPlusSpectralTheory/Suggested.lean`: 12 `sorry` warnings, nothing else. Elaborated types of all 30 declarations compared with the README: the binders dropped from definitions (`DecidableEq`, `Fintype`) are not used by them; every theorem keeps both.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`, `aesop`): none of the 12 theorems closes.
- Headline theorems of the README (2.2, 2.3, 3.2–3.5, 4.2, 4.3, 4.4): all stated in `Suggested.lean`; no stand-in.
- Automatic checks: all passed; pull-request text agrees with the head (12 theorems, 17 definitions, one open supplier named).

Overlap check: read PeriodicNonnegativeMatrices, SpanningTreesAndShortestPaths, IharaZetaFunction; nothing shared (the period and cyclic classes are owned by PeriodicNonnegativeMatrices and cited; SpanningTreesAndShortestPaths owns min-plus powers of an arrow family with at most `k` arcs, a different statement; ownership was checked against the open pull requests by object search for max-plus, cycle mean and critical graph).

Source independence: 12 passages compared with 1 source (BCOQ), none shared; largest share BCOQ, 25 of 35 locators; contents compared with BCOQ: independent (Layer 3 gathers §3.7.1–3.7.3 and Layer 4 reverses §3.7.4–3.7.5 and takes its route elsewhere; the order of 3.2–3.5 is forced by their Needs lines). The text of van der Woude–Olsder could not be read.

Research link: The roadmap states the max-plus Perron–Frobenius theory of Baccelli–Cohen–Olsder–Quadrat (1992, §3.2.4 and §3.7) and the exact cyclicity theorem of van der Woude–Olsder (2005), the basis of the analysis of timed event graphs; rests on the README and on BCOQ as read.

## Not verifiable

- van der Woude–Olsder, all locators (Example 4.1 and §IV.B p. 7805, Lemma 4.2 and Theorem 5.1 p. 7806, Special case 5.3 and Lemma 5.2 p. 7807, Lemma 6.1, Propositions 6.2 and 7.1, Lemmas 7.2–7.3, §§VIII–IX): the DOI resolves only to the publisher's page, which is not open; no legal copy found. This affects the citations of 4.1, 4.2 and 4.4; the statements themselves were tested numerically and the route of 4.2 is written out in the README.

## Source issues

- none

## For the human reviewers

- **Licence.** The pull-request description says the van der Woude–Olsder locators "were read on a copy of the proceedings hosted by a third party"; the paper (doi:10.1109/CDC.2005.1583423) has no open copy I could find, so its ten locators are uncertified.
- **Scope.** The cyclicity theorem 4.2 in full generality is cited to a conference-proceedings paper (IEEE CDC-ECC 2005); the monograph BCOQ, Theorem 3.112, states it under an extra connectedness hypothesis (BCOQ line 7658).
