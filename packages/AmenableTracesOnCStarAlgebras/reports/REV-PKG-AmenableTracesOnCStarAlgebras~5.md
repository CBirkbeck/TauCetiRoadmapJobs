<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6800275611 -->
Review (claude) of 6e93daa

Verdict: accepted

No finding (no P1, no P2, no P3). The one finding of the previous review is repaired, the repaired
passages hold, and the full pass over the README and `Suggested.lean` found nothing to repair.
No maintainer notes were left; the plan declares no supplier gaps.

## Previous finding

- **F01 (P3), three `### Dependencies` lists omitted supplier sections their layers cite —
  repaired.** `packages/AmenableTracesOnCStarAlgebras/README.md` now reads, Layer 1 (line 826):
  "CStarAlgebras C5.1, C8.4 (a Check)"; Layer 2 (line 1036): "CStarAlgebras C2.8, C4.1, C4.2, C5.2,
  C8.3 (a Check)"; Layer 7 (lines 1907–1908): "VonNeumannAlgebras V0, V13b (the remark on condition
  (v) of §7.3); FactorRigidity §2.2 (the same remark; no statement depends on it)". The diff between
  the two heads touches these three paragraphs and nothing else in the package (`Suggested.lean`,
  `sources.toml`, `metadata.toml` unchanged).
  Adversarial pass on the added citations: C8.4 on main is the Toeplitz extension (line 1676), the
  object of the §1.2 Check; C8.3's Check (lines 1663–1667) gives
  `φ_n(z)φ_n(z̄) − φ_n(1) = −e₀e₀*`, and I recomputed §2.2's values from it
  (`d₂(φ_n, z̄) = tr_n(e₀e₀*) = 1/n`, `d_∞ = 1`); FactorRigidity §2.2 is at line 217 and V13b at
  line 4692. The clause "no statement depends on it" is accurate: the cycle
  (i) ⇒ (ii) ⇒ (v) ⇒ (iv) ⇒ (iii) ⇒ (i) of §7.3 uses D2, §5.3, §3.3, D2.FreeGroups, §4.4 and
  `TauCeti.Amenable.of_lpTop` only.
  Same pattern elsewhere: I read every layer body against its `### Dependencies` paragraph; each
  roadmap section cited in a body (C2.1 … C9.7, V0 … V13b, CL2/CL3, D2, D2.FreeGroups, B1,
  FactorRigidity §2.2) appears in that layer's list. FactorRigidity is on main, so the citation
  is not upward although the merge order lists it after this roadmap.

## Verified sound

**Elaboration.** `lake env lean` on `packages/AmenableTracesOnCStarAlgebras/Suggested.lean` from
the content checkout: exit 0 in 21 s; 21 warnings, all "declaration uses `sorry`", one per theorem;
no other message. No `TauCeti.*` module needed building. The pins named in the README (Mathlib
`1b1ccf4b…`, Tau Ceti `2fd255d9…`) are those of the content repository's `lake-manifest.json`.

**Padding probe, all 21 theorems.** On a scratch copy every `sorry` proof was replaced by
`first | rfl | (simp; done) | infer_instance | trivial | tauto | (exact?; done) | (simp_all; done) | (aesop; done)`:
21 errors, one per theorem; none closes. No theorem restates a definition, mirrors a Check,
computes a value or treats a boundary case. 19 definitions and 4 instances, all with real bodies;
no sorried data, `set_option`, `lemma`, `#eval`, `#print`, `#synth`, `True` placeholder or
admitted `example`. Imports: `import Mathlib` and three `TauCeti.*` modules, each used
(`…Action.KMS.Basic` for `IsKMSState` and `trivial`, `…VonNeumannAlgebra.Adjoin`,
`…Amenable.Basic`).

**Signatures.** `#check @name` for all 44 declarations in the same scratch file, compared with the
README statements. Four definitions drop an order class their bodies do not use
(`IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace`: `[StarOrderedRing A]`; `IsAF`: both); every
theorem keeps its instances and hypotheses. All 44 Lean names occur backticked in the README; no
backticked name of this roadmap's own is missing from the Lean file.

