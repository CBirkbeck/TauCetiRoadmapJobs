<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16360#issuecomment-6903969642 -->
Review (claude) of 1340ded

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) 11.9: the cohomology formula is stated only for perfectoid torsors

   **Location.** `design/README.md` line 1857 (11.9): "Γ(X^{Div¹}, O) = Γ(G^la, Γ(FF_{X̃}, O)^{G-la}) for a perfectoid pro-étale G-torsor X̃^⋄ → X^⋄ (ALRS Remark 6.4.3, p. 154, ALRS line 8351)"; the same string in `design/plan.json`.

   **Claim.** This is the statement of ALRS Remark 6.4.3.

   **Witness.** ALRS line 8351–8373 takes any pro-étale G-torsor X̃^⋄ → X^⋄, G a p-adic Lie group; "perfectoid" occurs only in the open question of Remark 1.22 (ALRS line 460). The restriction excludes G = 1, where X̃ = X is not perfectoid.

   **Repair** (README and `plan.json`). Replace "Γ(FF_{X̃}, O)^{G-la}) for a perfectoid pro-étale G-torsor X̃^⋄ → X^⋄" by "Γ(FF_{X̃^⋄}, O)^{G-la}) for every pro-étale G-torsor X̃^⋄ → X^⋄", and add the Check "For G trivial the formula reads Γ(X^{Div¹}, O) = Γ(FF_{X^⋄}, O), which is 11.7." Tested on the witness: G = 1 gives G^la = point, Γ(G^la, −) the identity and every vector analytic, so both sides are Γ(FF_{X^⋄}, O) = Γ(X^{Div¹}, O) by O ≅ α_{X,*}O (11.6).

2. **F02** (P3) 8.5, third Check: the last interval is in the other radius

   **Location.** `design/README.md` line 1285 (8.5, Checks): "Part (1) read in that radius would claim … an isomorphism over (1, ∞), which contains the radii p, p², … … the isomorphism would extend by Frobenius over (0, p)"; the same string in `design/plan.json`.

   **Claim.** One sentence, one radius.

   **Witness.** "(1, ∞)" and "p, p², …" are values of 1/κ; "(0, p)" is a value of κ. In the radius 1/κ of the sentence, Frobenius divides by p and extends (1, ∞) to (1/p, ∞), not to (0, p): κ ∈ (0, 1) ↦ κ ∈ (0, p) is 1/κ ∈ (1, ∞) ↦ 1/κ ∈ (1/p, ∞).

   **Repair** (README and `plan.json`). Replace "would extend by Frobenius over (0, p) and identify" by "would hold over κ ∈ (0, 1) and extend by Frobenius, which multiplies κ by p, over κ ∈ (0, p) (that is, over (1/p, ∞) in the radius of 𝒳_T), and identify". Tested: 1/(1, ∞) = (0, 1); p·(0, 1) = (0, p); 1/(0, p) = (1/p, ∞), the interval the same Check gives for (0, p); the coequalizer over κ ∈ (0, 1) ⇉ (0, p) is X^{Div¹} by 8.5(2), as the Check concludes.

Two findings, both P3 (one statement narrower than its source, one Check that changes radius coordinate mid-sentence); no P1 or P2. Each has a repair written below, so the verdict asks for changes: a fix round applies the two repairs. All three round-16 findings are repaired. The fifteen sampled targets match their sources. The design declares 21 supplier gaps, none of which is a finding; two of them, `gestalten-affine-proper` and `gestalten-transmutation`, have supplier `none` and are listed for the human reviewers (settled as `not actionable in this package` in the round-4 repair report; the reason was checked again and holds, so the finding is not re-raised).

Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (2039 lines, 12 layers, 88 subsections), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed, nothing was added to the manifest, and no `needs-references.toml` was written. No maintainer notes were given for this round.

## Verified sound

**Round-16 ledger.** All three repaired.

