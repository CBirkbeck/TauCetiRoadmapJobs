# Review of LocalAnabelianGeometryPartII (pull request #2867 at bcc9e15)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both P2. The formula for `π_{K∞}` on the generators in 4.1 has the sign of the source's generators, not of the generators the README's conventions fix, and several propositions of Layers 3–4 are quoted by number without hypotheses their proofs use (condition C in Prop. 3.5, the inequality of Prop. 5.3, the ranges of Props. 2.5–2.7 and 5.7). The new target 6.5 (the absolute form for every `p`) was recomputed and is sound. There are three small corrections and two format notes, none blocking. Layers 7–11 rest on [Abrashkin 2000], [Abrashkin 1998] and [Deligne 1984], which could not be read legally; that is left to the human reviewers.

## R01 (P2) — With the generators fixed in the conventions, `π_{K∞}(D^∞_{an})` is `−t^{ap^n − 1}dt`, not `t^{ap^n − 1}dt`

In 4.1 (line 552) the target reads "`π_{Ks}(u ⊗ α) = α du/u` and `π_{K∞}(D^∞_{an}) = t^{ap^n − 1}dt` for `n ≥ 0`". An implementer who takes the `D_{an}` of 3.1 (the images of 1.6 (b)) and the `π` of 4.1 proves the opposite sign and cannot close the target as written.

The conventions (lines 118–122) say that with `ψ_f(τ) = (τ⁻¹f)·f⁻¹`, `1 + D_a^{(r)}` is the image of `(τ_a^{(r)})⁻¹`, so that under class field theory `D_{an}` corresponds "to the inverse of `Σ_r σⁿ(α_r) ⊗ E(β_r, t^a)^{1/a}`". Then `dlog E(β, t^a)^{−1/a} = −Σ_{m ≥ 0} σ^m(β) t^{ap^m} dt/t`, and with `Σ_r σⁿ(α_r)σ^m(β_r) = δ_{m ≡ n mod N_s}` one gets `π_{Ks}(D^{(s)}_{an}) = −Σ_{i ≥ 0} t^{ap^{n + iN_s}} dt/t`, hence `π_{K∞}(D^∞_{an}) = −t^{ap^n − 1}dt`. For `k = 𝔽_p`: `D_{a0}` corresponds to `E(1, t^a)^{−1/a}`, whose `dlog` is `−(t^a + t^{ap} + ⋯)dt/t`. The source has the plus sign (Abrashkin2010, journal text, lines 655–668) because its generators are the units `E(β_i, t^a)^{1/a}` themselves, its `ψ_f` having no inverse; the sign change of 1.6 (b) was carried to the conventions, 1.6 and 7.2 but not to 4.1.

Nothing downstream depends on the sign: (A1) reads `π' ∘ f_ur = f_∞ ∘ π`, and Props. 3.1–3.4 are unchanged when `π` and `π'` both change sign. The smallest repair is to write `π_{K∞}(D^∞_{an}) = −t^{ap^n − 1}dt` (or to define `π_{Ks}(u ⊗ α) = −α du/u` and say why), and to add the rank-one computation above as a Check, since it tells the two normalizations apart.

## R02 (P2) — Several propositions of Layers 3 and 4 are stated without hypotheses that the source's statements carry and its proofs use

These bullets are targets, and as written they claim more than the cited propositions prove. (Line numbers are of the journal text of Abrashkin 2010.)

