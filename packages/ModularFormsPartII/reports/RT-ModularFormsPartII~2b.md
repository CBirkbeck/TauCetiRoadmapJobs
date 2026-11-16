<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6905587386 -->
Red team round 2 pass b (claude) of 4e42d33

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) "finite order, hence congruence" in the weight reduction; the Kronecker form of ε is the missing input

   **Location.** `packages/ModularFormsPartII/README.md:605` (§6.2 proof sketch): "The multiplier of `η(τ/2)²`, read from the η multiplier ε of ModularForms §0.2 with `ε(γ)²⁴ = 1`, has finite order, so `h₀` is a form of weight −1 on its kernel, a congruence subgroup." Also line 660 (§6.7: "a character of order 3 trivial on `Γ(3)`, by the η multiplier ε … (`ε(T)⁸ = exp(2πi/3)`)") and the contract at line 88, which lists only `ε²⁴ = 1`, `ε(T)`, `ε(−I)` and the inversion law.

   **Claim.** A multiplier of finite order has a congruence kernel. §6.3 ("Divide by `h₀^k`, which is congruence") and so the headline `unbounded_denominators` in weight `k ≠ 0` rest on it.

   **Witness.** The implication is false, by the roadmap's own §6.8: `h^(1/5)` is cut out by a character of order 5 of the theta group, and its kernel is not congruence (`5 ∤ 24`). The conclusion for ε is true, but the cited facts (`ε²⁴ = 1`, two values) do not give it.

   **Repair.** The owner already has the input: ModularForms §0.2 proves the Kronecker form of ε.

   1. In `### From TauCetiRoadmap.ModularForms`, after "and the inversion law `η(−1/τ) = √(−iτ) η(τ)`." insert: "The Kronecker form: for `c > 0` and `e(x) = exp(2πix)`, `ε(γ) = (d/c)·e(((a + d)c − bd(c² − 1) − 3c)/24)` for odd c and `ε(γ) = (c/d)·e(((a + d)c − bd(c² − 1) + 3d − 3 − 3cd)/24)` for even c."
   2. In §6.2 replace the quoted sentence by: "The character `ε²` of `SL₂(ℤ)` is trivial on `Γ(12)`: for `γ ∈ Γ(12)` with `c > 0`, c is even, the Kronecker symbol squares to 1, and the numerator `(a + d)c − bd(c² − 1) + 3d − 3 − 3cd` is divisible by 12 because `12 ∣ b, c` and `12 ∣ d − 1` (ModularForms §0.2, Kronecker form); for `c < 0` use `ε(−I)² = −1` and `−γ ≡ −I`, where the numerator is `≡ −6` modulo 12; for `c = 0`, `γ = T^(12m)` and `ε(T)^(24m) = 1`. For `γ = [[a, b], [c, d]] ∈ Γ⁰(2)`, `γτ/2 = γ′(τ/2)` with `γ′ = [[a, b/2], [2c, d]]`, so `η(τ/2)²` has multiplier `ε(γ′)²`, trivial for `γ ∈ Γ(24)`. Hence `h₀` is a form of weight −1 with trivial multiplier on `Γ(24)`. Finite order alone would not give this: the order-5 character of §6.8 has a noncongruence kernel."
   3. In §6.7 replace "by the η multiplier ε of ModularForms §0.2 (`ε(T)⁸ = exp(2πi/3)`)" by: "by the Kronecker form of ModularForms §0.2: for `γ ∈ Γ(3)` with `c > 0` both numerators are divisible by 3 (`3 ∣ b, c`), so `ε(γ)⁸ = 1`; `c < 0` follows from `ε(−I)⁸ = 1`, `c = 0` from `ε(T³)⁸ = 1`; and `ε(T)⁸ = exp(2πi/3)` gives order 3".

   Tested on the refuting instance and on controls: `S` gives `ε = e(−3/24) = exp(−πi/4)`, the inversion law; `T⁶ ∉ Γ(12)` has `ε² = −1` and `T¹² ∈ Γ(12)` has `ε² = 1`, so 12 is sharp; the order-5 character of §6.8 is not a power of ε and is not covered, as it must not be.

2. **F02** (P3) branch names in the README

   **Location.** `packages/ModularFormsPartII/README.md:11` "- ModularForms (main): the transformation of η …" and `:25` "NoncongruenceModularForms (main) consumes §§1.2–1.3, …".

   **Claim.** The README records on which branch two other roadmaps currently sit.

   **Witness.** The repository's writing rules, `README.md` lines 278–282 of the roadmap repository ("Roadmaps are timeless … don't refer to the review process"). No roadmap on main writes "(main)" after a roadmap's name (0 occurrences).

   **Repair.** Delete " (main)" in both places: "- ModularForms: the transformation of η …" and "NoncongruenceModularForms consumes §§1.2–1.3, …".

