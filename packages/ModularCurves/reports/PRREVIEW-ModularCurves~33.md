# Review of ModularCurves (pull request #2140 at 8a9d136)

**Verdict:** needs changes

Five findings: three P2 and two P3. The gate passes, the dependency check is clean and `Suggested.lean` elaborates with `sorry` as its only warning (32). No stated theorem was found false. The P2 findings are a proof route that leaves one fibre uncovered, a headline of the introduction that is statable at the pins and absent, and a clause of the First Main Theorem that the README attributes to two Lean theorems which do not state it.

## Repair of the previous review's findings (head `e52a002`)

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01, relative dimension one of `Y₁(N)`, `Y_full(N)` | README 2523–2544 (Layer 5.1 item 6, with route), 2588–2599; `Suggested.lean` 648–651 (`smoothOfRelativeDimension_one_yOne_structureMap`), 666–669 (`SmoothOfRelativeDimension 1 X.structureMap`) | repaired |
| R02, four pinned developments not cited | README 640–696 and 94–102; PD-6 at 3275–3283 uses the pinned `j`-criteria; comparison of the two notions of supersingularity at 3162–3172; Layer 6.4 at 2963–2967; Layer 3.5 item 1 at 2167–2175; Layer 7.2 at 3213–3227. All eleven declarations found at the pin (list below) | repaired |
| R03, KM 5.1.1 against KM 5.2.1 | `Suggested.lean` 103–105, 961, 988 read "KM 5.2.1"; README 3400–3404. Conrad line 1323 names KM 5.2.1, 5.2.2 as the regularity criteria and line 1310 KM 5.1.1 as the theorem for `Γ₁(N)`, `Γ(N)` | repaired |
| R04, `ker_baseChange_of_noZeroSMulDivisors_coker` | absent from `Suggested.lean`; stated in prose at README 2979–2988 | repaired |
| R05, four sections without locator | 0.6: Conrad, *Reductive group schemes*, Lemma 2.1.3 (`conrad-rgs` line 2438, statement as cited); 3.4: Loeffler 3.3.2 (Loeffler line 666) and AEC III.3.1(b); 7.2: AEC IV.1, IV.7; 8.2: KM 5.2.1 pp. 132–134 and Conrad 3.1.9 (Conrad line 1096) | repaired |
| R06, dependencies of Layers 6.4 and 6.5 | README 3008–3010 and 3073–3078, 3117–3119 | repaired; the second route of item 6 is R01 below |
| R07, former anchors | README 4317–4321 and row 4383 | repaired |

## R01 (P2) — the second route of Layer 6.5 item 6 never computes the fibre at `p = 2`

**Location.** `TauCetiRoadmap/ModularCurves/README.md` 3088–3090: "`isInvariant_tetrahedralGroup` applies for `p ≠ 2, 3`; the fibre at `p = 2`, where `2` is not a nonzerodivisor, is covered by `N = 4`"; also 3087, "for every `p ≠ N`".

**Claim.** The direct route proves `M([Γ(1)]/R) = Spec R[j]` for every ring `R` without the smoothness theorem of Layer 6.4.

**Witness.** `R = 𝔽₂`. `[Γ(4)]` lives over `D(2) = Spec ℤ[1/2]`, which has no point of characteristic `2`; an `𝔽₂`-algebra is a `ℤ[1/3]`-algebra only, so the kernel lemma needs `(A₃/2)^G = 𝔽₂[j]`, which the route assigns to no computation.

**Repair.** Replace the parenthesis by the fibre computation at `p = 2` for `N = 3`: `A₃/2 = 𝔽₄[μ, 1/(μ³+1)]` is a domain, free of rank `12` over `𝔽₄[u]` (`finrank_levelThreeRing`), with `u = μ¹²/(μ³+1)³`; the substitutions `μ ↦ ζμ` and `μ ↦ μ/(μ+1)` generate the lower triangular subgroup of `PGL₂(𝔽₄)`, of order `12`, and fix `u`; hence the invariants are the elements of `𝔽₄(u)` integral over `𝔽₄[u]`, that is `𝔽₄[u]`, and `ζ ↦ ζ²` leaves `𝔽₂[u] = 𝔽₂[j]` (`27 = 1`). Tested on the witness: `u(μ/(μ+1)) = μ¹²/((μ+1)¹²) · (μ+1)⁹/(μ³+(μ+1)³)³ = μ¹²/((μ+1)(μ²+μ+1))³ = u`. Alternatively say that the fibre at `2` is taken from the first route. Write `p ∤ N` at 3087 (`p = 2` is not `N = 4`).