- Prop. 3.5 (4.4, line 592): "admissibility passes from `g_{LL'}` to `f_{KK'}`". The source assumes the systems comparable and `g_{LL'}` subject to condition C (Abrashkin2010 lines 884–885); C is used for (3.8) and for the equality of ramification indices in (A3) (lines 970–973). The next bullet (Prop. 3.6) does name C, so a reader infers that 3.5 does not need it.
- Prop. 5.3 (3.3, line 511): "each `adm₂` element occurs in exactly one `σ^mℱ_γ(v)`". The source requires `v/p^{N₀ − n} ≤ d(v) = min{v − a : a ∈ ℤ, a < v}`, `n = min(n₁₂, n₂₁)` (lines 1487–1491), and applies it only for `v ∈ ℕ`, `v < p^{N₀}`, `n₁ = n₂ = 0` and for `v = c + 1/p`, `c < p^{N₀−2}` (lines 1495–1496). Without it a product `Δ_{a₁n₁}Δ_{a₂n₂}` can have both weights `p^s(a₁ + a₂/p^{n₁₂})` and `p^s(a₁/p^{n₂₁} + a₂)` at least `v`.
- Prop. 2.7 (3.2, lines 491–492): the source assumes `a ∈ ℤ(p)`, `w₀ ≤ ap^{N₀}`, and `w₀ ∈ pℕ`, `w₀ > a + 1` for `p ≠ 2`, `w₀ ∈ 4ℕ`, `w₀ > a + 2` for `p = 2` (lines 548–554).
- Props. 2.5 and 2.6 (line 489): `w₀ + 1 ≤ p^{N₀}` with the normalizations of rows 1 and 2 (`p ≠ 2`); `w₀ = 4M`, `w₀ + 1 < 2^{N₀}` with rows 1 and 3 (`p = 2`) (lines 488–492, 512–515).
- Prop. 5.7 (lines 516–518): the source assumes `α_{110}(f) = 1`, `α_{aa'0}(f) = 0` for `a < a' < a + r < p^{N₀−2}`, and `b₁ + δ(p) < p^{N₀−2}` (lines 1622–1626).

The repair is to add the hypotheses to each bullet, as 3.3 already does for Props. 5.4, 5.6 and 5.9.

## C01 — The Kummer field of norms for general `K` is supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, which has no entry in the supplier contracts

11.1 cites "FieldOfNorms' Kummer worked example and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3", but the supplier contracts have no subsection for the latter and the `Needs` line of Layer 11 omits it. The contract under FieldOfNorms says its worked example is "in the general form `K(π_K^{1/p^∞})`"; at its head that example is `K = ℚ_p`, `π = p`, `p` odd, and says itself that it is a case of §R07.4.3. What Layer 11 uses for `K ∋ ζ_M` (the tower is strictly APF, `X_K(K̃) ≅ k((t))` with `t = (π_s)`) is §R07.4.3's statement. Add a subsection "From FiniteFlatGroupsAndIntegralPadicHodgeTheory" with §R07.4.3, name it in Layer 11's `Needs`, and drop "in the general form" from the FieldOfNorms line.

## C02 — The Lean form of 6.5 has no hypothesis on the residue characteristics, although its docstring and the README state one

`exists_ringEquiv_conj_of_filtered_absoluteGaloisGroup` mentions neither `p` nor `[CharP 𝓀[K] p]`, so the section variables are not part of its type: it is stated for any two nonarchimedean local fields. The docstring and 6.5 say "of residue characteristic `p`". The wider statement is true: for small `v > 0`, `G_K(v)` is wild inertia, a nontrivial pro-`p` group, so a filtered isomorphism forces equal residue characteristics and the extra case is vacuous. Say so in one clause of the docstring (or of 6.5), so that the prose and the signature agree.

## C03 — Shafarevich's exponential `E(β, X)` is attributed to the wrong paper

The references give "I. R. Shafarevich, *On p-extensions*, Mat. Sb. **20** (1947) — the exponential `E(β, X)` and the basis of principal units". The source the README follows cites, for this exponential, Shafarevich's *A general reciprocity law*, Mat. Sbornik **26** (1950), 113–146 (Abrashkin2010 lines 313–314 and 2000). Replace the entry, or keep the 1947 paper only for what it is cited for.

## N01 — `classTwoMul` and `classTwoMul_assoc` serve no headline stated in the file; they are marked as a check, and could instead stand as a Check of 0.3. Line 73 of `Suggested.lean` is 101 characters long.

