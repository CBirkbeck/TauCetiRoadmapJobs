# FIX-PKG-RationalAnalyticPrismatization~5

Findings of `REV-PKG-RationalAnalyticPrismatization~4` (three findings, all P3). Only `packages/RationalAnalyticPrismatization/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## REV-PKG-RationalAnalyticPrismatization~4/F01 (P3) — applied

Verified. ALRS Remark 4.10.7 (ALRS line 4513–4515) says the perfected twist is the ideal sheaf of `⊔_{n∈ℤ}` φ^n(Q_p^HT) only *after forgetting Frobenius*. ALRS line 4521–4522 says its descent is `I_{Div¹}` ⊗ `O_{Div¹}⟨1⟩`, a line bundle of slope zero. ALRS Remark 4.9.3(3)–(5) (ALRS line 4283–4298) says the same. So the two Frobenius structures differ by O⟨1⟩, as the finding says.

Changes:
- **9.8 statement.** Old: "Construct the perfected twist `O_{Div¹~}{1} = ⊗_{n∈ℤ}` φ^n(I_Δ) with Frobenius structure". New: the perfected twist is the pullback of `I_{Div¹}` tensored with the pullback of O⟨1⟩. After forgetting Frobenius it is `⊗_{n∈ℤ}` φ^n(I_Δ), the ideal sheaf of `⊔` φ^n(Q_p^HT). Its Frobenius is `p^{-1}` times the ideal-sheaf (factor-permuting) structure (ALRS Remark 4.9.3(3)–(4), ALRS line 4283; Remark 4.10.7, ALRS line 4508).
- **9.8 API.** New bullet on the perfected twist and its descent.
- **9.8 Checks.** New Check comparing log q (φ = p, slope −1) with log q ⊗ e⟨1⟩ (φ = 1, slope 0).
- **8.4, third Check.** Now says "the pullback of `I_{Div¹}` (9.7), the underlying line bundle of the perfected twist of 9.8".

Same pattern elsewhere: the proof route of 9.7 now says the pullback of `I_{Div¹}` carries the ideal-sheaf Frobenius, which permutes the factors. The Conventions (line 27), 12.2 and 12.5 already write O{1} = `I_{Div¹}` ⊗ O⟨1⟩ on Div¹, so they needed no change.

## REV-PKG-RationalAnalyticPrismatization~4/F02 (P3) — applied

Verified. Each of the five subsections names an object that later subsections use, and none had an API list. I compared each restated law with its source: 7.2 with ALRS line 2501–2539, 2526–2534, 2645–2647 and 197–207; 10.6 with ALRS line 5763–5771 and 5814–5817; 10.11 with ALRS line 7473–7480, 7581–7587, 7595 and 7627–7636; 11.2 with ALRS line 7798–7817 and 7868–7871; 11.5 with ALRS line 7976–7992.

Change: "The API has the following laws." with bullets after the `*Needs:*` line of each subsection:
- 7.2: five bullets.
- 10.6: three bullets.
- 10.11: four bullets. The double-decompletion bullet spells out its hypotheses (i) and (ii).
- 11.2: four bullets.
- 11.5: four bullets.

Each bullet restates the subsection's own statement with its hypotheses. No new target.

## REV-PKG-RationalAnalyticPrismatization~4/F03 (P3) — applied

Verified at the open heads.
- **AnalyticStacks §4.3** (its README, §4.3 "Nuclear modules over solid ℚ_p-algebras"): it defines Nuc(A) as the nuclear objects of RefinedTraceMethods §4.3, equivalently by the Hom criterion. Its part (1) is the test for nuclear A plus countable limits; part (2) is countable descent. Its Scope says closure under colimits and tensor products and "ω₁-compact = basic nuclear" are imported from RefinedTraceMethods §4.3.
- **RefinedTraceMethods §4.3** ("Nuclear objects"; "Closure and generation of nuclear objects") states those facts for a compactly generated presentable symmetric monoidal stable category with compact unit. D(A) is such a category (AnalyticStacks §4.3, opening).

Changes:
- **AnalyticStacks contract item.** Old: "Nuclear modules (§4.3(1)–(2)) … the Hom criterion, closure under colimits and tensor products, ω₁-compact nuclear objects basic nuclear …". New: "Nuclear modules (§4.3, with RefinedTraceMethods §4.3)". The Hom criterion and §4.3(1) are cited to AnalyticStacks (ABLB Lemmas A.0.7–A.0.8). The closure facts and ω₁-compact = basic nuclear (ABLB Lemma A.0.6) are cited to RefinedTraceMethods §4.3.
- **RefinedTraceMethods contract.** Gains a sentence on nuclear objects, and "Sections consumed: §1.7, §1.10, §4.3."
- **Dependencies.** RefinedTraceMethods §4.3 is added to the `*Needs:*` lines of 2.3, 3.2 and 10.2 and to the `### Dependencies` of Layers 2, 3 and 10.

RefinedTraceMethods is line 352 of the merge order, this roadmap line 408, so the new edge points down.

## Checks run

