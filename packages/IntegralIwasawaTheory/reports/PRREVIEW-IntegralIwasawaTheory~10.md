# Review of IntegralIwasawaTheory (pull request #1306 at 72d834e)

**Verdict:** accepted

## Previous findings

- R01 — repaired: The description’s roadmap-summary block now says “Later roadmaps build on it”, lists consumers without claiming an exhaustive count, and identifies ArithmeticKTheory as the étale Euler-characteristic consumer.
- R02 — repaired: The roadmap-summary block names the roadmap’s own Baker–Brumer theorem with constant term and distinguishes its exponential carrier from the five number-field headline theorems.

## Verified sound

| Statement | Instances | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| README line 1893: ArithmeticKTheory §7.5 order comparison | F=ℚ; k=1,2; r₁=1 | abs ζ(−1)=1/12; abs ζ(−3)=1/120 | 2·2/48=1/12; 2·1/240=1/120 | Equal; omitting the real factor gives 1/24 and 1/240. |
| §12.3 dyadic Euler characteristic cited by the changed text | F=ℚ; n=2; p=2 | H² order 2; H¹ order 8; quotient 1/4; valuation −2 | v₂(ζ(−1))=−2; v₂(w₂)=3; −2+3=1 | Coinvariant order 2 and Euler valuation −2 agree. |
| §12.3 odd Euler characteristic cited by the changed text | F=ℚ; n=2; χ=1; p=3 | H² order 1; H¹ order 3; quotient 1/3; valuation −1 | v₃(ζ(−1))=−1; v₃(w₂)=1; −1+1=0 | H² order 1; the denominator cancels in its order. |
| §6.0 rationality used by the new consumer | F=ℚ; trivial character; weights 2,4 | ζ(−1)=−1/12; ζ(−3)=1/120 | −B₂/2=−1/12; −B₄/4=1/120; both fixed by coefficient automorphisms | Rational values agree. |
| weibel-kbook VI.9.12 proof: source subscript | F=ℚ; i=4; K₆(ℤ)=0 | Actual group order 1 | Printed h¹,⁴(2)/2=16/2=8; corrected h²,⁴(2)/2=2/2=1 | Source misprint only; roadmap uses the correct theorem. |

The rows for untouched statements stand as in the previous review, of eaaddd4.

- Eight changed lines checked; the three revised consumer passages resolve to ArithmeticKTheory #1418 at d682d86d, README lines 322–331 and 4233–4249; all eight consumed section locators exist.
- Three source passages opened: deligne-ribet lines 200–243 (§0, pp. 230–231), kurihara lines 222–237 (§2.3, pp. 6–7), weibel-kbook lines 32095–32122 (VI.9.12, p. 525); §6.0’s cited rationality input checked, remaining seeded targets outside the changed passages.
- One pinned library theorem opened: Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:251, riemannZeta_neg_nat_eq_bernoulli; 13 fresh #check @name probes match the signatures and README, with no lost binder or changed Lean declaration.
- Gate: every scanner passes, ending OK; targeted Lake build and direct Lean elaboration both exit 0, with only six sorry warnings.
- Dependency output: depcheck: 245 roadmaps, 2215 edges, 0 problem(s); no UPWARD or CYCLE; IntegralIwasawaTheory position 30 precedes ArithmeticKTheory position 139.
- PR title, roadmap-summary block and description prose checked against the base-to-head addition: 3 files, 116 added headings, 13 added Lean declarations, no removals; no contradictory or omitted scope change found.
- Outside-folder diff and worktree status are empty; no supplier added or dropped, and no source manifest edited.

Overlap check: read ArithmeticKTheory, EulerSystemsCyclotomicMainConjecture, CyclotomicClassGroupsAndStickelberger, NoncommutativeAndEquivariantIwasawa, IntegralIwasawaTheoryPartII, SelmerIwasawaCohomology, PadicMeasuresIwasawaAlgebras, LinearFormsInLogarithms and ClassicalArithmeticCompletion; the changed interface assigns étale Euler characteristics to IntegralIwasawaTheory and K-group order comparison to ArithmeticKTheory §7.5. The other ownership conclusions stand as in the review of eaaddd4, including the Baker overlap recorded below.

Source independence: changed passages only; three rewritten passages compared with one roadmap (ArithmeticKTheory’s contract and §7.5), including the order formula compared with one source (weibel-kbook VI.9.12); the fourth edit only deletes an attribution. No borrowed expression or reused source material found. Arrangement not compared again: no layer added, removed or reordered.

## Not verifiable

- The description’s AI-assistance provenance is not recorded in the folder.
- Previously unverified sources (NSW ed. 2.3, Wiles, Taylor, Burns–Flach, Koblitz, Baker, Hindry–Silverman, Katz) were not reopened in this incremental review.

## Source issues

- **Misprint** in weibel-kbook at VI.9.12 proof, printed p. 525: the source says the exceptional dyadic even K-group order is h¹,ⁱ(2)/2ʳ¹; it should be h²,ⁱ(2)/2ʳ¹; affects the proof.

## For the human reviewers

- **Scope / ownership.** LinearFormsInLogarithms §8.10 on main states Baker’s p-adic theorem over ℂ_p and names this roadmap as consumer (README lines 1321, 1374); IntegralIwasawaTheory §§4.1a–4.1e also prove it without citing that owner.