| Finding | State | Repaired passage at this head |
|---|---|---|
| F01 (P3) 10.8 Check 1, trivial action | repaired | line 1655: "For A = Λ° with trivial G-action, τ_{≥0}A^{Bin_{r,ϖ}} = Λ° and the negative homotopy groups … are killed by ϖ^ϵ once 2^{−ϵ} < r^{−ω} … The negative homotopy need not vanish, so A^{Bin_{r,ϖ}} = A is false" |
| F02 (P3) 10.8 base of the tensor product | repaired | line 1641 and line 1649: "G-equivariant A_{ϖ^{(d+1)ϵ}}-linear maps N_{ϖ^{(d+1)ϵ}} → M ⊗_{R_0} A_{ϖ^{(d+1)ϵ}} → N_{ϖ^{(d+1)ϵ}} … R_0 = Γ(G, (τ_{≥0}A^{Bin_{r_0,ϖ}})_{ϖ^{(d+1)ϵ}}) and M is an R_0-module, not necessarily connective" (ALRS line 6062–6066) |
| F03 (P3) 8.5 Check 3, intervals | repaired | line 1285: "the intervals (0, p) and (1, ∞) of ALRS Proposition 4.2.13 become (1/p, ∞) and (0, 1); they are not exchanged"; the new second sentence gives R02 |

Repaired patterns elsewhere: "trivial action gives invariants A" occurs only rationally (10.1, 10.5, 10.6); every unsubscripted ⊗ in Layers 10–11 is over ℚ_p; "reciprocal", "1/κ" and "exchang" occur in Conventions, 6.1 and 8.5 only and agree, except for R02.

**Sources, seeded sample.** The author flags no locator as unverified. All fifteen sampled targets were read against the cached texts this round.

| Target | Read | Result |
|---|---|---|
| 1.1 | ABLB line 596–651 | match (Definition 2.1.1, Lemma 2.1.2; the extension criterion at line 615; idempotency at line 618) |
| 1.3, 1.4, 2.3 | r16 rows (ABLB line 1037–1147, 1162–2264; ALRS line 809–870); texts unchanged since | match |
| 3.6 | ALRS line 1171–1241 | match (Lemma 2.5.2, Proposition 2.5.3 with its three functors, the convention at line 1240) |
| 4.7 | ALRS line 9638–9660, 9732–9736, 9833–9848, 9916–9962, 10022–10029 | match (properties (formsm), (flat), Definition A.2.6, Lemma A.2.11(1)–(3), Proposition A.2.15(1)–(3), Definition A.2.17, Remark A.2.18, Lemma A.2.19(1)–(6), Lemma A.2.20) |
| 6.1 | ALRS line 2295–2347 | match (§3.2, Remark 3.2.1, Lemma 3.2.2); the README's κ_ϖ = log\|[ϖ]\|/log\|p\| is the nonnegative form (Source issues) |
| 7.1 | ALRS line 2398–2439, 2666–2680 | match (Definition 3.3.1, Remark 3.3.2, Examples 3.3.4–3.3.5, Lemma 3.5.2) |
| 7.6 | ALRS line 2867–2943 | match; the lower-left corner of Proposition 3.7.4(2) corrected, as the README says |
| 8.2 | ALRS line 2962–3059 | match (Definition 4.1.1(5)–(7), Remarks 4.1.2(2), (4), 4.1.5, 4.1.6, Example 4.1.7(1), Definitions 4.1.4, 4.1.8) |
| 8.5 | ALRS line 3287–3371 | match (Remark 4.2.12, Proposition 4.2.13 and proof, Corollary 4.2.14) |
| 9.4 | ALRS line 3598–3650, 9165–9173 | match (Definition 4.5.1, Propositions 4.5.2, 4.5.3; (B⁺_dR(ℚ_p^cyc)/tⁿ)^la = K_∞[t]/tⁿ) |
| 9.7 | ALRS line 4108–4150, 4196–4216; AHLB line 214, 368–375 | match (Proposition 4.8.1(1)–(4), Example 4.8.4) |
| 11.8 | r16 row (ALRS line 8145–8182, 8277); text unchanged | match |
| 11.9 | ALRS line 460–466, 8316–8377 | match for Theorem 6.4.1(1)–(3) and Remarks 6.4.2, 1.22; R01 on Remark 6.4.3 |

Also read for the repairs: ALRS line 5983–6000, 6048–6072, 6140–6200.

