# Review of MordellLawrenceVenkateshPartII (pull request #2461 at 1be51aa)

**Verdict:** needs changes

## R01 (P3) — `gap:griffiths-residue-hodge-filtration` is not declared in the plan

**Location:** `TauCetiRoadmap/MordellLawrenceVenkateshPartII/README.md` line 436: "What ComplexComparisonPartII must provide (gap:griffiths-residue-hodge-filtration): for a smooth hypersurface `X = {F = 0}` …", consumed in §8.6 (lines 2932, 2955) and in the Layer 8 Dependencies (line 3037).

**Claim:** The README states ten supplier gaps, but the plan lists only nine. This slug is the one missing, so the intake never records this roadmap as a consumer of it.

**Witness:** The `gaps` list in `packages/MordellLawrenceVenkateshPartII/design/plan.json` has nine slugs, and this is not one of them. PotentialAutomorphyDworkMotivesPartII declares the same slug (its README line 107), with an added equivariance clause. ComplexComparisonPartII has no residue target.

**Repair:** Add `{"slug": "griffiths-residue-hodge-filtration", "supplier": "ComplexComparisonPartII", "section": "§C5.3", "needs": <the sentence of README line 436>}` to the plan's `gaps`. Keep the README sentence as it is: it is the non-equivariant part of the contract PotentialAutomorphyDworkMotivesPartII already declares under this slug.

## R02 (P3) — `eulerian_central_mass_le_half` is not a headline theorem

**Location:** `TauCetiRoadmap/MordellLawrenceVenkateshPartII/Suggested.lean` lines 18–19 and 60–79: "`eulerian_central_mass_le_half` (README §8.4; Lawrence–Sawin, Lemmas A.4–A.6): for `n ≥ 2` the central mass `β₀ = Σ_q (A(n, q)/n!)²` of the Eulerian difference law is at most `1/2`."

**Claim:** §8.4 is an intermediate numerical lemma that feeds §§8.1 and 8.5. It is neither an end theorem nor a deep result the roadmap is built to reach, and `eulerian` is declared only so that it can be stated.

**Witness:** README lines 18–24 list the end theorems (§§6.1, 7.6–7.7, 9.3, 10.6, 10.9–10.10), and §8.4 is not among them. Line 2823 says §8.1 "reduces to `2Σ_q A(n, q)² ≤ (n!)²` (§8.4)". The source is an appendix lemma (LS line 4255).

**Repair:** In `Suggested.lean`, delete `eulerian`, `eulerian_central_mass_le_half`, the `/-! ## Layer 8: … -/` comment and the docstring bullet at lines 18–19. In the README, delete:
- the sentence on `eulerian` at lines 86–87;
- the `Equiv.Perm` bullet at lines 252–253;
- "`Suggested.lean` restates it as `eulerian`;" at line 2806;
- "This is `eulerian_central_mass_le_half`" at line 2883.

§8.4 keeps its statement as a target.

## R03 (P3) — Source corrections omit three Lawrence–Sawin defects that §§1.7, 10.4 and 10.8 repair

**Location:** `README.md` line 3517: "The following corrections to the sources are used throughout; each is fixed by an explicit instance." The pull request's description repeats the claim ("each source error the proofs use is corrected with a witness").

**Claim:** Three defects are corrected by the routes but missing from this list:
- the rank of `E_I` in the proof of LS Lemma 5.29;
- the lifting of integral points to the resolution in the proof of LS Theorem 9.2;
- the passage from `A′(K)`-translation to `A(K)`-translation in LS Corollary 9.3.

**Witness:** LS line 2349 takes `E_I` to be the pushforward of `O_ℚ[μ_r]` from `K` to `ℚ`, of rank `[K:ℚ]·φ(r)`. For `K = ℚ`, `r = 3` and the trivial character this gives 2, but `|I| = 1`. LS line 3943 lifts every integral point. LS lines 4022–4029 never bound `A′(K)/π(A(K))`.

