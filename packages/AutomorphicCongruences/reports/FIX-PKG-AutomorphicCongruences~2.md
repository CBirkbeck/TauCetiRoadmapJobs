# FIX-PKG-AutomorphicCongruences~2

Repair of the review REV-PKG-AutomorphicCongruences (board pull request 129, head 52297e2) and of the package-gate failures. Files changed: `packages/AutomorphicCongruences/README.md`, `Suggested.lean`, new `sources.toml`, new `design/plan.json` (a `gaps` list only; the package had no plan.json). Section numbers below are the new ones; the old-to-new map is under "Renumbering".

## F01 (P1) — applied

AutomorphicPadicLFunctions is no longer cited anywhere. Its items are re-homed: unitary PEL data, compactifications and classical expansions → PELModuli §§M5.5–M5.6, ShimuraCompactifications §§C5.3, C5.15–C5.16, AutomorphicBundles §§B5.1a, B5.7, B5.14–B5.15; ordinary Igusa tower → gap:unitary-ordinary-igusa; Hsieh/Vatsal/Hung μ and nonvanishing → gap:anticyclotomic-rankin-selberg; Katz/Hida μ, Finis, Hsieh 2012 → gap:katz-cm-padic-l; source-specific Siegel/Klingen measures → owned in §§1.4, 1.6, 2.3, 2.10, 5.4.

## F02 (P1) — applied

Every unplanned supplier refinement is now a declared gap with the same slug in design/plan.json: divisorial-char-ideal (PadicMeasuresIwasawaAlgebras §4.6), katz-cm-padic-l, anticyclotomic-rankin-selberg, hilbert-hida-odd-degree (PadicFamilies), fujiwara-minimal, minimal-lift-base-change, unitary-galois-imaginary-quadratic, gl2-essential-vectors, msd-neron-periods, rubin-imaginary-quadratic. The "IntegralIwasawaTheory I.5" request needs no gap: IntegralIwasawaTheory §12.1 states `wilesMainConjecture`.

## F03 (P2) — applied

§7.7 now cites KatoEulerSystems §4.3 for the Rubin step (free rank-one quotient plus residual irreducibility, not SL₂(ℤ_p)) and is restricted to the reciprocity translation: (r_(E^χ)·L_(E^χ,N_χ)) ⊆ char integrally, and the MSD inclusion only when p ∤ r_(E^χ)∏ℓ_q(q⁻¹). The contract text was corrected; §7.10 and §8.1 carry the unit condition.

## F04 (P2) — applied

`factorSeparation` deleted; §7.8 keeps the statement in prose. The module docstring is now "AutomorphicCongruences: target signatures", says README.md is the roadmap, and lists each headline (§§1.10–1.11, 2.7–2.8, 3.6, 3.12–3.14, 5.3, 5.5, 6.10, 7.6, 8.9–8.10) with the carrier missing at the pins. The file states no declaration.

## F05 (P2) — applied differently

The premise is wrong at the supplier's current head: PadicLocalLanglandsForGL2Qp §5.8 and §5.9 assume p ≥ 3 (its README at the head of its open pull request, §5.8 hypotheses and proof of (ii), and §5.9 hypotheses, citing Paškūnas 2016 for p = 3). So the target `paskunas2016_projectiveEnvelope` is deleted and §§3.5, 3.7 cite §§5.8–5.9 directly; only the freeness at p = 3 (§5.11, whose application assumes p ≥ 5; Nakamura Thm 4.7) is gap:paskunas-p3-freeness.

## F06 (P2) — applied

§0.1 now assumes T unramified outside a finite set S_T (statement, standing hypotheses, the finite-generation API bullet and the proof sketch, which cites SU Lemma 3.1.9 for G_(F,S) with S finite, SU line 778); §§0.2–0.3 inherit it, and the Conventions say so. The reviewer's character with values 1+εX^k is added as a negative Check.

## F07 (P3) — applied

Both definitions and all four examples are deleted from Suggested.lean. §0.4 and §5.6 keep the statements and Checks; the sentences in §0.4, the Layer 0 Examples and How to read the build that pointed to Suggested.lean are removed.

## F08 (P3) — applied

