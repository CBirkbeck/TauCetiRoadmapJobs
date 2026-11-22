# Review of LocalAnabelianGeometryPartII (pull request #2867 at 7315142)

**Verdict:** needs changes

**Summary.** Changes are still needed: the roadmap folder at this head is identical, line for line, to the one the previous review read (`bcc9e15`; the branch was only moved onto a newer main), so its two findings (both P2) stand unrepaired. The formula for `π_{K∞}` on the generators in 4.1 has the sign of the source's generators, not of the generators the README's conventions fix, and several propositions of Layers 3–4 are quoted without hypotheses their source statements carry. The three small corrections and two format notes of that review also stand; none blocks. Layers 7–11 rest on [Abrashkin 2000], [Abrashkin 1998] and [Deligne 1984], which could not be read legally; that is left to the human reviewers.

## R01 (P2) — With the generators fixed in the conventions, `π_{K∞}(D^∞_{an})` is `−t^{ap^n − 1}dt`, not `t^{ap^n − 1}dt`

In 4.1 (line 552) the target reads "`π_{Ks}(u ⊗ α) = α du/u` and `π_{K∞}(D^∞_{an}) = t^{ap^n − 1}dt` for `n ≥ 0`". An implementer who takes the `D_{an}` of the conventions and the `π` of 4.1 proves the opposite sign and cannot close the target as written.

The conventions (lines 118–123) say that with `ψ_f(τ) = (τ⁻¹f)·f⁻¹`, `1 + D_a^{(r)}` is the image of `(τ_a^{(r)})⁻¹`, so that under class field theory `D_{an}` corresponds "to the inverse of `Σ_r σⁿ(α_r) ⊗ E(β_r, t^a)^{1/a}`". Now `dlog E(β, t^a)^{1/a} = Σ_{m ≥ 0} σ^m(β) t^{ap^m} dt/t`, and `Σ_r σⁿ(α_r)σ^m(β_r)` is `1` for `m ≡ n mod N_s` and `0` otherwise, so with the inverse one gets `π_{Ks}(D^{(s)}_{an}) = −Σ_{i ≥ 0} t^{ap^{n + iN_s}} dt/t`, hence `π_{K∞}(D^∞_{an}) = −t^{ap^n − 1}dt`. For `k = 𝔽_p`: `D_{a0}` corresponds to `E(1, t^a)^{−1/a}`, whose `dlog` is `−(t^a + t^{ap} + ⋯)dt/t`. The source has the plus sign (Abrashkin2010 lines 580–599) because its generators are the units `E(β_i, t^a)^{1/a}` themselves (Abrashkin2010 lines 265–273), its `ψ_f` having no inverse; the sign change was carried to the conventions, 1.6 and 7.2 but not to 4.1.

Nothing downstream depends on the sign: (A1) reads `π' ∘ f_ur = f_∞ ∘ π`, and Props. 3.1–3.4 are unchanged when `π` and `π'` both change sign. The smallest repair is to write `π_{K∞}(D^∞_{an}) = −t^{ap^n − 1}dt` (or to define `π_{Ks}(u ⊗ α) = −α du/u` and say why), and to add the rank-one computation above as a Check, since it tells the two normalizations apart.

## R02 (P2) — Several propositions of Layers 3 and 4 are stated without hypotheses that the source's statements carry and its proofs use

These bullets are targets, and as written they claim more than the cited propositions prove. (Line numbers are of the arXiv text of Abrashkin 2010.)

- Prop. 3.5 (4.4, line 592): "admissibility passes from `g_{LL'}` to `f_{KK'}`". The source assumes the two systems comparable and `g_{LL'}` subject to condition C (Abrashkin2010 lines 795–796), and its proof uses C for the equality of ramification indices (line 884). The next bullet (Prop. 3.6) does name C, so a reader infers that 3.5 does not need it.
- Prop. 5.3 (3.3, line 511): "each `adm₂` element occurs in exactly one `σ^mℱ_γ(v)`". The source requires `v/p^{N₀ − n} ≤ d(v) = min{v − a : a ∈ ℤ, a < v}`, `n = min(n₁₂, n₂₁)` (lines 1369–1373), and applies it only for `v ∈ ℕ`, `v < p^{N₀}`, `n₁ = n₂ = 0` and for `v = c + 1/p`, `c < p^{N₀−2}` (lines 1375–1376).
- Prop. 2.7 (3.2, lines 491–492): the source assumes `a ∈ ℤ(p)`, `w₀ ≤ ap^{N₀}`, and `w₀ ∈ pℕ`, `w₀ > a + 1` for `p ≠ 2`, `w₀ ∈ 4ℕ`, `w₀ > a + 2` for `p = 2` (lines 490–492).
- Props. 2.5 and 2.6 (line 489): `w₀ + 1 ≤ p^{N₀}` with the normalizations of rows 1 and 2 (`p ≠ 2`, lines 437–440); `w₀ = 4M`, `w₀ + 1 < 2^{N₀}` with rows 1 and 3 (`p = 2`, lines 457–460).
- Prop. 5.7 (lines 516–518): the source assumes `α_{110}(f) = 1`, `α_{aa'0}(f) = 0` for `a < a' < a + r < p^{N₀−2}`, and `b₁ + δ(p) < p^{N₀−2}` (lines 1498–1504).