## N02 — In 9.1, `RF(i)(τ) = i⁻¹ ∘ τ ∘ i` for `i(K_1) ⊆ K_2` maps `G_{K_2}` to `G_{K_1}`, so `RF` is contravariant; "the functor `RF`" would read better as "the contravariant functor".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.3 decomposition, pairing, reciprocity vs Abrashkin2010 lines 283, 290–334 | `ct^{−ap}`; `p = 3`, `k = 𝔽₉`; `Res` | `σ(σ⁻¹(c)t^{−a}) = ct^{−ap}`; traces `±2, 0, ±√−2`, never `1`; `Res(α_s t^{−b}·dlog E(β_r,t^a)^{1/a}) = α_sβ_rδ_{ab}` | agrees; printed p. 7 |
| 1.6 vs lines 241–289 | `τ ↦ (τ⁻¹f)f⁻¹`; `τ ↦ (τf)f⁻¹`; `k = 𝔽_p` | `ψ(τ₁τ₂) = τ₂⁻¹(ψ(τ₁))ψ(τ₂) = ψ(τ₁)ψ(τ₂)`; second is an anti-homomorphism; `τ₀⁻¹f₀ − f₀ = −1` | sound |
| 2.4 Theorem B′ vs lines 1080–1083, 1110–1192 | hypotheses; `K₁`; criterion bound | `C ∈ ℕ`, `M ≥ 0`, `v₀ > 0`; one corner `(r*, r*)`; `qv₀ − r*(q − 1)` | agrees; printed pp. 27–30 |
| 2.5 Theorem B vs lines 1073, 1096–1105 | `S` not an up-set; `v = 0` | `inf{w : [w,∞) ⊆ S} > 0` gives B′'s hypothesis, then left continuity contradicts; Prop. 4.2 at `0` excludes `D₀` | README's `v > 0` and induction correct |
| 2.1 `F_γ` vs lines 1042–1054 | `γ = 1, 2` (`p` odd, `p = 2`), `1 + 1/p` | `D_{10}`; `2D_{20} − D_{10}²`; `2D_{11} − D_{10}²`; `−[D_{10}, D_{1,−1}]`; `n₂ = v_p(γ)` forced | Checks true |
| 2.2 vs FunctionFieldArithmetic 4.4 | length `M`, coefficient `c_a` | `a p^{M−1−v(c_a)} < v` iff `v(c_a) ≥ M − s(a, v)`; `v ≤ 1` gives `s = 0`: inertia | consistent |
| 3.1 vs lines 339–446 | `Aut K`; `Aut_adm`; `Fr(t)^*` | `Aut⁰K` normal, `⟨Fr(t)⟩` of order `N₀`; `bp^m < a`, `−N₀ < m ≤ 0`; `δ_n ↦ δ_{n−1}` | agrees; printed pp. 8–10 |
| 3.2 Check, `η(t) = αt` | Prop. 2.1 | `η⁻¹(t)^{−a} = α^a t^{−a}`, `α_{aa0}(η^*) = α^a`; so 5.9 needs `η(t) = α⁻¹t` | true |
| 3.3 Props. 5.3, 5.7; 3.2 Props. 2.5–2.7 | hypotheses in the source | `v/p^{N₀−n} ≤ d(v)`; `b₁ + δ(p) < p^{N₀−2}`; `w₀ ≤ ap^{N₀}`, `w₀ ∈ pℕ` | R02 |
| 4.1 `π_{K∞}` vs lines 643–668 | `k = 𝔽_p`, `D_{a0} ↔ E(1,t^a)^{−1/a}` | `dlog = −(t^a + t^{ap} + ⋯)dt/t`; source generators `E^{1/a}` give `+` | R01 |
| 4.4 vs lines 845–1006 | Prop. 3.5; Prop. 3.6 | 3.5 assumes comparable and C; C used at lines 970–973; 3.6 as stated | R02; printed pp. 20–25 |
| 5.0 | `L` Galois; `L` finite; `N ⊆ G_L` | closure is pro-`p` by pro-`p`; open in pro-`p` is subnormal; `(G_E(v)N ∩ G_L)/N = (G_E(v) ∩ G_L)N/N` | sound |
| 5.2 | `K/E` finite in `E(p)` | restricted step `Γ_K(p)^{(ψ_{K/E}(v))}`; `ψ_{K'} = ψ_K` by FilteredLocalGaloisGroups 1.5 | sound |
| 5.4 Theorem A vs lines 76–80 | hypotheses; `p = 2` | finite residue fields, all `v ≥ 0`, `μ̄(E) = E'`, `g = μ̄^*`; no restriction on `p` (line 95) | agrees; printed p. 2 |
| 5.5 uniqueness | `ν` centralizing `Γ_K(p)` | `ν(x)/x ∈ μ_{q−1}`; on `U^{(1)}`: `U^{(1)} ∩ μ_{q−1} = 1`; `ν(π) = π`, `ν = id` | sound |
| 5.3 vs lines 1762–1826 | compositions in usual order | `g⁰ = Fr^{n_s*} ∘ g`, `h_s = ξ_s^* ∘ g⁰`, `μ = Fr(t_{K'})^{−n̄} ∘ η` | agrees |
| 6.5 absolute form; source line 81 | `μ' = ḡ(τ)⁻¹μ_Fτ`; `F₁ ⊆ F₂`; `p = 2` | `μ'(F) = F'`; `μ'xμ'⁻¹ = g_F(x)`; 5.5 gives `μ_Fτμ_F⁻¹ = ḡ(τ)`; no `½` used | sound |
| Lean Theorem A | `K = K'`, `g = id`; mixed characteristics | `e = id`, `τ' = τ`; hypothesis impossible by 5.1, vacuous; `τ'` determined by `e`, `τ` | says 5.4/6.4 |
| Lean absolute form | residue characteristics `p ≠ ℓ` | `G_K(0+)` nontrivial pro-`p`, image nontrivial pro-`ℓ`: no such `G`; no `CharP` binder in the type | true; C02 |
| Lean Witt, 1.1 | `K` algebraically closed; `K = 𝔽_p`; library | `cd = 0`; `cd ℤ_p = 1`; `H¹(N, 𝔽_p) = 0` gives injective inflation; library has only the `p`-invertible case | true, not duplicated |
| 0.3 class-two law | commutator; sum; rank one | `x∘y∘(−x)∘(−y) = [x, y]`; `x∘y∘(−½[x, y]) = x + y`; `log(1 + X) ∉ ℤ_pX` | sound |
| 6 Check, `E = ℚ_p`, `p` odd | basis `x, y` | `F/⟨⟨y⟩⟩ ≅ ℤ_p ≅ F/I`, so `I = ⟨⟨y⟩⟩`; swap sends `I` to `⟨⟨x⟩⟩ ∌ y` | true |
| 7.1 special bases | normalization vs conventions | literal basis vector divided by `a`; `ψ^ab(τ) = −τ` in 7.2 | consistent; source not read |
| 7.3 `ℱ^{(v)}_γ`, Checks | `v = 1`; `v = 2 + 1/p`; `F_{a,−1}` | no `p^{n₁}a₁ < 1`; only `(a₁, n₂, a₂) = (2, −1, 1)`: `−2[Δ_{20}, Δ_{1,−1}]`; extra `−a[D_{a0}, D₀]` | Checks true; source not read |
| 7.4, 9.2 | README-internal | 9.2 is 6.5; 7.4's bound `N₀ ≥ 2 log_p(pv₀)` matches Layer 8's with `p²v₀` | consistent; source not read |
| 10.1, Checks of 10 | `e = 1`; `ℚ_p(ζ_p)`; `ℚ_p(ζ_{p²})`; `x ↦ λx` | `ε = 0`; `𝒪/p = 𝒪/𝔪^{p−1}`; upper jumps `0, 1`, lower `0, p − 1`; `μ^N = λ` has order `> N` | true; source not read |
| 11.1 Lemma 1 of §6.2 | Kummer `K_M/K`; `K = ℚ_p(ζ_p)` | jumps `e_K(p/(p−1) + i − 1)`; `ψ(u_M) = e_Kp^M/(p−1)`; `ψ(a_K) = e_Kp^{M+1}/(p−1) = v_K`; `ψ(2p−1) = p²` | consistent |
| 11.2 level, 11.3, 11.5 | `r(K_M)`; `v_K`; `L = ℚ_p(ζ_M)` | `⌈(p−1)/p · e_{K_M}p/(p−1)⌉ = e_{K_M} = w_K`; `p^{2M} ∣ v_K`; `v_L(p^{1/(p−1)}) = p^{M−1}` | consistent |
| 11.4 Checks | `p = 3`, `M = 2`; `M = 1` | `(e, v, a, w, f) = (6, 81, 21, 54, 12)`; `(2, 9, ·, ·, 8)`, `𝒪_K mod 3^{1/2} = k` | true |
| One-tactic probes | `simp`, `rfl`, `infer_instance`, `exact?`, `aesop` on the three `sorry`s | none closes any | no padding |

