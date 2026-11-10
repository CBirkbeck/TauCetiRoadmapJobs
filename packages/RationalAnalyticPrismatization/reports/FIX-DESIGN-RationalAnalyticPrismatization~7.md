# FIX-DESIGN-RationalAnalyticPrismatization~7

The review REV-DESIGN-RationalAnalyticPrismatization~6 has four findings. I verified all four and applied all four. For F04 I also repaired the same pattern in five other places. Separately, a citation check found stale ids and names, which I repaired as well; they are described below.

## F01 (P2) — applied

4.5 route: "its HKR filtration Fil^• (RefinedTraceMethods §1.10, applied to the values A(S) …)" → the filtration on the animated rings A(S) is the left Kan extension from polynomial ℤ-algebras (EnhancedDerivedSheaves §E5:animation.1) of §1.10's Postnikov filtration. Its pieces are ∧^k L[k] (sifted colimits; animated exterior powers, §E5:cotangent-export.2), and it is complete because Fil^k is k-connective. ψ^ℓ comes from functoriality of S¹ ⊗ A (RefinedTraceMethods §1.7).

Other changes, mirrored in `plan.json`:
- `*Needs:*` of 4.5 and the Layer 4 Dependencies gain RefinedTraceMethods §1.7, §E5:cotangent-export.2 and §E5:animation.1.
- The RefinedTraceMethods contract now covers §1.7 and §1.10 (README paragraph and plan `suppliers`).
- The EnhancedDerivedSheaves contract gains §E5:animation.1 and §E5:cotangent-export.2.
- 4.5 has a new Check, `cotangent_animated`: for A = ℤ_p ⊗^L_{ℤ_p[x]} ℤ_p, L = A[1].

Verification:
- At its open head, RefinedTraceMethods §1.10 says "R → A be a map of commutative rings". §1.7 adds "(or animated rings)" and defines HH(A/R) ≃ A ⊗_R T as colim_T A in CAlg.
- On main, EnhancedDerivedSheaves §E5:animation.1 has `animationExtension`, the sifted left Kan extension from `Poly_R` to `AnimAlg_R`. §E5:cotangent-export.2 has `animatedExteriorPower`.

Difference from the proposed repair: I cite the subsections (§E5:animation.1, §E5:cotangent-export.2) rather than the layer §E5:animation. The proposed wording only said both sides are left Kan extended. The new text names where the extension of ∧^k L to animated rings comes from and gives the completeness argument.

## F02 (P3) — applied

6.1 `*Needs:*` "…; FarguesFontaineDiamonds §F2." → "…; FarguesFontaineDiamonds §F2; Tau Ceti `TauCeti.FarguesFontaine.spaY`; Tau Ceti `TauCeti.FarguesFontaine.isRadiusLowerBound_comap_frobenius_iff`." The plan is unchanged.

Verification:
- Both declarations exist at the current Tau Ceti pin `2fd255d`: `Y.lean:116` and `Window.lean:149`.
- A scripted comparison of every `*Needs:*` line with the plan prerequisites (mapping `mathlib:`/`tauceti:` to "Mathlib `…`"/"Tau Ceti `…`") now reports 0 mismatches over 88 targets. Before this change it reported 1, which was 6.1.

## F03 (P3) — applied

9.7 Check (README and plan test `qp_HT_gerbe`): "compare AHLB Theorem 1.2, where the integral Hodge–Tate stack of ℤ_p is BG_m^♯ (AHLB line 42)" → "compare AHLB §1.3 and §2.1, where the integral Hodge–Tate stack of O_K is the classifying stack of G_π: G_m^♯ when e = E′(π) is a unit, G_a^♯ when e is in the maximal ideal; so BG_m^♯ for ℤ_p, where e = 1 (AHLB line 214; AHLB line 368; AHLB line 375)".

What the source says:
- AHLB line 42 is Theorem 1.2, the Rep_C(G_K) equivalence.
- Line 214 (§1.3) describes Spf(O_K)^HT as the classifying stack of G_π.
- Line 368 (Proposition 2.3) gives Spf(O_K)^HT = BG_π.
- Line 375 gives G_π ≅ G_m^♯ for e a unit and G_π ≅ G_a^♯ for e in m_K, where e := E′(π) (line 344).