The repair is to add the hypotheses to each bullet, as 3.3 already does for Props. 5.4, 5.6 and 5.9.

## C01 — The Kummer field of norms for general `K` is supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, which has no entry in the supplier contracts

11.1 (line 1050) cites "FieldOfNorms' Kummer worked example and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3", but the supplier contracts have no subsection for the latter and the `Needs` line of Layer 11 omits it. The contract under FieldOfNorms (line 1258) says its worked example is "in the general form `K(π_K^{1/p^∞})`"; at its head that example is `K = ℚ_p`, `π = p`, `p` odd, and says itself that it is a case of §R07.4.3. Add a subsection "From FiniteFlatGroupsAndIntegralPadicHodgeTheory" with §R07.4.3, name it in Layer 11's `Needs`, and drop "in the general form" from the FieldOfNorms line. (The pull request's description already lists this supplier.)

## C02 — The Lean form of 6.5 has no hypothesis on the residue characteristics, although its docstring and the README state one

`exists_ringEquiv_conj_of_filtered_absoluteGaloisGroup` mentions neither `p` nor `[CharP 𝓀[K] p]`, so it is stated for any two nonarchimedean local fields, while the docstring and 6.5 say "of residue characteristic `p`". The wider statement is true: for small `v > 0`, `G_K(v)` is wild inertia, a nontrivial pro-`p` group, so a filtered isomorphism forces equal residue characteristics and the extra case is vacuous. Say so in one clause of the docstring (or of 6.5), so that the prose and the signature agree.

## C03 — Shafarevich's exponential `E(β, X)` is attributed to the wrong paper

The references (line 1353) give "I. R. Shafarevich, *On p-extensions*, Mat. Sb. **20** (1947) — the exponential `E(β, X)`". The source the README follows cites, for this exponential, Shafarevich's *A general reciprocity law*, Mat. Sbornik **26** (1950), 113–146 (Abrashkin2010 lines 269 and 1866). Replace the entry, or keep the 1947 paper only for what it is cited for.

## N01 — `classTwoMul` and `classTwoMul_assoc` serve no headline stated in the file; they are marked as a check, and could instead stand as a Check of 0.3. Line 73 of `Suggested.lean` is 101 characters long.

## N02 — In 9.1 (line 924), `RF(i)(τ) = i⁻¹ ∘ τ ∘ i` for `i(K_1) ⊆ K_2` maps `G_{K_2}` to `G_{K_1}`, so `RF` is contravariant; "the functor `RF`" would read better as "the contravariant functor".

## Previous findings

- R01 — not repaired: line 552 still reads "`π_{K∞}(D^∞_{an}) = t^{ap^n − 1}dt` for `n ≥ 0`", with the conventions' inverse generators unchanged at lines 118–123. Raised again as R01.
- R02 — not repaired: line 592 "**Prop. 3.5**: admissibility passes from `g_{LL'}` to `f_{KK'}`"; line 511 "Prop. 5.3: each `adm₂` element occurs in exactly one `σ^mℱ_γ(v)`"; lines 489–492 and 516–518 unchanged. Raised again as R02.