- Source locators checked against the text: 24 in the journal text of Abrashkin 2010 (the Numdam copy; printed page = file page − 1; every line number in this report is a line of that text, not of the arXiv version the manifest records): Thm. A and p. 2; §§1.2–1.4, Props. 1.1–1.3; §§2.1–2.3, Props. 2.2–2.7; §§3.1–3.3, Props. 3.3–3.6, §§3.5–3.7; Props. 4.1–4.3, `F_γ`, Thms. B, B′, §4.3, Lemma 4.4, Prop. 4.5; §5 start (p. 35), `ℱ_γ(v)`, Props. 5.2–5.9; §§6–7; the reference list. All agree except as R02 and C03 say.
- Library declarations opened at the pin: 17 (`upperRamificationGroup` `Herbrand/Basic.lean` 421; `RamificationIndexDomain` `RamificationGroup.lean` 86; `absoluteGaloisGroupProP`, `absoluteGaloisGroupProPQuotientMap` `AbsoluteGaloisGroup/ProP.lean` 28, 33; `cohomologicalDimensionAt` `CohomologicalDimension/Basic.lean` 146; `cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_not_mu` `ProP/Free.lean` 100; the pointed Serre theorem `Free/Pointed/Serre.lean` 98; `freeProCPointed` `Free/Pointed/Basic.lean` 146; `IsProP.presentation` `Free/Pointed/Presentation.lean` 163; `map_proPKernel_eq` `MaximalProP.lean` 206; `artinMap_congr` `Local/ArtinMap.lean` 397; `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP` `ProP/Rank.lean` 51; `completedGroupAlgebra` `CompletedGroupAlgebra/Basic.lean` 145; `FinitePadicExtension` `AbsoluteRamificationIndex.lean` 64; `unramifiedExtension` `Unramified/Existence.lean` 85; `ConvergesToOne` `Generation.lean` 104; `finiteGroupClassP` `FiniteGroupClass.lean` 262). No Magnus algebra, Witt lifting or truncated valuation ring in the pinned libraries.
- Cross-roadmap citations resolved at main or at the open heads: FilteredLocalGaloisGroups 1.2–1.5, 2.1, 2.2, 2.4; FieldOfNorms 0.2, 0.6, 1.4, 2.2, 2.3, 3.3, 4.3, 4.4 and the Kummer example; FunctionFieldArithmetic 3.1, 3.2, 4.3, 4.4 with the eight declaration names; ClassFieldTheory Layer 7 (`localAbsoluteUpperRamificationGroup`, `map_artinMap_unitFiltration_eq_upper`, `artinMap_congr`); RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2; PadicExtensionFamilies 2.1–2.2; GeometricTopology §4.12.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3. All exist where cited; C01 concerns what two of them are cited for.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `sorry` warnings, nothing else. Elaborated types of the six declarations compared with the README: Theorem A keeps both `CharP` binders on the residue fields; the absolute form has none (C02); `[Invertible (2 : R)]` is present in `classTwoMul` and `classTwoMul_assoc`; nothing changed. The copy of `localAbsoluteUpperRamificationGroup` agrees with ClassFieldTheory's `Suggested.lean` and is under this roadmap's namespace; the pinned Tau Ceti does not have it.
- No change outside the roadmap folder. The roadmap is new, so there is no README on main to compare. The pull request's title and description agree with the head (layers, suppliers, the five Lean declarations, the scope decisions).
- The three findings of the review of `1a52af2` are repaired: 6.5 added and `p ≠ 2` dropped from the absolute form; the dependence of `F_{a,−N}` on `N` stated with its Check; the bracket sum of `F_γ` said to be finite. Its corrections and notes are addressed.
- Wording: 15 passages set beside the journal text of Abrashkin 2010 (1.3, 1.4, 1.5, 1.6, 2.1, 2.4, 2.5, 3.1, 3.3, 4.1, 4.3, 4.4, 5.3, 6.3, the Lean docstring of Theorem A).