Round 2. One blocking finding (S01, P2) and one policy finding (S02, P3). All eleven findings of round 1 are repaired at this head, and no repair introduced a mathematical error; S02 is a wording slip that the round-1 repair introduced.

## Round-1 findings at this head

| Finding | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (§4.3 statable, absent) | repaired | `Suggested.lean:168` `theorem ihara_generation … (hneg …) (hle : G ≤ Gamma N ⊔ Subgroup.zpowers (-1 …)) (hlevel …)`. Recomputed at `G = ±Γ(N)`: third set is `±Γ(N) ∩ Γ₀(p)`; CDT25 line 2024. |
| 1a/F02 (redundant `hneg`, strict form owned on main) | repaired | `Suggested.lean:79–82`: hypothesis and conclusion both in `G ⊔ Subgroup.zpowers (-1)`. `H′`, `N = 2`: `Γ(2) ≤ ±H′ = Γ(2)` true, `Γ(2) ≤ H′` false. README §1.8 names NoncongruenceModularForms §3.3 for the strict form; that section exists on main (`wohlfahrt_strict`). |
| 1a/F03, 1b/F04 (retired ModularForms labels) | repaired | README line 11: "ModularForms …: the transformation of η … (§0.2), the complex modular curve (Layer 10), … (§§8.0–8.1)". All three headings exist in `TauCetiRoadmap/ModularForms/README.md` (lines 395, 821, 921, 1148). |
| 1a/F04 (QSeries §5.2 for the η multiplier) | repaired | No citation of QSeries §5.2 remains; §§6.2, 6.7, 7.10 cite "ModularForms §0.2". Recomputed `ε(−I)⁴ = (−i)⁴ = 1`, `ε(T)⁴ = exp(πi/3)` (README line 851). See S01 for what §0.2 is cited for. |
| 1a/F05, 1b/F05 (§5.13, §4.10 of ModularCurvesPartII) | repaired | README line 104: "§5.13: for `N ≥ 1` and a ring R with a ring map `ζ : ℤ[ζ_N] → R`, the fixed-pairing compactified curve"; "§4.10: for `N ≥ 3` the affine fixed-pairing curve … geometrically connected". Both headings exist at the supplier's head with these hypotheses. |
| 1b/F01 (§6.4 statable, absent) | repaired | `Suggested.lean:218–225` `rational_unbounded_denominators`. `Δ⁻¹/11`: `D = 11` gives `1, 24, 324`; `f = 0`: `D = 1`. |
| 1b/F02 (gap wording, "globally nilpotent") | repaired | README line 130 and `design/plan.json` `gaps[2].needs` agree word for word in content: Galochkin ⇒ regular singular, rational exponents ⇒ quasi-unipotent, with density one. §7.9 no longer claims nilpotence at almost all primes. |
| 1b/F03 (Tau Ceti function field) | repaired | README line 82 cites `Subgroup.CompactifiedQuotient.laurentQExpansion`, `…laurentQExpansion_injective`, `…coeffSubfield`, `…mem_coeffSubfield`; found at the pin in `TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean` lines 102, 137, 209, 215. The split ⊆ (§3.1) / = (§5.1) creates no Layer 3 → Layer 5 edge. |
| 1b/F06 (unused suppliers) | repaired | No occurrence of AlgebraicModularFormsAndSerreWeights §1.5 or GeometryOfNumbersAndQuadraticArithmetic in the README. §8.3's Sturm step recomputed: bound `2·6/12 = 1`, both sides `1 − 8q + 24q²`. |

## Verified sound

Counts: 24 declarations read (all of `Suggested.lean`, 374 lines), 64 README sections read (all 1057 lines), 38 CDT25 and 4 KSV10 locators verified against the texts (page and content), 127 Checks and Examples read, the numerical ones recomputed (listed below), 59 sibling section citations and 58 pinned declarations resolved.