(The earlier small corrections C01–C03 and format notes N01–N02 are likewise unchanged and are written again above under the same numbers.)

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 4.1 `π_{K∞}` vs Abrashkin2010 lines 265–273, 580–599 | `k = 𝔽_p`, `D_{a0} ↔ E(1,t^a)^{−1/a}`; general `k`, level `s` | `dlog E(β,t^a)^{1/a} = Σ_m σ^m(β)t^{ap^m}dt/t`; inverse gives `−Σ_i t^{ap^{n+iN_s}}dt/t`; source units `E^{1/a}` give `+` | R01 |
| 4.4 Prop. 3.5 vs lines 795–796, 884 | hypotheses in the source | comparable and condition C assumed; C used for `e = e'` of `L_ur/K_ur`, `L'_ur/K'_ur` | R02 |
| 3.3 Prop. 5.3 vs lines 1369–1376 | hypotheses; the two applications | `v/p^{N₀−n} ≤ d(v)`; applied for `v ∈ ℕ`, `v < p^{N₀}`, `n₁ = n₂ = 0` and `v = c + 1/p`, `c < p^{N₀−2}` | R02 |
| 3.2 Props. 2.5–2.7 vs lines 437–440, 457–460, 490–492 | `p ≠ 2`; `p = 2` | `w₀ + 1 ≤ p^{N₀}`; `w₀ = 4M`, `w₀ + 1 < 2^{N₀}`; `w₀ ≤ ap^{N₀}`, `w₀ ∈ pℕ` (`4ℕ`), `w₀ > a + 1` (`a + 2`) | R02 |
| 3.3 Prop. 5.7 vs lines 1498–1504 | hypotheses | `α_{110}(f) = 1`; `α_{aa'0}(f) = 0` for `a < a' < a + r < p^{N₀−2}`; `b₁ + δ(p) < p^{N₀−2}` | R02 |
| Lean absolute form (6.5) | elaborated type; residue characteristics `p ≠ ℓ` | no `p`, no `CharP` binder in the type; nontrivial pro-`p` `G_K(0+)` cannot map onto a pro-`ℓ` group: hypothesis unsatisfiable | true; C02 |

The rows for the untouched statements stand as in the previous review, of `bcc9e15`.

- The folder at this head is identical to the folder at `bcc9e15` (empty diff, 0 changed lines); the branch now sits on a newer main, and against that main it changes nothing outside the roadmap folder.
- Source locators checked against the text this round: 9, in the arXiv text of Abrashkin 2010 (§1.4 generators; §3.2 `π_{Ks}`; Props. 2.5, 2.6, 2.7, 3.5, 5.3, 5.7 with §5.4's standing assumption; the reference [Sh]). All agree with the findings as written. No sampled target lies in a changed passage, since none changed.
- Cross-roadmap citations resolved again at the open heads: FilteredLocalGaloisGroups `GroupFiltration.herbrandPsi` (its README lines 86, 288); FieldOfNorms 4.3, 4.4 and the Kummer worked example (which names §R07.4.3 itself); no cited id is dropped by an open pull request and no other open pull request changes this roadmap.
- Dependency check: `depcheck: 168 roadmaps, 1961 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier.
- Elaboration of `Suggested.lean`: three `sorry` warnings (lines 100, 123, 169), nothing else. The elaborated types of the six declarations are as in the previous review: Theorem A keeps both `CharP` binders, the absolute form has none (C02), `[Invertible (2 : R)]` is present in `classTwoMul` and `classTwoMul_assoc`.
- Automatic checks: all pass except the scan for TeX syntax (set aside below).
- The pull request's title and description agree with this head: a new roadmap, Layers 0–11, the suppliers (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 included), the six Lean declarations with the class-two associativity proved, the scope decisions.

Overlap check: read FieldOfNorms, FilteredLocalGaloisGroups, LocalAnabelianGeometry, HigherLocalClassFieldTheory, FunctionFieldArithmetic, RamificationOfCompleteDiscretelyValuedFields, ProfiniteProPGroups, PadicPeriodRings (the last by its scope only; nothing shared); the absolute upper filtration is ClassFieldTheory Layer 7's (copied in `Suggested.lean` under this namespace only to state the headlines); the finite Magnus levels are GeometricTopology §4.12.1's; the Kummer field of norms is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3's; lifting of isomorphisms and cofinal systems are FieldOfNorms 4.3–4.4's; nothing else shared.

Source independence: changed passages only — none changed, so no new passage was compared; as in the previous review, 15 passages compared with 1 source (Abrashkin 2010), none shared beyond formulas and forced statements; largest share Abrashkin 2010, 48 of about 126 locators; contents compared with Abrashkin 2010: independent at the level of layers. [Abrashkin 2000] (39 locators), [Abrashkin 1998] and [Deligne 1984] could not be read.

Research link: the headline targets are Theorem A of Abrashkin (2010) and Theorems A′ and B of Abrashkin (2000), the local analogue of the Grothendieck conjecture, with Deligne's (1984) truncated equivalence as input; they extend Mochizuki (1997). Rests on Abrashkin 2010, printed pp. 2–3, and the README.

## Not verifiable

- [Abrashkin 2000] (sampled targets 7.1, 9.2, 9.3, 11.1, 11.2, 11.4, 11.5; all of Layers 7–9 and 11; the README's source corrections to it): no legal copy was readable in the previous round, and nothing changed that reopens it.
- [Deligne 1984] (sampled targets 10.2, 10.3, 10.4; all of Layer 10): no open copy found in the previous round.
- [Abrashkin 1998] (the proof targets of 7.3): the journal's page offered no readable text.
- [Lazard 1965], [Koch 1970], Serre's two books (0.1, 0.2, 1.1): not opened; the statements cited are standard.

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