Overlap check: read FieldOfNorms, FilteredLocalGaloisGroups, LocalAnabelianGeometry, HigherLocalClassFieldTheory, FunctionFieldArithmetic, RamificationOfCompleteDiscretelyValuedFields, PadicExtensionFamilies, ProfiniteProPGroups; the absolute upper filtration is ClassFieldTheory Layer 7's (copied in `Suggested.lean` under this namespace only to state the headlines); the finite Magnus levels are GeometricTopology §4.12.1's; the Kummer field of norms is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3's; lifting of isomorphisms and cofinal systems are FieldOfNorms 4.3–4.4's; nothing else shared.

Source independence: 15 passages compared with 1 source (the journal text of Abrashkin 2010), none shared beyond formulas and forced statements; largest share Abrashkin 2010, 48 of about 126 locators; contents compared with Abrashkin 2010: independent at the level of layers (Layer 1 ↔ §1, 2 ↔ §4, 3 ↔ §§2 and 5, 4 ↔ §3, 5 ↔ §6, 6 ↔ §7: reordered and merged, the order forced by 3.3 needing Theorem B and 4.3 needing Prop. 2.7). [Abrashkin 2000] (39 locators), [Abrashkin 1998] and [Deligne 1984] could not be read.

Research link: the headline targets are Theorem A of Abrashkin (2010) and Theorems A′ and B of Abrashkin (2000), the local analogue of the Grothendieck conjecture, with Deligne's (1984) truncated equivalence as input; they extend Mochizuki (1997). Rests on Abrashkin 2010, printed pp. 2–3, and the README.