The review placed line 360 in "§3". It is in §2.1 (Definition 2.2, p. 7), so the new text cites §2.1 and line 368.

In `sources.toml`, the AHLB `locator` changed from "Theorem 1.2" to "§1.3 (p. 4); §2.1, Definition 2.2 and Proposition 2.3 (p. 7)". The page markers were checked.

## F04 (P3) — applied

10.4 (README and plan `statement`): "has the properties of ALRS Lemma 5.2.21" → "for 1 < r < 2 and |p| ≤ 1/2 the natural map f: BG^la ×_{GSpec ℚ_p} GSpec(Λ) → BG^Bin_{r,ϖ} is 0-proper with f_*Λ = Λ, so that ∗-pullback along f is fully faithful (ALRS Lemma 5.2.21, p. 105, ALRS line 5617)".

The source is ALRS line 5617–5618, with 2 > r > 1, and |p|_ϖ ≤ 1/2 comes from Definition 5.2.18 (line 5492).

**Same pattern repaired elsewhere** (a milestone or hypothesis named by a lemma instead of stated). Each now states its conclusions with their hypotheses, in README and plan:
- **4.6**: "the stability properties with the transitivity fibre sequence (Lemma A.2.5)". Now states two-out-of-three for nilcompleteness, infinitesimal cohesiveness and cotangent complexes, the fibre sequence, and base change with L_{Y′/X′} the pullback.
- **4.7**: "the stability properties of ALRS Lemma A.2.19". Now states the six clauses, for †-formally étale and for †-quasi-pro-étale maps.
- **4.7**: "τ … satisfying the flatness and formal smoothness conditions of ALRS §A.2". Now defines both conditions (ALRS line 9641) and τ-Gelfand stacks (Definition A.2.6). It states Proposition A.2.15 with its hypotheses, including two the old paraphrase omitted: the strictly-totally-disconnected cover hypothesis, and f nilcomplete in the nilcompleteness clause. It also states Lemma A.2.11.
- **10.5**: "the base change and semidirect product properties of ALRS Lemmas 5.2.27–5.2.28". Now states both lemmas.
- **10.7**: "the stability properties of ALRS Lemma 5.4.7". Now states (1)–(6). Clause (1) is stated as a sufficient condition only, which is what the source proves.
- **10.11**: "the permanence properties of ALRS Lemma 5.8.1 (…)". Now states the three clauses.

## Citation repair

The `roadmaps resolve` leads in `scratch/citations.md` turned up stale ids and names. I checked each lead and repaired the ones that were real.

- **VectorBundlesAndIsocrystals.** At its open head (a new-roadmap pull request, earlier in the merge order), the layers are numbered Layer 0–6; the ids §VB−1, §VB0, §VB1, §VB3 and §VB4 no longer exist. Other roadmaps at their heads cite "VectorBundlesAndIsocrystals Layer 0" and so on. I mapped each id by its content:
  - §VB−1 → Layer 0 (relative annuli; Y_S and X_S = Y_S/φ^ℤ, line 135; untilt divisors; twists).
  - §VB0 → Layer 1 (standard blocks D(s,r)).
  - §VB1 → Layer 2 (bundles, two-term cohomology, v-descent at line 512, RΓ_proét(S,E) ≃ RΓ(X_S,O) at line 552).
  - §VB3 → Layer 5 (Banach–Colmez sheaves, the Lubin–Tate cover at line 1096, the fundamental untilt sequence at line 1106).
  - §VB4 → Layer 6 (slope-zero bundles and local systems, line 1674).

  The old target slugs became quoted subsection titles. This changes 22 README lines, the plan prerequisites of nine targets (6.1–6.4, 7.5, 7.6, 8.1, 9.8, 11.7), and the plan `suppliers` entry, whose sections are now Layer 0, 1, 2, 5, 6. Convention witness: VectorBundlesAndIsocrystals takes O(d/h) as the image of D(−d,h), and 7.6 takes O(λ) as the descent of O ⊗ D_{−λ}. For λ = 1 both give D(−1,1), so they agree.
