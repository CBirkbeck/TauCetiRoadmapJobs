# Review of LefschetzPencilsAndVanishingCycles (pull request #873 at f8c8b5b)

**Verdict:** needs changes

Incremental re-review of the 99 lines changed since `dbf5ba2`. The three findings of that review are repaired. The repair adds two P3 defects, both in changed passages. The gate is green and there is no blocking finding.

## R01 (P3) — Moving the logarithm to SR.5.2 is not carried through to 1.6 and 5.7

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:246–247`: “**SmoothRepresentationsOfLocalGroups** SR.5.2 (*nilpotent-exp-log*: the nilpotent exponential and the finite logarithm of a unipotent …), in 1.2.” Line 1234, in the *Needs:* of 1.6: “ArithmeticGaloisRepresentations Layer 2, §2.4 (logarithm);”.

Claim: After the repair, lines 49 and 931 make SR.5.2 the owner of the finite logarithm. The contract says only 1.2 consumes it, and 1.6 still takes the logarithm from ArithmeticGaloisRepresentations §2.4.

Witness: ArithmeticGaloisRepresentations §2.4 (its lines 1995–1998) calls its exp/log calculus SR.5.2's `nilpotent-exp-log`. 1.6 needs `log T` (line 1227). 5.7 writes a unipotent `h` as `exp(N)` with `N = log h` (line 2981), yet its *Needs:* (line 2990) names only `IsNilpotent.exp`.

Repair: In 1.6's *Needs:*, replace “ArithmeticGaloisRepresentations Layer 2, §2.4 (logarithm)” with “SmoothRepresentationsOfLocalGroups SR.5.2 (*nilpotent-exp-log*)”. Add the same item to 5.7's *Needs:* and to the Layer LPV.5 Dependencies (line 3250). End the contract bullet with “in 1.2, 1.6 and 5.7”. Tested on two instances. On `1 + J₃`, the SR.5.2 logarithm is `J₃ − J₃²/2`: its square is `J₃² ≠ 0` and its cube is `0`, so it is maximally nilpotent, as 1.6 asserts. On a transvection `x ↦ x + ψ(x,δ)δ`, the logarithm is the single term `N(δ)`, since `N(δ)² = 0`; this is the `N ∈ 𝔏` step of 5.7.

## R02 (P3) — The QuadraticFormsOverABase consumer bullet names the wrong section and a use that roadmap does not make

Location: `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:4397–4399`: “QuadraticFormsOverABase §2.1 compares its smoothness predicate … with ordinarity (2.1) and its polar criterion with the even-rank statement of 2.2; its Layer 4 uses the even Clifford centre and the Azumaya property (2.2).”

Claim: The bullet says QuadraticFormsOverABase §2.1 makes the polar-criterion comparison and that its Layer 4 uses the Azumaya property.

Witness: At QuadraticFormsOverABase's head:
- The even-rank unit criterion and its comparison with 2.2 are in its §2.2 (its README lines 529–536).
- Its contract (lines 229–233) reads 2.2 only “in the Layer 4 Examples”.
- Those Examples (lines 829–833) use only the étale centre.

Repair: Rewrite the bullet as follows. “QuadraticFormsOverABase §2.1 compares its smoothness predicate for forms on `Fin n → R` with ordinarity (2.1), and its 2.4 uses the normal form of 2.1. Its §2.2 compares its even-rank unit criterion with the polar criterion that 2.2 proves. The Layer 4 Examples read the étale even Clifford centre of 2.2.”

Tested on `x² + xy + y²` over `ℤ[1/3]`. The polar determinant is `3`, a unit, so the polar map is bijective (2.2 and QuadraticFormsOverABase §2.2 agree). The centre is `ℤ[1/3][u]/(u² − u + 1)`, of discriminant `−3`, hence étale; over `𝔽₂` it becomes `𝔽₄`, the étale centre that QuadraticFormsOverABase's Layer 4 example reads.

The bullet is also where this README records the direction of supply: 2.2 owns the even-rank polar criterion (see *Ownership* below).

## Previous findings

- R01 — repaired: line 1320 now reads “Let `X` be regular and strictly semistable over a strictly henselian trait”. The *Needs:* at lines 1367–1369 no longer carries SchemeAndStackFoundations §0.21.
- R02 — repaired: lines 1028–1030 read “the nilpotent exp/log calculus of SmoothRepresentationsOfLocalGroups SR.5.2 (*nilpotent-exp-log*), the one used by ArithmeticGaloisRepresentations Layer 2, §2.4”. Lines 240–241, 1592–1593 and 1598–1599 cite `relativePicardSheaf` and §7.6a's `RelativePicard.relativePicardPresheaf`. Neither of the two old names occurs.
- R03 — repaired: line 2974 reads “### 5.7 Closed subgroups of `Sp(V)(ℚ_ℓ)` and `O(V)(ℚ_ℓ)`”, line 2979 “Let `H ⊂ G(ψ)` be a closed subgroup”, line 3002 “is compact, hence closed”, and line 3012 “because a compact subgroup is closed”.

## Verified sound

**Scope.** The whole diff since `dbf5ba2` was read: 91 README lines and 8 Lean lines. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/LefschetzPencilsAndVanishingCycles'` is empty; the files listed as changed outside the folder come from the merge of main. The changed passages contain no process word, pull-request number, LaTeX, copied passage or algorithm.

**Gate.** The worker's gate and an independent run at this head both pass: every scanner is `0`, `depcheck=0` and `OK`. The independent dependency check reports:

```text
depcheck: 236 roadmaps, 2276 edges, 0 problem(s)
```

It reports no UPWARD, CYCLE or `moved:` line. The new supplier, SmoothRepresentationsOfLocalGroups, is line 25 of the merge order, before this roadmap (line 68), and is in the allowed list.

**Lean.** The merge moved the pins to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.

- `lake env lean` on `Suggested.lean` gives exactly five `declaration uses 'sorry'` warnings (lines 53, 85, 98, 114 and 135) and nothing else.
- At the new Mathlib pin, `CategoryTheory.End X` is a one-field structure (`Mathlib/CategoryTheory/Endomorphism.lean:34–36`) whose product is `.of (g.asHom ≫ f.asHom)` (`:60`). The `N.asHom` and `(N ^ r).asHom` edits follow this change.
- A scratch file confirmed that `((0 : End X) ^ 0).asHom = 𝟙 X` holds by `simp` and `(0 : End X).asHom = 0` by `rfl`. So `IsNilpotent N` and the `r = 0` conditions mean what README 1.3 says.
- The scratch copy has `#check @` for all six declarations. Each elaborated type matches its README statement (1.1, 1.3–1.4, 2.2, 5.8 and 5.10), and no section binder was dropped.
- One-tactic probes on scratch copies: `simp` leaves goals or makes no progress on all five statements; `infer_instance` fails with “type class instance expected” on all five; `rfl` fails on 1.1, 1.3–1.4 and 2.2; `aesop` fails exhaustively on 1.1, 1.3–1.4 and 2.2. Nothing is padding.
- The headline list and the module docstring are unchanged since the previous review, which checked them.