**Adversarial table** (repaired passages, sampled targets, headlines, findings; values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 10.8 Check 1 | G = ℤ_p, A = Λ°, w = w(γ) | ker Δ = constants, π₀ = Λ°; image of Δ = {Σ b_n binom(x, n): \|b_n\| r^{(n+1)w} ≤ 1}; 1 ∉ image since r^w > 1; ϖ^ϵ g ∈ image for all g iff 2^{−ϵ} r^w ≤ 1; source bound ω = 2w is stronger | holds |
| 10.8 Check 2 | d = 0 | (d+1)ϵ = ϵ; R_0 = A_{ϖ^ϵ}; M = N_{ϖ^ϵ}, M ⊗_{R_0} A_{ϖ^ϵ} = N_{ϖ^ϵ}, composite ϖ⁰ | holds |
| 10.8 hypothesis | base | ALRS line 6063–6065: over Γ(G, (τ_{≥0}A^{Bin_{r_0}})_{ϖ^{(d+1)ϵ}}); README: the same R_0 | holds |
| 8.5 Check 3 | κ ↦ 1/κ | 1 ↦ 1; p^{−n} ↦ p^n; (0, p) ↦ (1/p, ∞); (1, ∞) ↦ (0, 1); Frobenius: κ ∈ (0, 1) → (0, p), i.e. 1/κ ∈ (1, ∞) → (1/p, ∞) | first sentence holds; R02 |
| 8.5(1), (2) | φ on X^Δ | HT at 1, φ^{−n}(HT) at p^{−n}, so φ multiplies κ by p: (1, ∞) → (p, ∞), (0, 1) → (0, p), as stated | holds |
| 1.1 | ℚ_p; ℚ_p[T]; ℚ_p⟨T⟩; 0 | A°(*) = ℤ_p, A^b = ℚ_p; Σ p^k (p^n f)^k has unbounded degree in ⊕ ℚ_pT^k for deg f ≥ 1, so A° = ℤ_p, A^b = ℚ_p ≠ ℚ_p[T]; T ∈ ℤ_p⟨T⟩; 0 | holds |
| 3.6 | X = GSpec(ℚ_p); ℚ_p⟨T⟩ | (L, s) ↔ s ∈ ℚ_p modulo ℚ_p^×: two classes; cofib(0: O → O) = O ⊕ O[1] = ℚ_p ⊗_{ℚ_p[T]} ℚ_p; (O, T²): ℚ_p⟨T⟩/T² = ℚ_p[T]/T² | holds |
| 4.7 | A = C(S, C_p), S = S_1 ⊔ S_2; A.2.20 | direct factor, finite étale, flat; a map T → S of light profinite sets is lim of clopens of S × T_i (closed image = countable intersection of clopens), so B = colim of finite étale | holds |
| 6.1 | untilt C; φ; ϖ ↦ ϖ^m; \|p\| → 0 | \|[p♭]\| = \|p\|, κ = 1; \|[ϖ]\|_{φ(x)} = \|[ϖ]\|_x^p, κ ∘ φ = pκ; mκ; κ → 0; {\|p\|^s ≤ \|[ϖ]\|} is κ ≤ s; Tau Ceti `IsRadiusLowerBound q (comap frobenius v) ↔ IsRadiusLowerBound (q/p) v` (Window.lean:150) is the same law | holds |
| 7.1 | S = ∅; 𝒳 = D ⊔ D; classical | A^u = 0 forces A = 0 (1.3), so 𝒳 = ∅; ι^⋄ misses one copy for S ≠ ∅; Hom((S, D_S), (S′, 𝒳′)) = Hom(S, S′) by ALRS line 2678 | holds |
| 7.6 | λ = 0; λ = 1 | BC(O) = ℚ_p^la, kernel to dR = Nil†; D_{−1} gives O(1) sections 1 + 𝔪_{C♭}; D_1 would give 0 | holds |
| 8.2 | Y = D over a perfect prism; S = ∅; cyclotomic | D^{Div¹~/𝒳} = D^{Div¹~} ×_{D^{Div¹~}} 𝒳 = 𝒳; ∅; divisor ([p]_q), square of ALRS line 3033 | holds |
| 9.4 | X = D over a perfect prism; ∅ | 𝒳/φ^ℤ ×_{𝒳/φ^ℤ} D^† = D^†, D^∧; ∅ | holds |
| 9.7 | zeros of log q/(q − 1) | log q: simple zeros on μ_{p^∞}; minus q = 1: primitive p^{n+1}-th roots, n ≥ 0, the zeros of [p]_{q^{p^n}} | holds |
| 11.9 Check 3 | G = ℤ_p, X = GSpec(ℚ_p), p = 2 and odd | Hom(ℚ_p^×^, ℤ_p) = Hom(Ẑ × ℤ_p^×, ℤ_p): rank 1 + 1 for every p (torsion of ℤ_p^× dies) | holds |
| 11.9 Remark 6.4.3 | G = 1 | source: any pro-étale torsor; README: perfectoid only; G = 1 gives 11.7 | R01 |
| 11.6, 11.7 (headline) | X = GSpec(K), [K : ℚ_p] = n | h⁰, h¹, h² = 1, n + 1, 0 (K^×^ = Ẑ × μ × ℤ_p^n); χ = −n; n = 1: 1, 2, 0 | holds |
| 12.2 (headline) | Tate duality for ℚ_p | h⁰(ℚ_p(1)) = 0, h²(ℚ_p(1)) = h⁰(ℚ_p) = 1, χ = −1, so h¹(ℚ_p(1)) = 2 = h¹(ℚ_p); δ(p) = [pℤ_p : ℤ_p] = p^{−1} | holds |
| 12.3, 12.4, 12.5 (headlines) | — | r16 rows (d = 0: O; G_m: O{1}[2]; P¹: O ⊕ O{−1}[−2]); texts unchanged | hold |

Targets outside this table rest on the computed rows of rounds 12 to 16; their texts are unchanged (the last repair touches only 8.5 and 10.8).

**Structure (scripted).** 88 subsections, each with at least three Checks and a *Needs:* line. All 626 statement strings of `plan.json` occur verbatim in the README (0 missing). 21 gaps, same slugs and same `needs` sentences in plan and README. Policy search (LaTeX delimiters, pull-request numbers, machine paths, `set_option`, HTML, process words): 0 hits. No backticked name of this roadmap's own.

**Pinned declarations.** Opened at the pins (Mathlib 1b1ccf4, Tau Ceti 2fd255d) at the file and line the README gives: `LightCondensed` (Basic.lean:29), `MulRingSeminorm` (:61), `spectralNorm` (:381), `WittVector` (:52), `WittVector.fontaineTheta` (:166), `BDeRhamPlus` (:75), `PadicComplex` (:137), `PadicInt.mahlerEquiv` (:353), `TauCeti.LocallyAnalytic.eval` (:85), `spaY` (Y.lean:116, a `Set (Spv (WittVector p R))` inside `spa ⊤`), `IsRadiusLowerBound` (Window.lean:102, "q ≤ κ(v)", κ = log v([ϖ])/log v(p)), `IsRadiusUpperBound` (:108), `isRadiusLowerBound_comap_frobenius_iff` (:149). The others are those r16 opened; the README lines are unchanged.

**Manifest.** 24 entries, all `certified`; every source id cited with a line locator is recorded.

**Supplier order.** Gate output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2251 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Resolved this round: AnalyticStacks at its open head has every section a gap names (§§0.5, 0.6, 0.8–0.11, 1.6, 1.7, 2.1, 2.3, 2.11, 3.2, 3.3, 3.6, 3.8, 4.1–4.5, 5.1–5.3, 6.3–6.6, 7.2, 7.5–7.7); AdicSpacesPartIV §F1.1, §F1.2; AdicSpacesPartII §R0.4; SchemeAndStackFoundations §1.15, §1.21; DiamondsAndVStacks §D6.5; AdicSpacesPartIII §R3.9 with `Huber.GelfandSpectrum`; PrismaticCohomologyPartII §§3.9, 4.12, 4.13 (Θ = n on O{n}, as the 9.7 Check says). The one lead of `roadmaps resolve`, "MotivesAndAlgebraicCyclesPartII Layer 0", resolves: `packages/MotivesAndAlgebraicCyclesPartII/README.md` line 100, "Layer 0: The Banach arc-site" (§§0.1–0.7), a package in the merge order (line 388).

**Gaps.** 21, each one sentence with its hypotheses, declared in `plan.json` and under "Declared gaps". `roadmaps grep -i` for Gestalt or transmutation matches AnalyticStacks only, which places Gestalten outside its scope (its Scope, "Left to other roadmaps"); the round-4 reason for the two `none` gaps holds.

**Duplication audit.** `roadmaps grep -i --readme-only` for Gelfand ring or stack, analytic prismatization, twistor stack, Hyodo–Kato stack, analytic de Rham stack, rational δ-space: AnalyticStacks only, as deferrals to this roadmap. No folder of this name is on main: not a second copy. `scratch/overlaps.md`: no other pull request changes this roadmap, none drops an id it cites, no citation depends on an open revision's numbering.

Overlap check: read AnalyticStacks (scope, section list, consumer note), PrismaticCohomologyPartII and PartIII, PartIV, AInfCohomology, CohomologyComparisons (open; by object), CrystallineCohomology, PerfectoidSpaces, EnhancedDerivedSheaves (main; suppliers or unrelated); shared: analytic stacks, six functors, nuclear modules, Fredholm criteria, Cartier duality, owner AnalyticStacks (consumed through gaps); integral prismatic objects, owner the PrismaticCohomology parts (Checks only); Gelfand rings and stacks, the analytic prismatization and decompletion over Gelfand rings, owner this roadmap.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in either library); the package stage says so in the module docstring. The design has no `Suggested.lean`, so there is nothing to probe for padding.

