# Repair of RationalAnalyticPrismatization (design, round 8)

One review: `packages/RationalAnalyticPrismatization/reports/REV-DESIGN-RationalAnalyticPrismatization~7.md` (verdict `needs_changes`, ten findings, four P2). Every finding was checked against the cached source texts, the sibling roadmaps and the pinned libraries before any edit; all ten hold and all ten are applied. Files changed: `packages/RationalAnalyticPrismatization/design/README.md`, `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. Each README change is mirrored verbatim in `plan.json` (statement, API, tests, hypotheses, prerequisites, suppliers, baseline).

## R01 (P2) — applied

Verified: ABLB line 686–694 (Definition 2.2.3) requires some r′ > r with |a_n| r′^n → 0. 1.2: "power series converging on the polydisc of radius r" → "power series overconvergent on the closed polydisc of radius r: … some r′ > r has |a_n| r′^n → 0". New Check (test `normFiltration_closedDiscModel`) shows how the closed-disc model fails.

## R02 (P2) — applied

Verified: ABLB line 972–981 and RC24 Proposition 2.6.9(3), RC24 line 1169, need bounded A. 1.2: "Define the †-reduction …; Prove that … is a pullback" → "For bounded A, Nil†(A) is an ideal …; define the †-reduction of a bounded A …; prove that for bounded A …". API bullets 2–3 qualified. Negative Check: ℚ_p⟦T⟧[1/T].

## R03 (P2) — applied

Verified: ALRS line 3548–3550 (Proposition 4.4.4(2)) assumes "T_{X/D} a vector bundle"; ALRS line 9586–9588 allows any dual of a connective perfect complex. 9.2: both "for X → D formally smooth" clauses → "formally smooth with T_{X/D} a vector bundle" (the first also defines T^†_{X/D}). New Check: X = D × BG_a. Plan 9.2 hypotheses and test `relHT_nonVectorBundleTangent` added.

## R04 (P2) — applied

Verified: ALRS line 8539–8551 states Proposition 6.4.12 for a compact G, a profinite étale Galois X̃^⋄ → X^⋄ and β̃: X^HT → |X̃|^Betti/G^la. 11.10's last clause now carries these hypotheses, names β̃, says that β̃ is 0-affine, and writes GSpec_{|X̃|^Betti}. Locator: ALRS line 8539 and line 8545. Plan 11.10 hypotheses and locator updated.

## R05 (P3) — applied

Verified: EnhancedDerivedSheaves on main, "### E5:abstract.5 Monadicity" (`barrBeckLurie`) and "### E5:abstract.2 Algebras, modules and the monoidal envelope". Contract: "algebras and modules with monadicity (§E5:abstract.2)" → "algebras and modules (§E5:abstract.2), the Barr–Beck–Lurie monadicity theorem (§E5:abstract.5)". §E5:abstract.5 added to Sections consumed, 10.1 text and *Needs:*, Layer 10 Dependencies (which also lacked §E5:abstract.2), plan prerequisites and supplier sections.

## R06 (P3) — applied

Verified at the `lake-manifest.json` pins (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`). Pin hashes updated in README and plan `baseline`. The eleven line numbers were updated to :44, :29, :166, Y.lean:220, Window.lean:102/:108, :149, :260/:267, Quotient.lean:59, :259, :271. The Tau Ceti contract now describes `TauCeti.LocallyAnalytic` (LocallyAnalytic.lean:45) and `.eval` (:85). A new 10.4 Check compares the d = 1 case with it.

## R07 (P3) — applied

Verified: ABLB line 2690–2693 (Lemma 4.5.1) constructs (−)^⋄ with GSpec(A)^⋄ = Marc(A) = Marc(A^u); line 2729 (Proposition 4.5.4) is X^DR(A) = X(A^u). 2.8: "ABLB Proposition 4.5.4, p. 51, ABLB line 2729" → "ABLB Lemma 4.5.1, p. 51, ABLB line 2690". Plan locator updated; ABLB manifest locator gains Lemma 4.5.1.

## R08 (P3) — applied

Verified: ALRS line 2651–2659 defines T_{FF} on perfect δ-spaces only. 7.3: "the δ-stacks T_{Spc^δ} … and T_{FF} …" → "… T_{Spc^δ}, its restriction T_{PerfSpc^δ}, and the perfect analytic δ-stack T_{FF} …, defined on perfect δ-spaces only". API bullet: "canonically trivialized Frobenius automorphism". New Check: T_{FF}(S, D^×_{FF,S}) = T(FF_S).

## R09 (P3) — applied