**Library declarations opened at the new pins.**

- `Mathlib/Algebra/Lie/Sl2.lean:38`: `IsSl2Triple`, with fields `h_ne_zero`, `⁅e,f⁆ = h`, `⁅h,e⁆ = 2e` and `⁅h,f⁆ = −2f`.
- Same file, `:79`: `HasPrimitiveVectorWith`, meaning nonzero, `h`-eigenvalue `μ`, and killed by `e`.
- Same file, `:167`: `lie_e_pow_succ_toEnd_f`, which reads `⁅e, f^{n+1}m⁆ = ((n+1)(μ − n)) • f^n m`. This is the formula 1.4 quotes, with `(h, e, f) = (H, X, Y)` and `μ = j`.
- `Mathlib/CategoryTheory/Subobject/Basic.lean:572` and `:736` (`pullback`, `«exists»`); `Subobject/Limits.lean:314` (`imageSubobject`); `Endomorphism.lean:83` (the additive group on `End X`).
- `RingTheory/Valuation/RamificationGroup.lean:49`, `RingTheory/Spectrum/Prime/FreeLocus.lean:181`, `Algebra/Azumaya/Defs.lean:60`, `LinearAlgebra/Transvection/Basic.lean:56`, and `LinearAlgebra/QuadraticForm/Radical.lean:35` and `:115`.
- Tau Ceti: `LinearAlgebra/GeneralLinearGroup/Unipotent.lean:31`, `LinearAlgebra/CliffordAlgebra/Even/Center.lean:56` (`adjoinRootEquivCenterEven`) and `Topology/Algebra/Group/Profinite/ZHat/Basic.lean:89`, `:140`, `:146` and `:154`.

**Cross-roadmap citations of the changed passages, resolved at the heads.**

- SmoothRepresentationsOfLocalGroups SR.5.2 *nilpotent-exp-log* (its README lines 4515–4536): finite logarithm in any ℚ-algebra, independent of the bound, inverse to `IsNilpotent.exp`, with ℤ_ℓ interpolation.
- ArithmeticGaloisRepresentations §2.4 (line 1979; the exp/log sentence at 1995–1998; the ContinuousRep monodromy specialization for local fields at 2000–2015) and §2.6 `WeilDeligneRep.monodromyFiltration` (line 2209).
- AlgebraicModuliForArithmeticGeometry §7.6.1 (lines 9429 and 9433, `relativePicardSheaf` and sheafification of the quotient by base classes), §7.6a (lines 9519–9521, `RelativePicard.relativePicardPresheaf`, whose fppf sheafification quotients base classes) and §1.4 `IsRelativelyVeryAmple.completeMap` (line 479).
- AdelicAlgebraicGroups §4.2, the closed-subgroups item (lines 4341–4351): `Lie(C)` is a subalgebra, and equality with the full Lie algebra implies openness.
- No roadmap cites the renamed 5.7 heading, and no roadmap cites 1.9's former excellence hypothesis (grep over main and all open heads).

**Ownership.** Two other open roadmaps restate objects the changed passages own; in both cases this roadmap is the earlier owner.

- *QuadraticFormsOverABase.* Its scope (its lines 84–88) and its consumers section (959–961) say that it proves the polar criteria of 2.1–2.2. This roadmap now proves them itself, in 2.1 and in the 2.2 proof sketch (lines 1541–1546). QuadraticFormsOverABase consumes 2.1 (its lines 229–233), so it comes after this roadmap. Repointing those two passages is for its own review.
- *LefschetzStructures.* Its 0.4 `exists_sl2` (its lines 267–275) restates existence and uniqueness of the `𝔰𝔩₂` triple on a hard-Lefschetz graded space. Through `IsSl2Triple.symm` this covers 1.4 item 3. LefschetzStructures consumes DeligneWeightsAndPurity (merge order line 72), which consumes this roadmap, so this roadmap owns the `gr^M` case.

**Sources.** Of the seeded sample, only 5.7 falls in the changed passages.

- Milne, lines 7430–7446 (printed p. 191). Théorème 32.6 notes that the image of the compact `π₁` is closed. Lemma 32.7 assumes a closed subgroup of `Sp(W,ψ)` and gets the Lie-group structure from Cartan's theorem. This supports the repaired closed-subgroup form.
- WeilI, lines 755–763 (PDF p. 22, printed p. 293; page 1 of the PDF is the Numdam cover). Théorème (5.10) and its proof: the image is compact, hence ℓ-adic analytic, and its Lie algebra is generated by the `N_s`.
- The other fourteen sampled targets are untouched since the previous review verified them.

**Remark (untouched text, no change requested).** Lines 945 and 1046 still name `GaloisRep.grothendieck_quasiUnipotent`. ArithmeticGaloisRepresentations §2.4 (its lines 2017–2019) maps that name to SR.5.2 `wd-complete-coefficients`, `grothendieck_quasiUnipotent_complete`, so the citation stays valid.

**Previous repair reasons.** No finding re-raises a settled one.

**Adversarial table.** The first block holds new rows for every changed statement, with values computed at this head. The second carries forward unchanged the rows of the review of `dbf5ba2` for statements the diff leaves untouched, marked `(r2)`. Notation: `J₂(e₁) = e₀`, `J₃(e₂) = e₁`, `J₃(e₁) = e₀`.

