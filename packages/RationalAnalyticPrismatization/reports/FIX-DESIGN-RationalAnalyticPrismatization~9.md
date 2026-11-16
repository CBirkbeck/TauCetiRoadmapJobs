# Repair of RationalAnalyticPrismatization (design, round 9)

One review: `REV-DESIGN-RationalAnalyticPrismatization~8` (verdict `needs_changes`, eleven findings, two P2). Each finding was checked against the cached ALRS text, the sibling roadmaps at their heads and AnalyticStacks at its head before any edit. All eleven hold and all eleven are applied. Files changed: `packages/RationalAnalyticPrismatization/design/README.md` and `packages/RationalAnalyticPrismatization/design/plan.json`. `sources.toml` is unchanged: no new work is cited. Every README change to a statement, API bullet or Check is mirrored verbatim in `plan.json`, together with hypotheses, prerequisites, supplier sections and gap sections. The review's "For the human reviewers" section (scope, licence, the Gestalten owner) lists no finding, and nothing was changed because of it.

## F01 (P2) — applied

Verified: ALRS line 199 states Remark 1.5 for nilperfectoid A. The argument at ALRS lines 205–207 needs the fibre sequence W(Nil†(A)) → W(A_{≤1}) → W(A^{u,°}), "since A is nilperfectoid".

Change in 7.2: "and that 𝒳_T represents the maps W′(A_{≤1}) → B_{≤1} …" → "and that for nilperfectoid A the Gelfand stack 𝒳_T represents the maps W′(A_{≤1}) → B_{≤1}, B a Gelfand ring, …". Also added: a plan hypothesis, a route sentence explaining why nilperfectoid is needed (*Needs* gains §1.2, §1.8), and Check `deltaT_wittNilperfectoid` (C_p[ε]/ε² versus ℚ_p(μ_{p^∞})).

## F02 (P2) — applied

Verified against the source. ALRS lines 7581–7587 (Lemma 5.8.8) need: H compact, T → X a G^cont-equivariant H^la-torsor, and β_{X,Z} an equivalence for Z = BH^la × X^la/G^la. ALRS lines 7595–7604 (Proposition 5.8.9) need conditions (1)–(2) on Y := Z/G^cont.

Change in 10.11: both clauses are restated with their hypotheses. T^{st la} becomes the torsor T′ with T ≅ T′ ×_{X^la} X. The source's Z becomes W, and the swapped quotient is V := W/H^cont. *Needs* gains §§10.6, 10.5, 2.7. New Check `torsor_doubleTrivialG` covers G trivial.

Differently from the suggested repair, W is required to be a Berkovich space. The source writes "Gelfand stack", but its formula uses |Z|^Betti, which is defined only for Berkovich spaces (ALRS line 930; 2.7 here). Its proof also asserts that "Z is a Berkovich space" (ALRS line 7618). The suggested Check is anchored at 10.7 (ALRS Corollary 5.4.6), the precise statement, rather than at 10.12(3).

## F03 (P3) — applied

Verified: ALRS lines 6847–6851 assume that ϖ^ϵ ∈ Λ for ϵ ∈ ℚ (a dense set suffices) and normalise |ϖ|_ϖ = 1/2.

Change in 10.10: added "such that ϖ^ϵ ∈ Λ for every ϵ in a dense subset E of ℚ_{>0}, normed by the |−|_ϖ of 10.4 …", with ρ_{n,k}, ϵ_{n,k} ∈ E and "ϵ-TORS … for all ϵ ∈ E". The third Check now shows E = ℤ[1/p]_{>0} for the toric tower. New Check `sen_discreteExcluded`: discretely valued Λ such as ℚ_p is excluded.

The same pattern was repaired in 10.8 and 10.9 (ALRS lines 5987–5989 and 6727–6729). 10.8 now opens with G uniform of dimension d, |p|_ϖ ≤ 1/2 and ϖ^ϵ ∈ Λ for ϵ ∈ E (footnote 43 at ALRS line 6009: a dense set suffices). 10.9 refers to "Λ, ϖ, |−|_ϖ and E as in 10.8". The plan hypotheses of 10.8, 10.9 and 10.10 are updated.