## Not verifiable

- [Abrashkin 2000] (sampled targets 7.1, 7.3, 7.4, 9.2; all of Layers 7–9 and 11; the formula for `F_{γ, −N}`; the source corrections on the special basis, on p. 152 and on the Corollary of §0): the publisher's page refuses access and no open copy was found. An arXiv identifier tried for it resolved to an unrelated paper; nothing relies on it.
- [Deligne 1984] (sampled target 10.1; all of Layer 10; Remark A.6.3 in 11.5): no open copy found. The filtration statement of 10.4 is the README's own argument and was not checked against 1.5.1, 1.5.4, 2.8 and 3.5.
- [Abrashkin 1998] (the proof targets of 7.3): the journal's page offers no readable text.
- [Lazard 1965], [Koch 1970], Serre's two books (0.2, 1.1): not opened; the statements cited are standard.

Automatic checks set aside as false positives: the scan for TeX syntax flagged the displayed formula for `F_γ` in 2.1, which is inside a fenced block indented under a list item, and two code spans that wrap across a line break (the Check on `𝒪_F/p` in Layer 10 and the transport formula in 11.3). The scan for dropped binders flagged `[Invertible (2 : R)]`, which is present in both elaborated types. The scan for unknown names flagged `GroupFiltration.herbrandPsi`, which is FilteredLocalGaloisGroups 1.4's name at its open head.

