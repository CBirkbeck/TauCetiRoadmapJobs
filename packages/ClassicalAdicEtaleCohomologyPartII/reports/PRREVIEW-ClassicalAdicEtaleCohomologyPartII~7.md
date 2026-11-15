# Review of ClassicalAdicEtaleCohomologyPartII (pull request #1549 at 03b098b)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 03b098b; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- The previous report (of 03b098b) had no finding; nothing is carried.

## Verified sound

**The pull request's text against the head.** Each sentence of the title and description was set beside `TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md` at 03b098b:

| Description sentence | Head | Result |
|---|---|---|
| Title "…: roadmap"; "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" | folder absent on `origin/main`; 1461 insertions, 0 deletions; exactly those three files | agrees: the pull request adds the roadmap |
| "almost coherent nearby cycles, formal canonical sheaves and integral Faltings traces … polystable … rig-isomorphisms and finite wild quotients … mod-p, p-power, integral and rational" | Layers 0–5 headings and `README.md:195` | agrees |
| "Zariski-constructible proper pushforward, field-extension invariance, proper base change for every torsion exponent, constant proper cohomology sheaf on smooth bases" | §§7.4, 7.5, 7.6, 7.7 | agrees |
| "The parent roadmap proves duality and proper base change only away from the residue characteristic" | `README.md:5` (parent §§9.5–9.7 "prime-to-residue duality"), `:1256` and `:1270` (parent §8.4 "when n is invertible in O⁺") | agrees |
| consumers: Diamond étale cohomology, geometric p-adic applications, p-adic Simpson | `README.md:1334` | agrees |
| "Formal duality holds over every complete rank-one valued field in either characteristic" | `README.md:21` (Layer 1: arbitrary complete nontrivially rank-one valued K), `:414` | agrees |
| "arbitrary nonzero block parameters, including units"; "every characteristic-zero nonarchimedean field"; AdicSpacesPartV resolution, not PadicHodgeTheory's; library p-group fixed vectors and perfect pairings | `README.md:7`, `:21`, `:9`, `:38`–`:42` | agrees |
| "Roadmaps on main are cited by name; everything else named in the README is a consumer" with the nine open suppliers of the dependency list | README suppliers not on main: AInfCohomology, AdicCoefficientsAndComparisons, AdicSpacesPartV, ArithmeticGaloisDuality, ClassicalAdicEtaleCohomology, DerivedDeRhamCohomology, DiamondEtaleCohomology, HodgeTateAndCanonicalSubgroups, PadicHodgeTheory: nine, the same nine; the other eleven named roadmaps are on main | agrees |
| "Validation: … 0 … 0 … 0" | gate line below | agrees |

No heading, section, headline or `Suggested.lean` declaration is removed (0 removed, 88 headings and 8 declarations added), so the text leaves no such change unstated.

### Adversarial pass

The diff changes no statement; the rows are for statements the description cites.

| Statement | Instances tried | Values on one side | Values on the other side | Result; change |
|---|---|---|---|---|
| `monomial_root_duality` ("the Lean states only … theorems statable at the pins") | p=2,n=0,m=1; p=2,n=1,m=1; m=0; wrong model τ=0 | n=0: A=𝔽₂, τ(1)=1, τ(t)=τ(0)=0, τ(t²)=0. n=1: τ(x²·1)=x, τ(x²·x)=τ(x³)=0; adj(x)(x)=τ(x²)=x≠0 | formula: 2∤1 gives 0; e=2 gives class of t=0. Linearity: x·τ(1)=x, x·τ(x)=0. e all positive and divisible: quotient exponents all positive, class 0 | well defined on the relation, linear, τ=0 excluded by τ(1)=1; m=0 is A≅End_A(A); none |
| §7.6 all-torsion proper base change ("for every torsion exponent, including the residue prime") | n=1; ℙ¹_C with Y′=Spa C′→Spa C, F=𝔽_p; non-proper closed disc; residue characteristic 0 | n=1: both sides over the zero ring, 0=0. ℙ¹: ranks (1,0,1) in degrees 0,1,2 over C | ranks (1,0,1) over C′. Disc: H¹(D,𝔽_p) grows with C′, so properness is used. Residue characteristic 0: every n invertible in O⁺, the Huber branch alone | agree; none |
| "Trace is summation" Convention behind "finite wild quotients" | split C_p-torsor, p=2 | (1,1)↦0, (1,0)↦1 | unit trace p=0 mod p (`README.md:1002`) | agree; none |

The rows for the untouched statements stand as in the previous review, of 03b098b.

- Gate at 03b098b (`gate.md`): every count 0, `build=0`, OK. Elaboration rerun (`lake env lean` on `Suggested.lean`): one warning, `declaration uses sorry` at line 89, exit 0.
- Dependency check rerun: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Worktree clean at 03b098b; folder diff since the previous review empty; `origin/main...HEAD` outside the folder empty.
- Citations and overlaps (worker's resolver and overlap lists, main 1a19c9f and 475 open heads): no unresolved citation or Lean name, no dropped id, no other pull request changing this roadmap, no second copy.
- Ownership searched by object across main and the open heads: "Faltings trace", "almost coherent", `monomialRootAlgebra`, `monomial_root_duality` occur in no other roadmap; "Zariski-constructible" occurs in ClassicalAdicEtaleCohomology only as source titles and the negative Check that `j_!Λ` on a smaller disc is not Zariski-constructible.
- Seeded sample: no target lies in a changed passage (there is none); the locators stand as verified in the earlier reviews.
- Remark, untouched text: the layers are numbered 0–5 and 7; no Layer 6 exists and nothing cites one.
- Remark, another pull request's text: GaloisActionOnEtaleCohomology (its README lines 40 and 563) names this roadmap's §§5.3–5.9 and §7.5 as a consumer; this README does not cite it, and no object is owned twice.

Overlap check: read ClassicalAdicEtaleCohomology, AInfCohomology, AdicSpacesPartV, AdicCoefficientsAndComparisons, DiamondEtaleCohomology, EtaleCohomologyFoundations, AdicSpacesPartIV, DiamondsAndVStacks; nothing shared (the third list is empty).

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- H, Heuer, *A p-adic Simpson correspondence for smooth proper rigid varieties*, Proposition 2.18: settled as uncertified; §7.7 cites it by locator only.
- The description's "3 independent review rounds and 2 red-team rounds": a statement about the history, not about the head; not checked beyond the report names on the board.

## Source issues

- none

## For the human reviewers

- none