All 133 "Provide `X`:" paragraphs became prose `**API.**` bullet lists without names; the 19 "intended arithmetic theorem name" lines are deleted; every other own name (`cmCongruence_dvd_katz`, `ichinoTripleProduct`, `yagerModule`, `katoIntegralBound_im`, GenMC.*, NakamuraZeta.*, ...) is replaced by prose. Backticks remain only on Mathlib, Tau Ceti and supplier declarations.

## F09 (P3) — applied

All 136 campaign slugs and labels (R20.6, R21.4, R30.5, R31.4, IHG.n, I.5, L0a, ...) are replaced by sections verified in the supplier copies (each heading line was read). Corrections the reviewer named: PadicLocalLanglandsForGL2Qp §§5.5, 5.7–5.9; CompletedCohomology… §§4.1, 4.4–4.7, 6.2; LocalGaloisDeformationRings §§F.2.5, F.2.9; PadicHodgeRegulators §§1.2, 8.8, 8.18–8.22, 9.22; IntegralIwasawaTheory §5.0 with DirichletPadicLFunctions §2.8. Explorer and "tree/main" links removed; pins updated to Mathlib 6b7abb3c… and Tau Ceti a91d3aaf….

## F10 (P3) — applied

Removed: the PR-number "Prerequisite order" paragraph and "not yet upstream"; "not reachable … sources follow-up" (Ichino, Ikeda, Harris now cited by locator under their settled keys); "current upstream", "Current IHG.6", "requested from AC L0", "current NumberFieldArithmetic"; "stage"; "verify against the PDF symbols"; "text extraction drops ≥"; "(E7)"; access dates in References.

## F11 (P3) — applied

Non-Checks replaced by computed tests: §0.6 (unramified class in the inertial but not the D-kernel; Steinberg 10/11), §0.9, §1.11 (curve 11a1, p = 7, K = ℚ(√−3)), §2.11, §2.22, §5.7, §5.10. Duplicate §1.1 Check dropped. §6.4's false Check and the redundant "new ramified prime" clause are removed from §§6.4, 5.13, 7.9 and the Layer 6 Examples, with the proof that Δ+ is automatic. The false HE.8b claim is gone.

## F12 (P3) — applied

§0.7 defines ψ, ℒ(χ′), 𝒥(χ′), N, N′ (SU §§4.3–4.4, Lemma 4.3.10, (4.4.1.c)); §2.7 uses J = E_(π,ξ)A_P ⊂ A and I ⊂ R; §6.3 writes L_p(g_F/M); §5.6 defines 𝔈_D only as a kernel; §3.1's endomorphism claim is corrected (it also fails for split χ̄₁⊕χ̄₂, End = 𝔽×𝔽), with both counterexamples as Checks; §3.3 cites FW Lemma 2.8, pp. 20–21; §2.22 adds Wan20 Thm 1.1's family and newform hypotheses.

## F13 (P3) — applied

§2.4 now states Ichino's formula itself, citing Ichino2008 Theorem 1.1 by locator (Ichino states it over every number field, so the stated generality, F = ℚ with D definite, is within the source), and keeps Wan-2020 §8.4, p. 80, only for the translated-pairing variant, noting that Wan's restatement assumes weight-two archimedean components and that weight k uses FW's constant 1/(k−1).

## F14 (P3) — applied

sources.toml (schema tauceti-roadmap-sources/v1) has 39 entries, starting from the six settled keys of board main and adding every cited work, fetched through the sources service; Hung2017 is uncertified (paywalled), the five waived keys are kept. The References list every key with its version notes. `sources check`: 0 problems.

## F15 (P3) — applied

Every target ends with a `*Needs:*` line (92), listing the internal sections, supplier sections and gaps, Mathlib and Tau Ceti names its statement and route use; API lists are prose bullets; each layer's Dependencies paragraph is regenerated from those lines. The residual target `cmCongruence_dvd_katz_residual` is deleted; the p = 3 restriction is stated only in §2.8, and §0.9's Check points there.

## Checks run

