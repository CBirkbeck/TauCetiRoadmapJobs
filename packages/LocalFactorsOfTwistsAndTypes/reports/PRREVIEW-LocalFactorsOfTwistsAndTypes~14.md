# Review of LocalFactorsOfTwistsAndTypes (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalFactorsOfTwistsAndTypes/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 420 changed lines since `b8f3652`. I checked the new Origin, Method and Corollary-of labels, the narrowed 6.2, the restated 7.1, the corrected Henniart and Zelevinsky attributions, every supplier section they cite as it stands at this head, and the open sources at their locators (Zelevinsky, Tadić, Henniart 2002, Dat, Haines–Kottwitz–Prasad, Jacquet–Liu, Chai). No finding: the verdict is accepted, with three small corrections (two characteristic-zero restrictions that the general sections make unnecessary, and the description) and two format notes, none blocking. The folder's text is the one the previous review read, so its corrections and notes stand and are restated. For the human reviewers there is one decision that was applied and one source that could not be tested.

## C01 — 6.3 is a corollary of AutomorphicLFunctionsAndLocalFactors §AL.3.3.8a in every characteristic, not only in characteristic zero

A reader of 6.3 is told that positive characteristic still rests on this roadmap's own route, and the supplier contract presents §AL.3.3.8a as a characteristic-zero theorem. At this head §AL.3.3.8a says "F of either characteristic", and it proves the bound by the argument of 6.3's route: the pole of `L(s, δ × δ^∨)` at `0`, the factors under induction, and absolute convergence on `Re(s) ≥ 1`.

The fix is to drop "for `F` of characteristic zero" and "for `F` of positive characteristic the route below stays" from the Corollary-of line of 6.3 (lines 757–760), and the matching restriction in three other places: the Dependencies of Layer 6 (line 973), the scope ("6.3, in characteristic zero", line 1152) and the contract with AutomorphicLFunctionsAndLocalFactors ("in characteristic zero", line 1168).

## C02 — 4.1 (i) keeps its subquotient clause to characteristic zero, although its new source and its general section give it for every `F`

The changed route of 4.1 takes the subquotient clause from Tadić 1986, Proposition A.4, "over every nonarchimedean local field", and SmoothRepresentationsOfLocalGroups §SR.5.2a (i), of which 4.1 is now a corollary, states it without restriction. Tadić's Proposition A.4 (p. 372) stands before the sentence that restricts the rest of his appendix to characteristic zero, which comes after Corollary A.7.

The statement itself (line 525) still says "for `F` of characteristic zero", so a reader cannot tell whether the clause fails in positive characteristic. Dropping the restriction from (i) makes the statement match its source; the sentence at line 535 already records that the family uses the clause in characteristic zero.

## C03 — The description misstates what changed in 3.4 and 7.2, and leaves out three changes to this roadmap

The bullet on this roadmap says that it corrects "the sources of the bound for Satake parameters, which the two sections gave differently". On `main` neither 3.4 nor 7.2 names a published source for that bound; the head adds Macdonald (1971) to both and Borel (1979), Theorem 13.2, after Langlands (1971), to 7.2. It would read: "and a published source for the bound for Satake parameters, which neither section named: Macdonald (1971) in 3.4 and 7.2, with Borel (1979), Theorem 13.2, for the absolute convergence in 7.2 (iii)."

The same bullet does not mention three changes a reader must know of:
- EndoscopicTransferAndUnitaryTraceComparison becomes a supplier, with a new contract: 1.1 is a corollary of its §2.16 in characteristic zero.
- 6.2 now states only the reduction to supercuspidal twists; its general multiplicativity is AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a.
- 7.1 is now stated for the trivial representation, with clauses (i)–(iv); the form for `μ ∘ det` is kept as a Remark.

## N01 — Several new Origin labels cite a source with no theorem, section or page

Macdonald (1971) in 3.4 (line 418) and 7.2 (line 1067), Langlands (1971) in 7.2, and Harris–Taylor (2001) and Henniart (2000) in 4.2 (line 580) carry no locator, in the labels or in the References. Theorem or page numbers would make the attributions checkable.

