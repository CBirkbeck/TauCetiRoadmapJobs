# Review of LocalAnabelianGeometryPartII (pull request #2867 at feff4d8)

**Verdict:** needs changes

**Summary.** Changes are needed: four findings, all P2. Two are mathematical slips in the README's own text (the annihilator criterion in the route of 2.2 describes the wrong subgroup, and 1.6 (b) has the wrong sign for the README's convention `ψ_f(τ) = (τ⁻¹f)·f⁻¹`); one is that Theorem A′ and Theorem A are statable at the pins with one short definition and are absent from `Suggested.lean`; one is that the finite levels of the Magnus algebra are GeometricTopology §4.12.1's object, restated instead of cited. There are five small corrections and two format notes, none blocking. Layers 7–11 rest on [Abrashkin 2000] and [Deligne 1984], which could not be read legally; that and the README's corrections to those texts are left to the human reviewers.

## R01 (P2) — Step three of the route in 2.2 gives the condition for lying in `H_v`, not for annihilating it, and at `v = 1` it contradicts the Check of Layer 1

An implementer who follows the route proves a false equivalence. The step (README line 327) reads: a finite-length class `y` kills `H_v` "iff the `D₀`-coordinate of `y` is `0` and its coordinate along `α_r t^{−a}` lies in `p^{s(a, v)}ℤ_p`". Take `v = 1`, `y = t^{−1}` at length one: `s(1, 1) = 0`, the `α₀`-coordinate is `0`, so the criterion says `y` kills `H_1`. But `x^p − x = t^{−1}` has upper jump `1`, so `Γ_K(p)^{(1)}` acts nontrivially on it; the Check of Layer 1 (line 287) says the same (`Γ_K(p)^{(v)}` is in the kernel exactly for `v > a`). In the other direction `y = α₀` is unramified and kills every `H_v`, though its `α₀`-coordinate is not `0`.

The correct statement, from FunctionFieldArithmetic 4.4 (conductor `1 + max i·p^{n − v(c_i) − 1}` at length `n`): a class `y = cα₀ + Σ c_a t^{−a}` of length `M` kills `H_v` iff `a·p^{M − 1 − v(c_a)} < v` for every `a` with `c_a ≠ 0`, that is `c_a ∈ p^{M − s(a, v)}W_M(k)`, with no condition on `c`. The condition printed in the README is the description of `H_v` itself (zero `τ₀`-coordinate, `τ_a^{(r)}`-coordinate in `p^{s(a, v)}ℤ_p`), which is what step four needs. Replace the "iff" clause by the length-`M` condition and state the description of `H_v` as its dual.

## R02 (P2) — With `ψ_f(τ) = (τ⁻¹f)·f⁻¹` and the pairing of 1.3, target 1.6 (b) should read `τ₀ ↦ 1 − D₀`, `τ_a^{(r)} ↦ 1 − D_a^{(r)}` modulo `𝒥²`

The conventions replace the source's `ψ_f(τ) = (τf)f⁻¹` (Abrashkin2010 line 240) by its value at `τ⁻¹`, which is right for the homomorphism property, but 1.6 (b) (line 276) keeps the source's formula for the abelianization. By the README's own route line, `ψ_f(τ) ≡ 1 + Σ(τ⁻¹f_a^{(r)} − f_a^{(r)})D_a^{(r)} + (τ⁻¹f₀ − f₀)D₀`. Since `τ ↦ τy − y` is additive, `τ⁻¹y − y = −(τy − y)`; with `τ₀`, `τ_a^{(r)}` dual to `α₀`, `α_r t^{−a}` for the pairing `(τ, x) ↦ τy − y` of 1.3, this gives `ψ_f(τ₀) ≡ 1 − D₀` and `ψ_f(τ_a^{(r)}) ≡ 1 − D_a^{(r)}`. The same sign enters 7.2 ("`ψ^ab` is the Witt–Artin–Schreier isomorphism of 1.3": it is its negative) and the conventions' statement that `D₀` corresponds to `t` and `D_{an}` to `Σ σⁿ(α_r) ⊗ E(β_r, t^a)^{1/a}`: for `k = 𝔽_p`, `α₀ = 1`, the arithmetic Frobenius sends `f₀` to `f₀^p = f₀ + 1`, so `τ₀` is the arithmetic Frobenius and corresponds to `t`, and `1 + D₀ = ψ_f(τ₀⁻¹)`.

