# Review of RestrictedPowerSeries (pull request #1681 at 053b0fd)

**Verdict:** needs changes

The pull request is a progress report on a roadmap that is on main: it adds `STATUS.md` and `PROGRESS.md` (machine-owned progress files, present in 96 roadmap folders on main, not stray), changes one README line (the backticked `IsEntire.isUnit_of_evalAt_eq_zero` dropped) and the import block of `Suggested.lean` (single `import Mathlib` line). The brief asks for a full review of the folder, so the findings below concern the folder as it stands at this head; most of the text they touch is unchanged from main. The gate passed on this head; the Lean file elaborates with ten `sorry` warnings and nothing else.

## R01 (P2) — Mutual supply with AdicSpacesPartIV, and its object re-defined here

Location: `TauCetiRoadmap/RestrictedPowerSeries/README.md` lines 56 and 783–790 ("**Supplier contract: AdicSpaces Part IV §F1.1.** … consume its algebra `W_n = ⋃_{ρ>1} K⟨ρ⁻¹X₁,…,ρ⁻¹X_n⟩`"); `Suggested.lean` lines 190–192 (`def IsOverconvergent`).

Claim: §7.3 consumes the overconvergent algebra `W_n` from AdicSpacesPartIV target *overconvergent-tate-algebra*; the Lean file then defines `IsOverconvergent` ("there is `ρ > 1` with `f` restricted at the constant polyradius `ρ`"), which is exactly the defining predicate of that supplied object.

Witness: AdicSpacesPartIV on main, README line 3003: "Supplied by RestrictedPowerSeries §§0.1, 1.1, 5.4 and RigidAnalyticGeometry §1.5" (its radius-`ρ` Tate algebras `T_n(ρ)`), and its supplier table line 416 names RestrictedPowerSeries §§0.1, 1.1, 5.4. So the two roadmaps supply each other: RestrictedPowerSeries §7.3 ← AdicSpacesPartIV F1.1 ← RestrictedPowerSeries §§0.1, 1.1, 5.4. The dependency check reports 0 problems only because both roadmaps are on main (edges to main are never upward); the cycle is a design cycle in the sense of the principles. `IsOverconvergent` (Suggested.lean 191) is used by no theorem of the file and restates the supplier's object: two owners of one definition.

Repair: delete `IsOverconvergent` from `Suggested.lean` (no stated theorem uses it). For the cycle, one owner must be chosen and the other roadmap repointed: either RestrictedPowerSeries §7.3 owns the series algebra `W_n` (its membership predicate, subalgebra structure, inclusion in `T_n`, polynomial density, completion for the unit Gauss norm) and AdicSpacesPartIV F1.1 consumes it, which matches the Scope sentence "The common coefficient algebra of open-disc, entire and overconvergent series: their radius conditions … are specified below"; or §7.3 is reduced to the comparison and compatibility statements and its contract paragraph says so. The first option is the one this README's scope already describes; it requires an edit of AdicSpacesPartIV outside this folder, so the choice is a decision for a human, and the report records it here rather than making it.

## R02 (P2) — Headline theorems statable at the pins are absent from `Suggested.lean`

Location: `Suggested.lean` (whole file); README lines 10–14 (central results), 541–545 (§5.2), 567–572 (§5.3), 587–593 (§5.4), 364–368 (§2.4).

Claim: the README's central results are division and preparation (stated), the several-variable forms, and "the noetherian, factorial and dimension theory of Tate algebras"; §§5.3, 5.4 and 2.4 add strict closedness, noetherianity at polyradii in `√|K×|` and Strassmann's bound. Of these, only Jacobson (`tate_isJacobsonRing`) and the one-variable Banach-ring theorems are stated.

Witness: a scratch file against the pinned libraries elaborates (only `sorry` warnings) the following five statements on the pinned carrier `MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ 1)` with `[NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]`: `UniqueFactorizationMonoid` of it (§5.2); `ringKrullDim` of it `= n` (§5.2); for every ideal `I` and `f`, `∃ g ∈ I, ∀ h ∈ I, ‖f - g‖ ≤ ‖f - h‖` (§5.3, Bosch Cor 9, bosch line 852); for `r : Fin n → ℝ` positive with `∀ i, ∃ s ≥ 1, ∃ c : K, ‖c‖ * r i ^ s = 1`, `IsNoetherianRing (MvPowerSeries.IsRestricted.subring (R := K) r)` (§5.4); and Strassmann on the file's own `eval₂`: for `L` a complete ultrametric normed field with `[NormedAlgebra K L]` and `Isometry (algebraMap K L)`, `f` restricted at `r > 0` and `TauCeti.PowerSeries.IsDistinguished r s f`, `{x : L | ‖x‖ ≤ r ∧ eval₂ (algebraMap K L) f x = 0}.encard ≤ s` (§2.4). `ringKrullDim`, `UniqueFactorizationMonoid` and the normed instance on the subring (`instNormedRingIsRestrictedSubring`, Tau Ceti `MvPowerSeries/TateAlgebra/Basic.lean`) exist at the pins.