## N02 — The heading of 6.2 no longer matches what the section states

The heading at line 707 still reads "Multiplicativity of `γ`-factors", while the section, the Summary, the introduction to Layer 6 and the scope call it the reduction of `γ`-factors of pairs to supercuspidal representations. A retitled heading, with the old anchor kept as a line before it, would match.

## Questions for the author

- The Method label of 4.2 (line 588) says the formal proof sends every other supercuspidal representation to an unramified twist of one fixed *wildly ramified* irreducible parameter; the Method label of BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.29a says only "one fixed irreducible parameter". Which is it? I did not read the formal proof's repository.

## Previous findings

- none: the previous review of this folder had no finding. Its three small corrections and two format notes are not repaired (the folder's text is unchanged since the head it read) and are C01–C03, N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1, Origin and Corollary-of ETUTC §2.16 | `n = 2`, `χ₁ × χ₂` unitary; Steinberg; field of §2.16 | Segments `[χ₁]`, `[χ₂]` unlinked, product irreducible (Zel. 9.7 (a)); St `= L([ν^{−1/2}, ν^{1/2}])`; §2.16 is characteristic 0, as the label says | holds | none |
| 2.1 (a), (b), (d); Corollary-of SR §SR.7.1 | `GL₂`, unramified principal series, `P = B`; Dat 3.1, 6.2 (i), 6.3 (ii) | `dim π^J = 2 = dim (π_N)^{T_0}`; Dat: every `V`, every point of `B(M)`; SR.7.1 states (b), (d) for every smooth `π` | holds | none |
| 3.1 bound (labels only) | trivial representation; `G = ℤ`, `ρ(m) = z^m`, `\|z\| > 1` | `θ(1_S) = #S = ‖1_S‖₁`; `\|θ(1_{1})\| = \|z\| > 1 = ‖1_{1}‖₁`, coefficient unbounded | holds | none |
| 3.2 Macdonald formula; Corollary-of SR §SR.4.3a | `n = 2`, `λ = (1,0)`, `(2,0)` | `Q^{1/2}(X₁+X₂)`; `Q(X₁²+X₂²)+(Q−1)X₁X₂`, equal to `S(T₁)² − (Q+1)X₁X₂` | holds | none |
| 3.4 Satake bound (headline 4) | trivial representation of `GL_n`; `n = 1` | Parameters `Q^{(n−1)/2−i}`, extremes attain both bounds; `n = 1`: `α^m` bounded on `m ∈ ℤ` iff `\|α\| = 1 = Q⁰` | holds | none |
| 4.1, Origin, route, Corollary-of SR §SR.5.2a | `Z([ν^{−1/2}, ν^{1/2}])` on `GL₂`; `1 × ν`; Zel. 3.1, 9.3, 9.7; Tadić A.4 | Trivial character, Jacquet module `ν^{−1/2} ⊗ ν^{1/2}` as 3.1 gives; `[1]`, `[ν]` linked, reducible; A.4 before the characteristic-zero sentence | holds; (i) narrower than source | C02 |
| 4.2 Method label | BCGRUG §10.29a Method label | "one fixed wildly ramified irreducible parameter" here; "one fixed irreducible parameter" there | not contradictory; unverified | question |
| 6.1, new sentence on AL §AL.3.2.4 | Steinberg, `W(diag(a,1)) = \|a\|1_O(a)`; unitary unramified `α = β = 1` | `Σ q^{−m(σ+1)}` finite iff `σ > −1`; `Σ (m+1)²q^{−mσ}` diverges at `σ = 0`; AL.3.2.4 asserts `s = 0` only | holds | none |
| 6.2 reduction to supercuspidals (restated) | `π = χ`, `τ = χ₁ × χ₂` irreducible; St `× \|·\|^{1/2}`; AL §AL.3.3.2a | `γ = γ(χχ₁)γ(χχ₂)`; `L(s+1,1) ≠ L(s+1,1)L(s,1)`, so `γ` only; AL.3.3.2a: both variables, either characteristic | holds | none |
| 6.3 exponent bound (headline 3); Corollary-of AL §AL.3.3.8a | Steinberg; trivial of `GL₂`; `χν^α × χν^{−α}`; field of AL.3.3.8a | `r = 1`, `α = 0`; exponents `±1/2`, not generic; irreducible unitary for `0 < α < 1/2`, reducible at `1/2`; supplier: either characteristic | holds; label narrower than supplier | C01 |
| 6.4 (headline 1), Origin and Corollary-of AL §AL.3.9.7 | `n = 2`, `n = 3`; Henniart 2002 §§1.4, 1.9; JL Conj. 1.1, Thm 1.3; Chai Thm 1.1 | `⌊2/2⌋ = 1 = n − 1`; `⌊3/2⌋ = 1`: characters; §1.4 supercuspidal, §1.9 generic, ranks `1..n−1`; JL: generic twists, same central character | holds | none |
| 6.5 (headline 2), changed list of what the family uses | BCGRUG §10.29a statement | Both list properties 1, 2, 4, `ν^s`, `\|det r_n(π)\| = \|r_1(ω_π)\|`; on the subclass: twists, duals, property 3, injectivity, tameness, inertial type | agree | none |
| 7.1 (i)–(iv), Remark (restated) | `n = 1`; `n = 2` split; `z = (d−n+1)/2`; inert place | `L(z, χ)`; `L(z+½)L(z−½)`; shifts `(n+1)/2 − i` give `d/2 − j`, `0 ≤ j < n`, as ThetaLifts §5.2; `q_w = q_v²` | holds | none |
| 7.2 (headline 4), Origin and Method | trivial of `GL_n`; inert `U(2)` | Largest exponent `κ = (n−1)/2`; `Re z − κ > 1` iff `Re z > (n+1)/2`; parameter `(q_v, q_v⁻¹) = (Q^{1/2}, Q^{−1/2})`, `Q = q_v²` | holds | none |
| `satake_bound_gl` (docstring change only) | `n = 0`, `n = 1`; `simp`, `rfl` | `Fin 0`: no `i`; `n = 1`: `θ(T₀) = 1`, `θ(T₁) = α`, bound `1 ≤ \|α\| ≤ 1`; neither tactic closes it | holds, not padding | none |

- Source locators checked against the text: 21 in 7 sources. Zelevinsky 1980 (3.1 pp. 180–181, Prop. 3.4 p. 181, Thm 4.2 p. 184, Thm 6.1 p. 188, Cor. 7.5 p. 193, Prop. 8.5 p. 196, Thm 9.3 p. 198, Thm 9.7 pp. 198–199); Tadić 1986 (Thm 2.5 p. 346, Prop. A.4 p. 372, the characteristic-zero sentence after Cor. A.7); Henniart 2002 (§1.4 pp. 589–590, §1.9 p. 592, §2.3 p. 594, §2.6 p. 595, §2.8 p. 596); Dat 2009 (Props 3.1, 6.2 (i), 6.3 (ii), numbered as in arXiv:math/0607405v1); Haines–Kottwitz–Prasad Thm 5.6.1; Jacquet–Liu Conj. 1.1 and Thm 1.3; Chai Thm 1.1.
- Cross-roadmap citations resolved at this head: 15. SmoothRepresentationsOfLocalGroups §§SR.7.1, SR.4.3a, SR.5.2a; AutomorphicLFunctionsAndLocalFactors §§AL.3.2.4, AL.3.3.2a, AL.3.3.8a, AL.3.9.7; EndoscopicTransferAndUnitaryTraceComparison §§2.16, 10.29; BaseChangeAndGaloisRepresentationsForUnitaryGroups §§10.29a, 10.34; ThetaLiftsForDefiniteUnitaryGroups §5.2; FiniteReductiveGroups §6.0; ThetaKernelsForUnitaryDualPairs §3.47; RowTowerAndRallisIdentities §5.1. Each states what the changed text says of it; the changes these roadmaps received since the previous review do not touch the cited statements.
- Base against head, item by item: 7 layers, none removed or retitled, no section, Check or example removed. The general clause of 6.2 is stated in full by §AL.3.3.2a; the `μ ∘ det` form of 7.1 stays, as a Remark proved by the route.
- Library: `Suggested.lean` changes in one docstring; the four elaborated types were compared with the README (3.1 (b), 3.4 (i)) and are those of `main`; no `set_option`, imports `Mathlib` and one `TauCeti` module.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 128 roadmaps, 1435 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses 'sorry'` at line 123.

Overlap check: read SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors, AutomorphicLFunctionsAndLocalFactorsPartII, EndoscopicTransferAndUnitaryTraceComparison, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups and FiniteReductiveGroups. The general theorems have one owner each and this roadmap records its sections as their corollaries: the depth-zero Jacquet comparison, Macdonald's formula and the Zelevinsky classification in SmoothRepresentationsOfLocalGroups (§§SR.7.1, SR.4.3a, SR.5.2a; here 2.1, 3.2, 4.1); the multiplicativity of `γ`, the exponent bound and the local converse theorem in AutomorphicLFunctionsAndLocalFactors (§§AL.3.3.2a, AL.3.3.8a, AL.3.9.7; here 6.2, 6.3, 6.4); the irreducibility of tempered products in characteristic zero in EndoscopicTransferAndUnitaryTraceComparison §2.16 (here 1.1). The family roadmaps are consumers only; no supplier names this roadmap.

Source independence: changed passages only; 13 passages compared with 7 sources, none shared beyond formulas and standard names; largest share [FormalProof], 44 mentions, not read; among printed sources Henniart's two papers; arrangement not compared, since the change adds, removes and reorders no layer.

Research link: Layers 4 and 6 state the Zelevinsky classification (1980), the local converse theorem (Henniart 1993; Jacquet–Liu 2018; Chai 2019) and the characterisation of the local Langlands correspondence for `GL_n` by `ε`-factors of pairs (Henniart 1993, 2002); Layers 3 and 7 give Satake bounds used in Rallis inner products (Harris–Kudla–Sweet 1996). Rests on the README and on Henniart 2002, Jacquet–Liu and Chai, which I read.

## Not verifiable

- Henniart 1993 (6.4, 6.5: Théorème 1.1, the Corollaire and Remarque of p. 340, Lemme 3.5): the sources service resolved it only to a paywalled publisher page, by DOI and by title. The attribution was read against Henniart 2002, §§1.4 and 1.9, only.
- Moy–Prasad 1996, Proposition 6.7 (2.1); Bernstein 1984, §§8.9, 9 (6.3); Jacquet–Shalika 1981 (6.3): paywalled, not fetched.
- Macdonald 1971 (3.4, 7.2), Macdonald 1979, chapter V (3.2), Shimura 1997, Theorem 1 (3.3), Jacquet–Piatetski-Shapiro–Shalika 1983, (8.1), (8.2), Theorem 3.1 (6.1–6.3), Harris–Kudla–Sweet 1996, §6 (7.1), Borel 1979, Theorem 13.2, and Langlands 1971 (7.2): no open copy was looked for beyond the publisher; not read.
- Harris–Taylor 2001 and Henniart 2000 (4.2 Origin): no locator is given, so there was nothing to check.
- Dat 2009: read in the arXiv preprint; the agreement of its numbering with the published version was not checked.
- [FormalProof]: its repository was not read, so the Method labels and the declaration names were not compared with it.

## Source issues

- none

## For the human reviewers

- The decision that published theorems live in the general roadmaps was applied: the general multiplicativity left 6.2 and is stated in full by AutomorphicLFunctionsAndLocalFactors §AL.3.3.2a; 1.1, 2.1, 3.2, 4.1, 6.3 and 6.4 keep their statements, as corollaries.
- Not tested: [FormalProof] (Alpöge's Lean repository, commit `40e56ba`), the most-cited source with 44 mentions in the README, was not read; the Method labels and wording were not compared with it.
