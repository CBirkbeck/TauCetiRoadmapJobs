# Repair report

Finding headings keep each review's own identifiers. The review label under each heading tells the repeated identifiers apart; cross-references use the r2a or r2b prefix. Where findings overlap (r2a-F08 with r2b-F06; r2a-F02 with part of r2b-F06; r2a-F07 with part of r2b-F05), each still gets its own verdict. Source identifiers are the lifetime keys in sources.toml. No source passage was copied.

## F01 (P1) — applied

*Review: r2a.*

Change: "flat duality" from ArithmeticGaloisDuality D7.6 → new gap:global-flat-duality on ArithmeticGaloisDuality (Layer D7), recorded in the plan, the supplier contracts, the §3.8 API and Needs, and both §3.9 Needs lines. D7.6 is kept only for lattice Poitou–Tate away from p, big-étale Ext over a field and local abelian-variety duality.

Evidence: in ArithmeticGaloisDuality D7.6 (open head) every duality is étale/Galois over a number field with S inverted, over a field, or local. src18 line 506–508 (Schneider §2, proof of Lemma 2, p.341) uses global flat duality over o. `roadmaps grep` over main and all open heads finds no owner. ArithmeticStatisticsPartVII has only function-field flat duality.

## F02 (P2) — applied

*Review: r2a.*

Change: tateParameter_exists and ResidualHyp.ramified_iff_not_pth_power (§1.1) → imports of PadicHodgeTheory §9.3 (`potentiallyMultiplicativeTwistReduction`) and ArithmeticGaloisRepresentations §6.3, "Multiplicative residual unramified criterion". "Eight" → "Seven" owned pieces. Repaired at: Scope, the Tate-curve contract, How to read the build, the §1.1 API, prose, sources, Needs and Check, Layer 1 Dependencies, §3.7 Needs, §3.9 Needs, §5.5.

Evidence: PadicHodgeTheory §9.3 states, for every prime and every finite K/ℚ_p, a unique positive-valuation q with E≅E_q⊗η, split iff η=1. ArithmeticGaloisRepresentations §6.3 states E[p] unramified iff p∣v_K(j), nonsplit included. Both are earlier in the merge order. The §1.1 Check was recomputed: 11a1 at 11 is ramified for 7 and unramified for 5; 14a1 at 2 is ramified for 13 and unramified for 3. A ramified-twist negative control was added.

## F03 (P2) — applied

*Review: r2a.*

Change: §1.7 "Σ containing all primes dividing N" → "Σ containing all primes dividing N/p, with p∉Σ as always". Other places: §1.6 already reads "every prime dividing M" with M=N/p; there is no other occurrence.

Evidence: for N=6 and p=3 the old enlargement needs {2,3}⊆Σ∌3, which is impossible; Σ={2} works.

## F04 (P3) — applied

*Review: r2a.*

Change: §3.7 Check "corrected height and the ℒ-invariant undefined" → "corrected height undefined and the ℒ-invariant zero (ord_p(q_E) ≥ 1 in the denominator)".

Evidence: q=p gives 0/1=0 and q=ζp² gives 0/2=0. This agrees with the §5.5 Check (q=p has ℒ=0).

## F05 (P2) — applied differently

*Review: r2a.*

Change: §3.1 "Assume p>3" → "Let p be odd", with a proof that H¹(X₀(N),ℤ_(p)) is parabolic Γ₀(N)-cohomology at every prime in weight two. New Check: 19a1=X₀(19) at p=3. The comparison with the modular-symbol lines stays in gap:manin-period-comparison.

Why not as suggested: the suggested repair keeps p>3 for this identification and routes p=3 through a gap, but the premise is false. With trivial torsion-free coefficients, H¹(Γ₀(N),ℤ_(p)) = Hom(Γ₀(N),ℤ_(p)). Such homomorphisms kill −1 and the elliptic elements, which have finite order and normally generate the kernel of Γ₀(N)→π₁(Y₀(N)(ℂ)). Γ₀(19) has 1+(−3/19)=2 elliptic points of order 3, Hom(ℤ/3,ℤ₃)=0 and H¹(ℤ/3,𝔽₃)=𝔽₃. p odd is still needed for the ± splitting.

## F06 (P2) — applied

*Review: r2a.*

Change: §3.2 now defines μ_{E,α} on ℤ_p× (Colmez Theorem 0.8, Remark 0.10), its η-branches, and L_p(E/ℚ) as the η=1 branch. mazurSwinnertonDyerL_twist evaluates L_p(E/ℚ) only at χ trivial on Δ; other χ evaluate the χ|_Δ branch. Check added: at p=3, δ₁−δ₋₁ pushes forward to 0 but has odd-character integral 2.

