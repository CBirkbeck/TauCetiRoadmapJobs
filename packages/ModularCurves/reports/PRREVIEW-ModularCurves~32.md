# Review of ModularCurves (pull request #2140 at e52a002)

**Verdict:** needs changes

Seven findings: one P2 and six P3. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning (32). No statement was found false. The P2 is an interface gap: the fine curves are stated and pinned as smooth, and Layers 6.4 and 10 use them as smooth of relative dimension one.

## R01 (P2) — relative dimension one of `Y₁(N)` and `Y_full(N)` is used but nowhere stated

**Location.** `TauCetiRoadmap/ModularCurves/README.md` 2788: "`Y₁(N)/ℤ[1/N]` is a smooth affine relative curve (Layer 5.1)"; 2809–2810: "smooth over `𝔽_p` by the theorem above, applied to `Y_full(N)` over `ℤ[1/N]`"; `Suggested.lean` 648–650 (`exists_representableBy_gammaNaive`, conclusion `Smooth X.structureMap`).

**Claim.** Layers 5.1 and 5.2 supply the hypothesis `[SmoothOfRelativeDimension 1 f]` of `smoothOfRelativeDimension_one_of_isCategoricalQuotient` (`Suggested.lean` 827) for `Y₁(N)` and `Y_full(N)`.

**Witness.** Layer 5.1 item 4 cites the pinned `smooth_yOne_structureMap`, whose statement is `Smooth (yOne B N hN).structureMap` (`TauCeti/AlgebraicGeometry/ModularCurve/YOne.lean:776`). `Smooth` and `SmoothOfRelativeDimension` are different classes (Mathlib `AlgebraicGeometry/Morphisms/Smooth.lean:59, 127`); `𝔸²_B ⟶ B` satisfies the first and not the second with `n = 1`. No file of `TauCeti/AlgebraicGeometry/ModularCurve/` mentions `SmoothOfRelativeDimension`, and no target of the README states it for either curve (Layer 3.5, line 2131–2134, only remarks that representability does not give it).

**Repair.** (a) Layer 5.1: add the owned target "for `N ≥ 4` invertible on `B`, `Y₁(N) ⟶ B` is smooth of relative dimension one", with a route: over `D(3)` (resp. `D(2)`) the scheme `𝕄([Γ₁(N)], δ)` for the level-three (resp. Legendre) rigidifier is étale over the rigidifier curve `Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]` (resp. the `λ`-line), which is of relative dimension one, and étale surjective over `Y₁(N)`; relative dimension descends along an étale surjection. (b) Layer 5.2 and `exists_representableBy_gammaNaive`: replace `Smooth X.structureMap` by `SmoothOfRelativeDimension 1 X.structureMap` (KM Corollary 4.7.2 is a statement about a curve). Tested: for `N = 3` the base is `B × Spec ℤ[1/3, ζ₃][μ, 1/(μ³ − 1)]`, étale over an open of `𝔸¹_B[1/3]`, relative dimension one; for `B = ∅` and over the locus where `N` is not invertible the representing base is empty and the statement holds vacuously.

## R02 (P3) — four pinned Tau Ceti developments are restated or routed around, not cited

**Location.** README 94–97 ("The direct equation-level inputs here are Tau Ceti's theorem that multiplication by `N` has degree `N²` and Tau Ceti's equation-level Weil pairing"); 3024–3030 (PD-6, route for `p = 2`); 3037–3038; 2811–2813 (Layer 6.4); 2065–2071 (Layer 3.5 item 1); 2980–2988 (Layer 7.2); 645–646 and 3750.

**Claim.** The pin supplies only the two equation-level inputs named in §Scope; supersingularity, `Aut(E)`, the Legendre family and the formal group are built here or come from the EllipticCurves roadmap.