The ideals `𝒜^{(v)}` and everything linear in the `D`'s (Prop. 2.1, admissibility) are unaffected. The smallest repair is one of: write `τ₀⁻¹ ↦ 1 + D₀`, `(τ_a^{(r)})⁻¹ ↦ 1 + D_a^{(r)}` in 1.6 (b); or define the dual basis in 1.3 for the pairing `(τ, x) ↦ y − τy`, and then say that it corresponds to `t⁻¹` and `E(β_r, t^a)^{−1/a}`. Add the rank-one computation above as the Check that pins the sign.

## R03 (P2) — Theorem A′ (9.3) and Theorem A (5.4, 6.5) are statable at the pins and are not in `Suggested.lean`

The module docstring says that every statement involving the upper filtration of `G_K` or `Γ_K(p)` is not statable because the absolute upper filtration has no declaration at the pins. The filtration is a nine-line definition with a real body on carriers the pinned Tau Ceti has: ClassFieldTheory's `Suggested.lean` on main, at the same Tau Ceti pin, defines `localAbsoluteUpperRamificationGroup` as the infimum over `FiniteGaloisIntermediateField K (AlgebraicClosure K)` of the preimages of `TauCeti.LocalFieldsRamification.upperRamificationGroup` (`TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean`, line 421) under `AlgEquiv.restrictNormalHom`.

I elaborated both statements against the pins with that definition copied into a probe file, `sorry` the only warning. Theorem A′: for `p ≠ 2` and local fields `K`, `K'` of residue characteristic `p`, every `G : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K'` mapping the group at each `v ≥ 0` onto the group at `v` is `τ ↦ e ∘ τ ∘ e⁻¹` for some `e : AlgebraicClosure K ≃+* AlgebraicClosure K'` carrying the image of `K` onto that of `K'`. Theorem A: the same with `g : absoluteGaloisGroupProP p K ≃ₜ* absoluteGaloisGroupProP p K'`, the images of the groups under `absoluteGaloisGroupProPQuotientMap`, and the conclusion that `g` is induced by conjugation with such an `e`. These are the roadmap's two headline theorems; state them (with the one local definition, under this roadmap's namespace), and correct the docstring's second "Not stated here" item accordingly. Theorem B (11.4) and Deligne's Theorem 2.8 need quotient filtrations and categories and can stay in the docstring.

## R04 (P2) — The finite level `R⟨X_i : i ∈ S⟩/𝒥ⁿ` of 0.1 is the truncated Magnus algebra GeometricTopology §4.12.1 owns on main, and is defined again here

Two roadmaps would build the same quotient of `FreeAlgebra`. GeometricTopology §4.12.1 on main ("The truncated Magnus algebra") defines, for every commutative ring `R`, finite type `I` and `d ≥ 0`, the quotient of `FreeAlgebra R I` by the words of length `d + 1`, with its basis of words, truncations, coefficient change, deletion of variables and universal property. Target 0.1 (lines 135–138) defines the same object for finite `S` (with `n = d + 1`), asserts its freeness of finite rank, and uses the same transition maps (`X_i ↦ 0`, truncation); `Suggested.lean` declares it as `TruncatedMagnus`. The scope section says the GeometricTopology algebra "is not reused: Layer 0 needs infinitely many variables, `p`-adic coefficients and the pro-`p` completion", but the finite levels have finitely many variables and GeometricTopology's coefficients are arbitrary.

Cite GeometricTopology §4.12.1 for the finite level and its transition maps in 0.1's `*Needs:*` and in the supplier contracts, and keep as this roadmap's own the inverse limit over finite `S` and `n`, its topology, the universal property for families converging to `0`, and Lazard's isomorphism. The scope sentence then says that the finite levels are GeometricTopology's and the profinite algebra is new.

## C01 — `classTwoMul_assoc` closes with one `simp`

