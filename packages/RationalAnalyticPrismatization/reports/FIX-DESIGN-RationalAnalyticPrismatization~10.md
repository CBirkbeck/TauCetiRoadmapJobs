# Repair of RationalAnalyticPrismatization (design, round 10)

There was one review, `REV-DESIGN-RationalAnalyticPrismatization~9`, with verdict `needs_changes` and five P3 findings.

- Each finding was checked against the cached ALRS text and against the supplier roadmaps at their open heads before any edit. All five hold, and all five are applied.
- Files changed: `packages/RationalAnalyticPrismatization/design/README.md` and `packages/RationalAnalyticPrismatization/design/plan.json`.
- `sources.toml` is unchanged: no new work is cited.
- Every README change to a statement, API bullet or Check is mirrored verbatim in `plan.json`. The plan carries no proof routes, so route edits (F02, F03, F04) are README-only.
- The review's "For the human reviewers" section (scope, licence, the Gestalten owner) lists no finding, and nothing was changed because of it.

## F01 (P3) — applied

Verified: ALRS Remark 3.1.6 (ALRS lines 2263–2271) makes three points:
- pullback along A¹/Ĝ_m → A¹/G_m^† is fully faithful;
- its essential image is cut out by convergence of T∂_T;
- that convergence is automatic for vector bundles.

So the two stacks have the same vector bundles, and the Check claimed the opposite. Ĝ_m is the formal completion at 1 (ALRS line 588, line 8133).

Change (5.4, third Check, `filtered_logConnection`): "…whose operator T∂_T integrates…; vector bundles on A¹/Ĝ_m are all T-connections, so A¹/Ĝ_m and A¹/G_m^† differ" → "the two stacks have the same vector bundles". The two stacks are now told apart by the skyscraper at T = 0 with fibre ℚ_p[θ], on which Σ_n p^{n²}θ^n does not act. The locator gains p. 43.

## F02 (P3) — applied

Verified: ALRS Lemma 5.2.10 (ALRS lines 5137–5146) states (1)–(2) for G "not necessarily compact"; only (3) assumes compactness. The proof (ALRS line 5147) reduces (1) to compact G by descent on the target. Lemma 5.2.12 lies inside the compact setting of §5.2.2 (ALRS line 5086), and its proof uses compactness (ALRS line 5188).

Change (10.3):
- **Definition.** G^la := ⊔_{G/G_c} g·G_c^la for non-compact G, independent of G_c.
- **Statement.** Lemma 5.2.10(1)–(2) is now stated "for every p-adic Lie group G, not necessarily compact". Part (3), Rep^{<r}, Rep^{≤r} and Lemma 5.2.12 are stated "for compact G".
- **Route.** A descent step along BG_c^la → BG^la reduces to compact G.
- **Other.** Plan hypothesis rewritten; new Check `la_nonCompact` (G = ℤ).

The same pattern appears elsewhere in 10.3:
- The API bullet "BG^cont → BG^la is 0-proper …; GSpec(ℚ_p) → BG^la is 0-proper and descendable" was false for G = ℤ: its fibre ⊔_ℤ GSpec(ℚ_p) is not quasi-compact. It now reads "For every p-adic Lie group G, … ; for compact G, …".
- The closing sentence comparing G^la with G(ℚ_p)^la of 3.4 now covers non-compact G(ℚ_p), coset by coset.

## F03 (P3) — applied

Verified with `roadmaps grep --fixed`:
- `diamondFormulaAndMapToBase` occurs nowhere.
- `associatedLocalSystem` occurs only in ClassifyingSpaces, for a different object.
- `senOperator` occurs only as `Prismatic.WCart.senOperator` in PrismaticCohomologyPartII.

The suppliers' headings at their open heads are:
- RelativeFarguesFontaine "### 2.2 Period diamonds and the topological map to the base" ("Prove the diamond formula").
- PadicHodgeTheory "### 4.4 Sen and differential de Rham realizations".
- PadicHodgeTheory "### 7.1 Horizontal lattices and filtered connections" (the associated local system `M(E)`).

Change: "(RelativeFarguesFontaine §2.2, diamondFormulaAndMapToBase)" → "(…, the diamond formula)". "the functor associatedLocalSystem" → "Scholze's associated local system functor E ↦ M(E)". This was made in Scope, in the contract paragraph with its plan `what`, and in 12.6. "senOperator" → "the Sen operator of PadicHodgeTheory §4.4", in both 11.2 Checks. A camel-case scan of the README finds no other non-resolving supplier identifier.

## F04 (P3) — applied

Verified: X^HT → X is a BT^†_{X/D}{1}-torsor (ALRS line 7970). The proof of Theorem 6.2.2(4) uses X → X/T^†_X{1} (ALRS lines 8012 and 8025). Only the printed statement (ALRS lines 7986–7987) has {−1}.