**Repair:** Add three bullets to Source corrections:
- "**LS, proof of Lemma 5.29, p. 51.** `E_I` is not the pushforward of `O_ℚ(μ_r)` from `K` to `ℚ`, which has `ℚ`-rank `[K : ℚ]·φ(r)`; the orbit algebra has rank `|I|`. For `K = ℚ`, `r = 3` and the trivial character, `|I| = 1` while that pushforward has rank 2. §1.7 descends the orbit sum itself."
- "**LS, proof of Theorem 9.2, p. 86 (LS line 3943).** An integral point of the closure need not lift to the resolution. The node of `y² = x²(x + 2)` has its two preimages in the normalization at `t = ±√2`, so `(0, 0)` has no rational lift. §10.4 lifts only the points of the smooth open `U`."
- "**LS, Corollary 9.3, pp. 87–88.** Pulling back finitely many primitive `H′` up to `A′(K)`-translation bounds `H` only up to translation by `π⁻¹(A′(K))`. The cokernel `A′(K)/π(A(K))` is finite by weak Mordell–Weil; for `A = E` and `T = E[2]` it is `E(K)/2E(K)`. §10.8 supplies this step."

## R04 (P3) — Two locators cite Lawrence–Sawin for statements it does not make

**Location:** `README.md` line 3400: "Hence finitely many geometric classes give finitely many `A(K)`-classes (LS, arithmetic descent in Theorem 9.2 and Corollary 9.3, pp. 85–87)." Also line 987: "… is **E-balanced** when `B(e·v, w) = B(v, e·w)` (LS, Definition 5.22 and Remark 5.23, p. 47)."

**Claim:** LS pp. 85–87 contain neither the parametrization by `(A/T)(K)` nor a finite cokernel. LS p. 47 defines neither `E`-balanced pairings nor the exactness of `⊗_E`.

**Witness:** LS lines 3900–3902 state only the `A(K)`-orbit goal, and LS lines 4002–4006 obtain translates from a section `s ∈ A(X_K)`. LS lines 2141–2163 contain only the module axioms and the coequalizer.

**Repair:**
- §10.8: replace the parenthesis with "(the `A(K)`-orbit formulation is LS, proof of Theorem 9.2, p. 85, LS lines 3900–3902; the finite-cokernel argument is this roadmap's, from HeightsRationalPointsAndObstructions §§1.6–1.7)".
- §1.3: move "(LS, Definition 5.22 and Remark 5.23, p. 47)" to the end of the coequalizer sentence, and state the exactness and `E`-balanced sentences as the roadmap's own, with no LS locator.

## Verified sound