## R02 (P2) — KM 7.6.1 is a target of the introduction, statable at the pins, and absent; KM 7.4.2 over `ℤ` is not named

**Location.** README 8–9: "the quotient problems `[Γ_H]` at prime-power level are regular, and the standard quotient identifications hold over `ℤ`"; Layers 8.9 and 9.5; `Suggested.lean` 100–115 (headlines stated) and 139–155 (not statable).

**Claim.** The module docstring lists every headline theorem that is stated and every one that is not statable, with what it lacks.

**Witness.** Neither list contains KM 7.6.1 or the identifications of KM 7.4.2 over `ℤ`. The first clause of KM 7.6.1 elaborates on the file's own `KatzMazurQuotientData` and the pinned `ModuliProblem.gammaAction : (GL (Fin 2) (ZMod N))ᵐᵒᵖ →* Aut (gamma B N)` (`ModularCurve/FullLevel.lean:124`) and `gammaRelRepData`.

**Repair.** State it, for `p` prime, `n ≥ 1`, `H` a subgroup of `(GL (Fin 2) (ZMod (p ^ n)))ᵐᵒᵖ` inside the semi-Borel of Layer 6.2 item 3, and every `Q : KatzMazurQuotientData (gamma (Spec intRing) (p ^ n)) P' H` with `Q.relRep = gammaRelRepData …` and `Q.act = (gammaAction …).comp H.subtype`: `Q.relRep'` is flat, `IsRegularOfDim 2`, and every `Q.mapRep X` is flat. Tested: this signature elaborates in a scratch copy, with `[Finite H]` and `[NeZero (p ^ n)]` as binders, at universe `0` (the structure takes `H : Type u`; generalise it to `Type v` or lift). The matrix entries defining the semi-Borel are to be fixed against the pinned action with the two-term witness of Layer 6.2 (`(P, Q)g = (P, bP + dQ)`). Name in the docstring, with what each lacks: the clauses of KM 7.6.1 for `[Γ₁(pⁿ)]` and balanced `[Γ₁(pⁿ)]` (no diamond action on `gammaOne` at the pin; no balanced carrier), and KM 7.4.2 over `ℤ` (no morphism `[Γ(N)] ⟶ [Γ₁(N)]` of Drinfeld problems at the pin, which is KM 5.5.2; no balanced carrier).

## R03 (P2) — "finite étale after inverting `N`" is attributed to two Lean theorems that do not state it, for `[Γ₁(N)]` and `[Γ₀(N)]`

**Location.** README 3601–3604: "regular of dimension two, and finite étale after inverting `N`. For the pinned `[Γ(N)]` and `[Γ₁(N)]` … this is `firstMainTheorem_gamma` and `firstMainTheorem_gammaOne`"; README 6–8 and 3797–3801; `Suggested.lean` 1091–1099 and 1109–1114.

**Claim.** The First Main Theorem, with its clause after inverting `N`, is stated in Lean for `[Γ₁(N)]` and `[Γ₀(N)]`.

**Witness.** Neither statement has an étale conjunct. The pin has `hasProperty_etale_gammaRelRepData` (`ModularCurve/Comparison.lean:361`) for `[Γ(N)]` only; `ModularCurve/Gamma/One.lean` and `Gamma/Zero.lean` contain no étaleness statement. README 2459–2461 cites the `[Γ(N)]` lemma for both problems.

**Repair.** Add the conjunct `∀ X, IsUnit ((N : ℕ) : Γ(X.base, ⊤)) → Etale (D.rep X).hom` to `firstMainTheorem_gammaOne` (with `D = gammaOneRelRepData (Spec intRing) N`) and to `exists_relRepData_gammaZero`; both elaborate in a scratch copy. At README 2459–2461 say that étaleness of `gammaOneRelRepData` is owned (transport along `isIso_gammaOneToGammaOneNaive` and `hasProperty_etale_gammaOneNaiveRelRepData`). Tested: `N = 1`, the representing scheme is the base, the identity is étale; `X.base = Spec 𝔽_p` with `p ∣ N`, `N` is not a unit and the clause is empty, as it must be, since the exact-order scheme of a supersingular curve contains the nonreduced `p[0]`.