**Principles.** No re-planned roadmap, no upward supply, no algorithm, no sorry'd data or `set_option` (no Lean file). The README does not say it follows a source and no layer is named after a source's chapter.

**Copyright.** Wording: a script compared the full text of 16 sections (1.1, 1.3, 1.4, 2.3, 3.6, 4.7, 6.1, 7.1, 7.6, 8.2, 8.5, 9.4, 9.7, 10.8, 11.8, 11.9) with the full texts of ALRS and ABLB. Longest shared runs: 11 words ("let G be a uniform pro-p group of dimension d"), 10 words (a formula of 4.7; "f ∈ A is invertible if and only if its image"; the footnote fact of 7.1); seven sections share no run of 8 words. All are forced statements or formulas. I read the nine newly sampled sections beside the source passages: no table, figure or list of examples is taken over. Arrangement: ALRS has 357 of 498 line locators. Its contents (§§2.1–2.9, 3.1–3.7, 4.1–4.10, 5.1–5.8, 6.1–6.7, Appendix A) against the layers: Layers 1–3 ↔ ABLB with ALRS §§2.1–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4; Layer 10 ↔ §5; Layers 11–12 ↔ §6. Twelve layers against six chapters, not one to one. Inside Layers 7–12 the subsections run parallel to the source's, and the *Needs:* lines force that: 7.2 ← 7.1, 7.3 ← 7.2, 7.4 ← 7.3, 7.6 ← 7.5; 8.2 ← 8.1 through 8.6 ← 8.5; 9.8 ← 9.7, 9.9 ← 9.8; 10.2 ← 10.1 through 10.12 ← 10.9; 11.6 ← 11.4 ← 11.3. Where they do not, the roadmap departs: §4.7 is split between 8.7 and 9.3, §4.10's toric charts are 11.3, §5.1 is last (10.12), Layer 10 (Layers 1–7 only) is placed before its first use.

