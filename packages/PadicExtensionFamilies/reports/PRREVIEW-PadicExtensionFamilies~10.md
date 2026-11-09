# Review of PadicExtensionFamilies (pull request #1713 at 3d4e9eb)

**Verdict:** accepted

Incremental re-review of the 32 changed lines since `4e198bf` (README 1.1 *Needs* line, README 6.6). `Suggested.lean` and every file outside the folder are unchanged. Both findings of the previous review are repaired, the repairs introduce no new defect, the gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as the only warning. No findings.

## Previous findings

- R01 — repaired: `README.md:1823–1827` "Define the **packet** relation on the family by the hidden invariants alone: … isomorphic permutation representations …, the same `e` and the same `f`, and hiddenSwanSlopes K L_1 = hiddenSwanSlopes K L_2 (knowl `lf.packet`, its four conditions)"; Check 3 (`:1854–1857`) now separates the two fields by D₄/A₄ and residue degrees `2`/`3`.
- R02 — repaired: `README.md:552–554` "Mathlib `Polynomial.comp`, `Polynomial.comp_eq_sum_left` and `Polynomial.coeff_X_add_C_pow` (the binomial coefficients of `(X + C r)^h`, for the coefficient formula) and `Polynomial.natDegree_comp` (for the degree)." All three elaborate at the pin; `Polynomial.coeff_comp` no longer appears.

## Verified sound

### Gate, dependency check, elaboration, probe, binders

- **Gate**, my run on this head: `gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** (`--movable`, content main `01daf25`): `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The only roadmap supplier, RamificationOfCompleteDiscretelyValuedFields, is line 2 of the merge order, and this roadmap is line 396.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean` exits 0 with exactly 18 diagnostics, all `declaration uses sorry` (one per theorem, lines 113–569). There are no other warnings or errors. `git diff 4e198bf..HEAD` does not touch the file.
- **One-tactic probe.** On a scratch copy, each of the 18 `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | decide | (exact Iff.rfl) | (norm_num; done) | (aesop; done)`. The result is 18 errors, at exactly the 18 proof lines, so there is no padding. The 18 headlines are unchanged since the previous review: `conjugateBreaks_eq_of_irreducible`, `card_filter_conjugateBreaks_eq_zero`, `residualPolynomial_additive`, `discriminantExponent_eq_integral`, `slopePolygon_eq_of_embeddingOrbitCount_eq`, `one_add_card_filter_newtonSlopes_eq_relIndex`, `discriminantExponent_eq_sum_artinSlopeList`, `den_dvd_ordCompl_count_newtonSlopes`, `discriminantExponent_div_finrank_eq`, `indexOfInseparability_eq_of_eisenstein`, `miki_decomposition_exists_unique_levels`, `ore_realizability`, `krasner_refined_count`, `monge_class_count`, `mass_completeness`, `rootDiscr_le_galoisRootDiscriminant`, `galoisRootDiscriminant_eq_prod`, `galoisMeanSlopeAt_eq_zero_iff`. The 6.6 packet statements are covered by the docstring's "family theorems of Layer 6" paragraph and are not headlines.
- **Binder leads.** `signatures.md` counts 45 declarations, but one of them is a docstring fragment at line 34, so there are 44 real declarations. It flags seven defs: `wildRamificationExponent`, `ramificationPolynomial`, `conjugateBreaks`, `residualPolynomial`, `embeddingSubgroup`, `slopePolygon` and `indexOfInseparability`. I read each body (`Suggested.lean:71, 82, 105, 137, 171, 211, 327`). Each uses only the binders it keeps: `residualPolynomial` reads only `ramificationPolynomial φ α` and the residue of `𝒪[L]`; `embeddingSubgroup` is the fixing subgroup of the image of `L`; `indexOfInseparability` reads `φ`, `ringChar 𝓀[K]` and `natCastValuation L p`. The theorems about them carry the structures. The file is unchanged since the previous binder audit.

### The two repairs

- **1.1.** At the pin, `Polynomial.comp_eq_sum_left` is in `Mathlib/Algebra/Polynomial/Eval/Defs.lean:380` (`p.comp q = p.sum fun e a => C a * q ^ e`). `Polynomial.coeff_X_add_C_pow` is in `Coeff.lean:294` (`((X + C r)^n).coeff k = r^(n−k) * n.choose k`). `Polynomial.natDegree_comp` is in `Degree/Lemmas.lean:376` and needs `[NoZeroDivisors R]`, which holds because `L` is a field. Writing `C α * X + C α = C α * (X + C 1)` and applying the binomial lemma with `r = 1` gives exactly the README's `ρ_i = α^{−n} Σ_{h ≥ i} C(h, i) φ_h α^h`. Monicity is the neighbouring `Polynomial.leadingCoeff_comp` (`Degree/Lemmas.lean:392`): `1 · α^n · α^{−n} = 1`. All four names were checked by `#check` in a scratch file, and `Polynomial.coeff_comp` still fails there (`Unknown constant`).
- **6.6.** Knowl `lf.packet` (lines 90–109) gives four conditions for two members of a family to share a packet: the Galois groups of their closures are isomorphic as permutation groups, the closures have the same residue degree, the closures have the same ramification index, and the members have the same hidden slopes. The family is then partitioned into packets. The README's relation (`:1823–1828`) has exactly these four clauses and claims nothing more. In particular, the earlier claim that packets refine subfamilies is gone, and no other passage of the README or `Suggested.lean` relies on it (grep for `packet`, `subfamil`, `refin`). Knowl `lf.subfamily` (lines 90–95) defines the subfamily as the members whose residual-polynomial list lies in `𝒜`, which is `:1821–1822`. The new proof route (`:1829–1831`) is sound:
  - visible slopes are constant on the family (6.3, `:1603–1604`);
  - Galois slopes are the multiset sum of visible and hidden slopes (3.2);
  - `u = inertiaDegree K M`;
  - `t = e(M/K)/p^k`, where `k` is the number of Galois slopes (3.1);
  - the Galois mean slope follows from the slope content (3.3);
  - the top slope follows from `e(M/K)` and the Galois slopes (2.7).