## R04 (P3) — Layer 1.3 states its three theorems without a locator

**Location.** README 1474 ("References: KM 2.1 and Deligne–Rapoport II.1.") and 1522–1597, in particular 1585–1586 and 1592–1594.

**Claim.** README 15: "Statements are cited at the level of individual results."

**Witness.** Layer 1.3 (cohomology of `𝒪_E(n[0])`, classification of pointed isomorphisms, the Weierstrass-presentation theorem) has no result number and no **Further sources** paragraph. The README's own locators for this material are elsewhere: Convention 1 (line 174) cites KM 2.2.5–2.2.6 and DR II.1.1, and Layer 3.4 cites Loeffler 3.3.2 and AEC III.3.1(b).

**Repair.** Cite them at the claims of Layer 1.3: KM 2.2.5–2.2.6 and DR II.1.1 for the presentation theorem (as Convention 1 does), Loeffler, Proposition 3.3.2 (Loeffler line 666: a Weierstrass equation Zariski-locally, from a local basis of `π_*Ω¹`), and AEC III.3.1(b) for the variable changes over a field; extend the header of Layer 1 to KM 2.2.

## R05 (P3) — five definitions carried by `Suggested.lean` have no Checks

**Location.** README 2877–2913 (`CoarseModuliData`), 3147–3153 (`PDivisibleGroupIso`), 3310–3323 (`ArtinianTestAlgebra`, `Deformation`, `UniversalDeformation`), 3374–3404 (`RegularityAxioms`), 3499–3525 (`QuotientRegularityAxioms`).

**Claim.** Every definition lists at least three discriminating Checks.

**Witness.** None of these sections has a **Checks.** list; Layers 0.6, 0.7, 0.9, 3.2, 4.1–4.4, 5.1, 5.2, 6.4, 7.1 (supersingularity), 7.2 and 8.2 have one.

**Repair.** Add Checks. Computed instances that discriminate: (8.1) the trivial problem satisfies Reg. 1–4 with `W(k)[[T]]`, rank `1`; the empty problem fails Reg. 4A; the problem "a section of `E[p]`" satisfies Reg. 1–3 and 4A (`E₀[p](k) = {0}`) and fails Reg. 4B, since `[p](X) = pX + ⋯` lies in the square of the maximal ideal of `W(k)[[T, X]]`, and its scheme `E[p]` is not regular. (7.4) Over `k[ε]` the deformations of `E₀` form a line and correspond to `T ↦ cε`; the pullback of the universal family along `T ↦ T²` sends every such map to the trivial deformation, so it fails existence; a family over `W(k)` alone has one map to `k[ε]`. (6.3) For `[Γ(1)]` the scheme is `𝔸¹_j` and the two curves with `j = 0`, `1728` are single points although their automorphism groups differ; for a representable problem `M(𝒫)` is the representing scheme; `ℙ¹_j` with the same classifying maps fails `surjective_algClosed`. (7.1) For `E = E'` the identity system; a system of isomorphisms of the `E[pⁿ]` not compatible with the inclusions is excluded by `compat`; for `p` invertible and `k` separably closed it is an isomorphism of Tate modules modulo each `pⁿ`.

## Verified sound

### Gate, dependency check, elaboration, probes