| Statement | Instances tried | Values on the roadmap side | Values on the source or independent side | Result |
|---|---|---|---|---|
| §0.2 integral, polarized, integral Frobenius | `ℚ(−1)`, `ℚ(1)`; rank-one system on `𝔾_m` with monodromy 2 | `q` integral, `q⁻¹` not; no `aℤ` with `2aℤ = aℤ` | LS lines 1903–1915, p. 42: lattice, polarization, integral eigenvalues on `V_et`, `V_cris` | holds |
| §0.4 constant systems | `O_E`; Legendre `H¹` at `λ = 0` | Betti `E`, trivial Galois, `F⁰` only, Frobenius `1 ⊗ σ_v`; local monodromy `[[1,2],[0,1]]` | LS lines 1935–1954 (Ex. 5.8, Rem. 5.9, pp. 42–43), line 2009 (Def. 5.13, p. 44) | holds |
| §1.3 `E`-modules | `E = ℚ × ℚ`, `E = ℚ` | `(V₁,V₂)⊗_E(W₁,W₂) = (V₁⊗W₁, V₂⊗W₂)`; ordinary `⊗` for `ℚ` | LS lines 2141–2163: axioms, coequalizer; no balanced pairings | holds; locator R04 |
| §1.4 equidimensional | ranks `(2,2)`, `(1,3)`; `E = 0` | `N = 2`; total 4 but not equidimensional; `V = 0` of every rank | LS lines 2164–2186 (Defs 5.24–5.25, Lemma 5.26, pp. 47–48) | holds |
| §1.7 orbit systems | `K = ℚ`, `r = 3`, trivial `χ` | `E_I` rank `#I = 1`; `V_I` rank `#I·N` | LS line 2349 pushforward: rank 2 | roadmap right; R03 |
| §2.9 global type finiteness | `GL₂² ⋊ C₂`, `diag(1,2,3,4)`; `ℚ(i)`, `GL₁` | 6 classes in `G°`, paired by swap: 3; other component needs eigenvalues `±x` | LS lines 2810–2822 assume algebraic-integer roots; LV line 476 needs `ℤ` coefficients | holds; correction valid |
| §3.1 single orbit | `ℂ/ℤ[i]` constant family; isotropic-plane `ℙ¹` | `F¹ = ℂ(e₁ + ie₂)`, `det((1,i),(1,0)) = −i`; `Σ v_i·v̄_i = 0 ⇒ v = 0` | LS line 2902 (p. 63), torsor argument lines 2913–2939 | holds |
| §3.4 p-adic transfer | germs `(xy)`, `(z²)`; `Z = D_mon` | `x^m ∉ (xy)`, `xy ∈ (xy)`; `z² ∈ (z²)`; codim 0: `Φ⁻¹(Z) = Ω` | LS lines 2979–2988 (any `K`), norm 3065–3068, Krull 3071–3077 | holds |
| §4.3 strong balance | classes `{1,2},…,{7,8}`, `σ = (13)(24)(57)(68)` | orbits `{1,3},{2,4},{5,7},{6,8}` each meet 2 classes | LS lines 3133–3137 (Ex. 6.7), Lemma 6.8 lines 3139–3177, pp. 68–69 | holds |
| §5.3 balance | `GL₆` `2+2+2`; `GL₁₂` `(1,4,1)`; `GL₂² ⋊ C₂` CM curve | `4(a₀−a₂)`; `(2,1,0) ↦ 8`; `(1,4,1) ↦ 0`, averages `1/4,1,1/4` vs `1/2`; `x₁/y₁ ↦ −1` | LS line 3429 `t^{4(a₀−a₂)}`; line 3400 tests `X*(M⁰)`, line 3478 characters of `P` | holds; correction valid |
| §5.9 root pairing | `SL₂`, `w = s`; `SL₃` 3-cycle; `w = 1` | `−s(−α) = −α` in target, `s(−α) = α` not; sizes `ℓ(w) = 2, 0` | LV line 3786 has `−w`; proof line 3795 says `w, w⁻¹` (p. 993) | holds |
| §5.12 fixed-type codimension | `n = 2`, `d = 1`, `GL₂`, `h = (1,2,1)`, `t = 2` | `c ≥ 5(e+4)`: `x ≤ 1/5`, `2T(x) = 2x ≤ 2/5 < B = 1` | LS lines 3734–3748 (Lemma 8.16, pp. 81–82) | holds |
| §7.5 semisimple fibres | constant family `𝒵₀ × 𝔸¹`; monotonicity of `T` | trivial monodromy, `y₀ + ℓℤ[S⁻¹]` dense; `3h⁰/2 + d ≤ A + h⁰` | LV lines 3123–3128 (p. 975), (10.1) line 2855 (p. 968) | holds |
| §10.3 Weil restriction | `K = ℚ(i)`, `S = {(2+i)}` | `x² − (4/5)x + 1/5` not integral if `5 ∉ S′`; `ℤ[1/10][i]`, discriminant `−4` | LS lines 3903–3918 (pp. 85–86) | holds |
| §10.8 `A(K)`-descent | `A = E`, `T = E[2]`; `T = 0` | classes `E(K)/2E(K)`; trivial for `T = 0` | LS lines 3900–3902, 4002–4006: section `s`, no cokernel | statement holds; R04 |
| §6.1 coefficient theorem | `d = 0`; fixed `c`, large `dim H` | `d = 0` excluded; hypotheses = LS 8.17 plus `ℤ[t]` Frobenius, `E ≠ 0`, `N > 0` | LS lines 3812–3841 (p. 83) | holds |
| §7.6 LV non-density | `r = 0`; elliptic family | `V = ℚ`, `h⁰ = 1`, `A = 0` fails; `Sp₂ = SL₂` vs `GSp₂ = GL₂` | LV lines 2885–2896; (10.4) non-strict | holds |
| §7.7 finiteness | component `C` with `dim C < d` | `A ≥ h⁰ + dim C`; arguments stay in `[0, A + h⁰]` | LV lines 2901–2903 (p. 970) | holds |
| §9.3 / `integralHypersurfaces_not_zariskiDense` | `G = 1`; Fermat; `3(x₀²+x₁²+x₂²)`, `S = {2}`; `x₀^p+x₁^p+x₂^p` | `G = 1` refuted by Fermat when `S ⊇` primes of `d`; `3(…)` zero mod 3; char-`p` Fermat singular | LV lines 2916–2918: `n ≥ n₀`, `d ≥ D₀(n)`, `D₀` before `S` | holds, not vacuous |
| §8.4 / `eulerian_central_mass_le_half` | `n = 0, 1, 2, 3, 4, 20` | `0 ≤ 1`; `2 ≤ 1` false (excluded); `4 = 4`; `36 = 36`; `488 ≤ 576`; ratio `0.212` | brute-force descent counts equal the recurrence for `n ≤ 7`; LS line 4255 | holds; R02 |
| §8.6 primitive Hodge numbers | quartic surface; quintic threefold; cubic surface | `1, 19, 1`; `1, 101, 101, 1`; `0, 6, 0` | BC lines 1341–1344 (p. 34): degree `(n−p)d − n − 1` for `PH^{p,n−1−p}` | holds; R01 |
| §10.4 smooth base | `y² = x²(x+2)`; `x² − 2y²` | node's preimages `t = ±√2`, no rational lift; only rational point `(0,0)` | LS line 3943 lifts every point | roadmap right; R03 |
| §10.6 primitive finiteness | `D₁`; `d = 2·8855` | `53130/6 = 8855`; `2·8855` allowed | LS lines 3881–3891 (`i ≥ 2` indexing agrees) | holds |
| §10.9 all hypersurfaces | `d = 2·8855`; `n ≥ 4` | excluded (degree-2 quotient); `D_j ∣ d ⇔ 6D_j ∣ φ³` | LS lines 4013–4019, 4035–4038 | holds |
| §10.10 abelian surfaces | `φ² = 2`; `h ↦ mh` | `g = 2`; `q(mh) = m²q(h)` for `f_*[C]` | LS lines 4041–4057 (p. 88) | holds |