- **Check 3 of 6.6.** I checked it against the LMFDB family page `2.1.4.6a`, which lists three fields:
  - `2.1.4.6a1.1`, `x⁴+2x³+2`: D₄ (4T3), content `[2,2]²`, hidden `[ ]`, residual polynomial `z³+1`, packet size `2`;
  - `2.1.4.6a1.2`, `x⁴+2x³+6`: the same data;
  - `2.1.4.6a2.1`, `x⁴+2x³+2x²+2`: A₄ (4T4), `[2,2]³`, hidden `[ ]`, residual polynomial `z³+z+1`, packet size `1`.

  The resolvent cubics confirm the groups independently (table below).

### Ownership, overlaps, citations

- The change adds no object. The overlaps tool reports no other open pull request changing this folder, no dropped ids either way, and no ids defined only by an open revision. The ownership audit of the previous review stands: no second owner of families, subfamilies or packets among the roadmaps on main or the open heads in vocabulary range (LocalFieldsRamification, MassFormula, RamificationOfCompleteDiscretelyValuedFields).
- The citations tool lists 20 "Lean names found nowhere". All of them are LMFDB knowl ids written in backticks (`lf.*`, `nf.galois_root_discriminant`), not Lean names. The new `lf.subfamily` is of the same kind and is listed among the references (`:2286`).

### Seeded sample

Of the 15 sampled targets, only 6.6 falls in the changed passages. I read it in full against knowls `lf.packet` and `lf.subfamily` and the LMFDB page `2.1.4.6a` (above). The other 14 targets (0.1, 1.2, 1.3, 1.5, 2.3, 2.5, 2.6, 3.2, 3.4, 4.2, 5.3, 6.2, 6.3, 6.7) are untouched since `4e198bf`. Their source checks are those of the previous review's source table and were not repeated. The README flags no locator as unverified.

### Remarks on untouched text (no change asked)

- The 6.6 *Needs* line (`:1832`, re-wrapped but with unchanged content) does not list 2.7 (`topSlope`) or 3.4 (the permutation representation), although the statement uses both. Both are earlier layers, so the build order is unaffected.
- The pinned Mathlib has no bundled isomorphism between actions of two different groups. The 6.6 phrase "Mathlib `MulAction` isomorphism" is realized as a group isomorphism `φ` together with a bijective `φ`-equivariant `MulActionHom` (`Mathlib/GroupTheory/GroupAction/Hom.lean:84`).