- Gate re-run at `8a9d136` with `--base origin/main`: every scanner `0`, `OK`. The diff against `origin/main` outside `TauCetiRoadmap/ModularCurves` is empty.
- Dependency check output: `depcheck: 236 roadmaps, 2159 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. Suppliers named: JacobianChallenge, AlgebraicVectorBundles (L0B, L0C, L2A, lines 351–364 of its README), StableReduction Layer 2 (line 405), AlgebraicCurves Layers 7–9 and 12 (lines 783, 870, 1099, 329), EllipticCurves Layers 3 and 5 (lines 683, 1154), all on main.
- `lake env lean` on `Suggested.lean`: exit `0`, 32 `declaration uses sorry` warnings, no other message.
- One-tactic probe on a scratch copy: `HenselianLocalRing ∧ IndEtale` for the strict henselisation by `infer_instance` (fails on `IndEtale R (algebra R Ω)`, so `StrictHenselization.isHenselization` is not an instance lookup); `smoothOfRelativeDimension_one_yOne_structureMap` by `infer_instance` or `simp` (fails, goal unfolds to the composite `naiveExactOrderPreimageι ≫ prod.fst`); `formalGroup_p_eq_zero_of_pow_mem_span` by `simp_all` or `rfl` (fails); `KatzMazurQuotientData.hasProperty_affine` by `infer_instance`, `simp_all` (fails); `existsUnique_desc` by `simp_all`, `aesop` (fails). Nothing closes; no padding found.
- Signatures: the 53 elaborated types of `signatures.md` read against the README; no binder lost. `exists_universalDeformation` carries `[IsAlgClosed k] [CharP k p]`, `hasProperty_finite` `[IsNoetherianRing ↑R]`, the quotient-smoothness theorem `[IsLocallyNoetherian S]`, regular stalks, `[IsAffineHom f]`, `[SmoothOfRelativeDimension 1 f]`.
- Description: 44 **Further sources** paragraphs counted; 32 `sorry` warnings; `ker_baseChange_of_noZeroSMulDivisors_coker` absent; the generated merge-order block states the order with #1808 and #1187.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.2 non-finitely-presented quotient | `R = ℤ ⋉ V`, `ε ↦ −ε` | invariants `a + bε` with `2b = 0`: `R ⊕ Vε`; `𝔸²/±1` fibre length `3` against `2` | true | none |
| 0.8 KM 1.11.4 | `(a,b) ↦ ζ^a`, `ζ^p = 1` | `∏(T − ζ^a)^p = (T^p − 1)^p = T^{p²} − 1`; for `R = 𝔽_p[X]/(X^p − 1)`, `∑X^a ≠ 0` so `∏(T − X^a) ≠ (T − 1)^p` | true | none |
| 1.1, 1.2 (sample) | `y² = x³` over `𝔽₅` | affine solutions `1 + 2 + 0 + 0 + 2 = 5`, with infinity `6`; nonsingular `4 + 1 = 5` | true | none |
| 1.3 (sample) | bases of `π_*𝒪(n[0])`, `n ≤ 6` | ranks `1, 2, 3, 4, 5, 6`; seven monomials in pole order six, one relation | true; no locator | R04 |
| 2.2 (sample) | Česnavičius 2.2.4, 2.2.7 | `Ces15` line 430 (quotient, base change, flat), line 519 ((a) universal property, (b) kernel, (c) successive quotients) | locators exact | none |
| 2.4 (sample) | disjoint union of two curves; normalised `L` on `c = (0,0)` | not geometrically connected, excluded by the atlas; `c^*L = c^*L₀ ⊗ c^*L₀⁻¹ ⊗ c^*L₀⁻¹ ⊗ c^*L₀` trivial | consistent | none |
| 2.5 (sample) | `e_N(aP+bQ, cP+dQ)`; Oda | `e(P,Q)^{ad}·e(Q,P)^{bc} = e(P,Q)^{ad−bc}`; `Oda69` line 185 (Theorem 1.1: kernel of the dual is the Cartier dual), line 269 (Corollary 1.3) | true; locators exact | none |
| 3.2 Borel index | `N = 4` | `96/16 = 6 = 4·(3/2)` | true | none |
| 3.3 (sample) | `y² + y = x³`, `(x,y) ↦ (ζx, y)`; Conrad | tangent at `(0,0)` is `y = 0`, triple contact: order `3`, fixed; Conrad line 1057 (3.1.8), line 1744 (4.2.1(2): `d ≥ 5`, resp. `d ≥ 3`) | true; locators exact | none |
| 3.4 (sample) | Loeffler 3.3.2 | Loeffler line 666: Zariski-local equation from a basis of `π_*Ω¹` | locator exact | none |
| 3.5 Legendre erratum | `y² = x(x−1)(x−2)` over `ℚ` | differences over six ordered bases `1, −1, 2, −2, 1, −1`; two squares, times `±ω`: `4` of `12` | not a constant torsor | none |
| 4.1 (sample) | ordinary `E[p]`; `E[N]`, `N` invertible; Conrad, Česnavičius | `∑_{a ∈ ℤ/p²}[aP] = p∑_{a∈ℤ/p}[aP]`, degree `p²`; a generator of order `N²` against exponent `N`; Conrad lines 570, 573, 591, 598; `Ces15` lines 1365, 1375 | true; locators exact | none |
| 4.3 (sample) | determinant-`ζ` locus; `Ces15` Remark 4.2.3 | `C ≅ ℤ/N` by `P`, `Cᴰ ≅ μ_N`, one `Q` with `Q(P) = ζ`; `Ces15` line 1324 | true; locator exact | none |
| 4.4 (sample) | `N = 2`; `Ces15` 4.3.2; Conrad 3.2.2 | `N²∏(1 − 1/p²) = 3`, the nonzero points of `(ℤ/2)²`; `Ces15` line 1660 (finite locally free of degree `#GL₂(ℤ/n)`, étale over `ℤ[1/n]`); Conrad line 1117 | true; locators exact | R03 (étaleness of `[Γ₁(N)]`) |
| 5.1 Tate normal form | `a = b = 1`; `a = 1` | `b₂ = a² + 4b`, `b₄ = ab`, `b₆ = b²`, `b₈ = b³`: `Δ = b³(a³ − a⁴ − 8a²b + 36ab − 27b − 16b²)`, `= −15`; on `a = 1`, `b⁴(1 − 16b)`; `2(0,0) = (−b, b(a−1))` | true | none |
| 5.1 item 6, 5.2 (headline) | `𝔸²_B`; `N = 3`; `B = Spec 𝔽_p`, `p ∣ N` | relative dimension `2`; `μ`-line, dimension `1`; `(ℤ/p)²` of order `p²` against at most `p` points: both sides empty | true | none |
| 5.3 (sample) | `N = 2`; Conrad 4.2.1(1) | `−1` trivial on `E[2]`, not rigid; Conrad line 1746: geometrically connected fibres over `ℤ[ζ_N]` | true; locator exact | none |
| 6.1 (sample, headline) | `ℤ[x]`, `x ↦ −x`; `ℚ[x₁, x₂, …]`; empty base; SGA 1, Rydh | `𝔽₂[x²]` against `𝔽₂[x]`; `A/B₊A = ℚ ⊕ ⨁ℚxᵢ`; `𝒫(E/∅)` a point fixed by `H`; `GR02` lines 3634, 3648, 3674, 3710, 3740, 3816, 3849; `Ryd07` lines 999, 1019, 1025; `Ces15` line 2708 | true; locators exact | none |
| 6.2 row convention | `g = [[1,b],[0,d]]`, `[[a,b],[0,d]]` | `(P, bP + dQ)` fixes `P`; `(aP, bP + dQ)` fixes `⟨P⟩`; `det((P,Q)g) = e(P,Q)^{ad−bc}` | consistent with 2.5 | none |
| 6.4 quotient smoothness (headline) | `k[ε][t]`, `t ↦ (1+ε)t`, char `2`; `ℤ_(2)[x]`, `x ↦ −x`; `k[s,t][x]`, `x ↦ x + s`, char `p`; `Ces15` | `(a+bε)tⁿ ↦ (a + (b+na)ε)tⁿ`: invariants `k[ε][t²] ⊕ εt·k[t²]`, `εt` killed by `ε` and not in `εM`: not flat; `ℤ_(2)[x²]`; `k[s,t][x^p − s^{p−1}x]`, smooth; `Ces15` line 2733 uses the theorem of KM p. 508 for exactly this reduction | hypothesis needed and present | none |
| 6.4 coarse base change | `H = 1`; `H = GL₂`; stabiliser on `j ≠ 0, 1728` | representable case; `𝔸¹_j`; `(P,Q)h = ±(P,Q)` gives `h = ±1`, so `H/(H ∩ ±1)` is free; `A^H ∩ pA = pA^H` (injectivity); `Ces15` lines 2726–2764, 2768 | true, including `p = 2` with `N = 3` | none |
| 6.5 `j`-line (headline) | level three; Legendre; `p = 2`, `N = 3` | `c₄ = 81μ⁴ − 72μ(μ³−1) = 9μ(μ³+8)`, `b₈ = 0`, `Δ = (μ³−1)³(−216μ³ − 27μ³ + 27 + 243μ³) = 27(μ³−1)³`, `j = 27u`; `(d+1)³ = ud² ⇒ d(ud − d² − 3d − 3) = 1`; first route covers `𝔽₂`, second does not | statement true; one route incomplete | R01 |
| 7.1 comparison (sample of 7) | `y² + y = x³`, `y² + xy = x³ + 1` over `𝔽₂`; `y² + xy = x³ + t` over `𝔽₂(t)`; `p = 1` | `3` points, `a₂ = 0`, `E[2]` local; `(0,1)` of order two; `(0, √t)` over a purely inseparable extension, two points; both sides true | true | none |
| 7.3 PD-6 | `p = 3, 5, 7` | `H₃ = 1 + t`; `H₅ = 1 + 4t + t² = t² − t + 1`, disc `−3 = 2` nonsquare; `H₇ = 1 + 2t + 2t² + t³ = (t+1)(t²+t+1)`, roots `−1, 2, 4`, `1728 = 6`; `H_p(1) = C(p−1, m) ≡ (−1)^m`; `12/|Aut| = 1, 2, 3`; `48/24 = 2` | true | none |
| 7.4 `UniversalDeformation` (def) | `T ↦ T²`; a ring map with `ψ(T)` nilpotent | trivial on `k[ε]`, excluded by existence; `ψ` factors through `W(k)[T]/(Tⁿ)`, so uniqueness is of `ψ(T)` | determines its object; no Checks | R05 |
| 8.1 `RegularityAxioms` / 8.3 (headline) | trivial; empty; sections of `E[p]` | `W(k)[[T]]`, rank `1`; fails 4A; satisfies 1–3 and 4A, fails 4B (`[p](X) ∈ 𝔪²`) | discriminates; no Checks | R05 |
| 8.2 (sample) | Conrad 3.1.9, 3.3.4 | Conrad lines 1096–1104 (universal deformation ring over a Cohen ring, algebraizable), 1323 (KM 5.2.1, 5.2.2) | locators exact | none |
| 8.4 (sample) | `Φ = id`; `∅ → 𝒫` | isomorphism; source fails Reg. 4A; open set containing all closed points of a finite-type `ℤ`-scheme is everything | consistent | none |
| 8.7 formal engine (headline) | `n = 0`; `p = 2, n = 1`; `v_p C(pⁿ, p^{n−1})` | `X = 0` is a subgroup over any ring; `C(2,1) = 2`; `1` | true, `hn` needed | none |
| 8.8 First Main Theorem (headline) | `N = 1`; `𝔽_p`, `p ∣ N` | rank `1`, `𝕄(δ)` smooth of relative dimension one over `ℤ`, dimension `2`; nonreduced `p[0]`, not étale | true; étale clause absent for two problems | R03 |
| 8.9 KM 7.6.1 (headline) | semi-Borel in `GL₂(ℤ/pⁿ)` | free on bases after inverting `p` (G1); signature elaborates | statable, absent | R02 |
| 9.3 rings | `e_{φ}` of the `[a](P)` | `∏_{(b,p)=1}[b](P) + P^{φ}·(element of 𝔪) = unit · P^{φ(pⁿ)}` | consistent | none |
| 9.4 `[Γ₀(N)]` (headline) | `N = p`; `N = 4` | `(N²/φ(N))∏(1 − 1/p²)`: `p + 1`; `16·(3/4)/2 = 6`; Conrad lines 1761, 1308; `Ces15` line 2615 | true; étale clause absent | R03 |
| 9.5 (sample) | Česnavičius 6.3, 4.4.4, 5.13 | `Ces15` lines 2708–2722, 1794–1803 (4.4.4(c): normalisation of `X(1)` in `Y₁(n)` over `ℤ[1/n]`), 2615–2619 | locators exact; not named in the docstring | R02 |
| Layer 10 cusps, Shimura covering | `N = 11, 13` | `(N²−1)/2|H|`: `N + 1` for `Γ₀`; reduced `2m_H`, `m_H(1 + N)` matches; `n = 5, 1`, `|H| = 1, 6`; inertia `2` iff `4 ∣ N − 1`, `3` iff `3 ∣ N − 1`, inside `H` | consistent | none |
| `IsHenselization.existsUnique_comp_eq` | `A = R × R`, `B = R` henselian; `A = k' ⊗_k k'`, `B = L = k'` | `f(1,0) ∈ {0,1}` and `χf = ψ` force `pr₁`; `f = ψ` | true | none |