## F04 (P3) — applied

Verified: ALRS lines 7888–7890 say "the H⁰ of the pushforward … identifies with D_HT(V) (up to changing the grading by a sign)".

Change in the 11.1 Check: "The pushforward … gives D_HT(V)" → "H⁰ of the pushforward … is D_HT(V) …, up to the sign convention of the grading (ALRS Example 6.1.7(1), p. 146, ALRS line 7888); the pushforward itself also has H¹: for V = ℚ_p its weight-0 part is RΓ(X^HT, O) = K ⊕ K[−1] by the first Check of 11.2".

## F05 (P3) — applied

Verified: ALRS lines 7559–7564 say only that it is "not clear" whether a G^la-torsor is a Berkovich space. The induced GL_n-torsor is one, and the overconvergent neighbourhood of |Y| is the torsor itself (the source's "Z identifies with" is a misprint).

Change in the 10.11 Check: "need not be a Berkovich space: … Y ×_{GL_n(ℤ_p)^la} GL_n is the overconvergent neighbourhood …" → "ALRS Remark 5.8.6 leaves open whether P is a Berkovich space: … P′ = P ×^{GL_n(ℤ_p)^la} GL_n is a Berkovich space and P is the overconvergent neighbourhood of |P| ⊆ |P′| …; for the trivial torsor over a point, P′ = GL_n and P = GL_n(ℤ_p)^la".

## F06 (P3) — applied

Verified: ALRS lines 3347–3360. Frobenius gives 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} and 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)}. The disc is reduced over (0, 1) and agrees with D^×_{FF,A} over (1/p, ∞).

Change in the 8.5 route: "𝒳_T is classical over (0, 1/p) ∪ (1/p, ∞) up to Frobenius" → "Frobenius induces isomorphisms 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} and 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)}, … agrees with D^×_{FF,T♭} over (0, 1), its thickenings lying at the radii p^n, n ≥ 0 (7.2), and … over (1/p, ∞) with … D^×_{FF,A} of 7.2". No other passage calls 𝒳_T classical.

## F07 (P3) — applied

Verified with `roadmaps show`:

- LocallyAnalyticRepresentationsOfLocalGroups at its head has "### 2.3 Pan's derived functors of locally analytic vectors" and "### 3.8 Locally analytic vectors of solid representations". Its former-numbering table maps LR.2 → Layer 2 and LR.3 → Layer 3.
- PhiGammaModulesAndIwasawaCohomology at its head has "### 1.4 Extended descent and arbitrary-module decompletion".
- None of the three identifiers occurs in any roadmap.

Change: every "§LR.2 (derived-analytic-vectors)" and "§LR.3 (solid-analytic-vectors)" → §2.3 and §3.8, and "(cyclotomicDecompletionEquivalence)" was dropped. This covers Scope, comparison partners, the 10.3 Check, Layer 10 Dependencies, the 11.1 Check and the plan supplier `sections`/`what`.

## F08 (P3) — applied

Verified: AnalyticStacks at its head, "Left to other roadmaps" (README line 22), says Gestalten "are a different theory and are outside this roadmap". Its consumer note (line 1290) adds that our Gestalten contracts are outside it. It names no roadmap.

Change in Scope: "(AnalyticStacks leaves them to a roadmap of their own)" → "(AnalyticStacks places them outside its scope)". In Declared gaps: "…to a roadmap of their own placed after it…" → "…outside its scope and names no owner…". The same repair was made in both plan `gaps[].section` strings.

## F09 (P3) — applied

Change in 2.8: "its left adjoint X ↦ X̂" → "its left adjoint X ↦ X̂, written (X)^∧ on compound expressions". The four `\hat{…}` occurrences in the README (3.1 route, 6.2 statement and Check, 7.2 route) and the two in the plan become (Marc(A^u))^∧, (FF^⋄_X)^∧ and (T^{u,⋄})^∧. A backslash grep now finds no line in the README.

