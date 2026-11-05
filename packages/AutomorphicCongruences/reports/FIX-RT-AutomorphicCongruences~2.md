# FIX-RT-AutomorphicCongruences~2: red-team round 2 repaired

Two reviews (RT-AutomorphicCongruences~2a, five findings; RT-AutomorphicCongruences~2b, six findings). No two findings overlap, so each is settled in its own section. Files edited: packages/AutomorphicCongruences/README.md, packages/AutomorphicCongruences/sources.toml (two `version_note` fields) and the `section` fields of two entries in the `gaps` list of packages/AutomorphicCongruences/design/plan.json. packages/AutomorphicCongruences/Suggested.lean still declares nothing; only its header changed, to the module-system form (`module`, `public import Mathlib`, `@[expose] public section`), which the worker's build check requires at the pinned toolchain.

## RT-AutomorphicCongruences~2a/F01 (P1) — applied

Verified: SU lines 8656–8659 pass from (12.3.5.b) to μ = 0 of the Σ-imprimitive anticyclotomic function; the nonsplit Euler factors are constants (their Frobenius is fixed by c, so trivial in Γ^-_K for odd p), and the 113 witness recomputes: a_113(11a1) = 9, 113 inert in ℚ(√−3) and ≡ 1 mod 7, factor ((113+1)² − 9²)/113² = 12915/12769 with 12915 = 3²·5·7·41, 7-adic valuation 1. Wan-2015 lines 3577–3594 (Lemma 87) already make the corresponding correction for Hilbert families.