### Library declarations opened at the pin (Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b`)

`ModularCurve/ModuliProblem.lean:283` (`IsRigid`: an arrow over the identity of the base fixing a structure is the identity, so the trivial problem is not rigid and KM 4.7.0 is not vacuous); `ModularCurve/FullLevel.lean:124`; `ModularCurve/Comparison.lean:101, 143, 302, 361`; `ModularCurve/LevelThreeLine.lean:772` (hypotheses `IsUnit 3` and `2` a nonzerodivisor, which is why `p = 2` needs its own argument); `EllipticCurve/Supersingular.lean:86` (points over `AlgebraicClosure K`); `EllipticCurve/Aut.lean:198`; `EllipticCurve/Legendre.lean:497`; `EllipticCurve/Scheme/FormalPoint.lean:121`; `EllipticCurve/FormalGroup/Height.lean:101`; `EllipticCurve/Isogeny/Frobenius/Supersingular.lean:150`; `EllipticCurve/Scheme/Geom/Frobenius.lean:45`; `Morphisms/Smooth/PureRelativeDimension.lean:43`; `RingTheory/Idempotents/Connected/ScalarExtension.lean:64`. Sixteen files or locations; `locallyOfFinitePresentation_mulBy_left`, `exists_unit_projModelFormalPoint_comp_eq`, `finite_autGroup` and `isSupersingular_iff_isPurelyInseparable_verschiebungIsogeny` located by name.