**Dependency check** (command of the brief): `depcheck: 240 roadmaps, 2257 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

**Signatures.** No Lean was run in this pass (read-only). The elaborated types supplied with the job were compared with the README statements for all 24 declarations: the file has no `variable`, every binder is in the declaration's own signature, and nothing changed.

**Adversarial table, Lean declarations.**

| Declaration (context) | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsWeakForm` (def; no instance) | `1`; `Δ⁻¹`; `exp(j)`; odd k with `−I` | weight 0; `Q⁻¹ + 24 + 324Q`; growth `exp(exp(2π Im τ))` fails; `f ∣[k](−I) = −f` forces 0 | determines the object |
| `wohlfahrt_Gamma_le` | `N = 0`; `H′`, `N = 2`; `η²` kernel, `N = 6` | `Γ(0) = ⊥`; `gT²g⁻¹ = [[−1,2],[−2,3]]`, negative in `H′`; `χ(T)⁶ = −1` | true; unsigned form excluded |
| `modularLambda`, `modularLambda_covering` | `τ = i`; `τ + 1`; boundary | `λ(i) = 1/2`; `−16q − 128q²` both sides; `λ(1 + i) = −1`, `λ((1 + i)/2) = 2` | true |
| `lambdaField`, `congruenceSpan`, `boundedDenominatorSpan` | `N = 1`; `√2`; `Γ₀(3)` Hauptmodul; generators on `Γ(2N)` without `−I` | generator `16q − 128q² + 704q³`; `√2` excluded; Hauptmodul excluded by width 3 at `0`; `H = ±Γ(2N)` serves for weight 0 | `M₂N ⊆ R₂N` holds as typed |
| `nonabelian_ihara` | `G ⊇ Γ(N)`; `N = 3`, `p = 2`; `c` typed into `Γ(N)` | S trivial; `c([[1,0],[6,1]]) = [[1,0],[3,1]]`; `AgA⁻¹ = [[a, pb],[c/p, d]] ∈ Γ(N)` | true; `hc` fixes c |
| `ihara_generation` | `G = ±Γ(N)`; generators inside the right side | third set `= ±Γ(N) ∩ Γ₀(p)`; `G ∩ Γ(Np) ⊆ Γ(N) ∩ Γ₀(p)`; kernels `1 × S × 1` and `S × 1 × B` generate | true |
| `boundedDenominatorSpan_eq_congruenceSpan`, `…_finrank_le` | `N = 1`, `2`, `3` | degrees 1, 4, 12; `1 ≤ C log 2`; `4 > 32/π² ≈ 3.24` | consistent with §5.4 |
| `unbounded_denominators` | odd k, `−I ∈ Γ`; `j^(1/3)Δ`; junk of `ofComplex` | `f = 0`, `Γ′ = SL₂(ℤ)`; `1, 248, 4124, 34752`; periodicity on the lower half-plane is trivially true | true |
| `rational_unbounded_denominators` | `Δ⁻¹/11`; `Σ Qⁿ/2ⁿ` | `D = 11`; no D | true |
| `weakForm_galois_conjugate` | `f = 0`; `√2 Δ⁻¹`; weight `k ≠ 0` | `K = ℚ`; conjugate `−√2 Δ⁻¹`; `f′ = G^σ h₀^(−k)` keeps period h (support on multiples of `lcm(h, 24)/h`) | true |
| `algebraicInteger_unbounded_denominators` | trace argument | `f_i` has coefficients `Tr(α_i a_n) ∈ ℤ`; trace matrix invertible | true |
| `IsVectorValuedForm` | `n = 0`; odd k; `ρ(T)` unipotent; `1 ⊕ σ` | holds vacuously; `F = 0`; rejected; accepted with `σ(R)³ = I`, `σ(T)` of characteristic polynomial `X² − 5X − 1` | determines the object |
| `vectorValued_component_congruence` | `F = (1,0,0)`, `ρ = 1 ⊕ σ`; nonunitary `ρ(T)` | `F₁ = 1` on `Γ(1)`; growth of `F_j ∣ g` uniform once `Γ(M)`-periodic | true |
| `vectorValued_effective_mason` | same F | `ρ(γ)e₁ = e₁` although ρ has infinite image | true; conclusion is on values only |
| `weakFormAlgebra`, `quasiModularWeakAlgebra`, `…_differential_closure` | `Δ`; `E₂` | `DΔ = E₂Δ`, so `E₂ = DΔ·Δ⁻¹` in every D-closed algebra; `E₂ ∣[2] S = E₂ + 6/(πiτ)` | true |
| `HasCuspidalExpansionOver`, `congruenceKernel_no_deficient_place` | `Δ`; `E₄`; `k ≤ 0`; a second infinite place | `τ(m)`; `240σ₃(m) ≥ 240m³` excluded; `F = 0`; conjugate form again on `Γ₁(M²)` | true |
| `exists_deficient_finite_place` | `S = ∅`; `1 ⊕ σ` | hypotheses contradictory by §7.11; no noncongruence component exists | true |

