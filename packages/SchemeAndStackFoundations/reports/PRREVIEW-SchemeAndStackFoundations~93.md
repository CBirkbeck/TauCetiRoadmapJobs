# Review of SchemeAndStackFoundations (pull request #1656 at 7fb5df9)

**Verdict:** accepted

:robot: Independent AI review. This is an incremental re-review of the 4 README lines changed since `96ebbb5` (2 insertions, 2 deletions, all in §4.15). `Suggested.lean` is unchanged, and no file outside the folder is changed. The previous report's single finding is repaired, the repair introduces no new problem, the gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

This report has no findings.

## Previous findings

- R01 — repaired: `README.md:7130–7131` now reads "For `m≥3`, the normalized symplectic compactification is projective over the cyclotomic base `ℤ[1/m, ζ_m]`: that base is étale over `ℤ[1/m]`, so normalization commutes with the base change, …". Everything else in the paragraph is unchanged.

## Verified sound

### Gate, dependency check, elaboration

- Gate rerun (`gate … --base origin/main`), exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's gate on this head also reports `build=0` for the targeted build.
- Dependency check (`gate --depcheck … --movable --pr 1656`), exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2134 edges, 0 problem(s)

- `lake env lean …/Suggested.lean` from the worktree: exit 0 in 42 s, with 48 warnings. All 48 are "declaration uses `sorry`"; there are no other warnings and no errors.
- `git diff 96ebbb5 HEAD` touches only `README.md`. `Suggested.lean` has been byte-identical since `85395e0`, so the `#check` audit from that round (no lost binder), its one-tactic probe (all 48 sorried theorems fail) and its headline list still stand. `git diff --stat origin/main...HEAD` lists only the two files of this folder.
- The change adds no supplier citation, no `*Needs:*` edge, no backticked Lean name and no locator. It is a qualifier on one sentence.

### The changed sentence against its own section

- The sentence now relies on `level_structure_cover_projective` for an arbitrary single level. That target (`:7258–7260`) says "For an arbitrary single `m≥3`, also prove that `N_{g,n}(m)[1/m]` is a projective scheme over `ℤ[1/m]`". `level_structure_cover_pointed` (`:7281`) extends this to every `2g−2+n>0`. The representability target `level_structure_cover_representable` (`:7149`) is stated for `m≥3`. All three now use the same lower bound as the new sentence.
- Deligne 1985 (`deligne-1985`): §3.3 at line 288 (p. 138) describes the forgetful map as a finite étale cover for any `n ≥ 1`. Corollaire 3.6 (line 377, p. 141) requires `n` divisible by two coprime integers that are both ≥3. §3.7 (lines 382–388, p. 141) attributes projectivity to Mumford for those levels. So "records projectivity, due to Mumford, for the levels of his Corollary 3.6" (`:7135–7136`) is accurate. The single-level `m≥3` claim correctly rests on the roadmap's own targets and not on Deligne.
- The pull request description ("its projectivity claim for the symplectic level cover now rests on the roadmap's own projectivity targets rather than on §3.3") still matches the head.

### Seeded sample

- None of this round's fifteen sampled targets (§0.6, §0.23, §0.30, §1.2, §2.6, §2.7, §2.17, §3.1, §3.7, §4.3, §4.5, §4.6, §4.10, §4.11, §5.9) has a changed line, and none cites the changed sentence. Following the incremental brief, they were not re-read. The README flags no locator as unverified (`grep -i 'unverified\|not verified'`: 0 hits).

### Ownership and overlaps

- The change introduces no new object.
- From `overlaps.md`: open pull requests #1808 and #1854 also change this folder. The description and its `merge-order` block both give the order #1656 → #1808 → #1854. No cited id is dropped, no cited id is defined only by an open revision, and this pull request drops no id.

### Adversarial table