- Elaboration: `lake env lean packages/AutomorphicCongruences/Suggested.lean` from the content checkout: exit 0, no messages (the file states no declaration).
- `#check`: a scratch file with `#check @name` for every Mathlib and Tau Ceti name the README cites elaborated with no error at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf). Three Tau Ceti modules have no object files on this host (`MultiquadraticSplitting`, `Multiquadratic.Galois.Basic`, `FittingIdeal.Basic`); their names were checked in the pinned sources instead: `NumberField.ncard_primesOver_multiquadratic_iff` (line 199), `TauCeti.Multiquadratic.isGalois` (line 190), `TauCeti.fittingIdeal` (line 343). No signature comparison of Suggested.lean declarations was needed: there are none.
- Dependency check, `gate --depcheck … --movable`:

```
depcheck: 44 roadmaps, 471 edges, 0 problem(s)
```

  A first run reported `UPWARD: AutomorphicCongruences (#248) -> RankOneConverse (#251)` from a consumer sentence in the Scope section; the sentence now uses "consumed by", and the Downstream consumers section lists the consumers as bullets.
- Package text gate (the scanner of `gates.scan_folder`, run on the folder): all counts 0 (latex, tex, prnum, residue, readme-ids-missing, target-ids, layer-ids and the rest).
- `roadmaps resolve`: no Lean name found nowhere; the only two leads are PadicHodgeRegulators and KatoEulerSystems, which are board packages (board main, and board pull request 163 at 725fd74) earlier than this roadmap in the merge order, read there.

## Gate failures

- missing sources.toml: created (39 entries, 0 problems), see F14.
- latex=1: the escaped `\[126\]` in the Wan-2020 reference became "reference 126".
- tex=1027: every `_{…}` and `^{…}` outside code was rewritten mechanically: Unicode super/subscripts for short numeric or one-letter exponents (`^{-1}` → ⁻¹, `^{k−1}` → ᵏ⁻¹), `^word` for word exponents, `_(…)`/`^(…)` otherwise, nested braces inside out; spot checks showed no change of meaning. Count now 0.
- prnum=21: the "Prerequisite order" paragraph with PR numbers is replaced by the Scope table and consumer sentence.
- residue=1: "still have to be checked" in the Layer 3 Examples became a timeless sentence naming §3.1 and gap:paskunas-p3-freeness.
- readme-ids-missing=1 (`EisensteinIdeal.proper_iff`): the API paragraph became a prose bullet without the name (F08).
- target-ids=92: layers and targets renumbered with digits only (map below); internal links re-pointed at the new slugs; layer headings read `## Layer k: title`.

## Renumbering

