# Review of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (pull request #3027 at 3f8c596)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `e47c8ec`: the `*Sources:*` entry of 8.12 (b), which now says how the bound follows from two declarations of the formal proof and how the formal proof's own statement differs, and the supplier contract for AutomorphicBundles, which now lists §12.15. The three declarations were opened and the degree identity recomputed; the description of each is right, and the contract entry repairs the previous small correction. There is no finding. Accepted with one small correction (the credit to `flat_root_twist` leaves out its named premise and its second parameter) and one format note, carried over; neither blocks. Two facts are left for the human reviewers.

## C01 — The credit to `flat_root_twist` in 8.12 omits the named statement it assumes and the second twist it carries

The new sentence of the `*Sources:*` entry of 8.12 (lines 347–350, the sentence beginning "[FormalProof] states") says that [FormalProof] "states the first bound of (b) with the lower bound `Σ_τ w_τ·c_τ − q·log rd_E·Σ_τ|w_τ|` of that degree in place of its value". A reader who opens `GlobalTheory.FlatRootTwist.flat_root_twist` finds two things the sentence does not prepare them for. The theorem opens with the closed premise `GlobalTheory.Published.AbelianDeRham`, and elsewhere this README says of such a credit that it "takes one named statement as a hypothesis" (8.19a′, line 2545; 8.17a, line 1273). And the theorem twists by the weight `(par(w), m)` for a natural number `m`, with the further term `−m·([E:ℚ]/2·(p + q))·(½·log(2π) + log rd_E)` in the lower bound; the bound quoted is its case `m = 0`. The other two declarations cited in the entry (`twSec_of_flat`, `degOn_add_rank_mul_degLo_le`) have no closed premise. Adding "in its case `m = 0`" and ", which takes one named statement as a hypothesis" after the declaration name would make the credit exact.

## N01 — Where `*KNOWN*` and `*NEW*` became `*Sources:*`, the qualifiers they carried still read as if they were sources

Carried over; the text is unchanged. "*Sources:* (this form; …" in 8.14 (line 529), "(statement; …" in 8.14a and 8.14b (lines 595, 660), "*Sources:* ingredients (…" in 8.13, 8.18, 8.18c, 8.18e and 8.19a′ (lines 417, 1411, 1760, 1861, 2475). Dropping "this form;", "statement;" and "ingredients" would fix these.

## Previous findings

The previous report had no finding (no R01); its small correction and format note are accounted for here.