Verified: ALRS line 1351–1362 (Warning 2.6.13): the closed unit disc is neither rigid smooth nor Berkovich-smooth. 12.1: "Smooth and rigid smooth maps are locally †-l.c.i." → "Berkovich-smooth maps, in particular rigid smooth maps, are locally †-l.c.i. … (ALRS §2.1, p. 14, ALRS line 699)". New Check: closed unit disc versus open unit disc.

## R10 (P3) — applied

Verified: ALRS line 5366, 5411, 5492 use |−|_ϖ with |ϖ|_ϖ = 1/2. 10.4: "|p| ≤ 1/2" → "|p|_ϖ ≤ 1/2" (twice), with |−|_ϖ in C_{r,ϖ}. New Check: ϖ = p^{1/2} gives 1/4; ϖ = p² gives 2^{−1/2}. 12.1 route: Lurie's characterization → "the equivalence of (a) and (b) in ALRS Definition 6.5.2(1), ALRS line 8640"; no new source.

## Same pattern elsewhere

- **R01.** Every other use of ⟨…⟩_{≤r} already reads it as overconvergent: 1.5 †-rational localizations, 1.3 Check ℚ_p⟨T⟩_{≤1} = colim_{r>1} ℚ_p⟨T/r⟩, 2.7 "overconvergent Tate algebra K⟨T⟩_{≤r}", 3.x G_a^† = GSpec(ℚ_p⟨T⟩_{≤0}), 12.1. These uses were inconsistent with the old definition; none needed a change.
- **R02.** Every later use of Nil† and †-reduction (2.x–9.x) is for Gelfand rings, which are bounded by 1.4, or for Banach algebras. No change.
- **R03.** I read every "formally smooth" statement:
  - 9.1 already assumes a tangent bundle T_X.
  - The 5.x cone statements are for Berkovich spaces, where L is connective, so formal smoothness forces a vector bundle.
  - 11.4–11.5 assume rigid smooth maps.
  - 9.4 (ALRS Propositions 4.5.2–4.5.3, ALRS line 3619 and line 3639) is stated by the source under formal smoothness alone, and the torsor under (T_X(−1) ⋊ G_m)^dR makes sense for a connective perfect T_X. It was left at the source's generality.
- **R04.** No other target restates Proposition 6.4.12.
- **R07.** No other citation of ABLB Proposition 4.5.4 exists.
- **R08.** T_{FF} occurs only in 7.3.
- **R09.** 12.3 assumes rigid smooth maps. 12.4 assumes smooth partially proper rigid spaces, which are rigid smooth by ALRS Warning 2.6.13. No change.
- **R10.** |p| occurs nowhere else as a ϖ-normalized condition. 10.8 inherits C_{r,ϖ} from 10.4.

## Citation repair outside the findings: LocallyAnalyticDistributionsPartII §ND.0

The brief requires every cross-roadmap citation to be resolved each round, and `roadmaps resolve` flagged this one.

**The problem.** LocallyAnalyticDistributionsPartII, at its open head and in its board package `README.md`, is now numbered Layer 0 to Layer 5. Its Layer 0 is "Lazard lattices and first congruence subgroups". It has no §ND.0, and its Scope assigns "uniform groups, p-valuations and Iwasawa algebras" to NoncommutativeAndEquivariantIwasawa Layer 0.

**Where the content now lives.** NoncommutativeAndEquivariantIwasawa, at its open head, has:
- §0.2: compact p-adic analytic groups and their analytic structure;
- §0.6: ordered coordinates;
- §0.7: finite-rank p-valuations, ordered bases, saturation and the compatible analytic structure; it says the generic notion is owned there.

That roadmap is already a supplier of this one and is earlier in the merge order.

**Changes.** I replaced "LocallyAnalyticDistributionsPartII §ND.0" by NoncommutativeAndEquivariantIwasawa §0.2/§0.7 in:
- Scope;
- the 10.3 and 10.4 *Needs:* lines;
- the 10.3 API bullet;
- the Layer 10 Dependencies;
- the plan prerequisites.

I deleted the LocallyAnalyticDistributionsPartII supplier contract (README and plan) and widened the NoncommutativeAndEquivariantIwasawa contract to §§0.1, 0.2, 0.6, 0.7. The plan-internal API name `TauCeti.Decompletion.locallyAnalytic_ND0` became `TauCeti.Decompletion.locallyAnalytic_coordinates`; the README never names it. A rerun of `roadmaps resolve` no longer reports the §ND.0 lead.

## Checks run

Dependency check, after all edits:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

