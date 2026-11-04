# Review of PadicExtensionFamilies (pull request #1713 at db1f941)

**Verdict:** needs changes

## R01 (P2) — The diagram ram count fails inside a run of equal rams

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:1542`, “the number of drawn points in `B_k` of index `≤ k` is `⌈r_k⌉`”, with the bands `B_k := {m_k ≤ h < s_k}` for every `1 ≤ k ≤ w` at line 1510.

**Claim:** For every index `k`, the points of the Eisenstein diagram lying in `B_k` with index at most `k` number `⌈r_k⌉`.

**Witness:** The worked-example row `F_{x⁴+2x+2}` over `ℚ_2` (line 1953) has rams `(1/3, 1/3)`, means `⟨1/6, 1/4⟩`, `e = 4`, `w = 2`. `B_1 = {1/6 ≤ h < 1/3}` contains the single point `σ = 1` (`h = 1/4`), whose index is `k(1) = 2 − v_2(gcd(1,4)) = 2`. So `B_1` has `0` points of index `≤ 1`, while `⌈r_1⌉ = 1`.

**Repair:** The points of index `≤ k` are the `σ` divisible by `p^{w−k}`, so the count is the number of integers in `[ε p^k m_k, ε p^k s_k)`, an interval of length `r_k`; it equals `⌈r_k⌉` exactly when the left end `ε p^k m_k = H(V_k/L^{ur})` is an integer, which §2.6 guarantees only for `k` final in its run (a vertex field). State the count for `k = w` or `s_k < s_{k+1}`, or state it as that integer count. Retest: `(1/3,1/3)` at `k = 2`: `[1, 4/3)` has `1` integer and `⌈1/3⌉ = 1`; `[2,3]` of `ℚ_2(∜2)`: `k = 1` gives `[2,4)`, two integers, `⌈2⌉ = 2`; `k = 2` gives `[8,12)`, four integers, `⌈4⌉ = 4`; `[1]` and `[2]` over `ℚ_2` give `[1,2)` and `[2,4)`, matching the Checks at lines 1583–1589. The companion count of C-points on or below the top edge of `B_k` was checked on the same five instances (`0, 0`; `2, 4`; `1`; `2`) and is `⌊r_k⌋` each time.

## R02 (P2) — Newton-polygon declarations are cited that the supplier never names

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:111`–113 (“`Polynomial.newtonSlopes`, `newtonSlopes_mul`, `newtonSlopes_X_sub_C`”, the module paths `TauCeti/NumberTheory/NewtonPolygon/{Basic,Slopes,Mul}.lean` and `TauCeti/Analysis/Convex/Sequence/`), repeated at lines 266–268, in the supplier table row (line 334) “Newton polygons (roadmap contract)” (`card_newtonSlopes`, `sum_newtonSlopes`, `slopeMultiset`) and in the §1.2 `*Needs:*` line (line 582).

**Claim:** NewtonPolygons supplies these six declarations in those modules.

