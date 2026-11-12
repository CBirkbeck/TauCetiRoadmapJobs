# Review of SchemeAndStackFoundations (pull request #1656 at 96ebbb5)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 123 README lines changed since `85395e0`; `Suggested.lean` is unchanged. The previous report's four findings are all repaired. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. One finding remains, R01: the sentence that the R02 repair rewrote in §4.15 states projectivity of the symplectic level cover for every level `m`, while the targets it rests on, and the fact itself, need `m≥3`. The repair is one clause.

## R01 (P2) — §4.15: the rewritten projectivity sentence omits `m≥3`

**Location.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7130–7136`: "The normalized symplectic compactification is projective over the cyclotomic base `ℤ[1/m, ζ_m]` … open and closed in the base change of `N_{g,n}(m)[1/m]`, projective by `level_structure_cover_projective` and `level_structure_cover_pointed` below".

**Claim.** For every level `m` (the paragraph introduces `m` at `:7124–7125` only as invertible), the normalized symplectic compactification is projective over `ℤ[1/m, ζ_m]`.

**Witness.** `(g,n) = (1,1)`, `m = 2`: `−1` fixes `E[2]` pointwise, so every point of the level-2 cover keeps the automorphism `−1`, and `N_{1,1}(2)[1/2]` is not an algebraic space. `:7149` and `:7260` state `m≥3`.

**Repair.** Begin the sentence "For `m≥3`, the normalized symplectic compactification is projective over the cyclotomic base `ℤ[1/m, ζ_m]`: …"; nothing else changes. Tested on the witness: `m = 2` is excluded, as is `m = 1` (where the cover is `M̄_{g,n}` itself). For `m = 3`, `(1,1)`: `level_structure_cover_projective` with `m' = 45` and `level_structure_cover_pointed` give `N_{1,1}(3)[1/3]` projective over `ℤ[1/3]`; `ℤ[1/3, ζ_3]` is étale over `ℤ[1/3]`; the Weil pairing of a full basis is a locally constant function with values in `μ_3`, so the bases with the standard pairing are open and closed in the base-changed cover, and the normalization in an open and closed part is open and closed in the normalization. The rest of the new argument is correct as written.

## Previous findings

- R01 — repaired: *Action.constantEquiv* is stated "for a finite group `Γ` and an `X` over `h_S` whose underlying presheaf is a Zariski sheaf", with both maps described and the coproduct counterexample added as a Check (`:3193–3204`, `:3224–3232`).
- R02 — repaired: "§3.3, p. 138", "§3.4, pp. 138–139", "pp. 139–141; Corollary 3.6, p. 141", "§3.7, p. 141", "last paragraph of Deligne §2, p. 136", "Lemme 1.6, p. 134", "pp. 133–134"; References "pp. 133–134; §2, p. 136; §§3.3–3.7, pp. 138–141". The rewritten projectivity sentence is R01 above.
- R03 — repaired: every listed name is in italics (`:2903–2904`, `:3005–3008`, `:3061`, `:3159`, `:3206–3210`, `:3805–3807`, `:5032`, `:5204`, `:7449`, `:7473`, `:8104`, `:8131`, `:8213–8214`, `:8224–8229`, `:8304`, `:8335–8340`); the Checks at `:3824`, `:8356`, `:8364`, `:8372` name no Lean counterpart.
- R04 — repaired: the `roadmap-summary` block no longer mentions quasi-compactness; the free text reads "The curve dichotomy retains main's statement: finite type is expressed by `LocallyOfFiniteType` together with `QuasiCompact`" and "The order is #1656 → #1808 → #1854".

## Verified sound

### Gate, dependency check, elaboration

- Gate rerun (`gate … --base origin/main`), exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's gate on this head also reports `build=0`.
- Dependency check (`--movable --pr 1656`), exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2134 edges, 0 problem(s)