- **A 6.1 Check.** "κ_ϖ with periodRadius of radiusFunctionAndRationalAnnuli" named things found nowhere, on main or at any open head. It now reads "κ_ϖ with the radius rad_ϖ = log|[ϖ]|/log|p| of RelativeFarguesFontaine §1.2 for E = ℚ_p". At its head, that section defines rad_ϖ = log|[ϖ]|/log|π| with rad(φx) = q·rad(x).
- **False leads, no change.**
  - MotivesAndAlgebraicCyclesPartII §BM.0, LocallyAnalyticRepresentationsOfLocalGroups §§LR.2 and LocallyAnalyticDistributionsPartII §ND.0 are board packages. The headings "## BM.0", "## Layer LR.2" and "## Layer ND.0" exist in their design READMEs.
  - `Huber.GelfandSpectrum` is a name AdicSpacesPartIII §R3.9 plans on main (its README line 661). It is not a pinned declaration.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 4.5 route: HKR on animated A(S) | A = ℤ_p⟨T⟩ (static) | A(S) = C(S, ℤ_p⟨T⟩) is discrete; the left Kan extension restricts to §1.10's filtration; gr^1 = ℤ_p⟨T⟩dT[1] | holds |
| same | A = ℤ_p ⊗^L_{ℤ_p[x]} ℤ_p | L = A[1]; gr^k = ∧^k(A[1])[k] = Γ^k(A)[2k] ≅ A[2k], giving π_n HH = ℤ_p for every n ≥ 0. Direct computation: Tor over ℤ_p[x] ⊗ Λ(dx) gives Λ(σx) ⊗ Γ(σdx), rank 1 in each degree | agrees |
| same, completeness | A = 𝔽_p over ℤ (§1.10's example) | gr^n = 𝔽_p[2n], so HH_{2n} = 𝔽_p and HH_odd = 0; Fil^n is n-connective, so lim = 0 | holds |
| ψ^ℓ on gr^k | ℤ[x], ℤ[x,y], the animated A above | dx ↦ ℓ·dx; dx∧dy ↦ ℓ²·dx∧dy; on gr^1 = A[2] it acts by ℓ | holds |
| ψ^ℓ − ℓ on gr^k, k ≥ 2 | ℓ = 2, p = 3, k = 2, 3; ℓ = 3, p = 2, k = 2 | 2, 6 (3-part 3); 6 (2-part 2): bounded p-power torsion | holds |
| New 4.5 Check | A = ℤ_p ⊗^L_{ℤ_p[x]} ℤ_p | π_0 = π_1 = ℤ_p; L = A[1] with π_1 = π_2 = ℤ_p, p-complete; both sides of the second statement are A[1/p][1], with π_1 = π_2 = ℚ_p | holds |
| F03: G_π | K = ℚ_p, π = p; K = ℚ_p(√p), p odd | E = u − p, e = 1 a unit, so G_m^♯; E = u² − p, e = 2√p ∈ m_K, so G_a^♯ | as stated |
| F04: Lemma 5.2.21 | G = 1; G = ℤ_p (d = 1); r = 2 | G = 1: f is the identity of GSpec Λ, 0-proper, f_*Λ = Λ. G = ℤ_p: γ − 1 shifts binomial coefficients c_n ↦ c_{n+1}; invariants Λ, cokernel 0 after inverting ϖ; so H⁰ = Λ, H¹ = 0. r = 2 is excluded (Lemma 5.2.17 needs r < 2) | holds |
| 4.6: Lemma A.2.5 | f = id; GSpec ℚ_p → A¹ → GSpec ℚ_p; X′ = ∅ | id: L_{Y/X} → L_{Y/X} → 0. Origin in the line: ℚ_p·dT → 0 → ℚ_p[1], a fibre sequence. ∅: all empty | holds |
| 4.7: Lemma A.2.19 | identities; two †-rational localizations; constant hypercover | trivially †-formally étale; the composite is †-rational; GSpec(A) → GSpec(A) is a !-cover | holds |
| 4.7: Proposition A.2.15 and conditions on τ | f = id; τ = the !-topology | id: conclusions reduce to g = g ∘ f. The !-topology has neither condition (ALRS line 9908–9909), so the hypotheses are not vacuous; the †-quasi-pro-étale topology has both (line 9916) | holds |
| 10.5: Lemmas 5.2.27–5.2.28 | A = B; H = 1; N = 1 | M^la ⊗_{A^la} A on both sides; M^{G-la} = M^{N-la}, resp. M^{H-la} | holds |
| 10.7: Lemma 5.4.7 | Y = pt, H = 1; Y = X^la | (X × pt)^{G-la} = X^{G-la}; X ×_{X^la} X^la = X with (X)^la = X^la | holds |
| 10.11: Lemma 5.8.1 | Z = X^la/G^la | both mapping spaces over the base are points, so β is an equivalence; Z is terminal, consistent with stability under limits | holds |
| 6.1 Check: radius | E = ℚ_p, π = p; RelativeFarguesFontaine's Check πval = 1/2, teichval = 1/4 | rad_ϖ = κ_ϖ, and rad ∘ φ = p·rad matches κ ∘ φ = p·κ; value 2 | consistent |

A 10-word shingle scan of every added line against the cached ALRS and AHLB texts finds no shared prose. The only hits are formulas and a definition phrase of 4.6 that was already there.

## Checks

- **Dependency gate**, run on the edited README:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2135 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. RefinedTraceMethods and VectorBundlesAndIsocrystals are earlier in the merge order; EnhancedDerivedSheaves is on main.
- **Scripted structure.**
  - Plan statements, API bullets, tests, gap `needs`/`detail` and supplier `what` texts found verbatim in the README: 595 checked, 7 not verbatim. The 7 are the comparison-partner supplier entries, which the plan prefixes with "Checks only." while the README lists them under "Comparison partners used only in Checks". That is unchanged from before this round.
  - `*Needs:*` against prerequisites: 0 mismatches over 88 targets.
  - Every "Sections consumed" list equals the plan `sections`.
  - There are still 21 gaps.
- **`roadmaps resolve`** after the edits: only the three board-package leads remain (see Citation repair).
- **Lean.** There is no `Suggested.lean` at the design stage, so no `#check` pass was run.
- **Policy grep** of README, plan and manifest for LaTeX delimiters, process words, pull-request numbers and machine paths: no hits. One "round" match in `sources.toml` is the word "background".

## For the maintainer

- **Pins.** The content checkout now pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. The design still records `6b7abb3` / `a91d3aa` in its contracts and its plan `baseline`. I left those unchanged, in line with board practice for repair rounds.
  - Every cited declaration exists at the new pins. Some line numbers moved:
    - Mathlib: `LightProfinite` Basic.lean:42→44, `LightCondensed` :28→29, `fontaineTheta` :165→166.
    - Tau Ceti: `frobeniusHomeomorph` Y.lean:218→220; `IsRadiusLowerBound` Window.lean:97→102, `IsRadiusUpperBound` :103→108, `isRadiusLowerBound_comap_frobenius_iff` :144→149; `windowU` :255→260, `windowV` :262→267; `spaX` Quotient.lean:56→59, `compactSpace_spaX` :200→259, `t0Space_spaX` :212→271.
  - Tau Ceti `2fd255d` adds `TauCeti.LocallyAnalytic`: locally analytic functions on ℤ_p, as the direct limit of analytic stages. Amice's theorem is not proved there. The README's "no locally analytic vectors" still holds, but the package stage should compare 10.4 (d = 1) with it.
- **Source issues.**
  - ALRS Lemma A.2.5(3), p. 178, ALRS line 9612: the base-change map is written h: X → X′. It should be X′ → X, with Y′ = Y ×_X X′.
  - ALRS Proposition A.2.15(1), p. 182, ALRS line 9841: the composite is written "f ◦ g"; it should be g ∘ f.
  - Neither affects the roadmap, which states the corrected forms.
- **No owner for animated HKR.** I searched by object for an owner of the HKR filtration on animated rings. Only RefinedTraceMethods §1.10 (commutative rings) and AInfCohomology (smooth algebras) state an HKR filtration. So the 4.5 route derives the animated extension in place. That is a route, not a new target. Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show`; the sibling checkouts were not read in full.
- **New dependency.** This roadmap now cites VectorBundlesAndIsocrystals by the layer numbers at its open head. No other roadmap's names change.
- **Suspicious text.** None found in the data read.