| Statement | Instances and values computed on each side | Result |
|---|---|---|
| 1.2 exp/log owner (SR.5.2) | `T = 1 + J₂`: bound `b = 2` gives `log T = J₂`; `b = 3` gives `J₂ − J₂²/2 = J₂` (independent of the bound); `exp J₂ = 1 + J₂ = T`. `T = 1 + J₃`: `log T = J₃ − J₃²/2`, `(log T)² = J₃²`, `exp(log T) = 1 + J₃ − J₃²/2 + J₃²/2 = T`. SR.5.2 lines 4515–4536 state these laws in any ℚ-algebra, and `End(V)` is one. | Pass |
| 1.3 Lean `IsMonodromyFiltration` with `asHom` | `N = 0`, `c = 0`, `M i = ⊥` for `i < 0`, `⊤` for `i ≥ 0`: the image of `M i` under `0` is `⊥ ≤ M(i−2)`. At `r = 0`, `(N^0).asHom = 𝟙 X` gives `⊤ ⊔ ⊥ = ⊤ = M₀` and `⊤ ⊓ ⊥ = ⊥ = M₋₁`. At `r ≥ 1`: `⊥ ⊔ ⊥ = ⊥ = M(−r)` and `⊤ ⊓ pullback 0 ⊥ = ⊤ = M(r−1)`. `J₂` at `r = 1`: `N(M₁) ⊔ M₋₂ = ℚe₀ = M₋₁` and `M₁ ⊓ N⁻¹(M₋₂) = ker N = ℚe₀ = M₀`. | Pass |
| 1.3–1.4 Lean strictness conjunct | `N = 0`: `∃₀(M(i+2)) = ⊥ = imageSubobject 0 ⊓ M i`. `J₂`, `i = −1`: `N(M₁) = ℚe₀ = ℚe₀ ⊓ M₋₁`. `i = −2`: `N(M₀) = 0 = ℚe₀ ⊓ 0`. `(0 : End X).asHom = 0` by `rfl`, so nilpotence is nilpotence of the composite. | Pass |
| 1.4 item 3, raising formula and Mathlib lemma | `J₃`, `j = 2`: `a(j−a+1)` at `a = 1,2` is `2,2`; Mathlib's `(k+1)(μ−k)` at `k = 0,1`, `μ = 2` is `2,2`. Brackets: `[X,Y]u = 2u − 0 = Hu`; `[X,Y]Nu = 2Nu − 2Nu = 0 = (2−2)Nu`; `[X,Y]N²u = 0 − 2N²u = (2−4)N²u`. `J₂`, `j = 1`: `X(Nu) = u`, `[X,Y]u = u`, `[X,Y]Nu = −Nu`. | Pass |
| 1.4 item 3, uniqueness | `J₃ ⊕ J₁`, string `u₀ ∈ gr₀` with `j = 0`: `Du₀ ∈ gr₂` and `NDu₀ = DNu₀ = 0`. `N : gr₂ → gr₀` is injective because `N² : gr₂ ≅ gr₋₂` factors through it, so `Du₀ = 0`. The wrong model `X′ = X + E` with `E(u₀) = u` satisfies `[H,E] = 2E`, but `[E,N]u₀ = −Nu ≠ 0`, so `[X′,Y] ≠ H` and it is excluded. `N = 0`: `H = 0`, and `[H,X] = 2X` forces `X = 0`. | Pass |
| 1.9 without excellence | Non-excellent strictly henselian DVR, `xy = π`: grades `Λ_C(−1)[−1]`, `Λ_{D₁} ⊕ Λ_{D₂}`, `Λ_C[−1]`; `N` is the identity and `N² = 0`. The only purity input is 0.10, stated at line 857 for every regular noetherian `X`. With `C = ∅`: `N = 0` and only `gr₀` remains. | Pass (r2 R01 repaired) |
| 2.2 polar criterion over a base | `ℤ`, `xy`: determinant `−1`, all fibres ordinary. `ℤ`, `x²+y²`: determinant `4`, the fibre at `2` is `0`, centre fibre `𝔽₂[t]/(t+1)²`. `ℤ`, `x²+xy+y²`: determinant `3`, equal to `(x−y)²` mod `3`. Over `ℤ[1/3]` it is bijective and the centre is étale (discriminant `−3`). Over `ℤ_(p)`: bijective ⇔ `det` is a unit ⇔ bijective mod `p`. `x²+yz` over `𝔽₂`: ordinary, but the polar kernel is `𝔽₂e_x`, so `heven` is needed. `ℚ×ℚ`, ranks `2,4`: centre rank `2` at both primes. | Pass |
| 2.3 relative Picard citation | `X = Q × P¹ → P¹`: `ω_{X/P¹} ⊗ L^{n} = O ⊠ O(n) = f^*O(n)`, a base class. It is killed by the fppf sheafification of §7.6a, so the relative classes agree while the bundles differ. | Pass |
| 5.7 closed subgroups | `exp(ℤN)` is not closed, since `ℤ` is not closed in `ℤ_ℓ`: `exp N ∈ H` is unipotent, but `exp(tN) ∉ H` for `t ∈ ℓ^kℤ_ℓ ∖ ℤ`, so `𝔏 = 0` and `N ∉ 𝔏`. Its closure `exp(ℤ_ℓN)` has `𝔏 = ℚ_ℓN`. Closed and non-compact: `exp(ℚ_ℓN)` gives `ℚ_ℓN`; the diagonal torus gives dimension `1 < 3`, not open; `SL₂(ℚ_ℓ)` gives `𝔰𝔩₂`, open. `{±1}`: `𝔏 = 0`. Milne 7434–7446. | Pass (r2 R03 repaired) |
| 5.8 compact, hence closed | `ρ(π₁)` is a continuous image of a profinite group in the Hausdorff `GL_d(ℚ_ℓ)`, hence compact and closed, as `Suggested.lean:118` requires. `d = 2`: `SL₂(ℤ_ℓ)` is closed and open; with one transvection, `exp(ℤ_ℓN)` fails `hirr`. `d = 0`: `{1}` is open. Milne line 7433; WeilI line 756. | Pass |
| 1.6 *Needs:* after the owner change | `1 + J₃`: the SR.5.2 logarithm `J₃ − J₃²/2` has square `J₃² ≠ 0` and cube `0`, so it is maximally nilpotent, matching `minpoly = (X−1)³`. The *Needs:* names ArithmeticGaloisRepresentations §2.4, which defers to SR.5.2. | R01 |
| Downstream: QuadraticFormsOverABase | Its line 488 (§2.1: `IsSmooth` versus ordinarity); lines 529–536 (§2.2: polar determinant versus 2.2); lines 229–233 (2.2 read in the Layer 4 Examples); lines 829–833 (étale centre only). | R02 |

