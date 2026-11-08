<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2320#issuecomment-6666663770 -->
Review (claude) of 4dd870c

Verdict: needs_changes

1. **F01** (P3) §8.4 proof sketch: the third term of the Catalan quotient has weight 0, not 1

   Location: `packages/ModularFormsPartII/README.md` line 846, "Each term has weight 1 and character `χ₋₄(d)` on `Γ(2)`".

   Claim: the three terms of `(4/θ₂⁴)(4θ₃²·θ_qθ₂/θ₂ + 4θ₃·θ_qθ₃ − θ₃⁴)` all have weight 1 and character `χ₋₄(d)`.

   Witness: by §2.1, `λ = (θ₂/θ₃)⁴`, so the third term is `−4θ₃⁴/θ₂⁴ = −4/λ`, a weight-0 element of `M^!(Γ(2))` with trivial character. The first two terms have weight 1 (`θ₃²` or `θ_q(θ₃²)` times a weight-2 logarithmic derivative, divided by the weight-2 form `θ₂⁴`). The identity itself is correct: both sides recompute as `1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵` (my `numerics.py`, exact rational arithmetic), and the sum is an inhomogeneous element of `M̃^!(Γ(4))`, which is all §8.4 states.

   Repair: replace the clause by "The first two terms have weight 1 and character `χ₋₄(d)` on `Γ(2)`, trivial on `Γ(4)`; the third is `−4/λ`, of weight 0, so the sum is an inhomogeneous element of `M̃^!(Γ(4))`; `θ_qθ₂/θ₂` is a logarithmic derivative, in which the character of `θ₂` cancels." Tested: the q-series identity is unchanged by the clause; the membership claim needs only that each term lies in `M̃^!(Γ(4))`, which the corrected clause gives.

2. **F02** (P3) §8.1 cites ModularForms Layer 0 for the graded ring `M(Γ)` of an arbitrary finite-index `Γ`

   Location: `packages/ModularFormsPartII/README.md` line 808, "the graded ring of integral-weight modular forms of ModularForms Layer 0"; line 62 (supplier contract) and line 810 (`*Needs:*`).

   Claim: ModularForms Layer 0 supplies `M(Γ)` for every finite-index `Γ ≤ SL₂(ℤ)`, including noncongruence `Γ`.

   Witness: ModularForms Layer 0 (`TauCetiRoadmap/ModularForms/README.md` line 259) is stated for `Γ₁(N)` with character, and this README's own contract (line 62) says "Assumed: these are stated for `Γ₁(N)` with character". The object for general `Γ` is Mathlib's: `ModularForm.instGCommRing : DirectSum.GCommRing (ModularForm Γ)` for `Γ ≤ GL₂(ℝ)` with `Γ.HasDetPlusMinusOne`, `Mathlib/NumberTheory/ModularForms/Basic.lean` line 542 at the pin.

   Repair: in §8.1 define `M(Γ)` as Mathlib's graded ring `⊕_k ModularForm Γ k` (`ModularForm.instGCommRing`), add that declaration to the From Mathlib contract and to §8.1's `*Needs:*`, and keep ModularForms Layer 0 only for the parity convention. Tested: the Checks of §8.1 (`Δ⁻¹`, `E₂`, the constant, depth-zero elements) are statements about `ModularForm Γ k` for `Γ = SL₂(ℤ)` or a finite-index `Γ`, all of which the Mathlib carrier provides.

3. **F03** (P3) AlgebraicModularFormsAndSerreWeights is cited by layer identifiers carrying target titles

   Location: `packages/ModularFormsPartII/README.md` lines 16, 94 ("Layer R15.2, All-prime bounded denominators", "Layer R15.1, All-weight analytic comparison") and the citations at lines 375, 384, 587, 607, 615, 626, 876, 895.

   Claim: "Layer R15.2" is the all-prime bounded-denominators statement and "Layer R15.1" the all-weight analytic comparison.

   Witness: at the head of pull request #928, `AlgebraicModularFormsAndSerreWeights/README.md` line 18 says R15.1–R15.5 name Layers 1–5; Layer 2 (line 271) is "Integral q-expansion and coherent Hecke theory", and the target consumed is its §2.9 "All-prime bounded denominators" (line 413), which also carries the `Y(2N)` Laurent-series clause with `Δ⁻ᵐ` that §3.3 here uses. "All-weight analytic comparison" is §1.5 (line 227) of Layer 1. The citations resolve to the right layers, so nothing is unowned; they do not name the target.

   Repair: write "AlgebraicModularFormsAndSerreWeights §2.9 (All-prime bounded denominators, Layer R15.2)" and "§1.5 (All-weight analytic comparison, Layer R15.1)" at each occurrence. Tested against the supplier at its head: §2.9's milestone is stated "for any subgroup containing `Γ(N)`, with `N ≥ 1` and integer weight", which is exactly what §§3.3, 6.8, 6.9 and 8.6 assume.