**Witness.** At the pin (`TauCeti/AlgebraicGeometry/EllipticCurve/`):
- `Supersingular.lean:86` `WeierstrassCurve.IsSupersingular`, `:200` `isSupersingular_iff_j_eq_zero_of_char_two`, `:209` `…_of_char_three`: the `p = 2` clause of PD-6(a), which lines 3024–3030 re-derive from AEC Appendix A. `IsSupersingular` of `Suggested.lean` 885 (connectedness of `E[p]`) is never compared with it.
- `Aut.lean:185` `eq_one_or_eq_negVariableChange_of_smul_eq` (`Aut(E) = {±1}` for `j ≠ 0, 1728`, over any domain, every characteristic), `:219` `autGroup`, `:303` `autGroupMulEquiv`: the input of the rank-one step of Layer 6.4, which has no locator there; lines 645 and 3750 name the EllipticCurves roadmap as supplier of the `Aut(E)` carrier.
- `Legendre.lean:497` `WeierstrassCurve.UniversalLegendre.existsUnique_legendre`: the universal Legendre curve over `ℤ[1/2][λ, 1/λ(λ − 1)]` with the hypothesis `x₂ − x₁ = u²`, the equation-level core of Layer 3.5 item 1.
- `FormalGroup/Basic.lean:58, 75, 83` `WeierstrassCurve.formalGroup`, `map_formalGroup`, `isComm_formalGroup`: the formal group law of a Weierstrass curve on Mathlib's `FormalGroup`, the carrier of Layers 7.2 and 8.7.

None of the four files or declarations occurs in the README.

**Repair.** List them under §Exact supplier contracts, From Tau Ceti, and correct lines 94–97. PD-6(a): replace the `p = 2` route by the pinned theorem and add the owned comparison "for `E₀` the projective model of `W` over a field of characteristic `p`, `E₀[p]` is connected iff `W.IsSupersingular p`" (checked on `y² + y = x³` over `𝔽₂`: `j = 0`, no nonzero `2`-torsion point, `E[2]` local; and on `y² + xy = x³ + 1`: `j = 1 ≠ 0`, the point `(0, 1)`, `E[2]` has two points). Layer 6.4: cite `Aut.lean:185` for the stabilisers on `j ≠ 0, 1728`. Layers 3.5 item 1 and 7.2: cite the pinned declarations and say what remains owned (the scheme-level problem and its finite étaleness; the intrinsic completion and its comparison with `formalGroup` in a chart). Lines 645 and 3750: cite `WeierstrassCurve.autGroup`.

## R03 (P3) — `Suggested.lean` gives the Axiomatic Regularity Theorem the number of the First Main Theorem

**Location.** `Suggested.lean` 103 ("KM 5.1.1 (the Axiomatic Regularity Theorem)"), 959 ("KM 5.1.1's axioms Reg. 1–Reg. 4"), 986 ("The Axiomatic Regularity Theorem KM 5.1.1").

**Claim.** The axiomatic theorem is KM 5.1.1.

