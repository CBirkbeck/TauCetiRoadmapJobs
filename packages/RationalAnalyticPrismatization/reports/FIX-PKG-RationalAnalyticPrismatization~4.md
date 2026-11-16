# FIX-PKG-RationalAnalyticPrismatization~4

Findings of REV-PKG-RationalAnalyticPrismatization~3 (one review, so plain ids). Files changed: `packages/RationalAnalyticPrismatization/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified: ALRS Proposition 4.4.3(3) (ALRS line 3496) assumes X †-cohesive with a cotangent complex, and its proof (ALRS line 3524) evaluates X on the square of Lemma 4.4.2(3) using †-cohesiveness. In 9.1, "; and that π_X is the fibre … so that for formally smooth X with tangent bundle T_X," → "; and that, still for †-cohesive X with a cotangent complex, π_X is the fibre … so that if X is moreover formally smooth with T_X a vector bundle,".

Pattern: the same hypotheses were searched in every restatement of the gerbe structure. 9.2 already carries them ("X → D a †-cohesive map … if X admits a cotangent complex … formally smooth with `T_{X/D}` a vector bundle"). 9.4, 11.5 and 11.8 apply it only to smooth rigid spaces or Berkovich spaces, which are †-cohesive with cotangent complexes (4.4, 4.7). The Checks of 9.1 are unaffected: GSpec(ℚ_p), A¹ and GSpec(C_p) are Berkovich spaces, and the GSpec(C_p) Check uses only part (2).

## F02 (P3) — applied

Verified: I_Δ is the ideal of Q_p^HT ⊆ Q_p^Δ (8.4; ALRS line 3385), so it cannot be pulled back along a map into Div¹. It pulls back to X_cyc as ([p]_q) (ALRS line 4146). The ideal with zeros at all of μ_{p^∞} is `I_{Div¹}`. In 9.7(3), "and I_Δ along X_cyc → Div¹~ → Div¹ to (log q)" → "and the ideal `I_{Div¹}` of the Hodge–Tate divisor of Div¹ (9.1) pulls back along X_cyc → Div¹~ → Div¹ to (log q), whereas I_Δ pulls back along X_cyc → Q_p^Δ to ([p]_q)".

Same pattern, also repaired:
- The 9.7 proof route: "the perfected ideal" → "the pullback of `I_{Div¹}` to Div¹~ is the perfection `⊗_{n∈ℤ}` φ^n(I_Δ) of I_BK (8.4)".
- The third Check of 9.7: "The pullback of I to Q_p^HT" (where I had just been defined as the prism ideal on X_cyc) → "The restriction I of `I_{Div¹}` to Q_p^HT (9.1)".
- 8.4: "the Hodge–Tate locus" → "the Hodge–Tate locus Q_p^HT ⊆ Q_p^Δ".

Elsewhere (Conventions, 9.8) `I_{Div¹}` and I_Δ were already used correctly.

## F03 (P3) — applied

Verified: ALRS line 3809–3822 defines Spf(B⁺_dR,X) and `FF^∧_Z`, and ALRS line 9222–9236 builds `X^{pHT^}`, Spf(B⁺_pdR,X), h′ and F̃. The README defined none of them, and also used `FF^∧_{X^⋄}` (9.5) undefined. Changes:
- 9.5 now defines `FF^∧_{X^⋄}` as the formal completion of `FF_{X^⋄}` along the untilt divisor (ALRS line 3822).
- 12.6 "Construct the maps … and prove that pullback along F̃: …" is replaced by the reviewer's construction, written in my own words:
  - `α_{X,dR}` is named as the restriction of `FF_{X^⋄}` → `X^{Div¹}` (8.6).
  - The class log χ_cyc ∈ H¹(`Q_p^{†-HT}`, O) is placed on the overconvergent Hodge–Tate stack of 9.4 (ALRS Example 6.1.7(3)).
  - Spf(B⁺_dR) is defined as `colim_n GSpec(B⁺_dR/t^n)` (ALRS line 9169).
- 12.6 *Needs:* gains §9.5, §8.6 and §11.2. 9.5 *Needs:* gains §6.2.
- New Check in 12.6: the shift is [−1] (computation below).

The suggested repair is correct as written, including the shift h_*1 ≅ 1 ⊕ 1[−1]. In the README's convention `L_{BG_m}` = O[−1] (4.8, 11.2), so a degree-one class is 1[−1].

## F04 (P3) — applied

An API list ("The API has the following laws.") was inserted after the *Needs:* line of 8.5, 8.6, 10.2, 12.5 and 12.6. Each bullet restates the section's own statement with its hypotheses, which are scoped more precisely than the suggested bullets:
- 8.6: every bullet says "for every Gelfand stack X", with †-cohesiveness only for cartesianness (ALRS Propositions 4.3.1–4.3.2).
- 8.5: adds the pushout of ALRS Corollary 4.2.14 and that Frobenius multiplies κ by p.
- 12.5: keeps "on Berkovich spaces with the Berkovich-étale topology" and the strong-theory conclusion (Zav Definition 5.2.8).
- 12.6: adds the essential-image law of ALRS Proposition 6.7.3 and the pushforwards of `α_{X,dR}`, f̂, h and h′.
- 10.2: the t-structure bullet is stated for every light locally profinite Π, as in ALRS Lemma 5.2.2(2) (ALRS line 4866). The 10.2 statement was rescoped to match: "; that for every light locally profinite Π, D(BΠ^cont) has a t-structure …; and that if Π is profinite of finite p-cohomological dimension then f is D-proper". The old sentence read as stating the t-structure for profinite Π only, which is narrower than the source.

Mechanical recount after the edits: 93 subsections, 62 with an API list, and no subsection without one contains a Define, Construct or Call sentence. The 31 others have a "Let" only for standing hypotheses or notation (9.1, 9.7). Every subsection still has exactly one *Needs:* line and at least three Checks.

## Checks

- **Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout, exits 0 with no output. The file is unchanged: `import Mathlib`, one module docstring and an empty namespace. With 0 declarations, the `#check @name` comparison has nothing to elaborate; no binder changed. The docstring's 12.6 item (pullback along `Spf(B⁺_pdR,X) → X^{cone^}`; lacks formal cones, formal Hodge–Tate stacks and the period sheaves) stays accurate.
- **Dependency check.** Output in full: `depcheck: 249 roadmaps, 2398 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The new citations are AnalyticStacks §3.8 (already a consumed section) and internal sections earlier than the citing one.
- **Citations.** `roadmaps resolve` (index of 2026-11-16T06:56:17Z) finds no Lean name and one lead, "MotivesAndAlgebraicCyclesPartII Layer 0". That is a board package earlier in the merge order, not new in this round and verified by the review. AnalyticStacks §3.8 ("Realization of algebraic stacks") was read at its open head; it constructs (−)^cond: AlgStk → AnStk(C₀), which realizes BG_a^alg.
- **Ownership.** `roadmaps grep` finds no roadmap on main or open that owns the relative period sheaf B⁺_pdR,X as a Gelfand stack or the formal completion of a relative Fargues–Fontaine curve. "formal completion of … Fargues/FF" has no match. "pdR" matches only Fontaine's B_pdR and D_pdR for Galois representations, in TriangulineVarietyAndItsLocalModel and PadicLocalLanglandsForGL2Qp, which are a different object. Both constructions are this roadmap's (ALRS Construction 6.7.5, Lemma 4.6.4). BG_a^alg is imported from AnalyticStacks §3.8, not restated.

## Gate failures

- **tex=5** (LaTeX-style braced subscripts outside code spans, all in README §12.6). The notation `α_{X,dR}` added this round was written as bare text five times: three times in the §12.6 statement paragraph (`α_{X,dR}`, `α_{X,dR,*}1`, `α_{X,dR}`) and twice in its API bullet. Each is now a code span, as the rest of the README does for braced subscripts. The mathematics is unchanged. A scan of the README for `_{`, `^{`, `\command` and `$` outside code spans and code blocks now finds 0 hits, and every line has balanced backticks. Suggested.lean is untouched, so the elaboration result above still stands. After the edit the dependency check still prints `depcheck: 249 roadmaps, 2398 edges, 0 problem(s)`.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 9.1(3), with hypotheses | X = GSpec(ℚ_p); X = A¹; X = GSpec(C_p) | T = 0, π_X = id of Q_p^HT; T = O, band G_a^†{1}; L = C_p(1)[1], T not a vector bundle, so only part (2) applies | holds; all three are Berkovich, hence †-cohesive with L | F01 |
| 9.1(3), vector-bundle hypothesis | X = D × BG_a (9.2 Check, relative form) | `T_{X/D}` = O[1]; torsor under B²G_a^†{1}, not a gerbe | hypothesis needed, as stated | none |
| 9.7(3) | q = ζ_p, ζ_{p²}; the point q = 1, `q^{1/p}` = ζ_p of X_cyc | [p]_q: 0, (ζ_p − 1)/(ζ_{p²} − 1) ≠ 0, p ≠ 0; log q: 0, 0, 0 | ([p]_q) ≠ (log q); (log q) is the n ∈ ℤ union | F02 |
| 9.7 proof route | `log(q)/(q^{p^{-n}} − 1)`, n → ∞ | zeros: μ_{p^∞} minus {`q^{1/p^n}` = 1}; the limit excludes only q♭ = 1, which is not in X_cyc | zeros of log q | F02 |
| 9.7 Check 3 | I = `I_{Div¹}` on Q_p^HT | Ĉ(1), θ = 1 (11.2), as in Conventions and the 9.8 API | consistent | F02 |
| 12.6 h_*1 | X = GSpec(ℚ_p): `X^{cone^}` = Â¹/G_m (5.1) | weight n: RΓ(Q_p^HT, O{n}) = 0 (n ≠ 0), ℚ_p ⊕ ℚ_p[−1] (n = 0); Γ(BG_a^alg, O) = ℚ_p ⊕ ℚ_p[−1] | 1 ⊕ 1[−1]; [1] would need H^{−1} ≠ 0 | F03 |
| 12.6 h′, X^{pHT^} | X = GSpec(ℚ_p) | pushforward along `X^{pHT^}` → Â¹/G_m = pullback of h′_*1 = 1 along the point: 1 | unit, as stated | F03 |
| 12.6 filtered h_*1 | Fil^i B_dR, i ≤ 0 and i ≥ 1 | H*(Gal, t^iB⁺_dR) = ℚ_p ⊕ ℚ_p[−1] (i ≤ 0), 0 (i ≥ 1) | the unit filtration, so 1 ⊕ 1[−1] on Â¹/G_m | none |
| 12.6 f̂_*1 | T^dR_X{1}-torsor, X = A¹ | Γ(G_a^dR, O) = ℚ_p | 1, as stated | none |
| 9.5 `FF^∧_{X^⋄}` | X = GSpec(ℚ_p) | completion of `FF_{Marc(ℚ_p)}` along the untilt divisor; quotient presentation `Spf(K_∞[[t]])/ℤ_p^{×,la}` of 9.4 on the Hodge–Tate side | consistent with ALRS line 3822 | F03 |
| 8.5 API | X = GSpec(ℚ_p); φ^{−n}(Q_p^HT) | κ(φ^n x) = p^n κ(x) = 1 gives κ(x) = `p^{-n}`; the pushout of `Div¹~_{(0,p)}` and `(D^{×,dR})_{(1,∞)}` | matches 8.5 Checks 1–2 | none |
| 8.6 API | X = ∅; X = GSpec(ℚ_p) | all corners empty; Div¹ → Q_p^HK iso off Q_p^HT, not over it (A¹/G_m → `A^{1,dR}/G_m^dR` at 0) | matches 8.6 Checks | none |
| 10.2 API | Π = 1; Π = ℤ_p; Π = ℚ_p; Π = ∏_ℕ ℤ_p | D(ℚ_p), Φ = id; cd 1, f D-proper, Φ f.f.; not profinite, t-structure yes, !-able via ℤ_p; infinite cd, Φ not f.f. | scopes as stated | 10.2 t-structure rescoped |
| 12.5 API | d = 1, X = GSpec(ℚ_p); d = 0 | O{1}[2] ⊕ O; O ≅ f_*O | matches 12.5 Checks 1–2 | none |

## Maintainer notes

- No declaration name changed, and no id was dropped or renumbered: every section number is kept.
- No supplier gap was added. The `gaps` list of `design/plan.json` is unchanged.
- ALRS Construction 6.7.5 prints the second summand of h_*1 with the opposite shift. The README states 1[−1] and pins it with a Check. The review's Source issues list this, together with the I_Δ slip of ALRS Proposition 4.8.1(3).
- The review was read as data. It contains no instruction outside its findings.