- C01 — repaired: the contract "From TauCetiRoadmap.AutomorphicBundles" (line 2922) now lists "§12.15 (Fourier–Jacobi expansion with vector coefficients: …), used in 8.19a"; the description agrees with §12.15 of AutomorphicBundles at this head.
- N01 — not repaired: the qualifiers stand as before (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.12 `*Sources:*`: degree of the twisting section vs `GlobalTheory.FlatTwisting.twSec_of_flat` (second conjunct) | conclusion read term by term | formal: `t.degLo = Σ w_τ·c1(τ) − q·(lrd E − log H.d)·Σ w_τ`, and `Σ w_τ·c1(τ) − q·lrd E·Σ|w_τ| ≤ t.degLo`, `IntOff B t.lo`. README: the same value and the same lower bound | equal | none |
| 8.12 `*Sources:*`: "`c_τ` the negative of the degree of 8.11 (c)" | definitions `c1`, `degFlat`, `FlatSec`, `flatDegVal` opened | `c1 τ = −` (mean over components of the degree of the flat section with the shifted structure); `flatDegVal = ((p−q)/2)·logOm + q·(log d − lrd E)` = the degree of 8.11 (c) | agrees | none |
| 8.12 `*Sources:*`: the identity `Σ w_τ c_τ − q(log rd_E − log d_K)Σ w_τ = −((p−q)/2)·log Ω·Σ w_τ` | general; `(p, q) = (0, 1)`, `E = K`, `w = 1`; `w = 0` | general: `−Σw·[((p−q)/2)logΩ + q(log d_K − log rd_E) + q(log rd_E − log d_K)]` = right side. `(0,1)`: `(½logΩ_K − ½log d_K) + ½log d_K = ½logΩ_K` on both sides. `w = 0`: `0 = 0` | true | none |
| 8.12 (b), first bound, from that degree and `GlobalTheory.FlatTw.degOn_add_rank_mul_degLo_le` | conclusion read; `w = 0` | formal: `deg(G) + rank·(degLo − Σ_{p∈B} log p) ≤ deg(G + G₀)`; per unit of rank and doubled: `μ(λ+par(w)) ≥ μ(λ) − (p−q)logΩ·Σw − 2Σ log ℓ`. `w = 0`: `μ ≥ μ − 2Σ log ℓ` | the stated bound | none |
| 8.12 (b), two-sided bound | apply the first bound to `(λ + par(w), −w)` | `μ(λ) ≥ μ(λ+par(w)) + (p−q)logΩ·Σw − 2Σ log ℓ`; with the first bound, the absolute value is at most `2Σ log ℓ` | true | none |
| 8.12 `*Sources:*`: lower bound "in place of its value" | `|log rd_E − log d_K| ≤ log rd_E` (8.11 (c)) | `−q(log rd_E − log d_K)·w_τ ≥ −q·log rd_E·|w_τ|` termwise, so the lower bound is at most the value | true | none |
| 8.12 `*Sources:*`: `GlobalTheory.FlatRootTwist.flat_root_twist` | statement read; `m = 0` | formal bound: `Σ w c1 − q·lrd E·Σ|w| − m·([E:ℚ]/2·(p+q))·(log(2π)/2 + lrd E) − logSum(badPrimes)`; at `m = 0` the README's; first premise `GlobalTheory.Published.AbelianDeRham` | as described at `m = 0`; premise and `m` unstated | C01 |
| `S_bad` vs `GlobalTheory.FlatTw.badPrimes` | definition opened | prime factors of `2·H.d·|disc E|·l.M′`; README: primes dividing `2·d_K·d_E` and the level | equal | none |
| Contract entry: AutomorphicBundles §12.15 | section opened at this head | neat good-prime PEL model, finite projective representation `W` of the Levi, canonical extension, coefficients on the abelian torsor `C` | the entry's parenthesis says this; 8.19a's `*Needs:*` cites §12.15 | none |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `e47c8ec`.

- Formal proof: 3 theorems (`twSec_of_flat`, `degOn_add_rank_mul_degLo_le`, `flat_root_twist`) and 9 definitions (`c1`, `degFlat`, `FlatSec`, `FlatExistsAt`, `flatDegVal`, `TwSec.degLo`, `IntOff`, `logSum`, `badPrimes`) opened; the four cited files exist at the first commit of the repository, and the three theorem names are in the kernel export of the proof.
- Seeded sample: of its fifteen targets only 8.12 falls in a changed passage; it was checked as above. The other fourteen are untouched.
- Cross-roadmap citations resolved: 1 (AutomorphicBundles §12.15), present at this head under the cited number and subject.
- Record: no heading, layer, statement or Lean declaration removed since `e47c8ec` or against `main`. The family index changed in 8 lines since `e47c8ec`, none of them an entry or a sentence about this roadmap.
- Automatic checks: all passed. Dependency check: `depcheck: 124 roadmaps, 1428 edges, 0 problem(s)`; the change adds no supplier (AutomorphicBundles was one already, and is on `main`).
- Elaboration of `Suggested.lean`: only the `sorry` warning (line 68). The file is unchanged; the elaborated types of `logPeriod` and `chowlaSelberg_classMean` stand as read before.
- Description read against this head: nothing in it is contradicted; the change removes or renumbers no section, changes no declaration and adds no supplier, so it leaves nothing unstated.

Overlap check: read HeightsForLogSingularMetrics, GluedTargetAndDivisionInequality and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (on `main`) as in the previous review; the list by results named is empty, and no open pull request changes this roadmap. The change adds no object; nothing shared.

Source independence: changed passages only. 2 passages (the `*Sources:*` entry of 8.12 and the contract entry for AutomorphicBundles) compared with 1 source (the Lean source of [FormalProof]) and one supplier roadmap, none shared; largest share [FormalProof], 113 cited files against at most 5 locators for any published source. Arrangement not compared: the change adds, removes or reorders no layer.

Research link: 8.5 is the Chowla–Selberg formula (Chowla–Selberg 1967), read as a Faltings height (Colmez 1993). 8.14–8.19 bring Bost's slope method (Bost 1996), arithmetic Hilbert–Samuel and successive minima (Gillet–Soulé 1992, Zhang 1995, Bost–Gillet–Soulé 1994) and Mumford's proportionality (1977) to unitary Shimura varieties. Rests on the README's References.

## Not verifiable

- 8.12: that the formal proof's degree of the cusp-form lattice on a component, per unit of rank, is the README's `μ̂` (so that `μ = 2μ̂` doubles the change) was read from the README's Conventions, not computed from the proof's definition of the degree.
- Yuan's published version (Compositio Math. 157, 2021): not opened; the README cites the numbering of arXiv:1808.03960. No changed passage cites it.
- Goldstein (1981–1982), Böcherer (2006), Weissauer (1986), Katz (1976, 1978): no legal copy found in earlier rounds; not retried, and no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: of the 30 sections, 15 are labelled "particular to this proof", 14 "adapted from" and one (8.5) "published". The proof is the formal proof of GRH for Dirichlet L-functions announced on 20 November 2026 (README References), which has not been refereed.
- Licence: the repository of [FormalProof] carries no licence. The README cites its file paths and declaration names only and copies no code; whether citing it in this way needs anything more is for a human to read.
- Decisions of the human reviewers for this pull request: neither was needed for this folder, which removes no layer, section or declaration against `main`.