The row for the changed statement comes first, with values computed this round. The other rows are carried unchanged from the report at `96ebbb5`, which cites earlier reports where it carried them.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §4.15 symplectic projectivity, "For `m≥3`" (`:7130–7136`) | `m = 3`, `(1,1)`; `m = 4`, `(1,1)`; `m = 2`, `(1,1)` and `g = 2`; `m = 1`; `(0,3)` | `m = 3`: `Φ_3` has discriminant `−3`, a unit in `ℤ[1/3]`, so the base change is étale. There are `|GL₂(𝔽₃)| = 48` full bases, and the Weil-pairing value is `ζ` or `ζ²`, giving 2 clopen parts of degree `|SL₂(𝔽₃)| = 24`. `−1` acts as `−1 ≠ 1` on `E[3]`, so stabilizers are trivial; the part is clopen in a projective space, hence projective. `m = 4`: `x²+1` has discriminant `−4`, a unit in `ℤ[1/2]`; `96 = 2·48`. `m = 2`: `−1` (and the hyperelliptic involution in genus 2) fixes `J[2]` pointwise, so the cover is not an algebraic space; this case is now excluded. `m = 1`: the stack `M̄_{g,n}`, excluded. `(0,3)`: `Spec ℤ[1/m, ζ_m]` | Pass; repaired |
| §1.13 *Action.constantEquiv* (Zariski sheaf `X`) | `Γ = ℤ/2`, `X = h_{S ⊔ S}`, `ρ = swap`, `T = T_1 ⊔ T_σ`; `Γ = 1`; `T = ∅` | inverse restricts to `x` on `T_1` and `swap(x)` on `T_σ`, unique since `X(T) = X(T_1) × X(T_σ)`; trivial group gives one each; `X(∅)` is a point | Pass; carried from the report at 96ebbb5 |
| §1.13 forward map injective | two actions with equal `ρ`, `T = ⨿ T_γ` | restrictions to `T_γ` are `ρ(γ)(x restricted)` for both; separatedness gives equality | Pass; carried from the report at 96ebbb5 |
| §1.13 negative Check | presheaf coproduct `h_S ⊔ h_S`, `T = S ⊔ S`, `φ = (1, σ)` | labels `1` and `2` on the two parts contradict constancy; 2 points against `2·2 = 4` pairs, so not a Zariski sheaf | Pass; carried from the report at 96ebbb5 |
| §4.15 Deligne locators | eight page references | footers 133, 134, 136, 138, 139, 141 at lines 122, 137–146, 229–233, 288–295, 325, 377, 382, 388 | Pass; carried from the report at 96ebbb5 |
| §4.15 level covers (other statements) | `m = 4`, `m′ = 60`; `3 = −ζ²(1−ζ)²`; `D(3) ∪ D(5)`; `(0,2)`; constant family | `Γ = GL_{2g}(𝔽₃) × GL_{2g}(𝔽₅)`; `(1−ζ)² = −3ζ`, so `−ζ²(−3ζ) = 3`; all of `Spec ℤ`, while `3, 9` miss `(3)`; `Aut ⊇ 𝔾_m`; rank `(2r−1)(g−1)` | Pass; carried from the report at 96ebbb5 |
| §0.1 Checks (direct images) | `⨿_{n≥0} Spec k → Spec k[t]`; `⨿_{n≥1} Spec k[t]/(tⁿ)`; `⨿ Spec k → Spec k` | `M_g → ∏_{g(n)≠0} k` bijective; `t^r·(1)` has coordinate `r+1` nonzero, so `M_t ≠ 0`; `(sⁿ)` in no finite span | Pass; carried from the report at 96ebbb5 |
| §0.28 comparisons | `ℙ¹`, two rational points; `𝔸² ∖ 0 → 𝔸²`, `I = (x,y)`; `I = ⊤, ⊥` | `Γ/ker = k` vs `k×k`; quotient `k` vs `0`; zero sheaf; `O_X` | Pass; carried from the report at 96ebbb5 |
| §0.29 Frobenius | `𝔽_{p²}`; `𝔸¹`; `𝔸¹ ⊔ 𝔸²`; `𝔽_p[ε]`; `∅` | `a ↦ a^p ≠ id`, square `id`; rank `p`; ranks `p`, `p²`; `ε ↦ 0`; identity | Pass; carried from the report at 96ebbb5 |
| §1.6 presentations | fold `U ⊔ U → U`; identity atlas; `Δ ⊔ Γ`, char ≠ 2 | quotient `h_U`; `R = Δ`; `R` quasi-compact, `j` not an immersion (02Z1) | Pass; carried from the report at 96ebbb5 |
| §1.12 `𝔸¹_ℚ/ℤ` | `T`-points; `𝔸¹ ×_X 𝔸¹` | `x + n = x` forces `n = 0`; `⨿_{n∈ℤ} 𝔸¹` not quasi-compact | Pass; carried from the report at 96ebbb5 |
| §1.13 `Action.IsFree`, `free_iff_mono` | left translation; `𝔾_m` on `𝔸¹` | `gx = x ⇒ g = 1`; `c·0 = 0` for `c ≠ 1`, not free | Pass; carried from the report at 96ebbb5 |
| §1.22 pushforward | `j : 𝔸² ∖ 0 → 𝔸²`; `BZ/p` over `𝔽_p` | raw `0` vs `k`, flat tests agree (02KH); `H¹ = 𝔽_p` | Pass; carried from the report at 96ebbb5 |
| §1.24 crossed modules, semilinearity | `∂ = id`; `H̃ = 1`; `SL₂(ℂ) → PGL₂(ℂ)`; `S₃ → S₃` trivial action; `ℂ/ℝ` | one arrow per pair; discrete; ker `μ₂`; `y ≠ xyx⁻¹`; `i ≠ −i` | Pass; carried from the report at 96ebbb5 |
| §2.5 Checks | Sierpiński; `ℙ^d`; discrete `ℕ`; fold `X ⊔ X → X` | `Γ(G⁰) = ℤ`; `H^d(O(−d−1)) = k`; `⊕ℤ → ∏ℤ` not onto; `Hom(j₁, j₂) = ∅` | Pass; carried from the report at 96ebbb5 |
| §2.10–2.11 Kummer, Artin–Schreier | `𝔽_p[t^{±1}]`, `μ_p`; `Spec ℝ`, `μ₂`; `n = 1`; `𝔽_p`, `ℤ/p` | `H¹_fppf = ℤ/p`, `H¹_ét = 0`; `ℤ/2` vs `0`; `μ₁ = 1`; `ℤ/p` | Pass; carried from the report at 96ebbb5 |
| §3.1 `isAffine_or_isProper`, `genus_baseChange` | `𝔸¹`; `ℙ¹`; doubled origin; `ℙ¹_L/k`; `y² = x^p − t` | affine; proper; excluded; excluded; arithmetic genus `(p−1)/2`, normalization `0` | Pass; carried from the report at 96ebbb5 |
| §3.2 Riemann–Hurwitz, degree bounds | `z ↦ z²`; étale double cover of genus 2; `O(nO)`; real conic | `−2 = 2(−2) + 2`; `g = 3`; degree-2 map, plane cubic; `h⁰ = 3` | Pass; carried from the report at 96ebbb5 |
| §3.3 `vectorBundleDegree_pullback`, `genus_of_finite_etale` | `z ↦ z²`, `E = O(1)`; `[n]` on `E` | `2 = 2·1`; `0 = n²·0` | Pass; carried from the report at 96ebbb5 |
| §3.8 differentials | `𝔾_m`; elliptic `E`; `g = 0` | `dt/t`; `dx/(2y + a₁x + a₃)`; `Γ(Ω¹) = 0` | Pass; carried from the report at 96ebbb5 |
| §4.12 flattening, Chow | `Bl₀𝔸² → 𝔸²` | flat off `0`; strict transform `≅ S′`; `π` H-projective (0201) | Pass; carried from the report at 96ebbb5 |
| §5.11 `weil_bound` route | table (i)–(iv); `g = 0`; Hermitian curve | `Γ₀² = −2gq`, `Δ₀² = −2g`, `Γ₀·Δ₀ = N − q − 1`; `N = q + 1`; `q³ + 1` | Pass; carried from the report at 96ebbb5 |
| `exists_linear_normalization` | `n = 0`; `k[x]/(x²)`; `k[x,y]/(xy)`; `𝔽₂[X,Y]/(XY(X+Y))` | `d = 0`; `d = 0`; `d = 1`; excluded by `Infinite k` | Pass; carried from the report at 96ebbb5 |
| `Ring.IsNagata/IsJapanese.of_complete_local`, `IsQuasiExcellentRing.isNagata` | `k[[x,y]]`; `ℤ_p`; `ℤ` | complete, so Nagata; G-ring and J-2 | Pass; carried from the report at 96ebbb5 |
| `smallEtaleBaseChange_isEquivalence` | `Spec k → Spec k[ε]`; `Spec ℂ → Spec ℝ` | universal homeomorphism; fibre product has 2 points, excluded | Pass; carried from the report at 96ebbb5 |
| `artinBootstrap`, `torsorRepresentability`, `Torsor.trivial_iff_section` | `a = 𝟙_U`; `P = G`; `Spec ℂ/ℝ` | `F = U`; unit section; nontrivial | Pass; carried from the report at 96ebbb5 |
| `galois_descent_affine` | `A = 0`; `A = L`; `A = L ⊗ B₀` | `B = 0`; `B = k`; `B = B₀` | Pass; carried from the report at 96ebbb5 |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` | `∅`; `ℙ^d`; `ℙ¹`; `𝔸² ∖ 0` | `⊥ ≤ d`; `p > d` fails; `H¹(O(−2)) = k`; infinite-dimensional `H¹` | Pass; carried from the report at 96ebbb5 |
| `artinSchreier_vanishing`, `brauer_functionField_curve_trivial` | `Spec 𝔽_p`; `ℝ(t)` | `cd_p = 1`; `(−1,−1) ≠ 0`, excluded by `IsAlgClosed` | Pass; carried from the report at 96ebbb5 |
| Azumaya theorems | `M_n(R)`; `A = 0`; `R = 0` | rank `n²`; both sides false; vacuous | Pass; carried from the report at 96ebbb5 |
| `alteration_theorem`, `semistable_alteration_theorem` | `𝔸¹`, `Z = {0}`; `Spec k`; `ℤ_p[x,y]/(xy−p²)` | `ℙ¹`, `B = {0,∞}`; `B = ∅`; `uv = p` | Pass; carried from the report at 96ebbb5 |
| `CH_coprod`, `intersectionNumber`, `hodge_index` | `I = ∅`; `ℙ¹×ℙ¹`, `D = (1,−1)`; `D = 0` | zero cycles; `1 − 0 + 1 = 2`, `D·H = 0`, `D² = −2`; equality | Pass; carried from the report at 96ebbb5 |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `0 ≤ 0`; `|3 − 3| = 0 ≤ 2√2` | Pass; carried from the report at 96ebbb5 |
| Not statable (Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR, `K_0 → G_0`) | pins, by object | no carrier at either pin | Pass; carried from the report at 96ebbb5 |

## Not verifiable

- `kempf-1978`, `hartshorne-1977` and `de-jong-1996`: the manifest records them as uncertified, so they are settled and were not requested. No changed passage cites them.

## Source issues

- none