Source independence: 16 sections compared with 2 sources (ALRS, ABLB), none shared; largest share ALRS, 357 of 498 line locators; contents compared with ALRS: independent.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked through `roadmaps grep` by object and by reading AnalyticStacks; the other open roadmaps were not read one by one.
- Supplier sections other than those listed under Supplier order were not re-opened this round; I rely on the earlier rounds' resolution and on `scratch/citations.md` and `scratch/overlaps.md` reporting no change.
- Sections outside the sample and the repairs rest on the computed rows of rounds 12 to 16, which I did not recompute.
- The sign in the radius formulas of ALRS (first Source issue) was read from the text extraction, not from the printed page.
- The last seven Source issues are carried over from round 16; of these I re-read only ALRS line 2924 and line 3353 this round.

## Source issues

- **Misprint** in ALRS at §3.2, printed page 44 (ALRS line 2317), and Proposition 4.2.13, proof, printed page 64 (ALRS line 3335): the source gives the radius with a leading minus sign, and at the second place as a logarithm of |p| to the base |π♭|; it should be log|[ϖ]|/log|p|, nonnegative and zero where |p| = 0; affects nothing.
- **Misprint** in ALRS at Definition 4.5.1(2), printed page 69 (ALRS line 3611): the source decorates the relative formal Hodge–Tate stack with the overconvergent neighbourhood of D; it should carry the formal completion, over which it is the fibre product; affects nothing.
- **Misprint** in ALRS at Proposition 5.5.6, printed page 113 (ALRS line 6063–6065): the source writes the radius index of the binomial-analytic vectors with the constant ω; it should be the pseudo-uniformizer ϖ; affects nothing.
- **Misprint** in ALRS at Proposition A.2.15(1), printed page 182 (ALRS line 9841): the source writes the composite as f ∘ g; it should be g ∘ f; affects nothing.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56 (ALRS line 2924): the source puts the classifying stack of the de Rham additive group in the lower left corner; it should be that of the analytic additive group, as its proof says; affects nothing.
- **Misprint** in ALRS at Proposition 4.2.13, proof, printed page 64 (ALRS line 3353): the source writes the target of the first Frobenius isomorphism as a region of the thickened disc; it should be the region (0, p) of the prismatization; affects nothing.
- **Error** in ALRS at Remark 6.1.5, printed page 145 (ALRS line 7873): the source says the twistor stack of an unramified K is the product of GSpec(K) with Div¹; it should be the Frobenius-twisted product; affects a stated result.
- **Misprint** in ALRS at Theorem 6.3.2(1)–(2), printed page 150 (ALRS line 8146–8152): the source writes the product of X with K^HT without a base; it should be the fibre product over GSpec(K); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164 (ALRS line 8882): the source applies the upper shriek to the structure sheaf of Y^{Div¹}; it should be that of X^{Div¹}, as its proof concludes; affects nothing.
- **Misprint** in ALRS at Lemma 5.8.8, printed page 139 (ALRS line 7582–7584): the source names the decompletion Y^la and takes Z = BH^la × X^la; they should be X^la and BH^la × X^la/G^la; affects nothing.
- **Misprint** in ALRS at (1.2.1) and Remark 4.10.15, printed pages 8 and 91 (ALRS line 396, 4693): the source defines Γ_d as a product of locally analytic group stacks and then writes Γ_d^la and Γ_d^cont; Γ_d should be the p-adic Lie group; affects nothing.

## For the human reviewers

- **Scope.** The main sources are unpublished: ALRS (2026, author page), ABLB (arXiv, 2025), RCSolid, RC26a, Gest (notes); 433 of 498 line locators are to ALRS and ABLB. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies; no licence is stated on the files.
- **Ownership.** `gestalten-affine-proper` and `gestalten-transmutation` have supplier `none` in `design/plan.json`; no roadmap owns Gestalten (AnalyticStacks, "Left to other roadmaps", excludes them). An acceptance of this design will be conditional on an owner being named.
- **Supplier note.** AnalyticStacks' consumer note for this roadmap still lists a slug `hypercover-inversion`, which this design no longer declares (it is `perfect-complexes-fredholm-stacks`, AnalyticStacks §4.5).
- **Source correction.** 11.1 states a Frobenius-twisted product in place of ALRS Remark 6.1.5; the corrected form is derived in the roadmap and appears in no source.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1340ded5536c193c6ec2a0077d2a8d9fb775d28f", "job": "REV-DESIGN-RationalAnalyticPrismatization~17", "model": "fable", "worker": "chris-x55"} -->
