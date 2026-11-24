# Review of LocalFactorsOfTwistsAndTypes (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 420 changed lines since `74a09b7`. I checked the new Origin, Method and Corollary-of labels, the narrowed 6.2, the restated 7.1, the corrected Henniart and Zelevinsky attributions, and every new supplier section they cite. I also checked the readable sampled sources at their locators (Henniart 1993 and 2002, Zelevinsky, Tadić, Dat, Haines–Kottwitz–Prasad, Jacquet–Liu, Chai). The corrected attributions are right: Henniart's Théorème 1.1 is the single-rank `n − 1` statement, the supercuspidal-twist form is the Remarque on p. 340, and Zelevinsky's (iii) is 3.1. No finding. The verdict is accepted, with three small corrections (two characteristic-zero restrictions that the new general sections make unnecessary, and the description) and two format notes, none blocking. For the human reviewers there is one decision that was applied, and one source that could not be tested.

## C01 — 6.3 is a corollary of AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a in every characteristic, not only in characteristic zero

As written, a reader of 6.3 is told that positive characteristic still rests on this roadmap's own route, and the supplier contract presents §AL.3.3.8a as a characteristic-zero theorem. At this head, §AL.3.3.8a works with "F of either characteristic". It proves the bound by the same argument as 6.3's route: the pole of `L(s, δ × δ^∨)` at `0` together with absolute convergence for `Re(s) ≥ 1`.

The fix is to drop "for `F` of characteristic zero" and "for `F` of positive characteristic the route below stays" from the Corollary-of line of 6.3 (lines 757–760), and the matching restrictions in three other places:
- the Dependencies of Layer 6 (line 973);
- the scope (line 1152, "6.3, in characteristic zero");
- the contract with AutomorphicLFunctionsAndLocalFactors (line 1168, "in characteristic zero").

## C02 — 4.1 (i) keeps its subquotient clause to characteristic zero, although its new source and its general section give it for every `F`

The changed route of 4.1 now takes the subquotient clause from Tadić 1986, Proposition A.4, "over every nonarchimedean local field". SmoothRepresentationsOfLocalGroups §SR.5.2a (i), of which 4.1 is now a corollary, also states it for every `F`. Tadić proves A.4 (p. 372) in his Appendix before the paragraph that restricts to characteristic zero, which begins after Corollary A.7.

The statement itself (line 525) still says "for `F` of characteristic zero", so a reader cannot tell whether the clause fails in positive characteristic. Dropping that restriction from (i) makes the statement match its source. The sentence at line 535 already records that the family uses the clause in characteristic zero.

## C03 — The description misstates what changed in 3.4 and 7.2, and leaves out three changes to this roadmap

The bullet on this roadmap says that "the sources of the bound for Satake parameters, which the two sections gave differently" are corrected. On `main`, neither 3.4 nor 7.2 names a published source for that bound. The head adds Macdonald (1971) to both, and adds Borel (1979), Theorem 13.2, after Langlands (1971), to 7.2. It would read: "and a published source for the bound for Satake parameters, which neither section named: Macdonald (1971) in 3.4 and 7.2, with Borel (1979), Theorem 13.2, for the absolute convergence in 7.2 (iii)."

The same bullet does not mention three changes:
- EndoscopicTransferAndUnitaryTraceComparison becomes a supplier, with a new contract: 1.1 is a corollary of its §2.16 in characteristic zero.
- 6.2 now states only the reduction to supercuspidal twists. Its general multiplicativity is now AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a.
- 7.1 is now stated for the trivial representation, with clauses (i)–(iv). The form for `μ ∘ det` is kept as a Remark.

## N01 — Several new Origin labels cite a source with no theorem, section or page

The Origin labels cite Macdonald (1971) in 3.4 (line 418) and 7.2 (line 1067), Langlands (1971) in 7.2, and Harris–Taylor (2001) and Henniart (2000) in 4.2 (line 580), each with no locator; their References entries have none either. Adding the theorem or page numbers would make the attributions checkable.

## N02 — The heading of 6.2 no longer matches what the section states

The heading at line 707 still reads "Multiplicativity of `γ`-factors". The section, the Summary, the introduction to Layer 6 and the scope now all call it the reduction of `γ`-factors of pairs to supercuspidal representations. A retitled heading, with the old anchor kept as a line before it, would match.