**README values recomputed.** `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵` and its inverse `x + 8x² + 84x³ + 992x⁴ + 12514x⁵`; `x₃ = t − (8/3)t⁴ + (68/9)t⁷`; `γ₂ = Γ(1/4)⁴/(4π²) ≈ 4.3769` from the §5.1 formula; log-radius terms `ζ(3)/(2N³)`, `3ζ(5)/(8N⁵)`; `K₀` recurrence and equation; `θ₃(τ₀)² = (1 + 4i)θ₃(2i)²`; §1.7 matrices `[[−1,1],[−4,3]]`, `[[−3,4],[−4,5]]`; KSV10 `L = (Tᵗ)⁻¹T^(a−1)Tᵗ`; `h = q∏_{m odd}(1 + q^m)^(−24)`; 2-adic and 3-adic valuation lists of §6.9; `E₀ = 1 − 4q + 20q² − 64q³`; `Σ C_n² xⁿ = 1 + q − 4q² + 5q³ + 12q⁴` and the theta quotient through `q²`; `B = [[−3,−2],[2,1]]`, `B² = [[5,4],[−4,−3]]`; the `μ = √2 − 1` representation (trace `2is`, determinant −1); §1.2's non-holomorphic control (`qExpansion 1 = t`, `qExpansion 2 = 0`).

**Suppliers.** Every cited section exists where cited, with the hypotheses the README assumes: ModularCurvesPartII §§4.10, 5.13, 5.14, 6.3–6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; DiophantineApproximationAndTranscendencePartII §§4.1–4.8; ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19; QSeriesPartitionsAndMockModularForms §§8.1, 8.4a; AlgebraicModularFormsAndSerreWeights §2.9; AutomorphicGaloisRepresentations §4.2; SpecialFunctionsTheta §§2.2, 4.2, 6.1, 6.2, 6.4; ModularForms §§0.2, 8.0, 8.1, Layer 10; DiophantineApproximationAndTranscendence §§5.2, 5.3; FuchsianOrbifolds Layers 2–6; BelyiMaps Layers 6, 9 (§9.1C), 11 (§11.1); UniversalCovers Stage 2; EtaleCohomologyFoundations §F.0.2; NoncongruenceModularForms §§3.1, 3.3, 8.1, 8.2. The three declared gaps have the same slugs and the same `needs` in `design/plan.json` and in the README.

**Ownership.** No declaration shares a fully qualified name with a roadmap on main or at an open head: `unbounded_denominators` (NoncongruenceModularForms, main) and `modularLambda` (SpecialFunctionsTheta, open) are in their own namespaces, on other carriers, and the README cites both roadmaps for what they own. The old-to-new numbering table covers every former number NoncongruenceModularForms cites (W1.2–W1.3, W1.5–W1.6, W1.8, W6.3–W6.5).

**Policy.** The pull request changes only `packages/ModularFormsPartII/`. No `lemma`, `set_option`, `#eval`, `True` placeholder or sorry'd data; one `import Mathlib` and one existing Tau Ceti module. Every definition has at least three Checks. No padding found: no declaration follows from the pinned libraries by one tactic. Headlines not stated (§§5.3, 5.5, 7.1–7.2, 9.3) are named in the module docstring with what each lacks.

**Copyright.** Arrangement: Layer 1 ↔ §4.1, Layer 3 ↔ §3 with §4.2, Layer 4 ↔ §4.4, Layer 5 ↔ §4.3, Layer 6 ↔ §6.3, Layer 7 ↔ §§7.2–7.3, Layers 8–9 ↔ parts of §7.4; Layer 2 has no section of CDT25, and §§2, 5, 6.1–6.2 of CDT25 are no layer. The map is not one to one and not in order (Layers 3–5 against §§3, 4.2, 4.4, 4.3). No table, figure or list is taken over.

Source independence: 18 passages compared with 2 sources, none shared (longest common run 5 words, a standard term); largest share CDT25, 63 of 66 locators; contents compared with CDT25: independent.

## Not verifiable

