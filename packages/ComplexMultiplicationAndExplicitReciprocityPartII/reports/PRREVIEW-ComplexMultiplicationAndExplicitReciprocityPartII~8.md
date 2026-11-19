# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at f4a8e92)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 56 lines changed since `87d95d3` finds both earlier findings repaired and no new one. The Borcherds product is now imported from GrossZagierAndArithmeticHeights §6.20a(e)–(f) with §4.2a keeping only the integral descent, metric identity and vertical support, and the quadratic completion and Artin conductors are cited to AnalyticNumberTheoryPartI §§2.2a, 2.18a and 2.22a, which state them. There is one small correction and no format note, none blocking. Three points are left to the human reviewers: the board plan still declares three gaps of removed layers, the Colmez scan carries a JSTOR stamp, and two sources are cited by preprint pagination.

## C01 — "At every neat level" in §4.2a is wider than the supplier's hypothesis on the level

In §4.2a (README line 525): "at every neat level Z(f)=c_f(0,0)·c₁(ω) in the rational Chow group of the generic fibre". GrossZagierAndArithmeticHeights §6.20a(e) (its README line 1993) proves the relation for a neat level that stabilizes Λ̂ and acts trivially on Λ̂′/Λ̂; without that, the coset functions 1_(μ+Λ̂) are not invariant and Z(f) is not defined at the level. The supplier contract (line 1076) states the hypothesis correctly. Write "at every neat level that fixes L̂ and acts trivially on its discriminant module" in §4.2a as well.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: §4.2a, "the Borcherds product of f is GrossZagierAndArithmeticHeights §6.20a(e) … Prove that … these squares, suitably normalized, descend to a rational section Ψ(f)"; *Needs*, Dependencies, scope and a `From TauCetiRoadmap.GrossZagierAndArithmeticHeights` contract added; §4.5 cites §6.20a(f).
- R02 — repaired: §§0.1, 0.3 cite "AnalyticNumberTheoryPartI §§2.2a, 2.18a, 2.22a, …"; §§3.4, 3.5 cite §2.2a; the AutomorphicLFunctionsAndLocalFactors contract is gone and its content stands under AnalyticNumberTheoryPartI.

The earlier small corrections and the format note were also taken up: the sentence about a §6.2 is deleted; QSeriesPartitionsAndMockModularForms §§8.3, 8.5 is cited in §§4.2 and 4.2b with a contract; the Lubin–Tate Check now names the uniformizer 5 and contrasts 10; OrthogonalSpinGroups milestones 1A–1C is cited in §4.2 with a contract.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 CM class functions, *Needs* (sample) | E=ℚ(i); the three cited sections opened | §2.22a: Q=D_E/D_F=4, Λ_η=Q^(s/2)Γ_ℝ(s+1)^g L_f, root number 1; §2.2a: a₂(χ₋₄)=2, conductor 4 | Citation resolves; same Λ as the Conventions |
| 3.4–3.5 conductor citation | tame quadratic over ℤ₃; trivial character; ℚ(i) at 2 | §2.2a Checks: tame exponent 1, trivial 0, a₂=1+1=2; README §3.4: 1, 0 | Agree; §2.2a covers local groups |
| Gamma correction of §2.22a against §4.2c | d/ds log Γ_ℝ(s+1) at 0 | −½(γ+log 4π)=−½(0.5772+2.5310)=−1.5541; README's −½(log π+γ+log 4)=−½(3.1082)=−1.5541 | Agree |
| 4.2a Borcherds section | p=n=3; c_f(0,0)=2; x and −x | weight of f: −1/2; Ψ_j weight c/2=1, square weight 2, divisor Z(f) counting ±x; constant 2·log(4πe^γ)=6.216; A Thm 4.8.1 (A lines 2585–2607) | Matches supplier (e) and source; level wording: C01 |
| GrossZagier contract, part (f) | p=3, p=4 (d=2, n⋄=2d) | weights −1/2 and 5/2, −1 and 3, each pair summing to 2; annihilator of annihilator of a subspace of a direct sum in its full dual is the subspace | Duality step true; (f)(i)–(ii) at supplier line 1995 |
| 4.5 route | d=2 | n⋄=4≥3, so §6.20a(e)–(f) apply; A Thm 9.5.6 (A lines 5805–5811) gives c(0,0)≠0, integrality, support in S | Supported |
| QSeries contract and its Check | ⟨1⟩, μ=1/2; weights n=1, d=2 | Q(μ)=1/4; −1/4−(−1/4)=0∈ℤ, −1/4−1/4=−1/2∉ℤ; A's ω_L(T)=e(−Q(μ)) from ψ_f=ψ_∞⁻¹ on ℚ (A lines 2531–2540); 1−1/2=1/2, 2−2=0, both ≠1 | Check true; type is that of (L,−Q) |
| Lubin–Tate Check of the Conventions | ℚ₅, π=5; 10=5·2 | χ₅(rec(5))=1; χ₅(rec(5·2))=2⁻¹=3 mod 5 (2·3=6≡1) | True |
| OrthogonalSpinGroups contract | dimension 0; anisotropic v | 1B: no scalar units in dimension 0, hence "positive dimension"; 1A: N(ιv)=Q(v); 1C: onto O(V), kernel scalar units | Matches milestones 1A–1C |
| 10.1, 10.2 (headlines, Lean) | elaborated again | two `sorry` warnings at lines 50 and 72; signatures unchanged from `87d95d3` | Unchanged |