## Questions for the author

- 4.2's Method label says that the formal proof sends every other supercuspidal representation to an unramified twist of one fixed *wildly ramified* irreducible parameter. The Method label of BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.29a says only "one fixed irreducible parameter". Which is it? I could not open the formal proof's repository through the sources service.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 tempered = irreducible unitary products; Corollary-of ETUTC §2.16 | `n = 2`, `χ₁ × χ₂` unitary; Steinberg; §2.16 field | Segments `[χ₁]`, `[χ₂]` unlinked, so the product is irreducible (Zel. 9.7 (a)); St `= L([ν^{−1/2}, ν^{1/2}])` is square-integrable; §2.16 is char 0, as the label says | holds | none |
| 2.1 (a), (b), (d); Corollary-of SR §SR.7.1 | `GL₂`, unramified principal series, vertex, `P = B`; Dat's Props 3.1, 6.2 (i), 6.3 (ii) | `dim (Ind 1)^{U(k)} = 2 = dim π_N`; Dat's isomorphism holds for every `y ∈ B(M)` and every smooth `V`; SR.7.1 states (a), (b), (d) at the same generality | holds | none |
| 3.1 bound from a bounded coefficient | trivial representation; `G = ℤ`, `ρ(m) = z^m` | `θ(1_S) = #S = ‖1_S‖₁` (equality); `\|θ(1_{1})\| = \|z\| > 1 = ‖1_{1}‖₁` when unbounded | holds | none |
| 3.2 Macdonald formula; Corollary-of SR §SR.4.3a | `n = 2`, `λ = (1, 0)`; `n = 1`; `Q = q²`; HKP Thm 5.6.1 | `⟨λ, ρ⟩ = 1/2`, giving `Q^{1/2}(X₁ + X₂)`; `X^m`; `Q^{⟨λ,ρ⟩} = q^{⟨λ,2ρ⟩}`; HKP covers split groups over p-adic fields | holds | none |
| 3.3 doubling series (labels only) | `n = 2`, trivial (`α = q`, `y = qX`) | LHS `1 + (q+1)qX/(1−q²X) = (1+qX)/(1−q²X)`; RHS `(1−X)(1+qX)/((1−q²X)(1−X))`, equal | holds | none |
| 3.4 Satake bound (headline 4) | trivial representation; `GL₄`, `α = (Q^{3/2}, Q^{3/2}, Q^{−3/2}, Q^{−3/2})`, `Q = 2` | Bound attained by trivial; `θ(T₂) = 32 + 16 + 0.5 = 48.5 > #T₂ = 5·7 = 35`, so unbounded | holds | none |
| 4.1 Zelevinsky classification; Corollary-of SR §SR.5.2a | `Z([ν^{−1/2}, ν^{1/2}])` on `GL₂`; `1 × ν`; Zel. §3.1, Prop. 3.4 | Trivial character, normalised Jacquet module `ν^{−1/2} ⊗ ν^{1/2}` as §3.1 gives; `[0,0]`, `[1,1]` linked, product reducible | holds; (i) narrower than source | C02 |
| 4.2 listed properties of `rec` | `rec(Sp(2))` | `L([ν^{−1}, 1]) = ν^{−1/2}St`, central character `\|·\|^{−1} = rec₁(ω)`; centred segment gives trivial, contradicting it | holds | none |
| 5.1 GRH predicate (label only) | `π ⊗ \|det\|^{−1/4}` | A zero with `Re ≥ 1/2` moves to `Re ≥ 3/4 > 1/2` | holds | none |
| 6.1 mirabolic self-pairing; new sentence on AL §AL.3.2.4 | Steinberg; unitary unramified `α = β = 1` | `Σ q^{−m(σ+1)}` finite iff `σ > −1`; `Σ (m+1)² q^{−mσ}` diverges at `σ = 0`; AL.3.2.4 asserts only `s = 0`, integrated over `K` | holds | none |
| 6.2 reduction to supercuspidals (restated) | `n = 1`, `τ = χ₁ × χ₂`; St `× \|·\|^{1/2}`; AL §AL.3.3.2a | `σ_j = χ_j`, `γ = γ(χχ₁)γ(χχ₂)`; `L(s+1, 1) ≠ L(s+1, 1)L(s, 1)` (γ only); AL.3.3.2a states both variables, every `F` | holds | none |
| 6.3 exponent bound (headline 3); Corollary-of AL §AL.3.3.8a | Steinberg; trivial of `GL₂`; AL.3.3.8a field | St: `r = 1`, `α = 0`; trivial has exponents `±1/2`, not generic; AL.3.3.8a says either characteristic, the label says char 0 | holds; label narrower than supplier | C01 |
| 6.4 local converse (headline 1) and new Henniart attribution | Henniart 1993 p. 340, pp. 346–348; `n = 2`; JL Thm 1.3; Chai Thm 1.1 | Thm 1.1: generic, rank `n − 1` only, no central character; Remarque: generic, supercuspidal ranks `1..n−1`, via Lemme 3.5; `⌊2/2⌋ = 1` | holds | none |
| 6.5 uniqueness (headline 2); changed "uses" list | `r₂(St)`; Henniart 2002 §1.4; BCGRUG §10.29a | `det(ω^{−1/2} ⊗ Sp(2)) = ω^{−1}·ω = 1 = r₁(ω_St)`; §1.4: uniqueness by induction from 1993's corollary; §10.29a lists the same laws | holds | none |
| 7.1 (i)–(iv), Remark (restated) | `n = 1`; `n = 2` split; `z = (d−n+1)/2`; inert `U(2)` | `L(z, χ)`; `L(z+½)L(z−½)`; factors `L(d/2 − i)`, `i < n`, matching ThetaLifts §5.2; parameter `(q_v, q_v⁻¹) = (q_w^{1/2}, q_w^{−1/2})` | holds | none |
| 7.2 Satake bounds and convergence (headline 4) | trivial of `GL_n`; inert `U(2)` | Largest shift `(n−1)/2`, so convergence iff `Re z > (n+1)/2`; `q_w^{1/2} = q_v`, and a `q_v^{1/2}` bound would fail | holds | none |
| `satake_bound_gl` (docstring change only) | `n = 1` | `θ(T₁) = α`; `ω(ϖ^m) = α^m` bounded iff `\|α\| = 1 = Q⁰`, both bounds equal | holds | none |