Change (11.5 route): "the relative de Rham complex of X → BT^†_{X/D}{−1}" → "… of X → BT^†_{X/D}{1}". This is a README-only change, since `plan.json` carries no routes. A search of all T^† occurrences in the README and plan finds no other twist {−1} on BT^†.

## F05 (P3) — applied

Verified: †-formally étale maps are defined in 4.1, whose *Needs* lists §3.1. The 4.1 bullet already covers Y^{dR/X} → X.

Change:
- 3.1, third API bullet: "…(X^dR)^dR ≅ X^dR, and X^dR → GSpec(ℚ_p) is †-formally étale." → "…(X^dR)^dR ≅ X^dR."
- 4.1, second API bullet: appended "in particular Y^dR → GSpec(ℚ_p) is, Y^{dR/GSpec(ℚ_p)} being Y^dR."

Both changes are mirrored in the plan.

## Citation resolved this round (not a finding)

`roadmaps resolve` reports MotivesAndAlgebraicCyclesPartII §BM.0 as found nowhere. That roadmap is a board package, line 388 of the merge order. Its package-stage `README.md` has renumbered the design's "## BM.0 — The Banach arc-site" to "## Layer 0: The Banach arc-site", with no former-numbering table, so "§BM.0" would break when that package is opened.

Every occurrence was updated:
- "MotivesAndAlgebraicCyclesPartII §BM.0" → "MotivesAndAlgebraicCyclesPartII Layer 0" (11 README, 6 plan).
- The plan supplier `sections`: "§BM.0" → "Layer 0".
- The contract paragraph's "(§BM.0)" and "Sections consumed: §BM.0." were updated the same way.
- "§BM.0 (strict-basis)" → "§0.4", the package's "### 0.4 Strictly totally disconnected Banach rings".
- "§BM.0 arc-site" → "the arc-site of … Layer 0".

Layer 0 contains everything consumed: the arc-topology §0.2, Marc(A) ≅ Marc(A^u) §0.3, strictly totally disconnected rings §0.4, and quasi-pro-étale maps §0.6.

## Checks run

Dependency check (gate) after all edits:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

`roadmaps resolve` lists one cross-roadmap citation found nowhere, "MotivesAndAlgebraicCyclesPartII Layer 0". This is the board package above, confirmed in its package README. It lists no Lean names found nowhere.

Scripted agreement check:
- All 530 plan statements, API bullets and tests occur verbatim in the README. That is 529 before, plus `la_nonCompact`.
- All 21 gap `needs` sentences occur in the README.
- `plan.json` parses and round-trips with its original formatting (indent 1, UTF-8).

A policy grep of README and plan finds:
- no LaTeX delimiter, `$` or backslash;
- none of the three identifiers of F03 and no `BM.0`;
- no machine path and no pull-request number.

Suggested.lean: the design stage has no `Suggested.lean`, so there was no `#check` pass and no elaboration. No Lean name was added, renamed or removed.

Sources: every new locator was read in the cached ALRS text, and the page markers were checked: ALRS line 2263 is p. 43 (the marker for p. 43 is at line 2225 and the one for p. 44 at line 2280); ALRS lines 5137 and 5143 are p. 98; ALRS line 5169 is p. 99. No source was fetched, and no `needs-references.toml` was written.

