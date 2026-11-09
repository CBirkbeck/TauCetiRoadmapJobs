# Review of HalfIntegralWeightModularForms (pull request #1721 at a6d185b)

**Verdict:** accepted

This is an incremental re-review of the **92 changed lines since a1c52cf**, all in `TauCetiRoadmap/HalfIntegralWeightModularForms/README.md`: the Mathlib eta bullet (87–88, 321–331), the Tau Ceti theta-series contract (116–117, 354–397) and the Kronecker passages of §5.3 (1455–1456, 1466–1475). `Suggested.lean` is unchanged. The gate passes, the dependency check is clean, and both previous findings are repaired. No finding remains.

## Previous findings

- R01 — repaired: README 354 now opens “The theta-series roadmap's objects that this roadmap consumes, under their Tau Ceti names”, 116–117 says “The Tau Ceti declarations that formalize part of this material are listed under *From Tau Ceti*”, and 1469–1475 states that `kroneckerSymNat` is `TauCeti.kroneckerSym D d` for `d ≥ 1`, with the agreement a target and the `d = 0` junk value recorded. “Tau Ceti main”, “landed” and “only so that the headline elaborates at the pins” are gone (a grep of the README for “landed”, “Tau Ceti main”, “on main”, “at the pins” finds nothing). The branch is not rebased (its manifest still pins Tau Ceti `358314d`, Mathlib `f6090c7`; the merge base with main is `c994070`), but the pull request leaves `lake-manifest.json` untouched, so the merge installs main's pins (`2fd255d`, `1b1ccf4`), where every cited name exists (table below). A manifest change would be an edit outside the folder, so the folder-level repair is the right one; `kroneckerSymNat` stays as the one simple definition the Kohnen headline needs to elaborate at the branch pin, and the README names the pinned symbol it must agree with. A scratch copy of the unchanged `Suggested.lean` (a single `import Mathlib`, no `TauCeti.*` import) was also elaborated with `lake env lean` against main's pins (Mathlib `1b1ccf4`, Lean v4.36.0-rc2): exit 0, the same 17 `declaration uses sorry` warnings, no error. So the file builds on both sides of the merge.
- R02 — repaired: README 356–376 adds `ZLattice.IsEven`, `ZLattice.IsIntegral` (`Integral.lean`), `ZLattice.level` (`Level.lean`), `ZLattice.det` (`Determinant.lean`), `ZLattice.gaussSum` (`GaussSum.lean`), `ZLattice.thetaSeries_smul` (`Functoriality.lean`), `ZLattice.thetaSeries_span_one` and `…_sqrt_two_smul_span_one` (`RankOne.lean`), `ZLattice.IsEven.hasSum_thetaCoset_qParam` (`QExpansion.lean`), and 386–394 replaces the closing sentence by the three even-rank laws with their files and the `finrank ℝ E = 2 * k` hypothesis. The map goes beyond the repair (dual, orthSum with its three laws, scaling), and each addition is correct at the pin (below).

## Verified sound

**Scope, gate, elaboration.**

- The diff since a1c52cf touches only the README (62+/30−); the pull request's diff outside the folder is empty; the worktree is clean at a6d185b.
- The gate rerun with `--build` and the candidate order:

```text
gate HalfIntegralWeightModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

- The dependency check (`--movable`, candidate order, content main): no UPWARD, CYCLE or moved line.

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

- `lake env lean` on `Suggested.lean` from the worktree (branch pin): exit 0, **17 warnings, all `declaration uses sorry`**, no errors. The file is unchanged since r4, so r4's `#check @name` pass (42 declarations, no lost binder; the supplied signatures file again reports 0) and its one-tactic probe (17 admissions, none closed by `rfl`, `simp` or `infer_instance`) stand. Headline coverage is as in r4: the statable headlines are stated, the others are named in the module docstring.