**Witness:** `TauCetiRoadmap/NewtonPolygons/README.md` and `Suggested.lean` on main name `Polynomial.newtonPolygon` (§2.1, line 515), `lowerConvexEnvelope` (§0.1, line 85) and `ConvexPolygon.FiniteSlopeData` (§0.6, line 322) and no other slope declaration; `grep` for `newtonSlopes`, `slopeMultiset`, `card_newtonSlopes`, `sum_newtonSlopes` across both files returns nothing, and none exists at the Tau Ceti pin (the worker's citation scan lists the same three leads). The slope multiset, the product law and the root-valuation theorem are NewtonPolygons §§3.2–3.3 in prose, without Lean names.

**Repair:** Cite NewtonPolygons by section and by the names it gives: `Polynomial.newtonPolygon` (§2.1), `lowerConvexEnvelope` (§0.1), `ConvexPolygon.FiniteSlopeData` (§0.6), and in prose “the finite slope multiset and its product law (§3.2)”, “slopes are the negatives of nonzero root valuations (§3.3)”, “denominators divide the segment length (§6.1)”, “slope denominators divide the ramification index (§6.2)”. Delete the invented names and module paths; the same applies to the MassFormula paths `MassFormula/{Basic,Eisenstein/Basic,…}.lean`, `RootCount.lean`, `Tame/Quotient.lean` and `FiniteGalois.lean` at lines 115–119 (the MassFormula declaration names themselves are all in `TauCetiRoadmap/MassFormula/Suggested.lean`, lines 123–467, and may stay). Test: after the edit the citation scan should list no NewtonPolygons name, and `Polynomial.newtonPolygon ρ v_L` in §1.2 still resolves to NewtonPolygons §2.1.

## R03 (P3) — The source manifest is still absent

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/` contains `README.md`, `Suggested.lean`, `metadata.toml` only; the previous review's R07.

**Claim:** The cited works are recorded with their versions and verification status.

**Witness:** No `sources.toml` in the folder; no roadmap on main carries one either (`ls TauCetiRoadmap/*/sources.toml Completed/*/sources.toml` on main returns nothing), and the gate's `source-material` check passes.

**Repair:** If the project wants manifests, add one with one key per work (preprint and published version as one entry with both locators, the CAPTCHA'd knowls as `uncertified`); otherwise the References section as written, with its explicit version notes, is the record. Author's call.

## R04 (P3) — Two targets use `*Rests on:*` instead of `*Needs:*`

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:478` (§0.6) and line 1323 (§5.2).

**Claim:** Every target's prerequisites are on a `*Needs:*` line read by the dependency check.

**Witness:** The dependency check parses `*Needs:*` lines (and “X supplies”, `### From` headings); the two `*Rests on:*` lines cite Local fields and ramification Layer 2 and Mass formula Layers 2–3, both on main, so no order defect results today.

**Repair:** Rename both to `*Needs:*`.

## R05 (P3) — The principal-unit filtration is attributed to ClassFieldTheory Layers 6–7

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/README.md:284`, “ClassFieldTheory, Layers 6–7: local reciprocity and the principal-unit filtration”; §6.7 `*Needs:*` line 1761.

**Claim:** ClassFieldTheory Layers 6–7 supply the unit filtration used in Monge's count.

**Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md` Layers 6–7 (lines 1220–1432) mention units only through the Artin map and conductors; the filtration `unitFiltration K i` with its graded pieces is `Completed/LocalFieldsRamification/README.md` Layer 1 (line 281), which §4.2 of this roadmap already cites for it.

**Repair:** Cite Local fields and ramification Layer 1 for the filtration in the supplier list and in §6.7's `*Needs:*`, keeping ClassFieldTheory Layers 6–8 for reciprocity, existence, uniqueness and the degree–index equality.

## Verified sound

Both files were read in full at `db1f941`; the diff outside the folder is empty; `metadata.toml` is the pull request's own. The gate at this head passes every check (data in the worker's gate record). A direct `lake env lean` of `Suggested.lean` produced exactly 13 `declaration uses sorry` warnings, one per admitted theorem, and nothing else.

### Previous review's findings at this head

| Previous | Status at this head | Retest |
|---|---|---|
| R01 full versus reduced sets | Repaired: §6.4 defines the full-residue specialization set (line 1534) and, separately, Monge's reduced set with `𝓀[K_f]ˣ/(𝓀[K_f]ˣ)^e` and the cokernel sections (lines 1550–1560); §6.5 gives the full-residue fibre `(q^f−1)^δ q^{fγ}/#Aut` and, for the reduced set, `B(L/K_f)/#Aut` (lines 1631–1648). | Over the unramified quadratic base, `[1]`: full set `3·4 = 12`, six classes, fibre `4/2 = 2`; reduced fibre `gcd(2,3)·#ker(z²+z)/2 = 2/2 = 1`; `X²+2X+2`, `X²+2X+6` have discriminant ratio `5`, a square there. |
| R02 orbits of classes | Repaired: line 1486, “in bijection with the Frobenius orbit set of the individual `K_f`-isomorphism classes”. | `6` fixed classes plus `4` pairs give `10 = N_2(2,2)`, not `14`. |
| R03 tame top slope | Repaired: lines 2031–2034 split unramified (`0`) from tame with `e > 1` (`1`). | `ℚ_2(√5)`: `0`; `ℚ_5(∛5)`: `1`; `K/K`: `0`. |
| R04 ClassFieldTheory Layer 8 | Repaired: line 284 and the §6.7 `*Needs:*` cite Layer 8 for existence, uniqueness, the quotient isomorphism and the degree–index equality; `ClassFieldTheory/README.md:1433`–1480 owns exactly these (`localAbelianExistence`, `localClassField_unique`, `localAbelianGaloisEquiv`, `index_localNormSubgroup`). | `ℚ_3`: three index-two norm subgroups, one containing all units (unramified), two not. |
| R05 equal characteristic and `w = 0` | Repaired: Layer 6 standing hypotheses take `e_K := natValuation K p ∈ ℕ∞` (line 1413), §6.2 has the `e_K = ∞` clause and the `w = 0` clause, §6.4 the tame branch `X^ε + d_0 π` and the `e_K = ∞` existence route. | `𝔽_2((t))`, `X²+t^mX+t`: rams `1,3,5`, full sets `2,4,8`, masses `1,2,4`, contributions `1/2,1/4,1/8`; `[]_3` over `ℚ_5`: `gcd(3,4) = 1`, one polynomial `X³+5`, mass `1`. |
| R06 mass completeness headline | Repaired: `mass_completeness` (Lean 403–413) with `totallyRamifiedHeight` (389–398) and the docstring entry (line 18). | `n = 1`: `S = {⊥}` gives `1/(1·q⁰) = 1`; `S = ∅` gives `0`. Six dyadic quadratics: `2/4 + 4/8 = 1`. |
| R07 manifest | Not repaired. | R03 above. |
| R08 exact locators | Repaired: Monge §1.2 p.2, §2.1 Lemma 3 and Definition 1 p.6, Theorem 1 and §2.4 p.11; Pauli–Sinclair Proposition 3.10 pp.7–9, Proposition 3.11 pp.9–10, Lemma 5.7 p.19, Theorem 6.3(a) p.21; the tame Galois criterion by its pinned name and line. | All opened at the lines in the source table below. |
| R09 packet Checks | Repaired: lines 1696–1706 give an in-family negative pair (`X⁴−2` versus `X⁴−4X²+2`) and a residual-class pair (`X⁴+2X³+2` versus `X⁴+2X³+2X²+2`). | Both pairs recomputed in the table below. |