## F10 (P3) — applied

Change in Scope: "Gelfand-stack foundations of ABLB §§2–6 … theory of ALRS §§2–6 and Appendix A … decompletion theory of ALRS §5" → layers named by their mathematics (Layers 1–6; 7–9, 11, 12; 10).

Elsewhere:

- How to read the build: "decompletion theory of ALRS §5" → "decompletion theory; it depends only on Layers 1–7 and is placed before its first use in Layer 11".
- Conventions: "as in ALRS from §2.4 onwards" dropped.
- 2.1: "From §2.4 of ALRS onwards, and …" → "From Layer 3 onwards … (ALRS p. 20, ALRS line 1038)". The new locator points at the source's standing assumption.

## F11 (P3) — applied

Verified: ALRS lines 5110–5112 define G_{<r} for r ∈ (0, 1] and G_{≤r} for r ∈ (0, 1). Lines 5163 and 5169 state Definition 5.2.11 and Lemma 5.2.12 for r ∈ (0, 1). Lines 9569–9576 state the corepresentability for every η and every connective M.

Changes:

- 10.3: ranges added to G_{<r} and G_{≤r}, and "for r ∈ (0, 1)" before Rep^{<r}, Rep^{≤r} and the Lemma 5.2.12 statement. New Check `la_leqRange`: G = ℤ_p, r = 1/p, and r = 1 undefined.
- 4.6: "… ≅ τ_{≥0}Hom_R(η^*L_{Y/X}, M) naturally" → "for every η: GSpec(R) → Y with R a Gelfand ring and every connective M ∈ D_{≥0}(R) the fibre … at the point given by η is …, naturally in M".

## Same pattern elsewhere

- F01 (nilperfectoid): W′ occurs only in 7.2. The realization in 7.3 is stated for uniformly perfectoid A, as in ALRS Proposition 3.4.12 (ALRS line 2572), so it is unchanged.
- F03 (roots of ϖ): repaired in 10.8 and 10.9 as well (see F03). 10.4 needs no roots of ϖ (ALRS Definition 5.2.15, ALRS line 5364), so it is unchanged.
- F06: no other passage claims classicality of 𝒳_T.
- F07: no other declaration-like supplier identifier is in parentheses after a section. The only remaining parenthesised supplier labels are the target names of existing roadmaps, resolved in round 7. `roadmaps resolve` reports no Lean name found nowhere.
- F08: both plan gap entries were repaired.
- F10: the remaining "ABLB §§5.5–5.6" (3.2 route), "as in ALRS Construction 2.1.2" (2.2) and "ALRS §A.2" (plan 4.7 hypothesis) are locators of the results used, not statements of organisation.
- F11: 4.6 has the only corepresentability statement. Sqz in 5.2 already quantifies over M.

## Checks run

Dependency check (gate) after all edits:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2252 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line.

`roadmaps resolve` on the README lists one cross-roadmap citation found nowhere: MotivesAndAlgebraicCyclesPartII §BM.0. That roadmap is a board package earlier in the merge order, and its section was confirmed in round 8. It lists no Lean names found nowhere.

Scripted agreement check: all 529 plan statements, API bullets and tests occur verbatim in the README (0 missing; 525 before the four new Checks), and every gap `needs` sentence occurs in the README. `plan.json` parses and round-trips with the original formatting (indent 1, UTF-8). A policy grep finds no backslash, `$`, process word, "LR." identifier, pull-request number or machine path.

Suggested.lean: the design stage has no `Suggested.lean`, so there was no `#check` pass and no elaboration. No Lean name was added, renamed or removed.

Sources: every locator added is in the cached ALRS text at the line cited, with page markers checked: ALRS lines 205, 930, 1038, 3347, 5987, 6009, 6727, 6847, 7334, 7581, 7595 and 7888. No source was fetched and no `needs-references.toml` was written.