§1.5(iii): "L^Σ lies in no pulled-back prime" → the removed Euler factors E_(𝐟,K,ξ,ℓ) are defined; (a) μ(L^(Σ,−)) equals the sum of the valuations of the nonsplit constants; (b) ord at a pulled-back prime Q·𝕀[[Γ_K]] is at most ord_Q(E^ns_Σ), proved through the primitive function (gap:katz-cm-padic-l, which already lists Hida's Rankin–Selberg function with its congruence denominator). §1.7(ii) now excepts pulled-back primes containing E^ns_Σ with the same bound. §1.10's proof treats those primes by §0.2(iii) (Ch^Σ = Ch^(Σ∖Σ^ns)·∏E) instead of the coefficient argument; the non-torsion case uses the zero convention. Witness Checks added to §§1.5, 1.7, 1.10; API bullet and Needs updated.

## RT-AutomorphicCongruences~2a/F02 (P2) — applied

Verified: old §5.3 defined β(L^Σ) from the function constructed in old §5.4, whose Needs were §§1.1, 1.2, 5.2. At the current heads, no roadmap cites AutomorphicCongruences §5.3 or §5.4 by number (`roadmaps grep 'AutomorphicCongruences'`: HeegnerPointEulerSystems cites gap slugs only; ModularIwasawaMainConjectures cites §§1.11, 2.21, 3.4, 3.7–3.9, 4.3, 4.5, 7.9–7.10), so renumbering breaks no consumer.

Old §5.4 (Klingen family) → §5.3; old §5.3 (quaternionic period, (NV1)/(NV2)) → §5.4. Every internal reference and anchor updated (§§1.1, 1.4, 5.4, 5.5, 5.7, 5.9, 5.10, 6.3, Scope, Downstream consumers); "whose construction does not use this subsection" dropped. Build order in Layer 5 is now monotone.

## RT-AutomorphicCongruences~2a/F03 (P1) — applied

Verified: BCS v2 line 389 states Theorem 4.1.3 for p ∤ 2N, (spl), (D_K, N) = 1, (irr_K); the CW form needs p > 3 and the FW form K ramified at a level prime. For 11a1, p = 3, K = ℚ(√−2): a_3 = −1, D_K = −8, 3 splits (−2 ≡ 1 mod 3), 5 is inert (−2 ≡ 3, a nonsquare mod 5), a_5 = 1, and Frob_5² has characteristic polynomial X² + 9X + 25 ≡ X² + 1 mod 3, irreducible, so (irr_K) holds. CGS23 lines 828–856: §3 assumes p ∤ 2N, ordinary and (spl), and Theorem 3.1.1 is proved from BST §5, KLZ17 and BDP22.

§2.15: a third form added, the fixed-form (BCS) form: BF_α ∈ H¹_(F_ord,rel)(K, T_g(α) ⊗̂ Λ_K) for an elliptic newform, p odd, (spl), on CGS23's lattice; CGS23 Theorem 3.1.1 states it for every p ∤ 2N, but its proof rests on KLZ17 whose standing assumption is p ≥ 5, so at p = 3 the class is a target here (the README says exactly this). §2.16: the two fixed-form Coleman maps with pseudo-null cokernel and their rescaling (CGS23 Lemma 3.1.2, Corollary 3.1.3). §6.1 now cites that form; Checks added in §§2.15 and 6.1.

## RT-AutomorphicCongruences~2a/F04 (P3) — applied

§4.8: the two Checks restating NAK Theorem 5.7 → the k[[X]] derived-base-change control (H¹(C) ⊗ k = 0 → H¹(C ⊗^L k) = k, cokernel H²(C)[X] = k) and the projector control (e_± = diag(1,0), diag(0,1) over 𝔽_5; e_η = 4[1] + 2[2] + 3[3] + [4] with [2]·e_η = 2·e_η; p = 2 excluded). §2.2: third Check on ℚ_5/ℤ_5 against its dual ℤ_5 (multiplication by 5: kernel 𝔽_5 versus cokernel 𝔽_5).

## RT-AutomorphicCongruences~2a/F05 (P3) — applied

Verified against lake-manifest.json: TauCeti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a, mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2. The two README hashes were replaced. The named declarations were re-resolved by the round-2 reviews at these commits; none changed.

## RT-AutomorphicCongruences~2b/F01 (P2) — applied

Verified at the head of ShimuraCompactifications: Layer 7 "integral PEL compactifications" has §7.3, §7.15 and §7.16 with the cited titles; no "C5" headings exist. "§§C5.3, C5.15, C5.16" → "§§7.3, 7.15, 7.16" in the Scope table and the supplier contract; "§§C5.3 and C5.16" → "§§7.3 and 7.16" in §§1.1, 2.2 and the Layer 1 Dependencies.

## RT-AutomorphicCongruences~2b/F02 (P2) — applied

Verified at the head of AutomorphicBundles: §12.2 "The torsor-level description of the scalar expansion", §12.8 "Joint injectivity at a component-detecting collection of cusps", §12.15 "Fourier–Jacobi expansion with vector coefficients", §12.16 "Expansion principle for locally free automorphic coefficients". "§§B5.1a, B5.7, B5.14, B5.15" → "§§12.2, 12.8, 12.15, 12.16" everywhere (contracts, §§1.1, 2.2, both Dependencies lines), with the supplier-contract parenthesis reworded as the review proposed.

## RT-AutomorphicCongruences~2b/F03 (P2) — applied

Verified at the head of OrdinaryAutomorphicFormsAndModularityLifting: §3.39 "Ordinary deformation and tangent refinements", §5.3 "Skinner–Wiles Theorem B (conditional on Hypothesis H)", §5.8 "Full-scope irreducible lifting conditional on component support"; no §§3.28–3.29, 4.13–4.16 or 5.6. The contract line → §3.39 and §§5.3, 5.8 (conditional, with ClassicalSerreModularity §I.1 named as the unconditional route over ℚ); §5.1's "nice-prime R = T" sentence → the same inputs; gap:fujiwara-minimal's section in plan.json → "Layer 5 (conditional lifting and arithmetic inputs), with §3.39".

## RT-AutomorphicCongruences~2b/F04 (P3) — applied

Verified at the head of IgusaVarietiesAndTorsionConcentration: Layers 0, 1, 2 carry the cited contents and no "IG." prefix. "Layer IG.0" → "Layer 0", "Layers IG.1–IG.2" → "Layers 1–2" in the README contract; gap:unitary-ordinary-igusa's section in plan.json → "Layers 1–2".

## RT-AutomorphicCongruences~2b/F05 (P3) — applied differently

Both texts are in the sources cache, fetched through the sources service from legal addresses: the published BCS from the author page (15 pages, sha256 240e85dd…) and the Annals LLZ14 (publisher open access, sha256 fd6f7ae6…). Instead of refetching or switching locators, every "BCS-published, p. N" was checked against the published text (Theorem 1.1.2 p. 2, Hypothesis 3.1.1 p. 7, Remark 3.1.2 and Theorem 3.2.1 p. 8, Theorem 4.1.3 and Corollary 4.1.4 p. 9, Proposition 4.2.2 and Lemma 5.1.1 p. 10, Proposition 5.2.1 p. 11, Lemma 5.2.3, proof of Theorem 1.1.2 and (5.3)–(5.4) p. 12, §2 beginning on p. 6): all correct except "§2, pp. 5–7" → "§2, pp. 6–7" in §5.12. LLZ14 Lemma 6.8.9 is on printed p. 736 (PDF p. 84), as cited. Both copies are now recorded on their existing keys in sources.toml (`version_note`: address, licence class, sha256, page concordance), following the CGS23 precedent; no key was added and no local path written.

## RT-AutomorphicCongruences~2b/F06 (P3) — applied

§5.8: three reminders → degree count at v | p (ranks 1 + 1 = 2, rank 3 fails clause (7)), scalar-term orientation (valuations 0, 1, 2 give ≥ 2, ≥ 1 through §0.7(iv), nothing) and the ℤ localization (6) ↦ (2) contraction; the reminders moved to the Assume paragraph. §5.11: three reminders → the O[[X,Y]] specialization (pY) ⊊ (p), the ⊗𝔽_p zero map, and the finite flat singular ring of §3.2. The seven single reminder bullets (§§2.12, 5.3, 5.12, 5.13, 6.1, 7.2, 7.8) were moved to their Assume paragraphs or deleted where the statement already says it; §5.12 gained a parity Check and §7.8 a defect-cancellation Check.

## Checks run

- Elaboration: `lake env lean <Suggested.lean>` from the content checkout: exit 0, no output (2 s). The file declares nothing, so there is no `#check @name` ledger to compare with the README; stated here as required.
- Dependency direction: `depcheck: 237 roadmaps, 2121 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line.
- Citation resolver on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." (The pre-round lead "ShimuraCompactifications §§C5.3" is gone.)
- Internal anchors: every `(#…)` link resolves to a heading (the renumbered §§5.3–5.4 anchors included; the three links whose headings contain combining characters are unchanged from before this round).
- Gaps: 17 entries in plan.json, 17 "What … must provide (gap:…)" lines in the README, every `needs` identical; only the two `section` fields named above changed.
- Gate failures listed in the brief: none.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.5(iii) nonsplit factor is a constant of 𝕀[[Γ^+_K]] | ℓ inert or ramified, p odd | c(Frob_w) = Frob_w̄ = Frob_w in Γ_K; in Γ^-_K this forces x² = 1, so x = 1 | constant, as stated |
| §1.5(iii) split factor has a unit coefficient | ℓ split, factor 1 − c·g^+·(1+Y)^u, p^k ∥ u | coefficient of Y^(p^k) is −c·g^+·binom(u,p^k), a unit by Kummer (no carry adding p^k and u − p^k); product of two such has μ = 0 + 0 | lies in no pulled-back prime |
| §1.5(iii)(a) μ formula | 11a1, p = 7, K = ℚ(√−3), ℓ = 113 | a_113 = 9; ((114)² − 81)/113² = 12915/12769; 12915 = 3²·5·7·41, v_7 = 1; residue 4 − a² ≡ 0 mod 7 at every weight; 13: −3 ≡ 6² mod 13 split | μ = 1; SU Prop. 12.3.6 refuted for Σ ∋ 113 |
| §1.5(iii)(b) bound at pulled-back Q | Q minimal over (E_113) in B = 𝕀[[Γ^+_K]] | E_113 ∈ 𝔪_B since its image 12915/12769 ∈ 𝔪_A; L^(Σ∪{113}) = E_113·L^Σ ∈ QB[[Γ^-_K]]; ord_(QB[[Y]]) of an element of B equals ord_Q | bound consistent; equality by the primitive-function route |
| Toy model showing why (b) needs the primitive function | B = ℤ_p[[X]], E^ns = (p+X)(p²+X), L = (p+X)³, X ↦ 0 | anticyclotomic value of L/E^ns is p³/p³ = 1 (μ = 0) yet ord_(p+X)(L) = 3 > 1 = ord_(p+X)(E^ns) | the μ identity alone does not give (b); the route uses the integral primitive 𝓛 |
| §1.7(ii) corrected | the same Q | (i) allows C_D ⊆ QΛ_D; L^Σ ∈ QΛ_D; bound ord ≤ ord_Q(E_113) | old form "no prime contains both" refuted; new form holds |
| §1.10 pulled-back step | torsion X^Σ; Σ, Σ∖Σ^ns | §0.2(iii) twice: Ch^Σ = Ch^(Σ∖Σ^ns)·∏E; ord_(P_0)(Ch^Σ) ≥ ord_Q(E^ns) ≥ ord_(P_0)(L^Σ) | direction correct; non-torsion case uses Ch = 0 |
| §2.15 fixed-form Check | 11a1, p = 3, K = ℚ(√−2) | a_3 = −1 unit; −8 prime to 33; −2 ≡ 1 mod 3 split; −2 ≡ 3 mod 5 nonsquare so 5 inert; a_5 = 1; X² − (1 − 10)X + 25 = X² + 9X + 25 ≡ X² + 1 mod 3, discriminant −4 ≡ 2 nonsquare | (irr_K) holds; neither family form applies |
| §2.15 prime range of the fixed-form class | CGS23 lines 828, 847–856; KLZ17 §7.2 | CGS23 states p ∤ 2N; the proof route's standing assumption is p ≥ 5 | p = 3 kept as an owned target, wording made exact |
| §2.16 fixed-form maps | CGS23 lines 847–856 | targets I_g ⊗̂ Λ_K and I_CM ⊗̂ Λ_K; deg(π_•)·I_g = ℤ_p (Lemma 3.1.2); CM congruence generator h_K·L_v(K)^-; rescaled targets Λ_K, Λ^ur_K | matches §6.1's description |
| §4.8 derived base change Check | C = [k[[X]] —X→ k[[X]]] in degrees 1, 2 | H¹ = ker X = 0; H² = k; C ⊗^L k = [k —0→ k], H¹ = k; cokernel H²[X] = k | injective, not an isomorphism |
| §4.8 projector Check | 𝔽_5, η Teichmüller, 1/4 ≡ 4 | e_η = 4[1] + 2[2] + 3[3] + [4]; [2]e_η = 3[1] + 4[2] + [3] + 2[4] = 2e_η | η-component correct; η²(2) = 4 ≠ 2 |
| §2.2 dual Check | V = ℚ_5/ℤ_5 | ×5: V ↠ V with kernel 𝔽_5; ℤ_5 ↪ ℤ_5 with cokernel 𝔽_5 | interchange detected |
| §5.8 degree Check | ranks 1 (ρ^+), 1 (χ) | deg Ch(σ^+) = 2 = 1 + 1; rank 3 gives 3 ≠ 2 | clause (7) discriminates |
| §5.8 orientation Check | ord_P(𝔈_D) = 2; scalar 0, 1, 2 | (iii): ≥ 2; (iv): 2 > 1 gives ≥ 1; 2 > 2 false | matches §0.7(iii)–(iv) |
| §5.8 localization Check | A = ℤ, (6) at (2) | 6 = 2·3, 3 a unit in ℤ_((2)); contraction (2) ≠ (6) | as stated |
| §5.11 specialization Check | A = O[[X,Y]], X = A/(X+p) ⊕ A/(X,Y), X ↦ 0 | Ch_A = (X+p); φ(f) = p; X/XX = O[[Y]]/(p) ⊕ O[[Y]]/(Y), Ch = (pY) ⊊ (p) | strict containment, direction of SU Cor. 3.2.9 |
| §5.11 tensor Check | ℤ_p —p→ ℤ_p, ⊗𝔽_p | zero map 𝔽_p → 𝔽_p | injectivity lost |
| §5.12 parity Check | n⁻ with 0, 1, 2 inert primes, d = 2 | 0 ≡ 2, 1 ≢ 0, 2 ≡ 0 mod 2 | admissible, excluded, admissible |
| §7.8 defect Check | defects (1,0,0,0), (1,−1,0,0), (0,0,0,0) | sums 1, 0, 0; individual bounds exclude the second | only zero survives |
| BCS page concordance | published text | Thm 1.1.2 p. 2; §2 pp. 6–7; Hyp. 3.1.1 p. 7; Thm 3.2.1 p. 8; Thm 4.1.3 p. 9; Prop. 5.2.1 p. 11; Lemma 5.2.3 and (5.4) p. 12 | one locator corrected (§2 pages) |

## Notes for the maintainer

- Source errors: SU Prop. 12.3.6 (author copy p. 202) and SU Prop. 13.4.1(ii) (p. 217), hence the proof of SU Theorem 3.6.1 at pulled-back primes, assume μ = 0 for the Σ-imprimitive anticyclotomic function; the removed nonsplit Euler factors are constants that can be nonunits (11a1, p = 7, K = ℚ(√−3), 113 ∈ Σ). The README now carries the corrected statements (§§1.5(iii), 1.7(ii)) and the Euler-factor comparison in §1.10, on the pattern of Wan-2015 Lemma 87 and of this roadmap's §5.9.
- The route for §1.5(iii)(b) uses the primitive two-variable function with the congruence denominator cleared, supplied by gap:katz-cm-padic-l (Hida's Rankin–Selberg function "with its congruence-ideal denominator"); no new gap was declared and no gap `needs` text changed.
- Renumbering: the Hilbert Klingen family is now §5.3 and the quaternionic-period/(NV1)/(NV2) target §5.4. No roadmap on main or at an open head cites either by number; HeegnerPointEulerSystems cites gap slugs only, and ModularIwasawaMainConjectures cites Layers 1–4 and 7.
- Ownership of the fixed-form Beilinson–Flach class (§2.15, BCS form) was checked by object against main and the open heads (`roadmaps grep 'Beilinson.Flach'`): only ModularIwasawaMainConjectures (a consumer) and EulerSystemsAndKolyvaginSystems mention them, the latter placing them outside its scope; this roadmap keeps them, as it already did the CW and FW forms. Ownership against open pull requests beyond that search was not checked further.
- sources.toml was edited only in the `version_note` of the BCS and LLZ14 keys; no key was added, no fetch was issued (both copies were already in the cache), and no local path was written.
- KatoEulerSystems remains a board package rather than a roadmap at an open head; its sections were not re-resolved this round (the resolver reports no missing citation).