Evidence: ⟨−1⟩=1 at p=3. Pattern search: §0.4 already evaluates characters of Γ only.

## F07 (P3) — applied

*Review: r2a.*

Change: the two §0.12 restatement Checks → the image models XR with L̃=X² ((X) against (X²)) and ϖR with L̃=ϖX (μ 0 against 1). The duplicate of SMC.kobayashi_form was dropped. The §0.13 "proves no divisibility" bullet moved into its prose. The consumer-only bullets of §§1.7, 4.5, 5.4 and 5.7 moved to Downstream consumers.

Evidence: XR/X²R≅R/(X) has length 1 at (X), against 2 for R/(X²). ϖR/ϖXR≅R/(X) has μ=0, against μ=1 for R/(ϖX). Both pairs agree after inverting ϖ.

## F08 (P3) — applied

*Review: r2a.*

Change: the module docstring now lists the Hida approximation (README §1.6) as not statable. It lacks the Galois lattices of newforms with their ordinary lines, the ordinary Hida family, and the canonical p-adic L-functions and integral family periods it compares.

Evidence: Tau Ceti has `Newform` (NumberTheory/ModularForms/Newforms/Newform.lean:104), so the text names the Galois lattices, not newforms, as missing. The pins have no Galois representation of a newform.

## F01 (P1) — applied

*Review: r2b.*

Change: §3.7 "α⁻¹-eigenvector of φ" → "spans the unit-root subspace: F-eigenvector for α, equivalently an (α/p)-eigenvector of φ", with a/b∈ℤ_p (MST §3.2, p.591). The construction line was corrected the same way. The 11a1 Check shows that the α⁻¹-line of φ is the (7/α)-line of F, which reduces into ⟨ω_E⟩ mod 7.

Evidence: MST line 615–620 defines the unit-root subspace. SW line 756 is a slip: φ=F/p by SW line 544, while SW's numbers use MST's algorithm. §5.6 ("α-eigenline of Frobenius") now agrees with §3.7.

## F02 (P2) — applied differently

*Review: r2b.*

Change: gap:signed-regulators citations → PadicHodgeRegulators §8.8, §8.22, §9.12, §§9.14–9.15, §§9.17–9.21, §9.26, §9.29 and §9.30, in Scope, the contract, §§0.10–0.13, §4.4, §4.5 and the Layer 0 Dependencies. The residual gap covers a^± (LLZ 5.10–5.11), the a_p=0 integral images (LLZ 5.18, 5.22), and the general-weight ordinary Coleman map (Kato 17.11–17.12). Plan updated.

Why it differs: the suggested text cites §8.22 for §0.10, but §8.22 covers elliptic curves only, while §0.10 is in general weight. Board head 5eff35d has no general-weight ordinary integral Coleman map.

## F03 (P2) — applied

*Review: r2b.*

Change: gap:analytic-twist-nonvanishing deleted from the README and plan, with KatoEulerSystems §4.2 cited instead. The other Kato citations now name §2.2, §4.3, §§5.1–5.2, §5.4, §§6.2–6.4, §6.6, §7.2, §7.4, §7.6 and §7.9. The residual gaps are the integral 12.5(4) and 17.4(3) under a free rank-one quotient, and the L=0 placement with Bloch–Kato control.

Evidence: head 725fd74 has these sections, and its §4.3 gives the strict-kernel bound under the rank-one hypothesis. Skinner §2.5 (line 592–610) explains why the rank-one hypothesis suffices. The §7.4 elliptic exact divisibility is not in the residual gap, because the general-weight 17.4(3) item subsumes it.

## F04 (P2) — applied

*Review: r2b.*

Change: the Manin constant, its integrality, the p-unit range and the isogeny/twist transfer now cite GrossZagierAndArithmeticHeights §§3.5, 3.7 and 3.10 (in §3.1(3), the §3.1 proof, the §3.1 Needs and the Layer 3 Dependencies). gap:manin-period-comparison is reduced to comparing the saturated H¹(X₀(N),ℤ_(p)) f_E-line with the §1.1 modular-symbol line, including primes dividing deg(X₁(N)→X₀(N)). Plan updated.

Evidence: head b5527a0 §§3.5, 3.7 and 3.10. Skinner line 1009–1011 (§3.3 note 8).

## F05 (P3) — applied

*Review: r2b.*

Change: RankZeroOneBSD, CMAllPrimeMainConjectures, AutomorphicPadicLFunctions, RankOneConverse and their labels → descriptions (the rank-zero and rank-one Birch–Swinnerton-Dyer branch, the CM main-conjecture theory, the Katz p-adic L-function theory). Backticked `ellipticUnitCharacterComparison` removed. The CZ.3 restriction is restated from Keller–Yin, proof of Theorem 2.2.3, p.34. HeegnerPointEulerSystems HE.x → Layer 8b, §6.9, §8b.2 and §§8b.5–8b.9.