- Source locators checked against the cached texts: the 15 sampled targets and 22 further statements (LV Lemmas 2.3, 10.3–10.5, Thm 10.1, Prop 10.2, Prop 11.3; LS Defs 5.2, 5.6, Lemmas 6.2–6.3, 6.5, 7.2, 8.12–8.14, A.4, Thms 7.3, 8.17, 9.2, 9.6, Cor 9.3; Beauville Théorèmes 2, 4; BC Thm 10.13).
- Library: 20 cited declarations `#check`ed at the pins (three Tau Ceti modules built first). All file and line locators match, for example `Parabolic.lean:154`, `Strictness.lean:110/118/131`, `Degree.lean:74/130`, `Torsor.lean:226` and `Filtration.lean:432`.
- Cross-roadmap: about 120 cited sections in 33 roadmaps resolved on main or at the open heads. The one lead from the citations tool, `VanishingCycles.lisseDirectImageTransport`, is the §F.3 target label (EtaleCohomologyFoundations README line 1135).
- Gaps: the nine plan slugs match the README. LanglandsParameterStacks §2.3, ShimuraData §3.4, PadicHodgeTheory §§4.4 and 8.1, AbelianSchemesAndArithmeticModuliPartII B3 and ClassicalArithmeticCompletion §§2.18, 2.39 and 2.56 do not already state what they ask for.
- Gate at 1be51aa: every check passed. Dependency check: `depcheck: 263 roadmaps, 2570 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` gives two `sorry` warnings only. The elaborated signatures keep every binder, and nothing changed.
- One-tactic probes all fail: `simp`, `positivity`, `omega` and `norm_num [eulerian]` on the Eulerian bound, and `simp` on the hypersurface theorem. `decide` confirms `eulerian 3 1 = 4` and equality at `n = 3`.
- Computed: `2ΣA(n,q)² ≤ (n!)²` holds for `2 ≤ n ≤ 20`; `Σj²β_j = (n+1)/6` for `n = 2, 3, 4, 5, 10`; the trinomial coefficients used in §§8.6 and 9.2.
- Ownership against all 458 open heads and main was checked with `roadmaps grep`, by object: Hodge–Deligne systems, semilinear normalizers, strong balance, balanced filtrations, `H¹` finiteness over p-adic fields, Griffiths residue and Bakker–Tsimerman.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh, GaloisSectionsPadicPeriodMaps, KloostermanMomentsAndPotentialAutomorphy, MixedHodgeModulesAndIrregularHodgeTheory, AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometryPartII, LogicAndDefinabilityInNumberTheory, and the board's rejected LawrenceVenkateshMethod design. Shared objects:
- The codimension consequence of LS Lemma 6.3 is owned by this roadmap at §3.3 (merge order 346). LogicAndDefinabilityInNumberTheory §7.6 (350, later) restates it, so the fix belongs to that roadmap.
- `gap:hodge-tate-image-cocharacter` is one contract on PadicHodgeTheory, shared with SheafConvolutionOnAbelianVarieties.
- The single-divisor primitive quotient is owned here at §10.7. SheafConvolutionOnAbelianVarieties requests only the family form, from AbelianSchemesAndArithmeticModuli (`gap:translation-stabilizer-family-quotient`).