| Statement (carried from the review of `dbf5ba2`) | Instances and values computed on each side | Result |
|---|---|---|
| Conventions: Frobenius and `N` | `N = [[0,1],[0,0]]`, `F = diag(1,3)`: `NF = [[0,3],[0,0]] = 3·FN`; `FN` has entry `1`. Geometric Frobenius on `(1)` is `1/3`, on `(−1)` is `3`. | Pass (r2) |
| Conventions: Picard–Lefschetz signs | `n = 0,1,2,3`: `(−1)^{m+1} = −,−,+,+`; `(δ,δ) = (−1)^m·2 = 2,0,−2,0` (zero for odd `n` by alternation). | Pass (r2) |
| 0.1 tame character (sample) | `σ(π^{1/m}) = ζπ^{1/m}` gives `ζ` in both constructions; the inverse convention gives `ζ⁻¹ ≠ ζ` for `m = 3`. Stacks0BU8 line 15763: `θ_can = qθ`, scaling by the wild order; tower compatibility by the `|I′_t|/|I_t|` power (line 15773). | Pass (r2) |
| 0.2 gluing triples (sample) | Constant sheaf `(Λ,Λ,id)`; `j_*G = (G^I, G, incl)`: for `G = ℚ_ℓ` with quadratic inertia, `G^I = 0`, triple `(0,ℚ_ℓ,0)`; the proposed `φ(1) = 1` from a trivial line would need `1 = σ·1 = −1`. `Y = ∅`: one object. | Pass (r2) |
| 0.2 oriented product (sample) | `X = S`, constant: specialization `id : Λ → Λ`, cone `0`; quadratic generic line: nearby object dimension `1`, invariants `0`. Illusie2006 lines 92–160 (pp. 3–4): points `(x, t → s)` and tube `X_(x) ×_{S_(s)} S_(t)`. | Pass (r2) |
| 0.3 `Ψ_η` | `X = S`: `Ψ_η F = F_η̄` (dimension `1` for a quadratic line) versus `i^*j_*F = F_η̄^I` (dimension `0`). Smooth `X`: `Ψ_η Λ = Λ`. | Pass (r2) |
| 0.4 cone and variation | Identity specialization: cone `0`, `Var = 0 = σ − 1`. Two-point swap: `q(a,b) = a − b`, `Var(t) = (−t,t)`, `Var∘q(a,b) = (b−a, a−b) = (T−1)(a,b)`. `S₃` example over `𝔽₅`: `F(T−1)e₁ = e₃ − e₁ ≠ e₂ − e₁ = (T−1)Fe₁`, while `FTF⁻¹ = T²` and `F Var F⁻¹ = T² − 1 = Var(σ²)`. | Pass (r2) |
| 0.5 stalks | Smooth constant: `(RΨ, RΦ) = (Λ, 0)`; node `xy = π`: nearby ranks `(1,1)` in degrees `0,1`, vanishing `(0,1)`; `n = 0`: nearby rank `2`, vanishing rank `1`. | Pass (r2) |
| 0.6 specialization sequence | `X = S`, `K = Λ`: `0 → Λ → Λ → 0`, identity. Disjoint union of two proper points: `H⁰ = Λ²` on both sides. | Pass (r2) |
| 0.7 constructibility and trait change (sample) | Illusie2006 lines 54–57 (p. 2): `f` of finite type over the henselian trait of line 18, `RΨ` preserves `D^b_c`, commutes with dominant trait change; Illusie2021 lines 884–886 (p. 103): the same. Identity trait over a non-excellent henselian DVR: `RΨΛ = Λ`, `RΦ = 0`. Coefficient change: `ℤ/ℓ ⊗ᴸ ℤ/ℓ` has `H⁰ = H⁻¹ = ℤ/ℓ`; index `e = 2`: `t_old = 2t_new`. | Pass (R03 of r1 repaired) (r2) |
| 0.8 adic realization (sample) | Node: `ℤ_ℓ(−1)` then `ℚ_ℓ(−1)` in degree `1`; smooth: `0`; torsion `ℤ/ℓ`: derived reduction `H⁰ = H⁻¹ = ℤ/ℓ`, underived only `H⁰`, rationalization `0`. Illusie1994 line 1357 (Variante 4.4, p. 47): adic and rational variant “par passage à la limite”. | Pass (r2) |
| 0.8a Betti comparison | Complex node `xy = t`: Milnor fibre `H⁰ = H¹ = Λ`; algebraic nearby stalk ranks `1,1` with `H¹` twisted `(−1)`; `z² = t`: both inertia loops swap the two points. | Pass (r2) |
| 0.10 pointwise purity and alteration | Regular trait, closed point: `H²_s(S, μ_n) = ℤ/n` by the valuation, `H¹_s = 0`; codimension `0`: identity. Stacks07QW line 6397: Dedekind domains with fraction field of characteristic zero are excellent, so mixed-characteristic traits qualify. Equal characteristic `p`, `X = S`, `S′ = S(π^{1/p})`: `η′^G = η′` radicial, `X′ → X` degree `p` not generically étale, as the Check says. ILO X line 7008 (arXiv p. 153): `W → W/K` Galois étale with group `K`; ILO line 12186 (arXiv p. 255, §3.7): `X‴` regular log smooth over `T`, apply 3.6.2. | Pass (r2) |
| 0.10 prime-to-ℓ descent and SNC | Degree `2` cover, `Λ = ℤ/3`: trace∘pullback `= 2`, invertible; `Λ = ℤ/2`: `0`. SNC with two branches: `R¹j_*Λ = Λ_{D₁}(−1) ⊕ Λ_{D₂}(−1)`, `R²j_*Λ = Λ_C(−2)`, exterior algebra ranks `1,2,1`. | Pass (r2) |
| 1.1 arithmetic headline (Lean) | `d = 0`: `GL(Fin 0)` trivial, `I₁ = ⊤` works. Algebraically closed residue field: the adjoined extension is `k`, `Module.Finite` holds, hypothesis fails, as intended (the character `1 ↦ 1+ℓ²` is not quasi-unipotent). Finite residue field: the extension is infinite, hypothesis holds. Illusie1994 line 126 (p. 11): exactly this hypothesis. | Pass (r2) |
| 1.1 geometric theorem | `y² = π`, `p ≠ 2`: inertia swaps two points, order `2`, `N = 0` after `K(√π)`; Tate curve: `T = 1 + J₂`, `(T−1)² = 0`, `T ≠ 1`. | Pass (r2) |
| 1.3 scalar invariance | `ℤ/4`, `N = 2`: `M₋₁ = M₀ = {0,2}`, `M₁ = X`; `2N = 0`: `M₋₁ = 0`, `M₀ = X`; unit `3`: `3N = 2 = N`. | Pass (r2) |
| 1.4 strictness and primitive decomposition (sample) | `J₂`, `i = −1`: `N(M₁) = ℚe₀ = im N ∩ M₋₁`; WeilII line 1166–1171 (p. 166, Lemme 1.6.5). `J₃`: `P₋₂` one-dimensional, grades at `−2,0,2` each dimension `1`; WeilII lines 1143–1150 (p. 165). Inclusion of a trivial line into `ker J₂`: source step `0`, target `im ∩ M₋₁ = ℚe₀`: not strict, as the README says. | Pass (r2) |
| 1.4 tensor and dual rules | `J₂ ⊗ 1 + 1 ⊗ J₂` on `ℚ⁴`: ranks of powers `2,1,0`, blocks `3 + 1`, weights `−2,0,2,0`; in characteristic `2` its square is `0`. Dual `−J₂ᵗ`: weights `−1,1`. WeilII lines 1205–1211 (1.6.9). | Pass (r2) |
| 1.5 relative filtration | `J₂`, `W₀ = ℚe₀`, `W₁ = ℚ²`: would need `N M₁ ⊂ M₋₁ = 0`, but `N M₁ = ℚe₀`: none exists. `W₀ = W₁ = ℚe₀`, `W₂ = ℚ²`: `M₋₁ = 0`, `M₀ = M₁ = ℚe₀`, `M₂ = ℚ²`, `N M₂ = ℚe₀ ⊂ M₀`. WeilII line 1255 (p. 168). | Pass (r2) |
| 1.6 maximal unipotence | `1 + J₃` on `ℚ³`: minimal polynomial `(X−1)³`, `dim ker (T−1)^j = 1,2,3 = min(j,3)`; `1 + (J₂ ⊕ 0)`: `(T−1)² = 0`, not maximal; identity on `ℚ²`: minimal polynomial `X − 1`, not maximal. Qian line 813–815 (PDF p. 21). | Pass (r2) |
| 1.7 normalized `var` | `J₂`: `P(T_Φ) = 1`, `v = a_σ⁻¹ Var(σ)`; `J₃`: `P = 1 + N/2`, `N P = N + N²/2`. Nonseparating node: `Var(1) = 0`, `t_ℓ(1) = 0`, no normalization from the identity. | Pass (r2) |
| 1.8 tame restriction | Coordinate crossing: tame pro-ℓ quotient `ℤ_ℓ(1)²`, `[N₁,N₂] = 0`; constant system: residues `(0,0)`; wild `p`-root cover excluded. Stacks0BMB line 2524 and Stacks0EYG/0EYH lines 3334, 3403 supply the cited branch purity and Abhyankar inputs; SGA1 line 12533 (App. I, Cor. 5.3). | Pass (r2) |
| 1.10 semisimple trace | `N = J₂`, `F = diag(1,3)`: invariant trace `1`, semisimple trace `4`; quadratic inertia line: `0`; shift by one: sign change. HainesNgo (arXiv math/0103047) lines 470–487 (pp. 12–13): Lemma 8, Corollary 9; KisinPappas line 3675 (p. 212). | Pass (r2) |
| 2.1 ordinary forms | `𝔽₂`, `xy`: polar matrix `[[0,1],[1,0]]`, determinant `1`; `x² + y²`: polar `0`, radical nonzero; `x² + ay²`, `a ∉ K²`: Mathlib radical `{Q = 0 ∧ polar = 0} = 0` but `ker Φ = K²` of rank `2`, so `Nondegenerate` fails (Radical.lean:35, :115). Normal forms `z²`, `xy`, `xy + z²` for ranks `1,2,3`. | Pass (r2) |
| 2.3 quadrics | Betti ranks `(2)`, `(1,1)`, `(1,2,1)` for `n = 0,1,2`; `P¹ × P¹`: rulings square `0`, product `1`; `#X(𝔽_q) = (1+q)²` split, `1 + q²` nonsplit; `n = 0`: `1 + ε ∈ {0,2}`. Affine: `𝔾_m` ranks `H⁰ = H¹ = 1`, `H¹_c = H²_c = 1`; `Tr(δ²) = 2, 0, −2` for `n = 0,1,2`. | Pass (r2) |
| 2.4 quadratic points | Node `xy`: Tjurina length `1`; `x²` in characteristic `2`: `k[x]/x²`, length `2`; cusp `y² = x³`: quadratic part `y²` not ordinary; smooth point: tangent dimension `n ≠ n+1`. Hensel: `g′(x̄)` a unit lifts; `x² − t` at `0` fails the Jacobian-square hypothesis. | Pass (r2) |
| 2.5 cones and Gysin | `𝔸¹`: `H⁰ = F`, higher `0`; `H²_0 = H²_c = F(−1)`. `Y = P^{r−1}`: `H^i(𝔸^r − 0) = F` for `i = 0, 2r−1`. Two boundary orders differ by sign: `ab` and `−ab`. | Pass (r2) |
| 2.6 standard degenerations | `xy − π`: `Y` two points, generic fibre smooth; `x² − π`, `p ≠ 2`: `Y = ∅`, two generic points; `x² + y² − π` in characteristic `2`: polar rank `0`, excluded; `xy` persistent cone: `RΦ = 0`. Even variation: `(ε−1)/2 ∈ {0,−1}`, reductions mod `2` are `0,1`. `ℤ/15`: `4² = 16 ≡ 1`, `(4δ,4δ) = 2`, so the norm does not fix `±δ`; `19² = 361 ≡ 1 mod 60`, `19 ≡ 4 mod 15`. | Pass (r2) |
| 2.7 concentration (R01 of r1) | `Λ = ℤ/1` on `xy = π`: `RΦ = 0`, support `∅ ⊆ {node}`, not equal; `Λ = ℤ/3`, residue characteristic `2`: stalk `ℤ/3(−1)`, support `{node}`. `n = 0`: nearby rank `2`, vanishing rank `1`. | Pass (repaired) (r2) |
| 2.7 even and odd local theorems | `x² = π`, `p ≠ 2`: swap, norm `2`, `v(b) = 2` trivial, `v(b) = 1` reflection. `xy = π`: `λ_X = −1`; `xy = π²`: `−2 t_ℓ`; `x² + tx + t` in characteristic `2`: `u² + u = 1/t` wild. Illusie2021 line 964 (footnote 21, p. 105): the erratum `|i| > 1`. | Pass (r2) |
| 2.8 Picard–Lefschetz for a proper family (sample) | `n = 0`, `y² = π`: `δ = e₁ − e₂`, sequence `0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0`, `x − (x,δ)δ` sends `e₁ ↦ e₂`. Genus-`g` curve: nonseparating node `dim H¹(X_s) = 2g−1`; separating `δ = 0`, `dim H²(X_s) = 2`, `R²f_*` stalks `ℚ_ℓ(−1)²` and `ℚ_ℓ(−1)`. WeilI lines 568–619 (pp. 288–289): (4.2), (4.3.1)–(4.3.3), A), B), (4.4) a)–b) with `ℚ_ℓ(m−n)_s`. Direct images: fixed space of `x ↦ x + c(x,δ)δ`, `c ≠ 0`, is `δ^⊥` (Transvection/Basic.lean:209 with `f(v) = 0` in the odd case). | Pass (r2) |
| 3.1–3.3 pencils and blow-up | Line in `P²`, axis off it: `S = ∅`; quadric surface: `|S| = 2`, `χ(X̃) = 6 = 2·2 + 2·1`; cubic surface: `|S| = 12 = 3·2²`, `χ = 9 + 3 = 12`; Hermitian curve: tangent multiplicity `≥ q ≥ 3`. Characteristic `2` conic: dual is a line, Gauss degree `2`. Empty centre: `X̃ = X`. | Pass (r2) |
| 3.4 existence (sample) | `N = 1`, `r = 2`: target `P^{C(3,1)−1} = P²`, `[s:t] ↦ [s²:st:t²]`, hyperplane pullback a binary quadratic, two critical members for `p ≠ 2`; `r = 0` constant, excluded. WeilI lines 706–714 (p. 292, (5.7)) and 803 (p. 294, (5.13) C)). | Pass (r2) |
| 3.5 finite-field descent | `P¹_{𝔽₂}` minus three rational points has no `𝔽₂`-point but has `𝔽₄`-points; eigenvalue `α = 3` becomes `9` over the degree-two extension. WeilI lines 962–968 (p. 299). | Pass (r2) |
| 3.6 arithmetic specialization (sample) | Artin–Schreier `y² − y = 1/t` in characteristic `2`: global image `ℤ/2`, wild inertia at `0`; the prime-to-`2` quotient would give `1`. Constant system: image `1` at every level and in the limit. WeilII lines 1854–1858 (p. 184, Proposition 1.11.1): the images `M_s̄` are fibres of a lisse subsheaf over an open `V`. | Pass (r2) |
| 4.1 direct images (sample) | Conic pencil: `R⁰` generic rank `2`, critical stalk rank `1`, swap invariants rank `1`, equal to the `j_*` stalk. Quadric-surface pencil: `R²f_*` acquires `ℚ_ℓ(−1)` at each of two points. Line pencil: `S = ∅`, `n = 0`, `R⁰ = ℚ_ℓ`. WeilI lines 715–748 (pp. 292–293, (5.8) a)–b)) and 804 ((5.13) D), p. 294). | Pass (r2) |
| 4.2 vanishing subspace | Conic: `E = ℚ_ℓ(1,−1)`, `E^⊥ = ℚ_ℓ(1,1)`; shear `(x,y) ↦ (x+y, y)`: `δ = (0,1)`, `gδ = (1,1) ≠ ±δ`, span unchanged. Twisted cubic in characteristic `2`: `x³ + ax + 1` has derivative `x² + a`, substitution leaves `1`; three sheets, image `S₃`, transports of `e₁ − e₂` span the sum-zero plane. | Pass (r2) |
| 4.3 fixed space | Alternating `ℚ²`, `δ ≠ 0`: `Fix(T) = ℚδ = δ^⊥`; dot product, `δ = (1,−1)`, `c = −1`: `T` swaps coordinates, `Fix = ℚ(1,1)`; `c = 0`: `Fix = V ≠ δ^⊥`. `δ = 0`: `T = id`, `0^⊥ = V`. | Pass (r2) |
| 4.4 radical quotient | `ℚ⁴`, `B(e₀,e₁) = B(e₂,e₃) = 1`: `E = span(e₀,e₁,e₂)` has radical `ℚe₂`, quotient dimension `2`; `span(e₀,e₂)`: quotient `0`. Conic trace `(a,b) ↦ a+b` and cup `x₁y₁ + x₂y₂` are swap-invariant. | Pass (r2) |
| 4.5 blow-up formulas | `P²` blown up at a base point of a line pencil: fibre class `H − E`, `(H−E)² = 1 − 1 = 0`; a `+E` sign would give `2`. Cubic surface ranks `(1,0,7,0,1)`; conic `(1,0,1)`. | Pass (r2) |
| 5.1 Bertini for images | Conic complement: image `C₂`; a transverse line surjects `ℤ̂ → C₂`; a tangent line gives a square, image `1`; constant system `1 = 1`. Frattini: `ℓℤ_ℓ ⊂ ℤ_ℓ` has residual image `0`, a subgroup surjecting mod `ℓ` is dense. | Pass (r2) |
| 5.2 conjugacy (sample) | Conic: both transports are `±(e₁ − e₂)`; quadric surface: both `0`. WeilI lines 658–689 (pp. 290–291): irreducibility of `X̌`, conjugate inertia loops, `±δ_s` conjugate; line 743 (p. 293): one zero forces all zero. | Pass (r2) |
| 5.3 normal and tame generation | `S₃`: `⟨(12)⟩` has normal closure `S₃` (order `6`), while `⟨(12)⟩` alone has order `2`; `S = ∅`: `π₁(P¹) = 1`. Conic: boundary loops both the swap, product `1`. SGA1 lines 11447–11458 (XIII 2.12): generators `σ_j` with product relation; Stacks0BQM line 1278. | Pass (r2) |
| 5.4 absolute irreducibility (sample) | Conic quotient: dimension `1`, every subspace `0` or all; plane cubic pencil: symplectic plane, a single transvection fixes a line so one transvection is not enough, but conjugacy gives both; `V = 0` excluded. WeilI lines 685–689 (p. 291, (5.5)) and 804–806 (p. 294). | Pass (r2) |
| 5.5 middle-degree reduction (sample) | `n = 1`, `m = 0`: evaluation line `ℚ_ℓ(m−n) = ℚ_ℓ(−1)`, geometric Frobenius eigenvalue `q` (for `q = 3`: `3`, versus `1/3` for the opposite twist). Quadric-surface pencil: `V = E = A = F = 0`. WeilI lines 1013–1019 (pp. 299–300, (7.1.2)–(7.1.5)); line 1019 and 1026 print `(n−m)`; (4.4) b) at line 616 prints `(m−n)`. | Pass (r2) |
| 5.6 symplectic Lie algebra | Plane with `ψ(e₁,e₂) = 1`: `N(e₁) = −E₁₂`, `N(e₂) = E₂₁`, bracket `−H`, span dimension `3 = dim 𝔰𝔭₂`; `N(cδ) = c²N(δ)`; one nilpotent alone: dimension `1`, reducible. WeilI lines 764–783 (pp. 293–294, (5.11)). | Pass (r2) |
| 5.9 characteristic two | Twisted cubic: chosen inertia fixes `x₁ = x₂`, conjugate fixes `x₁ = x₃`, common fixed line the diagonal; standard `S₃` representation on the sum-zero plane irreducible over every characteristic-zero field, including `ℓ = 3`. WeilII lines 3203–3209 (p. 220, 4.2.7). | Pass (r2) |
| 5.10 orthogonal alternative (Lean) | `d = 0`: `H = {1}`, finite. `d = 1`, `B = bx²`: a root needs `2/b` a square; then `T = −1`, `H = {±1}` finite; no root gives `hspan` false. `d = 2` hyperbolic over `ℚ_ℓ`, `ℓ` odd, `δ₁ = (1,1)`, `δ₂ = (a,1/a)`, `a = 1+ℓ`: `s_δ = −antidiag(a², a⁻²)`, rotations `diag((a/a′)², ·)`, `H ∩ SO = (1+ℓ)^{2ℤ_ℓ} = 1 + ℓℤ_ℓ`, open, infinite; orbit condition holds since `a = (a²)^{1/2}` with `1/2 ∈ ℤ_ℓ`. Norm-two reflection in rank one: group of order `2`. WeilII lines 3444–3448 (p. 228, Lemme 4.4.2ˢ) with `R = Mδ₁`: `M` finite or `M = O(V)`. | Pass (r2) |
| 5.10 finite ADE and trace identity | Norm-two roots with `(δ,δ′) = 0, 1, 2`: `Tr(s_δ s_{δ′}) = dim − 4 + b² = dim − 4, dim − 3, dim`; for `A₂` in `E` of dimension `2`: `−1 = 2 − 4 + 1`, rotation of order `3`; the printed `dim − 2 + b²` would give `1`. Twisted cubic: six roots `±(e_i − e_j)`, Weyl group `S₃`. WeilII lines 3544–3560 (p. 229–230). | Pass (r2) |
| 5.11 gcd lemma | `Id` and `−Id` in `Sp(V)` have spectra `{1}` and `{−1}`; a constant summand with eigenvalue `a` contributes `1 − a^rT`; `P = 1` trivial; `Q = P` holds. Nonunit `γ = ℓ`: `m! → 0` in `ℤ̂` but `ℓ^{m!} → 0 ≠ 1`, no continuous character. WeilII lines 3568–3625 (pp. 231–233). | Pass (r2) |
| 6.1 nearby duality (sample) | On a point, the dual of the constant line is the line; smooth curve: `DΛ = Λ(1)[2]`; node: stalk–costalk pairing twist `−1`. Illusie1994 line 1278–1282 (p. 45, Théorème 4.2): `X` separated of finite type, `M ∈ D_ctf`, `Λ` noetherian killed by an invertible integer; line 1357 (p. 47) adic variant. | Pass (r2) |
| 6.2 trait perversity | `X = S` strictly henselian: `Λ_S[1]`: `j^*` in degree `−1` ✓, `i^*` in degree `−1 ≤ 0` ✓, `i^! = Λ(−1)[−1]` in degree `1 ≥ 0` ✓, perverse; `K = Rj_*Λ_η[1]`: `i^*K[−1] = Λ ⊕ Λ(−1)[−1]`, cohomology in degrees `0,1`, not perverse; `Λ_X[d]` on a smooth family fails the generic bound. Point `πx = 1`: `δ = 1`. Illusie1994 lines 1360–1392 (pp. 47–48). | Pass (r2) |
| 6.2 exactness and vanishing cycles | Constant `ℚ_ℓ[d]` on the geometric generic fibre goes to `ℚ_ℓ[d]`; total-space `ℚ_ℓ[d+1]` needs `[−1]`; node: `RΦℚ_ℓ[2][−1] = ℚ_ℓ(−1)` at the node in degree `0`; `i_*Λ` skyscraper: `RΦ[−1] = Λ`. Illusie2021 lines 887–893 (p. 104). | Pass (r2) |
| 6.3 intermediate extension | `𝔸¹_S ⊃ 𝔾_{m,S}`, generic skyscraper at `x = π`: `RΨ(j_!P)` is the skyscraper at `0` while `RΨP = 0` on `U_s`: the `!` exchange fails; identity immersion: identity. | Pass (r2) |
| 6.5 filtered colimits | Infinite direct sum of `Λ` in degree `0` on a point: `H⁰ = Λ^{(ℕ)}`, bound `0` kept, not constructible; `Λ[a]`, `a → ∞`: no common bound; boundary system `(ℤ/ℓ, id)`: colimit `ℤ/ℓ ≠ 0`; zero transitions: `0`. CaraianiScholze lines 2613–2696 (pp. 60–62). | Pass (r2) |
| 6.6 isolated singularities | Node: one rank-one group in degree `1`, shift to perverse degree `0`; `H^{n−1}(X_s, RΦ) = 0`, so `H^n(X_s) → H^n(X_η̄)` injective; `n = 0`, `y² = π`: `R⁰Φ` rank one. | Pass (r2) |
| 7a.1–7a.2 graph complex and nodes | Edge `0 → 1`: `d = [1,−1]`, boundary `[−1,1] = −d`; loop: `d = 0`, cokernel `Λ`; two parallel edges: identical rows, cokernel rank `1`. `uv = π`: `N_e = −1`; `uv = π²`: `−2`, nonzero over `ℚ₂`. Illusie1991 line 1331 (Lemme 2.4, `c′ = −γ′`). | Pass (r2) |
| 7a.3 monodromy of a nodal curve | Rational loop: `rank N = 1 = b₁`, `dim ker N = 1 = dim H¹(Y)`; tree: `N = 0`; two parallel edges, cycle `(1,−1)`: `u₋ = −2`; thickness `3` on one loop: `−3`. Filtration centred at `1`: grades `(1,0,1)` for a loop, `(0,2g,0)` smooth, `(1,2,1)` for genus-one normalization with a loop. | Pass (r2) |
| 7a.4 Jacobian and pairing | Split multiplicative genus one: toric `ℚ_ℓ(1)`, graph quotient `ℚ_ℓ`, abelian part `0`; `u₋ = [−2]`, `u₊ = [2]`, cokernels `ℤ/2`. Illusie1991 lines 1401–1404 (PDF p. 46; article p. 41 by the volume offset): opposite sign to SGA 7 IX 9.1.2. | Pass (r2) |
| 7a.5–7a.6 base change and `I₂` | Thickness `2` under index `3`: `6` unit edges, pairing `3·(−2) = −6`; `y² = x³ + x² + π²`: `v(Δ) = 2`, `I₂`, `N(a,b) = (−2b,0)`, `N² = 0`. | Pass (r2) |
| 7a.7 strictly semistable stalks and grades | `a = 1,2,3` branches: exterior ranks `(1)`, `(1,1)`, `(1,2,1)`; `d = 1`, `m = 2`: `gr₁ = ℚ_C(−1)[−1]`, `gr₀ = ℚ_{D₁} ⊕ ℚ_{D₂}`, `gr₋₁ = ℚ_C[−1]`, matching 1.9; `N` sends `(p,q)` to `(p−1,q+1)(−1)` with twist `(−p)` preserved. Saito lines 773, 831, 867 (Lemma 2.2.1, Cor. 2.2.2, Prop. 2.2.3). | Pass (r2) |
| 7a.8 weight spectral sequence (headline) | `d = 1`: `E₁^{−1,2} = H⁰(nodes)(−1)`, `E₁^{0,1} = ⊕H¹(components)`, `E₁^{1,0} = H⁰(nodes)`; columns in `[−1,1]`, `d_r = 0` for `r ≥ 3`, so page `4 = 2d+2` is stable; smooth model: only `p = 0`. Nonproper `𝔸¹_S − {0_s}`: nearby `H¹ = ℚ_ℓ(−1)`, generic `H¹ = 0`. Saito line 885 (Cor. 2.2.4), 925, 974 (Lemma 2.2.5, Prop. 2.2.6). | Pass (r2) |
| 7a.9 `N` on the sequence | `I₂`: outer-grade matrix `[−2]`; smooth: `0`; curve `d₂` lands outside the nonzero rows. | Pass (r2) |
| 7b.1–7b.2 invariants and Wang | Shear `(a,b) ↦ (a+tb, b)`: invariants `ℚ ⊕ 0`, injection `a ↦ (a,0)` corestricts onto, identity does not land in invariants. `N = 0` line: tame `H⁰`, `H¹` ranks `1`, `H¹` twisted `(−1)`; `J₂`: kernel and cokernel rank `1`; quadratic line: both `0`. | Pass (r2) |
| 7b.3–7b.4 spreading and cross | Constant family: identity; nonseparating node: image codimension `1`, `N ≠ 0` kept; `x² + tx + t` in characteristic `2`: invariants the diagonal for `ℓ ≠ 2`. `X = P¹ × S`, `d = 2`, `i = 0`: upper term `H³(P¹)^∨(−2) = 0`, right term the constant line. Duality degree `2d − i − 1`, twist `−d`. | Pass (r2) |
| 7b.5 local invariant cycles (headline) | `M = k²`, `F = diag(1,q)`, `q ≠ 1`, `B` first coordinate, `C` second: spectra `{1}` and `{q}` disjoint, `ker(M → C) = k ⊕ 0 → B` onto; `L = 0`, `M = B = C = k`, `F = 1`: spectra meet, image `0 ≠ k`. Nodal loop: `sp` onto `ker N` of rank `1`. WeilII 3.6.1 at p. 213 (PDF 78). | Pass (r2) |
| 7b.6 complex theorem | Disk identity: nearby `H⁰ = ℚ`, `T = 1`; `T = [[1,1],[0,1]]`: Wang image `ker(T−1) = ℚe₀ ≠ ℚ²`; weight ranges `≤ i` and `≥ i+1` disjoint. | Pass (r2) |
| 7b.7 incidence and models | Nodal plane cubic: `q : Z → X` a `P¹`-bundle though `Z` singular; `X = Spec k ⊂ P¹`: `Z` one point; `V(x₀) ⊂ P²` with axis `x₀, x₁`: first equation zero on `X`, regular sequence fails. Smooth hyperplane section of a smooth `X` of dimension `d`: dualizing `Λ(d−1)[2d−2] = (Λ(d)[2d])(−1)[−2]`; skyscraper at `x`, section `{x}` on `P¹`: `h^!K = Λ ≠ Λ(−1)[−2]`. Shift `[1](1)`: weight `w + 1 − 2`. | Pass (r2) |
| 7b.9 support bound and weak Lefschetz | `X` smooth of dimension `n+1`, `K = ℚ_ℓ`: `DK[−2n−2] = ℚ_ℓ(n+1)`, bound `n+1−0 = n+1` attained; `n − 1 − j` would demand `n+1 ≤ n−1`. `P¹`, `n = 0`: affine complement `H⁰_c = 0`. Conic, `n = 0`: `H⁰(X) → H⁰(Y) = ℚ_ℓ²` diagonal, injective not onto. | Pass (r2) |
| 7b.10 obstruction detection | Twisted cubic, `L = h_*Λ`: `H⁰(P¹,L) = Λ`, `H¹ = 0`, `L_t = Λ³`, `H¹(P¹ mod t, L) = Λ³/Λ(1,1,1)` of dimension `2`; at infinity the local relative group is one-dimensional, one transport kills `(1,1,0)`, all three transports have common kernel the diagonal. Conic: diagonal class extends across both critical fibres. | Pass (r2) |
| 7b.11 global invariant cycles (headline) | Conic, `K = ℚ_ℓ`, `n = 0`: `1 ↦ (1,1)`, ambient `H⁰` equals the swap-invariant line; `K = 0`: `0 ≅ 0`; constant `K` on a smooth `(n+1)`-fold: bound `n+1` at `j = 0`. WeilII 6.2.12 at p. 250 (PDF 115). | Pass (r2) |

The carried block has 72 rows. Together with the 12 new rows, the table covers the fifteen sampled targets, the six Lean declarations, the headline theorems and every statement the two findings touch.

## Not verifiable

- **Schneider 2011** (*p-Adic Lie Groups*, cited in 5.7 for §§18.10–19, Exercise 26.2, Theorem 27.1, Proposition 29.2 and Corollaries 29.4–29.6): paywalled, so cited by locator only. The closed-subgroup form of 5.7 was checked through Milne Lemma 32.7 and AdelicAlgebraicGroups §4.2 instead.
- The other unreadable texts of the previous review (SGA 7 I–II, Fujiwara 2002, Illusie 2002, BBD, Jouanolou 1983, SGA 4, SGA 4½, SGA 5, Huber 1996, BLR, Illusie 2003 and Vidal 2004b) back targets this diff does not touch. They were not attempted again.

## Source issues

- **Misprint** in Milne at Lemma 32.7 (b), printed p. 191: the source says the vectors `δ` of the generating transvections lie in `G`; it should be `W`, the space the transvections act on, as in Lemma 32.8 (b); affects nothing.