On a probe copy of the file, `simp [classTwoMul, hL, add_assoc, add_comm, add_left_comm]` proves it, so as a target it asks an implementer for nothing. If it is kept as a sanity check on `classTwoMul`, say so in its docstring; the statement with content in 0.3 is the isomorphism `F/C₃(F) ≅ G(L₂(I))`, which the docstring already names as not stated.

## C02 — Five definitions of `Suggested.lean` serve no stated theorem

`primeToP`, `truncRel`, `TruncatedMagnus`, `deligneRing` and `deligneModule` are used by no theorem in the file, so the file tests nothing about them. Either state a theorem with each (for `deligneModule`, that it is free of rank one over `deligneRing 𝒪 e`, which the docstring asserts in prose), or keep the definitions in the README as prose and say in the docstring that the corresponding headline (Theorem 2.8, Lazard's isomorphism) is not statable. With R04, `TruncatedMagnus` is GeometricTopology's object in any case.

## C03 — Target 6.1 stands under "`E` of characteristic `0`" and for Galois `L`, but 5.2 and 5.5 use it in characteristic `p` and for every finite subextension

5.2 ("Through 6.1 …") and 5.5 ("every finite `K ⊆ E(p)` over `E`, Galois or not, … centralizes `Γ_K(p)`") need `E(p)` to be a maximal `p`-extension of `K`; in 5.5 the reciprocity step fails without it, since `Gal(E(p)/K)^ab` would only be a quotient of the pro-`p` completion of `K^×`. The dependency paragraph lists no Layer 6 item for Layer 5. The statement is true in both characteristics and for every finite `K` (an open subgroup of a pro-`p` group is subnormal, so apply the Galois case along a chain of degree-`p` steps). Move 6.1 before Layer 5 without the characteristic hypothesis and state it for finite subextensions, or restrict 5.5 to Galois `K`, which are cofinal and suffice.

## C04 — `F_{a0}` in 7.3 and `F_{γ, −N}` in the conventions are never defined

The generators `Δ_{a0} = a⁻¹F_{a0} mod C₃` (line 662) carry the theorem of 7.3, and the README defines no `F_{a0}`; the only `F` defined is `F_γ` of 2.1, in the Magnus algebra. Say what `F_{a0}` is (if it is the Lie counterpart of `F_a` of 2.1, write its formula), since a reader without [Abrashkin 2000] cannot state the theorem.

## C05 — For integral `γ`, the bracket terms "with `n₂ < n₁ < m`" in 3.3 form an empty set, and the conventions say `ℱ_γ(v)` is taken verbatim although 3.3 corrects it

In `p^{n₁}a₁ + p^{n₂}a₂ = ap^m` with `n₂ < n₁` and `p ∤ a₂`, the `p`-adic valuation of the left side is `n₂`, so `n₂ = m`: every bracket term of `F_γ` is already inside `p^m a Δ_{am} = p^m σ^m F_a`, and none has `n₁ < m`. So the clause "the bracket terms with `n₂ < n₁ < m` included for integral `γ`" (line 429) adds nothing; drop it or say that no bracket term remains. The restriction of the product sum to `n < m` is right (the terms with `n = m` are in `Δ_{am}`), and it changes the printed formula (Abrashkin2010 line 1430 has `n ≥ 0`), so the conventions' sentence that the formula for `ℱ_γ(v)` is "copied verbatim" (line 105) should except it.

## N01 — The targets are bold list items (`- **1.3 …**`), not `### k.n` subsections, so the tools that count and sample targets find none; the sample of this review was chosen by hand.

## N02 — "The proof follows [Abrashkin 1998, §§1–4]" (line 672) reads as a mandatory route taken from a source; "A route is that of [Abrashkin 1998, §§1–4], restricted to class two" says the same without it.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Thm A, 5.4/6.5 vs Abrashkin2010 line 76 | hypotheses, conclusion, `p = 2` | same fields, `v ≥ 0`, `μ(E) = E'`, `g = μ^*`; uniqueness is the README's addition | agrees |
| 5.5 uniqueness | `ν` centralizing `Γ_K(p)` | `ν(x)/x ∈ μ_{q−1}`; on `U^{(1)}`: `U^{(1)} ∩ μ_{q−1} = 1`; then `ν(πx) = πx` | sound, given C03 |
| 1.6 homomorphism | `τ ↦ (τf)f⁻¹`, usual composition | `ψ(τ₁τ₂) = τ₁(ψ(τ₂)f)f⁻¹ = ψ(τ₂)ψ(τ₁)`; with `τ⁻¹` a homomorphism | sound |
| 1.6 (b) sign | `k = 𝔽_p`, `α₀ = 1`, Frobenius | `φ(f₀) = f₀ + 1`; `ψ_f(φ) ≡ 1 + (φ⁻¹f₀ − f₀)D₀ = 1 − D₀` | R02 |
| 1.3 decomposition | `x ∈ tW(k)[[t]]`; `ct^{−ap}` | `(σ − 1)(−Σσ^m x) = x`; `σ(σ⁻¹(c)t^{−a}) = ct^{−ap}` | sound; Abrashkin2010 line 276 |
| 1.3 remark on `β = α₀` | `p = 3`, `k = 𝔽₉` | traces of Teichmüller units: `2, −2, 0, 0, ±√−2`; none is `1` | true |
| 2.1 `F_γ` vs Abrashkin2010 line 1039 | `γ = 1, 2, 1 + 1/p`, `p = 2` and odd | `D_{10}`; `2D_{20} − D_{10}²`, `2D_{11} − D_{10}²`; `−[D_{10}, D_{1,−1}]` | Checks true |
| 2.2 statement vs line 1036 | `v ∈ (0, 1]` | generators `p^sD_{an}`, `p^sa ≥ v`: all `D_{an}`, no `D₀` = inertia | agrees |
| 2.2 route, step three | `v = 1`, `y = t^{−1}`; `y = α₀` | criterion says "kills"; upper jump is `1`, does not kill. `α₀` kills, criterion says not | R01 |
| 2.3 truncation | `γ ≥ 2v₀` | product terms need `γ < 2v₀`; bracket terms `< p^{n₁}(a₁ + a₂) < 2v₀`: none | sound |
| 2.5 induction vs line 1097 | `S` not an up-set | source takes `inf S`; B′ needs all `v > v₀` in `S`; README's `inf{w : [w, ∞) ⊆ S}` works | README correct |
| Conventions, `v = 0` | `𝒜(0)` vs `𝒜^{(0)}` mod `𝒥²` | `F₀ = D₀ ∈ 𝒜(0)`; Prop. 4.2 at `v = 0` has no `D₀` | README's restriction to `v > 0` justified |
| 3.1 admissibility vs line 430 | `Fr(t)^*`, `N₀ = 1, 2` | `α_{a,a,−1} = 1`: not admissible for `N₀ ≥ 2`, admissible for `N₀ = 1` | Check true |
| 3.2 Prop. 2.1 vs line 366 | `η(t) = αt` | `η⁻¹(t)^{−a} = α^a t^{−a}`, so `α_{aa0} = α^a` | Check true |
| 3.3 `ℱ_γ(v)` vs line 1430 | `γ = ap^m`; `γ = p + 1`, `p² + p` | `p^m aΔ_{am}` contains products with `n = m` and all brackets (`n₂ = m` forced) | `n < m` right; C05 |
| 4.1 `π_{K∞}(D^∞_{an})` | dual bases, `N_s → ∞` | `Σ_{m ≡ n (N_s), m ≥ 0} t^{ap^m − 1}dt → t^{ap^n − 1}dt` (`n ≥ 0`), `0` (`n < 0`) | sound |
| 6.5 Check | `E = ℚ_p`, `p` odd | rank 2 free, `I = ⟨⟨y⟩⟩`; the swap sends `I` to `⟨⟨x⟩⟩`, and `x ∉ I` | true |
| 10 Checks | `ℚ_p(ζ_{p²})/ℚ_p`; `e = 1` | upper jumps `0, 1`, lower `0, p − 1`; `ε = 0` on `𝔪/𝔪²` | true |
| 11 numerics | `K_M/K` Kummer; `p = 3`, `M = 1, 2` | `ψ(a_K) = ep^M/(p−1) + p^M e = v_K`; `(6, 81, 21, 54, 12)`; `(2, 9, 8)` | consistent |
| 11.2 level | `r(K_M)` in FieldOfNorms 1.4 | `(p−1)/p · e_{K_M}p/(p−1) = e_{K_M} = w_K` | consistent |
| 0.3 class-two law | commutator, sum, kernel | `x∘y∘(−x)∘(−y) = [x, y]`; `x∘y∘(−½[x,y]) = x + y`; `θ'⁻¹(1 + 𝒥³) = C₃` | sound |
| `classTwoMul_assoc` | one-tactic probe | closes with `simp` and three `add_*` lemmas | C01 |
| Witt theorem (1.1) | algebraically closed `K`; library | trivial group, `cd = 0`; library has only the `p`-invertible local case (`ProP/Free.lean` line 100) | true, not duplicated |
| Thm A′, Thm A in Lean | probe statement at the pins | both elaborate, `sorry` only | R03 |
| 0.1 finite level | GeometricTopology §4.12.1 | same quotient of `FreeAlgebra`, `n = d + 1` | R04 |

- Source locators checked against the text: 17 targets, all in Abrashkin2010 (published version, printed page = file page − 1): Thm A, §1.1, Props. 1.1–1.3, §1.4, Props. 2.1–2.7 and the definition of `Aut_adm`, Prop. 3.3, the definition of local analyticity, Prop. 3.4, Props. 4.1–4.3, 4.5, Lemma 4.4, Thms. B and B′, §5.1, Props. 5.6, 5.7, 5.9, Lemma 5.8, Props. 6.1–6.2, §7.
- Library declarations opened at the pin: 14 (among them `upperRamificationGroup` `Herbrand/Basic.lean` 421, `absoluteGaloisGroupProP` `AbsoluteGaloisGroup/ProP.lean` 28, `artinMap_congr` `Local/ArtinMap.lean` 397, `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP` `ProP/Rank.lean` 51, the pointed Serre theorem `Free/Pointed/Serre.lean` 98, `map_proPKernel_eq` `MaximalProP.lean` 206).
- Cross-roadmap citations resolved: FilteredLocalGaloisGroups 1.2–1.5, 2.1, 2.2, 2.4; FieldOfNorms 0.2, 0.6, 1.4, 2.2, 2.3, 3.3, 4.3, 4.4, worked examples; FunctionFieldArithmetic 3.1, 3.2, 4.3, 4.4; ClassFieldTheory Layer 7; RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2; PadicExtensionFamilies 2.1–2.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3; GeometricTopology §4.12.1. All exist where cited.
- Dependency check: `depcheck: 172 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings, nothing else. Elaborated types compared with the README: `[Invertible (2 : R)]` is present in `classTwoMul` and `classTwoMul_assoc`; no binder lost.
- No change outside the roadmap folder. The pull request's title and description agree with the head; no sentence contradicted.

Overlap check: read FieldOfNorms, FilteredLocalGaloisGroups, LocalAnabelianGeometry, FunctionFieldArithmetic, RamificationOfCompleteDiscretelyValuedFields, PadicExtensionFamilies, ProfiniteProPGroups; the truncated Magnus algebra is shared with GeometricTopology (owner: GeometricTopology §4.12.1, R04); cofinal systems inside `E(p)` are FieldOfNorms 4.4's and the variant in `K^sep` (9.2) is this roadmap's; nothing else shared.

Source independence: 22 passages compared with 1 source (Abrashkin2010), none shared beyond formulas; largest share Abrashkin 2010, 45 of about 100 locators; contents compared with Abrashkin2010: independent at the level of layers (Layer 1 ↔ §1, 2 ↔ §4, 3 ↔ §§2 and 5, 4 ↔ §3, 5 ↔ §6, 6 ↔ §7: reordered and merged). [Abrashkin 2000] (34 locators) and [Deligne 1984] could not be read.

Research link: the headline targets are Theorem A of Abrashkin (2010) and Theorems A′, B of Abrashkin (2000), the local analogue of the Grothendieck conjecture, with Deligne's (1984) truncated equivalence as input; they extend Mochizuki (1997). Rests on Abrashkin2010 pp. 2–3 and the README.

## Not verifiable

- [Abrashkin 2000] (Layers 7–9 and 11, the Summary's Theorem B, the source corrections on the special basis, on p. 152 and on the Corollary of §0): the publisher's page refuses access and no open copy was found.
- [Deligne 1984] (Layer 10, and Remark A.6.3 in 11.5): no open copy found. The filtration statement of 10.4 is the README's own argument from Deligne's 1.5.1, 1.5.4, 2.8 and 3.5 and was not checked against them.
- [Abrashkin 1998] (the proof targets of 7.3): the journal's page offers no readable text.
- [Lazard 1965], [Koch 1970], Serre's two books (0.2, 1.1): not opened; the statements cited are standard.

Automatic checks set aside as false positives: the TeX-syntax scan flagged two code spans that wrap across a line break (the Check on `𝒪_F/p` in Layer 10 and the transport formula in 11.3); both are inside backticks. The library-name scan flagged `GroupFiltration.herbrandPsi`, which is FilteredLocalGaloisGroups 1.4's proposed name, cited as such. The signature scan flagged `[Invertible (2 : R)]` as dropped; it is present.

## Source issues

- **Error** in Abrashkin2010 at Theorem B and Remark a) of §4.2, printed pp. 26–27: the source says the two filtrations agree modulo `𝒥³` for all `v ≥ 0`, with `F₀ = D₀`; it should be for `v > 0`, since at `v = 0` Prop. 4.2 excludes `D₀`; affects a stated result.
- **Gap** in Abrashkin2010 at the deduction of Theorem B from Theorem B′, printed p. 27: the source takes `v₀ = inf S` and applies B′, which needs every `v > v₀` in `S`; it should take the infimum of the `w` with `[w, ∞) ⊆ S`; affects the proof.
- **Misprint** in Abrashkin2010 at §5.1, printed p. 36: the source sums the products in `ℱ_γ(v)`, `γ = ap^m`, over all `n ≥ 0`; it should be `0 ≤ n < m`, the terms with `n = m` being inside `Δ_{am}`; affects a stated result.
- **Misprint** in Abrashkin2010 at the definition of locally analytic systems, §3.6, printed p. 20: the source takes `η_s` in `Iso⁰(K, K')`; it should be `Iso⁰(K_s, K'_s)`, as the proof of Prop. 3.4 speaks of conjugates of `η_s` over `K`; affects a stated result.
- **Misprint** in Abrashkin2010 at the proof of Lemma 4.4, printed pp. 28–29: the source's first congruence has exponent `qp^M` on `t₁`; it should be `q`, the case `s = 0` of the next display; affects nothing.
- **Misprint** in Abrashkin2010 before Prop. 6.1, printed p. 45: the source defines `μ_{LL'}` with the Frobenius of `t_{K'}`; it should be that of `t_{L'}`, as in the proof; affects nothing.

## For the human reviewers

- **Not tested.** [Abrashkin 2000] (34 of about 100 locators, Layers 7–9 and 11) and [Deligne 1984] (Layer 10) could not be read legally: their locators, the wording and the arrangement against their contents were not checked.
- **Licence / sources.** The README corrects printed statements of [Abrashkin 2000] (special basis by the factors `a`, conventions line 117; the Corollary of §0 stated for `K, K' ∈ 𝒜_M`, 11.5; a sign on p. 152). These could not be checked against the text.
- **Scope.** The README declines Wintenberger's 1980 full faithfulness on `p`-adic Lie extensions as "not in print" and routes Layers 6 and 9 through FieldOfNorms 4.3 instead; and it sets the absolute statement for `p = 2` aside as needing a new argument (Scope section). Both are choices of scope.
- **Arrangement inside layers.** Layer-level organisation differs from the sources', but 3.2, 3.3, 4.1–4.4 and 8.2 list the propositions of Abrashkin 2010 §§2, 5, 3 and Abrashkin 2000 §§4.2–4.12 one by one in the printed order.