- **Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, one module docstring, an empty namespace, 0 declarations. There was no `TauCeti.*` import to build. With no declaration, the `#check @name` comparison had nothing to elaborate. No README target changed in a way that affects the Lean file, and no backticked name of this roadmap was added.
- **Dependency check** (output, run again after the last edit):

      depcheck: 254 roadmaps, 2423 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`.** One lead, unchanged from before this round: "MotivesAndAlgebraicCyclesPartII Layer 0" is found nowhere because that roadmap is a board package, not yet on main or in an open pull request. It is earlier in the merge order (line 407), and its Layer 0 was confirmed in the previous review. Lean names found nowhere: none. RefinedTraceMethods §4.3 resolves.
- **Ownership against open pull requests.** I read AnalyticStacks and RefinedTraceMethods at their open heads (`roadmaps show`) for F03. No new object was introduced, so no further ownership search was needed.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 9.8 perfected twist and its Frobenius | X_cyc, generator log q ⊗ e⟨1⟩; same without e⟨1⟩ | φ(log q) = log(q^p) = p·log q; φ(e⟨1⟩) = `p^{-1}`e⟨1⟩; φ(log q ⊗ e⟨1⟩) = e. Without e⟨1⟩: φ = p ↔ O(−1), with sections B^{φ=p^{-1}} = 0. With e⟨1⟩: slope 0. Galois σ: log q ↦ χ(σ)·log q, so ℚ_p(1) | Tate twist only with O⟨1⟩ | statement, API bullet and Check added |
| 9.8 against the Q_p^Δ twist | generator (log q/(q − 1)) ⊗ e⟨1⟩ against log q ⊗ e⟨1⟩ | φ(q − 1) = [p]_q(q − 1); φ(e_BK) = `[p]_q^{-1}`e_BK; so φ((q − 1)e_BK) = (q − 1)e_BK | first Check of 9.8 and the new Check agree | none |
| 9.8 off the Hodge–Tate locus | `I_{Div¹}` trivial | O{1} = `I_{Div¹}` ⊗ O⟨1⟩ = O⟨1⟩ | agrees with the fourth Check and 12.2 | none |
| Slope convention | O(n) = (ℚ_p, `p^{-n}`φ) (Conventions); ideal sheaf of the untilt divisor | φ = `p^{-1}` ↔ O(1); φ = p ↔ O(−1) = ideal of a degree-one divisor | consistent | none |
| 8.4 third Check | Div¹~ → Div¹ = Div¹~/φ^ℤ | preimage of Q_p^HT is `⊔_{n∈ℤ}` φ^n(Q_p^HT), whose ideal is `⊗_{n∈ℤ}` φ^n(I_Δ) | pullback of `I_{Div¹}` | reworded |
| 7.2 API | A perfectoid; A = ℚ_p(μ_{p^∞}) uncompleted; A = 0; n = 0 | map an isomorphism, 𝒳_T = `D^×_{FF,T♭}`; not perfectoid, so not an isomorphism and not nilperfectoid (no Witt description); 𝒳_T = ∅; copy 0 at radius 1 (Hodge–Tate radius, 8.5) | agree with the Checks of 7.2 and 8.5 | API added |
| 10.6 API | G trivial; X = G^cont with G = ℤ_p; Π finite | h = (X → \|X\|^Betti), O^la = h_*O (2.7); D(X/G^cont) = D(ℚ_p) against ℤ_p^sm/ℤ_p^la; open subgroup {1}, the extension statement trivial | agree with the Checks | API added |
| 10.11 API | Z = X^la/G^la (empty limit); H trivial; G trivial in the double decompletion | contractible mapping anima, β an equivalence; T = X, O(X)^{G-la} = O(X^la) as in 10.7; Y = W, formula of 10.7 | agree with the Checks | API added |
| 11.2 API | C_p(n) for n = 0 and n ≠ 0; K = ℚ_p | n ≠ 0: θ = n invertible, all H^i = 0; n = 0: H⁰ = H¹ = K, H² = 0; Γ = ℤ_p^× | Tate | API added |
| 11.5 API | X = D; dim X = 1 | Ω¹ = 0, so L = 0, θ = 0, X^HT = D; Higgs complex M → M ⊗ Ω¹{−1}; T{1} is dual to Ω¹{−1}, so Sym(T{1})-modules are Ω¹{−1}-Higgs fields | agree with the Checks | API added |
| Nuclear contract (F03) | A = 0; A = ℚ_p with `⊕_{n≥0}` ℚ_p[−n] and (∏_ℕ ℤ_p)[1/p] | D(0) = 0, all objects nuclear; a colimit of nuclear objects is nuclear (RefinedTraceMethods §4.3), matching the fourth Check of 2.3; compact but not dualizable, so not nuclear (AnalyticStacks §4.3 Checks) | hypotheses of RefinedTraceMethods §4.3 (compactly generated, compact unit) hold for D(A) | citation repaired |

## Gate failures

None were listed for this round.

## For the maintainer

- **No names changed.** No section or target id changed and no Lean name was added or removed, so no other roadmap's citation breaks.
- **New cited section.** The roadmap now also cites RefinedTraceMethods §4.3 (an open pull request, earlier in the merge order), which was already a supplier for §1.7 and §1.10.
- **Possible source slip, not acted on.** ALRS Theorem 6.2.2(4) (ALRS line 7986–7987) writes `BT^†_{X/D}{−1}`. Its own proof (ALRS line 8007–8008) and the cartesian square (6.2.2) give a `T^†_X{1}`-gerbe. 11.5 keeps `{1}`, which matches the proof; this round's findings did not ask for any change there.