### Adversarial table: rows for the changed statements (values computed this round)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 1.1 coefficient route (`comp_eq_sum_left`, `coeff_X_add_C_pow`, `r = 1`) | `X²−2`, `α = √2` | `ρ_0 = (−2 + 0 + 2)/2 = 0`, `ρ_1 = C(2,1)·1·2/2 = 2`, `ρ_2 = C(2,2)·2/2 = 1`: `ρ = X² + 2X`, as the third 1.1 Check | pass |
| 1.1 degree and monicity (`natDegree_comp`, `leadingCoeff_comp`) | `X²−2`; `X+2` with `α = −2` | `2·1 = 2`, `1·α²·α^{−2} = 1`; `ρ = (−2X)/(−2) = X`, degree `1·1 = 1` | pass |
| 1.1 wrong model: `coeff_X_add_C_pow` with `r = α`, no factor `α^h` | `X²−2`, `q = X + C√2` | `φ(X+√2)/2 = X²/2 + √2·X`: not monic, `v_L(ρ_1) = 1 ≠ 2` | excluded by the stated `ρ_i` formula |
| 6.6 relation vs knowl | `lf.packet` lines 92–107; README `:1824–1827` | four clauses each: permutation group, `f(M)`, `e(M)`, hidden slopes | pass |
| 6.6 packets on `2.1.4.6a` | `a1.1`, `a1.2`: D₄, `(e,f)(M) = (4,2)`, hidden `[]`; `a2.1`: A₄, `(4,3)`, hidden `[]` | packets `{a1.1, a1.2}`, `{a2.1}`, sizes `2, 1` = LMFDB `packet_size` `2, 2, 1` | pass |
| 6.6 wrong model: hidden slopes only | same three fields | all hidden lists empty: one packet of size `3` ≠ LMFDB | excluded by Check 3 |
| 6.6 wrong model: hidden slopes and `e(M)` only | same | `e(M) = 4` for all three: one packet | excluded by the group and `f` clauses |
| 6.6 constancy route, D₄ packet | visible Artin `[2,2]`, hidden `[]`, `k = 2`, `e(M) = 4`, `f(M) = 2` | `t = 4/2² = 1`, `u = 2`: `[2,2]²` (LMFDB, both rows); mean slope `1 − 1/4 + (1/4 + 2/4) = 3/2` = integral `1·(3/4) + 1·(3/4)`; top slope `2` | pass |
| 6.6 constancy route, A₄ packet | `[2,2]`, `k = 2`, `(4,3)` | `t = 1`, `u = 3`: `[2,2]³` (LMFDB); mean slope `3/2`; top slope `2` | pass |
| 6.6 Check 3, D₄ | resolvent `y³ − 8y − 8 = (y+2)(y² − 2y − 4)`, roots `−2`, `1 ± √5`, `5 ≢ 1 mod 8` | one root in `ℚ_2` ⇒ `G ≤ D₄`; `e = 4` and `2 ∣ f` (`z²+z+1`) ⇒ `8 ∣ #G` ⇒ D₄, `(e,f) = (4,2)` | pass |
| 6.6 Check 3, A₄ | resolvent `y³ − 2y² − 8y + 8`; Newton points `(0,3),(1,3),(2,1),(3,0)`: all roots of valuation 1; `y = 2z`: `z³ − z² − 2z + 1 ≡ z³+z²+1` rootless on `𝔽_2` | irreducible ⇒ A₄ or S₄; S₄ forces `G_0 = A₄`, `f = 2`, contradicting `3 ∣ f` (`z³+z+1`) ⇒ A₄, `(e,f) = (4,3)` | pass |
| 6.6 Check 3, hidden lists | `e(M) = 4 = 2²`, `k = 2`, `w = 2` for both | hidden `= 2 − 2 = 0` slopes each | pass |
| 6.6 subfamily | `lf.subfamily` lines 94–95; residual classes `z³+1`, `z³+z+1` over `𝔽_2` | kernels of `z⁴+z`, `z⁴+z²+z` on `𝔽_2`: sizes `2`, `1`; `𝔽_2ˣ = {1}` ⇒ classes differ | pass |
| 6.6 Check 1 (unchanged) | `ℚ_2(i)`, `ℚ_2(√−5)` | `C_2`, `(2,1)`, hidden `[]` both ⇒ one packet of size `2` | pass |

