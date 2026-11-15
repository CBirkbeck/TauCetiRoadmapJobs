# Review of MultiquadraticPartII (pull request #1420 at 2d8ad48)

**Verdict:** accepted

Incremental re-review of the 104 lines changed since `0e9bc3b`. No finding; the gate passes at this head.

## Previous findings

- R01 — repaired: `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`; README lines 168 and 197 and the `Suggested.lean` docstring carry the same hashes; the targeted build and the elaboration succeed.
- R02 — repaired: the docstring reads "follows from the pinned `genusCharFunNarrowClassGroupHom_mkPrincipal_gen` and `genusCharFunNarrowClassGroupHom_eq_prod_singleton`"; the heading `### From TauCetiRoadmap.AutomorphicSpectralTheory` is gone; no `*Needs:*` line names that roadmap.
- R03 — repaired: `Suggested.lean` has no `example`; the two README sentences about a proved example are deleted; the `[2,0,-6]` Check of 3.1 stays.
- R04 — repaired: the body is the two nested existence tests, with no `choose`; README 3.1 reads "Its value is 1 if Q represents an integer m coprime to δ with `genusCharFun t m = 1`, −1 if … none of that kind, and 0 if …".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 `binaryFormGenusChar`, choice-free body | `[2,0,−6]`, `t={−4}`; `t=∅`, any `Q` (zero form included); `[3,0,−1]`, `t={−4}`; `[1,0,0]` and `[2,0,0]`, `t={−4,8}` | 0 (proved in a scratch copy: `2 ∣ Q(x,y)`, `2 ∣ −4`); 1 (proved: `Q(0,0)=0` coprime to 1, `genusCharFun ∅ 0 = 1`); −1 (values 3, −1: both −1 by `decide`); 1 and 0 | agrees with the 3.1 Checks | none |
| 3.1 evaluation law `binaryFormGenusChar_eq_of_represents` against the new body | `[1,0,−3]`, `δ=−4`, `δ′=−3`; `x²+2y²`, `δ=−4`, `δ′=2` | values 1, −3: `genusCharFun {−4}` is 1 at both (`decide` at −3), body gives 1; values 1, 3: 1 and −1, body gives 1 ≠ value at 3 | true with `δ′ ≡ 0,1 (mod 4)`; the hypothesis is needed (negative control stands) | none |
| 3.1 zero law `binaryFormGenusChar_eq_zero_iff` against the new body | `[2,0,−6]`, `[2,0,0]`, `[1,0,0]`, zero form with `t={−4}` | body is 0 exactly when no represented value is coprime to δ: contents 2, 2, 1, 0 against δ=−4, −32, −32, −4 give 0, 0, 1, 0 | true; uses neither `±1` values nor an even-factor hypothesis | none |
| One-tactic probe, 3.1 laws | `rfl`, `simp [binaryFormGenusChar]`, `simp_all [binaryFormGenusChar]` | all fail; the goal left is the nested `if` against the gcd condition, respectively against `genusCharFun t (Q.eval x y)` | not padding | none |
| 2.1 `χ_t(J) = sign δ`, cited as the identity of AnalyticNumberTheoryPartI §2.1c | `t={−4}` in `D=12`; `t=∅`; `{−4,−3}` | singleton value `P.sign` (pinned statement, `…/GenusCharacter/OrdinaryTwoRank.lean` line 111), product law (`…/NarrowClassGroup.lean` line 222): −1; 1; (−1)(−1)=1. Main's §2.1c, second bullet: `χ(J)=sgn d=sgn d′` | same identity, same normalization | none |

The rows for the untouched statements stand as in the previous review, of `0e9bc3b`.

- Gate at `2d8ad48`: OK, every check 0 (`statement-hygiene=0`, `build=0`, `outside-folder=0`).
- Elaboration from the worktree at its pins: ten `declaration uses sorry` warnings (lines 41–185), nothing else. `#check @binaryFormGenusChar : Finset ℤ → TauCeti.BinaryQuadraticForm ℤ → ℤ`, as README 3.1 states; no binder lost.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Cross-roadmap citations resolved for the changed passages: 3 (AnalyticNumberTheoryPartI §2.1c and §2.25 on main, README lines 1264 and 1790–1798; AutomorphicSpectralTheory §4.19 at its open head, the genus-weighted sums of Weyl integrals). Library declarations opened at the pin: 5 (`genusCharFun`, `genusCharFun_empty`, `isFundamentalDiscr_prod`, the two of the 2.1 row).
- Source locators rechecked for the changed passages: 2 (`duke-imamoglu-toth` line 989 for 2.1; `gross-kohnen-zagier` lines 491, 506 and 525 for the represented-value definition and the existence of a coprime represented integer), both support the statements.
- Pull request text: title and prose agree with the head (a new roadmap; MetaplecticAutomorphicForms the one open supplier; "AnalyticNumberTheoryPartI §2.1c, on main, owns that identity"; ten `sorry` warnings; pins of main). Remark: the generated `depends-on` block still lists AutomorphicSpectralTheory, which the README now names only as a consumer (Downstream consumers, §4.19).
- Remark: Scope names AnalyticNumberTheoryPartI §2.1c as the owner of the sign identity while 2.1 keeps its derivation from the two pinned theorems for every t⊆s; the 2.1 target is untouched text that the previous review passed.
- Overlap check: read EffectiveClassNumbers, FuchsianOrbifoldsPartII, ImaginaryQuadraticClassNumber, HilbertModularSurfaces, MetaplecticAutomorphicForms, ClassicalArithmeticCompletion, QuadraticCharactersAndReduction; nothing shared (FuchsianOrbifoldsPartII cites §§2.3–2.4 of this roadmap as the owner; MetaplecticAutomorphicForms §§7.20a, 7.32-trace own the supplied form characters, which 3.1 extends).

Source independence: changed passages only; 5 passages compared with 2 sources (`duke-imamoglu-toth` line 989; `gross-kohnen-zagier` lines 491, 506, 525), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