- Source locators checked against the text: 27 in 8 sources. They are Henniart 1993 (Thm 1.1, Corollaire and Remarque p. 340, Lemmes 3.3–3.5 pp. 346–348, Thm 4.1 p. 348) and Henniart 2002 (§§1.4, 1.9, 2.3, 2.6–2.8, pp. 589–596). Then Zelevinsky 1980 (§3.1 and Prop. 3.4 pp. 180–181, Thm 4.2 p. 184, Thm 6.1 p. 188, Cor. 7.5 p. 193, Prop. 8.5 p. 196, Thms 9.3 and 9.7 pp. 198–199) and Tadić 1986 (Thm 2.5 p. 346, Prop. A.4 p. 372, the Appendix's characteristic-zero boundary). Finally Dat 2009 (Props 3.1, 6.2 (i), 6.3 (ii), numbered as in HAL preprint v1), Haines–Kottwitz–Prasad Thm 5.6.1, Jacquet–Liu Conj. 1.1 with Thm 1.3, and Chai Thm 1.1.
- Cross-roadmap citations resolved at this head (14):
  - SmoothRepresentationsOfLocalGroups §§SR.7.1, SR.4.3a, SR.5.2a, and SR.3.3 *harish-chandra-tempered-support*;
  - AutomorphicLFunctionsAndLocalFactors §§AL.3.2.4, AL.3.3.2a, AL.3.3.8a, AL.3.9.7;
  - EndoscopicTransferAndUnitaryTraceComparison §2.16 (its `GL_r(D)` paragraph, on `main` already);
  - ThetaLiftsForDefiniteUnitaryGroups §5.2 and its contract;
  - BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.29a;
  - FiniteReductiveGroups §6.0.

  Each states what the changed text says it states.
- Cycles: neither SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors nor EndoscopicTransferAndUnitaryTraceComparison names this roadmap, on `main` or at this head.
- Base against head, item by item: no layer, section, Check or example is removed. The general clause of 6.2 moves to §AL.3.3.2a, which states it in full; the `μ ∘ det` form of 7.1 stays, as a Remark that is proved by the route.
- Library: `Suggested.lean` changes in one docstring only. The four declarations' elaborated types are unchanged from `main`, and no near-match at the pins states any of them.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses 'sorry'` at line 123.

Overlap check: read SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicLFunctionsAndLocalFactorsPartII, EndoscopicTransferAndUnitaryTraceComparison, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, FiniteReductiveGroups and BaseChangeAndGaloisRepresentationsForUnitaryGroups. The shared objects each have one owner, and this roadmap records its matching sections as corollaries:
- The depth-zero Jacquet comparison, Macdonald's formula and the Zelevinsky classification are owned by SmoothRepresentationsOfLocalGroups §§SR.7.1, SR.4.3a and SR.5.2a; here 2.1, 3.2 and 4.1 are their corollaries.
- The multiplicativity of `γ`, the exponent bound and the local converse theorem are owned by AutomorphicLFunctionsAndLocalFactors §§AL.3.3.2a, AL.3.3.8a and AL.3.9.7; here 6.2, 6.3 and 6.4.
- The irreducibility of tempered products in characteristic zero is owned by EndoscopicTransferAndUnitaryTraceComparison §2.16; here 1.1.
- AutomorphicLFunctionsAndLocalFactorsPartII owns doubling and coarse transfer, which this roadmap only cites. The four family roadmaps are consumers only. Supply runs one way throughout.

Source independence: changed passages only. 14 passages were compared with 8 sources, and none shares wording beyond formulas and standard names. The largest share of mentions is [FormalProof], 44 of about 190, and it could not be read; among printed sources Henniart's papers have 29. Arrangement not compared: the change adds, removes and reorders no layer.

Research link: Layers 4 and 6 are the Zelevinsky classification (1980), the local converse theorem (Henniart 1993; Jacquet–Liu 2018; Chai 2019) and the characterisation of the local Langlands correspondence for `GL_n` by pair `ε`-factors (Henniart 1993, 2002, with Harris–Taylor 2001 and Henniart 2000). Layers 3 and 7 give the Satake bounds used in Rallis inner-product computations (Harris–Kudla–Sweet 1996). This rests on the README and on Henniart 1993 and 2002, which I read.

## Not verifiable

- Moy–Prasad 1996, Proposition 6.7 (2.1 Origin): the service resolved it only to a paywalled publisher page, by DOI and by title.
- Macdonald 1971 (3.4 and 7.2 Origins): the service found no legal copy; Macdonald 1979, chapter V (3.2) is a book with no open copy, and Haines–Kottwitz–Prasad was checked in its place.
- Shimura 1997, Theorem 1 (3.3 Origin): the publisher refused the request and the service found no other legal copy; Shimura 1994, Böcherer 1986 and Gritsenko 1994 are cited only as relatives and were not fetched.
- Jacquet–Piatetski-Shapiro–Shalika 1983, (8.1), (8.2) and Theorem 3.1 (6.1–6.3 Origins): no legal copy found. Bernstein 1984, §8.9 (6.3): paywalled. Jacquet–Shalika 1981: behind the same paywall, not fetched.
- Harris–Kudla–Sweet 1996, §6 (7.1); Borel 1979, Theorem 13.2, and Langlands 1971 (7.2): the publisher hosts are not open sources the service could use.
- Harris–Taylor 2001 and Henniart 2000 (4.2 Origin): no locator is given, so there was nothing to check.
- [FormalProof]: its repository host is not a source the service can read, so the new Method labels and the declaration names were not compared with it.

## Source issues

- none

## For the human reviewers

- The decision that published theorems live in the general roadmaps was applied. The general multiplicativity left 6.2 and is stated in full by AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a (both variables, every nonarchimedean `F`); 1.1, 2.1, 3.2, 4.1, 6.3 and 6.4 keep their statements, as corollaries.
- Not tested: [FormalProof] (Alpöge's Lean repository, commit `40e56ba`) is the most-cited source, 44 mentions, and could not be read through the sources service, so the new Method labels were not compared with it.