Source independence: 21 passages compared with 4 sources (LS, LV, Beauville, BC). None is shared beyond forced statements; the longest run is 7 words (§3.1 against LS line 2934). Largest share: LS, about 133 of 179 locators. Contents compared with LS: independent.
- Layers 0–2 split LS §5, Layer 4 merges LS §6.2 with §7, and Layers 7–9 interleave LV §§10–12. Layer 8 (LS Appendix A) comes before Layer 10 (LS §9).
- The remaining order is forced by the *Needs:* lines: §1 on §0.3, §3 on §§0.6–0.7, §5 on §§2.5–2.8, and §6.1 on §§4.2 and 5.12.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4, Corollary 1 to Proposition 36, and III §4.3, Theorem 4 (§2.11): recorded as uncertified in the manifest; no legal text is cached.
- §7.4's Check that the arXiv v3 of LV has a stricter first inequality (README line 2654): the v3 text is not cached; only the printed version was read.
- Public formalisations outside the pinned libraries matching the `Suggested.lean` declarations: not searched.

## Source issues

- **Error** in LS at proof of Lemma 5.29, p. 51: the source says the orbit algebra is the pushforward from `K` to `ℚ` of the `ℚ(μ_r)` unit system, of rank `[K:ℚ]φ(r)`; it should be the descent of the orbit sum, of rank `|I|` (trivial character, `K = ℚ`, `r = 3`: 1, not 2); affects the proof.
- **Gap** in LS at proof of Theorem 9.2, p. 86: the source says every integral point of the closure lifts to the resolution by properness; it should restrict to the open set where the resolution is an isomorphism (a node with conjugate branches does not lift); affects the proof.
- **Gap** in LS at Corollary 9.3, pp. 87–88: the source passes from primitive quotients up to `A′(K)`-translation to `H` up to translation without bounding `A′(K)/π(A(K))`; it should add the finiteness of that cokernel by weak Mordell–Weil; affects a stated result.
- **Misprint** in LS at proof of Theorem 9.6, p. 88: the source measures a map by the intersection of the image curve with `ψ`; it should use the pushforward cycle `f_*[C]`, which makes the degree quadratic in `f`; affects the proof.
- **Misprint** in LV at end of the proof of Lemma 11.4, printed p. 993: the source says the maps `w` and `w⁻¹` are inverse bijections; it should say `−w` and `−w⁻¹`, as part (iii) of the statement has; affects nothing.
- **Gap** in LS at proof of Lemma 5.49, p. 61: the source applies Faltings's lemma (LV Lemma 2.3) assuming only algebraic-integer Frobenius roots; it should assume Frobenius characteristic polynomials with integer coefficients, as that lemma requires; affects a stated result.
- **Error** in LS at Lemma 6.5, p. 67: the source states the index-class lemma for every `SO_N`; it should exclude `SO₂` (infinite centre) and `SO₄` (adjoint quotient not simple), where part (2) fails; affects a stated result.
- **Error** in LS at Lemma 8.7, pp. 76–77: the source asserts balance for every character of the Levi's identity component; its proof covers only characters of the parabolic trivial on `Z(G)`, and the stronger claim fails for `GL₂² ⋊ C₂`; affects a stated result.

## For the human reviewers

- **Licence.** The cached LV text comes from `bimsa.net`, an institutional site that is neither the publisher's nor the authors'. The README cites the Inventiones article and arXiv:1807.02721v3 (README lines 3590–3592).
- **Licence.** Serre, *Galois cohomology*, is recorded as uncertified (paywalled). Its locators in §2.11 (README lines 1631 and 1636) were not checked against a text.