**Library declarations opened at Tau Ceti `2fd255d` (the pin main's manifest installs): 33, each with its namespace confirmed from the file's `namespace` lines.**

| README citation (line) | At `2fd255d` | Agrees with the README's description |
|---|---|---|
| `ZLattice.IsEven`, `ZLattice.IsIntegral` (356) | `Integral.lean:75`, `:124` (`L ≤ dual L`) | yes; ThetaSeries `Suggested.lean:219`, `:213` have the same bodies |
| `ZLattice.dual`, `L^∨` (357) | `Dual.lean:78` (`BilinForm.dualSubmodule (innerₗ E) L`), notation `:81` | same body as ThetaSeries `:82` |
| `ZLattice.level` (357–358) | `Level.lean:113`: `sInf {N > 0 ∣ ∀ x ∈ L^∨, ∃ m, N‖x‖² = 2m}` | ThetaSeries `:290` has `N‖x‖²/2 = m`; equivalent |
| `ZLattice.det`, `ZLattice.DiscriminantGroup` (358–359) | `Determinant.lean:158` (`covolume²`), `:90` (`L^∨ ⧸ L.submoduleOf L^∨`) | ThetaSeries `:353`, `:233` |
| `ZLattice.representationNumber`, `cosetRepresentationNumber` (359–360) | `Shell.lean:97`, `:108` | as in r5 |
| `ZLattice.gaussSum` “with a finiteness instance on `L/cL` in place of `NeZero c`” (361–362) | `GaussSum.lean:176`: `(hL : IsEven L) (a : ℤ) (c : ℕ) [Fintype (L ⧸ ((c:ℝ) • L).submoduleOf L)]`, sum of `gaussTerm L hL a c 0` | ThetaSeries `:926`: `(h : IsEven L) (a) (c) [NeZero c]`, sum over `L ⧸ cSub L c`; the clause is exact |
| `ZLattice.IsIntegral.isEven_sqrt_smul` is `isEven_scale_sqrt_of_even`, `scale L c = c • L` (362–363) | `Scaling.lean:174`: `IsIntegral L → Even m → IsEven (√m • L)` | ThetaSeries `:267`: `IsIntegral L → Even m → IsEven (scale L √m)`, `scale` at `:236` is `L.map (lsmul ℝ E c)`, the pointwise `c • L` |
| `ZLattice.orthSum` (364) | `OrthSum.lean:83`: `(L.prod M).comap (WithLp.linearEquiv 2 ℤ (E × F))` | identical to ThetaSeries `:384` |
| `ZLattice.isEven_orthSum_iff`, `det_orthSum`, `level_orthSum` = lcm (364–366) | `OrthSum.lean:212`, `:371` (`det (L ⊕ M) = det L * det M`), `Level.lean:170`: `level (orthSum L M) = (level L).lcm (level M)` | yes |
| `ZLattice.thetaSeries`, `thetaCoset`, `thetaCoset_add_mem`, `thetaCosetClass` (367–370) | `Basic.lean:102`, `:108`, `:132`; `DiscriminantGroup.lean:56` | as in r5 |
| `ZLattice.IsEven.hasSum_thetaSeries_qParam`, `qExpansion_thetaSeries_coeff` (370–371) | `QExpansion.lean:143`, `:152`, inside `namespace IsEven` (139) | as in r5 |
| `ZLattice.IsEven.hasSum_thetaCoset_qParam` “for every positive `N` with `N‖γ‖²/2 ∈ ℤ`, which holds at `N = level L` for `γ ∈ L^∨`” (371–374) | `QExpansion.lean:207`: `(hL : IsEven L) (hγ : γ ∈ dual L) (hN : 0 < N) (hNγ : ∃ n : ℤ, N * ‖γ‖² = 2n)`; `Level.lean:120` `exists_level_mul_norm_sq_eq` gives the instance at `N = level L` | ThetaSeries `:698` is the `N = level L` case; contained |
| `ZLattice.thetaSeries_smul` for `c ≠ 0` contains `thetaSeries_scale` for `c > 0` (374–375) | `Functoriality.lean:74`: `thetaSeries (c • L) τ = thetaSeries L (⟨c², _⟩ • τ)` for `c ≠ 0` | ThetaSeries `:708` for `0 < c`; contained |
| `ZLattice.thetaSeries_span_one` is `thetaSeries_int`; `…_sqrt_two_smul_span_one` gives `Θ_{√2ℤ}(z) = jacobiTheta(2z) = θ(z)` (375–377) | `RankOne.lean:37`: `= jacobiTheta τ`; `:45`: `thetaSeries (√2 • span ℤ {1}) τ = jacobiTheta (2τ)` | ThetaSeries `:728`; with README 321 (`jacobiTheta τ = θ(τ/2)`) the chain is right |
| `TauCeti.kroneckerSym`, `TauCeti.kroneckerChar` “takes its coefficient ring as an argument” (379–381) | `KroneckerSymbol.lean:84`; `:376` with `variable (R : Type*) [CommRing R]` at `:361` explicit (`kroneckerChar R D hD hD₀ a` at `:403`) | yes |
| `TauCeti.tendsto_jacobiTheta_comap_im_atTop`, `TauCeti.jacobiTheta_I_mul`, `TauCeti.sum_range_cexp_two_pi_I_sq_div` (381–385) | `JacobiTheta/OneVariable.lean:129`, `:75`; `JacobiTheta/GaussSum.lean:227` | as in r5 |
| `ZLattice.IsIntegral.thetaCoset_S_smul` “for integral `L`” (386–387) | `Inversion.lean:159`: `(hL : IsIntegral L) [Fintype (DiscriminantGroup L)] (hk : finrank ℝ E = 2 * k) (γ : dual L)` | yes |
| `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul`: `c > 0`, `level L ∣ c`, `Θ_L ∣[k] A = (−i)^k c^{−k} (covol L)⁻¹ G_L(a, c) Θ_L` (388–391) | `CosetSplitting.lean:140`, inside `namespace ZLattice … namespace IsEven` (52, 58): `(hk : finrank ℝ E = 2 * k) (A : SL(2, ℤ)) {c : ℕ} [NeZero c] [Fintype …] (hc : A 1 0 = c) (hN : level L ∣ c)`, conclusion `((-I)^k * ((c:ℂ)^k)⁻¹ * (covolume L)⁻¹ * gaussSum L hL (A 0 0) c) • thetaSeries L` | exact |
| `ZLattice.IsEven.isBoundedAtImInfty_thetaSeries_slash`, `…thetaCoset_slash` for `γ ∈ L^∨`, every `A ∈ SL(2, ℤ)` (391–394) | `BoundedAtCusp.lean:93`, `:53`, `namespace ZLattice.IsEven` (45), each with `(hk : finrank ℝ E = 2 * k)`; the coset law has `(hγ : γ ∈ dual L) (A : SL(2, ℤ))` | yes; “Each assumes `finrank ℝ E = 2 * k`” (394) holds for all three |
| `TauCeti.kroneckerSym_of_ne_zero`: sign factor `1` at `d ≥ 1`, exponent `d.factorization 2`, odd part `ordCompl[2] d`; `kroneckerSym D 0 = 0` for `D ≠ ±1` (1469–1474) | `KroneckerSymbol.lean:96`: `(if a < 0 ∧ b < 0 then -1 else 1) * χ₈ a ^ b.natAbs.factorization 2 * jacobiSym a (ordCompl[2] b.natAbs)`; `:84` and `:91`: `kroneckerSym a 0 = if a = 1 ∨ a = -1 then 1 else 0` | exact |

At the branch pin `358314d` none of the `ZLattice.*`, `ThetaSeries/`, `JacobiTheta/` or `KroneckerSymbol` names exists (as r5 recorded); the README no longer claims that they do.

**Mathlib declarations opened at both pins (`f6090c7`, `1b1ccf4`): 3.**

- `ModularForm.eta_comp_eq_csqrt_I_inv` (`NumberTheory/ModularForm/Discriminant.lean:135` at the branch pin, `:136` at main's), in `namespace ModularForm` (46): `upperHalfPlaneSet.EqOn (η ∘ (−1 / ·)) ((sqrt I)⁻¹ • (sqrt * η))`. That is the README's `η(−1/z) = (√i)⁻¹ √z η(z)` on the upper half-plane (326–327).
- `Complex.sqrt`: `sqrt z = exp (log z / 2)` for `z ≠ 0` (`Analysis/RCLike/Sqrt.lean:40`), the principal root, as the README's “with the principal root” needs.
- Absence claims (329–331): a case-insensitive grep of the pinned Mathlib for “dedekind sum” / `dedekindSum` finds nothing; the only transformation statements about `eta` in `NumberTheory/ModularForms/` are the inversion lemmas of `Discriminant.lean` (65–153), none at a general element of `SL(2, ℤ)`.

**Cross-roadmap citations resolved: 12** against the ThetaSeries roadmap on main (`e8412cd`, `TauCetiRoadmap/ThetaSeries/Suggested.lean`): `dual` 82, `IsIntegral` 213, `IsEven` 219, `discGroup` 233, `scale` 236, `isEven_scale_sqrt_of_even` 267, `level` 290, `det` 353, `orthSum` 384, `kroneckerSym` 563, `hasSum_thetaCoset` 698, `thetaSeries_scale` 708, `thetaSeries_int` 728, `gaussSum` 926 (the comparisons are in the table above). README 397's “consumed under the theta-series roadmap's names” for `thetaSeries_orthSum` (712), `gaussSum_reciprocity`, `milgram`, `discChar`, `thetaSeries_slash_of_mem_Gamma0`, `thetaCoset_slash_of_mem_Gamma`, `thetaFormOfLevel` is consistent with the pin: only the carrier `ZLattice.orthSum` exists there, with no theta product and no `Γ₀(N)` character law in odd rank. The eta bullet's pointer to QSeriesPartitionsAndMockModularForms §5.2 (88, 327) is unchanged from r4.

**Ownership.** The changed passages add no owned object: every new name is a citation of a pinned declaration or of the ThetaSeries roadmap. `scratch/overlaps.md` lists no open pull request changing this roadmap, no dropped id and no id defined only by an open revision; the closest roadmaps in vocabulary (SiegelModularForms, ThetaSeries, MaassForms, QSeriesPartitionsAndMockModularForms, HilbertModularForms) were already compared in r4, and the diff adds nothing in their direction. Open pull requests without supplied files were seen only through the tool's index.

**Seeded sample.** §5.3 is the only one of the 15 seeded targets that intersects the diff; its changed sentences cite pinned declarations, checked above, and carry no new source locator, so no source was fetched. The other 14 targets keep r4's results. The README's `uncertified` locators are settled and untouched.

**Remarks on untouched text (no change requested).**

- README 364–366 groups `ZLattice.isEven_orthSum_iff`, `ZLattice.det_orthSum` and `ZLattice.level_orthSum` before the parenthesis “(`Level.lean`, …)”. The parenthesis describes `level_orthSum`; the first two live in `OrthSum.lean` (212, 371).
- The module docstring of `Suggested.lean` still says odd-rank lattice modularity “lacks ThetaSeries' real-lattice theta-form bridge”. That is true at the branch pin. At `2fd255d` the carrier `ZLattice.thetaSeries`, `ZLattice.level`, `ZLattice.det` and `TauCeti.kroneckerSym` all exist, so after the rebase that the merge implies the odd-rank Hecke–Schoeneberg headline of §2.2 becomes statable on `ZLattice.thetaSeries L` and the Kohnen lift can be stated through `TauCeti.kroneckerSym` directly; r5 recorded the same remark.

**Adversarial pass: 9 fresh rows for the changed statements.**

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| `η(−1/z) = (√i)⁻¹ √z η(z)` (326) | `z = 0.3+0.8i`: `η(−1/z) = 0.7469341577 − 0.0802643492i`, right side the same to `2·10⁻¹⁶`; `z = −0.45+0.2i`: `0.7084304195 + 0.3781258297i` both; `z = i`: `0.7682254223` both (product to `n = 400`) | holds with principal roots | none |
| “`= (−iz)^{1/2} η(z)`, both roots have argument `(arg z − π/2)/2`” (327–329) | `z = 0.3+0.8i`: `(arg z − π/2)/2 = −0.17938534`, `arg (−iz)^{1/2} = −0.17938534`, `arg((√i)⁻¹√z) = −0.17938534`; `z = −0.45+0.2i`: all three `0.57628600`; `\|(−iz)^{1/2} − (√i)⁻¹√z\| ≤ 3·10⁻¹⁶` at both points. For `0 < arg z < π`, `arg(−iz) = arg z − π/2 ∈ (−π/2, π/2)`, inside the principal branch | the two expressions coincide on ℍ | none |
| Kronecker Check values (1452–1456) | `(5/2) = −1`, `(−7/2) = 1`, `(−3/2) = −1`, `(−4/2) = 0`, `(8/2) = 0`, `(5/3) = −1`, `(1/d) = 1` for `d = 1…7`, computed from the pinned formula (`χ₈` exponent `v₂(d)`, Jacobi symbol at the odd part) | all as stated | none |
| “At `d = 0` the closed formula gives `1` while the Kronecker symbol has `(5/0) = 0`” (1455–1456) | `kroneckerSymNat 5 0 = χ₈(5)^{padicValNat 2 0} · jacobiSym 5 (0 / 2^0) = 1 · jacobiSym 5 0 = 1` (`padicValNat_zero_right`, `jacobiSym.zero_right`, `JacobiSymbol.lean:105`); `TauCeti.kroneckerSym 5 0 = 0` (`:84`, `5 ≠ ±1`) | both values right | none |
| “differ only at `d = 0` … for `D ≠ ±1`” (1473–1474) | 23 discriminants `1, 5, 8, 12, 13, 21, 24, 28, 40, 44, −3, −4, −7, −8, −15, −20, −23, −24, −31, −35, −39, −43, −47` × `d = 1…300`: 6900 pairs, 0 disagreements; at `d = 0`: 22 disagree (`1` against `0`), `D = 1` agrees (`1 = 1`); `D = −1` (not fundamental): `1 = 1` | exact, including the `D = ±1` exception | none |
| `kroneckerSym_of_ne_zero` reading: sign `1`, exponent `v₂(d)`, odd part `d'` at `b = d ≥ 1` (1469–1472) | `b = d > 0` makes `b < 0` false, so the factor is `1`; `b.natAbs = d`; `Nat.factorization d 2 = padicValNat 2 d` and `ordCompl[2] d = d / 2^{v₂(d)}`, the adapter's `d / 2 ^ padicValNat 2 d` | the README's reading of the pinned lemma is exact | none |
| `thetaSeries_slash_eq_gaussSum_smul` constant (388–391) | `L = √2ℤ ⊕ √2ℤ` (even, rank `2 = 2k`, `k = 1`, `level 4`, `covol 2`, `Θ_L = θ²`): `(a,b,c,d) = (1,0,4,1)`: `G_L(1,4) = (2+2i)² = 8i`, constant `(−i)(1/4)(1/2)(8i) = 1 = χ₋₄(1)`; `(3,−1,4,−1)`: `G_L = (2−2i)² = −8i`, constant `−1 = χ₋₄(−1)`; `(5,1,4,1)`: `1`; `(1,0,8,1)`: `1`; `(3,1,8,3)`: `−1 = χ₋₄(3)` (numerically to `6·10⁻¹⁵`) | the pinned constant reproduces the nebentypus `χ₋₄(d)` of `θ²` | none |
| `level_orthSum = lcm` and the sums of 2.2 (365–366) | `A₁ ⊕ A₁`: `lcm(4,4) = 4`; `A₃ ⊕ A₁` (`level A₃ = 8`): `lcm(8,4) = 8`; `diag(2,2,6) ⊕ A₁`: `lcm(12,4) = 12`; `L ⊕ L`: `lcm(N,N) = N` | matches the levels 2.1 assigns to `L ⊕ A₁` and `L ⊕ L` | none |
| `hasSum_thetaCoset_qParam` at `N = level L` (371–374) | `L = √2ℤ`, `γ = 1/√2 ∈ L^∨`, `level 4`: `4‖γ‖² = 2 = 2·1`, so `hNγ` holds with `n = 1`; expansion `2q^{1/4} + 2q^{9/4} + …` has `r_{γ+L}(2m/4)` at `m = 1, 9` equal `2`, at `m = 2…8` equal `0` | the ThetaSeries statement is the `N = level L` instance | none |

**Adversarial pass: rows carried forward.** The 12 rows of r5 for the Tau Ceti identifications (`thetaSeries`, the q-expansions, representation numbers, `kroneckerChar`, `jacobiTheta_I_mul`, the limit at `i∞`, Gauss's sum, with their computed values) and the 85 rows r5 carried from r4 for the statements this diff leaves untouched stand as recorded in the r5 report; r5's two rows on the pin of the names and on the completeness of the map are superseded by the table above (14 of 14 names then, 33 of 33 now, at `2fd255d`).

## Not verifiable

- **Source access.** Inherited from r4 for untouched material: Shimura 1973, Serre–Stark, Kohnen 1980/1982/1985, Waldspurger 1981, and the Cohen, Apostol, Knopp and Koblitz locators were not certified in full; the Eichler–Zagier citation is to the 1983 preprint. The changed passages carry no source locator, so no source was fetched this round.
- **Scope of the checks.** Finite coefficient checks and elaboration do not prove the admitted theorems.

## Source issues

- none