**Headlines (README Summary) against `Suggested.lean`.** Stated: Connes–Kirchberg in hypertrace,
tensor-norm and extension forms; Følner sufficiency and equivalence; the tracial von Neumann form;
uniform amenable ⇔ injective `π_τ(A)''`; the nuclear case; the exact case; both face theorems;
unitization; normalized restriction (subalgebras, corners, ideals, quotients); extension from
ideals; commutative and AF algebras (finite-dimensional and UHF algebras are AF); the group
theorem; quasidiagonal algebra ⇒ quasidiagonal trace; faithful quasidiagonal trace ⇒
quasidiagonal; Rosenberg; subalgebras of simple unital AF algebras. Named in the module docstring
as not statable, with the missing carrier: minimal tensor permanence (`A ⊗min B`), the bimodule
form (`π_τᵒᵖ`), the vector-trace clause (`τ''`). I considered whether the last two could be forced
through a universally quantified map pinned by a hypothesis; that would be an ad hoc encoding of a
construction the README owns (§1.4), and the Summary's own headlines (hypertrace, tensor norm,
extension, injectivity) are all stated. None absent, none through a stand-in.

**Shape.** 40 numbered subsections, each with a `*Needs:*` line and at least three Checks
(counts 3–6); every definition section has an API list; every layer ends with `### Examples` and
`### Dependencies`. Layer order is forced by the dependency lines (Layer k needs Layers 1–(k−1):
the faces of Layer 6 need §4.4 and §5.2, the examples need Layers 5–6, Layer 8 needs §7.3); no
layer is named after a source chapter and the order differs from brown2006's (definitions before
the characterization, nuclear and exact cases before permanence). No LaTeX delimiters, process
words, pull-request numbers, anchors or machine paths in the README or the Lean file.

**Restated predicates agree with their owners.** `IsQuasidiagonalSet`, `IsQuasidiagonal`
(CStarAlgebras `Suggested.lean` lines 277, 286), `IsInjective` (VonNeumannAlgebras line 684),
`IsNormalState` (VonNeumannAlgebras `IsNormalFunctional`, line 234, same body; its discriminating
Check, the free-ultrafilter limit on `ℓ∞(ℕ)`, is at VonNeumannAlgebras README line 1422), `IsAF`
(CStarClassification line 82) and `generatedCStarAlgebra` (OperatorAlgebraDynamics line 337) have
bodies identical to the suppliers', in this roadmap's own namespace, so no fully qualified name
is shared. VonNeumannAlgebras' `IsTracialState` is a different declaration (on a
`VonNeumannAlgebra`, for a linear functional), as the Scope section says.