Evidence: the first three names are on no list: main, the open pull requests, or the merge order. RankOneConverse has no README. HeegnerPointEulerSystems uses layer and section numbers, not HE.x labels.

## F06 (P3) — applied differently

*Review: r2b.*

Change: the docstring gains the Hida approximation (shared with r2a-F08) and the period-defect dictionary of §0.9, which lacks the Galois representation of a newform with its Betti–étale lattice and Kato's p-adic zeta function. Tate's uniformisation is not listed: it is imported (r2a-F02).

Why not as suggested: "lacks newforms" is false, since `Newform` exists in Tau Ceti. "Lacks split multiplicative reduction" is also false: `WeierstrassCurve.HasSplitMultiplicativeReduction` is at Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:364.

## Gate failures

- tex=4: the README had four TeX-style brace subscripts in plain text, outside code spans. There was one in the gap:signed-regulators contract (Exact supplier contracts), `Σ_{δ∈Δ}δ`. There were three in the Tate-uniformisation paragraph of §1.1 (Residual hypotheses of the main theorems): `E_{q_E}` twice and `ρ̄_{f_E}` once. Each formula is now wrapped as a code span, for example `Im Col₂ = (Σ_{δ∈Δ} δ)Λ(G_∞) + XΛ(G_∞)` and `j(E_{q_E}) = j(E)`. The wording and the mathematics are unchanged. A rescan of the README with code spans and fenced or indented blocks removed finds 0 sub- or superscripts written with braces, 0 backslash commands and 0 `$`. plan.json, Suggested.lean, metadata.toml and sources.toml contain none of these tokens. No other text was edited.

## Mechanical checks

- Elaboration: `lake env lean` on packages/ModularIwasawaMainConjectures/Suggested.lean from the content checkout. Exit 0, with exactly three "declaration uses `sorry`" warnings at lines 47, 59 and 69, and no errors. The imported module's object file was already present. It was re-run after the gate repair: Suggested.lean is unchanged and the outcome is identical.
- Signature audit: put `#check @name` for all four declarations into one scratch copy and elaborated it once (exit 0). The elaborated types are unchanged from the supplied signatures. The DVR/domain, square-zero and primitive-image binders survive, as do p prime, 5≤p, closedness and surjectivity, and the unit q, ‖q‖<1 and algebraic j. Each matches its README statement. Only the docstring changed.
- Dependency check, with `--movable` and the supplied order. Exact output:

```text
depcheck: 39 roadmaps, 408 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolver output:
  - `KatoEulerSystems §2.2` and `PadicHodgeRegulators §8.8` are flagged as found nowhere. Both are false positives. The resolver reads only main and open roadmap pull requests. Both suppliers are board packages, earlier in the merge order (lines 248 and 211; this roadmap is line 250), listed in the board package index, and the cited sections exist at heads 725fd74 and 5eff35d.
  - No Lean name was flagged.
- `git diff --check` passes. No machine path appears in the edited files. metadata.toml is unchanged.

## Ownership, suppliers and what the maintainer should know

Every new or changed citation was resolved at its current copy: PadicHodgeTheory #1062 §9.3; ArithmeticGaloisRepresentations #856 §6.3; ArithmeticGaloisDuality #858 D7.6; HeegnerPointEulerSystems at the supplied checkout; the KatoEulerSystems, PadicHodgeRegulators and GrossZagierAndArithmeticHeights board heads; ModularSymbolsPadicLFunctions #968 §1.1. Ownership of global flat duality was searched by object over main and all open roadmap heads (no owner). All new suppliers are earlier in the merge order. No notion moved down from a later roadmap.

Ownership moved up to earlier owners:
- Tate parameter existence → PadicHodgeTheory §9.3.
- Multiplicative inertia criterion → ArithmeticGaloisRepresentations §6.3.

Names that changed:
- Removed: tateParameter_exists, ResidualHyp.ramified_iff_not_pth_power and gap:analytic-twist-nonvanishing. They were README-only names, and `roadmaps grep` finds no other roadmap citing them.
- New gap: gap:global-flat-duality on ArithmeticGaloisDuality.
- Narrowed: gap:signed-regulators, gap:modular-zeta-extensions, gap:central-critical-specialization and gap:manin-period-comparison.

PadicHodgeRegulators names its consumer "SelmerModularIwasawaMain" (its lines 13, 2075, 2179); that consumer is this roadmap, and the name should be reconciled there. HeegnerPointEulerSystems (its line 223) asks this roadmap for gap:gl2-integral-rank-zero. That request is outside these findings and was not acted on.

Review r2a's source notes record a counterexample to Hida Lemma 3.17 and its addendum Lemma 0.2. These are cited in README "Downstream branch roadmaps" only as inputs to the downstream proof; no target here depends on them.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Unit-root line, §3.7 | 11a1, p=7 | F roots α≡5 (v=0), 7/α (v=1); φ roots α/7 (v=−1), α⁻¹≡3 (v=0); 5·3=15≡1 | Use the α-line of F = α/7-line of φ |
| Unit-root line: wrong model | the (p/α)-line | F̄(ω̄)=0 and F̄ has rank 1, so the p/α-line reduces into ⟨ω̄⟩ and b≡0 mod p; at a canonical lift it is ⟨ω⟩ itself, so b=0 | Old choice gives nonintegral or undefined c; Check added |
| E₂ = b₂−12a/b | x↦x+b₂/12 to the 4x³ model | η′=η+(b₂/12)ω gives a=a′+b·b₂/12, so −12a′/b′=b₂−12a/b | Unchanged, consistent |
| §5.6 height convention | — | "α-eigenline of Frobenius" agrees with the new §3.7 | Consistent |
| global flat duality gap | A=0; 11a1, p=5 | A=0: all groups 0. 11a1: E[5] over ℤ₅ contains μ₅ (not étale), c₁₁=5 | Étale or local duality is insufficient; component error 5 is nontrivial |
| Tate parameter import | 11a1/ℚ₁₁; 14a1/ℚ₂ | v(q)=5, η=1; v(q)=6, η unramified nontrivial | Split/nonsplit split cleanly |
| Inertia criterion import | 11a1 ℓ=11, p=7,5; 14a1 ℓ=2, p=13,3 | 7∤5 ramified; 5∣5 unramified; 13∤6 ramified; 3∣6 unramified | Matches §§1.1, 5.10 examples |
| Inertia criterion: negative | 11a1 twisted by ℚ(√−11) | additive, v₁₁(j)=−5, 5∣5, but inertia acts by −1≢1 mod 5 | Needs multiplicative reduction; Check added |
| §1.7 Σ | N=6, p=3; N=11, p=11 | old {2,3}⊆Σ∌3 impossible; new Σ⊇{2}; N/p=1 allows Σ=∅ | Fixed |
| ℒ when log_p q=0 | q=p; q=ζp² | 0/1=0; 0/2=0; height correction log(u)²/0 undefined | Check corrected |
| Weight-two H¹ at p=3 | X₀(19); X₀(7) | 1+(−3/19)=2 order-3 points; Hom(ℤ/3,ℤ₃)=0; H¹(ℤ/3,𝔽₃)=𝔽₃ | Identification holds at 3; p>3 dropped |
| ± splitting at p=2 | ℤ_(2)² with swap | (1,1),(1,−1) span index 2 | p odd retained |
| η-branches, §3.2 | p=3, δ₁−δ₋₁; χ of conductor 9 | ⟨−1⟩=1, pushforward 0; odd χ gives 1−(−1)=2. Conductor-9 χ trivial on Δ factors through Γ | Branch quantifier fixed |
| Trivial character, §3.2 | 11a1, p=7 | ∫μ over ℤ_p× =(1−α⁻¹)²/5, equal to the η=1 value | Consistent |
| SMC image Checks | R=O[[X]] | XR/X²R≅R/(X): 1 vs 2 at (X). ϖR/ϖXR≅R/(X): μ 0 vs 1; equal after 1/ϖ | Discriminating |
| a_p=0 images (gap) | 14a1, p=5 | trivial component Λ (4 a unit); nontrivial components (X) | Retained in gap |
| L_f ≠ 0 via KES §4.2 | 11a1, p=7; k=4 | (1−α⁻¹)²/5≠0; for k=4, r=3 is in absolute convergence | Gap deleted |
| Rank-one integral bound (gap) | u=[[1,1],[0,1]]; [[1,ϖ],[0,1]] | quotients O and O/(ϖ)⊕O | Hypothesis discriminates |
| Central value split (gap) | 11a1, p=7 | L(E,1)/Ω=1/5≠0, so §7.9 finiteness applies | L=0 part kept as gap |
| Manin comparison (gap) | 11a1 optimal; 11a3 | c=1; c=5 for a nonoptimal parametrization | Isogeny factor via GZ §3.10 |
| Docstring carriers | pins | `Newform` present; HasSplitMultiplicativeReduction present; no Galois representation of newforms or Kato zeta function | Text names only missing carriers |

No source request was needed: every text cited this round is in the cache or settled.