### Adversarial table: rows carried forward from the previous review (`4e198bf`, statements untouched)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 0.1 `w`, `ε`, `ε ∣ q^f − 1` | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; `ℚ_5(∛5)` closure | `2 = 1 + 1`, `1 = 1·1`; `ε = 3 ∣ 24` | pass (r9) |
| 0.4 square class | `(1,√2)` → `8`, `(1,2√2)` → `32`; cyclic cubic | class `2` both; square | pass (r9) |
| 0.5 `#Aut ∣ n`, inseparable case | `𝔽_2(s,t) ⊂ K(a) ⊂ K(a,√(ta))` | `1 ∣ 4` | pass (r9) |
| 1.1 `v(ρ_1) = H` | `x²−2`; `x⁴−2`; `x⁴+2x²+2` | `2 = 3−2+1`; `8 = 11−4+1`; `6 = 9−4+1` | pass (r9) |
| 1.1 coefficient valuations | `x⁴+2x²+2` | `v(ρ_1) = min(8, ∞, 6, ∞) = 6`, `v(ρ_2) = min(4, ∞, 2) = 2` | pass (r9) |
| 1.2 rams | `x⁴−2`; `x⁸−2`; `x⁴+2x+2`; `x⁴+2x³+2` | `(2,4)`; `(2,4,8)`; `(1/3,1/3)`; heights `3,3,3,0` give `(1,1)` | pass (r9) |
| 1.3 additive exponents | `x⁴−2`; `x⁴+2x+2`; `x⁴+2x³+2`, `A = z³+1` | `2,4`, `1,2`; `1,4`; `1,2,4` | pass (r9) |
| 1.3 negative control | tame `x³−5`, `A = z²+3z+3` | `1 + 1 = 2` not a power of `5` | hypothesis `0 < h` present (r9) |
| 1.4 orbit and inertia | `α⁴ = 2` over `ℚ_4`; `z²+3z+3` over `𝔽_5`; `z³+1` over `𝔽_2` | `(z²+δ², δ²z+δ)`; `2`; `lcm(1,2) = 2` | pass (r9) |
| 1.5 `conjugateBreaks` | `ℚ_2(∜2)`, `ξ = ∜2` | `v_M(σα−α) = 6,10,6` → `{2,4,2}` | pass (r9) |
| 1.5 zero count | `ℚ_5(∛5)`; `ℚ_2(∜2)` | `2 = 3 − 5⁰`; `0 = 4 − 2²` | pass (r9) |
| 2.1 count on `(−1,0]` | `L^{ur}` of degree `f` | `[G : G_0 H] = f`, `[G : GH] = 1` | pass (r9) |
| 2.2 `artinSlopeList` | `ℚ_2(∜2)`, `D_4` | `[3,4]`; with `H = 1`: `[2,3,4]` | pass (r9) |
| 2.2 multiplicity | `F_{x⁴+2x+2}`, `L = M` | `log_2 4 = 2` copies of `4/3` | pass (r9) |
| 2.2 empty lists | unramified quadratic; `ℚ_5(∛5)` closure | `[]`, `[]` | pass (r9) |
| 2.3 integral | identity; unramified quadratic; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0`; `0`; `2`; `3·3 + 2·1 = 11` | pass (r9) |
| 2.4 segment | `ℚ_2(∜2)`, `(2,3)`, `(3,4)` | `P(2) = 3`; `P(4) = 11` | pass (r9) |
| 2.4 least height | `ℚ_2(ζ_8)` | slopes `2, 3`; the max would give `8/3` | pass (r9) |
| 2.5 count | `D_4`, slopes `{−4,−2,−2}` | `t=3`: `4`; `t=5`: `2`; `t=8`: `1` | pass (r9) |
| 2.5 negative control | `−t` for `−φ_{M/L}(t)`, `t = 3` | `2 ≠ 4` | excluded (r9) |
| 2.6 identities | `ℚ_2(ζ_8)`; `ℚ_2(∜2)`; `F_{x⁴+2x+2}` | means `⟨1/2,5/4⟩`, `⟨1,2⟩`, `⟨1/6,1/4⟩` | pass (r9) |
| 2.6 height identity | `[3,4]`; `[4/3,4/3]`; `[]` | `11`; `4`; `0` | pass (r9) |
| 2.6 wrong weight | `p^i` on `[3,4]` | `10 ≠ 11` | excluded (r9) |
| 2.6 denominator theorem | `x⁴+2x+2`; `x⁴−2`; `x⁴+2x³+2` | `3 ∣ 3`; `1`, `1`; `1 ∣ 3` | pass (r9) |
| 2.7 top slope | `ℚ_2(∜2)`; `ℚ_5(∛5)`; `ℚ_2(√5)`; `K/K` | `4`; `1`; `0`; `0` | pass (r9) |
| 3.1 `[M:K] = t u p^k` | `F_{x⁴+2x+2}`; `ℚ_3(∛3)` | `24 = 3·2·4`; `6 = 2·1·3` | pass (r9) |
| 3.3 weighted formula | `[2,3,4]`; `[]_3^2`; `[]^2`; `[5/2]_2`; `[4/3,4/3]_3^2` | `3`; `2/3`; `0`; `11/6`; `7/6` | pass (r9) |
| 3.4 `#Aut = [N_G(H) : H]` | `S_3`; `A_4`; biquadratic | `1`; `1`; `4` | pass (r9) |
| 3.5 negative control | `x³−7` at `7` | local `3`, global `6` | pass (r9) |
| 3.6 bounds | `(2,1,4,11)`; `(2,3,2,6)` | `11 = 4−1+8`; `3 ≤ 6 ≤ 9` | pass (r9) |
| 4.1 indices | `x⁴−2`; `x⁴+2x³+2`; `x⁴+2x+2`; `x³−5` | `8,4,0`; `3,3,0`; `1,1,0`; `[0]` | pass (r9) |
| 4.1 rams from indices | `x⁴+2x+2` | `r_1 = r_2 = 1/3` | pass (r9) |
| 5.1 Ore | `ℚ_2`, `n=2`; `n=1`; `𝔽_3((t))`, `n=3`, `j=1` | `j = 1, 2`; `j = 0`; admissible | pass (r9) |
| 5.3 `krasnerCount` | `ℚ_2`, `n=2`, `j=1,2`; `n=4`, `j=8` | `2`, `4`; `32` | pass (r9) |
| 5.4 totals | `ℚ_2`, `n=2,4`; `ℚ_3`, `n=3` | `6`; `92`; `21` | pass (r9) |
| 6.2 compatibility | `[2,3]`; `[1,5/2]`; `[1/3,1/3]`; `[1,1]`; `[1,2]` | all realized | pass (r9) |
| 6.2 rejections | `[1,3/2]`; `[2,2]` | rejected, matching Ore | pass (r9) |
| 6.4 points and ram counts | `[1]`, `[2]`, `[1,1]`, `[2,3]`, `[1/3,1/3]` | `(1,0,1,0)`, `(0,1,1,0)`, `(1,1,1,0)`; `k=1`: `0` | pass (r9) |
| 6.5 masses, Serre comparison | `[1]`, `[2]`, `[1,1]` over `ℚ_2`; `e = 2` | `1`, `2`, `2`; `1·2^{−1} + 2·2^{−2} = 1` | pass (r9) |
| 6.7 `mongeCount` | `ℚ_2 (2,1)`; `ℚ_4 (2,1)`; `(1,1)` | `6`; `14`; `1` | pass (r9) |
| 6.8 completeness | `ℚ_2`, `n=2`; quartic; `n=1` | `1`; `1`; `{K}`: `1` | pass (r9) |
| 7.1–7.3 | `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)`; `3.1.23.1` | `5^{1/2}`; `2^{11/4} < 8 < 16`; `5^{3/4}`; `23^{1/2}` | pass (r9) |
| `galoisMeanSlopeAt_eq_zero_iff` | `ℚ(√5)` at `5`, `2` | `1/2`; `0` | pass (r9) |

## Not verifiable

- Not re-read this round because the text citing them is untouched: Deligne, Appendix A.6 (no legal copy found earlier); Serre, *Local Fields* (paywalled); Krasner 1966, Ore 1928, Fried 1974 (not obtained); Serre 1978 (consumed through the pin). The published page numbers of Jones–Roberts 2007 were not compared with the author copy.

## Source issues

- none