### Cross-roadmap citations and overlaps

- `citations.md`: no cross-roadmap citation is unresolved; the five "Lean names found nowhere" are declared in `Suggested.lean` (lines 470, 502, 545, 560, 715).
- `overlaps.md`: no id this README cites is dropped by an open pull request and none is defined only by an open revision. The six ids this pull request drops (five anchors cited by ShimuraVarieties, §0A.1 cited by CanonicalModelsAndGonality) have their old → new line in §Labels (rows 4378–4382 and the sentence at 4316). #1187 and #1808 conflict with this head; the generated block gives the order.
- Ownership: `IsStrictlyHenselianLocalRing`, `IsHenselization`, `EtaleRigidifier`, `IsCategoricalQuotient`, `KatzMazurQuotientData`, `CoarseModuliData`, `PDivisibleGroupIso`, `ArtinianTestAlgebra`, `UniversalDeformation`, `RegularityAxioms` are declared, among the roadmap folders on main and at the open heads, only in this folder and in the copies of it carried by #1187, #1808 and #1854.
- EllipticCurves on main (README line 717) defines supersingularity by `E[p](Kˢᵉᵖ) = O`; the pin uses the algebraic closure, and this README's Check on `y² + xy = x³ + t` over `𝔽₂(t)` shows the two differ. This roadmap consumes the pinned notion and says so; the discrepancy is in the EllipticCurves folder and is not a finding here.