No repair report marked a finding “not actionable in this package”.

### Adversarial values

`H = c/f − e + 1`, `m = H/e`; Swan breaks have upper parameter `0` at tame inertia; `v_L` is normalized at a uniformizer of `L`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 tame/wild split | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; tame cubic over `ℚ_5` | `w`: `1+1 = 2`; `ε`: `1·1 = 1`; cubic `e = 3·5⁰` | pass |
| §0.3 height, mean, wild bound | `ℚ_2(i)`, `ℚ_2(√2)`, tame cubic, unramified quadratic | `(H,m) = (1,1/2),(2,1),(0,0),(0,0)`; `c = f(e−1+H)` gives `2,3,2,0`; `H ≤ v_L(e)` reads `1 ≤ 2`, `2 ≤ 2` (pinned `differentExponent_bounds_of_wild`, `Different/Wild.lean:90`) | pass |
| §0.4 square class | bases `(1,√2)`, `(1,2√2)` | discriminants `8`, `32`, ratio `4 = 2²`, same class `2` | pass |
| §0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `μ_3 ⊄ ℚ_5` (`3 ∤ 4`): not Galois, `#Aut = 1`; `μ_3 ⊂ ℚ_7` (`3 ∣ 6`): Galois, `#Aut = 3`; pinned statement at `TamelyRamified/Galois.lean:74` has exactly `IsTotallyRamified`, `IsTamelyRamified` hypotheses | pass |
| §0.6 orbit classification | quartic over `ℚ_2`, `f = 2` | `[ℚ_4ˣ : ℚ_4ˣ²] = 16`, `14` ramified classes; `6 + 2·4 = 14`, orbits `6 + 4 = 10`, total `48 + 10 + 1 = 59` | pass |
| §0.6 mass relation | orbit of size `f/#Stab` | `Σ_{orbit} 1/#Aut_{K_f} = (f/#Stab)/#Aut_{K_f} = f/#Aut_K` | pass |
| §1.1 coefficient formula | `X⁴−2`; `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `v_L(ρ_i)`: `(8,4,8,0)`; `(3,3,3,0)`; `(3,2,3,0)`; `v_L(ρ_1) = H` in all three (`8, 3, 3`) | pass |
| §1.2 rams, slope dictionary | `X⁴−2`; `X⁴−4X²+2` | second: `ρ = x⁴+4x³+(6−4α⁻²)x²+(4−8α⁻²)x`, heights `(8,4,8,0)`; both give rams `(2,4)`, Swan `[2,3]`, `c = 3+4·2 = 11` | pass |
| §1.2 denominator | `X⁴+2X+2` | face `(1,1)–(4,0)`, slope `−1/3`, `2^{0}(2²−1)/3 = 1 ∈ ℕ` | pass |
| §1.3 residual polynomials | `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | residues of `ρ_{j+1}α^{j−3}`: `(1,0,0,1)` → `z³+1`; `(1,1,0,1)` → `z³+z+1`; `xA(x)`: `x⁴+x`, `x⁴+x²+x`, kernels on `𝔽_2` of sizes `2`, `1` | pass; R09 pair separates |
| §1.3 additivity needs positive slope | tame cubic over `ℚ_5` | `A = z²+3z+3`, `zA(z) = z³+3z²+3z` not additive | pass |
| §1.4 scaling orbit | `α⁴ = 2` over the unramified quadratic base, `δ` of order `3` | `γ_1 = δ⁻⁴ = δ²`, `γ_2 = δ⁻⁸ = δ`; `(z²+1, z+1) ↦ (z²+δ², δ²z+δ)`; reversed recursion gives `x+δ⁻⁴`, monic | pass; Pauli–Sinclair Thm 4.8 base case is the rightmost segment |
| §1.5 unramified transport | `ℚ_2(ζ_3)`, uniformizers `2`, `2ζ_3` | raw `K`-embedding lists `{−1}`, `{0}`; over `L^{ur} = L` both empty | pass |
| §2.0 non-Galois Herbrand | `ℚ_2(∜2)`, `D_4` closure | `|G_t| = 8,8,4,4,2,2,2,2,1`; `φ_{M/K}(1,3,7) = 1,2,3`; `φ_{M/L}(3) = 2`, `φ_{M/L}(7) = 4` | pass |
| §2.1 orbit count | same; tame cubic `S_3`, `H = C_2` | `[G:G_tH] = 1,1,2,4` for `t ≤ 3, ≤ 3, 4–7, ≥ 8`; cubic: `1` at `0`, `3` for `u > 0` | pass |
| §2.2 breaks and `card = w` | `ℚ_2(∜2)`; `ℚ_2(ζ_8)`; tame cubic | jumps of `G^uH` at `u = 2, 3`; `[G:G^{0+}H] = fε = 1`, total `log_2(4/1) = 2 = w`; `ζ_8`: orders `4,2,1` at Artin `2,3`, multiplicities `1,1`; cubic: `0` positive breaks | pass |
| §2.3 integral | identity; unramified quadratic; tame cubic; `ℚ_2(∜2)` | integrands `0`; `0`; `2` on `(−1,0]`; `3` on `(−1,2]`, `2` on `(2,3]`: `c = 0, 0, 2, 11` | pass |
| §2.4 slope polygon | `ℚ_2(∜2)`; tame cubic; unramified quadratic | `(1,0),(2,3),(4,11)`: slopes `3,4`; `(1,0),(3,2)`: `1`; `(1,0),(2,0)`: `0` | pass |
| §2.5 non-normal sum formula | `σ = r²`, `σ = r` in `D_4` | `v_M(−2α) = 10 = i(r²)+i(r²s) = 8+2`; `v_M((i−1)α) = 6 = 4+2`; `Σ_{s∈H} min(m, i_H(s))`: `8+2 = 2(φ_{M/L}(7)+1)`, `4+2 = 2(φ_{M/L}(3)+1)`; rams `4, 2` with multiplicities `1, 2` | pass |
| §2.6 four identities | `ζ_8` | Swan `[1,2]` → `m = (1/2, 5/4)`, `r = (1, 3)`; `s_2 = (2·5/4 − 1/2)/1 = 2`; `r_2 = 4(5/4−1/2) = 3`; `c = 3 + 4·5/4 = 8` | pass; identical to knowl `lf.herbrand_invariant` lines 111–117 |
| §2.6 small and tiny rams | general | `r_k^* = (p−1)r_k/(εp^k) = m_k − m_{k−1}`; `s_k − m_k = (m_k−m_{k−1})/(p−1) = r_k/(εp^k)` | pass |
| §2.7 top slope | identity; `ℚ_2(√5)`; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0, 0, 1, 4` | pass |
| §3.1 slope content degrees | `D_4`, `S_4`, `S_3`, `[]^2` | `1·1·2³ = 8`, `3·2·2² = 24`, `2·1·3 = 6`, `1·2·1 = 2` | pass |
| §3.2 hidden slopes | `ℚ_2(∜2)`; `X⁴+2X²+2`; `ℚ_3(∛3)` | `[2,3,4]−[3,4] = [2]`; `[2,3,7/2]−[2,7/2] = [3]`; `[5/2]−[5/2] = []` | pass |
| §3.3 weighted formula versus Jones–Roberts (2) | `[2,3,4]`; `[4/3,4/3]_3^2`; `[]_3^2`; `[]^2` | `7/8+1/8+2/4+3/2 = 3`; `1−1/12+1/12+1/6 = 7/6`; `2/3`; `0`; the two formulas agree after `1 − (p−1)Σ_{j≤k} p^{−j} = p^{−k}` with `t` the tame degree | pass |
| §3.4 normalizer | `S_3, H = C_2`; `C_2², H = 1` | `[N(H):H] = 1`, `4` | pass |
| §3.5 splitting models | `x³−5` at `5`; `x³−7` at `7` | orders `(6,6)`; `(3,6)` since `ζ_3 ∈ ℚ_7` | pass |
| §4.1 indices | `X⁴−2`; `X²−2`; `X²+t^mX+t` over `𝔽_2((t))` | auxiliary `(∞,∞,0)` → `(8,4,0)`; `(∞,0)` → `(2,0)`; `(2m−1, 0)`, inseparable `X²+t` gives `(∞,0)`; `0·∞ = 0` in `ℕ∞` keeps `i_ν = 0` | pass |
| §4.2 Miki | `ℚ_2(√2)`, `a = −1` | `v(−2) = 2`, `1 ≤ 2 < 4 = e'p`, `l = 1`; `(1+√2)²(−3+2√2) = −1`, levels `1, 3`, weighted `2 < 3`; `−1` not a square there (Miki Lemma 17, `miki-1981 line 524`, condition (B) line 530) | pass |
| §4.2 jump sets | `p = 2, e = 2` | `ρ(1) = 2`, `ρ(2) = 4`, `T = {1,3}`, `e^* = 4 = ⌈pe/(p−1)⌉` (Pagano line 113); `A = {1,3}` ↔ `(I = {1,3}, β = (2,1))`, `ρ²(1) = 4 < ρ(3) = 5` | pass |
| §5.1 Ore | `ℚ_2, n = 4`; `n = 1`; `𝔽_2((t)), n = 2` | admissible `{1,3,5,6,7,8}` (`2`: `v(2) = 1 > 0`; `4`: `a = 1 ≠ 2`); `n = 1`: only `j = 0`; equal characteristic: `b = 0` needs `a = ∞`, impossible, odd `j` admissible | pass; equivalent to Pauli–Roblot Prop. 3.1 (`pauli-roblot line 113`) |
| §5.2 box depths | `ℚ_2, n = 2, j = 1, 2` | `ν_1 = 1` exact, measure `1/16`; `ν_1 = max(1, 2) = 2`, measure `1/16`; `ν_h` from `t_h ≥ j` with the `[h<b]` shift | pass |
| §5.3 Krasner closed form | `ℚ_2, n = 2`; `ℚ_3, n = 3`; `𝔽_2((t)), n = 2` | `2, 4`; `6, 6, 9`; `2^m` at height `2m−1`; the `⌊b/p^{a+1}⌋` of the README equals the source's `⌊(b−1)/p^{a+1}⌋` because `p^{a+1} ∤ b` under Ore (`pauli-roblot line 352`) | pass |
| `krasnerCount` (Lean) | `n = 1, j = 0`; general | `1·q⁰·1 = 1` (field `K`); exponent `(n+j−1) − Σν_h` in `ℤ` reproduces `n q^{n+j} μ(box)/(1−q^{−1})` | pass |
| §5.4 totals | `ℚ_2, n = 2`; `𝔽_2((t)), n = 2`; `𝔽_3((t)), n = 2` | `6`; `∞`; `2` | pass |
| §6.2 compatibility | `ℚ_2`, `e = 2`: rams `1,2,3`; `[2,3]` of `ℚ_2(∜2)`; `𝔽_2((t))` | `1 < 2` geometric, `2 = 2` arithmetic, `3` rejected; `r_1^* = 1 = e_K`, `r_2^* = 1 = e_K`: both bands arithmetic; `(2−1)(2m−1)` odd, no bound | pass |
| §6.3 relative to absolute | `e = f = 2` over `ℚ_2` | relative masses `3`, `4` → `6`, `8` classes; orbits `10` | pass |
| §6.4 point types | `[1]`, `[2]` over `ℚ_2`; `[2,3]`; `[1/3,1/3]` | `(α,β,γ,δ) = (1,0,1,0)`, `(0,1,1,0)`, `(0,3,2,0)`, `(1,0,0,0)` (i = 0 points have index `0`, so `P_2` of `[2]` is a C-point as the Check says) | pass |
| §6.4 full-residue count and fibre | same | sets of size `2, 4, 32, 1`; `[2]`: `X²+2`, `X²+10`, `X²+4X+2`, `X²+4X+10` are `ℚ_2(√−2), ℚ_2(√−10), ℚ_2(√2), ℚ_2(√10)`, each once (`2/2 = 1`); `[1]`: `ℚ_2(i)`, `ℚ_2(√−5)`, each once; `[2,3]`: `Σ fibres = 32` and `Σ 1/#Aut = 8` are consistent with Galois members of fibre `1` (`X⁴−4X²+2`) and `D_4` members of fibre `2` | pass |
| §6.4 ram count on the diagram | `[1/3,1/3]`, `k = 1` | points in `B_1 = [1/6,1/3)`: `σ = 1` only, index `2`; count `0`, `⌈r_1⌉ = 1` | **R01** |
| §6.4 C-point count | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]` | `1 = ⌊1⌋`; `2 = ⌊2⌋`; `k = 1`: `σ = 4, 8` → `2`; `k = 2`: `σ = 4, 8, 10, 12` → `4 = ⌊4⌋`; `0 = ⌊1/3⌋` | pass |
| §6.4 tame branch | `[]_2`, `[]_3` over `ℚ_5`; `ε = 1` | `K_f(ε√(uπ)) ≅ K_f(ε√(u'π))` iff `ū'/ū ∈ (𝓀ˣ)^ε` (unit `ε`-th roots lift by Hensel, `p ∤ ε`); classes `gcd(2,4) = 2`, `gcd(3,4) = 1`; `#Aut = gcd(ε, q^f−1)`, mass `1` | pass; Monge §2.4 p.11 |
| §6.5 reduced count and ambiguity | general; `[1]` over `ℚ_4` | `#ker(S_m)` is a `p`-power `≤ p^{ρ_j}` inside `𝔽_{q^f}`, so divides `gcd(p^{ρ_j}, q^f)`; `fB/#Aut(L/K) = (f/#Stab)·B/#Aut(L/K_f)`; `B/#Aut = 2/2 = 1` | pass |
| §6.5 Serre comparison | `ℚ_2, e = 2`; `𝔽_2((t))` | `1·2⁻¹ + 2·2⁻² = 1`; partial sums `1 − 2^{−M}` | pass |
| §6.6 packets | `X⁴−2` vs `X⁴−4X²+2`; `X⁴+2X³+2` vs `X⁴+2X³+2X²+2` | same rams, Swan, `c`; groups `D_4` vs `C_4` (real subfield of `ℚ_2(ζ_16)`), hidden `[2]` vs `[]`; residual classes `{z³+1}` vs `{z³+z+1}` under `𝔽_2ˣ = {1}` | pass |
| §6.7 Monge count | `(p,e,f) = (2,2,1)` over `ℚ_2`; `(2,1)` over `ℚ_4` | summands `1+3+2 = 6`; over the unramified quadratic base `3+7+4 = 14`, the relative count whose Frobenius orbits give `N_2(2,2) = 10`; Lean `mongeSigma`, `mongeDelta`, `mongeCount` transcribe (6), (7) and Theorem 1 (`monge-count lines 158–217`) with `N' = n_0 n(i) e' f'` and `h'' ∣ p^{f_0 f(i) f'} − 1` | pass |
| §6.8 completeness | `n = 1`; dyadic quadratics; `𝔽_3((t)), n = 2`; wild equal characteristic | `{⊥}`: `1`; `∅`: `0`; `2/4 + 4/8 = 1`, omissions `3/4`, `7/8`; `√t, √(2t)`: `1/2+1/2 = 1`; both sides false for finite `S` | pass |
| `totallyRamifiedHeight` (Lean) | member `E`; infinite `E` | `c + 1 − n ≥ 0` by the pinned lower bound, no truncation; junk `0` excluded by `hmem` | pass |
| `mass_completeness` quantifiers | `S` with two isomorphic members | `hpair` fails; without it the sum could be `2` with the left side true | hypothesis needed, present |
| §7.1–7.3 GRD | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)` | `1`; `√5`; closure degree `8`, discriminant `2²⁴`, `2³ = 8 > 2^{11/4}`; `5^{3/4}`; bound `gms_p ≤ 1 − 1/e_p + v_p(e_p)`: `3 ≤ 1 − 1/8 + 3`, `3/4 ≤ 3/4`; strictness needs nonempty support (`ℚ`: `1 = 1`) | pass; Jones–Roberts GRD (2.1)–(2.5), `jones-roberts-grd lines 121–165` |
| Boundary checks | `x²+4x+2`, `x²+2x+4`, `x²+x+2` | constant valuations `1, 2, 1`; linear `2, 1, 0`: Eisenstein, not, not | pass |

### Source sample

| Target | Text and locator opened | Comparison |
|---|---|---|
| 0.5 | `TauCeti/NumberTheory/LocalField/TamelyRamified/Galois.lean:74`, `IsTotallyRamified.isGalois_iff_exists_isPrimitiveRoot`, hypotheses `IsTotallyRamified`, `IsTamelyRamified`; line 57 the `e ∣ q−1` form | locator exact; hypotheses as stated |
| 1.3 | knowl `lf.residual_polynomials` (`0ddc53c9…` lines 99–124); Greve–Pauli author preprint (`85cbecb4…`) §3 via Lemma 3.1 cited at line 257; Pauli–Sinclair Lemma 4.7, Theorem 4.8, `e2b7cc3b…` lines 1078–1093 (p.14) | Ore's formula, the additivity claim and the `γ_δ` recursion agree |
| 1.5 | Greve–Pauli Proposition & Definition 4.3, `85cbecb4…` lines 227–272, pp.5–6; Lemma 4.1 line 211, Lemma 4.2 line 225 (p.5) | polygon and associated inertia are invariants of `L/K`; single-segment bound `m_1 ≤ pν(p)/(p−1)` |
| 2.3 | Serre IV §1 Prop. 4, IV §3: paywalled, cited by locator; pinned `differentExponent_eq_finsum_lowerRamificationGroup`, `differentExponent_tower` | computed on four instances above |
| 2.5 | Serre IV §1 Prop. 3: paywalled; Deligne A.6.2: not obtained; Greve–Pauli §8, `85cbecb4…` lines 738–756 (Galois case, `G_h > G_{h+1} = 1`) | sum formula recomputed on `D_4` |
| 2.6 | knowl `lf.herbrand_invariant`, `25b4bcac…` lines 108–136 (readable copy) | the four identities, `s_0 = r_0 = m_0 = 0`, and the mixed-characteristic compatibility conditions are exactly §2.6 and §6.2; the knowl is stated for `p`-adic fields, the equal-characteristic clause is this roadmap's |
| 2.7 | knowl `lf.top_slope`: CAPTCHA (three cached copies and a fresh fetch) | case split checked on four instances |
| 3.1 | knowl `lf.slope_content`, `c8f39611…` lines 90–109; `lf.slopes`, `7450f29f…` lines 90–113; Jones–Roberts database §3.5, `c985fee9…` lines 291–300 (p.7) | multiplicities `log_p[G^{(s)}:G^{(s+)}]`, tame and unramified degrees agree |
| 3.2 | knowl `lf.hidden_slopes`, `7ed4da22…` lines 90–98; `lf.visible_slopes`, `e3feb9d7…` lines 90–94; Jones–Roberts §3.6, lines 352–366 (p.8) | multiset subtraction agrees |
| 3.5 | knowl `lf.galois_splitting_model`: CAPTCHA; Jones–Roberts §3.5 | the two formulations checked on `x³−5`, `x³−7` |
| 4.2 | Miki Lemma 17, `538a3475…` lines 524–562 (pp.111–112), invariant lines 569–575 (p.112); Pagano §1.2, `cae0ccce…` lines 108–135 (pp.3–4), Theorems 1.4–1.5 lines 219–248 (p.6) | weights, condition (B), the non-`p`-th-power hypothesis, `e^*`, (C.1)–(C.2), the minimal-pair description and `μ_p(K) ≠ {1}` all match |
| 5.3 | Pauli–Roblot author preprint Theorem 6.1, `771e4d02…` lines 335–352 (p.7); Proposition 3.1 lines 113–117 (p.3) | formula and Ore's condition match; the general `K` formula of §5.3 is the roadmap's box integral, the source's closed form is over `ℚ_p` with `e = 1` |
| 6.2 | Monge family paper §1.2, `b5a37e10…` lines 84–90 (p.2): `e_F = +∞` in characteristic `p`; Greve–Pauli Lemma 4.2 | agree |
| 6.3 | knowl `lf.family_invariants`: CAPTCHA | constancy claims checked on `[1]`, `[2]`, `[2,3]` |
| 6.4 | Monge Lemma 3 lines 264–266, Definition 1 lines 285–301 (p.6), Theorem 1 lines 509–514, §2.4 lines 530–534 (p.11); Pauli–Sinclair Proposition 3.10 line 496 (p.7), Proposition 3.11 line 771 (pp.9–10), Lemma 5.7 line 1351 (p.19), Theorem 6.3 lines 1444–1453 (p.21); knowl `lf.eisenstein_diagram`: CAPTCHA | reduced set, `B_{L/K}`, `B/#Aut`, the tame `T^n + θπ_K` form and the coverage theorem agree; R01 concerns the diagram count only |
| 6.7 (R04) | Monge count Theorem 1 and (6)–(7), `67aac3fd…` lines 158–217 (pp.3–4) | matches `mongeCount` |

### Pins, suppliers and ownership

Every Tau Ceti declaration named in the supplier table and the `*Needs:*` lines was found at the pin by name (49 names; among them `AbsoluteRamificationIndex.lean:63,110`, `NatCastValuation.lean:96`, `FiniteExtension/IntermediateField.lean:71–128` with both `finiteIntermediateField_valuativeExtension` and `IntermediateField.valuativeExtension_of_isNonarchimedeanLocalField`, `Padic.lean:181` `not_isSquare_five`, `RamificationIndex.lean:103` whose definition uses only the valuation of the top field, which is why `conjugateBreaks` needs no valuation on `L`). Mathlib: `IsGalois.card_aut_eq_finrank` (`Galois/Basic.lean:107`), `Algebra.discr_of_matrix_vecMul` (`Discriminant.lean:106`), `Polynomial.Gal.restrict` (`PolynomialGaloisGroup.lean:117`), `IsKrasner.of_completeSpace_of_normal` (`Krasner.lean:73`), `rootDiscr_def` (`Discriminant/Basic.lean:80`), `conductor_mul_differentIdeal` (`Different.lean:637`), `pow_sub_one_dvd_differentIdeal` (`Different.lean:742`), `Multiset.le_iff_count`, `Subgroup.card_mul_index`, `AlgHom.fintype`, `IsEisensteinAt.irreducible` (`Eisenstein/Basic.lean:231`), `Nat.factorization_prod_pow_eq_self`. The only missing supplier names are R02's.

Cross-roadmap citations resolved on main: ClassFieldTheory Layers 6, 7, 8 (lines 1220, 1312, 1433); MassFormula Layers 0–4 (lines 214, 253, 280, 303, 350), its representative-set convention (line 84), Theorem 1, finiteness dichotomy, orbit count, Theorem 2 (lines 352–373), the Krasner exclusion (line 410), and all fourteen consumed names in `MassFormula/Suggested.lean`; NewtonPolygons §§0.1, 0.6, 2.1, 3.3, 6.1, 6.2 (lines 211, 320, 512, 667, 870, 892); NumberFieldArithmetic §§4.2, 5.1–5.3, 5.6, 5.10, 6.3, 6.5 (lines 1123–1873); LocalFieldsRamification Layers 0–4 (lines 72, 281, 576, 724, 1154) with the unit filtration at 281 and Hasse–Arf at 1022; PolynomialGaloisGroups `TransitiveGroupLabel` and the `nTj` model (lines 198–214); ClassicalArithmeticCompletion §§3.11, 3.33, 3.46 (lines 5592, 6296, 6674); LocalGaloisGroups exists. Deferral owners at their open heads: ArtinRepresentations (`rev/1711`, root number, lines 8–16) and FiniteGroupInvariants (`rev/1708`, inertia and automorphism group invariants, lines 159–163). Ownership greps over main and the 439 open heads for “ramification polygon”, “Herbrand invariant”, “indices of inseparability”, “jump set”, “hidden slope”, “slope content”, “Galois root discriminant” hit only this roadmap (one incidental “jump set” in AdmissiblePairsAndPadicHodgeStructures); “Krasner” hits elsewhere are Krasner's lemma. The board packages index lists no related package.

The dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line; the roadmap sits at line 370 of the merge order, after every supplier it names.

### Lean

`lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else. A scratch copy with `#check @` for all 39 declarations elaborated; the six binder-loss leads (`wildExponent`, `ramificationPolynomial`, `conjugateBreaks`, `residualPolynomial`, `embeddingSubgroup`, `indexOfInseparability`) drop only instances their bodies do not use, as the paragraph after Convention 12 says, and every admitted theorem carries its own `ValuativeExtension`, `IsGalois`, `Module.Finite`, `IsTotallyRamified` or `FinitePadicExtension` binders. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `exact le_rfl`, `exact Iff.rfl`) closed none of the 13 admissions. Headlines: the twelve statable ones are stated (root-difference invariance, wild additivity, discriminant integral, index invariance, Miki, Ore, Krasner, Monge, mass completeness, GRD monotonicity, product formula, support); the polygon-to-break, slope-polygon, slope-content, jump-set classification, generic-family and family-mass theorems are named in the docstring with the missing carriers. No padding, no `set_option`, no sorried data, imports as required.

## Not verifiable

- Fifteen LMFDB knowls (`lf.eisenstein_diagram`, `lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, `nf.galois_root_discriminant`): every cached copy is a nine-line CAPTCHA page; a fresh fetch of `lf.top_slope`, `lf.eisenstein_diagram` and `lf.family_invariants` through the sources service, with an explicit licence class, returned CAPTCHA pages again. `lf.herbrand_invariant`, `lf.slopes`, `lf.visible_slopes`, `lf.hidden_slopes`, `lf.slope_content`, `lf.galois_mean_slope`, `lf.residual_polynomials`, `lf.associated_inertia`, `lf.ramification_polygon`, `lf.indices_of_inseparability` were readable.
- Deligne, Appendix A.6 (Props. A.6.1–A.6.2): no legal copy in the cache or through the service; §§2.0, 2.2, 2.5 were checked by computation.
- Serre, *Local Fields* (IV §§1–3), Krasner 1966, Serre 1978, Ore 1928, Fried 1974: paywalled or not obtained; cited by locator.
- Jones–Roberts 2006 and Pagano 2022 were read in their arXiv versions, Heiermann in the MPIM preprint, as the README's version notes say; published numbering was not compared.

## Source issues

- **Misprint** in monge-family at §2.4, printed p.11: the source says the tame reduced polynomials use representatives of `K^×/(K^×)^n`; it should be the residue field `κ_K^×/(κ_K^×)^n`, as in Definition 1; affects nothing.
- **Error** in jones-roberts-database at §3.6, equation (2), printed p.8: the source says the tame term uses `t = |G/I|`; it should be the tame degree `|I/I_w|`; affects a stated result.
- **Error** in jones-roberts-database at §3.6, sentence after (2), printed p.8: the source says equality of root and Galois root discriminants holds exactly when there are no hidden slopes; it should be exactly when the closure is unramified over the field (`ℚ_3(∛3)` has no hidden slopes and `11/6 > 5/3`); affects a stated result.
