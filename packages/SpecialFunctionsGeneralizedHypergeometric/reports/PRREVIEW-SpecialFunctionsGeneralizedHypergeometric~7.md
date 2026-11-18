# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at 28a94e3)

**Verdict:** accepted

**Summary.** Accepted: both points of the previous review are repaired, and the repair introduced no error. The Thomae group and Dougall's bilateral sum are now stated in `Suggested.lean`, and the recomputed values agree (the group has 120 elements and is `S₅`; the invariant is constant on all 120 images; the bilateral sum matches its Gamma product, also at a positive integer bottom parameter). There are two small corrections and one format note, none blocking. Two questions stay with the human reviewers: the licence of the prior formalization, and the six books that could not be read.

## C01 — The description still says that the Thomae symmetry group is stated in prose

A reader of the description expects no Lean statement of the group, and none of Dougall's bilateral sum. The description says "two added headlines (Sheppard's transformation, Thomae's transformation in symmetric form) with the Thomae symmetry group in prose". At this head `Suggested.lean` states the group in three theorems (`nonempty_closure_thomaeGenerators_mulEquiv`, `natCard_closure_thomaeGenerators`, `regularizedHGFun_thomae_invariant`, lines 479–493) and Dougall's bilateral sum in one (`hasSum_bilateral_dougall`, line 562), with the definitions `bilateralPochhammer`, `thomaeExcess` and `thomaeGenerators`.

The sentence would be right as: "two added headlines (Sheppard's transformation, Thomae's transformation in symmetric form), and Lean statements of the Thomae symmetry group (its isomorphism with `S₅`, its order and the invariance) and of Dougall's bilateral sum".

## C02 — The order of the Thomae group follows from the isomorphism with `S₅` stated just above it

`natCard_closure_thomaeGenerators` (`Suggested.lean`, line 483) asks an implementer for nothing beyond `nonempty_closure_thomaeGenerators_mulEquiv` (line 479): on a copy of the file, taking the isomorphism `e` from that theorem and running `simp [Nat.card_congr e.toEquiv]` leaves only `Fintype.card (Equiv.Perm (Fin 5)) = 120`, which is the cardinality of `S₅`. If the count is kept as a sanity check on `thomaeGenerators`, its docstring would say that it is a corollary of the isomorphism; nothing needs deleting.

## N01 — The list of helpers omits `bilateralPochhammer`

The Conventions say "`Suggested.lean` uses five abbreviations" (`README.md`, line 197), and the module docstring of `Suggested.lean` names the same five; the file has a sixth, `bilateralPochhammer` (line 82), which 6.6 names. "six", with the Pochhammer symbol at integer index added to both lists, would be right.

## Previous findings

- R01 — repaired: "`Suggested.lean` states every headline, each with every conclusion the README attaches to it, except the agreement of 1.2 with the principal branch of the Gauss function"; four theorems and three definitions added, elaborating.
- R02 — repaired: "the limit `d → ∞` of Whipple's transformation, where the balance condition keeps `d − c` fixed, with `(e, f)` then renamed `(d, e)`, termwise in a finite sum"; recomputed below.

## Verified sound

Values are in 20-digit arithmetic, shown rounded.