Repair: state these five in `Suggested.lean` with `sorry`. For the headlines that are not statable at the pins, say so in the module docstring: several-variable division and preparation (§4.4) need the general-polyradius iteration isometry of §1.3, and Tau Ceti's `Iterate.lean` at the pin is unit-radius only; the maximum-modulus theorem of §2.4 needs multivariate evaluation over a finite extension. The docstring at present (lines 7–18) says neither.

## R03 (P3) — Lean file form: docstring, padding and standing hypotheses

Location: `Suggested.lean` lines 6–19 (docstring), 38–42, 56–65, 136–150, 212–216, 182–184, 190–192, 115–119, 79–90.

Claim and witness:
- The docstring is the "representative interfaces … not an exhaustive implementation checklist" form; the file is the acceptance test and the docstring must say which headline theorems are not statable and what each lacks (see R02).
- Padding (each proved by one library call or restating a definition): `isRestricted_of_radius_le` (line 39, `exact TauCeti.PowerSeries.isRestricted_of_abs_le …`), `mv_gaussNorm_mul` (58, `exact f.2.gaussNorm_mul g.2`), `IsMulDistinguished.toIsDistinguished` (137, `h.2`), `isMulDistinguished_iff` (143, unfolds the definition under `NormMulClass`), the `example` at 214 (`exact TauCeti.PowerSeries.isNoetherianRing_isRestricted_subring hr`), and the definitions `OnOpenDisc` (183) and `IsOverconvergent` (191), used by no stated theorem.
- Standing hypotheses carried by section variables: `hasseDeriv_isRestricted` (115) elaborates with `[CompleteSpace R]` although its bound is coefficientwise (`‖(n+k choose k) • a‖ ≤ ‖a‖` in an ultrametric group, so `‖coeff n (D^[k] f)‖ r^n ≤ r^{-k} ‖a_{n+k}‖ r^{n+k}`), and `hasSum_eval₂`/`norm_eval₂_le` (79, 86) carry `[IsUltrametricDist R]` though only `B`'s ultrametricity enters; `isRestricted_map` (32) carries `hr : 0 < r`, which Mathlib's `isRestricted_abs_iff` makes unnecessary.
- Of the 18 declared names, only `IsNormMulUnit` and `IsMulDistinguished` appear in the README (lines 135–136); the rule is that every Lean name appears in the README.

Repair: rewrite the docstring in the acceptance-test form; delete the seven padding declarations (the README keeps the statements as Checks or targets); drop the unused binders (move `hasseDeriv_isRestricted` before the `[CompleteSpace R]` variable, or `omit` it); name each kept declaration in the README sentence that states it.

## R04 (P3) — Uniqueness narrowed below the source in division and preparation

Location: `Suggested.lean` lines 156–165 (`weierstrassDivision_unique`) and 168–174 (`weierstrassPreparation_unique`); README lines 485–486.

Claim: `∃! qb, IsRestricted r qb.1 ∧ qb.2.degree < s ∧ f = g * qb.1 + qb.2 ∧ ‖f‖_r = max (‖g‖_r ‖qb.1‖_r) ‖qb.2‖_r` asserts uniqueness only among pairs that also satisfy the norm identity; likewise preparation asserts uniqueness only among `(w, e)` with `‖w‖_r = r^s`.

Witness: Martin Prop. 1.27 (martin lines 766–772) states uniqueness of `(q, R)` among all pairs with `f = gq + R`, `R` of degree `< s`, and derives the norm identity for every such pair; Cor. 1.28 (martin lines 840–842) states uniqueness among all monic `w` of degree `s` and multiplicative units `e`; the pinned `TauCeti.PowerSeries.IsDistinguished.existsUnique_mul_add_eq` (Division.lean 485) also quantifies uniqueness over the degree condition alone. The normalisation `‖w‖_r = r^s` is automatic: `w = T^s − R` with `‖R‖_r ≤ ‖T^s‖_r = r^s`, so `‖w‖_r = r^s`. Including it in the `∃!` predicate weakens the statement.