## Source issues

- **Error** in Abrashkin2010 at Theorem B, Prop. 4.2 and Remark a) of §4.2, printed pp. 26–27: the source says the two filtrations agree modulo `𝒥³` for all `v ≥ 0`, with `F₀ = D₀`; it should be for `v > 0`, since at `v = 0` Prop. 4.2 excludes `D₀`; affects a stated result.
- **Gap** in Abrashkin2010 at the deduction of Theorem B from Theorem B′, printed p. 27: the source takes `v₀ = inf S` and applies B′, which needs every `v > v₀` in `S`; it should take the infimum of the `w` with `[w, ∞) ⊆ S`; affects the proof.
- **Misprint** in Abrashkin2010 at Prop. 4.3 a), printed p. 26: the source's sentence defines no ideal; it should be that modulo `𝒥³` the ideal of level `v₀` is the smallest closed `σ`-invariant ideal containing the truncated elements; affects a stated result.
- **Misprint** in Abrashkin2010 at §5.1, printed p. 36: the source sums the products in `ℱ_γ(v)`, `γ = ap^m`, over all `n ≥ 0`; it should be `0 ≤ n < m`, the terms with `n = m` being inside `Δ_{am}`; affects a stated result.
- **Misprint** in Abrashkin2010 at the definition of locally analytic systems, §3.6, printed p. 20: the source takes `η_s` in `Iso⁰(K, K')`; it should be `Iso⁰(K_s, K'_s)`, as the proof of Prop. 3.4 speaks of conjugates of `η_s` over `K`; affects a stated result.
- **Misprint** in Abrashkin2010 at the proof of Prop. 5.9, printed p. 41: the source normalizes by `η` with `η(t) = α_{110}(f)t`; it should be `η(t) = α_{110}(f)⁻¹t`, since Prop. 2.1 gives `α_{aa0}(η^*) = α^a` for `η(t) = αt`; affects the proof.
- **Misprint** in Abrashkin2010 at the proof of Lemma 4.4, printed pp. 28–29: the source's first congruence has exponent `qp^M` on `t₁`; it should be `q`, the case `s = 0` of the next display; affects nothing.
- **Misprint** in Abrashkin2010 before Prop. 6.1, printed p. 45: the source defines `μ_{LL'}` with the Frobenius of `t_{K'}`; it should be that of `t_{L'}`, as three lines earlier; affects nothing.
- **Misprint** in Abrashkin2010 at reference [3], printed p. 49: the source gives the pages of the 2000 paper as 3–43 of volume 11; it should be 133–175; affects nothing.

## For the human reviewers

- **Not tested.** [Abrashkin 2000] (39 of about 126 locators, Layers 7–9 and 11), [Deligne 1984] (Layer 10) and [Abrashkin 1998] could not be read legally: their locators, the wording and the arrangement against their contents were not checked.
- **Licence / sources.** The README corrects printed statements of [Abrashkin 2000] (special basis by the factors `a`, conventions line 125; the Corollary of §0 for `K, K' ∈ 𝒜_M`, 11.5; a sign on p. 152, Layer 7 Checks). These could not be checked against the text.
- **Scope.** The absolute form for `p = 2` (6.5) is the README's own deduction from Theorem A and 5.5; [Abrashkin 2010, p. 2] asserts it without proof and no refereed source read here proves it.
- **Scope.** The README declines Wintenberger's 1980 full faithfulness on `p`-adic Lie extensions as "not in print" (scope section, line 1183) and routes Layer 6 through FieldOfNorms 4.3 instead.
- **Arrangement inside layers.** Layers differ from the sources' sections, but 4.1–4.4 follow Abrashkin 2010 §§3.1–3.7 in order, 8.2 lists Abrashkin 2000 §§4.2–4.12 one by one, and 10.1–10.4 follow Deligne §§1–3.