- Ihara1994 (Theorem 1, pp.248–249; §4, p.252): uncertified, text not read. The proof plan of §9.2 rests on it and on the sketch at CDT25 line 4128.
- The `𝓞_K` form of §7.11 (API bullet), on which `exists_deficient_finite_place` rests for `K ≠ ℚ`: no source states it; the argument was reread step by step (conjugate operators stay Fuchsian, conjugate series converge, traces fall under §7.1) and no step failed.
- Wohlfahrt's 1964 Theorem 2 is cited through CDT25 and KSV10; its text was not read.
- Numerical values to seven digits (`λ(0.3 + 0.8i)`, `|F₃′(0)|`) were checked to four digits and against SpecialFunctionsTheta §6.1.
- The Lean text of S01 changes no declaration; nothing was elaborated in this pass.

## Source issues

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), printed page 654: the source says C has lower row (cp, d) and uses diag(p, 1/p); it should be rows (a/p, b), (c, pd), using diag(1/p, p); affects the proof.
- **Error** in CDT25 at §4.4, definition of f₂, printed page 658: the source says conjugation by A maps the signed group ⟨E, Γ(N)⟩ ∩ Γ₀(p) onto itself; it should be onto the subgroup with upper-right entry divisible by p; affects the proof.
- **Error** in CDT25 at the sentence before Lemma 4.4.4, printed page 659: the source says reduction to the Borel subgroup on the signed group has kernel Γ(Np); it should be the larger group containing matrices ≡ −I mod N, ≡ I mod p; affects nothing.
- **Gap** in CDT25 at proof of Lemma 4.2.3, printed page 656: the source takes the normal core of the generators' stabilizers and asserts level exactly 2N inside ⟨E, Γ(2N)⟩; it should first intersect with ⟨E, Γ(2N)⟩; affects the proof.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, printed page 656: the source chooses the form in R at level 2Np; it should be chosen in R at level 2N, outside M at level 2N; affects the proof.
- **Misprint** in CDT25 at Proposition 3.0.1 and §6.3, printed pages 649 and 685: the source bounds the rank by a constant times N³ log N for every N; it should be N³ log(2N), the rank being 1 at N = 1; affects nothing.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed page 636: the source bounds the dimension over ℚ(p) of the span over all rational functions of x; it should be the span over ℚ(p) (p = x + x⁴/32 gives 4 > 3.6); affects a stated result.
- **Misprint** in CDT25 at (1.0.4), printed page 629: the source says λ(1 − λ)/16 has level Γ₀(2); it should be the theta group ⟨Γ(2), S⟩, since T changes its sign in exp(πiτ); affects nothing.
- **Error** in CDT25 at Corollary 7.3.4, printed page 691: the source concludes ker ρ ⊇ Γ(N) and finite image; it should assume the values of F span ℂⁿ, or conclude only that Γ(N) fixes the values; affects a stated result.
- **Error** in CDT25 at §7.4.8, printed page 695: the source says a non-archimedean deficient place exists whenever ker ρ is not congruence; it should require a noncongruence component of a cuspidal form for ρ; affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, printed pages 692–693: the source combines θ = (1/πi) d/dτ with θΔ = E₂Δ; it should be θΔ = 2E₂Δ for that θ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed page 693: the source writes E as (16x − 1)K − 8∫K, of constant term −1; it should be (1 − 16x)K + 8∫K, of constant term 1; affects nothing.
- **Gap** in CDT25 at the passage before Theorem 7.3.3 and its proof, printed page 690: the source asserts a free rank-6n bundle and reduces to an irreducible local system; it should use the continuation span of the component, of dimension at most n; affects the proof.
- **Misprint** in KSV10 at proof of Proposition 3, line after equation (1), arXiv v4 page 6: the source factors L as transpose of T, power of T, inverse transpose; it should be inverse transpose first, transpose last; affects the proof.

## For the human reviewers

- **Licence.** CDT25 was read in the author's offprint (`sources.toml`, `licence_class = "author-page"`); each page of that copy carries the publisher's line that copyright restrictions may apply.
- **Not tested.** Ihara1994 (`sources.toml`, `status = "uncertified"`) is the only source of the proof route of README §9.2; its text was not read, so §§9.2–9.3 were not compared with it.
- **Scope.** README §§7.12, 7.13, 8.7 state corrected forms of CDT25 Corollary 7.3.4 and §7.4.8, and §7.11's `𝓞_K` form extends Theorem 7.3.3; no refereed source states these forms.
- **Merge order.** SpecialFunctionsTheta, cited as a supplier in README §§2.1, 2.2, 2.6, 6.8, is an open pull request of another author that adds the folder; `merge-order/ORDER.txt` does not list it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4e42d33b5d55216e8ef6c29e083fd14e80868211", "job": "RT-ModularFormsPartII~2b", "model": "fable", "worker": "chris-x88"} -->