The rows for untouched statements stand as in the previous review, of `87d95d3`.

- Source locators checked against the text: 3 (A Theorem 4.8.1 at A line 2585; A §4.7, p. 453, at A line 2536; A Theorem 9.5.6 at A line 5805), each on the cited statement and page.
- Library declarations opened at the pins: none new; the diff changes no Lean statement and no library citation.
- Cross-roadmap citations resolved by opening the supplier: 10 ids in 4 roadmaps (GrossZagierAndArithmeticHeights §6.20a(e), (f) at its open head, README lines 1993, 1995; AnalyticNumberTheoryPartI §§2.2a, 2.18a, 2.22a on main, lines 1309, 1676, 1749; QSeriesPartitionsAndMockModularForms §§8.3, 8.5 on main, lines 1218, 1288; OrthogonalSpinGroups 1A, 1B, 1C, a completed roadmap on main, lines 430, 454, 496). All resolve and state what is consumed.
- Supplier order: GrossZagierAndArithmeticHeights is an open new roadmap earlier in the merge order and is named in the description; the other three are on main. Dependency check: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Automatic checks: all passed at this head; no path changed outside the folder; worktree clean.
- Elaboration: `lake env lean` on `Suggested.lean` gives the two `sorry` warnings and nothing else.
- Pull request text read against the head: the paragraphs on Layer 4's imports, the six gaps and the validation agree with the README; nothing to correct.
- Padding and headlines: unchanged since `87d95d3`; no statement was added or altered.

Overlap check: read GrossZagierAndArithmeticHeights, GrossZagierAndArithmeticHeightsPartII, FaltingsFinitenessAndIsogenyTheoremsPartII, ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuliPartII, ArakelovGeometryAndAbelianHeights, PELModuli, HilbertModularVarietiesAndShimuraCurves (scopes as in the previous review; GrossZagierAndArithmeticHeights §6.20a read again); shared: the orthogonal Borcherds product, owner GrossZagierAndArithmeticHeights §6.20a(e)–(f), now cited; its integral descent, metric identity and vertical support are owned here and stated by neither.

Source independence: changed passages only; 4 passages compared with 1 source (A: §4.7, Theorem 4.8.1 and its sketch, proof of Theorem 9.5.5, Theorem 9.5.6), none shared beyond formulas and standard names; largest share A, 39 of 70 bracketed locators, as before; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review).

Research link: Layers 0–9 prove the averaged Colmez formula of Andreatta–Goren–Howard–Madapusi Pera (2018); Layers 10–12 are Tsimerman's (2018) Galois-orbit bounds for CM points, the input to André–Oort for A_g; Layer 13 gives the bounded-degree CM finiteness that Masser–Zannier (2020) use. Rests on the README summary and on A, T and MZ as read.

## Not verifiable

- The six declared supplier gaps are contracts, not proved statements; the diff does not touch them.
- Bruinier's theorem behind A Theorem 9.5.6 cites a text not in the cache; only A's restatement was read.
- The Pila–Tsimerman preprint locators of §§13.1–13.4 are untouched and were not opened this round.

## Source issues

- none

## For the human reviewers

- The board plan (`packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json`) still declares nine gaps; the README at this head has six. The three others (ArakelovGeometryAndAbelianHeights §4.7, HilbertModularVarietiesAndShimuraCurves twice) belonged to the removed Layers 5–8.
- Four of the six gaps ask for extensions of roadmaps already on main: ShimuraVarieties, ClassFieldTheory, GlobalNumberFields (completed) and GeometryOfNumbersAndQuadraticArithmetic (README lines 1018, 1032, 1042, 1052, 1054). The description states this.
- Licence: source C is cited from the author's page, but the cached scan carries a JSTOR download stamp on its pages (C lines 266–267, 347–348).
- PT and T12 are cited by arXiv preprint pagination; the README says the published editions were not collated.