L0.n → 0.n; L1.n → 1.n; L2s.n → 2.n (n = 1–8); L2.n → 2.(n+8) (2.9–2.22); L3.n → 3.n; L4.n → 4.n; L5w.n → 5.n; L5a.n → 6.n; L5b.n → 7.n; L5.1 → 8.1. L2s and L2 became one Layer 2 so that Layers 0–4 keep the numbers ModularIwasawaMainConjectures already cites ("Layer 1/2/3/4 endpoint"); its "Layer 5b" is now Layer 7.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 finite ramification | A = 𝔽_p⟦X⟧[ε]/(ε²), χ(tame gen. at ℓ_k ≡ 1 mod p) = 1+εX^k; T = 0 | (1+εX^k)^p = 1 (char p, ε² = 0), values → 1 X-adically, ramified at every ℓ_k; T = 0: X = 0, Ch = (1) | hypothesis needed | added, Check added |
| §0.1 API: Ch vs Fitt₀ | A = k⟦x,y⟧, M = A/(x,y) | Fitt₀ = (x,y), every height-one localization of M is 0, so Ch = A = divisorial hull of (x,y) | holds | none |
| gap divisorial-char-ideal | A = k⟦x,y,z⟧/(xy−z²), M = A/(x,z) | 𝔭 = (x,z) height one, not principal; Ch(M) = 𝔭 | Ch need not be principal | gap declared |
| §0.3 direction Check | A = ℤ_p⟦T⟧, 𝔞 = (T), X = A/(T−p); X = A/(p); X = A/(T)⊕A/(T−p) | (T−p) ↦ (p) = Ch(ℤ_p/p); (p) ↦ (p) = Ch(𝔽_p); reduced generator 0, X/TX ≅ ℤ_p ⊕ ℤ_p/p not torsion | holds | Checks added |
| §0.6 Checks | Frob ↦ 1/p in H¹(G_ℚp/I_p, ℚ_p/ℤ_p); ℓ = 11, p = 5, α = 1 | nonzero, in inertial kernel, not in D-kernel; 1 − 1/11 = 10/11, v₅ = 1 | holds | Checks added |
| §0.7 notation | ψ|_G = χ⁻ᶜχ⁻¹, χ′ = νχ⁻ᶜ | ψν|_G = νχ⁻ᶜχ⁻¹ = χ′/χ (SU line 2166); ℒ(ρ)/𝒥(ρ) ≅ (N/N′) ⊗ (V⊗R) (SU line 2132) | consistent | defined |
| §0.8 Checks | Ω ↦ uΩ, u ∈ R^×; Ω ↦ ϖΩ; Δ ∈ S₁₂(1) | (η) unchanged; ord_ϖ changes by 1; dim S₁₂ = 1, cuspidal Hecke algebra ℤ_p, congruence ideal (1) at 691 | holds | Checks added |
| §0.9 h_K Check | K = ℚ(√−23), p = 3 | h_K = 3; −23 ≡ 1 mod 3 so 3 splits; v₃(h_K) = 1 | holds | Check added |
| §1.11 Checks | 11a1, p = 7, K = ℚ(√−3); p = 5 | Δ = −11⁵, 7 ∤ 5; a₇ = −2; −3 ≡ 2² mod 7 (split), −3 ≡ 8 mod 11 not in {1,3,4,5,9} (inert), N⁻ = 11; rational 5-torsion so ρ̄₅ reducible | holds | Checks added |
| §2.4 Ichino generality | F = ℚ, D definite vs Ichino over number fields; weight 2 vs k | stated case ⊆ Ichino Thm 1.1; archimedean constant 1/(k−1): k = 2 → 1, k = 4 → 1/3 | holds | statement moved into §2.4 |
| §2.7 ideals | I ⊂ R, J = A ∩ I (§0.5) | E_(π,ξ)A_P ⊆ A is J; I is its Hecke-side ideal, A/J ≅ R/I | consistent | renamed |
| §2.22 hypotheses | Wan-2020 line 76–78 | family new outside p, weight-two member the stabilization of a level-N newform | added | Checks added |
| §3.1 endomorphisms | X²+2 over 𝔽₅; χ̄₁⊕χ̄₂ split distinct; non-split | −2 ≡ 3 ∉ {0,1,4}: irreducible, End = 𝔽₂₅; over 𝔽₂₅ split, End = 𝔽₂₅×𝔽₂₅; split distinct End = 𝔽×𝔽; non-split End = 𝔽 | A2.1 ⇏ N3 | corrected, Checks added |
| §3.5 Checks | unramified principal series of GL₂(ℚ_ℓ) | dim π^(K₁(ℓ^m)) = m+1: m = 0 → 1, m = 1 → 2 | holds | Checks added |
| §3.5/§3.7 p = 3 | PLL §5.8–5.9 (p ≥ 3), §5.11 (p ≥ 5 in application), CCLGC §4.7(1)–(2) (p ≥ 3) | FW remark p. 24: only Nakamura Thm B.24 and Thm 4.7 used p ≥ 5 | only freeness missing | gap |
| §3.8 Checks | Steinberg at ℓ; Σ₀ = ∅ | ρ_f^(I_ℓ) a line, P = 1 − a_ℓu of degree 1; empty product | holds | Checks added |
| §4.10 Checks | M = Λ/(ϖ); Λ/(T), Λ/(T−p) | λ = 0, M/ϖ = 𝔽⟦T⟧ infinite-dimensional; both λ = 1, ideals (T) ≠ (T−p) | holds | Checks added |
| §5.7 orientation | ord_P(L) = 2; ord_P(L) = 0 | ≥ 2; strict "> 0" false when 𝔈_D is a unit at P | holds | Check replaced |
| §5.10 boundary | p = 5, κ₀ = 2 | BCS Thm 3.2.1 applies Wan with p > 3 to weight two (BCS line 336) | included | Check replaced |
| §5.13 q_v test | p = 5, ℓ = 19, 11 | 19 ≡ −1 inert: 361 ≡ 1; 11 ≡ 1 split: 11 ≡ 1; 19 split would give −1 | holds | Check added |
| §6.4 Δ+ automatic | K = ℚ(√−7), F = ℚ(√29) | 7 | D_K, 7 ∤ D_F, FK/F ramified above 7; −7 ≡ 22 ≡ 14² mod 29 (29 splits), −7 ≡ 1 mod 8 (2 splits) | clause redundant | removed, Checks |
| §6.5 Checks | L = T in O⟦S,T⟧; f² | μ(T) = 0, T(S,0) = 0; μ(f²) = 2μ(f) | holds | Checks added |
| §7.7 integral bound | p | r_E; split multiplicative q = 11, p = 5 | bound loses p; ℓ_q(q⁻¹) = 1 − 1/11 = 10/11, v₅ = 1, Euler factor not a unit | unit condition needed | restated |
| §7.10 | σ = [[1,p],[0,1]] | σ − 1 = [[0,p],[0,0]], coker ℤ_p ⊕ ℤ/p | fails (im) | Check made explicit |

