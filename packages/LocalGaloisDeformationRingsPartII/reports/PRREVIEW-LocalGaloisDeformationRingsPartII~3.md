# Review of LocalGaloisDeformationRingsPartII (pull request #2278 at b936e15)

**Verdict:** accepted

:robot: Incremental AI re-review of 12 changed lines since `6f34703`; no findings.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: README lines 7, 74 and 196 assign rank-three ownership to `LocalGaloisDeformationRings` §6.9 and identify the matrices and shapes at the same index; line 208 distinguishes both incorrect index reversals.
- R02 — repaired: README line 799 specifies “arXiv:2007.05398v2, whose printed pages are cited”; Lemma 7.2.10 is on that version's printed page 107.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| §1.2 comparison: ordered characters (§0.1) | `n=3, f=1, p=7, s=(123), μ=(2,1,0)` | Both type formulas give exponents `(18,198,126) mod 342`; both eigenbases carry dual exponents `(324,144,216)`. | Same ordered characters | R01 repaired |
| §1.2 comparison: summands | `f=3, j=0,1,2` | Both use Frobenius exponents `(0,2,1)`; positive embedding labels would give `(0,1,2)`. | Same summands and index | R01 repaired |
| §1.2 comparison: orientation (§0.3) | Same three-cycle; `a′⁽⁰⁾=(18,198,126)` | Both orientations are `s=(123)`; `s⁻¹a′⁽⁰⁾=(198,126,18)`, strictly decreasing. | Same ordering | R01 repaired |
| §1.2 comparison: conjugation | `s=(123), x=(2,3,5), C=E₁₂` | `Ad(P⁻¹diag(x))(C)=⅔E₃₁=Ad(diag(x_s)P⁻¹)(C)`; reversing the unpermuted factors gives `5/2 E₃₁`. | Same matrix | R01 repaired |
| §1.2 new shape Check | `f=3, s=(1,1,1)`; diagonal matrices of line 208 | Both shapes: `(t^(2,1,0),t^(1,0,0),1)`; negation gives `(t^(2,1,0),1,t^(1,0,0))`; star reversal gives `(1,t^(1,0,0),t^(2,1,0))`. | Both wrong permutations detected | R01 repaired |
| §1.2 comparison: non-principal base change | `n=3, f=1, r=3`; `A⁽ʲ′⁾=I₃` | Upstairs shape `(1,1,1)`; both definitions descend to `(1)`, since `j′ mod f=0`. | Same descended shape | R01 repaired |

The adversarial rows for untouched statements stand as in the previous review, of `6f34703`.

- Sources: 8 new citation groups in README line 196 checked against BHHMS23 lines 612–674, 797–854; LLHL19 lines 346–358, 648–674, 761–796; LLHLM18 lines 334–411, 473–513.
- Pagination: 2 reference entries checked; GHLS17 Theorem D and Theorem 3.1.5, printed pp. 4 and 21 (lines 174, 1041); LLHLM23 Lemma 7.2.10, printed p. 107 (lines 4798–4815).
- Seeded targets within the affected mathematics: 3 (§§0.1, 0.3, 1.2); the comparison also agrees with §1.1's ordered conjugation.
- Supplier citation: 1 distinct affected section resolved at #923, `TauCetiRoadmap/LocalGaloisDeformationRings/README.md` lines 3053–3081; its Frobenius matrix and shape are the objects compared.
- Gate: zero failures; targeted build succeeded. Dependency output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`.
- Lean: direct elaboration and 1 scratch `#check @crossing_prime` passed, with only `sorry` warnings; 0 lost binders, and the signature agrees with §5.3. The targeted build additionally emits a module-system advisory.
- Pull-request text: title, prose and `roadmap-summary` agree with the added folder, retained headlines and suppliers; 0 changes outside the folder, 0 removed sections or declarations.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, ModpRepresentationsOfGL2OverLocalFields and EllipticCurveModularityWild3Adic; the other two closest-roadmap lists are empty. Rank-three eigenbasis matrices and shapes belong to LocalGaloisDeformationRings §6.9; rank-two explicit rings belong here; Serre-weight coordinates belong to ModpRepresentationsOfGL2OverLocalFields Layer 3; general local lifting rings belong to LocalGaloisDeformationRings. No new duplicate owner.

Source independence: changed passages only; 6 mathematical passages compared with 3 sources (BHHMS23, LLHL19, LLHLM18), no copied expression or reused source material found; 2 version entries verified separately. Largest share: BHHMS23, 69 of 94 explicitly located source citations, counting each grouped citation once. No layer was added, removed or reordered; arrangement was not compared again.

## Not verifiable

- Kisin06, Corollary 1.3.15 (§2.1), remains settled as uncertified; outside the changed passages, with no new request.

## Source issues

- none

## For the human reviewers

- **Licence.** README §§5.2, 7.1 and 7.4 restate BHHMS23 Tables 1–5 and Figure 2 (pp. 38, 41–45) in the roadmap's notation; the arXiv licence of v7 was not read.
- **Scope.** BHHMS23 supplies 69 of 94 located citation groups. The previous review records five of eight layers matching its section scopes: README Layer 1 (line 173), Layer 2 (243), Layer 3 (294), Layer 4 and Layer 7.
- **Not tested.** D01: README line 75 requests `descent-kisin-modules` in every rank; `packages/LocalGaloisDeformationRingsPartII/design/plan.json` still declares `rank-two-descent-kisin-modules` in rank two. This board change remains deferred.