Repair: state `∃! qb, IsRestricted r qb.1 ∧ qb.2.degree < s ∧ f = g * qb.1 + qb.2` and the norm identity as a separate conjunct `∀ qb, … → ‖f‖_r = max …` (or a second theorem); for preparation, `∃! we, we.1.Monic ∧ we.1.degree = s ∧ IsNormMulUnit we.2 ∧ g = we.2 * we.1`, with `‖we.1‖_r = r^s` as a consequence. README §4.3 line 485 ("Prove uniqueness under these normalisations") should then say that uniqueness holds without the norm normalisation.

## R05 (P3) — Pull-request links and a dead relative link

Location: README lines 55, 56, 57 (`…/TauCetiRoadmap/pull/813`, `pull/815`, `pull/817`), 64 and 719 (`pull/854`), 178 (Mathlib `pull/42871`), 54 (`../AdicSpaces/README.md#…`).

Claim: the cited roadmaps are linked by pull-request number; the AdicSpaces link points at a path that does not exist.

Witness: AdicSpacesPartII, AdicSpacesPartIII and AdicSpacesPartIV are on main (`TauCetiRoadmap/AdicSpacesPartIII/README.md` line 811 states *restricted-power-series-adic*, PartIV line 2998 F1.1, PartII line 1769 R0.3); AdicSpaces is on main at `Completed/AdicSpaces/README.md` (§0.4 at its line 206, §0.5 at 233), so `../AdicSpaces/README.md` from this folder resolves to nothing. The gate's pull-request scanner matches `#NNN` forms, not URL forms, which is why it passed.

Repair: link `../AdicSpacesPartIII/README.md`, `../AdicSpacesPartIV/README.md`, `../AdicSpacesPartII/README.md` and `../../Completed/AdicSpaces/README.md` (NewtonPolygons on main, README line 50, uses that `Completed/` form); name LocallyAnalyticDistributions without a link (it is still a pull request); drop the Mathlib pull-request reference at line 178 and keep the sentence about extending the pinned API.

## R06 (P3) — `entireResultant` is a backticked own name with no declaration

Location: README line 753 ("Define `entireResultant P F` as the determinant …").

Claim: a backticked name of this roadmap's own claims a declaration in `Suggested.lean`; none exists (the gate's name check matches only underscore names, so it passed).

Witness: `Suggested.lean` declares no `entireResultant`; CompactOperators on main (README line 66) cites "`entireResultant` and the unit-ideal criterion" from RestrictedPowerSeries §7.2, so the name is read as a contract. A real body would need the entire remainder, which is the data of the §7.2 division theorem, so a definition here would be sorry'd data.

Repair: write it in prose, as the previous repair did for the unit-inverse name: "Define the monic entire resultant `Res(P, F)` as the determinant …".

## R07 (P3) — No Check separates the multiplicative notions from the plain ones

Location: README §3.1 (lines 398–406) and §4.1 (lines 454–467); Checks at lines 442–447 and 507–512.

Claim: `IsNormMulUnit` and `IsMulDistinguished` are the roadmap's two new predicates (Convention 7), and no Check exhibits a unit that is not a multiplicative unit, or a series that is distinguished with a unit coefficient but not multiplicatively distinguished; the §4.1 estimate is the reason the roadmap needs them.

Witness: `R = ℚ_p[ε]/(ε²)` with the maximum norm, `u = p + ε`: `u⁻¹ = p⁻¹ − p⁻² ε`, `‖u‖ = 1`, `‖u⁻¹‖ = p² ≠ ‖u‖⁻¹`, and `‖u · ε‖ = |p| = p⁻¹ ≠ ‖u‖ ‖ε‖ = 1`. Then `g = u X` at radius `1` satisfies `TauCeti.PowerSeries.IsDistinguished 1 1 g` with `IsUnit (coeff 1 g)` but not `IsMulDistinguished 1 g 1`; dividing `f = X` gives `q = u⁻¹`, `b = 0`, and `‖g‖ ‖q‖ = p² ≠ 1 = ‖f‖`: the §4.1 identity `‖gq + b‖ = max(‖g‖‖q‖, ‖b‖)` fails. (Martin Lemma 1.26, martin line 753, uses the multiplicative unit exactly at this step.)