**Witness.** README 3162: "(H1)/(H2) in the proof of KM 5.2.1 (pp. 132–134)"; README 3258: Reg. 4B bis is KM 5.2.2; README 3325 and Conrad, Lemma 3.3.4 (author's copy, line 1310) use KM 5.1.1 for the regularity of `Γ₁(N)` and `Γ(N)`, the First Main Theorem. The file uses 5.1.1 for both theorems.

**Repair.** Write "KM 5.2.1" at lines 103, 959 and 986; keep "KM 5.1.1" at 104, 141, 1071 and 1085; add "(KM 5.2.1)" to the statement at README 3144.

## R04 (P3) — `ker_baseChange_of_noZeroSMulDivisors_coker` is not a headline

**Location.** `Suggested.lean` 855–869; README 2807 and 2891.

**Claim.** It is one of the roadmap's headline theorems ("the base-change lemma for invariant rings of Layer 6.5", `Suggested.lean` 110).

**Witness.** Its statement quantifies over a principal ideal domain `D`, two `D`-modules and a `D`-algebra, and mentions no object of the roadmap; the conclusion is linear algebra on the hypotheses. It is true (checked on `ℤ →(·2) ℤ`, `R = 𝔽₂`: kernel `𝔽₂` against range `0`, excluded because `ℤ/2` has torsion; on the diagonal `ℤ → ℤ²`: `0 = 0`) and does not close with `exact?`, `simp` or `rfl`, so it is a step, not a library duplicate.

**Repair.** Delete it from `Suggested.lean` and the phrase at line 110. At README 2807 and 2891 state the lemma in prose (the README keeps it as a step of both routes) without the backticked name.

## R05 (P3) — four sampled sections state theorems with no locator

**Location.** README 973–986 (Layer 0.6: "the functor of `Z`-morphisms is represented by an affine `S`-scheme"), 2037–2059 (Layer 3.4), 2980–2988 (Layer 7.2), 3148–3155 (Layer 8.2).

**Claim.** Every statement is cited at the level of individual results (README 15).

**Witness.** None of the four sections has a result number, a page or a **Further sources** paragraph; the layer headers (1909–1911, 2935–2936, 3110) name no result for them.

**Repair.** Add a locator at each claim. For 7.2, AEC IV.1 is the reference of the pinned `WeierstrassCurve.formalGroup` (`FormalGroup/Basic.lean`, header). For 0.6, a standard locator is Bosch–Lütkebohmert–Raynaud, *Néron Models*, §7.6, Theorem 4 (not read here: cite by locator after checking that its hypothesis, `X` affine over `Z`, is the one stated). For 3.4 and 8.2 the KM result and page numbers are the author's to supply; I could not read KM.

## R06 (P3) — Layer 6.4's dependency statement omits what its two applications use, and Layer 6.5 item 6 does not say it is a case of Layer 6.4

**Location.** README 2824 ("**Dependencies.** Layers 0.3, 5.1–5.2, and 6.1–6.3."); 2883–2908 (Layer 6.5 item 6) with 2925.

**Claim.** Layer 6.4 needs only Layers 0.3, 5.1–5.2 and 6.1–6.3; the arbitrary-base `j`-line is "an independent milestone".

**Witness.** The quotient-smoothness theorem is stated for a base with regular local rings (Layer 0.9); the coarse base change uses the `j`-map to cut out `j ≠ 0, 1728` (the pinned `jMap`, cited only in Layer 6.5 item 1). Conversely, for `H = GL₂(ℤ/Nℤ)` one has `[Γ(N)]/H = [Γ(1)]`, so Layer 6.4's statement with `N = 3` over `ℤ[1/3]` and `N = 4` over `ℤ[1/2]` gives `(A_N ⊗ R)^G = A_N^G ⊗ R = R[j]`, which is item 6; the two sections specify two routes to the same fibre computations `(A_N/p)^G = 𝔽_p[j]`.

**Repair.** Layer 6.4: "**Dependencies.** Layers 0.3, 0.9, 5.1–5.2, and 6.1–6.3, and the pinned `jMap`." Layer 6.5 item 6: add "this is the case `H = GL₂(ℤ/Nℤ)`, `N = 3, 4`, of the coarse base change of Layer 6.4, with items 1–5 over `ℤ[1/N]`" as the first route and add Layer 6.4 to line 2925; the invariant computations stay as the alternative. No cycle arises: Layer 6.4 uses `jMap` and not the coarse `j`-line theorem.

## R07 (P3) — twenty-four former heading anchors that ModularCurvesPartII links have no row in §Labels

**Location.** README 4029–4030 ("The last five rows are former heading anchors") and 4087–4091.

**Claim.** The description: the table contains "the five former heading anchors that ShimuraVarieties links", so citations resolve.

**Witness.** ModularCurvesPartII (open pull request #913, `TauCetiRoadmap/ModularCurvesPartII/README.md`) links 29 distinct anchors of this README, 64 links in all: for instance `#2b-isogenies-and-quotients` (line 463), `#0e-effective-descent-and-spreading-out` (line 652, 19 links), `#layer-6-the-three-elementary-integral-level-problems` (line 2037). Only five have a row. The last is a heading whose number now names other content (Layer 6 is quotients and coarse moduli).

**Repair.** Add one sentence to §Labels: "A former heading anchor `#<label>-…` resolves as its lettered label (`#0e-…` is Layer 0.5, `#2b-…` is Layer 2.2)", and one row `#layer-6-the-three-elementary-integral-level-problems` → Layer 4.4. Checked on the three witnesses: Layer 0E → 0.5 and Layer 2B → 2.2 are rows 4038 and 4047; main's Layer 6 is the present Layer 4.4.

## Verified sound

### Gate, dependency check, elaboration, probes

- Gate re-run at `e52a002` with `--base origin/main`: every scanner 0, `OK`; the worker's `gate.md` agrees.
- Dependency check output: `depcheck: 236 roadmaps, 2159 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, 32 `declaration uses sorry` warnings, nothing else.
- One-tactic probe on a scratch file with the imports of `Suggested.lean` and none of its theorems (so that `exact?` cannot find the sorried originals): 13 statements tried with `infer_instance`, `exact?`, `simp`, `simp_all` or `rfl` (the two residue-field and Noetherianity clauses of Layer 0.9, ind-étaleness of `R^{sh}`, `isDomain_algebra`, `isDiscreteValuationRing_algebra`, `irreducible_algebraMap`, the kernel base change, the formal engine, `exists_representableBy_gammaNaive`, `isGroupHom_of_mapsZero`, `exists_representableBy_of_isRigid`, flatness of `gammaRelRepData`, regularity of `gammaOneRelRepData`): none closes. Only the conjunct "henselian and `toTarget` surjective" closes, from the two pinned lemmas the README names.
- Signatures: the 52 elaborated types of `signatures.md` read against the README; no binder lost. `hasProperty_finite` carries `[IsNoetherianRing ↑R]`, `exists_universalDeformation` `[IsAlgClosed k] [CharP k p]`, the quotient-smoothness theorem `[IsLocallyNoetherian S]`, the regular stalks, `[IsAffineHom f]` and `[SmoothOfRelativeDimension 1 f]`, `formalGroup_p_eq_zero_of_pow_mem_span` `1 ≤ n`.
- README shape: the headings are those of the copy on main (Scope, Conventions, Exact supplier contracts, the layers, Dependency order, Downstream consumers, Worked examples, References); the 47 lettered labels of main (`0A`–`9E`) each have a row in §Labels.
- Description: 42 **Further sources** paragraphs counted; three added Tau Ceti imports (lines 72–74); 32 `sorry` warnings; the generated merge-order block states the order with #1808 and #1187.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.5 descent forms (sample) | Stacks 0245; 0CCJ | descent.pdf line 4181: fpqc covering, each `V_i → X_i` affine, effective; groupoids.pdf line 2542: surjective finite locally free, case (3) ample sheaf on `V` | locators exact; 0CCJ is the different hypothesis the text says | none |
| 0.6 Weil restriction (sample) | `Z = S ⊔ S`, `X = 𝔸¹_Z`; `Z = Spec k[ε]`, `X = 𝔾_m` | `𝔸²_S`; `𝔾_m × 𝔾_a`, both affine | true; no locator | R05 |
| 2.1 KM 2.3.1 (sample) | `N = 1`; `N = p` in char `p`; `N = 0`; Stacks 0BFG; `Ces15` 2.2.9 | rank `1`; rank `p²` with inseparable degree counted; `[0]` not finite, `NeZero` required; groupoids.pdf line 857: degree `d^{2 dim A}`, `= d²` for `g = 1`; `Ces15` line 550 | true; locators exact | none |
| 3.2 naive problems (sample) | char `p ∣ N`; `N = 2`; `N = 4` Borel index; Loeffler | `p² > p` points: empty; `[−1]` fixes all; `96/16 = 6 = 4·(3/2)`; Loeffler lines 1031 (Fact 3.8.1), 1063 (Prop. 3.8.2: relatively representable and étale) | true; locators as cited | none |
| 3.4 Weierstrass presentation (sample) | stabiliser of a point with `j ≠ 0, 1728` | `{1, neg}` by pinned `Aut.lean:185`: the action is not free, so the presentation is of a groupoid, not of a scheme | consistent with 6.5; no locator | R05 |
| 3.5 Legendre erratum | `y² = x(x−1)(x−2)` over `ℚ` | differences `x(Q) − x(P)` over the six ordered bases: `1, −1, 2, −2, 1, −1`; two squares, times `±ω`: `4` of `12` rational | not a torsor under a constant group of order 12 | none |
| 3.6 `IsRegularOfDim` (sample) | empty rigidifier; trivial problem; `Spec ℚ`-valued rigidifier | excluded by surjectivity; closed point of a fibre of a smooth curve over an open of `Spec ℤ` has height `1 + 1 = 2`; not `Etale` (not locally of finite presentation) | discriminates | none |
| 5.1 Tate normal form | `a = b = 1`; `2(0,0)` at `a = 1` | `Δ = 1·(1 − 1 − 8 + 36 − 27 − 16) = −15`; `2P = (−b, b(a − 1)) = (−b, 0)`, its own negative | true | none |
| 5.1/5.2 smoothness (headline) | `𝔸²_B → B`; `N = 3` | `Smooth` yes, relative dimension `2 ≠ 1`; `μ`-line over `ℤ[1/3]`: relative dimension `1` | statement weaker than its consumers need | R01 |
| 5.3 `Y(ρ)` (sample) | `N = 2`; `ℚ̄ ⊂ ℂ`; Conrad 4.2.1(1) | `−1` trivial on `E[2]`: not rigid; image of a connected space, and the pinned lemma for the converse; Conrad line 1746: geometrically connected fibres over `ℤ[ζ_N]` | true; locator exact | none |
| 6.1 quotient problems (sample, headline) | `ℤ[x]`, `x ↦ −x`; `ℚ[x₁, x₂, …]`; empty base | `𝔽₂[x²]` against `𝔽₂[x]`; `A/B₊A = ℚ ⊕ ⨁ℚxᵢ`, infinite; `𝒫(E/∅)` a singleton fixed by `H` | hypotheses needed; SGA 1 V 1.1, 1.2, 1.5, 1.8, 1.9, 2.2, 2.3 at `GR02` lines 3634, 3648, 3674, 3710, 3740, 3816, 3849; `Ryd07` lines 999, 1208; `Ces15` line 2708 | none |
| 6.3 coarse moduli (sample, headline) | `R = 0`; `𝒫` empty; Conrad Keel–Mori; Rydh; `Ces15` | `M = ∅` both; note line 33 (Theorem 1.1), Theorem 3.1(1) flat base change; `Ryd07` line 1396 (finite inertia); `Ces15` line 2701 (Lemma 6.2 = DR IV.3.10(iii)) | true; locators exact | none |
| 6.4 quotient smoothness (headline) | `k[ε][[t]]`, `t ↦ (1+ε)t`, char 2; `ℤ_(2)[x]`, `x ↦ −x` | invariants `k[ε][[t²]] ⊕ εt·k[[t²]]`, not smooth: base must be regular; `ℤ_(2)[x²]` smooth, action trivial mod 2 | hypothesis needed and present | none |
| 6.4 coarse base change | `H = 1`; `H = GL₂`; `Γ₁(4)` in char 2; `Ces15` 6.4(b), 6.6 | representable case; `M = 𝔸¹_j`, equal to 6.5 item 6; `2 ∣ 4`, outside `ℤ[1/4]`; `Ces15` lines 2726–2764 (over `ℤ[1/gcd(6,n)]`, same three steps), 2768 | true | R06 |
| kernel base change | `ℤ →(·2) ℤ`, `𝔽₂`; diagonal | `𝔽₂` against `0` (torsion cokernel excluded); `0 = 0` | true; not a headline | R04 |
| 6.5 `j`-line (headline) | level three; Legendre; `R = 0` | `c₄ = 9μ(μ³+8)`, `Δ = 27(μ³−1)³`, `j = 27u`; `(d+1)³ = ud² ⇒ d(ud − d² − 3d − 3) = 1`; `∅ ≅ 𝔸¹ × ∅` | true | none |
| 7.2 formal completion (sample) | `n = 1`; change of parameter | `[0] = (X = 0)`; `X ↦ uX + ⋯` | consistent; pinned formal group not cited, no locator | R02, R05 |
| 7.3 PD-6 | `p = 3, 5, 7, 2` | `H₃ = 1 + t`; `H₅ = t² − t + 1`, both roots `j = 0`; `H₇ = (t+1)(t²+t+1)`, `j = 1728 = 6`; `H_p(1) = C(p−1, m) ≡ (−1)^m`; `48/24 = 2`; `12/|Aut| = 1, 2, 3` | true | R02 (pinned `p = 2, 3`) |
| `IsSupersingular` (def) | ordinary; `p ≠ char k`; `p = 1` | two points at least; étale of rank `p² ≥ 4`; junk "supersingular", unused (`Fact p.Prime`) | discriminates; no comparison with the pinned notion | R02 |
| 8.2 (sample) | — | a consumption of Layers 0.9 and 7.4, no numerical claim | read; no locator | R05 |
| 8.1/8.3 `axiomaticRegularity` (sample, headline) | trivial problem; empty problem | rank `1`, `W(k)[[T]]` regular of dimension `2`; fails Reg. 4A | consistent; KM number in the Lean docstring | R03 |
| 8.4 isomorphism theorem (sample) | `Φ = id`; `∅ → 𝒫` | trivially an isomorphism; fails Reg. 4A for the source | consistent; Jacobson step valid for finite type over `ℤ` | none |
| 8.7 formal engine (sample, headline) | `v_p C(pⁿ, p^{n−1})`; `n = 0`; `p = 2, n = 1` | `1`; `X = 0` is a subgroup over any ring, `p = 0` false; `C(2,1) = 2 = 0` | true, `hn` needed | none |
| 9.4 `[Γ₀(N)]` (sample, headline) | `N = p`; `N = 4` | `p + 1`; `16·(3/4)/2 = 6`; `Ces15` line 1385 (4.2.7(c)), 2615 (5.13); Conrad lines 1767 (4.2.3(4)), 1308 (3.3.4) | true; locators exact | none |
| Layer 10 cusps and Shimura covering | `N = 11, 13` | ranks `(N²−1)/2|H|`: `Γ₀`: `N + 1`; reduced `2`; `m_H(1 + N)` matches; `n = 5, 1`; `|H| = 1, 6`; inertia `2` iff `4 ∣ N − 1`, `3` iff `3 ∣ N − 1`, inside `H` | consistent | none |
| Layer 10 `w_N` | `(E, C)`, `N = 4` | `E[4]/C ≅ ℤ/4` cyclic; `(E/C)/(E[N]/C) ≅ E`, image `C` | involution | none |
| `IsStrictlyHenselianLocalRing.tfae` | a field; Stacks 04GG | clause 3 ⇔ no nontrivial finite separable extension; algebra.pdf line 19333, item (8): unique retraction with `𝔮 = τ⁻¹(𝔪)` | true; locator exact | none |
| Noetherianity of `R^{sh}` | Stacks 06LJ | more-algebra.pdf line 5346: (1) ⇔ (3), clauses (a), (c), (d), (f) as cited | locator exact | none |

### Library declarations opened at the pin (Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b`)

`ModularCurve/YOne.lean:776`; Mathlib `AlgebraicGeometry/Morphisms/Smooth.lean:59, 127, 133`; `EllipticCurve/Supersingular.lean:86, 144, 200, 209`; `EllipticCurve/Aut.lean:185, 219, 303`; `EllipticCurve/Legendre.lean:497`; `EllipticCurve/FormalGroup/Basic.lean:58, 75, 83`; `RingTheory/StrictHenselization/MaximalIdeal.lean:80`. Seventeen locations. No Tau Ceti file declares `IsStrictlyHenselianLocalRing`, `IsHenselization`, `KatzMazurQuotientData`, `CoarseModuliData`, `ArtinianTestAlgebra`, `EtaleRigidifier`, `PDivisibleGroupIso`, `UniversalDeformation` or `RegularityAxioms`.

### Cross-roadmap citations and overlaps

- On main: EtaleCohomologyFoundations §F.3a (line 776) and its table row citing "Layer 0d" and "Layer 4D" (line 48); SchemeAndStackFoundations lines 108–120, which names Layers 0B–0G, 4D, 7D and 9D as owner and takes none as input. Its clause "ModularCurves consumes §0.12" is not borne out by this README, which uses the pinned `TauCeti.Henselization.algebra`; the open head of #1656 already reads "ModularCurves consumes nothing from this roadmap". Not a finding for this folder.
- At open heads: AlgebraicModuliForArithmeticGeometry (#853, lines 241, 257–264) cites §0C, 0E, 0F, 0G, 4C, 7B, 7D, 9D, 9E, all rows of §Labels; LefschetzPencilsAndVanishingCycles (#873, line 207) cites Layer 4D; CanonicalModelsAndGonality (#1726, lines 1910, 1921) cites §0A.1, §0A.4–0A.5, covered by the sentence at README 4029; ShimuraVarieties (#933) links five anchors, rows 4087–4091. `overlaps.md` still lists these six ids; each has its old → new line. The remaining anchors are R07.
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision. #1187 and #1808 conflict with this head; the order is stated.
- Fully qualified names: `IsCategoricalQuotient` (PerfectoidTowers) and `IsSupersingular` (EllipticCurves on main, CurvesOverFiniteFields) recur in other roadmaps' namespaces, not in `TauCetiRoadmap.ModularCurves`.
- `citations.md`: the five "Lean names found nowhere" are declared in `Suggested.lean` (lines 470, 502, 545, 560, 697).

## Not verifiable

- Katz–Mazur: the sources service finds no legal copy. Every KM locator is cited by locator only, including those of the sampled sections 3.6, 6.1, 6.3, 8.3, 8.4, 8.7 and 9.4, and the hypotheses of the theorem on p. 508 behind Layer 6.4 (`Ces15` line 2733 cites it as the theorem on p. 508; the regular-base hypothesis was checked on an example above, not in the text).
- Deligne–Rapoport, SGA 3, Igusa, Katz's *Serre–Tate local moduli*, Lazard, Mazur, Oda, Oort, Tate–Oort, EGM, Kottwitz–Wake, Scholze and Buzzard's lecture were not read in this review. Of these, the seeded sample contains EGM (4.8), (4.16) (Layer 6.1), EGM (5.9) (Layer 2.1), DR IV 3.10(iii) (Layer 6.3, confirmed only through `Ces15` line 2701), Igusa §2 and Buzzard's lecture (Layers 6.3 and 5.3, attributions only).
- Silverman `AEC`: settled as uncertified.
- Bosch–Lütkebohmert–Raynaud §7.6 (proposed in R05): not read.

## Source issues

- **Gap** in Loeffler at Theorem 3.7.4, p. 18: the source says a moduli problem is representable exactly when it is relatively representable and rigid, with no affineness hypothesis; it should assume the problem affine over `Ell/R`, which the invariant quotient in its sketch needs; affects a stated result.
- **Error** in Loeffler at the proof sketch of Theorem 3.7.4, p. 18: the source says the Legendre problem carries an action of `GL₂(𝔽₂) × {±1}`; it should be a degree-12 finite étale cover with only `{±1}` acting (`y² = x(x−1)(x−2)` over `ℚ` has 4 rational structures); affects the proof.