## Notes for the maintainer

- Renumbering changes names other roadmaps cite: HeegnerPointEulerSystems (PR head) cites "AutomorphicCongruences L5a.1–L5a.3, L5w.1, L5w.3, L5w.10" (now §§6.1–6.3, 5.1, 5.3, 5.10); RankOneConverse (board design) cites "AutomorphicCongruences:L2" (now §2.22); ModularIwasawaMainConjectures' "Layer 5b endpoint" is now Layer 7.
- The integral BCS endpoint §7.10 now carries p ∤ r_(E^χ)∏ℓ_q(q⁻¹) for the four twists (F03); ModularIwasawaMainConjectures' gap:automorphic-endpoints asks for it under (im) alone. Removing the condition needs the integral Kato bound in Kato's own normalization (KatoEulerSystems states §7.4 with r_E and N-imprimitive factors).
- Twelve supplier gaps are declared (design/plan.json). PadicFamilies receives three (Katz CM, anticyclotomic Rankin–Selberg, odd-degree Hilbert Hida theory), as the review suggested; no allowed roadmap plans Hsieh's, Vatsal's, Finis's, Hung's or Hida's μ/nonvanishing theorems (`roadmaps grep` for Hsieh, Vatsal, Finis, Hung, Katz, Klingen, Eischen found none). HeegnerPointEulerSystems' gap:primitive-toric-mu on this roadmap is answered by §6.5 with gap:anticyclotomic-rankin-selberg.
- Ownership against open roadmap pull requests and board packages was checked by object with `roadmaps grep` and the supplier copies; the targets kept here (Ichino, Harris CAP, Ikeda, Yager, FW comparisons, Nakamura's universal zeta morphism, the polarized 1+n+1 theorem, source-specific Siegel/Klingen measures) have no other owner.
- design/plan.json did not exist; it was created with the `gaps` list only.
- The worker's earlier `needs-references.toml` entries were all fetched afterwards (Wan-2015, Hid91, Hid06, Paskunas2016, Pottharst2013, Hsieh2014, Finis2006, Hida2010 with explicit open-access licence classes), so no references request is left. HT94 is an image-only scan and GV00's text layer is unusable on this host; both are recorded.
- No text read during the job (review, supplier READMEs, sources) contained instructions to act on.
- Worker repair (undeclared gaps automorphic-endpoints and primitive-toric-mu): these two slugs belong to consumers. ModularIwasawaMainConjectures and HeegnerPointEulerSystems declare them on this roadmap: HeegnerPointEulerSystems README line 251 reads "What AutomorphicCongruences must provide (gap:primitive-toric-mu)". So their supplier is AutomorphicCongruences itself. Putting them in this package's `gaps` list would make this roadmap its own supplier, or would name a consumer as a supplier and create a cycle. So design/plan.json is unchanged. The README's 14 references to them now read "supplier gap automorphic-endpoints" and "supplier gap primitive-toric-mu", without the `gap:` token. That token is kept for this package's own twelve declared supplier gaps. Every `gap:` slug the README names is now declared in design/plan.json, and every declared slug is named in the README.