Repair: add the two witnesses as Checks of §3.1 and §4.1.

## R08 (P3) — Pinned declarations consumed by file name rather than by declaration

Location: README lines 155–176 (Existing foundations table), 414–420 (§3.2 converse), 487–488 (§4.3 "recover the existing field/multiplicative-norm theorems"), 541–542 (§5.2).

Claim: Convention 10 (line 143) says targets implemented at the pin are consumed "through their actual declarations"; the README names files, not declarations, and §3.2 asks to "prove the converse" that the pin already proves in one variable.

Witness, at the pull request's Tau Ceti pin a91d3aa: `TauCeti.PowerSeries.isUnit_iff_isDistinguished_zero_and_isUnit_coeff_zero` (Weierstrass/Preparation.lean line 134, hypotheses `NormedCommRing`, `IsUltrametricDist`, `NormMulClass`, `CompleteSpace`, `Nontrivial`) is the one-variable case of §3.2's converse; `IsDistinguished.existsUnique_mul_add_eq` (Division.lean 485) and `IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq` (Preparation.lean 284) are the multiplicative-norm theorems §4.3 recovers; `isNoetherianRing_isRestricted_subring` (Ideal.lean 130) is the one-variable noetherianity. At main's Tau Ceti pin 358314d (the pull request's manifest lags it) `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring` (`MvPowerSeries/TateAlgebra/Noetherian.lean`) proves `T_n` noetherian for every finite `n`, and `TauCeti.MvPowerSeries.exists_algEquiv_isDistinguished` (`Distinguished.lean`) is the distinguished coordinate change of §5.1.

Repair: cite these by name where the claim is made, scoping §3.2's target to the several-variable extension; when the manifest is refreshed to main's pin, consume the finite-variable noetherianity and the coordinate change from Tau Ceti instead of AdicSpaces §0.5 and §5.1's construction.

## Verified sound

**Gate and build.** The worker's gate at 053b0fd passed every check (`depcheck=0 … build=0 OK`). Dependency check, run with the brief's command: `depcheck: 224 roadmaps, 2111 edges, 0 problem(s)`. `lake env lean` on a scratch copy of `Suggested.lean`: ten `declaration uses sorry` warnings (lines 32, 45, 79, 86, 108, 115, 156, 168, 199, 219), no error, no module-system warning (branch pin Mathlib 6b7abb3, Tau Ceti a91d3aa). A `#check @name` file for all 22 declarations elaborated once; the elaborated types agree with the README except as recorded in R03 (standing hypotheses) and R04 (uniqueness class). One-tactic probe (`simp`, `infer_instance`, `exact?` on each sorried theorem): none closes; the proved declarations listed in R03 are one library call each.

**Pins.** Branch manifest: Tau Ceti a91d3aa, Mathlib 6b7abb3; content main: Tau Ceti 358314d, Mathlib f6090c7. Neither pin has `IsNormMulUnit`, `IsMulDistinguished`, `IsEntire`, an entire resultant or Strassmann (grep of both checkouts), so the Lean file's definitions duplicate nothing at either pin; the Tau Ceti main the progress files describe (cc3d579) is newer than both.