Ownership against open pull requests: no new construction is introduced. The three roadmaps whose ids changed (LocallyAnalyticRepresentationsOfLocalGroups, PhiGammaModulesAndIwasawaCohomology, AnalyticStacks) were read at their open heads.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 7.2 Witt description (nilperfectoid) | A = C_p[ε]/ε²; A = C_p; A = ℚ_p(μ_{p^∞}); A = 0 | A_{≤1} = A ×_{C_p} O_{C_p} = O_{C_p} ⊕ C_p·ε, fibre over O_{C_p} is C_p·ε = Nil†(A); ghost components w_n = p^n x_n (ε² = 0), so W(C_p·ε) ≅ ∏_ℕ C_p·ε. For C_p: W′ = W(O_{C_p}^♭) = A_inf, so 𝒳_T = D^×_{FF,C♭}, as the first Check says. For ℚ_p(μ_{p^∞}): Nil† = 0 and ℤ_p[μ_{p^∞}] → its p-adic completion is not onto, so it is excluded. For 0: W′ = 0 and 𝒳_T = ∅, as the last Check says | holds with the hypothesis | hypothesis added; Check added |
| 7.2 route (fibre sequence) | nilperfectoid A | A^{†-red} = A^u (1.8), pullback square of 1.2 ⇒ fib(A_{≤1} → A^{u,°}) = fib(A → A^u) = Nil†(A) | holds | route sentence added; *Needs* §1.2, §1.8 |
| 10.11 Lemma 5.8.8 | G = 1; H = 1; H finite | G = 1: β = id, T′ = T, O(T) = O(T′). H = 1: T = X, T′ = X^la, O(X)^{G-la} = O^la_X = O(X^la) (10.7). H finite: H^la = H^sm and β is an equivalence by Lemma 5.8.1(2) (second Check) | holds | hypotheses added |
| 10.11 Proposition 5.8.9 | G = 1; H = 1 with W = G^cont (G compact); W a Gelfand stack that is not Berkovich | G = 1: both mapping anima contractible, RHS = GSpec_{|Y|}(O^{H-la}_Y)/H^la = 10.7 locally. H = 1, W = G^cont: Y = pt; RHS: h: pt → G^Betti/G^la = BG^† has GSpec(h_*O) = pt, so both sides are a point. Not Berkovich: |W| is undefined (ALRS line 930), so the statement is not well formed | holds; Berkovich hypothesis needed for |W| | restated; W Berkovich; Check added |
| 10.11 Check (Remark 5.8.6) | trivial torsor over a point, n = 1, 2 | P′ = GL_n, P = GL_n(ℤ_p)^la = ⋂_r G_r (10.3), the overconvergent neighbourhood of the profinite GL_n(ℤ_p); n = 1: ℤ_p^{×,la} ⊂ G_m | consistent with "not known in general" | Check rewritten |
| 10.10 roots of ϖ | Λ = ℚ_p (ϖ = p); Λ = C_p (ϖ = p); toric Λ = B_I; p = 2 | ℚ_p: E ⊆ v_p(ϖ)^{−1}ℤ = ℤ, not dense, so excluded (p^{1/p} ∉ ℚ_p). C_p: E = ℚ_{>0}. B_I: E = ℤ[1/p]_{>0}; k = 0, n = 1 gives ϵ = 1/p, ρ = 1/p², |ϖ^{1/p}|_ϖ = 2^{−1/p}; ϵ_{n,k} = p^{k−n} → 0. p = 2: E = ℤ[1/2]_{>0}, dense | holds | hypothesis, E-membership; 2 Checks |
| 10.8 standing Λ | Λ = ℚ_p(p^{1/2}), ϖ = p^{1/2}; Λ = C_p, ϖ = p^{1/2}; Λ = C_p, ϖ = p²; d = 0 | ℚ_p(p^{1/2}): |p|_ϖ = 1/4 but p^{ϵ/2} ∈ Λ only for ϵ ∈ ℤ, so excluded from 10.8 though allowed in 10.4 (no roots needed there). C_p, p^{1/2}: |p|_ϖ = 1/4, E = ℚ_{>0}, admitted. C_p, p²: |p|_ϖ = 2^{−1/2} > 1/2, excluded. d = 0: (d+1)ϵ = ϵ, "every module decompletes" Check unchanged | consistent with 10.4 Checks | hypothesis added |
| 10.9 Λ as in 10.8 | G trivial | A_i any ϖ-adic models, ϵ-TORS trivial, Perf equivalence is the identity (first Check) | holds | reference to 10.8 |
| 11.1 D_HT Check | V = ℚ_p; V = ℚ_p(1); V = ℚ_p(n), n ≠ 0 | ℚ_p: weight 0 is RΓ(X^HT, O) = K ⊕ K[−1] (11.2), H⁰ = K = D_HT(ℚ_p). ℚ_p(1): weight ±1 is RΓ(O{1 ∓ (±1)}) = K ⊕ K[−1], H⁰ = K in weight ±1 versus D_HT in degree −1, matching up to sign; other weights RΓ(O{m ≠ 0}) = 0 | holds; derived pushforward ≠ D_HT | Check rewritten |
| 8.5 route | A = C_p[ε]/ε²; X^Δ reciprocal | copy n at p^n; φ: copy n ↦ n + 1; (1/p, ∞) ∋ p^n for n ≥ 0, (1, ∞) ∋ p^n for n ≥ 1, a bijection; (0, 1/p) and (0, 1) contain no copy. Reciprocal: X^Δ_{(0,1)} ↔ 𝒳_{T,(1,∞)}, X^Δ_{(0,p)} ↔ 𝒳_{T,(1/p,∞)}, matching Proposition 4.2.13(2) | holds | route rewritten |
| 10.3 ranges | G = ℤ_p, r = 1/p; r = 1; p = 2 | G_{r′} ∩ ℤ_p = pℤ_p for 1/p ≤ r′ < 1, so G_{≤1/p} = ⊔_{a<p} (a + overconvergent closed disc of radius 1/p). r = 1: no G_{r′} with r′ > 1, so undefined; G_{<1} = ⋃_{r′<1} G_{r′} is defined. p = 2: ℤ_2 is uniform, G_{≤1/2} = two discs | holds | ranges; Check added |
| 4.6 cotangent quantifiers | M = 0; Y = A¹, R = ℚ_p, M = ℚ_p; M = ℚ_p[−1] | M = 0: fibre = pt = τ_{≥0}Hom(η^*L, 0). A¹: fibre = tangent line ℚ_p = Hom(ℚ_p·dT, ℚ_p). ℚ_p[−1]: not connective, R ⊕ M not a connective ring, so excluded | holds | quantifiers added |
| 2.8 notation (X)^∧ | X = Marc(A^u) for qfd nilperfectoid A | (Marc(A^u))^∧ = GSpec(A^u) (2.8 API bullet 3); 3.1 route reads the same | consistent | notation |
| Scope/organisation | Layer 10 *Needs* | 10.1–10.12 *Needs* name only §§1–7, §10.x and suppliers; first use in 11.1 (*Needs* §10.12, §10.10) | consistent | wording |

## For the maintainer

- No Lean name, target id, section number or gap slug changed, so no other roadmap's citation breaks. The new plan test names are `deltaT_wittNilperfectoid`, `torsor_doubleTrivialG`, `sen_discreteExcluded` and `la_leqRange`.
- 10.11 (ALRS Proposition 5.8.9) now requires the (G × H)^cont-stack W to be a Berkovich space. The source says "Gelfand stack" but uses |W|^Betti and, in its proof, that W is Berkovich. A reviewer who prefers the source's wording should note that |W| is undefined otherwise.
- The Gestalten contracts remain without an owner. This was settled as a board decision in an earlier round; F08 corrects only the description of AnalyticStacks' wording.
- Comparison partners now cited by section only: LocallyAnalyticRepresentationsOfLocalGroups §2.3, §3.8 and PhiGammaModulesAndIwasawaCohomology §1.4. Both are used in Checks only.