Citation resolver, after the edits:
- It finds one cross-roadmap lead, "MotivesAndAlgebraicCyclesPartII §BM.0". That roadmap is a board package earlier in the merge order, whose README has "| BM.0 | The Banach arc-site |", so the citation stands.
- It reports no Lean names found nowhere.
- Tau Ceti names are not checked by the tool on this host. I checked `TauCeti.LocallyAnalytic` (line 45) and `TauCeti.LocallyAnalytic.eval` (line 85) by hand at the pin.

README–plan agreement (scripted):
- 88 targets; all 30 definitions and constructions keep an API list and at least three Checks.
- Every plan statement, API statement and test occurs verbatim in the README (0 missing).
- The plan's 21 gaps are unchanged.
- The seven Check-only suppliers without README contract headings are as before this round.

Policy grep on the added lines: no LaTeX delimiters, process words, machine paths, pull-request numbers or `set_option`. The only hits were named source lemmas ("ABLB Lemma 4.5.1" and similar).

`Suggested.lean`: none exists at the design stage, so the `#check` elaboration pass was not run and there is no Lean statement to keep in step.

Sources: no source was fetched or added. RC24 Proposition 2.6.9(3) was read in the cached text (RC24 line 1169, p. 24); the manifest locators of ABLB (Lemma 4.5.1) and RC24 (Proposition 2.6.9(3), cited for 1.2) were extended. No `needs-references.toml` was written.