**Library declarations opened at the branch pin.** Mathlib `MvPowerSeries.IsRestricted` (`RingTheory/MvPowerSeries/Restricted.lean` 33: `Tendsto (‖coeff t f‖ * t.prod (c · ^ ·)) cofinite (𝓝 0)`), `PowerSeries.IsRestricted` (abbrev, `PowerSeries/Restricted.lean` 28), `MvPowerSeries.gaussNorm` (`MvPowerSeries/GaussNorm.lean` 57, an `iSup`, junk `0` when unbounded, as Convention 5 says), `MvPowerSeries.HasEval` (`MvPowerSeries/Evaluation.lean` 63: topologically nilpotent points, so Mathlib's `aeval` does not cover the closed boundary `‖b‖ = r`, which justifies `eval₂` as a separate sum); Tau Ceti `IsDistinguished` (`PowerSeries/GaussNorm.lean` 122: attainment at `s` and strict decrease after `s`, no unit condition), Division.lean 87–89 and 214 (`NormMulClass R` standing), Preparation.lean 73/127/298, Ideal.lean 130, `MvPowerSeries/TateAlgebra/Basic.lean` (normed instance under `∀ i, Fact (0 < c i)`, `IsRestricted.gaussNorm_mul` at 241 under `NormMulClass`), `Iterate.lean` (unit polyradius only), `Huber/Restricted/GaussNorm.lean` 80 (`restrictedMvPowerSeriesGaussEquiv`, continuous both ways at 123/141), `IsJacobsonRing`, `UniqueFactorizationMonoid`, `IsIntegrallyClosed`, `ringKrullDim` (all present).

**Cross-roadmap citations resolved.** AdicSpaces §§0.4–0.5: `Completed/AdicSpaces/README.md` lines 206–252 (Wedhorn 5.48–5.51 weighted series, item 3 field Weierstrass theory, item 4 noetherianity of `K⟨X⟩`); AdicSpacesPartIII F0.1 *restricted-power-series-adic*: main README 811–835 (hypotheses as in §6.3: adic noetherian `A`, reductions `(A/I^{n+1})[T]`, universal property for linearly topologised complete separated `B`, Lean name `IsAdicRing.isNoetherianRing_restrictedMvPowerSeriesCompletion`); AdicSpacesPartIV F1.1 *overconvergent-tate-algebra* and *-properties*: main README 2998–3176 (`W_n`, union over `ρ ∈ Γ* ∩ (1,∞)`, strict closedness); AdicSpacesPartII R0.3 *completed-tensor-restricted-power-series*: main README 1992–2003 (adic `λ`, finite `M_i` with `M_i·A` open); PadicMeasuresIwasawaAlgebras §4.3: main README 2485 "Weierstrass theory of O⟦T⟧". Consumers checked: LocallyAnalyticDistributions at its open head (`### From TauCetiRoadmap.RestrictedPowerSeries` at its lines 135 and 145, §§4.2–4.3 table rows citing §7.2), CompactOperators (main, README 64–68, 527–548), NewtonPolygons (main, 44–53), PadicFunctionalAnalysis (main, 30, 118), RigidAnalyticGeometry (main, 29, 133, 281), AdicSpacesPartII (main, 342, 346, 4093, 4118). Ownership by object: `IsEntire` is also declared in the `Suggested.lean` of CompactOperators (main, line 84) and LocallyAnalyticDistributions (#854, line 89); both say it is this roadmap's supplier predicate to be replaced by an import, so this roadmap is the owner and no finding arises here.

**Sources at their locators.** martin (arXiv:1211.6684v3; its numbering agrees with the README's published-article numbering): Definition 1.20 line 673, Lemma 1.21 line 676 (uses `‖1‖ = 1`, as §3.1's norm-one hypothesis requires), Remark 1.22 line 683, Definition 1.24 line 720 (`g_s` multiplicative unit, `‖g_s‖r^s = ‖g‖`, strict decrease for `n > s`, exactly Convention 7), Lemma 1.26 line 735 (`‖gq‖ = ‖g‖‖q‖` and the greatest index `s + k₀`), Proposition 1.27 line 766 (division with `‖f‖ = max(‖g‖‖q‖, ‖R‖)`, standing hypotheses "ultrametric complete normed ring", line 663), Corollary 1.28 line 840, several-variable remark line 876. wedhorn: 5.48 line 1719, 5.49 line 1739, 5.50 line 1762 (`A` complete, `T_i` bounded, one power-bounded set `{f(t)x_i}`; §6.1 matches). gk: 1.1–1.2 lines 72–88 (`W_n = ⋃_{ρ>1} T_n(ρ)`, union over `Γ*`), 1.3 line 94, 1.4 line 110 (noetherian factorial Jacobson, every ideal strictly closed). bosch (preprint, printed page = marker page): §1.2 Lemma 7 line 440 (one isometric triangular change for finitely many series, §5.1), §1.3 Prop. 3 line 710 (bald subring), Theorem 6 line 771 (orthonormal lifting), Cor. 7 line 804 (generators of norm one with `|f_i| ≤ |f|`), Cor. 8 line 847, Cor. 9 line 852 (strictly closed), Cor. 10 line 860 (submodules of `T_n^s`); §5.3 matches. ega: 0.7.5.1 line 2634 (p. 69), 7.5.3 line 2672 (p. 70, universal property for linearly topologised complete separated `B`, arbitrary `b_i`), Prop. 7.5.4 line 2681 (p. 70–71, noetherianity); §6.3 matches. colmez: §I.4.1 line 628 (analytic functions on a closed disc, p. 13), §II.1 line 1417 (`R⁺`, Fréchet topology by the valuations at radii `u_h`, p. 29); §7.1 matches.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1/0.3 Check `Σ p^n X^n` over `ℚ_p` | radius 1; radius p | `p^{-n}·1 → 0`; `p^{-n}·p^n = 1` | restricted at 1, not at p | none |
| §0.2 `isRestricted_map` | `C = 0`; `r` negative (`hr` dropped) | `‖φ a_n‖ r^n ≤ C‖a_n‖r^n → 0`; `isRestricted_abs_iff` | true without `hr` | R03 |
| §1.1 norms of constants and monomials | `R` norm-one; `R = K[ε]/(ε²)` | `‖C a‖ = ‖a‖`, `‖X‖ = r`; `‖ε X‖ = r` | as stated | none |
| §1.2 `gaussNorm_le_of_radius_le` | `f = 0`; `f = X`, `r = 1 ≤ s = 2` | `0 ≤ 0`; `1 ≤ 2` | true | none |
| §1.3 Checks | `X^n` at radius 1; `r = √p` | coefficients `→ 0`, `‖X^n‖ = 1`; `‖X‖ = √p ∉ |ℚ_p×|` | as stated | none |
| §2.1 `hasSum_eval₂`, `norm_eval₂_le` | `b = 0`; `‖b‖ = r` (boundary); `C = 0` | `eval = φ(a_0)`; `‖φ(a_n)b^n‖ ≤ C‖a_n‖r^n → 0`, sum bounded by `C‖f‖_r`; bound `0 ≤ 0` | true (needs `B` complete ultrametric, not `R` ultrametric) | R03 |
| §2.2 `analyticSubst_isRestricted` | `g = 0`; `g = 1` (constant term 1), `r = s = 1`, `f = Σ p^n X^n` | `subst = a_0`, `‖a_0‖ ≤ ‖f‖_r`; `coeff_j = Σ_n p^n coeff_j(1) = (1−p)^{-1} δ_{j0}`, norm `1 ≤ ‖f‖_1 = 1` | true; nonzero constant term allowed | none |
| §2.3 `hasseDeriv` | `k = 0`; `Δ²(T²)` in char 2; `k = 1`, `f = X^m` | identity; `C(2,2)·1 = 1` while `D²T² = 2 = 0`; `m X^{m-1}`, `‖m‖ r^{m-1} ≤ r^{-1} r^m` | true, bound `r^{-k}` | none |
| §2.4 Check `X^p − X` | over `ℚ_p` on `ℤ_p`; over `𝔽_p` | Gauss norm 1, values `≡ 0 mod p` so `≤ p^{-1}`; vanishes on all of `𝔽_p` | as stated | none |
| §3.1 multiplicative units | `u = p + ε` in `ℚ_p[ε]/(ε²)` | unit, `‖u ε‖ = p^{-1} ≠ 1` | unit but not multiplicative; no Check shows it | R07 |
| §3.2 unit criterion | `1 − pX`, `1 − X` over `ℚ_p`; `1 + εX` over `K[ε]/(ε²)` | inverse `Σ p^n X^n` restricted; `Σ X^n` not; inverse `1 − εX` with `‖ε‖ = 1 = ‖a_0‖` | field criterion fails over Banach rings, as the Check says | none |
| §3.3 reduction | `Σ p^n X^n` | reduction `1` | as stated | none |
| §4.1 norm identity | `g = X − 1`, `q = 1`, `b = 0` at radius 1; `g = (p+ε)X`, `f = X` | `‖gq‖ = 1 = ‖g‖‖q‖`; `q = (p+ε)^{-1}`, `‖g‖‖q‖ = p² ≠ 1 = ‖f‖` | identity needs the multiplicative unit | R07 |
| §4.2 division, degenerate cases | `s = 0`; `f = 0`; zero ring | `b = 0` (`degree ⊥ < 0`), `q = g^{-1} f`; `(0, 0)`; excluded by `NormOneClass` (`‖1‖ = ‖0‖ = 0`) | true | none |
| §4.2/4.3 uniqueness class | pair satisfying `f = gq + b` only | norm identity follows (Martin 1.27 first part), `‖w‖_r = max(r^s, ‖R‖) = r^s` | Lean uniqueness narrower than source | R04 |
| §4.4 Check dual numbers | `T⁴ ÷ (T² − ε)` | `(T² − ε)(T² + ε) = T⁴ − ε² = T⁴` | quotient `T² + ε`, remainder `0` | none |
| §5.1 Weierstrass polynomial | `X − 1` at radius 1 | monic, `‖X − 1‖ = 1` | its own Weierstrass polynomial, lower coefficient of norm 1 | none |
| §5.2 Jacobson, UFD, dimension | `n = 0` (`T_0 = K`); `n = 1` | field is Jacobson, UFD, dim 0; `T_1` PID (Ideal.lean), dim 1 | consistent; UFD and dimension unstated | R02 |
| §5.4 Checks | `X² − p` over `ℚ_p`; radius `√p` | quotient basis `1, X`, `X² = p`; `s = 2`, `c = p`, `‖p‖(√p)² = p^{-1}·p = 1` | presentation `Y ↦ pX²` exists | none |
| §6.1 universal property | `A` discrete; finitely many `M_i` | `A⟨X⟩ = A[X]`; union of finitely many power-bounded sets is power-bounded in a commutative ring (`(S∪T)^n ⊆ ⋃ S^k T^{n−k}`) | matches Wedhorn 5.50 | none |
| §6.3 adic series | `A = ℤ_p`; `A` discrete | `ℤ_p⟨X⟩/p^m = (ℤ/p^m)[X]`; polynomials; `Σ X^n ∉ ℤ_p⟨X⟩` | matches EGA 7.5 and PartIII F0.1 | none |
| §7.1/7.3 Checks | `Σ X^n`; `Σ p^n X^n`; `Σ p^{n²} X^n`; `exp` | open-disc only; `(ρ/p)^n → 0` iff `ρ < p`; entire; radius `p^{-1/(p-1)}` | as stated | none |
| §7.2 `entire_division_unique` | `P` constant unit; `P = T − a`; `P = 0` | `B = 0`, `Q = P^{-1}F`; `B = F(a)`; `IsUnit 0` false (`NormOneClass`) | true, uniqueness among entire `Q` by division at large radii | none |
| §7.2 resultant Checks | `Res(T², a+bT)`; `T³ ÷ (T²+aT+b)`; `Res(1, 0)`; `Res(T−a, F)` | matrix `[[a,0],[b,a]]`, det `a²`; `(T²+aT+b)(T−a) = T³ + (b−a²)T − ab`, remainder `(a²−b)T + ab`; rank-0 det `1`; `F(a)` | as stated | none |
| §7.2 unit inverse | `F(0) = 1`, `F(a) = 0` | `0 = 1 + a·Σ a_{n+1}a^n`, inverse `−Σ a_{n+1}a^n` | as stated | none |
| §7.3 radii in `|K×|` | discretely valued `K`, `|a_ν| = |π|^{⌈|ν|/2⌉}` | `|a_ν|ρ^{|ν|} → 0` for `ρ < |π|^{-1/2}`, `→ ∞` at `ρ = |π|^{-1}` | union over `|K×|` too small, as stated | none |
| `tate_isJacobsonRing` | `n = 0` | `K` Jacobson | consistent | none |

## Not verifiable

- **[BGR]** *Non-Archimedean Analysis* (Springer DOI 10.1007/978-3-642-52229-1): paywalled, recorded `uncertified`; §§5.1–5.2 and 7.1.1 cited by locator only. The statements they back were checked against bosch and gk instead.
- **[Coleman]** *p-adic Banach spaces and families of modular forms* (DOI 10.1007/s002220050127): paywalled, `uncertified`; Appendix A3 (entire division) checked by the argument in the table.
- **[Huber]** *Étale cohomology of rigid analytic varieties and adic spaces* (DOI 10.1007/978-3-663-09991-8): paywalled, `uncertified`; cited only through the AdicSpacesPartII target.
- The roadmap had no `sources.toml`; the sources service created `packages/RestrictedPowerSeries/sources.toml` during the fetches of this review (certified: martin, wedhorn, gk, bosch, ega, colmez; uncertified: bgr, coleman, huber). The first `martin` attempt by a wrong arXiv id was overwritten by the citation lookup (arXiv:1211.6684v3); the record should be checked before it is relied on.
- Ownership against open pull requests was checked with the roadmap grep (every open head) for the objects `IsNormMulUnit`, `IsMulDistinguished`, `IsEntire`, the entire resultant, Strassmann and Weierstrass division; no other open roadmap builds them.

## Source issues

- none
