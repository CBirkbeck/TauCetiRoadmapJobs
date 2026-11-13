<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6849555447 -->
Review (claude) of 2e1b67d

Verdict: needs_changes

1. **F01** (P2) §§5.4–5.5 compare complexes and use maps that are never defined

   **Location:** `README.md:687` (§5.4): "functorial quasi-isomorphisms `RΓ^BK_syn(X_{O_C}, ℚ_p(r)) ≅ RΓ_syn(X_{O_C}, ℚ_p(r))` … and, for `X` Stein, `RΓ_syn(X_C, ℚ_p(r)) ≅ RΓ^BK_syn(X̂_{O_C}, ℚ_p(r))`"; `README.md:699` (§5.5): "the middle `β̃ = p^{−r}β ι_rig^{−1} ι_BK^{−1} α_FM^{−1}`".

   **Claim:** §5.4 defines the Bloch–Kato complexes it compares, and §5.5's middle vertical map is determined by named maps.

   **Witness:** §5.4 defines only `RΓ^BK_syn(X_C, ℚ_p(r))`, which occurs in neither comparison. `RΓ^BK_syn(X_{O_C}, −)`, `RΓ^BK_syn(X̂_{O_C}, −)`, `RΓ_syn(X_C, −)`, `β`, `ι_rig`, `ι_BK` occur nowhere else in `README.md`. CDN-STEIN line 1442 builds the crystalline complex from `RΓ_cr(X/r^PD_ϖ)` and `B̂_st^+`, neither named in the README.

   **Exact repair:** in §5.4,

   1. Name the complex already defined `RΓ_syn(X_C, ℚ_p(r))`, the overconvergent syntomic complex (CDN-STEIN §3.2.2, line 961; its introduction, line 206, writes `RΓ^BK_syn(X_C, ℚ_p(r))`), and say the two names denote one object.
   2. Define, for a semistable formal scheme `𝔛` over `O_K` (in particular the completion `X̂`), the crystalline Bloch–Kato complex `RΓ^BK_syn(𝔛_{O_C}, ℚ_p(r))` as the mapping fibre of `[RΓ_cr(𝔛/r^PD_ϖ, ℚ_p) ⊗̂ B̂_st^+]^{N=0, φ=p^r} → (RΓ_dR(𝔛_K) ⊗̂_K B_dR^+)/F^r`, where `r^PD_ϖ` is the p-adic divided power envelope of `O_F[[T]] → O_K`, `T ↦ ϖ` (CDN-STEIN §3.2.1, lines 925–930; §3.3.3, lines 1440–1449). Cite PadicHodgeTheory §0.6 (*Breuil's completed semistable ring*) for `B̂_st^+`, and add it to the *Needs* line and to the supplier contracts.
   3. Name the maps with source and target: `ι_BK: RΓ^BK_syn(𝔛_{O_C}, ℚ_p(r)) → RΓ_syn(𝔛_{O_C}, ℚ_p(r))` (Proposition 3.48, lines 1453–1454); `ι_rig: RΓ_syn(X_C, ℚ_p(r)) → RΓ^BK_syn(X̂_{O_C}, ℚ_p(r))` (Theorem 4.1, lines 1525–1527); and `β: H^r_syn(X_C, ℚ_p(r)) → Ω^r(X_C)^{d=0}`, induced by `RΓ_syn(X_C, ℚ_p(r)) → F^r(RΓ_dR(X_K) ⊗̂ B_dR^+)` followed by `θ` (CDN-STEIN lines 1198–1200 for `r = 1`; Proposition 3.36, line 1224).

   Tested on the instance: with these three names the composite `p^{−r}β ι_rig^{−1} ι_BK^{−1} α_FM^{−1}` has source `H^r_proét(X_C, ℚ_p(r))` and target `Ω^r(X_C)^{d=0}`, as CDN-STEIN line 1716 states; for `r = 1` on the chain model of `𝔸¹` it sends the class of `T` to `dT`, the §5.5 Check.

2. **F02** (P2) §2.4 states an exact sequence in groups it does not define

   **Location:** `README.md:388–390` (§2.4): "Define the localized symbols `Symb_ℓ(Y_S)` on the pattern (CDN-CURVES §6.2.1) and the Kummer regulator" and "(c) … `ker(∏_{i∈I} Symb_ℓ(Y_i^gen) → ∏_{(i,j)∈I_{2,c}} Symb_ℓ(Y_{i,j}^gen))`".

   **Claim:** (b) and (c) are stated on defined objects.

   **Witness:** `Y_i^gen` and `Y_{i,j}^gen` occur in `README.md` only at line 390, undefined; `Symb_ℓ(Y_S)` and the regulator are given by citation only. CDN-CURVES line 3118 takes these groups from its §§4.1.2 and 5.1.3; lines 3122–3129 define `Symb_ℓ(Y_S)`.

   **Exact repair:** state the three definitions in the README's own words.

   - For `Z` a leg or a ghost circle, `O(Z^gen) = O(Z)[1/p]` and `Symb_ℓ(Z^gen) = ℤ_ℓ ⊗̂ O(Z^gen)^×` (CDN-CURVES §4.1.2, lines 2023–2024 and 2033–2035); for a short `Y_s`, `Symb_ℓ(Y_s^gen)` is the group of §5.1.3 (lines 2478–2482) formed with the meromorphic functions on its generic fibre.
   - `Symb_ℓ(Y_S)`: compatible families of symbol data `(u_{i,n}, v_{i,n})` on the pieces `Y_i` with gluing functions `g_{i,j,n}` on the ghost circles, modulo the trivial families `(a_{i,n}^{ℓ^n}, a_{i,n+1}^ℓ/a_{i,n}, a_{i,n}/a_{j,n})` (CDN-CURVES §6.2.1, lines 3122–3129).
   - The Kummer regulator: `f ↦ ℓ^{−n}Div(f)` gives `A_{ℓ,n}(Y)/(C(Y)^×)^{ℓ^n} ≅ H¹_ét(Y, ℤ/ℓ^n(1))`, compatibly with `O(Y)^×/ℓ^n` and `Pic(Y)[ℓ^n]`, and the regulator is the limit over `n` (CDN-CURVES lines 2467–2477, 2485–2488).

   Tested on the instance: for the leg `T₁T₂ = p^µ` and `ℓ ≠ p` the first definition gives `ℤ_ℓ ⊗̂ O(Z^gen)^× ≅ ℤ_ℓ` by the residue (CDN-CURVES Proposition 4.5), the value the second Check of §2.4 asserts.

3. **F03** (P2) an object is handed to a roadmap that excludes it

   **Location:** `README.md:41`: "Locally analytic generalized Steinberg representations and the Orlik–Schraen theorem belong to LocallyAnalyticRepresentationsOfLocalGroups."

   **Claim:** that roadmap owns them.

   **Witness:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:31` lists under "Not in this roadmap": "locally analytic generalised Steinberg representations". "Orlik–Schraen" occurs nowhere in that file, on main, or at any open head (`roadmaps grep`, no match). Each roadmap hands the object to the other.

   **Exact repair:** delete the bullet. No layer of this roadmap uses a locally analytic Steinberg representation or the Orlik–Schraen theorem (the string "locally analytic" occurs in `README.md` only in that bullet), so nothing else changes. Tested: after deletion no remaining bullet of that list attributes an object to a roadmap whose text excludes it; the two bullets that name roadmaps I could read resolve (PadicLocalLanglandsForGL2Qp §6.9; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §§0.2 and 5.4).

4. **F04** (P3) `flagSubspace` restates Mathlib's `Module.Basis.flag`

   **Location:** `Suggested.lean:48`: "def flagSubspace (K : Type*) [Field K] (n m : ℕ) : Submodule K (Fin n → K)"; `README.md:184, 190, 200–201`; the Mathlib contract at `README.md:64–72` does not mention `Basis.flag`.

   **Claim:** the flag subspaces need a definition of this roadmap's own.

   **Witness:** `Mathlib/LinearAlgebra/Basis/Flag.lean:40`, `Module.Basis.flag`. On a scratch copy, `flagSubspace K n k.val = (Pi.basisFun K (Fin n)).flag k` for `k : Fin (n + 1)` closes by `ext x; simp [flagSubspace, Module.Basis.mem_flag_iff_repr_eq_zero, Fin.le_def]`.

   **Exact repair:** delete `flagSubspace` from `Suggested.lean` and write

       noncomputable def parabolic (K : Type*) [Field K] (d : ℕ) (J : Set (Fin d)) :
           Subgroup (GL (Fin (d + 1)) K) :=
         ⨅ (k : Fin d) (_ : k ∉ J),
           (MulAction.stabilizer (LinearMap.GeneralLinearGroup K (Fin (d + 1) → K))
             ((Pi.basisFun K (Fin (d + 1))).flag k.succ.castSucc)).comap
             (Matrix.GeneralLinearGroup.toLin (n := Fin (d + 1)) (R := K)).toMonoidHom

   In the README, replace the definition sentence and the API bullet of `flagSubspace` by a citation of `Module.Basis.flag` (`Mathlib/LinearAlgebra/Basis/Flag.lean`, line 40) and `Pi.basisFun` (`Mathlib/LinearAlgebra/StdBasis.lean`, line 120) in the Mathlib contract, and keep the two flag Checks as prose about the flag of the standard basis (the `K⁰` Check becomes `flag 0 = ⊥ = ⊤`). Tested: the file with this change elaborates with `sorry` at the headline as its only warning; `parabolic_mono` and the later declarations are unchanged. (`noncomputable` is required: without it the definition fails to compile.)

5. **F05** (P3) the residue isomorphism is cited to the wrong statement

   **Location:** `README.md:395` (§2.4 Check): "`Symb_ℓ ≅ ℤ_ℓ`, generated by `(T₁)_n`, whose Kummer class has residue `1` (CDN-CURVES Lemme 4.4)"; `README.md:464` (§3.3 Check): "(§2.4, CDN-CURVES Lemme 4.4)".

   **Claim:** Lemme 4.4 gives the residue isomorphism.

   **Witness:** CDN-CURVES Lemme 4.4, line 2041, is the presentation `Symb_ℓ(Y^gen) ≅ lim_n A_{ℓ,n}(Y^gen)/(C(Y^gen)^×)^{ℓ^n}`. The isomorphism `Res: Symb_ℓ(Y^gen) ≅ ℤ_ℓ` for a leg or ghost circle, `ℓ ≠ p`, is Proposition 4.5, lines 2051–2053.

   **Exact repair:** in both Checks replace "Lemme 4.4" by "Proposition 4.5, lines 2051–2053, with Lemme 4.2 for the residue of a unit". Tested: Proposition 4.5 is stated for a leg, which is the object `T₁T₂ = p^µ` of the Check, and its proof (lines 2054–2067) gives the generator `T₁` with `k = 1`.

6. **F06** (P3) the Tau Ceti contract misses the nearest declaration

   **Location:** `README.md:76`: "Nothing in the pinned Tau Ceti concerns rigid or pro-étale cohomology, Hyodo–Kato cohomology or generalized Steinberg representations".

   **Claim:** the only Steinberg-named file at the pin is the unrelated symbol relation.

   **Witness:** `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean:101`, `theorem simple_GL2Steinberg : Simple (GL2Steinberg F)`, for a finite field `F` and complex coefficients; the representation is defined in `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean`.

   **Exact repair:** add to the paragraph: "`TauCeti.simple_GL2Steinberg` (`TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean`, line 101) is the irreducibility of the complex Steinberg representation of `GL₂` of a finite field; it is a near miss and not a supplier, the group being finite and the coefficients `ℂ`." Tested: its carrier `FDRep` over a `Fintype` field cannot state §0.4(a) for `GL_{d+1}(K)`, `K/ℚ_p` finite, so the target and the Lean headline stay.

7. **F07** (P3) a Check of §0.1 points at the wrong bullet, and `H⁰`, `H⁰_c` are undefined

   **Location:** `README.md:162`: "the exact sequence of the second bullet reads `0 → 0 → L → L² → L → 0 → 0`"; `README.md:154`: "`0 → H⁰_c(Γ, L) → H⁰(Γ, L) → L^{A∖A_c} → H¹_c(Γ, L) → H¹(Γ, L) → 0`".

   **Claim:** the second API bullet carries the sequence, and its terms are defined.

   **Witness:** the second bullet (line 153) is functoriality; the sequence is the third (line 154). `H⁰` and `H⁰_c` are not defined in §0.1, which defines only the cokernels and `H¹_c(−)^*`.

   **Exact repair:** write "third bullet" at line 162 and add to the definition paragraph `H⁰(Γ, L) = ker(∂: L^S → L^{A_c})` and `H⁰_c(Γ, L) = ker(∂: L^{(S)} → L^{(A)})`. Tested on the annulus graph (one vertex, two legs): `H⁰_c = ker(x ↦ (−x, −x)) = 0` and `H⁰ = ker(L → 0) = L`, the values the Check prints.

8. **F08** (P3) the characteristic-zero source of the Lean headline has no locator and no manifest key

   **Location:** `README.md:210` (§0.4): "(CDN-STEIN Proposition 5.1; Casselman in characteristic `0`; GK14 Corollaries 4.3 and 4.4 in characteristic `p`)"; `Suggested.lean:120`: "after Casselman in characteristic `0`".

   **Claim:** every cited work is in `sources.toml` with a locator.

   **Witness:** CDN-STEIN line 1920 proves the characteristic-zero case by citing its reference [10], Chapter X, Theorem 4.11: Borel–Wallach, *Continuous cohomology, discrete subgroups, and representations of reductive groups* (line 3254). `sources.toml` has no entry for it.

   **Exact repair:** record the work through the sources service under one new key (locator scheme `theorem`, locator "Chapter X, Theorem 4.11", cited for §0.4) and write the citation as "Casselman in characteristic `0`: Borel–Wallach, Chapter X, Theorem 4.11, as cited at CDN-STEIN line 1920" in §0.4, the References and the docstring. Add one sentence to the route of §0.4(a): the cited theorem is over `ℂ`, and the statement for an arbitrary field `A` of characteristic `0` follows because `Sp_J(A) = Sp_J(ℚ) ⊗ A` and the finite-dimensional spaces of invariants under compact open subgroups are absolutely simple Hecke modules. Tested: for `W ⊂ Sp_J(A)` nonzero and stable, `W^U` is `0` or all of `Sp_J(A)^U` for each compact open `U`, and nonzero for small `U`, so `W = Sp_J(A)`.

9. **F09** (P3) two symbols are used without definition or against the layer's notation

   **Location:** `README.md:748` (§6.3): "`φ^f` acts on `H^s_rig(M/S₀)`"; `README.md:858` (§7.1): "the height-zero part `M_m` over `F̆` maps to `Sp(F̆_m)`".

   **Claim:** the notation is defined where it is used.

   **Witness:** `S₀` occurs four times, all at line 748, undefined; §5.2 (line 661) calls the same base `O_F^0 = (Spf W(k), 1 ↦ 0)`. The Layer 7 preamble (line 854) fixes `M_n` as the Drinfeld levels, and §7.1 ends with `π₀(M_{n,C})` in that sense, so `M_m` names two towers in one paragraph.

   **Exact repair:** in §6.3 write `H^s_rig(M/O_F^0)` and `H^s_rig(Y/O_F^0)`, or add "`S₀ = O_F^0` of §5.2"; in §7.1 write the Lubin–Tate height-zero level as `LT_m` in the statement and in `π₀(LT_m ×_{F̆} Sp(C))`. Tested: with `LT_m` the last sentence of §7.1, on `π₀(M_{n,C})`, refers only to the Drinfeld levels of the preamble, and the first Check (`m = 1`, `q − 1` components) reads on `LT_1`.

Nine findings: three P2, six P3. No P1. The four findings of the previous round are repaired, and none of the passages they changed fails a recomputed Check. The new findings are in text no earlier repair touched: two target statements name objects the README never defines, one scope sentence hands an object to a roadmap that excludes it, and the rest are duplication, locator, manifest and notation points. Below, `README.md` and `Suggested.lean` abbreviate `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`; library paths are relative to the pinned repositories.

## Verified sound

### Previous findings, checked first

| Previous finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P1), detection by a non-injective comparison | Repaired | `README.md:302`: "hence `ι_HK^{(p)} = ι_HK^ϖ` exactly when `ι_HK^ϖ ∘ cN_p = 0`. When `ι_HK^ϖ` is injective … exactly when `log_K(a)N_p = 0`". Recomputed: `exp(−cN) − 1 = −cN·g(cN)`, `g` unipotent; `ι = 0` gives `0 = 0` with `cNe₁ = ce₀ ≠ 0`. Checks at lines 309–311 recomputed (table). |
| F02 (P1), unsigned component characters | Repaired | `README.md:858`: "`(g, b, w)` … translates by `det(g)·Nrd(b)^{−1}·rec_F(w)`, where `rec_F` … sending an arithmetic Frobenius to a uniformizer". Checked against STR08 line 382 and EndoscopicTransferAndUnitaryTraceComparison §12.7 at its open head (table). |
| F03 (P2), node set of the resolved model | Repaired | `README.md:873`: "whose triangulation contains the node set `Σ_an(M_{n,E}^ϖ)` … and refines it, the further vertices being genus-zero points of valence two". Matches CDN20 lines 2108–2122 and CDN23 lines 1206–1210. |
| F04 (P3), locator of `Ĵ` | Repaired | `README.md:597`: "(CDN-CURVES §7.1.5, lines 4017–4021, printed p. 96)" and "lines 4021–4028". Read: the definition is at lines 4017–4019, the sequence at 4022–4027. |

Nothing was marked "not actionable in this package". The repaired patterns were searched in the rest of the text: no other statement infers vanishing of an operator from equality of two composites with an arbitrary map; no other passage uses `det·Nrd` unsigned; no other passage identifies a resolved triangulation with a node set.

### Adversarial pass: computed values

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Lean headline, §0.4(a) | `d = 0`; `J = Δ`; `d = 1`, `q = 2`; arbitrary char-0 `A` | `d = 0`: `Fin 0` empty, `P = ⊤`, `Sp = LC(pt, A) = A`, simple. `J` everything: infimum over the empty family is `⊤`, relation supremum is `⊥`, `Sp = A`. `d = 1`, `q = 2`: `Γ(ϖ)`-invariants `A³/A`, rank `2 = q`. Char 0: absolute simplicity of Hecke modules carries `ℂ` to any `A` (R08). | Sound; hypotheses `Field A`, char `0` or `p` match GK14 Cor. 4.3 (type A has no exceptional factor). |
| `parabolic` versus `P_J` | `d = 1`: upper triangular, lower unipotent; `J = ∅`, `J = {0}` | `[[a,b],[0,c]]e₀ = ae₀ ∈ Ke₀`; `[[1,0],[1,1]]e₀ = e₀ + e₁ ∉ Ke₀`. `J = {0}`: no flag imposed, `⊤`. | Upper triangular Borel; correct. |
| `flagSubspace` versus `Module.Basis.flag` | `k : Fin (n+1)`; `k.succ.castSucc` for `k : Fin d` | Both equalities proved by `ext; simp` on a scratch copy. | R04. |
| `translation` | `S₃`, `g = (12)`, `h = (23)`, `f = δ₁`, `x = gh` | `((gh)f)(x) = f(1) = 1`; `(g(hf))(x) = f(h⁻¹g⁻¹gh) = 1`. With `f(gx)`: `f((gh)²) = 0` against `f(hggh) = 1`. | Left action; correct. |
| §0.1 graphs with legs | Loop; one vertex with one leg; with two legs; segment with two legs at each end | Loop: `∂ = 0`, `H¹ = H¹_c = L`. One leg: `coker(L → L) = 0`. Two legs: `coker(x ↦ (−x,−x)) = L`, `ker ∂^* = {φ₁ + φ₂ = 0}`. Segment: `H¹ = coker(L² → L) = 0`, `ker(L⁵ → L²)` of rank `3`. | Sound; R07 for the bullet reference. |
| §0.2 `N_µ` | Compact loop of length `µ`; segment above | Loop: multiplication by `µ`, bijective on a `ℚ`-module. Segment: target `0`, source rank `3`. | Compactness needed; correct. |
| §0.5 presentation | `r = 0`; `d = 1, r = 1`; `d = 1, r = 2` | `r = 0`: `f(H₁) − f(H₀) = 0`, constants, `Sp_0 = ℤ`. `r = 1`: `f(H,H) = 0` from the identity at equal arguments; `f = g(H₁) − g(H₀)`. `r = 2`: three vectors of `K²` dependent, group `0 = Sp_2`. | Matches CDN-STEIN lines 2046–2054. |
| §0.5 measures | `δ_a`; `δ_a − δ_b`; `Σ p^{−n}(δ_{x_n} − δ_{y_n})` | Mass `1`, `0`; values `p^{−n}` on small balls, unbounded, yet defined on every compact open (both points or neither for `n ≫ 0`). | Sound. |
| §1.1 comparison | Open disc; closed disc `ℓ ≠ p` | Open disc: source remark at CDN-STEIN lines 114–117 gives non-injectivity over a non-spherically complete field. Closed disc: both sides `0`. | Quasi-compactness needed; correct. |
| §1.3 period spaces | Slopes `0`, `1`, `1/2`; `N = 0`, `φ = p^r` on `M^{φ=p^r}` | `(B_cris^+)^{φ=p}`, Dimension `(1,1)`; `(B_cris^+)^{φ=1} = ℚ_p`; slope `1/2`: `(B_cris^+ ⊗ M)^{φ=1} = 0`. `X^{r−1}`: `(B_cris^+)^{φ=p^{−1}} = 0`. | Matches CDN-STEIN lines 2160–2167. |
| §1.4 `Ψ_ϖ` | `f(u) ⊗ m` | `D_raw Ψ = f(eu − ℓ) ⊗ N_raw m − e f′(eu − ℓ) ⊗ m = eΨ D_p`. `ι_ϖ(Ψ(u)) = e·log([ϖ^♭]/ϖ) − ℓ_a = ι_p(u) − log_K(a)`. | Correct. |
| §1.4 transport and independence | `ϖ ↦ ϖw`; `K = ℚ_3`, `ϖ = 12` | `a ↦ aw^e`; `exp(e·log(w)N_p)·exp(−(log a + e·log w)N_p) = exp(−log(a)N_p)`. `ι^{(p)} = ι^{12} exp(−log_3 4·N) = ι^3`; wrong sign leaves `2·log_3(4)e₀`. | Agrees with CohomologyComparisons §4.5 (`ρ_{πu} = ρ_π ∘ exp(−log_K(u)N_raw)`, read at its head). |
| §2.1 base rings | `A_inf`: `p`, `[p^♭]` | Mod `p`: `[p^♭] ↦ p^♭ ≠ 0`. `θ_0([p^♭]) = 0`, `θ_0(p) = p`. | Incomparable; correct. |
| §2.3 unseparated comparison | Annulus, `ω = Σ p^n T^{p^n−1} dT` | Primitive coefficients at `T^{p^n}` equal `1`, not tending to `0`; partial sums exact. `[ω] ≠ 0`, zero after separation. | Correct. |
| §2.4 symbols (sampled) | Constant; `(h_n^{ℓ^n})`; leg, `ℓ ≠ p` | `c = (c^{1/ℓ^n})^{ℓ^n}`: trivial. `h_{n+1}^{ℓ^{n+1}}/h_n^{ℓ^n} = (h_{n+1}^ℓ/h_n)^{ℓ^n}`: in the group. Leg: `ℤ_ℓ` by the residue. | Definition of `Symb_ℓ(Y)` matches line 476; R02, R05. |
| §3.1 filtrations (sampled) | Closed disc with two Gauss points; annulus | Disc: `∂^*` at `s₂` kills the edge, at `s₁` the leg, `H¹_c^* = 0`, `H¹(Γ_int) = 0`. Annulus: residue line `C·dT/T`. | Matches Théorème 6.14(ii), line 3379, with `Γ_int`. |
| §3.3 cone, shift and sign | `f = 1 + pT`, `φ(T) = T^p` | `Cone[−1]^n = A^n ⊕ B^{n−1}`, `d(a,b) = (da, −f(a) − db)`. `dy = (φ/p)x − x`, so `−(1 − φ/p)x − dy = 0`. `p = 2`: `t/2 ∈ F¹A_cris`, `φ(t/2) = 2(t/2)`. | Correct, including the odd-`p` qualification. |
| §3.5 diagram (sampled) | Proper `Y`; Tate curve | `ℚ_p ⊗̂ (1 + m_C) = 0` (divisible). Tate: `(1,2) − (1,0) = (0,2)`. | Matches Théorème 6.32, lines 3826–3833: second row a complex. |
| §4.2 (sampled) | Two components; countably many annuli; slope-0 line | `(0,1)`: `d = 0`, nonzero mod diagonal `C`, zero mod `C²`. `C ⊗ ∏C̆ ⊊ ∏C`. Kernel `t·H^{φ=1}`: slope `0` gives `ℚ_p t`, slope `1` gives `0`. | Matches Théorème 8.1, lines 4292–4301, and Remarque 0.8(ii). |
| §4.3 (sampled) | Half-plane; Mumford genus `g`; `e = 2`, `q = π²` | Tree: `H¹(Γ) = 0`, pieces `0, 0, Sp_1^*`. Mumford: `(g, 0, g)`. Two nodes `xy = π`: `N_raw = 2`, length `v_p(q) = 1`, `N_p = 2/2`. | Matches Théorème 0.15 = 8.9. |
| Weil–Deligne convention, §§4.4–4.5 | `Φ = diag(1,q)`, `Ne₁ = e₀`; `ℚ_ℓ[u]` | `NΦe₁ = qe₀ = qΦNe₁`. `g(u) = χ^{−1}(u + c)`: `(gh)(u) = χ(gh)^{−1}(u + c(g) + χ(g)c(h))`, cocycle; `N∘g = χ^{−1} g∘N`, `χ(Φ_geo)^{−1} = q`. | Relation `Ng = p^{deg g}gN`; source line 4432 misprints the group law. |
| §4.6 similarity | `y² + y = x³` over `𝔽₂` | Points: `(0,0), (0,1), ∞`; `a = 0`; `X² + 2`; after `(1)`: `X² + 1/2`. | Twist on both sides; correct. |
| §4.8 (sampled) | `μ_{p^∞}`; ordinary and supersingular `g = 1`; `y² = x³ − x`, `p = 5` | `(1,1)`; `(1,1) + (0,1) = (1,2)`; slope `1/2` twice: `(1,2)`. `Δ = 64`, a `5`-unit. Kernel of `log_J` on sequences tending to `0`: `p`-power torsion chains, `V_p(J)`. | Matches lines 4017–4028 and 436–440. |
| §4.9 variance | `μ_{p^∞}` | Contravariant slope `1`; dual `−1`; twist `(−1)`: `0`. `(B_cris^+)^{φ=p}` for `D_raw`, `F = p`; `ℚ_p` for the two wrong readings. | Correct. |
| §5.2 sign witness | Kummer representation, `x₁ = v₁ − t^{−1}uv₀` | `g(x₁) = v₁ + cv₀ − t^{−1}uv₀ − cv₀ = x₁`; `Nx₁ = x₀`; `u = u_{ϖw} − ℓ_w` maps to `log([ϖ^♭]/ϖ) − log_K(w)`: image of `x₁` gains `+log_K(w)x₀`. | Agrees with `ι^{ϖw} = ι^ϖ exp(log_K(w)N_raw)`. |
| §5.4 (sampled) | Horizontal `e₁ + ue₀`; `r = 0` | `D = e₀ − e₀ = 0`. `r = 0`: `(B_st^+)^{N=0,φ=1} = ℚ_p` per component. | Checks sound; R01 for the statement. |
| §5.5 | `r = 0`; `𝔸¹`, `r = 1` | `Ω^{−1} = 0`, `H⁰ = ℚ_p^{π₀}`. `X₁X₂ = ϖ^{m+1}T·ϖ^{−m}T^{−1} = ϖ`; `H¹_HK = 0`; `H¹_proét = O/C`. | Matches Theorem 4.12, lines 1705–1717. |
| §6.3 (sampled) | `N` on `H^s` | `Nφ^f = qφ^fN`: `q^sN = q^{s+1}N`, `N = 0`. | Matches CDN-STEIN lines 2157–2158; GK05 `d ≥ 2` at line 1209, Theorem 6.3 at 1254. |
| §6.5 (sampled) | `r = 0`; `r = d + 1` | `ℚ_p`; `Sp_{d+1} = 0` and `Ω^d/ker d = 0`. | Matches Theorem 5.13, lines 2169–2179. |
| §6.7 sequence | `μ^i` under `1 − ξ^iφ^{−1}` | `φ^{−1}(μ) = μ/ξ`, so `ξ^iφ^{−1}(μ^i) = μ^i`: in the kernel. `y² = x³ + p`: Jacobian `(3x², 2y)` vanishes only at `p = 0`. | Correct. |
| §6.8 three-point relation | `0, 1, 2` | Residues `(1,−1,0) + (0,1,−1) − (1,0,−1) = (0,0,0)`. | Correct at every prime. |
| §6.10 | `d = 1`; `d = 2, i = 1`; duality | `H¹_c = π_∅ = St`, `H²_c = Λ(−1)`; `H³_c = π_{{1}}(−1)`; `r = d − i` gives `Sp_{{1..i}}`. Dat's `d!`, order `≤ d` (lines 1997–2003) become `(d+1)!`, `≤ d+1`. | Correct. |
| Layer 7 level dictionary | `q = 2` | `(q²−1)q² = 12`; `q²−1 = 3`; `q² = 4`; `12/4 = 3`. EndoscopicTransfer §12.4: "`Π_D`-level `nm`". | Correct. |
| §7.1 centre and Weil factor | `(3I₂, 3)`; `(ϖ, 1, Φ_geo)`, `n = 1` | `9·9^{−1} = 1`. `v(ϖ·rec(Φ_geo)) = 1 − 1 = 0`; §12.7: `v(det g) − v(Nrd b) = v(w)`: `1 − 0 = 1`. | Consistent with STR08 lines 381–390 and §12.7. |
| §7.1 sectors | `z` central, `φ ∈ Hom_Ǧ(ρ, Z)` | `(z_Gφ)(v) = z_Ǧ^{−1}φ(v) = φ(z^{−1}v) = ω_ρ(z)^{−1}φ(v)`. | Central character of `LL(M)^*`; correct. |
| §7.2 | Thickness `2`; level `0` | Vertices `2 → 3`, edges `1 → 2`, length `2 = 1 + 1`. Stabilizer of `(v,i)`: `gv = v`, `v(det g)` even: `GL₂(O_F)ϖ^ℤ`; two `G`-orbits by type plus copy. | Correct. |
| §7.3 (sampled) | `Ω ⊔ Ω`, `f = (0,1)` | `exp(f) = 0`, étale; not locally constant gives a non-étale class by constancy of bounded functions. | Matches CDN20 Proposition 2.12(i), lines 914–915. |
| §§7.4–7.5 (sampled) | Slope `3/2` twist | `φ²e = p³e`: `(B_cris^+)^{φ² = p^{−1}} = 0`; `H¹_HK[M′] = H¹_HK[M]` by restriction to the stabilizer of a component. | Slope hypothesis needed; matches CDN20 lines 246–261, 644, 654, 706–707. |
| §7.7 | Level `0`, `H⁰` | `π₀ = π₀(Spec(K ⊗_F F₂))`: `𝔽_p` for `K = F`, `𝔽_p²` for `K ⊇ F₂`. | Correct. |
| §7.8(c) control | `π = St` | `St_k` is a quotient of `Ind_B^G 1` by the trivial character, finitely presented and admissible; `St → Ŝt` nonzero. | Supercuspidality needed; correct. |

### Seeded source sample

All 15 targets were read at their locators in the cached texts.

| Target | Passage read | Result |
| --- | --- | --- |
| 0.3 | CDN-STEIN §§5.2.1–5.2.3, lines 1912–1948; GK14 lines 1300–1332, 1362–1364 | Indexing `Sp_r = Sp_{{1,…,d−r}}` at line 1916; line 1936 misdescribes the dual (README corrects it). |
| 0.5 | CDN-STEIN lines 2046–2061 | Cocycle and vanishing conditions, distributions, measures, degenerate kernel as stated. |
| 1.1 | CDN-STEIN lines 1420–1433 and 114–117; CDN-CURVES line 136 | Route and the open-disc control as stated. |
| 1.3 | CDN-CURVES lines 115–123, 170–172; CDN-STEIN lines 144–155, 2160–2167 | As stated. |
| 2.4 | CDN-CURVES lines 476, 2478–2488, 3117–3131, 3163–3168 | Statements (a)–(c) as in the source; R02 (definitions), R05 (locator). |
| 3.1 | CDN-CURVES lines 3283–3285, 3372–3379, 3394–3397 | As stated, `Γ_int` and `Σ(Y)` included. |
| 3.5 | CDN-CURVES lines 3826–3837, 115–134, 160–164 | As stated. |
| 4.2 | CDN-CURVES lines 230–249, 4292–4322 | As stated. |
| 4.3 | CDN-CURVES lines 403–425, 4316–4320, 4477–4481; CDN20 lines 194–198; CN-I lines 448–451 | As stated. |
| 4.8 | CDN-CURVES lines 4015–4059, 436–445 | As stated; Remarque 7.10(i) only suggests the good-reduction deduction, as the README says. |
| 5.4 | CDN-STEIN lines 205–222, 1057–1064, 1440–1454, 1525–1527 | Theorems as in the source; R01. |
| 6.3 | CDN-STEIN lines 2157–2158; GK05 lines 1207–1212, 1254–1259, 1275, 1291 | As stated, with the `d = 1` case supplied by the README. |
| 6.5 | CDN-STEIN lines 2160–2179, 120 | As stated. |
| 7.3 | CDN20 lines 912–930, 2123–2133 | As stated; the README adds the properness the proof of Remarque A.2 uses. |
| 7.5 | CDN20 lines 246–262, 640–665, 702–707, 142 | As stated, slope `1/2` kept. |

Beyond the sample: STR08 lines 337–390; CDN20 lines 96–107, 176–198, 2095–2122; CDN23 lines 181–197, 326–330, 1170–1176, 1200–1210; DAT06 lines 1997–2008, 2031–2033; CDN-CURVES lines 91–96, 586, 721–727, 2091–2096, 2193–2195, 3630–3631, 3656–3658, 3780–3781, 3960–3989, 4430–4437; CDN-STEIN lines 322–328, 682–691, 903–918, 1705–1717, 2196–2203. All agree with the README except where a finding or a source issue says otherwise.

### Lean, headlines and padding

`lake env lean` on `Suggested.lean`, run from the content checkout: exit 0, one warning, `124:8: declaration uses 'sorry'`. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, no `lemma`, no `#eval`.

`#check @name` on a scratch copy for all 8 declarations (`flagSubspace`, `parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`): each type equals its README statement; no binder lost; the headline keeps `Fact p.Prime`, `NontriviallyNormedField K`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional ℚ_[p] K`, `Field A`, `CharZero A ∨ CharP A p`. Nothing changed.

One-tactic probe on the only sorried theorem: `first | simp | rfl | infer_instance | exact (Representation.irreducible_iff_isSimpleModule_asModule _).2 inferInstance | exact Representation.IsIrreducible.mk | trivial` fails with the goal `(generalizedSteinberg K A d J).IsIrreducible` open. No padding. The two proved theorems are the proof terms the two later definitions take as arguments.

Headlines from the README summary: generalized Steinberg irreducibility (§0.4(a)) is stated; the curve diagrams and Kummer regulator (§§2.4, 3.5, 4.1, 4.2, 4.7), filtrations and Weil–Deligne similarity (§§2.5, 3.2, 4.3, 4.6), Jacobian period isomorphism (§§4.8–4.9), the semistable Stein diagram (§5.5), the half-space theorems (§§6.2, 6.4, 6.5, 6.9, 6.10) and the tower theorems (§§7.1, 7.2, 7.4, 7.5, 7.7, 7.8) are each named in the module docstring with the missing carrier. At the pins I found no rigid analytic curve, adic étale or pro-étale cohomology, Hyodo–Kato cohomology, `B_cris^+`, `B_st^+`, or Lubin–Tate or Drinfeld space, so none of them is statable.

Backticked names of this roadmap's own in the README: the eight declarations, all declared. `Semistable.aOmega` is AInfCohomology §AI.6.2's (found at its open head).

### Library declarations opened at the pin

| File and line | Declaration | Note |
| --- | --- | --- |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40` | `Module.Basis.flag` | Span of the first `k` basis vectors, `k : Fin (n+1)`; R04. |
| `Mathlib/LinearAlgebra/StdBasis.lean:120` | `Pi.basisFun` | Standard basis of `η → R`. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:121` | `Matrix.GeneralLinearGroup.toLin` | README says line 120, its docstring. |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | `Submodule.pointwiseDistribMulAction` | Needs `open scoped Pointwise`, present in the file. |
| `Mathlib/GroupTheory/Coset/Basic.lean:424` | `Subgroup.quotientMapOfLE` | |
| `Mathlib/Topology/LocallyConstant/Algebra.lean:327` | `LocallyConstant.comapₗ` | README says 326, its attribute line. |
| `Mathlib/Topology/LocallyConstant/Basic.lean:398` | `LocallyConstant.comap` | |
| `Mathlib/RepresentationTheory/Basic.lean:329` | `Representation.quotient` | Takes the invariance proof. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29`, `:32` | `Representation.IsIrreducible`, `irreducible_iff_isSimpleModule_asModule` | `IsSimpleOrder (Subrepresentation ρ)`; no smoothness condition. |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`; `Shift.lean:44` | `CochainComplex.mappingCone`, `shiftFunctor` | |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75` | `BDeRhamPlus` | |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112` | `WittVector.Isocrystal` | README says 113, its first field. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | `AlgebraicGeometry.Scheme.EllAdicCohomology` | Schemes only. |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean:101` | `TauCeti.simple_GL2Steinberg` | R06. |
| `TauCeti/Algebra/Quaternion/Steinberg.lean` | symbol relation | Unrelated, as the README says. |

The four line numbers that sit one line off point inside the same declaration block and need no change.

### Suppliers, ownership and overlap

Every cross-roadmap citation was resolved now: roadmaps on main in the content checkout, open ones with `roadmaps show` at their heads, and ModpRepresentationsOfGL2OverLocalFields and PadicLocalLanglandsForGL2QpPartII in the board's packages. All cited sections exist under the cited names:

- main: AdicEtaleGeometry A1; AdicSpacesPartIII F0, R3.4, R3.7; AdicSpacesPartIV F1.5–F1.9, F1.11; EnhancedDerivedSheaves E2 (Milnor sequences are in Layer E2, tower limits in Layer E2:towers); StableReduction Layers 1, 2, 7; JacobianChallenge Layer D; ReductiveGroupsPartII RG2.2.
- open heads: ClassicalAdicEtaleCohomology 1.3, 1.4, 4.1, 4.6, 4.7, Layer 8, 9.1, 9.6, 9.7; CrystallineCohomology CR.4.7 (item *Slope decomposition on the existing isocrystal carrier*), CR.5.1, CR.6.1, CR.6.5; AInfCohomology AI.1.2, AI.3.1, AI.3.2, AI.6.1–AI.6.3; PrismaticCohomologyPartIII 6.3, 6.25; LocallyAnalyticDistributions 0.0, 0.2, 0.CR.6.6 with its six named items; PadicPeriodRings 4.1, 4.3; VectorBundlesAndIsocrystals Layer 5 with its three named items; PadicDifferentialEquationsAndRigidCohomology RD.4.10, 4.11, 4.18, 4.29, 4.34, 4.38, 7.7; CohomologyComparisons 4.5, 4.9a, 4.11, 4.12; CstConjectureForDaggerVarieties 1.5; CohomologyComparisonsPartII 4.1–4.5; EndoscopicTransferAndUnitaryTraceComparison 12.2–12.8, 12.11–12.14, 12.19–12.21; HilbertModularVarietiesAndShimuraCurves R18.5.1–R18.5.3; TropicalAndBerkovichArithmetic 2.11, 2.13–2.17; AbelianSchemesAndArithmeticModuli A4.2, A4.CR.7.2 (item *Grothendieck–Messing deformation theory*); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20, 2.25, 2.26, 2.28; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2, SR.3 (item *steinberg*), SR.5.2 (item *segment-representations*); PadicHodgeTheory 5.3, 5.4, 8.1; GL2AutomorphicRepresentationsAndTransfer R16.3.1–R16.3.3; PadicLocalLanglandsForGL2Qp 6.9.
- board packages: ModpRepresentationsOfGL2OverLocalFields 0.3, 0.4, 0.5, 0.7, 2.4, 2.6.
- consumers (no *Needs* edge): ScholzeFunctorAndModpCohomologyOfTheLubinTateTower 0.2, 5.4, 6.2; PadicLocalLanglandsForGL2QpPartII 4.1, 4.9.

Statements read against the README's account of them: CohomologyComparisons §4.5 (sign and scaling), §4.12 (leaves the exact sequence to another owner); EndoscopicTransferAndUnitaryTraceComparison §§12.2, 12.4, 12.7; TropicalAndBerkovichArithmetic §§2.16–2.17; CohomologyComparisonsPartII §§4.1, 4.4 (`A(e,p,r)` and `Nr + c_p`); PadicPeriodRings §§4.1, 4.3 (built for `C_K`); CstConjectureForDaggerVarieties §1.5 (countable residue field). All agree.

The resolver's three leads: ModpRepresentationsOfGL2OverLocalFields §0.3 and PadicLocalLanglandsForGL2QpPartII §4.1 are board packages and resolve there; `Semistable.aOmega` is AInfCohomology's.

Declared gaps: `formal-syntomic-period-comparison`, `period-rings-general-C`, `endomorphism-characteristic-polynomials` have the same slug, supplier and `needs` in `design/plan.json` and under `## Exact supplier contracts`; each asks for something its supplier's cited section does not state at its head (log schemes only; `C_K` only; Frobenius only). Not raised.

Ownership: the names of `Suggested.lean` are in this roadmap's namespace; `steinbergRelations` also names declarations in KTheoryFiniteLocalFields and K2SymbolsBrauer, in their own namespaces and for a different object. No other roadmap on main, at an open head or in the board's packages defines `Sp_J(A)`; SmoothRepresentationsOfLocalGroups SR.3 has the complex Steinberg representation, cited in a Check. `overlaps.md` lists no second copy, no dropped id, no revision-only id and no other pull request changing this roadmap.

Overlap check: read CstConjectureForDaggerVarieties, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicHodgeTheory, CohomologyComparisons, CohomologyComparisonsPartII, AdicSpacesPartIV; the curve and Stein diagrams over a general `C` and with the `G_K`-action are owned here and the model-free dagger diagram by CstConjectureForDaggerVarieties §1.5; the tower components (§7.1) and finite copresentation (§7.7) are owned here and imported by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower; the proper-curve exact sequence is owned here, CohomologyComparisons §4.12 leaving it; nothing else shared.

Dependency check:

```text
depcheck: 206 roadmaps, 1918 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

### Shape and principles

Summary, scope, conventions, supplier contracts, reading guide, eight layers each ending with Examples and Dependencies (16 such headings), downstream consumers and references are present. 51 numbered subsections, 51 *Needs* lines, 51 Checks blocks; every section that defines an object has at least three Checks (§7.7, a theorem, has two). No layer is named after a source chapter and no sentence says the plan follows a source; the layer order is forced by the Dependencies lines (Layer 5 is independent of Layers 2–4, as stated). No pull-request number, date, round label, machine path, HTML anchor, LaTeX delimiter, `set_option` or algorithm in the roadmap text. No restriction to good primes: `p = 2` and general `F`, `K` are kept, with their genuine hypotheses.

## Not verifiable

- SS91 §§3–4, IS01 Theorem 4.5, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4, KM74 Theorem 2: settled as uncertified; read only through CDN-STEIN, GK05 and CDN23.
- Borel–Wallach, Chapter X, Theorem 4.11 (the characteristic-zero irreducibility): not in the manifest and not read; R08. I did not request it.
- CDN-DUKE: no passage reopened this round; §§6.7–6.9 rest on the earlier round's computed rows and my own recomputation of the sheaf sequence.
- Ownership against open pull requests was checked through the `roadmaps` tools at the heads of the index of 2026-11-13; LocallyAnalyticRepresentationsOfLocalGroups was read as the board package, which is its only copy.

## Source issues

- **Misprint** in CDN-CURVES at §1.2.1, printed p. 18, line 725: the source says the compactly supported differential lands in finitely supported functions on compact edges; it should land in those on all edges, as its cokernel requires; affects nothing.
- **Error** in CDN-CURVES at §8.2.5, printed p. 107, lines 4432 and 4437: the source says the group law scales the additive coordinate by `p` to the plus degree, against its own relation; it should use the minus degree; affects a stated result.
- **Error** in CDN-CURVES at §4.2.1, printed p. 51, line 2096: the source says the degree-zero syntomic group is `ℤ_p t` for every prime; it should restrict to odd `p`, the group containing `t/2` when `p = 2`; affects a stated result.
- **Misprint** in CDN-CURVES at Remarque 7.8, printed p. 97, line 4038: the source says principal units are divided by all nonzero constants; it should divide by the constant principal units; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p. 38, line 1936: the source says the dual of the Steinberg quotient is the inverse limit of duals of all finite-level functions; it should be the annihilator of the relations; affects a stated result.
- **Gap** in CDN20 at Remarque A.2, printed pp. 53–54, lines 2123–2133: the source says bounded functions on a connected semistable Stein curve are constant; it should assume proper special-fibre components, which its proof uses; affects a stated result.
- **Error** in DAT06 at proof of Lemme 4.2.1, printed p. 43, line 2033: the source says every homomorphism between profinite groups is continuous; it should argue continuity of the inertia action directly; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2e1b67d2fda97c9188c0a6d651074c1a4bef5a9a", "job": "REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~6", "model": "fable", "worker": "chris-x59"} -->