**Sources: the 15 sampled targets and every other locator of brown2006, schafhauser2020 and
tikuisis-white-winter2017 that the README gives a line for.** No locator was flagged unverified.
Read at the cited lines: brown2006 340–341, 361, 378–384, 403–406, 413–418 (Lemma 2.1, norm
identity as in §2.3), 429–431 (Theorem 2.2), 466–468 (Lemma 2.4, `1_A ∈ B`), 486–488 (Lemma 2.5,
unital monomorphism), 514–532 (Lemma 2.7, with the inequality of §1.5 at 530), 558–560, 589–592,
595–600, 613–616 (Powers–Størmer), 658, 662–667 (Lemma 3.1.4, bound `2‖uhu* − h‖₁^{1/2}`),
759–764 (Lemma 3.1.5, two-term form; §2.2's one-term form is sharper and is derived there),
793–801, 804–810, 817–828 (with footnotes 2 and 3 at 819 and 822), 897–914 (Theorem 3.1.7),
953–958, 971–992 (Theorem 3.2.2, (6) at 990), 1035–1040, 1078–1080, 1097–1121, 1192, 1201,
1218–1221, 1250, 1269, 1274–1276, 1282–1294, 1306–1321, 1338–1340, 1423–1431, 1452–1454,
1469–1474, 1515–1519, 1539–1549, 1551–1566, 1575–1578, 1608–1616, 1707–1708, 1908–1915,
1925–1936, 1952–1955, 1969–1973; tikuisis-white-winter2017 53–54, 359–364, 376–380, 431,
456–464, 471–472; schafhauser2020 69–70, 75–77, 78–84. Each carries the cited statement with the
cited number. Where the README is more general than the source (no unit, no separability, no
general position, injectivity in place of hyperfiniteness, no local reflexivity in §5.4) it says
so and gives its own route, checked in the table.

**Adversarial table** (sampled targets, headlines, repaired passages).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2 `N_τ` closed two-sided, `= ker π_τ`, `=` trace radical | `ℂ²`, `pr₁`; `M_2`, `tr_2`; `M_2`, `ω = x₁₁` | `N = 0 ⊕ ℂ = {x : x₁y₁ = 0 ∀y}`; `tr_2(x*x) = Σ|x_ij|²/2`, `N = 0` but `ker tr_2 ∋ e₁₂`; `{a : ae₁ = 0} ∋ e₁₂`, `∌ e₁₂e₂₁ = e₁₁` | holds; traciality gives the right ideal |
| §1.2 route | right ideal; radical | `τ((ab)*(ab)) = τ(abb*a*) ≤ ‖b‖²τ(aa*) = ‖b‖²τ(a*a)`; `|τ(yx)|² ≤ τ(yy*)τ(x*x)`; `y = x*`: `τ(xx*) = τ(x*x)` | sound |
| §1.2 Toeplitz; simplicity | `K(ℓ²)`; zero algebra | tracial positive functional on `K`: all `e_ii` equal, sum bounded, so `0`; no state on `0` | holds |
| §1.3 (used by §6.3, §6.5) | `c₀`, `Σ2^{-n}δ_n`; `A = ℂ`; `0 ≤ e′ ≤ e ≤ 1` | `Σ2^{-n}(x_n − x_∞) + x_∞ = Σ2^{-n}x_n`; `τ̃((1̃ − 1_A)²) = 1 − 1 = 0`; `(1 − e)² ≤ 1 − e`, `γ(ab) = lim τ(ea·be) = lim τ(be·ea)` | faithfulness transfer needs "no unit" |
| §1.6 Lemma 2.5 | `(1/3, 2/3)`; `(1, 0)` with `(N, 1)` and `(N, 0)` | `diag(a, b, b)` exact; `|1 − N/(N+1)| + 1/(N+1) = 2/(N+1)`; `(N, 0)`: `ρ(0, 1) = 0` | multiplicity ≥ 1 needed for injectivity |
| §1.6 Lemma 2.4 | `M_2 ⊇` diagonal; `B = A = M_n`; `ℂ³`, `(1/2, 1/2, 0)`, `B = {(a, a, b)}` | `(x₁₁/2)(1/2)⁻¹ = x₁₁`; `Σ tr(xe_ij)·n·e_ji = x`; junk `0⁻¹ = 0` kills `(0, 0, 1)`; correct `Φ` has `τ∘Φ = (x₁ + x₂)/2` | faithful/vanishing block split needed |
| §2.1 2-norm unitalization | `φ = id/2` on `M_2`, `δ = 1/2` | `‖ψ(x) − φ(x)‖₂ = ‖x‖₂/2 ≤ 2‖x‖/√2`; general: `‖x − hxh‖₂ ≤ 2‖x‖‖1 − h‖₂`, `‖1 − h‖₂² ≤ 1 − tr φ(1)`; product constant `2 + 2 + 2 = 6` | holds |
| §2.1 norm unitalization | `φ(1) = diag(1, 1/100)` | `φ(1) − φ(1)² = diag(0, 0.0099)`; roots of `t(1 − t) = δ`: `t₋ = 2δ/(1 + √(1 − 4δ)) ≤ 2δ`, `t₊ ≥ 3/4`; `Q = e₁₁` | `δ ≤ 1/8`, `‖φ(1)‖ > 2δ` suffice |
| §2.1 c.p.c. Kadison–Schwarz | `id/2`; `2·id` | `a*a/4 ≤ a*a/2`; `4 > 2` at `a = 1` | contraction needed |
| §2.2 (used by §3.5, §6.5) | `φ = x₁₁`, `(e₁₂, e₂₁)`; `C(𝕋)`, `P_n` | `T(a) = (1 − VV*)^{1/2}π(a)V`, defect `T(a*)*T(b)`; `1 ≤ 1·d₂(φ, e₂₁)^{1/2} = 1`; `P − PM_zPM_z̄P = proj(z⁰)`: `1/n`, norm `1` | sharp; equals C8.3's `−e₀e₀*` |
| §2.4 Ozawa | rank one; `diag(1/3, 2/3)` | `1 − c² ≤ 2^{3/2}(1 − c²)^{1/4}`; entries `⟪v_i, Tv_j⟫δ_rs`, so `min(p_i, p_j)`; `√(p_ip_j) − min = √min·|√p_i − √p_j|`; `x²/2 + x ≤ 2y` for `x ≤ y ≤ 2` | bound `2‖·‖₁^{1/2}` holds; `max` would give `2/3 > 1/3` |
| §3.1 definitions | `φ_m = τ(·)1_m/m`, `M_2`, `(e₁₂, e₂₁)`; `k = 0` | `Tr_m = 1/2`, defects `1/(2m)`, unnormalized `1/(2√m)`, `|tr_mφ_m(1) − 1| = 1 − 1/m`; `M_0`: error `|τ(a)|` | normalization needed; `k = 0` harmless |
| §3.2 `isAmenableTrace_unitization_iff` | `A = ℂ`, `φ = (1 − δ)id`; unital `A` | `φ̃` defect `= φ(ab) − φ(a)φ(b)`; `(a, λ) = (1, −1/2) ↦ (1/2, −1/2)`, norm `1/2`, value `−δ`: norm `2δ`; unital `A`: `φ̃(x, λ) = φ(x) + λ(1 − φ(1))` c.p. | factor `2` attained; true for unital `A` |
| §3.2 unital maps, f.d. approximants | zero algebra; `(1/3, 2/3)` | no u.c.p. map `0 → M_k`, `k ≥ 1`, and no state; `‖ρ(x)‖₂² ≤ ‖x‖²_{2,γ} + δ‖x‖²` | holds |
| §3.5 tensor products | `e₁₁ ⊗ e₁₁`; `C*_r(F₂) ⊗ M_2` | defect `= (φ(aa′) − φ(a)φ(a′)) ⊗ ψ(bb′) + φ(a)φ(a′) ⊗ (ψ(bb′) − ψ(b)ψ(b′))`; trace `1/4`, 2-norm `1/2`; pullback along `x ⊗ 1` is `τ_{F₂}` | holds; not statable at the pins |
| §4.1 `IsHypertrace`, independence | `M_n`; `ℂ1`; `ℂ²`, `ψ′` at `(1, 1)/√2` | `ψ = tr_n` forced; every state; `ψ′(e₁₁e₁₂) = 1/2 ≠ 0 = ψ′(e₁₂e₁₁)`; `ψ∘Ψ(ρ(a)T) = ψ(π(a)Ψ(T))` by the multiplicative domain | centrality is a real condition |
| §4.4 three Lean forms | `M_n`; `ℂ²`, `pr₁`; `n = 0`; `H = 0` | `μ(e₁₂ ⊗ e₂₁ᵒᵖ) = 1/n ≤ 1`; `Φ(T) = T₁₁`, `μ = ac`; `0 ≤ 0`; unital injective `π` into `B(0)` forces `A = 0`, no state | constant `1` right (positive, `μ(1) = 1`); no vacuous case |
| §4.5 `IsFoelnerTrace` and both theorems | `C(𝕋)`, `P_n`; `ℂ²`, `(1/3, 2/3)`; `A = ℂ` on `ℓ²` | `‖π(a)eᵢ − Σⱼ⟪eⱼ, π(a)eᵢ⟫eⱼ‖ = ‖(1 − P)π(a)eᵢ‖`; `1 + 1 = 2 < εn`; rank one: `2|ξ₁|²|ξ₂|² = 4/9`, rank two: `1/2 ≠ 1/3`; commutator `0`, trace exact | converse needs `hess`; sufficiency: `‖φ(ab) − φ(a)φ(b)‖₂² ≤ ‖a‖²n⁻¹Σ‖(1 − P)π(b)eᵢ‖²` |
| §4.6 `isAmenableTrace_iff_isInjective` | `M_n`; `L(F₂)`; `H = 0`; index universe | identity; both sides false; no state; a net may be replaced by its range in `M : Type u` | holds; `τ∘E` direction needs neither `hf` nor `hn` |
| §5.1 commuting-range lemma | `β = id`, `y_kl = e_lk`; general | `Σe_kle_lk = 2·1`, flip of norm `1`; `Σ_m⟪w_mξ, Yw_mη⟫ = Σ_kl⟪ξ, (R*R)_kl y_kl η⟫`, `Σw_m*w_m = β(1) ≤ 1` | commutation needed |
| §5.2 `isUniformAmenableTrace_iff_isInjective` | `C*(F₂)`; `C[0,1]`, `f = t`; `C(𝕋)` arcs | amenable, `L(F₂)` not injective; variance `1/(12n²)`; `tr_n∘φ_n = Σ∫_{I_k}f = ∫f`; `d₂(x)^{1/2} ≤ d₂(a)^{1/2} + d₂(x − a)^{1/2}`, `‖x − a‖ ≤ 2‖x‖` | `UAT ≠ AT`; estimate of (i) ⇒ (iv) holds |
| §5.3, §5.4 | `K(ℓ²)`; `C*_r(F₂)`; `C*(F₂)` | `T = ∅`; all four clauses fail, `λ` nuclear into `B(ℓ²)` only; amenable with non-injective `M_τ`; `π_τ = Φ∘π ≈ (Φ∘β)∘α` | target `M_τ` and exactness needed; no local reflexivity used |
| §6.2 faces | `C*_r(F₂) ⊕ ℂ`; `M_2 ⊕ M_2` | `AT = {χ∘pr₂}`; whole segment; `sτ₁ ≤ γ` | iff holds both ways |
| §6.3 `isAmenableTrace_of_normalized_comp` | `M_3 → M_4`; `c = 1/2`; `c₀ ⊆ c`; `c = 0` | `τ(ι̃(a + λ)) = cγ(a) + λ = c(γ(a) + λ) + (1 − c)λ`; `3/4 + 1/4 = 1`, `3/4 + 0`; `(3/2)tr_3` not a state; `δ_1/2 ↦ δ_1`; `τ∘ι = 0` | `hγ` pins `c = ‖τ∘ι‖ ≤ 1`; `hc` needed |
| §6.4 image of GNS | `C*(F₂) → C*_r(F₂)`; `ℂ²`, `pr₁` | amenable ↦ non-amenable, so no c.p.c. splitting; `σ(λ) = (λ, 0)`; `Ψ(1) ≥ Ψ(1_B) = 1`, `‖Ψ‖ ≤ 1` | splitting needed; unital by positivity |
| §6.5 `isAmenableTrace_of_comp_ideal` | `M_2 ⊕ 0`; `c₀ ⊆ c`; `q : C*(F₂) → C*_r(F₂)` | `γ = tr_2∘pr₁`; omitted mass `2^{-m}`; `‖ψ(x − ex)‖₂² ≤ tr ψ(x*(1 − e)²x)`, `γ((1 − e)xx*(1 − e)) ≤ ‖x‖²(1 − τ(e))`; false for `q` | `hι` needed |
| §7.1 | `C[0,1]`; `M_2 ⊕ ℂ`; `A = 0` | `(n + 1)/(2n) → 1/2`; `(Tr x + 2λ)/4`; no state | holds |
| §7.2 AF, UHF | CAR; `K(ℓ²)`; `C(Cantor)`; `A = 0` | `τ(e₁₁ ⊗ 1) = 1/2`, `ρ_n = id`; `T = ∅`; cluster point tracial on `∪B_m`; `IsAF 0` holds, no state | existence needs a unit and `A ≠ 0` |
| §7.3 group theorem | `ℤ`; `S₃`; `F₂`; trivial; item 4 | `λ_1M_{δ_0}λ_1* = M_{δ_1}`; `Tr(λ_e) = 6`; all fail; all hold; `ψ(M_{L_gf}) = ψ(λ_gM_fλ_g*) = ψ(M_f)`; item 4 is "the canonical trace is amenable" since that trace exists | matches `TauCeti.Mean.IsLeftInvariant` (`f(g⁻¹x)`) |
| §8.1 | degenerate `π`; `SO₂`; Toeplitz | `ξ ∈ π(1)H`; `τ′(1) = 2τ′(1)` on `O₂`; `|tr φ(ab) − tr φ(ba)| ≤` sum of two defects | unit needed; converse fails |
| §8.3 `isQuasidiagonal_of_isQuasidiagonalTrace` | `C(𝕋)`; Toeplitz; `ℂ²`; universe | kernel is an ideal, `τ(a*a) ≤ limsup‖φ_n(a*a)‖ = 0`, so isometric; non-faithful traces only; `diag(a, b)`; a separable Hilbert space exists in every `Type u` | faithfulness and separability used |
| §8.4 Rosenberg | `ℤ`; `F₂`; finite `Γ`; uncountable `Γ` | `C(𝕋)` quasidiagonal, `ℤ` amenable; neither; both; §8.1 and §7.3 use no separability | holds; no `DecidableEq` needed or assumed |
| §8.5 `subalgebra_isAF_simple` | `M_3 ⊆ M_4 ⊆ CAR`; `C(𝕋) ⊆ CAR`; `B = ℂ²`; `A = 0`; `B = 0` | `c = 3/4`; dyadic arcs of mass `2^{-m}`; `pr₁` not faithful; no state; excluded by `[Nontrivial A]` and `hι` | simplicity and `A ≠ 0` needed |
| Repaired Dependencies | Layers 1, 2, 7 | C8.4 = Toeplitz; `1/n`, `1` from `−e₀e₀*`; `L(ℤ)` injective, `L(F₂)` not | consistent with the bodies |

**Library declarations opened at the pins** (file and line). Mathlib:
`CompletelyPositiveMap.map_cstarMatrix_nonneg` (`…/CompletelyPositiveMap.lean`:133) and
`NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass` (:153); `CStarMatrix.ofMatrix`
(`…/CStarMatrix.lean`:55); `Matrix.trace_mul_comm` (`…/Matrix/Trace.lean`:156);
`Matrix.frobenius_norm_def` (`…/Matrix/Normed.lean`:578); `PositiveLinearMap.GNS`,
`gnsNonUnitalStarAlgHom`, `gnsStarAlgHom` (`…/GelfandNaimarkSegal.lean`:147, 196, 246);
`PositiveContinuousLinearMap.tendsto_nhds_opNorm`, `ofReal_opNorm_eq_map_one`
(`…/PositiveLinearFunctional.lean`:48, 74); `PositiveLinearMap.exists_norm_apply_le`
(`…/PositiveLinearMap.lean`:63); `StarSubalgebra.cstarAlgebra`,
`NonUnitalStarSubalgebra.nonUnitalCStarAlgebra` and the `MulOpposite` instances
(`…/CStarAlgebra/Classes.lean`:50, 63, 163–167); the `CStarRing` instance on `Eᵐᵒᵖ`
(`…/CStarAlgebra/Basic.lean`:215); `Subtype.starOrderedRing` (`…/Range.lean`:285);
`StarSubalgebra.isClosed_topologicalClosure` (`Mathlib/Topology/Algebra/StarSubalgebra.lean`:83);
`Set.isClosed_centralizer` (`…/Group/Basic.lean`:34); `VonNeumannAlgebra.centralizer_centralizer`
(`…/VonNeumannAlgebra/Basic.lean`:121); `ContinuousLinearMap.instStarOrderedRing`
(`…/InnerProductSpace/StarOrder.lean`:79); `Unitization.instCStarAlgebra`
(`…/CStarAlgebra/Unitization.lean`:182); `Unitization.instPartialOrder`, `instStarOrderedRing`,
`inr_le_inr_iff` (`…/ContinuousFunctionalCalculus/Order.lean`:90, 93, 109); `Unitization.starLift`
(`Mathlib/Algebra/Algebra/Unitization.lean`:805); `CStarAlgebra.approximateUnit`,
`increasingApproximateUnit`, `Filter.IsIncreasingApproximateUnit` (`…/ApproximateUnit.lean`:215,
320, 143); `CStarAlgebra.exists_sum_four_unitary` (`…/Unitary/Span.lean`:87);
`gelfandStarTransform` (`…/GelfandDuality.lean`:190); `RealRMK.rieszMeasure`
(`…/RieszMarkovKakutani/Real.lean`:66); `TensorProduct.mapL`
(`…/InnerProductSpace/TensorProduct.lean`:603); `lp.single` (`…/Lp/lpSpace.lean`:1007);
`ContinuousLinearMap.toPointwiseConvergenceCLM` (`…/PointwiseConvergenceCLM.lean`:155);
`geometric_hahn_banach_closed_point` (`…/LocallyConvex/Separation.lean`:230); `IsCompactOperator`
(`…/Compact/Basic.lean`:69). Tau Ceti: `CStarAction.trivial` (`…/Action/Basic.lean`:145);
`CStarAction.Hom` (`…/Action/Hom.lean`:36); `IsKMSState`, `isKMSState_zero_iff`,
`IsKMSState.comp`, `comp_of_surjective`, `isKMSState_comp_iff_of_surjective`, `IsKMSState.restrict`
(`…/Action/KMS/Basic.lean`:222, 237, 321, 330, 337, 349; line 238 reads
`‖ω‖ = 1 ∧ ∀ a b, ω (a * b) = ω (b * a)`, for any action); `isKMSState_trivial_iff`
(`…/KMS/Dense.lean`:144); `IsKMSState.of_tendsto`, `kmsStates`, `closure_kmsStates_inter_subset`,
`convex_kmsStates`, `isClosed_kmsStates`, `isCompact_kmsStates` (`…/KMS/StateSpace.lean`:51, 61,
106, 119, 138, 148); `PositiveLinearMap.toGNS`, `denseRange_toGNS`, `gnsVector`,
`inner_gnsStarAlgHom_gnsVector`, `inner_gnsVector_coe`, `denseRange_gnsStarAlgHom_gnsVector`,
`norm_gnsVector` (`TauCeti/Analysis/CStarAlgebra/GNS.lean`:54, 62, 72, 86, 94, 99, 110);
`VonNeumannAlgebra.adjoin`, `subset_adjoin` (`…/VonNeumannAlgebra/Adjoin.lean`:38, 59);
`exists_forall_norm_sub_apply_lt_of_mem_adjoin` (`…/Density.lean`:155);
`IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (`…/KMS/Separating.lean`:114);
`LinearMap.traceRadical`, its `IsTwoSided` instance, `traceRadical_ne_top`
(`…/TraceFunctional/Radical.lean`:45, 58, 87); `Matrix.frobeniusInnerProductSpace`,
`frobenius_inner_eq_trace_conjTranspose_mul` (`…/Matrix/Frobenius.lean`:57, 106);
`LinearMap.existsUnique_trace_mul_eq`, `Matrix.mem_range_scalar_iff_trace_mul_mul_comm`
(`…/Trace/Duality.lean`:31, 52); `TauCeti.Mean.IsLeftInvariant`
(`…/Amenable/Basic.lean`:64, docstring `(L_g f)(x) = f (g⁻¹ * x)`); `TauCeti.Amenable.of_lpTop`
(`…/Amenable/Linfty.lean`:159); `TauCeti.not_amenable_freeGroup` (`…/Amenable/FreeGroup.lean`:40);
`LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`
(`…/CharacterSpaceMeasure.lean`:134). Every name the README cites exists where it is cited.

**Duplication.** Pinned Mathlib and Tau Ceti searched by object (tracial, hypertrace,
quasidiagonal, nuclear map, normalized trace, 2-norm, GNS von Neumann algebra): Tau Ceti has
tracial states only as `0`-KMS states (consumed), algebraic trace radicals and Frobenius inner
products (consumed), and algebraic traces of Hecke and Temperley–Lieb algebras (different
objects); nothing states an amenable, quasidiagonal or uniform amenable trace, `tr_k`, `‖·‖₂`, a
C*-algebraic hypertrace or the Følner condition. The library near-match listing has no same-name
hit. `roadmaps grep` over main and the open pull-request heads for "amenable trace",
"quasidiagonal trace", "uniform amenable", `IsAmenableTrace`, "Connes–Kirchberg",
`matrixTwoNorm`: no match. "hypertrace" matches VonNeumannAlgebras V13b (hypertraces of finite
von Neumann algebras on `B(L²M)`, lines 4827–4840, a different object, compared in §4.5–§4.6),
Subfactors and FactorRigidity (consumers of V13b). Rosenberg's theorem is mentioned once
elsewhere, in a Check of CStarClassification (line 970), which does not prove it; this roadmap
owns it. Overlap listing: no other open pull request changes this roadmap, drops an id it cites
or defines one it needs.

**Supplier order.** Dependency check output:

    depcheck: 207 roadmaps, 1918 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Suppliers: VonNeumannAlgebras and CStarAlgebras (earlier in the
merge order and on main); CStarClassification, OperatorAlgebraDynamics, FactorRigidity and
BanachSpaceTheory (on main). Sections resolved on main this round: CStarAlgebras §2.1 (544), §2.8
(763), §4.1 (986), §4.2 (1021), §5.1 (1112), §5.2 (1143), §5.4 (1203, quotient norm
`limsup_i ‖a_i‖` at 1212), §6.1 (1272), §6.2 (1297), §6.5 (1414), §7.1 (1455: exact iff a
faithful representation is nuclear, independent of the representation), §8.1 (1587), §8.2 (1617:
finite-set isometry and compression approximations), §8.3 (1645: nonunital c.p.c. version,
permanence, Checks at 1663–1672), §8.4 (1676), §9.1 (1711: cones over separable algebras are
quasidiagonal), §9.7 (1900: extension operator `C(K) → C(X)` in its Check, 1924);
VonNeumannAlgebras V13a (4635), V13b (4692), V13b.SpatialNorm (4696); CStarClassification §2.1
(351: `IsAF`, unitization, unital presentations), §3.4 (587: trace pairing), §3.5 (616: UHF simple
with unique trace, 631); OperatorAlgebraDynamics D2 (1466: nuclear crossed products, 1549),
D2.FreeGroups (1781: `τ(x) = ⟨δ_1, xδ_1⟩`); FactorRigidity §2.2 (217); BanachSpaceTheory B1 (54:
weak and norm closures of convex sets agree, 82–84, which is the form §4.2 and §5.2 use for
nets).

**Manifest.** The eight works of `## References` are the eight entries of
`packages/AmenableTracesOnCStarAlgebras/sources.toml`, one key each; `cited_for` matches the
sections that cite each work. I fetched no source and added no entry.

## Not verifiable

- `connes1976` (Theorem 5.1), `brown-ozawa2008` (Ch. 6), `paulsen2002` (Ch. 3), `pedersen2018`
  (Ch. 3): recorded as waived; cited as background by locator only, texts not read. No statement
  of the README rests on them: each has a route through brown2006 or a supplier.
- `kirchberg1993` (Theorem 7.5, Proposition 7.1): recorded as uncertified (paywalled); the
  locator is the one brown2006 gives at lines 1910–1913, which I read; the paper itself was not.
- The published Memoir of `brown2006` was not compared with the arXiv numbering, as the manifest's
  `version_note` already says; the README cites the arXiv numbering.

## Source issues

- **Misprint** in brown2006 at the proof of Proposition 3.5.3, line 1287: the source says the map
  `Φ` into `π_γ(A)''` restricts on `A` to the GNS representation of an undefined `τ`; it should be
  the GNS representation `π_γ` of `γ`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6e93daa8118ca8efae8044fbb5443c1227f7a552", "job": "REV-PKG-AmenableTracesOnCStarAlgebras~5", "model": "fable", "worker": "chris-x8"} -->