Ownership: no new construction was introduced. The one moved citation goes to the roadmap that declares itself the owner (NoncommutativeAndEquivariantIwasawa §0.7). Overlaps: the overlap listing for this roadmap shows no pull request changing it and no dropped id.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.2 ⟨ℕ[S]⟩_{≤r}, overconvergent | r = 0; r = 1; A = ℚ_p⟨T⟩ | r = 0: closed-disc model is ℚ_p⟦T⟧, and Σ p^{−n²}T^n has |a_n|s^n = p^{n²}s^n → ∞ for every s > 0, so there is no map to the germ ring and T ∉ Nil†. Overconvergent: germ ring, identity, T ∈ Nil†. r = 1, A = colim_{s>1} ℚ_p⟨T/s⟩: Σ p^nT^{n²} has p^{−n}s^{n²} → ∞, closed-disc model fails; overconvergent: identity, T ∈ A_{≤1}. A = ℚ_p⟨T⟩: |f| ≤ 1 gives |a_n||f|^n ≤ |a_n|r′^n → 0, so A_{≤1} = ℤ_p⟨T⟩ and A_{≤p^{−k}} = p^kℤ_p⟨T⟩ | definition fixed; Check added |
| 1.2 Nil† is an ideal (bounded A) | ℚ_p⟦T⟧[1/T]; ℚ_p[ε]/ε²; zero ring | First: T ∈ Nil†, T·T^{−1} = 1 ∉ Nil† (1 − T ↦ 0), not an ideal; the null sequence p^{k(n+1)}T^{−k} lies in no single T^{−m}ℚ_p⟦T⟧, so the ring is unbounded and excluded. Second: Nil† = ℚ_pε, and (a + bε)ε = aε, an ideal. Zero ring: Nil† = 0 = A | hypothesis added; negative Check added |
| 1.2 API: nilpotent ⊆ Nil†, Nil† ⊆ A_{<r} (all A) | x² = 0 in an unbounded A | germ ring → ℚ_p[T]/T² → A, T ↦ x exists; A_{≤0} ⊆ A_{≤r′} for 0 < r′ < r | holds without boundedness, kept unqualified |
| 1.2 API: universal property of A^{†-red} | ℚ_p[ε]/ε² → ℚ_p | ε ↦ 0 is forced, A^{†-red} = ℚ_p | holds; qualified to bounded A, the domain of A^{†-red} |
| 9.2 gerbe and pushout | X = D; smooth curve over C; X = D × BG_a | T = 0: D ×_0 D = D. T a line bundle: band T^†{1}. T = O[1]: (T{1}[2])^† = (O{1}[3])^†, whose loop object is B²G_a^†{1}, a 2-gerbe | hypothesis added; Check added |
| 11.10, clause of Proposition 6.4.12 | X = GSpec(K), K_∞ = K(μ_{p^∞}), G = Γ ≅ ℤ_p^× (compact); a non-compact G | |X̃| is a point, so GSpec_{|X̃|^Betti}(O^la) = GSpec(K(μ_{p^∞})), as in Proposition 6.4.10 and the first Check. Non-compact G: no profinite Galois tower, and the clause is no longer asserted | hypotheses added |
| 10.1 by Barr–Beck–Lurie | Π trivial; Π = ℤ/2 on ℚ_p × ℚ_p | the forgetful functor is conservative and colimit-preserving, so it preserves G-split realizations; Λ = R; M_2(ℚ_p) (dimension 4) | criterion of §E5:abstract.5 met |
| 10.4 |p|_ϖ ≤ 1/2 | ϖ = p^{1/2}; ϖ = p; ϖ = p²; the convention reading | 1/4; 1/2 (boundary, holds); 2^{−1/2} ≈ 0.707 > 1/2; with |p| = p^{−1}, 1/3 ≤ 1/2 for p = 3 always, which is vacuous | wording fixed; Check added |
| 10.4 Check against `TauCeti.LocallyAnalytic` | p = 3, f(a) = 4^a | Taylor coefficients log(4)^n/n!: n = 3 gives 3^{−3+1} = 3^{−2} ≤ 3^{−1.5}; n = 9 gives 3^{−9+4} = 3^{−5} ≤ 3^{−4.5}. Mahler coefficients 3^n: (r/3)^n → 0 for r < 3 | consistent with the first Check |
| 2.8 (−)^⋄ locator | ℚ_p[ε]/ε² | Lemma 4.5.1(2): Marc(ℚ_p[ε]/ε²) = Marc(ℚ_p), matching the first Check; Proposition 4.5.4 is the different statement X^DR(A) = X(A^u) | locator fixed |
| 7.3 T_{FF} | (S, D^×_{FF,S}); a δ-space with φ_𝒳 not invertible | T(FF_S), FF_S = D^×_{FF,S}/φ^ℤ (6.2). Otherwise φ^ℤ does not act and the functor is undefined | domain restricted; Check added |
| 12.1 last sentence | closed unit disc; open unit disc | not rigid smooth and not Berkovich-smooth (ALRS line 1360), so not asserted; ⋃_n {|T^n/p| ≤ 1}, radii p^{−1/n} → 1, rigid smooth (ALRS line 1359), so covered | qualified; Check added |
| 12.1 route, ALRS Definition 6.5.2(1)(a)⇔(b) | ℚ_p⟨T⟩ → ℚ_p | π_0 = ℚ_p⟨T⟩/(T) is finitely presented and L = ℚ_p[1] is perfect; the ring is the pushout of ℚ_p⟨T⟩ ← ℚ_p[X] → ℚ_p | consistent with (3) |
| Tau Ceti and Mathlib contract lines | all 17 cited declarations | `abbrev LightProfinite` :44, `abbrev LightCondensed` :29, `def fontaineTheta` :166, `def frobeniusHomeomorph` :220, `IsRadiusLowerBound`/`IsRadiusUpperBound` :102/:108, `isRadiusLowerBound_comap_frobenius_iff` :149, `windowU`/`windowV` :260/:267, `spaX` :59, `compactSpace_spaX` :259, `t0Space_spaX` :271; unchanged: :61, :381, :52, :75, :137, :116 | updated |
| 10.3–10.4 supplier citation | LocallyAnalyticDistributionsPartII at its head | no §ND.0 (Layers 0–5); NoncommutativeAndEquivariantIwasawa §0.7 has ω_U(c(x)) = c₀ + min v_p(x_i), with the ordered generators as an ordered basis, matching 10.3's G_0 with ordered basis g_1, …, g_d | re-cited |

## For the maintainer

- **Supplier set.** This roadmap no longer names LocallyAnalyticDistributionsPartII as a supplier. Its p-valuation inputs are cited to NoncommutativeAndEquivariantIwasawa §§0.2, 0.7, which is already a supplier and earlier in the merge order.
- **Renamed names.** No backticked README name changed. In `plan.json` only, the API name `TauCeti.Decompletion.locallyAnalytic_ND0` became `TauCeti.Decompletion.locallyAnalytic_coordinates`. Its README bullet now cites NoncommutativeAndEquivariantIwasawa §§0.6–0.7.
- **Unowned Gestalten contracts.** The contracts `gestalten-affine-proper` and `gestalten-transmutation` still have no owner. They were settled earlier as needing a board decision, and acceptance of this design stays conditional on it.
- **AnalyticStacks consumer bullet.** That bullet still lists a contract `hypercover-inversion` that this roadmap does not declare. Fixing it is that roadmap's edit.
- **LaTeX-style macro in 6.2 (untouched).** The 6.2 statement writes the hat of FF^⋄_X as a LaTeX-style `\hat{…}` macro. It is not a delimiter, and it lies outside this round's scope.
- No suspicious instructions were found in the review or in the fetched roadmap text.