| Statement | Instances tried | Left side / computed data | Right side / comparison | Result; change |
|---|---|---|---|---|
| `thomaeGenerators`, `natCard_closure_thomaeGenerators` | closure of the generators as integer `5 × 5` matrices | order `120`; permutations alone `12`; map with permutations of `(a, b, c)` alone `120` | README: `120`, `12`, "already generate all of `G`" | agrees; the two new Checks are true |
| `nonempty_closure_thomaeGenerators_mulEquiv` | element orders; centre; derived subgroup | orders `1,2,3,4,5,6`: `1,25,20,30,24,20`; centre `1`; derived subgroup `60` with orders `1,15,20,24` | class sizes of `S₅`; trivial centre over `A₅` forces `S₅` | true; map of the symmetric form has order `5` as the Check says |
| `regularizedHGFun_thomae_invariant` | `x = (0.35+0.2i, 0.45−0.1i, 0.5, 1.7+0.3i, 1.3)`, all 120 images (minimum `Re s = 0.35`) | `1.499080245014 − 0.153571317207i` | same at all 120, deviation `2·10⁻¹⁷` | holds; multisets keep repeated parameters |
| `hasSum_bilateral_dougall`, `bilateralPochhammer` | `(0.3+0.2i, −0.4+0.1i, 1.7−0.3i, 2.6)`; `a = −2`: `(−2, 0.4, 1.8, 2.5)`; `b = d`: `(0.3, 0.6, 2.9, 0.6)` | `2.11198404751 − 0.14804457993i`; `1.50328592997`; `−5·10⁻⁷` (truncation) | same; same; `0` | holds; matches DLMF-16.4 lines 851, 881–883 |
| `hasSum_bilateral_dougall` at a zero denominator | `c = 2`, `(a, b, d) = (0.3, −0.4, 2.7)`, terms with `(1 − c)ₘ = 0` read as Lean's `x/0 = 0` | `2.710440219770` | `2.710440219770` | the junk value agrees with the limit, as 6.6 says |
| 4.5 Sheppard, the limit named for it (previous R02; seeded 4.5) | `n = 3`, `(a, b, d, e) = (0.3, 0.4, 1.6, 1.2)`; Whipple's bottom `d = 10³, 10⁶`, `(e, f) = (1.6, 1.2)` | Sheppard: `0.862630208333` both sides; Whipple: `0.862233851906`, `0.862629811583`; `d − c = −4.1` | limit `0.862630208333`; `a + b − n − d − e + 1 = −4.1` | the limit is the stated one; DLMF-16.4 lines 718, 747 |

The rows for the statements the change does not touch stand as in the previous review, of `89aa877`.

- Source locators checked against the text: DLMF 16.4.14 with its balance condition, 16.4.16 and 16.4.17 with its condition (DLMF-16.4 lines 718, 747, 851, 881–883, 906); all agree with the changed passages.
- Library and roadmap declarations opened: no declaration named `bilateralPochhammer`, `thomaeExcess` or `thomaeGenerators` in the pinned Mathlib or Tau Ceti or in another roadmap's `Suggested.lean`; SpecialFunctionsHypergeometric on main, `Suggested.lean` line 230 (`hasSum_dougall`, the Gamma form over non-integer parameters), which 6.6 cites as its input.
- Cross-roadmap citations in the changed passages: SpecialFunctionsHypergeometric 4.2 and 5.1, present on main with the cited content.
- Elaboration of `Suggested.lean`: exit 0, 64 warnings, all `declaration uses sorry`. Elaborated types of the seven new declarations compared with the README statements: equal; none lost a binder.
- One-tactic probe on the four new theorems (`simp`, `decide`, `infer_instance`, `simp` with the definitions unfolded): none closes; the count closes from the isomorphism (C02).
- Automatic checks at this head: all passed. Dependency check: `depcheck: 218 roadmaps, 2358 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Overlap check: read SpecialFunctionsAppell, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsStruve, SpecialFunctionsConfluent (open) and SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry (main); nothing shared. SpecialFunctionsHypergeometric 4.2 owns the Gamma form of Dougall's bilateral sum; 6.6 cites it and owns the Pochhammer form, which also covers integer parameters.
- Source independence: changed passages only; 4 passages compared with 1 source (DLMF Chapter 16), none shared; largest share DLMF Chapter 16, 58 of 116 locators; contents not compared again (no layer added, removed or reordered). The six books could not be read.
- Research link: the summation and transformation theory of `ₚF_q` as in Andrews–Askey–Roy (1999) and DLMF Chapter 16 (Askey and Olde Daalhuis); the README names as consumers roadmaps for the Hahn, Racah and Wilson polynomials and for the Meijer `G`-function. Rests on the README's summary, consumers and references.

## Not verifiable

- Andrews–Askey–Roy, Cor. 3.3.4, p. 141 (Sheppard) and Thm. 2.8.2, p. 110 (Dougall's bilateral sum): no legal copy found; theorem numbers and pages not checked.
- Srinivasa Rao–Lakshminarayanan (4.97)–(4.113), pp. 4-17–4-18 (the ten two-term relations): no legal copy found; not checked.
- The other book locators stand unverified as in the previous review.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1271–1290 name the author's `lean-DLMF` (Apache-2.0) as prior proofs and say reused code carries attribution; `Suggested.lean` was not compared with that repository.
- **Not tested.** Six of the seven sources (58 of 116 locators) are books that could not be read legally; wording and arrangement were compared with DLMF Chapter 16 only.