4. **F04** (P3) the presentation of `PSL₂(ℤ)` is cited to FuchsianOrbifolds Layer 2 item 6

   Location: `packages/ModularFormsPartII/README.md` line 66, "FuchsianOrbifolds Layer 2 item 6 (the presentation `PSL₂(ℤ) = ⟨S, R | S² = R³ = 1⟩`)"; used at lines 577 (§6.5) and 780 (§7.13).

   Claim: Layer 2 item 6 states the presentation of the modular group.

   Witness: `TauCetiRoadmap/FuchsianOrbifolds/README.md` lines 255–260: item 6 constructs abstract triangle groups from polygon reflections for typed triples and proves faithfulness of their presentation; the presentation of a cofinite group from its polygon is item 5 (lines 252–254), and the level-one modular group with its standard polygon and signature is Layer 6 item 1 (lines 348–350). Neither item names `S` and `R`.

   Repair: cite "FuchsianOrbifolds Layer 2 item 5 applied to the level-one group in Layer 6 item 1 (the presentation `PSL₂(ℤ) = ⟨S, R | S² = R³ = 1⟩` with `T = SR`)" at lines 66, 577 and 780. Tested: the witness of §7.13 (`σ(S)² = σ(R)³ = I`, `σ(T) = σ(S)σ(R)`) uses only that presentation with `T = SR`, which the polygon presentation of the `(2, 3, ∞)` group gives; I recomputed `R = S⁻¹T = [[0, 1], [−1, −1]]`, `R³ = I`.

Four findings, all P3 (one false clause in a proof sketch, three citation-precision slips). No P1 or P2. The mathematics of the nine layers, the sampled locators, the elaboration, the dependency check and the headline coverage are sound; the details are under `## Verified sound`.

## Verified sound

**Elaboration.** `lake env lean` on `packages/ModularFormsPartII/Suggested.lean` from the content checkout: exit 0 in 14 s, exactly six warnings, all `declaration uses 'sorry'` (lines 70, 84, 103, 115, 146, 161), nothing else. Imports: `import Mathlib` only; no `TauCeti.*` import is needed. No `set_option`, `lemma`, `#eval`, `#print`, `#synth`, no sorry'd data (`IsWeakForm`, `modularLambda`, `IsVectorValuedForm` have real bodies on native carriers).

**Signatures.** I put `#check @name` for all nine declarations in a scratch copy and elaborated it; the nine types agree with the worker's `signatures.md` and with the README statements (§§1.1, 2.1, 2.2, 4.1, 6.3, 6.6, 7.3, 7.11, 7.12). Every binder is explicit in each declaration (no section variables), so nothing was lost.

**Padding probe.** On the same scratch copy each of the six `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | trivial | (simp_all; done) | (aesop; done) | sorry`: none closed (`modularLambda_covering` and `nonabelian_ihara` time out inside the probe tactics, the other four fall through to `sorry`). No declaration restates a definition, mirrors a Check, computes a value or treats a boundary case. A satisfiability probe `IsWeakForm ⊤ 0 (fun _ => 1)` discharged holomorphy and invariance by `simp`, and the growth clause reduced to boundedness of a constant, so the predicate is not vacuous.

**Dependency check.** Output of the gate run on this README with `--movable`:

```
depcheck: 229 roadmaps, 2261 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**Headline theorems** (from the README summary and layer titles) and their status:

| Headline | README | Suggested.lean |
| --- | --- | --- |
| λ covering of `ℂ ∖ {0, 1}` with `Γ(2)`-orbit fibres | §2.2 | `modularLambda_covering` |
| Nonabelian Ihara lemma | §4.1 | `nonabelian_ihara` |
| Unbounded denominators theorem | §6.3 | `unbounded_denominators` |
| Algebraic-integer form | §6.6 | `algebraicInteger_unbounded_denominators` |
| Congruence of an integral vector-valued component | §7.11 | `vectorValued_component_congruence` |
| Effective-span Mason corollary | §7.12 | `vectorValued_effective_mason` |
| `R₂N = M₂N`, degree doubling, holonomy rank bound | §§6.1, 5.3, 3.8 | named not statable (no Laurent expansion of weak forms at a cusp, no holonomic ring at the pins): checked, Mathlib's `qExpansion` is a `PowerSeries` of a function bounded at `∞` |
| Three-point differential equations | §§7.1–7.2 | named not statable (no continuation or local monodromy of linear ODE solutions at the pins): checked by grep of `Mathlib/Analysis` for monodromy and continuation along paths |
| Arithmetic fundamental group of the cuspidal model | §9.3 | named not statable (no regular model of `X(N)` over `𝓞_K`): checked |

The classical inputs Wohlfahrt (§1.8) and the quasimodular closure (§8.2, CDT Lemma 7.4.4) are statable but are lemmas on the way, not end theorems; I do not count their absence as P2.

**Sampled locators**, all read in `CDT25` (PDF page = journal page − 626) and `KSV10`:

| Target | Locator | Source lines | Result |
| --- | --- | --- | --- |
| 1.1 | Thm 1.0.1 p.627; Def 7.4.3 p.692 | CDT25 lines 25–41; 3896–3899 | matches: `f ∈ ℤ[[q^(1/N)]]`, `q = e^(πiτ)`, meromorphic at cusps, weight k, finite index; weakly holomorphic defined before Def 7.4.3 |
| 1.5 | Lemma 4.1.3 p.653 | CDT25 line 1576 (page 27) | matches; README's lcm equality is a strengthening (all rational cusps are cusps of `G ∩ H`), proof checked |
| 3.4 | Prop 3.0.1 proof pp.650–651; Def 2.0.4 pp.635–636 | CDT25 lines 1423–1447; 467–485 | matches; CDT places `R₂N` in `V` and bounds `dim_{ℚ(x^N)} V`, README's move to `W` justified by DAT-PartII §4.8 |
| 3.6, 3.7 | Lemma 4.2.3 pp.655–656 | CDT25 lines 1766–1798 | matches; the core-of-stabilizers gap at line 1793–1798 is real (basis `{1}` of `R₂`) |
| 6.1 | §6.3 pp.685–686 | CDT25 lines 3489–3498 | matches: Thm 5.1.4 with `A = ζ(3)/2`, Thm 6.0.1 with `p = x^N`, `r = 1 − BN⁻³`, Prop 4.3.5 |
| 6.5 | Remark 6.3.2 p.686 | CDT25 lines 3519–3526 | the remark uses that `Tr(α_i f)` is modular, which needs `f^σ` modular: README's owned target fills this |
| 6.8 | (1.0.4) p.629 | CDT25 lines 118–134 | matches: divisors of 24; "level `Γ₀(2)`" is the source error recorded below |
| 7.2 | Thm 7.2.1 pp.687–688, footnote 4 | CDT25 lines 3588–3613 | matches: integral `f`, `L` without singularities off `{0, 1/16, ∞}` except trivial-monodromy ones, finite monodromy at 0, conclusion `Γ(N)` |
| 7.7, 7.8 | proof of Thm 7.3.3 pp.690–691 | CDT25 lines 3771–3819 | matches; the "rank 6n" and "irreducible" steps are at lines 3754 and 3795–3797 |
| 8.1, 8.2 | Def 7.4.3, Lemma 7.4.4 pp.692–693 | CDT25 lines 3898–3910 | matches; `θΔ = E₂Δ` printed at line 3903 with `θ = q d/dq`, `q = e^(πiτ)` (factor 2) |
| 8.4 | §7.4.2 pp.693–694 | CDT25 lines 3992–4010 | matches Zudilin's formula; recomputed |
| 8.6 | §7.4.8 p.695 | CDT25 lines 4055–4082 | matches the deficient-place definition; the "non-archimedean deficient place whenever `ker ρ` is not congruence" claim at lines 4079–4082 is the source error recorded below |
| 1.8 | KSV10 Lemma 7 p.4, Prop. 3 p.5, (1) p.5, Remark 8 p.6 | KSV10 lines 183–195, 198–261, 240–250, 262–281 | matches; the factorization misprint at line 258 confirmed at `a = 2` |

Other locators opened while checking: (1.0.2) p.628 (line 60), §1.1.3 p.631 (line 220, `q = x + 8x² + 84x³ + 992x⁴`), §1.1.6 p.632 (line 275), Cor 2.0.5 p.636 (line 489), Def 4.1.2 and Lemma 4.1.4 p.653 (lines 1571, 1582), Lemma 4.1.7 pp.653–655 (lines 1598–1729), Def 4.2.1 p.655 (line 1734), Thm 4.3.1 and 4.3.2 pp.656–657 (lines 1810–1830), (4.3.3) p.657 (line 1835), Prop 4.3.5 p.657 (line 1851), Lemma 4.4.1 pp.658–659 (line 1903), Lemma 4.4.4 p.659 (line 1947), (4.4.9) p.660 (line 2024), Thm 5.1.4 p.668 (line 2382), Example 5.1.22 p.673 (line 2738), Thm 6.0.1 p.679 (line 3017), Remark 7.2.3 p.688 (line 3617), Def 7.3.1 pp.688–689 (line 3663), Remark 7.3.2 p.689 (line 3688), Cor 7.3.4 p.691 (line 3820), Thm 7.4.10 p.696 (line 4118). All agree with the README's page numbers.

**Adversarial table** (values computed in exact rational arithmetic unless noted):

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsWeakForm` (§1.1) | `1`; `Δ⁻¹`; `exp(j)`; `(j − a)⁻¹`; odd k with `−I ∈ Γ`; satisfiability | `C = 0`; `Δ⁻¹ = Q⁻¹ + ⋯` is `O(exp(2π Im τ))`; `exp(j)` grows like `exp(e^(2π Im τ))`, no C; `(j−a)⁻¹` has an interior pole; `f∣[k](−I) = (−1)^k f = −f`; probe closes holomorphy and invariance of `1` | holds | none |
| Root property (§1.2) | `(1 − 16t)^(1/16)`; `Σ tⁿ/2ⁿ` | 2-adic valuations `0, −1, −1, −3, −3, −4, −4, −7, −7`; 16th power `1 − 16t` integral; `1/2ⁿ` denominators unbounded | holds | none |
| Signed width, `H′` (§1.3) | cusp `1`, `g = [[1,0],[1,1]]` | `gT²g⁻¹ = [[−1,2],[−2,3]]`, `d = 3`; `−gT²g⁻¹` has `d = −3 ≡ 1`; `gT⁴g⁻¹ = [[−3,4],[−4,5]]`, `d = 5 ≡ 1`; `ad ≡ 1 mod 4` on `Γ(2)` since `bc ≡ 0 mod 4` | signed 2, strict 4, `L(H′) = 2` | none |
| lcm equality (§1.5) | `G = ±Γ₀(3)`, `H = Γ(2)` | widths of `G ∩ H`: `∞ ↦ lcm(1,2) = 2`, `0 ↦ lcm(3,2) = 6`; `L = 6 = lcm(3, 2)` | holds | none |
| p-scaling (§1.7) | second case | `C = (a/p, b; c, pd)`: `det = ad − bc = 1`; CDT's `(a/p, b; cp, d)`: `det = ad/p − bcp`; `γ̃ = C[[1, np],[0,1]]C⁻¹` | holds; source misprint | none |
| Wohlfahrt, KSV (§1.8) | `a = 2` | `T′TT′⁻¹ = [[0,1],[−1,2]]`; `T′⁻¹TT′ = [[2,1],[−1,0]] = L` | README factorization right | none |
| `modularLambda` (§2.1) | q-series; `λ(i)`; `T` | `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵ − 2400q⁶`; `λ(i) = 1 − λ(i)` gives `1/2`; `λ(τ+1) = −16q − 128q² − 704q³ = λ/(λ−1)`; Mathlib `eta_q n z = exp(2πi(n+1)z)` so `η(τ/2) = q^(1/24)∏(1−qⁿ)` | holds | none |
| `modularLambda_covering` (§2.2) | `−I`; a base set meeting `{0,1}` | `−I ∈ Γ(2)` acts trivially, fibres are `Γ(2)`-orbits; a trivialization base set must lie in the range `ℂ ∖ {0,1}` since the fibre type is nonempty | holds | none |
| Inverse series (§2.4) | degrees ≤ 6 | `q = x + 8x² + 84x³ + 992x⁴ + 12514x⁵ + 164688x⁶`; `x(q(x)) = x` | holds | none |
| Kummer root (§2.5) | `N = 3` | `x₃ = t − (8/3)t⁴ + (68/9)t⁷` | holds | none |
| Jacobi identity (§2.6) | through `q¹⁵`; `−I`; `[[1,0],[2,1]]` | `K₀(x(q)) − θ₃² = 0`; `d mod 4` is a homomorphism on `Γ(2)` (`cb′ ≡ 0 mod 4`); `χ₋₄(−1) = −1`; `θ₃(τ) = Θ(τ/2)` maps `Γ(2)` into `Γ₀(4)` | character required | none |
| Uniformizations (§2.7) | `F₂ = 1 − 2λ∘C` | `C(0) = i`, `C′(0) = 2i`, `λ′(i) = ic` with `c > 0`, `F₂′(0) = 4c`; `γ₂ = 4.376879 > 4`, `γ₃ = 2.581057 > 2.519842`; CDT's `2λ(C(−z)) − 1 = −F₂(−z)` | holds | none |
| Holonomy embedding (§3.4) | multipliers; cusp coordinate | `D ∈ ℤ ∖ 0`, `λ^m = (16p)^m ∈ ℚ(p)^×`; at a cusp of width `w ∣ 2N` above `λ = 0` the coordinate is `(q′)^(2/w) = (u·unit)^(2N/w)`; branches single-valued in `u` since `T^(2N) ∈ ±γ⁻¹Hγ` | holds | none |
| Finiteness (§3.5) | `N = 2`, `r = 0.95` | `|φ′(0)| = 0.95·4.376879/4 = 1.03951 > 1` | holds | none |
| Normal stabilizer (§3.7) | `R₂ = ℚ(λ)`, basis `{1}` | stabilizer `SL₂(ℤ)`, level 1; with `±Γ(2)`: level 2 | CDT gap, README fix | none |
| Rank bound (§3.8) | `r = 1 − A/(2N³)`; `N = 1` | `log|φ′(0)| ≥ A/N³ − A/(2N³) − O(N⁻⁶) ≥ A/(3N³)`; `log⁺|F^N/16| ≤ N log⁺|F|`; `log 2 > 0 = log 1` | holds with `log(2N)` | none |
| `nonabelian_ihara` (§4.1) | `A[[1,0],[Np,1]]A⁻¹`; `c(g)`; `N = 3, p = 2`; `G ⊇ Γ(N)`; `−I` | `= [[1,0],[N,1]] ∉ Γ₀(p)`; `AgA⁻¹ = [[a, pb],[c/p, d]] ∈ Γ(N)` since `p ∤ N`; `[Γ(3) : D] = 3`; `S` trivial; `−I ∉ Γ(N)` as `N ∤ 2`; `K ⊇ Γ(lcm(N, m))` from CSP, `±K ⊇ Γ(N)` from Wohlfahrt, so `K = Γ(N)` | holds without `−I ∈ G`, `G ≤ ±Γ(N)` | none |
| Triple surjectivity (§4.2) | `−γ`, `γ ∈ Γ(N)`, `γ ≡ −I mod p`; `T^N` | `−γ ≡ I mod p`, `≡ −I mod N`, so in the signed kernel, not in `Γ(Np)`; `T^N ↦ ((1,1), [[1,N],[0,1]])` generating `U` as `p ∤ N`; `Δ` a quotient of `B/U ≅ 𝔽_p^×` | holds on `D` | none |
| Intersection (§5.1) | `⟨G₂N, Γ(2Np)⟩` | level divides `L(G₂N) = 2N`, congruence, contains `−I`: Wohlfahrt gives `⊇ Γ(2N)` | holds | none |
| Degree (§5.4) | `N = 1, 2, 3` | `1/2` (not a degree), `4`, `12`; `32/π² = 3.2423 < 4` | holds, `N = 1` split | none |
| Leveraging (§5.5) | growth | `k ≥ cX/log X`; `log 2N ≤ log 2N₀ + X log 4`; `2^k` beats the right side | holds | none |
| `h₀` (§6.2) | q-series | `λ/(16η(τ/2)²) = q^(11/12)(1 − 6q + 33q² − 134q³ + 494q⁴ − ⋯)`; `11/12 = 22/24`, period `lcm(h, 24)` | holds | none |
| `unbounded_denominators` (§6.3) | `f = 0`; odd `h`; junk of `ofComplex`; odd k with `−I ∈ Γ′` | trivial; `h ↦ 2h` inserts zeros; `ofComplex` is a fixed value off `ℍ`, so periodicity there is tautological; conclusion forces `f = 0`, still true | holds | none |
| `algebraicInteger_unbounded_denominators` (§6.6) | trace matrix | `(σ(α_i))` has `det² = disc(K) ≠ 0`; `Tr(α_i a_n) ∈ ℤ` | holds given §6.5 | none |
| Galois conjugates (§6.5) | `ℚ̄((t))` vs `ℂ`; stabilizer | a ℚ̄-basis of ℂ stays independent over `ℚ̄((t))`; the orbit of `f` under `Gal(ℚ̄/K₀)` has size ≤ `deg P`, stabilizer open, fixed field finite | holds | none |
| Cube root of j (§6.7) | Q-series | `E₄/η⁸ = Q^(−1/3)(1 + 248Q + 4124Q² + 34752Q³ + 213126Q⁴)` | holds | none |
| Root test (§6.8) | `h`; `T`; `u^(1/5)`; `u^(1/24)` | `h = q − 24q² + 300q³ − 2624q⁴`; `h(τ+1) = −λ/(16(λ−1)²) ≠ h`; `u^(1/5) = 1 − (24/5)q + (348/25)q² − (4544/125)q³ + (52854/625)q⁴`; `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵ + 4q⁶`; `∏_{m odd}(1+q^m)^(−24)` equals `u` through `q⁹` | theta group, not `Γ₀(2)` | none |
| Fermat covers (§6.9) | `n = 8, 16, 3` | `v₂`: `1,1,2,1,2,2,3,1,2` (equals `s₂(m)`); `0,−1,−1,−3,−3,−4,−4,−7,−7`; `v₃`: `−1,−2,−4,−5,−6,−8,−9,−10,−13`; formula `(4 − a)m − v₂(m!) = (3 − a)m + s₂(m)` | `{1, 2, 4, 8}` | none |
| Three-point algebraicity (§7.1) | `N = 1`; `exp(1/x)` | `N ↦ 2N` because `F₁` is undefined (CMPartII §1.8 needs `N ≥ 2`); essential singularity has trivial monodromy, no meromorphic basis | holds | none |
| `IsVectorValuedForm` (§7.3) | `n = 0`; odd k; Jordan `ρ(T)`; quantifier order | `Fin 0 → ℂ` trivial; `F(−Iτ) = (−1)^k F` forces `F = 0`; `[[1,1],[0,1]]` excluded by semisimplicity; `∀ j a b C ∃ A B` as in CDT Def 7.3.1 | holds | none |
| `vectorValued_component_congruence` (§7.11) | `F = 1, ρ = 1, k = 0, h = 1, c = 1`; odd `h`; growth of `F_j∣g` | `qExpansion = (1, 0, …)` integers, conclusion true: non-vacuous; `F(hτ)` gives expansion in `q²`; `F_j∣[k]g` is `Γ(M)`-periodic, so strip growth gives `atImInfty` growth | holds | none |
| `vectorValued_effective_mason` (§7.12) | `n = 0`; `1 ⊕ σ` | `M = 1`; `(cτ+d)^k(ρ(γ)F − F) = 0` with `cτ + d ≠ 0`; values fixed while `ker ρ ⊉ Γ(M)` | holds; span hypothesis needed for `ker ρ` | none |
| Invisible summand (§7.13) | matrices | `σ(R)² = [[−3,−1],[7,2]]`, `σ(R)³ = I`, `σ(S)² = I`, `σ(T) = [[2,1],[7,3]]`, `det = −1`, trace 5, char. poly `X² − 5X − 1`, roots `(5 ± √29)/2` of product `−1`; `R = S⁻¹T = [[0,1],[−1,−1]]`, `R³ = I` | infinite image | none |
| Positive weight (§7.14) | `k = 12` | Wronskian `∝ h^(k+1)(dτ/dx)^(k(k+1)/2)`, `dx/dτ ≠ 0` on `ℍ`; order 13 | holds | none |
| Quasimodular closure (§8.2) | leading terms | `Δ = q² − 24q⁴`, `θ_qΔ = 2q² − 96q⁴`, `E₂Δ = q² − 48q⁴` | `θ_qΔ = 2E₂Δ` | none |
| Second-kind integral (§8.3) | exact series | `E₀ = 1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵ + 896q⁶ − 1920q⁷` from `₂F₁` and from `(θ₃θ₄⁴ + 4θ_qθ₃)/θ₃³`; `E₀ − (1 − 16x)K₀ − 8∫K₀ = 0` through `x¹⁵`; CDT's sign gives `−1` at `x = 0` | holds | none |
| Catalan quotient (§8.4) | exact series; weights | `1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵` both ways; term weights `1, 1, 0` (third term `−4/λ`) | identity holds; clause false | R01 |
| Deficient places (§§8.5–8.7) | `ρ = 1 ⊕ σ` | `(σ(T)^(2N) − 1)g = 0` with eigenvalues not roots of unity gives `g = 0`; no witness although `ker ρ` is not congruence | holds; CDT p.695 converse false | none |
| Cuspidal model (§9.1) | `N = 1`; bad fibre | `𝒳_cusp(1) = ℙ¹_{𝓞_K}`; the fibrewise component through `ε` differs from the globally connected smooth locus | holds as stated | none |