- `lake env lean …/Suggested.lean`: exit 0, 48 warnings, all "declaration uses `sorry`", in 65 s.
- `git diff 85395e0 HEAD` touches only `README.md` (75 insertions, 48 deletions); `Suggested.lean` is byte-identical, so the previous report's `#check` audit (100 declarations, no lost binder), its one-tactic probe (all 48 fail) and its headline list stand. No file outside the folder is changed.
- The change adds no supplier citation and no `*Needs:*` roadmap edge. §1.13's `*Needs:*` gains Mathlib `Over.pullback`, `Presheaf.IsSheaf` and `Scheme.zariskiTopology`.

### Library declarations opened at the pins (new passage of §1.13)

- Mathlib `AlgebraicGeometry.Scheme.zariskiPrecoverage_le_fppfPrecoverage` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:45`); `Scheme.fppfTopology` (`:54`) is `fppfPrecoverage.toGrothendieck`, and `Scheme.zariskiTopology` (`Sites/BigZariski.lean:51`).
- Tau Ceti `Spaces.IsAlgebraicSpace` (`TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195`): its first field is `Presheaf.IsSheaf Scheme.fppfTopology F`, so every algebraic space is a Zariski sheaf, as the README says.
- Tau Ceti `ConstantGroup.groupScheme` (`TauCeti/Algebra/AlgebraicGroup/ConstantGroup/Basic.lean`, variables `(R) [CommRing R] (G) [Finite G]` at `:49`): defined over any commutative ring, for a finite group, which matches "a finite group `Γ` … over `Spec ℤ`".
- Mathlib `CategoryTheory.Over.pullback` (`Mathlib/CategoryTheory/Comma/Over/Pullback.lean:59`).

### Sources read at their locators

- Deligne 1985 (`deligne-1985`, printed page = footer before each page marker): Lemme 1.6 is stated on p. 133 (line 122) and its proof, with the `Isom` cover and the closure of its image, is on p. 134 (lines 137–146). The pointed genus-one paragraph is the last of §2, p. 136 (lines 229–233). 3.3 (full level structure `Pic⁰(X)_n ≅ (ℤ/n)^{2g}`, finite étale cover) and Définition 3.4 are on p. 138 (lines 288–295), with 3.4 continuing on p. 139; Proposition 3.5 is on p. 139 (line 325) and its proof ends on p. 141; Corollaire 3.6 and 3.7 are on p. 141 (lines 377, 382), and 3.7's last sentence is the projectivity attributed to Mumford (line 388). All eight changed locators agree.
- Seeded sample: of this round's fifteen targets only §2.19 has a changed line (`:5204`, italics only). Its locators were read in the Stacks book: §48.3 (0A9D), Lemma 48.3.1 (0A9E), Example 48.3.2 (0A9F), Lemmas 48.3.5 (0A9I), 48.3.6 (0A9Q), 48.3.10 (0B6I), Lemma 48.17.11 (0B6V), §37.62 (069E): all resolve with those numbers. The other fourteen (§0.6, §0.15, §0.23, §0.26, §1.1, §1.16, §1.23, §2.15, §2.17, §3.3, §3.5, §5.2, §5.8, §5.12) lie outside the diff and were not re-read. The README flags no locator as unverified.

### Ownership and overlaps

- The change introduces no new object. *Action.constantEquiv* stays a README-only API item of §1.13.
- Overlaps: #1808 and #1854 change this folder; the description and its `merge-order` block both give the order #1656 → #1808 → #1854. No cited id is dropped, none is defined only by an open revision, and this pull request drops none.

### Adversarial table

Rows for the changed statements first, with values computed this round; the rest are carried from the previous report.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §1.13 *Action.constantEquiv* (Zariski sheaf `X`) | `Γ = ℤ/2`, `X = h_{S ⊔ S}`, `ρ = swap`, `T = T_1 ⊔ T_σ`; `Γ = 1`; `T = ∅`; some `T_γ = ∅` | inverse: `a(φ,x)` restricts to `x` on `T_1` and `swap(x)` on `T_σ`, unique since `X(T) = X(T_1) × X(T_σ)`; forward of it is `ρ`. Trivial group: one action, one homomorphism. `X(∅)` is a point, so empty parts impose nothing | Pass; repaired |
| §1.13 forward map injective | two actions with equal `ρ`, `T = ⨿ T_γ` | `a(φ,x)` restricted to `T_γ` is `a(γ, x restricted) = ρ(γ)(x restricted)` for both; separatedness gives equality | Pass |
| §1.13 negative Check | `X = h_S ⊔ h_S` (presheaf coproduct), `S = Spec k`, `T = S ⊔ S`, `φ = (1, σ)` | along `j₁`: label `1`; along `j₂`: label `2`; labels are constant, contradiction. `X` over the fold map has 2 points against `2·2 = 4` pairs, so not a Zariski sheaf | Pass; the Check discriminates |
| §4.15 symplectic projectivity sentence | `m = 3`, `(1,1)`; `m = 2`, `(1,1)`; `m = 1` | `m = 3`: clopen in the base change of projective `N_{1,1}(3)[1/3]`, projective. `m = 2`: generic stabilizer `{±1}`, not an algebraic space. `m = 1`: the stack `M̄_{g,n}` | **Fail** (R01): add `m≥3` |
| §4.15 Deligne locators | eight page references | footers 133, 134, 136, 138, 139, 141 at the lines listed above | Pass; repaired |
| §4.15 level covers (other statements) | `m = 4`, `m′ = 60`; `3 = −ζ²(1−ζ)²`; `D(3) ∪ D(5)`; `(0,2)`; constant family | `Γ = GL_{2g}(𝔽₃) × GL_{2g}(𝔽₅)`; `(1−ζ)² = −3ζ`, so `−ζ²(−3ζ) = 3`; all of `Spec ℤ`, while `3, 9` miss `(3)`; `Aut ⊇ 𝔾_m`; rank `(2r−1)(g−1)` | Pass; carried from the report at 85395e0 |
| §0.1 Checks (direct images) | `⨿_{n≥0} Spec k → Spec k[t]`, char 0 and char `p`; `⨿_{n≥1} Spec k[t]/(tⁿ)`; `⨿ Spec k → Spec k`, `g = Spec k(s)` | `M_g → ∏_{g(n)≠0} k` bijective even when `{g(n)=0}` is infinite. `t^r·(1)` has coordinate `r+1` nonzero, so `M_t ≠ 0 = O(∅)`. `(sⁿ)` lies in no finite `k`-span of coordinates | Pass; carried from the report at 85395e0 |
| §0.28 comparisons | `ℙ¹`, two rational points; `𝔸² ∖ 0 → 𝔸²`, `I = (x,y)`; `I = ⊤, ⊥` | `Γ/ker = k` vs `k×k`. Extended quotient `k` vs section-kernel quotient `0` (`V(I) ×_Y X = ∅`): onto, not injective. Zero sheaf; `O_X` | Pass; carried from the report at 85395e0 |
| §0.29 Frobenius | `𝔽_{p²}`; `𝔸¹`; `𝔸¹ ⊔ 𝔸²`; `𝔽_p[ε]`; `∅` | `a ↦ a^p ≠ id`, square `id`. `A[t]⊗_{F}A ≅ A[t′]`, `t′ ↦ t^p`, rank `p`. Ranks `p`, `p²`. `ε ↦ 0`. Zero ring, identity | Pass; carried from the report at 85395e0 |
| §1.6 presentations | fold `U ⊔ U → U`; identity atlas; `Δ ⊔ Γ`, char ≠ 2 | quotient `h_U`; `R = X ×_X X = Δ`; `R` quasi-compact, so quasi-separated, and `j` not an immersion (02Z1) | Pass; carried from the report at 85395e0 |
| §1.12 `𝔸¹_ℚ/ℤ` | `T`-points; `𝔸¹ ×_X 𝔸¹` | `x + n = x` forces `n = 0` in `Γ(T,O) ⊇ ℚ`, so free; `⨿_{n∈ℤ} 𝔸¹` not quasi-compact, so not quasi-separated | Pass; carried from the report at 85395e0 |
| §1.13 `Action.IsFree`, `free_iff_mono` | left translation; `𝔾_m` on `𝔸¹` | `gx = x ⇒ g = 1`; `c·0 = 0` for `c ≠ 1`, not free; `(g,x) ↦ (gx,x)` injective iff free on every presheaf | Pass; carried from the report at 85395e0 |
| §1.22 pushforward | `j : 𝔸² ∖ 0 → 𝔸²`; `BZ/p` over `𝔽_p` | raw `j_*O(Spec k → 0) = O(∅) = 0` vs `k[x,y] ⊗ k = k`; flat tests agree (02KH). Invariants not exact, `H¹ = 𝔽_p` | Pass; carried from the report at 85395e0 |
| §1.24 crossed modules, semilinearity | `∂ = id`; `H̃ = 1`; `SL₂(ℂ) → PGL₂(ℂ)`; `S₃ → S₃` trivial action; `ℂ/ℝ` | one arrow per pair; discrete; coker 1, ker `μ₂` central; `∂(x)·y = y ≠ xyx⁻¹`; `id(i) = i ≠ −i` | Pass; carried from the report at 85395e0 |
| §2.5 Checks | Sierpiński, skyscraper `ℤ`; `ℙ^d`; discrete `ℕ`; fold `X ⊔ X → X` | `Γ(G⁰) = ℤ`; `H^d(O(−d−1)) = k`; `⊕ℤ → ∏ℤ` not onto; `Hom_{Over U}(j₁, j₂) = ∅` while `X.Etale` has `id`, so not full | Pass; carried from the report at 85395e0 |
| §2.10–2.11 Kummer, Artin–Schreier | `𝔽_p[t^{±1}]`, `μ_p`; `Spec ℝ`, `μ₂`; `n = 1`; `𝔽_p`, `ℤ/p` | `H¹_fppf = 𝔽_p^×·t^ℤ / p-th powers = ℤ/p`, `H¹_ét = 0` (reduced); `ℝ^×/ℝ^{×2} = ℤ/2` vs Zariski `0`; `μ₁ = 1`; `𝔽_p/℘(𝔽_p) = ℤ/p` | Pass; carried from the report at 85395e0 |
| §3.1 `isAffine_or_isProper`, `genus_baseChange` | `𝔸¹`; `ℙ¹`; doubled origin; `ℙ¹_L/k`; `y² = x^p − t` over `𝔽_p(t)` | affine, not proper; proper, not affine; excluded by separated; `H⁰ = L`, excluded; after `t^{1/p}`, `y² = (x−s)^p`: arithmetic genus `(p−1)/2`, normalization genus `0` | Pass; carried from the report at 85395e0 |
| §3.2 Riemann–Hurwitz, degree bounds | `z ↦ z²`; étale double cover of genus 2; `O(O)`, `O(2O)`, `O(3O)`; real conic | `−2 = 2(−2) + 2`; `g − 1 = 2`, so `g = 3`; `h⁰ = 1` vanishing at `O`; degree-2 map; plane cubic; `ω⁻¹ = O(1)|_X`, degree 2, `h⁰ = 3` | Pass; carried from the report at 85395e0 |
| §3.3 `vectorBundleDegree_pullback`, `genus_of_finite_etale` | `z ↦ z²`, `E = O(1)`; `[n]` on `E` | `2 = 2·1`; `0 = n²·0` | Pass; carried from the report at 85395e0 |
| §3.8 differentials | `𝔾_m`; elliptic `E`; `g = 0` | `dt/t` free; `dx/(2y + a₁x + a₃)`; `J = 0`, both `Γ(Ω¹) = 0` | Pass; carried from the report at 85395e0 |
| §4.12 flattening, Chow | `Bl₀𝔸² → 𝔸²` | flat over `𝔸² ∖ 0`; strict transform along `S′ = Bl₀𝔸²` is the diagonal `≅ S′`; Chow's `π` H-projective (0201) | Pass; carried from the report at 85395e0 |
| §5.11 `weil_bound` route | table (i)–(iv); `g = 0`; Hermitian curve over `𝔽_{q²}` | `Γ₀² = q(2−2g) − 2q − 2q + 2q = −2gq`, `Δ₀² = −2g`, `Γ₀·Δ₀ = N − q − 1`; `N = q + 1`; `q³ + 1 = q² + 1 + q(q−1)q` | Pass; carried from the report at 85395e0 |
| `exists_linear_normalization` | `n = 0`; `k[x]/(x²)`; `k[x,y]/(xy)`, `y₁ = x+y`; `𝔽₂[X,Y]/(XY(X+Y))` | `d = 0`, `A = k`; `d = 0`, dimension 2; `x² = (x+y)x` integral, `d = 1`; every linear form divides the relation, excluded by `Infinite k` | Pass; carried from the report at 85395e0 |
| `Ring.IsNagata/IsJapanese.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `k[[x,y]]`; `ℤ_p`; `ℤ` | complete, so Nagata; G-ring and J-2, so Nagata | Pass; carried from the report at 85395e0 |
| `smallEtaleBaseChange_isEquivalence` | `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ` | universal homeomorphism; homeomorphism but `Spec ℂ ×_ℝ Spec ℂ` has 2 points, so not universal and excluded | Pass; carried from the report at 85395e0 |
| `artinBootstrap`, `torsorRepresentability`, `Torsor.trivial_iff_section` | `a = 𝟙_U`; `P = G`; `Spec ℂ/ℝ` under `ℤ/2` | `F = U`; unit section; no `ℝ`-point, nontrivial | Pass; carried from the report at 85395e0 |
| `galois_descent_affine` | `A = 0`; `A = L`; `A = L ⊗ B₀` | `B = 0`; `B = k`; `B = B₀` | Pass; carried from the report at 85395e0 |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` | `∅`; `ℙ^d`, `p = d`; `ℙ¹`; `𝔸² ∖ 0` | `⊥ ≤ d`; `H^d ≠ 0` but `p > d` fails; `H¹(O(−2)) = k`; `H¹(O)` infinite-dimensional | Pass; carried from the report at 85395e0 |
| `artinSchreier_vanishing`, `brauer_functionField_curve_trivial` | `Spec 𝔽_p`; `k = ℝ`, `K = ℝ(t)` | `cd_p = 1`, `H² = 0`; `(−1,−1) ≠ 0`, excluded by `IsAlgClosed` | Pass; carried from the report at 85395e0 |
| Azumaya theorems | `M_n(R)`; `A = 0`, `R ≠ 0`; `R = 0` | rank `n²`; fibres rank 0 and `FaithfulSMul` both false; both sides vacuous | Pass; carried from the report at 85395e0 |
| `alteration_theorem`, `semistable_alteration_theorem` | `𝔸¹`, `Z = {0}`; `Spec k`, `Z = ⊤`; `ℤ_p[x,y]/(xy−p²)` | `ℙ¹`, `B = {0,∞}`; `B = ∅`, SNC vacuous; one blow-up, `uv = p` | Pass; carried from the report at 85395e0 |
| `CH_coprod`, `intersectionNumber`, `hodge_index` | `I = ∅`; `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)`; `D = 0` | zero cycles; `χ(O) − 2χ(O(−1,−1)) + χ(O(−2,−2)) = 1 − 0 + 1 = 2`, `D·H = 0`, `D² = −2`; equality and numerically trivial | Pass; carried from the report at 85395e0 |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `0 ≤ 0`; points `(0,0), (0,1), ∞`, `|3 − 3| = 0 ≤ 2√2` | Pass; carried from the report at 85395e0 |
| Not statable (Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR, `K_0 → G_0`) | pins, by object | no carrier at either pin (searched as above) | Pass; carried from the report at 85395e0 |

## Not verifiable

- `kempf-1978`, `hartshorne-1977` and `de-jong-1996`: the manifest records them as uncertified, so they are settled and were not requested. No changed passage alters a locator into them.

## Source issues

- none