Ownership against open pull requests: no new construction is introduced. The extended definition of G^la is a definition inside 10.3, which this roadmap owns (Layer 10, the decompletion theory). RelativeFarguesFontaine and PadicHodgeTheory were read at their open heads; MotivesAndAlgebraicCyclesPartII was read as a board package.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.4 Check: same vector bundles | trivial line bundle with ∇(1) = c·1 on the disc \|T\| ≤ ρ; c = 1/p; Banach rank n | ∇(T^k) = (k + c)T^k, ‖∇‖ ≤ max(1, \|c\|); for F = Σ p^{n²}x^n, \|p^{n²}\|·max(1, \|c\|)^n → 0 (c = 1/p: p^{−n²+n} → 0), so F(∇) converges; Banach bundles: ∇ bounded, same estimate | holds | Check rewritten |
| 5.4 Check: skyscraper | M = ℚ_p[θ] at T = 0, ∇ = θ; finite-dimensional M = ℚ_p, θ = c | Leibniz: ∇(f·m) = f(0)θm and T f′ acts by 0, so any ℚ_p-endomorphism is a T-connection. Σ p^{n²}θ^n has radius lim \|p^{n²}\|^{−1/n} = ∞, so it is entire. Its partial sums applied to 1 have degree N → ∞, so there is no limit in ⊕_ℕ ℚ_p. Finite-dimensional case: Σ p^{n²}c^n converges, so it is in the image | separates the stacks only on infinite-dimensional sheaves, as stated | Check rewritten |
| 10.3 G^la for non-compact G | G = ℤ, G_c = {0}; G = ℚ_p^×, G_c = ℤ_p^×; G = ℤ_p, G_c = ℤ_p versus pℤ_p | ℤ: ⊔_{n∈ℤ} GSpec(ℚ_p). ℚ_p^×: ⊔_n p^n·ℤ_p^{×,la}. ℤ_p: ℤ_p^la = ⊔_{a=0}^{p−1} (a + (pℤ_p)^la), p cosets on both sides | independent of G_c | definition added |
| 10.3 Lemma 5.2.10(1) for every G | G = ℤ; G = ℚ_p^× | ℤ: s = identity, 0-proper, s_*O = O. ℚ_p^×: base change of s along Bℤ_p^{×,la} → Bℚ_p^{×,la} is [G^cont \ G^la / G_c^la] = [G^cont \ (G/G_c)] = Bℤ_p^{×,cont} → Bℤ_p^{×,la}, 0-proper by the compact case | holds | generality widened |
| 10.3 Lemma 5.2.10(2) for every G | G = ℤ | Ψ = Φ: D(Bℤ) = D(ℚ_p)^{hℤ} = solid ℚ_p[T^{±1}]-modules = Rep^■_{ℚ_p}(ℤ), an equivalence; 10.2's hypothesis holds with Π_0 = {0} | holds | generality widened |
| 10.3 API bullet, GSpec(ℚ_p) → BG^la 0-proper | G = ℤ; G = ℤ_p | ℤ: fibre G^la = ⊔_ℤ GSpec(ℚ_p), not quasi-compact, so not 0-proper. ℤ_p: Lemma 5.2.12(1) | false without compactness | "for compact G" added |
| 10.3 Lemma 5.2.10(3), Rep^{<r}, Lemma 5.2.12 | G = ℤ | M^la uses C^la_G of compact G (Definition 5.2.9 in the compact §5.2.2); G_{<r} uses a uniform G_0 ⊂ G compact | scoped to compact G | "for compact G" |
| 10.3 agreement with 3.4 | G_m, G = ℚ_p^×; closed unit disc, G = ℤ_p | G_m: U = {\|x\| = 1} is an open rigid subgroup with U(ℚ_p) = ℤ_p^×; open immersions are †-formally étale (4.1), so G_m ×_{G_m^dR} ℤ_p^{×,sm} = U ×_{U^dR} ℤ_p^{×,sm} = ℤ_p^{×,la}, and the translates by p^n give ⊔_n p^n·ℤ_p^{×,la}. Disc: one coset, unchanged | holds | sentence widened |
| 10.3 route, base change | G = ℤ, G_c = {0} | [ℤ \ ℤ / {0}] = pt = B{0}, and B{0}^cont → B{0}^la is the identity | holds | route sentence added |
| 4.1 bullet, Y^dR → GSpec(ℚ_p) | X = GSpec(ℚ_p), Y = A¹; Y = A¹ → pt itself | Y^{dR/pt} = pt ×_{pt^dR} Y^dR = Y^dR (pt^dR = pt, 3.1 Check). Criterion (3): (A¹)^dR(A) = A^u-points and pt(A) ×_{pt(A^u)} (A¹)^dR(A^u) = A^u-points, so iso. A¹ → pt is not †-formally étale: A ≠ A^u for C_p[ε]/ε², matching the 4.1 zero-section Check | holds | moved from 3.1 |
| 11.5 route twist | dim X = 1; X = D | dim 1: the filtration of the unit of D(BT^†{1}) has graded pieces O and (T{1})^∨ = Ω¹{−1}; the Koszul complex of Sym(T{1}) gives M → M ⊗ Ω¹{−1} = (4) and the first Check. With {−1} one would get M → M ⊗ Ω¹{1}, contradicting (2). X = D: T = 0, Higgs complex M | {1} correct | twist fixed |
| 11.2 Checks, Sen operator by section | C_p(1); C_p | PadicHodgeTheory §4.4 extends the Sen functor of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7, normalized by HT(χ_p) = +1, so θ = 1 on C_p(1) and θ = 0 on C_p, as the Checks say | consistent | identifier dropped |

## For the maintainer

- No target id, section number, Lean name or gap slug of this roadmap changed, so no other roadmap's citation of it breaks. The new plan test is `la_nonCompact`.
- 10.3 now defines G^la for non-compact p-adic Lie groups and states ALRS Lemma 5.2.10(1)–(2) for them. Consumers inside this roadmap that use BG^la for general G (the second Check of 10.6, 10.10 with G = ℚ_p^×, 11.9, 11.10) are now covered by 10.3 as stated.
- The citation of MotivesAndAlgebraicCyclesPartII moved from its design numbering (§BM.0) to its package numbering (Layer 0, §0.4). If that package returns to the BM numbering, this citation must follow.
- The Gestalten contracts still have no owner; this is a board decision recorded in earlier rounds.
