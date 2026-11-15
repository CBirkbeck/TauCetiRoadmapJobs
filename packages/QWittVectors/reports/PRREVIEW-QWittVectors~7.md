# Review of QWittVectors (pull request #1351 at 4728b2a)

**Verdict:** accepted

Incremental re-review of the 4 lines changed since a42588c (the two dependency-pin sentences of `TauCetiRoadmap/QWittVectors/README.md`, lines 33 and 46), plus the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Three are addressed to Part II extensions of roadmaps on main that exist neither on main nor in an open pull request: `gap:cohomology-completion` … `gap:dga-bockstein` and `gap:dga-quotient`", and lists the four consumers separately.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| README line 33, Mathlib pin `1b1ccf4…` | `lake-manifest.json`; the checked-out package | manifest rev `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; package HEAD the same | Agree |
| README line 46, Tau Ceti pin `2fd255d…` | `lake-manifest.json`; the checked-out package | manifest rev `2fd255d997f47c0b5d834ee416c7015d55444ce5`; package HEAD the same | Agree |
| Lines 35–42: the 13 Mathlib files and 44 declarations cited under the pin | each file path and name at `1b1ccf4` | 13 of 13 files present; 44 of 44 names declared in the file cited | Agree; no citation moved by the pin change |
| Line 42: `cyclotomic_expand_eq_cyclotomic_mul` "over any commutative ring" (`Cyclotomic/Expand.lean:39`) | p=2, n=1 | Φ₁(X²)=X²−1; Φ₂·Φ₁=(X+1)(X−1)=X²−1 | Equal; binders `(R) [CommRing R]`, `¬p ∣ n` as the README says |
| Line 42: `cyclotomic_mul_prime_eq_pow_of_not_dvd` "prime p and characteristic p" (`Expand.lean:132`), README's d=1 values | p=2 and p=3, n=1 | 𝔽₂: Φ₂=X+1=X−1=Φ₁^1; 𝔽₃: Φ₃=X²+X+1=X²−2X+1=(X−1)² | Equal; binders `[Fact p.Prime] [CharP R p]` |
| Line 40: `prod_cyclotomic_eq_geom_sum`, `prod_cyclotomic_eq_X_pow_sub_one` (`Cyclotomic/Basic.lean:355, 335`) | n=2; n=0 | n=2: Φ₂=1+X=[2]_q, Φ₁Φ₂=X²−1; n=0 excluded by `0 < n` in both | Agree with "for n>0 over every commutative ring" |
| Line 46: `WittVector.isAdicComplete_span_p_teichmuller` (`TauCeti/RingTheory/WittVector/Complete.lean:197`) | hypotheses at the pin | `[CharP R p] [PerfectRing R p]`, `[IsAdicComplete (span {ϖ}) R]`; conclusion at `span {p, teichmuller p ϖ}` | Agree with "characteristic p and perfect, complete at (ϖ)" |
| Line 46: `TauCeti.WittVector.continuous_frobenius`, `continuous_frobeniusEquiv_symm` (`…/WittVector/Frobenius.lean:65, 79`) | hypotheses at the pin | both under `[CharP R p]`; only the second adds `[PerfectRing R p]` | Agree with "the inverse also needs perfectness" |
| Line 46: `TauCeti.kaehlerBasisOfFormallyEtale`, `_apply` (`TauCeti/RingTheory/Kaehler/FormallyEtale.lean:80, 84`) | signature at the pin | `Basis ι S Ω[S⁄R] → Basis ι T Ω[T⁄R]` under `[Algebra.FormallyEtale S T]`; value `KaehlerDifferential.map R R S T (b i)` | Agree |
| `BigWitt.ghost_image`, `QWitt.framedGamma_existsUnique` (`Suggested.lean:82, 102`) at the new pins | elaboration | exit 0; the two elaborated types equal those recorded for a42588c | Unchanged |
| Description, Dependencies paragraph | README supplier headings; main | 13 supplier headings: 5 on main (the five named), 8 open (the eight named, the same as the depends-on block) | Agree |
| Description, gaps paragraph | README lines 52, 62, 70, 124–130 and the `*Needs:*` lines | 7 slugs; `gap:cohomology-completion` in §9.5 (line 1275), `gap:dga-bockstein` in §9.3 (1235), `gap:dga-quotient` in §7.2 (956); suppliers per slug as the README names them; §9.6a owns the adapter | Agree |
| Description, consumers sentence and summary block | README "Downstream consumers"; layer headings | 4 consumers, the four named; Layers 7–8 positive-degree complexes and framed calculus; §§9.7, 10.1, 10.2 the three end results | Agree |
| Description's change statement | worker's diff against base | folder added: 1556 insertions, 0 deletions, 4 declarations; three files; outside-folder diff empty | Title "roadmap" and "(README, `Suggested.lean`, `metadata.toml`)" agree |

Rows for statements the diff leaves untouched stand as in the previous review, of a42588c.

- Diff since a42588c: 2 insertions, 2 deletions, README lines 33 and 46 only (the two pin hashes); `Suggested.lean` and `metadata.toml` unchanged; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Gate at this head: every scanner count 0, `depcheck=0`, `outside-folder=0`, `OK`, exit 0; the worker's gate adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the pins: exit 0, two `sorry` warnings (lines 82 and 102), nothing else; single `import Mathlib`.
- Library declarations opened at the pins: 44 Mathlib names in 13 files and 5 Tau Ceti names in 3 files, all present where cited; no old pin hash remains in the folder.
- Cross-roadmap names of the supplier contracts re-resolved at the open heads: PrismaticCohomologyPartII §5.0 and §5.18 (`FramedAlgebra.gamma`, `FramedAlgebra.toQFraming`, `QFraming.qDeriv`, `QFraming.qDeRhamComplex`, `QDeRham.skewDGA`) found; AInfCohomology §AI.1.7 holds the target "Koszul products and integral cohomology" and §AI.1.4 the Bockstein complex; SchemeKTheoryOperations §§6.2.1–6.2.2 present.
- Gaps: 7 slugs in the README, the same 7 in the plan's `gaps`.
- Seeded sample: none of the fifteen targets lies in the changed lines; the diff adds no source locator.
- Remark, no change asked: the summary block's "The route follows Wagner's q-Witt vectors" describes the sources of the proofs; the README makes no such statement and the diff changes no layer.

Overlap check: read HabiroCohomologyFoundations, PrismaticCohomologyPartII, HabiroRings; framed q-de Rham complexes and the q-PD-envelope skew product are owned by PrismaticCohomologyPartII §§5.0, 5.18 and cited, the arbitrary-base skew product by this roadmap's §8.2a; the two Habiro roadmaps only consume.

Source independence: 2 passages compared with 0 sources (changed passages only; both are commit hashes with no source counterpart), none shared; largest share wagner, as in the previous reviews; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The description's sentence on AI assistance (two review rounds and two red-team rounds before the port) describes the job board's history, which is not part of the head; the reports folder holds four red-team reports, consistent with it.
- LeanSearch was unavailable to the worker's library near-match run (Loogle: no same-name hit for the four declarations); `Suggested.lean` is unchanged since the earlier duplication audit.

## Source issues

- none

## For the human reviewers

- none
