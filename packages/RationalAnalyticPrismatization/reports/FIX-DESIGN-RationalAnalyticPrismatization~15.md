# FIX-DESIGN-RationalAnalyticPrismatization~15

Findings of REV-DESIGN-RationalAnalyticPrismatization~14 (one review; ids unqualified). Files changed: `packages/RationalAnalyticPrismatization/design/README.md`, `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. The package has no `Suggested.lean`.

## F01 (P1) — applied

Old (11.1, README and `plan.json`): "for K/ℚ_p unramified X^{Div¹} ≅ GSpec(K) × Div¹". New: for unramified K with arithmetic Frobenius σ, X^Δ ≅ GSpec(K) × Q_p^Δ and X^{Div¹~} ≅ GSpec(K) × Div¹~ with Frobenius GSpec(σ) × φ, hence X^{Div¹} ≅ GSpec(K)/σ^ℤ ×_{GSpec(ℚ_p)/φ^ℤ} Div¹. Also: a proof route through 8.3, two Checks (dimensions; direction σ, not σ⁻¹), and *Needs* §8.3, §8.2, §3.2.

Verification. The witness is right. By 11.7, H⁰(X^{Div¹}, O) = H⁰(Gal_K, ℚ_p) = ℚ_p. A projection to GSpec(K) would give a ℚ_p-algebra map ℚ_{p²} → ℚ_p, which does not exist. Dimensions: the untwisted product gives 2·(1, 2, 0) = (2, 4, 0), while RΓ(Gal_{ℚ_{p²}}, ℚ_p) gives (1, 3, 0). ALRS line 7873 is transcribed correctly, so the error is in the source.

Derivation, written into the route:
- Marc(K) = Marc(ℚ_p) ×_{Marc(𝔽_p)} Marc(k), by Hensel and tilting for the separable reduction of the minimal polynomial.
- D^×_{FF,−} is left exact (6.2), sends Marc(𝔽_p) to GSpec(ℚ_p) (ABLB Remark 4.4.11, ABLB line 2653), and sends Marc(k) to GSpec(K) with Frobenius GSpec(σ).
- Then the cartesian square of 8.3 (ALRS Lemma 4.2.5) for the †-formally étale map GSpec(K) → GSpec(ℚ_p) gives the product with Frobenius GSpec(σ) × φ.

Direction: φ^*[a] = [a^p] gives φ^*∘ι = ι∘σ for ι: K → O(D^×_FF). So π∘φ = GSpec(σ)∘π, which is the reviewer's GSpec(σ). I confirmed this on a witness that separates σ from σ⁻¹. For f = 2 the two coincide, so I used K = ℚ_{p³}:
- Base-change to FF_{C_p♭} and write K ⊗ B = ∏_τ B. Since φ∘τ = τ∘σ, the twist σ⊗φ acts by φ on each factor, giving invariants ℚ_p³. These are the functions of FF_{Marc(K⊗C_p)} = ⊔_τ FF_{C_p♭}.
- σ⁻¹⊗φ sends factor τσ⁻² to factor τ, a 3-cycle, so its invariants are a field ≅ ℚ_{p³}.
- The untwisted 1⊗φ gives K, also a field.

Only σ matches. Both witnesses are now Checks of 11.1.

The reviewer's citation of ALRS footnote 48 is kept only for the *shape* of the fibre product over GSpec(ℚ_p)/φ^ℤ. That footnote concerns perfect k of positive transcendence degree, which Scope keeps outside the roadmap, so the README cites it as "has the shape of" and does not use it as a source of the statement.

Pattern search: "GSpec(K) ×", "× Div¹", "Div¹ ×", "X × Q_p^", "unramified" over the whole README turned up only 11.1. The product X^HT → X × Q_p^HT of 9.1 carries no Frobenius and is correct for every finite étale K (T_X = 0). The proof of ALRS Remark 6.1.5 uses X^HK ≅ X × Q_p^HK, which has the same defect, but the README does not state it. Layer 11's Dependencies line "Layers 6–10" omitted Layers 2–4, which 11.1 (§3.2), 11.2 and 11.5 (§4.8) and 11.6 (§2.6, §4.2) need. It now reads "Layers 2–4 and 6–10".

Manifest: ABLB locator gains Remark 4.4.11, and its cited_for now includes Layer 11. The ALRS version_note records the source error in Remark 6.1.5.

## F02 (P2) — applied differently

Verified: the old third Check of 5.4 followed ALRS Remark 3.1.6 (ALRS line 2263–2271) sentence by sentence. I wrote a new text rather than the reviewer's (same mathematics, different order and argument):
- It introduces the operator θ by its Leibniz rule.
- It states the fully faithful pullback D(A¹/G_m^†) → D(A¹/Ĝ_m) and its image (polynomials in θ extend to entire functions of θ), with the locator.
- It proves automatic convergence on vector bundles explicitly: finite projective over ℚ_p⟨T/r⟩, ‖T∂_T‖ ≤ 1 since |n|_p ≤ 1, and Σc_nθ^n converges when |c_n|ρ^n → 0.
- Only then does it derive the log-connection description.

The skyscraper part is kept as it was. Longest shared run with ALRS is now 4 words ("m is fully faithful"; it was 6). Same text in `plan.json` (`filtered_logConnection`).

## F03 (P3) — applied

Old (5.1, fifth Check): "the adic filtration is constant with associated graded O_X in degree 0". New: "the ideal is 0, so the adic filtration is O_X in degrees ≤ 0 and 0 in degrees ≥ 1, with associated graded O_X in degree 0 and Rees algebra O_X[t] (a constant filtration would have associated graded 0)". The README and `plan.json` (`cone_adicFiltration_zeroSection`) both changed. A search for "constant"/"filtration is" found no other occurrence of this kind. "Trivial filtration" in 12.6 is the standard Fil⁰ = O, Fil¹ = 0 and is correct.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 11.1 twisted product | K = ℚ_p (f = 1) | σ = id; formula gives Div¹ | holds | — |
| 11.1 twisted product | K = ℚ_{p²}: H⁰ | (K ⊗ H⁰(Div¹~,O))^{σ⊗φ} = (K ⊗ ℚ_p)^{σ⊗1} = ℚ_p; H⁰(Div¹~,O) = B^{Gal} ⊂ (B⁺_dR)^{Gal} = ℚ_p | holds, agrees with 11.7 | Check added |
| 11.1 twisted product | K = ℚ_{p²}: H¹ | pushforward to Div¹ is E_V, V = Ind_{G_K}^{G_{ℚ_p}} ℚ_p (split rank 2 over FF_{C_p♭}); Shapiro gives 1, 3, 0 | holds | — |
| untwisted product (old) | K = ℚ_{p²} | 2, 4, 0 against 1, 3, 0; Hom_{ℚ_p}(ℚ_{p²}, ℚ_p) = ∅ | false | replaced |
| direction σ vs σ⁻¹ vs 1 | K = ℚ_{p³}, fibre over FF_{C_p♭} | σ: ℚ_p³ (split); σ⁻¹: field ℚ_{p³}; 1: field K; true value ℚ_p³ from Marc(K⊗C_p) = ⊔₃ Marc(C_p) | only σ | Check added |
| route: Marc(K) = Marc(ℚ_p) × Marc(k) | R perfectoid, K = ℚ_p(ζ_{p^f−1}) | roots of g in R° ↔ roots of ḡ in R°/p = R♭°/p♭ ↔ roots in R♭°; ḡ separable | holds | — |
| route: D^×_{FF,Marc(𝔽_p)} | terminal object | left exact so terminal goes to terminal GSpec(ℚ_p); ABLB Remark 4.4.11(1) | holds | — |
| route: 8.3 square | X′ = GSpec(K) → GSpec(ℚ_p) | Q_p^Δ ×_{D^{×,dR}} (D^{×,dR} × GSpec K) = Q_p^Δ × GSpec K | holds | — |
| route: perfection | lim along GSpec(σ) × φ | (x_n, d_n) ↦ (x_0, (d_n)); termwise φ goes to GSpec(σ) × φ | holds | — |
| 5.4 Check (reworded) | E = O, θ = T∂_T; skyscraper ℚ_p[θ] at 0 | ‖T∂_T‖ ≤ 1 on ℚ_p⟨T/r⟩ (\|n\|_p ≤ 1); θ(T·e) = 0 = T·e + T·θ(e) on the skyscraper; Σ p^{n²}θ^n·1 has unbounded degree | holds | wording |
| 5.4 Check: entire series | ‖θ‖ ≤ C | \|c_n\|C^n → 0 since \|c_n\|ρ^n → 0 for all ρ | holds | — |
| 5.1 Check: identity | A → A, I = 0 | Fil^n = A (n ≤ 0), 0 (n ≥ 1); gr = A in degree 0; Rees ⊕Fil^n t^{−n} = A[t]; Spec gives X × A¹/G_m, restricted to X × Â¹/G_m^alg; constant filtration: gr = 0, Rees A[t, t⁻¹] | holds | wording |
| 5.1 Check: zero section | ℚ_p⟨x⟩ → ℚ_p | Fil^n = (x^n), gr = ℚ_p[x̄] | holds | — |

Lean: the package has no `Suggested.lean`, so the `#check` pass does not apply and no Lean name changed. Every one of the 644 statement, API, Check and gap strings of `plan.json` occurs verbatim in the README (0 missing).

Ownership: `roadmaps grep --readme-only -i 'twistor stack'` and `--fixed 'A¹/G_m^†'` find no other roadmap, on main or in the open pull requests. 11.1 stays owned here. Ownership against the open pull requests was checked only through `roadmaps grep`.

## Checks run

Dependency check (gate), exact output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2266 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `roadmaps resolve` gives one lead, "MotivesAndAlgebraicCyclesPartII Layer 0". This is unchanged from earlier rounds: it is a board package placed earlier in the merge order. No Lean name was found nowhere. Policy scan of the added README lines (LaTeX delimiters, process words, paths): nothing found. `sources.toml` parses. Nothing was added to `needs-references.toml`: every text used is already in the manifest.

## For the maintainer

- 11.1 now corrects ALRS Remark 6.1.5. The twisted form is derived here from ALRS Lemma 4.2.5 and ABLB Remark 4.4.11; no refereed source states it.
- No backticked name, section id or heading changed, so no other roadmap's citation is affected.