**Context and generality.** README and Lean agree: finite index on `Γ` in §6.3/§6.6 (`[Γ.FiniteIndex]`), `N ≥ 3`, `p` prime, `p ∤ N`, `G` normal of finite index in §4.1, every period `h ≥ 1` in §§6.3, 6.6, 7.11, 7.12 (CDT's `h = 2N`), a nonzero scalar `c` in §7.11. The conjugation `c` of `nonabelian_ihara` is pinned by the rational matrix identity `diag(p,1)·g·diag(p⁻¹,1)`, which is `AgA⁻¹` with the README's `A = diag(p, 1)`; the witness `[[1,0],[Np,1]] ↦ [[1,0],[N,1]]` recomputes.

**Library declarations opened at the pin** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa` per `lake-manifest.json`): `ModularForm` and `CuspForm` (`NumberTheory/ModularForms/Basic.lean` 72, 80), `SlashInvariantForm` (`SlashInvariantForms.lean` 34), `ModularForm.SL_slash` (`SlashActions.lean` 153), `OnePoint.IsBoundedAt` (`BoundedAtCusp.lean` 50), `UpperHalfPlane.IsBoundedAtImInfty` and `atImInfty` (`FunctionsBoundedAtInfty.lean` 45, 30), `CongruenceSubgroup.Gamma`, `Gamma0`, `Gamma1`, `IsCongruenceSubgroup`, `Gamma_normal` (`CongruenceSubgroups.lean` 41, 79, 131, 163, 54), `Subgroup.IsArithmetic` (a class) and `Subgroup.isArithmetic_iff_finiteIndex` (`ArithmeticSubgroups.lean` 102, 108), `UpperHalfPlane.cuspFunction` and `qExpansion` (`QExpansion.lean` 88, 171), `ModularForm.eta`, `eta_ne_zero`, `logDeriv_eta_eq_E2` (`DedekindEta.lean` 56, 113, 165; `eta_q n z = exp(2πi(n+1)z)`), `ModularForm.discriminant`, `discriminant_ne_zero`, `CuspForm.discriminant`, `discriminant_qExpansion_coeff_one` (`Discriminant.lean` 49, 122, 236, 211), `jacobiTheta`, `jacobiTheta_S_smul`, `jacobiTheta_T_sq_smul` (`JacobiTheta/OneVariable.lean` 29, 43, 37), `jacobiTheta₂`, `jacobiTheta₂_functional_equation` (`TwoVariable.lean` 48, 465), `EisensteinSeries.E2` (`E2/Defs.lean` 60), `Derivative.normalizedDerivOfComplex`, `serreDerivative`, `serreDerivativeMF` (`Derivative.lean` 38, 126, 308), `Derivative.normalizedDerivOfComplex_E₂` (`RamanujanFormula.lean` 131), `Subgroup.normalCore` (`Algebra/Group/Subgroup/Basic.lean` 718), `Subgroup.goursat_surjective` (`GroupTheory/Goursat.lean` 104), `Chebyshev.theta_ge`, `theta_le_log4_mul_x`, `pi_ge` (`NumberTheory/Chebyshev.lean` 495, 191, 806), `IsCoveringMapOn` (`Topology/Covering/Basic.lean` 197), `MeromorphicAt` (`Analysis/Meromorphic/Basic.lean` 36), `Module.End.IsSemisimple` (`LinearAlgebra/Semisimple.lean` 55), `UpperHalfPlane.ofComplex` (`UpperHalfPlane/Topology.lean` 143), `ModularForm.instGCommRing` (`Basic.lean` 542). Tau Ceti: `TauCeti.Subgroup.integerCuspWidth` and `integerCuspWidth_pos` (`NumberTheory/ModularForms/Cusps/Basic.lean` 143, 149), `CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (`CongruenceSubgroups/Basic.lean` 144), `TauCeti.char_neg_one_of_modFormCharSpace_ne_bot` (`Parity.lean` 134). All exist with the namespaces the README uses.

**Cross-roadmap citations resolved** (main `3b51055`, open heads of the 2026-11-05 index): ModularCurvesPartII #913 §§5.13, 5.14, 6.3, 6.4, 6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.10 (lines 1905, 1937, 2169, 2191, 2213, 2435, 3037, 3893, 3915, 3955, 3987, 4071; §15.2 is the unsigned `Γ(N) ⋆_{Γ(N)∩Γ₀(p)} A⁻¹Γ(N)A` for `N ≥ 3`, `p ∤ N`; §15.10 is the kernel bound into `H¹(Γ(N) ∩ Γ₁(p), 𝔽_q)` for any primes `p ∤ N`, `q`); DiophantineApproximationAndTranscendencePartII #1693 §§4.1–4.8 (lines 642–826; §4.5 carries `p` nonconstant without poles on `U`, `φ` holomorphic near the closed disc with `|φ′(0)| > 1`, bound `eJ(p∘φ)/log|φ′(0)|` on `W`; §4.6 gives `W = V` for integral `χ`; §4.8 is the `p = x + x⁴/32` counterexample); ConformalMappingPartII #1407 §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19 (lines 185, 197, 313, 361, 692, 728, 746, 1162; `C⁻¹(τ) = (τ − i)/(τ + i)`, cusp limit 1, `γ_N` formula, `E_N > 0`, `E_N ≤ C/N⁶`, mean growth `≤ C log(N/(1 − r))` for `p = x^N`); QSeriesPartitionsAndMockModularForms #1391 §8.1 (line 1157, `A_k(Γ, ρ)` for finite-index `Γ ≤ Mp₂(ℤ)` with exponential cusp growth and weakly holomorphic subspace) and §5.2 (line 816, η multiplier with `η(τ+1) = e^(πi/12)η`, `η(−1/τ) = √(−iτ)η`); AlgebraicModularFormsAndSerreWeights #928 §2.9 and §1.5 (R03); AutomorphicGaloisRepresentations #1007 §4.2 (line 1932, tempered at every finite place, `|t_v| ≤ 2q_v^((w+1)/2)` with `w = k − 2`); GeometryOfNumbersAndQuadraticArithmetic #851 §4.3 (lines 1783–1785, `qPochhammer`, `jacobiProduct`, the specialization `Σ(−1)^z q^(z²) = ∏(1−q^j)/(1+q^j)`); DiophantineApproximationAndTranscendence (main) §5.2 (`IsGFunction`, line 3029) and §5.3 (Galochkin condition, the G-function solution theorem, regularity at 0, lines 3078–3116); EtaleCohomologyFoundations (main) §F.0.2 (line 200); ModularForms (main) Layer 0 parity lemma (lines 100–101), Layer 4 (532), Layer 10 (1024), worked example `η²⁴ = Δ` with the `SL₂(ℤ)` transformation of η (1381); FuchsianOrbifolds (main) Layers 2–6 (lines 235–364, R04); BelyiMaps (main) Layers 6 and 9 (lines 1957, 2831); UniversalCovers (main) Stage 2 (line 99); ConformalMapping (main) L4 (line 128).

**Declared gaps.** All three are in `design/plan.json` `gaps` and in the README's supplier contracts with the same slugs. Each is precise (one sentence with hypotheses) and minimal: ModularCurvesPartII §5.14 at its head gives `X(ρ)_L ≅ X(N, ζ)_L` over a splitting field but no `ℚ`-rational split cusp with its Tate parameter; §11.4 covers `Γ₀(pⁿM)` fibres at `p > 3` only, not `X(N)` at primes dividing `N`; DiophantineApproximationAndTranscendence §5.3 has Galochkin's condition and the G-function solution theorem but neither Bombieri–André nor Katz. No gap has supplier `none`.

**Ownership.** `roadmaps grep` over main and the 445 open heads: no other roadmap states the λ covering, `IsWeakForm`, the nonabelian Ihara lemma or the unbounded denominators theorem. NoncongruenceModularForms (#1709) and AdelicImagesAndModularCurves (#1727) consume this roadmap for the geometric level, Wohlfahrt and the unbounded denominators theorem (NoncongruenceModularForms lines 50–53, 301–305, 1571–1580); neither is earlier in the merge order, so no citation here points at them. QSeries §8.1 is cited as the owner of the general weakly holomorphic carrier, and §7.3's vector-valued forms are declared as a variant of it. The board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated.

**Principles, shape, policy.** No route-specific shortcut, no re-planned roadmap (the λ covering is assigned to this family by ConformalMapping and BelyiMaps, and ModularForms does not build it), no upward or cyclic citation, no copied passage (locators only), no algorithm. Every definition (§§1.1, 1.2, 1.3, 2.1, 3.1, 3.2, 7.3, 7.6, 7.7, 8.1, 8.5, 9.1) has an API list and at least three discriminating Checks; every theorem has hypotheses in the sentence and a locator; every layer ends with Examples and Dependencies. No pull-request numbers, dates, process words, LaTeX delimiters or machine paths in the README (grep). All nine Lean names appear in the README; no README backtick claims a Lean name the file lacks. `sources.toml` records the three cited works; `Ihara1994` is settled `uncertified`.

**Source issues recorded by the author and reconfirmed by me**: Lemma 4.1.7 diagonal, the `A`-conjugation claim before Lemma 4.4.1, the signed reduction kernel, the `R₂Np` slip in Theorem 4.3.2, the `CN³ log N` form, the `θ₃²` character, the `E₀` sign, the `θΔ` factor, the `Γ₀(2)` level of `h`, Corollary 7.3.4, the p.695 converse, the rank-`6n` bundle, and the KSV factorization (listed below with my own verification).

## Not verifiable

- `Ihara1994`, Theorem 1 pp.248–249 and §4 p.252 (cited in §9.2): the volume is paywalled and recorded `uncertified`; the model hypotheses of Ihara's argument could not be checked against the text, so §9.2's proof route rests on the author's locator.
- ModularCurvesPartII §11.4 at primes dividing `N`: not supplied at the head; covered by the declared gap `udc-all-prime-cuspidal-model-of-full-level`, not checked further.
- DiophantineApproximationAndTranscendencePartII is a draft pull request (#1693); its Layer 4 was read at the head `df8c14a` and may move.

## Source issues

- **Misprint** in CDT25 at Lemma 4.1.7, proof, second case, printed page 654: the source writes the integral matrix as `(a/p, b; cp, d)` equal to `A⁻¹BA` times `diag(p, 1/p)`, which has determinant `ad/p − bcp`; it should be `(a/p, b; c, pd)` equal to `A⁻¹BA` times `diag(1/p, p)`, with translation exponent `np` unchanged; affects the proof.
- **Error** in CDT25 at §4.4, paragraph before Lemma 4.4.1, printed page 658: the source says conjugation by `A` is an automorphism of `⟨E, Γ(N)⟩ ∩ Γ₀(p)`; `[[1,0],[Np,1]]` goes to `[[1,0],[N,1]]`, outside `Γ₀(p)`; it should say the conjugation maps that group into `⟨E, Γ(N)⟩`; affects the proof.
- **Error** in CDT25 at §4.4, paragraph before Lemma 4.4.4, printed page 659: the source says the reduction map on `⟨E, Γ(N)⟩ ∩ Γ₀(p)` has kernel `Γ(Np)`; `−γ` with `γ ∈ Γ(N)`, `γ ≡ −I mod p` lies in the kernel but not in `Γ(Np)`; it should be stated on `Γ(N) ∩ Γ₀(p)`; affects the proof.
- **Misprint** in CDT25 at Theorem 4.3.2, proof, printed page 656: the source picks the noncongruence element in `R₂Np`; it should be in `R₂N`, where Theorem 4.3.1 applies; affects nothing.
- **Gap** in CDT25 at Theorem 4.3.2, proof, printed page 657: the source deduces the degree identity for the compositum from the intersection being `M₂N`; linear disjointness is needed, which holds because `M₂Np` is Galois over `M₂N` after extension to `ℂ`; affects the proof.
- **Gap** in CDT25 at Lemma 4.2.3, proof, printed page 656: the source says the intersection of the generator stabilizers has level exactly `2N` by Lemma 4.1.3, which gives only divisibility; for `R₂` with basis `{1}` the intersection is `SL₂(ℤ)`; it should intersect with `⟨E, Γ(2N)⟩`; affects the proof.
- **Misprint** in CDT25 at Proposition 3.0.1 and §6.3, printed pages 650 and 685: the bound `CN³ log N` is zero at `N = 1` while `[R₂ : ℚ(λ)] = 1`; it should read `CN³ log(2N)` or restrict to `N ≥ 2`; affects nothing.
- **Misprint** in CDT25 at (1.1.5), printed page 631, and Remark 7.2.3, printed page 688: the source calls `θ₃²` a weight-one form for `Γ(2)`; since `−I ∈ Γ(2)` it needs the character `χ₋₄(d)`; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed page 693: the source relates the second-kind integral to `K` with the sign `(16x − 1)K − 8∫K`, whose constant term is `−1`; it should be `(1 − 16x)K + 8∫K`; affects nothing.
- **Misprint** in CDT25 at Lemma 7.4.4, proof, printed page 692: with `θ = q d/dq` and `q = e^(πiτ)` the source writes `θΔ = E₂Δ`; it should be `θΔ = 2E₂Δ`; affects nothing.
- **Error** in CDT25 at (1.0.4), printed page 629: the source says `h = λ(1 − λ)/16` has level `Γ₀(2)`; `T` sends `q` to `−q` and `h` to `−λ/(16(λ − 1)²)`; the invariance group is the theta group `⟨Γ(2), S⟩`, a conjugate of `Γ₀(2)`; affects nothing.
- **Error** in CDT25 at Corollary 7.3.4, printed page 691: the source concludes `ker ρ ⊇ Γ(N)` from bounded denominators of all components; `F = (1, 0, 0)` with `ρ = 1 ⊕ σ`, `σ(S) = diag(1, −1)`, `σ(R) = [[2,1],[−7,−3]]`, has integral components and `σ(T)` of infinite order; it should assume the values of `F` span `ℂⁿ`; affects a stated result.
- **Error** in CDT25 at §7.4.8, printed page 695: the source says a non-archimedean deficient place exists whenever `ker ρ` is not congruence; for the `ρ = 1 ⊕ σ` above every element of `S_k(ρ)` has zero `σ`-part, so no place is deficient; it should restrict to representations with a component outside every congruence space; affects a stated result.
- **Gap** in CDT25 at Theorem 7.3.3, proof, printed page 690: the source asserts a free rank-`6n` bundle spanned by the translates `F_j|γ` and reduces to an irreducible local system; the translates are constant combinations of the components, so neither rank `6n` nor irreducibility follows; the continuation space of the component should be used; affects the proof.
- **Gap** in CDT25 at Remark 6.3.2, printed page 686: the source applies Theorem 1.0.1 to `Tr_{K/ℚ}(α_i f)`, which requires the Galois conjugates `f^σ` to be modular on finite-index subgroups; this is not justified there; affects the proof.
- **Misprint** in KSV10 at §3, line after equation (1), printed page 6 (arXiv v4): the source factors `L` as `T′ T^(a−1) T′⁻¹`; at `a = 2` that product is `[[0,1],[−1,2]]` while `L = [[2,1],[−1,0]]`; it should be `T′⁻¹ T^(a−1) T′`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4dd870cdbc74c59a6183cb55aca49fc91b0a1a86", "job": "REV-PKG-ModularFormsPartII", "model": "fable", "worker": "chris-x9"} -->