## Not verifiable

- Katz–Mazur: the sources service finds no legal copy. Every KM locator is cited by locator only, including those of the sampled sections 1.1, 1.3 (KM 2.1, 2.2.5–2.2.6), 2.4 (2.5.1), 2.5 (§2.8, Notes Added in Proof), 3.3 (2.7.1–2.7.4), 4.1 (1.10.1, 1.10.5, 1.10.13), 4.3 (1.4.4, §3.7), 4.4 (3.6.0, 3.6.1), 6.1 (7.1.2–7.1.4), 8.2 and 8.4 (5.2.1, 6.2.1), 9.5 (7.4.2), and the theorem of p. 508 (its existence and use are confirmed through `Ces15` line 2733; its hypotheses were tested on instances above, not read).
- EGM: no legal copy found by the service; (4.39), (5.2), (5.3), (4.40) of Layer 2.2, (6.1), (6.18), (7.9), (1.12), (1.14) of Layer 2.4, (7.4), (11.11)–(11.22) of Layer 2.5 and (4.8), (4.16) of Layer 6.1 were not read.
- Deligne–Rapoport, SGA 3, Igusa, Katz, Lazard, Mazur, Oort, Tate–Oort, Scholze, Buzzard's lecture and Conrad's note on Keel–Mori were not read in this review.
- Silverman `AEC`: settled as uncertified.

## Source issues

- **Gap** in Loeffler at Theorem 3.7.4, p. 18: the source says a moduli problem is representable exactly when it is relatively representable and rigid, with no affineness hypothesis; it should assume the problem affine over `Ell/R`, which the invariant quotient in its sketch needs; affects a stated result.
- **Error** in Loeffler at the proof sketch of Theorem 3.7.4, p. 18: the source says the Legendre problem carries an action of `GL₂(𝔽₂) × {±1}`; it should be a degree-12 finite étale cover with only `{±1}` acting (`y² = x(x−1)(x−2)` over `ℚ` has 4 rational structures); affects the proof.
