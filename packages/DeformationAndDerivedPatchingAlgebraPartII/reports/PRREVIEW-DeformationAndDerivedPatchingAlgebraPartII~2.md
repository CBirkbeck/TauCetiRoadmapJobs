# Review of DeformationAndDerivedPatchingAlgebraPartII (pull request #872 at 3b9100e)

**Verdict:** accepted

This is a full review of the repaired head (273 changed lines since `ec57b2b`, above the incremental threshold): first the three findings of the previous review, then the whole README (2,233 lines) and `Suggested.lean` (309 lines). Three P3 notes remain; none blocks.

## Previous findings, checked on this head

- **R01 (P2, second graded-module sheaf) — repaired.** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:99–107` now reads "the sheaf of a graded module on `Proj`, which is AdicSpacesPartIII §F0.9's `AlgebraicGeometry.gradedTwist G ℳ n` … used here at `n = 0`"; the supplier contract at lines 261–269 names `gradedTwistSections`, `gradedTwist`, `gradedTwist_restrict` and the shift `M(n)_d = M_{d+n}`; K3.3 (lines 1479–1481) says "no second sheaf construction is made" and keeps only the chart isomorphism, functoriality, exactness and tail invariance on that carrier; the blow-up (lines 1535–1544) is `gradedTwist (reesAlgebra.grade I) ℳ 0` of the Rees module; the Lean docstring (`Suggested.lean:30–33`) says the same. All three names resolve in `TauCetiRoadmap/AdicSpacesPartIII/README.md:3950–3957` on main (`c994070`), with the same gradings and shift. GroebnerGeometry G4 is cited for the polynomial-ring specialization and not restated (see R03 below for its generality).
- **R02 (P3, undeclared API labels) — repaired.** No backticked name of this roadmap's own remains undeclared: the estimates A–E, the Rees-module, chart-module, blow-up, strict-transform, height-inequality and Rees-dimension API bullets are prose (for example line 1382 "Membership is coefficientwise membership in `IⁿM`"); a grep for the former labels (`kawasaki_colon_*`, `reesModule.*`, `moduleBlowup.*`, `Proj.tildeModule.*`, `blowupStrictTransform.*`, `finiteType_height_le`, `ringKrullDim_reesAlgebra_le`, `localCohomology.cechIso`, `HomogeneousLocalizedModule`) finds none, and the gate's `readme-ids-missing` and `dropped` checks pass.
- **R03 (P3, add `sources.toml`) — not repaired, and not re-raised.** The folder still holds `README.md`, `Suggested.lean`, `metadata.toml`. No roadmap folder on main carries a `sources.toml` (0 of 105 folders), so it is not a shape the repository holds roadmaps to, and the gate's `stray-files` check passes on the present folder. The texts this review read are recorded below by source id and line.

## R01 (P3) — Cite ArithmeticGaloisDuality's local-duality target by its name

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:274–277, 765, 795`: "**ArithmeticGaloisDuality, D7.1**: `localDuality` owns Grothendieck local duality over complete Noetherian local rings for bounded complexes with finite cohomology."

**Claim:** the supplier declares `localDuality` in D7.1.

**Witness:** ArithmeticGaloisDuality at its open head `c47fce6` (pull request #858): D7.1 is "The coefficient algebra", and the token `localDuality` occurs nowhere in its README or `Suggested.lean`. The result is there, as the prose target "*Grothendieck local duality for a complete Noetherian local ring*" inside D7.1 (its statement: complete Noetherian local `R`, normalized `ω`, `K ∈ D^b_fg(R)`, `RHom_R(K, ω) ≅ D(RΓ_𝔪(K))`), with no finite-residue-field hypothesis. The section citation and the described content are right; the backticked name is invented.

**Repair:** replace the four occurrences of `` `localDuality` `` by the target's name, "ArithmeticGaloisDuality D7.1, *Grothendieck local duality for a complete Noetherian local ring*". No mathematics changes: K0.7 reproves the normalization and torsion-adjunction steps over the noncomplete ring and uses the supplier only as the complete-ring comparison, which the named target supplies at exactly the stated generality.

## R02 (P3) — Say where the base roadmap stops and what it takes from here

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:1–41` (Summary) and `43–110` (Scope and ownership).

**Claim:** the README is "Part II" of DeformationAndDerivedPatchingAlgebra, but the base roadmap is never named: a grep for `DeformationAndDerivedPatchingAlgebra` not followed by `PartII`, for "Part I" and for "base roadmap" finds nothing.

**Witness:** the house rule ("an extension in an existing roadmap's direction is '<that roadmap>, Part II', whose introduction says where the base roadmap stops"). Here the direction is reversed: DeformationAndDerivedPatchingAlgebra at its open head `7b0ba72` (pull request #1034) lists this Part II as a supplier (its lines 21 and 82: §§K0.1, K0.4–K0.7 and K3.1, "`reesModule I M = ⊕_n I^nM`") and says Part II "owns … strict transforms and Macaulayfication", whereas this scope (line 97) says "Not here: Macaulayfication itself". A reader of this README cannot tell which roadmap is the base, that the base consumes this one, or where Macaulayfication lives (Česnavičius §§4–5 are in neither).

**Repair:** one or two sentences in the Summary or the Scope: name DeformationAndDerivedPatchingAlgebra, say that it consumes K0.1, K0.4–K0.7 and K3.1 (the Rees module is now written `Rees_I(M)` in prose; the consumer's `reesModule` label is its own to update), and that Macaulayfication (Česnavičius §§4–5) is planned in neither. Test: after the edit, the phrase "Not here: Macaulayfication itself" and the consumer's "owns … Macaulayfication" no longer contradict each other from this README's side.

## R03 (P3) — GroebnerGeometry G4 is over a field

**Location:** `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebraPartII/README.md:101–107` ("The graded-module sheafification on projective space … is GroebnerGeometry, G4") and `1497–1498` ("For a standard polynomial ring `A[X₀, …, X_N]` these specialize to the chart and exactness statements of GroebnerGeometry G4, which owns them").

**Claim:** G4 owns the chart and exactness statements for `A[X₀, …, X_N]` over an arbitrary ring `A`.

**Witness:** `TauCetiRoadmap/GroebnerGeometry/README.md:362–375` on main builds the sheafification API "on projective space" `P^N_κ`, and line 352 fixes "κ denotes the same field k". G4 owns the field case only.

**Repair:** write `κ[X₀, …, X_N]` for the G4 specialization at line 1497 and "over a field" at line 102, and let the general-`A` polynomial case be what it already is, an instance of K3.3's general-ring statements. Test: `A = ℤ`, `N = 0`: K3.3 gives `Ñ = tilde M` on `Spec ℤ` for `N = M[t]` (its second Check), which G4 does not state.

## Verified sound

**Gate and build.** The worker's gate at `3b9100e` passes every check. I elaborated `Suggested.lean` with `lake env lean`: exit 0, exactly nine `declaration uses sorry` warnings (lines 95, 104, 129, 177, 215, 238, 255, 265, 297), nothing else. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Dependency check** (run on this head):

```text
depcheck: 201 roadmaps, 1311 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The roadmap is not yet in the merge order; its suppliers are roadmaps on main (SchemeAndStackFoundations, StableReduction, AdicSpacesPartII, AdicSpacesPartIII, DerivedModuleAlgebra, DGFloer, GroebnerGeometry) and ArithmeticGaloisDuality (merge order line 33), so it is placed after ArithmeticGaloisDuality and before its consumer DeformationAndDerivedPatchingAlgebra (line 49). No gap is declared. No route-specific shortcut, re-planned roadmap, copied passage, computational algorithm, sorry'd data, `set_option`, `lemma`, LaTeX, process word or pull-request number was found in the folder.

**Elaborated signatures.** A scratch copy with `#check @name` for all 29 declarations (25 named, 4 anonymous instances) elaborated; every type carries the binders its README statement needs: `IsNoetherianRing`, `IsLocalRing`, `Module.Finite`, `Nontrivial M` (only on `isCMSecant_exists_append`), `a ∈ I`, `p.asIdeal.IsMaximal` and the comap-to-`𝔪` condition on the depth induction, `1 ≤ n` on Goto–Yamagishi, `0 < n` on Schenzel. `LowLocalCohomologyVanishes` takes `R` explicitly and `[IsLocalRing R]`; `annihilatorProduct`, `prefixProduct`, `ChartRing`, `chartModule`, `IsCMBlowupChartwise` carry no local hypothesis, as the README says. No definition lost a section variable. No change requested.

**Padding probe.** Each of the nine sorried theorems was tried on a scratch copy with `first | (simp; done) | rfl | infer_instance | decide | exact?`: six fail with "`exact?` could not close the goal" (lines 100, 108, 218, 250, 268, 303); for `goto_yamagishi_intersection`, `kawasakiConditions_take_of_isCMSecant` and `isCMBlowupChartwise_of_kawasakiConditions` every tactic, including a second run with only `(simp; done) | infer_instance | exact?`, hits the default heartbeat limit without closing. Reading the pins confirms no single library lemma states any of them (no d-sequence, secant, Cohen–Macaulay or depth notion exists at the Mathlib pin). Every definition in the file is used by a headline; no example, boundary case or Check is restated in Lean. Nothing to delete.

**Headline theorems** (README's "`Suggested.lean` declares"): Schenzel's bound (K0.5), extension to CM-secant parameters (K0.6), the Goto–Yamagishi intersection identity (K1.2), Kawasaki's proposition (K2.3), the chart support-dimension bound (K3.6), the closed-point depth induction (K4.4), both Cohen–Macaulay theorems (K4.5), Huckaba's example (K4.6): all nine stated. Not statable, and named as such in the docstring: K0.7 (no dualizing complexes at the pins), the sheaf-level K3.3–K3.6 and K4.1 statements (no graded-module sheaf, homogeneous module localization or strict transform at the pins; Mathlib's `HomogeneousLocalization` is for rings only, `Mathlib/RingTheory/GradedAlgebra/HomogeneousLocalization.lean`).

### Seeded source sample

Source ids: `cesnavicius` = arXiv:1810.04493v2 (pages are its printed pages); `kawasaki1996` = the RIMS Kôkyûroku PDF (extraction page `n` is printed page `39+n`); `hjls` = the Purdue author preprint; `stacks-<tag>` = the Stacks chapter PDF fetched for that tag. Every locator below was read at the cited place.

| Sampled target | Read | Result |
| --- | --- | --- |
| Filtered colimits (K0.1) | `stacks-0A6R` lines 589–599 (Lemma 47.9.1: `RΓ_Z` is the extended Čech complex tensor `K`, any ring, `I` finitely generated), lines 754–768 (Lemma 47.10.1: `RΓ_I = RΓ_Z` over a Noetherian ring) | The Čech description plus exactness of filtered colimits of modules gives the stated commutation; Noetherian is exactly what identifies Mathlib's Ext-colimit functor with `RΓ_Z`. Hypotheses as stated. |
| The local-cohomology annihilator product (K0.2) | `cesnavicius` lines 378–387 (Definition 3.1(ii), p. 10), 397–404 (Remark 3.3, p. 10), 436–446 (Lemma 3.6, p. 11) | The product over `j < dim Supp` of annihilators, a product not an intersection; `a(M)` for `M ≠ 0` is the roadmap's `a_𝔪(M, dim Supp M)`. |
| Prefix quotients (K0.3) | `cesnavicius` lines 370–375 (Definition 3.1, p. 9), 389–396 (Remark 3.2, p. 10) | The objects are the quotients `M/(r₁,…,rᵢ)M`; the empty, concatenated and permuted equivalences are elementary and are not numbered results there. |
| Existence and completion of secant parameter lists (K0.3) | `cesnavicius` lines 389–393 (secant iff part of a system of parameters); `stacks-00KQ` line 6696 (Proposition 10.60.9, local Noetherian ring, parameters exist) | Applied to `R/Ann M` with `Module.supportDim_eq_ringKrullDim_quotient_annihilator`; nonzero finite module needed, present. |
| The local-duality annihilator identity (K0.7) | `cesnavicius` lines 437–438 (Lemma 3.6(a)), proof 448–459 (p. 11) | Normalized dualizing complex, finite `M`, all `j ∈ ℤ`; Matlis annihilator step exactly as in K0.7; no completeness assumed by the source. |
| The defect set for arbitrary support (K0.7) | `cesnavicius` lines 473–476 (Remark 3.7, p. 12); `stacks-0A6R` lines 1373–1379 (Lemma 47.16.5), 1478–1492 (Lemma 47.17.3) | Formula `depth M_𝔭 + dim R/𝔭 < dim Supp M`; source attributes it to Schenzel 2.4.6, the README proves it from 0A7U and 0A7Z as written. |
| The colon identity (K1.2) | `cesnavicius` lines 490–499 (Remark 3.10, (3.10.1), p. 12) | First equality of (3.10.1), `n ≥ 1`, `1 ≤ i ≤ s`, from the definition of a d-sequence. |
| Kawasaki's proposition (K2.3) | `cesnavicius` lines 502–515 (Proposition 3.11, pp. 12–13) | Conditions (i)–(iii) for every initial subsequence of a CM-secant sequence, with auxiliary secant sequences; (ii) vacuous for `s ≤ 1`; the source's `r_{s'}` in (iii) is the roadmap's `r'_{s'}` (see Source issues). |
| Robustness under auxiliary quotients (K2.4) | `cesnavicius` lines 540–542 (Remark 3.12, p. 13) | Statement as written: one list `rs`, any secant `r'` for `M/(rs)M`. |
| Homogeneous module localization and the graded-module sheaf (K3.3) | `stacks-01M7` lines 525–531 (Lemma 27.8.4: `Γ(D₊(f), M̃) = M_(f)`, any graded `S`, `M`), 563–565 (Lemma 27.8.7, quasi-coherence); `stacks-00KQ` line 6071 (§10.56 gradings); `cesnavicius` lines 660–662 (deletion of initial degrees, EGA II 2.5.4, 2.5.6) | Chart isomorphism and quasi-coherence hold for arbitrary gradings; the shift `M(n)_d = M_{d+n}` agrees with AdicSpacesPartIII lines 3950–3957. |
| Chartwise Cohen–Macaulayness (K3.3) | `cesnavicius` lines 549–553 (§3.13, p. 14: `R_(i)`, `M_(i)` generated by the image of `M`, `i` is `M_(i)`-regular), 149–156 (§1.14, p. 4) | Chart description and stalkwise Cohen–Macaulay test as stated; the §1.14 quantifier over all points is corrected to the support (Source issues). |
| The strict transform of a module along a blowing-up (K3.4) | `stacks-080E` lines 3906–3913 (Definition 31.34.1: quotient of the pullback by sections supported on the preimage of `E`), 3918–3923 (Lemma 31.34.2) | No density or integrality hypothesis in the definition, which is what K3.4 extends SchemeAndStackFoundations §4.11 by. |
| The support of the module blowing-up (K3.6) | `cesnavicius` lines 569–574 (proof of Theorem 3.14, p. 14); `stacks-080E` lines 3918–3920 | Support is the schematic image, the blow-up of `Supp M` along the restricted ideal; the source's HIO 12.14 dimension citation is replaced by the K3.6 targets. |
| The annihilation claim (K4.3) | `cesnavicius` lines 638 (Claim 3.14.5), 660–696 (proof, (3.14.12)–(3.14.13), pp. 16–17) | Tail deletion, (i) gives `rₛ` regular on `⊕_{n>0} I_{s−1}ⁿM` and on `M'`, the colimit over `m`, and (ii) kills the kernel term. Matches K4.3 step by step. |
| Blowing up the maximal ideal can destroy Cohen–Macaulayness (K4.6) | `hjls` lines 449–460 (Example 3.6, p. 13); `cesnavicius` lines 363–365 (§3 opening, p. 9) | Same four monomials, same chart `k[x³, x⁵y³, x¹⁴y², x⁴y⁷]` (in `x, y/x`), non-Cohen–Macaulayness asserted there and proved in the README. |

Also read: `cesnavicius` lines 405–410 (Remark 3.4, reversal and `p`-standard type `s−1`), 480–489 (Definition 3.8, Remark 3.9), 543–564 (§3.13 with (3.13.1)–(3.13.2)), 566–568 (Theorem 3.14), 578–600 (weaker hypotheses, regular-element reduction, base cases), 601–657 ((3.14.1)–(3.14.11)), 697–722 (Claim 3.14.6); `kawasaki1996` lines 63–70 (Definition 2.1, p. 41), 88–92 (Lemma 2.4, p. 42, no dualizing-complex hypothesis), 94–102 (Definition 2.5), 105–112 (Theorem 2.6), 129–132 (Lemma 2.7); `stacks-0A6R` lines 177–180 (08XW), 634–644 (0BJB), 695–711 (0BJC), 809–815 (0AVZ), 1182 (0A7B), 1493–1503 (0A80), 1555–1576 (0A84, 0AAK); `stacks-00KQ` lines 12713–12721 (02IJ: `R` Noetherian, finite type, domains, `R ⊂ S`, inequality with equality only under universal catenarity), 7807–7810 (10.70.6: kernel is the `a`-power torsion); `stacks-080E` lines 3697–3704 (0804), 3819–3822 (080A); `stacks-0621` lines 3198–3214 (Koszul definitions 15.29.1–15.29.2); `stacks-015N` is cited inside 0BJC's own text (line 699) for the spectral sequence.

### Computed adversarial pass

`k` is any field (including `𝔽₂`, `𝔽₃`); `D = k⟦t⟧`, `E = k((t))/D`; `P₂ = k⟦x,y⟧`, `P₃ = k⟦x,y,z⟧`; `Q = k⟦x,y⟧/(x², xy)`; `Nd = k⟦x,y⟧/(xy)`. `dim 0 = ⊥`, `depth 0 = ∞`. "Retain" means the instances agree with the statement as written.

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Zero-module and locality conventions | `M = 0`; `k`; `D`; zero ring | `dim 0 = ⊥`, `depth 0 = ∞`; `dim k = depth k = 0`; `dim D = depth D = 1`; the zero ring has no `IsLocalRing` instance (`Nontrivial` is part of it) | Retain |
| K0.1 injective ideal-power torsion | `D`, `E`; `I = (t), 0, D` | `Γ_I(E) = E, E, 0`, each injective; kernel of `t` alone is `k`, not injective | Retain power torsion |
| K0.1 Čech computation and degrees | `D`, `[t]`; `D/(t)`, `[t]`; `[1]`; `[]` | `D → D[1/t]`: `H⁰ = 0`, `H¹ = E`; `D/(t)[1/t] = 0`: `H⁰ = k`, `H¹ = 0`; `[1]`: identity differential, all zero; `[]`: `H⁰ = N`, nothing above | Retain `N` in degree 0 |
| K0.1 composite-support spectral sequence | `P₂`, `I=(x)`, `J=(y)`; `D`, `I=J=(t)`; `D[T]`, `I=(x)`, `J=(T)` | Only `E₂^{1,1}` survives: `H²_{(x,y)}(P₂) ∋ 1/(xy) ≠ 0`; `H⁰_{(t)}(H¹_{(t)}(D)) = E` in total degree 1; `T` regular on `E[T]`, `H²_{(x,T)} = H¹_{(T)}(E[T]) ≠ 0` | Retain |
| K0.1 ring-map comparison | `id_D`; `P₂ → P₂/(y)`; `D → k((t))` | `E = E`; `E = E` with `y` acting by 0; unit extended ideal, `0 = 0` | Retain |
| K0.1 filtered colimits | `D/tⁿ` with `×t`; constant `D` | colimit `E`: `H⁰ = E` both sides, `H¹ = 0`; constant: `H¹ = E = E`; `tⁿ·[t^{−n−1}] = [t^{−1}] ≠ 0`, no uniform exponent | Retain |
| K0.1 one-element formulas | `D`, `r=t`; `k = D/(t)`, `r = t` | `H⁰ = 0`, `H¹ = E`; `H⁰ = k`, `H¹ = 0`; `colim k/tᵐk` with zero transitions is `0` (identity transitions would give `k`) | Retain `×r` transitions |
| K0.1 two-element formulas | `P₂`, `(x,y)`; `(1,y)` | `H² = P₂[1/xy]/(P₂[1/x]+P₂[1/y]) ∋ 1/(xy)`, `H⁰ = H¹ = 0`, `H² = H¹_{(x)}(H¹_{(y)})`; unit ideal: all zero | Retain |
| K0.2 `a_J(M,d)` definition | `d = 0`; `D/t²`, `d=1`, `J=𝔪`; `M=0` | empty product `R`; `Ann H⁰ = (t²)` (radical would give `(t)`); all `H^j(0) = 0`, product `R` | Retain explicit cutoff |
| K0.2 product versus intersection | `P₂`, `M = k ⊕ P₂/(y)`, `d=2` | `Ann H⁰ = (x,y)`, `Ann H¹ = (y)`; product `(xy, y²)`, intersection `(y)`, `y ∉ (xy,y²)` | Retain product |
| K0.3 prefix quotients | `ℤ`, `[]`, `[2]`, `[2,3]` | `ℤ`, `ℤ/2`, `0`; the product ideal would give `ℤ/6` | Retain |
| K0.3 `IsSecant` | `D`: `[t]`, `[t²]`, `[t,t]`; `k`: `[0]`, `[1]`; `0`: any | `1→0` ✓, `1→0` ✓, `1→0→0` ✗; `0→0` ✗, `1 ∉ 𝔪` ✗; `⊥ < ⊥` ✗ so only `[]` | Retain |
| K0.3 dimension formula needs `M ≠ 0` | `0`, `[0]` | `⊥ + 1 = ⊥` but not secant | Retain hypothesis |
| K0.3 sublist, powers, truncated product | `P₂`: `[x,y]`, `[y,x]`, `[x²]`, `[y]`, `[xy]`; `[xy, y]` | terminal dimensions `0,0,1,1,1` with length + dimension `= 2`; `[xy,y]`: `2→1→1` not secant | Retain |
| K0.3 parameter completion | `P₂`, `[x]`; `D`, `[]`; `k`, `[]` | append `[y]`, `[t]`, `[]`: terminal dimension 0 each | Retain |
| K0.4 `LowLocalCohomologyVanishes` | `D`; `Q`; `0` | `H⁰_𝔪(D) = 0` below dim 1 ✓; `H⁰_𝔪(Q) = k·x̄ ≠ 0` below dim 1 ✗; no `j < ⊥` ✓ | True/false/true as intended |
| K0.4 `IsCMSecant` | `Q`, `[y]`; `Q`, `[]`; `D`, `[t²]`; `0`, `[]` | `a(Q) = Ann(k x̄) = 𝔪 ∋ y`, `Q/y ≅ k[x]/x²` dim 0 CM ✓; `[]` fails terminal CM ✗; `a(D) = R ∋ t²`, `D/t²` CM ✓; `[]` ✓ and no nonempty list | Retain; CM-secant need not be regular |
| K0.5 `schenzel_torsion_bound` | `Q`, `[y]`, `n ≥ 1`; `D`, `[t]`; `M = k⊕P₂`, `[x,y]` | `ker yⁿ = k x̄`, `𝔪·x̄ = 0` ✓; `ker tⁿ = 0` ✓; `a(M) = 𝔪·R = 𝔪` and `y`-torsion of `M/xM = k ⊕ k⟦y⟧` is `k ⊕ 0`, killed by `𝔪` ✓ | Retain (no dualizing complex needed: `kawasaki1996` Lemma 2.4 and the Čech–Koszul argument) |
| K0.5 regularity on CM modules | `P₂`, `[x,y]`; `Q`, `[y]` | kernels on `P₂`, `P₂/x` are 0; `ker y = k x̄ ≠ 0` and `Q` is not CM | Retain CM hypothesis |
| K0.6 `isCMSecant_exists_append` | `P₂`, `[x]`; `Q`, `[y]`; `k`, `[]`; `0` | append `[y]`, `[]`, `[]`; terminal dimensions `0`; on `M = 0`, `supportDim = ⊥ ≠ 0`, excluded by `Nontrivial M` (Nakayama keeps `M/(rs)M ≠ 0`) | Retain `Nontrivial` |
| K0.6 reversal / type `d−1` | `P₂`, `[x,y]` ↦ `[y,x]`; `Q`, `[y]`, `[x+y]` | `x_2 = x ∈ a(P₂) = R`, `x_1 = y ∈ a(P₂/x) = R` ✓; `y ∈ 𝔪 = a(Q)`, `Q/(x+y) ≅ k[x]/x²` finite length ✓ | Retain |
| K0.7 normalized local duality | `D`, `ω = D[1]`, `M = D`; `R = k[t]_{(t)}`, `E = k(t)/R` | `Ext^{−1}(D, D[1]) = D`, `Hom(D,E) = E = H¹_𝔪(D)`; `Ext⁰ = 0 ↔ H⁰ = 0`; noncomplete: `Hom_{R̂}(R̂,E) = E` but `Hom_R(R̂,E) ⊋` (nonzero map `R̂/R → E`) | Retain `R̂`-linear Hom, index `−j` |
| K0.7 Matlis annihilator lemma | `N = κ, 0, R` over `D`; `R = k`, `E = k²` | `𝔪 = 𝔪`, `R = R`, `0 = 0` (`E` faithful); non-essential `k ⊂ k²`: `Ann Hom(k,k²) = 0 = Ann k` | Retain, no essentiality |
| K0.7 annihilator identity and normalization | `D`, `j = 0, 1`; `k`, `ω[1]` | `Ann H⁰ = R = Ann Ext⁰`, `Ann H¹ = 0 = Ann Ext^{−1}`; with `k[1]`: `Ext⁰(k,k[1]) = 0` (Ann `R`) but `Ann H⁰_𝔪(k) = 0` | Retain normalization |
| K0.7 non-CM locus (equidimensional) | `Q`; `D` | `V(a(Q)) = V(𝔪)` = closed point; `Q_{(x)} = k((y))` is CM ✓; `V(a(D)) = ∅` ✓ | Retain |
| K0.7 defect set | `R = k⟦x,y,z⟧/(xy,xz)`, `𝔭 = (y,z)`, `d = 2` | `R_𝔭` is a field, `depth 0 + dim R/𝔭 1 < 2` so `𝔭 ∈ V(a(R))`; directly, `Ann H¹_𝔪(R) ⊆ (y,z)` since `H¹_𝔪(R)` surjects onto `k((x))/k⟦x⟧` | Retain; not the non-CM locus |
| K1.1 `IsDSequence` | `ℚ`: `[0]`, `[1]`; `ℤ`: `[2,0]`, `[0,2]`; `0` | `0` injective on `0·ℚ = 0` ✓; `1` on `ℚ` ✓ (terminal quotient 0, not regular); `×2` on `2ℤ` ✓ then `×0` on `0` ✓; `×0` on `(0,2)ℤ = 2ℤ` ✗; zero module ✓ | Retain ordered lists |
| K1.1 torsion characterization uses the later index | `R = k⟦t,u⟧`, `M = R/(u) ⊕ R`, `[t,u]` | d-sequence ✓; `ker(tu) = R/(u) ⊕ 0 = ker u ≠ ker t = 0` | Retain correction of Remark 3.9 |
| K1.2 colon identity | `ℚ`, `[0]`, `n=0,1`; `P₂`, `[x,y]`, `i=2`, `n=1,2` | `n=0`: `(0:0) = ℚ ≠ 0`; `n ≥ 1`: both `0`; `((x):y)∩(x,y) = (x) = (x)∩(x,y)`; `(x)∩(x,y)² = (x²,xy)` both sides | Retain `n ≥ 1` |
| K1.2 `goto_yamagishi_intersection` | `P₂`, `[x,y]`, Lean `i=1`, `n=1,2`; `i=0`; `ℤ`, `[2,0]`, `i=1` | `(x)∩(x,y) = (x) = (x)·R`; `(x)∩(x,y)² = (x²,xy) = (x)(x,y)`; `i=0`: `⊥ ⊓ … = ⊥ = ⊥•⊤`; `2ℤ ∩ 2ⁿℤ = 2ⁿℤ = (2)(2)^{n−1}ℤ` | Retain; Lean's 0-indexed `i` is the README's `i+1` |
| K2.1 `prefixProduct` | `ℤ`, `[2,3]`, `s=0,1,2,3`; `[0,b]` | `ℤ, (2), (2), (2)` (`(2,3)² = ℤ`); `s > length` repeats the full ideal; `I_s = 0` for `s ≥ 1` | Retain |
| K2.2 `KawasakiConditions` | `[]` on any `M`; `0`; `ℚ⟦X⟧/(X²)`, `[X]`; `D`, `[t]` | (i),(ii),(iii) trivial / trivial; `X·(XM) = 0` with `XM ≠ 0` fails (i); `t` regular, (ii) vacuous, only `[]` secant for `k` | Retain three-clause predicate |
| K2.2 auxiliary quantifier in (iii) | `P₂`, `rs=[x]`, `as=[y]` | `y` secant for `P₂/x`; antecedent on `(P₂)/(x)`; conclusions on `P₂` and `P₂/(xⁿ)`: `ker y = 0` | Retain |
| K2.3 auxiliary colon identity | `P₂`, `[x,y]`, `i=2`, aux `[x]`, `Λ={2}`, `∅`; `P₃`, aux `[x,y]`, `v=2`, `Λ={3}` | `(y) = (y)`; `0 = 0`; `(x,z) = (x,z)` | Instances pass (primary 1999 text unreadable) |
| K2.3 reversed-prefix d-sequence | `k⟦x,y,z⟧/(x²,xy)`, `[y,z]` | `[z,y]`: `z` regular, `y` injective on `(y)` mod `z` ✓; `[y,z]`: `xz ≠ 0` in `(y,z)M`, `y·xz = 0` ✗ | Retain reversal |
| K2.3 estimate A | `P₂`, `[x,y]`, `i=j=k=1`, `l=2`, `n₁=1,2` | `((x):y)∩(x,y) = (x) = (x)·R`; `(x)∩(x,y)² = (x²,xy) = (x)(x,y)` | Instances pass |
| K2.3 estimate B | `P₂`, `i=j=k=l=2`, aux `[x]`, `n₂=1,2`; `P₃`, aux `[x,y]` | `(y²):x = (y²) = y((y):x)+0`; `(y³) = (y³)`; `(x,z²)` both sides with `Y⁻:y = (x)` needed | Instances pass |
| K2.3 estimates C, D | same `P₂`, `P₃` data | `(y) ⊆ R`, `(y²) ⊆ (y)`, `(x,z²) ⊆ (x,z)`; D: `(y)=(y)`, `(y²)=(y²)`, `(xz,z²) ⊊ (x,z²)` | Retain inclusions |
| K2.3 estimate E | `P₂`, `k=i=j=2`, aux `[x]`, `v=1`, `Λ=∅`, `n₂=1,2`; `P₃` | `(y):x² = (y) = (y):x`; `(y²)` both; `(x,z)` both, `y ∈ a(P₃/z) = R` | Instances pass |
| K2.3 torsion identity (ii) | `P₂`, `[x,y]`, `n=1,2`; `M = k⊕P₂`, `n=1` | on `P₂/(x)`: `yᵐ`-torsion `0` = `(x,y)`-torsion `0`; on `P₂/(x²)`: both `0` while `(x)`-torsion is `(x)/(x²) ≠ 0`; on `k ⊕ P₂/(x)`: both `k ⊕ 0` for every `m`; `[x,y]` is CM-secant for `k⊕P₂` (`x ∈ 𝔪 = a(M)`, `y ∈ a(k⊕k⟦y⟧) = 𝔪`) | Retain |
| K2.3 last auxiliary element regular | `P₃`, `[x,y]`, aux `[z]`; `P₂`, `[x]`, aux `[y]`; `D`, `[]`, aux `[t]` | `ker z = 0` on `P₃/(x,y)`, `P₃`, `P₃/(x(x,y))ⁿ`; `ker y = 0` on `P₂/(xⁿ)`; `I₀ⁿ = D`, quotient `0` | Retain |
| K2.3 `kawasakiConditions_take_of_isCMSecant` | `D`, `[t]`; `Q`, `[y]`; `P₂`, `[x,y]`, `s=0,1,2` | all clauses hold; `y` injective on `yQ = y k⟦y⟧` though `y x̄ = 0`; `s=0` gives the empty list, trivially | Retain |
| K2.4 robustness | `P₂`, `[X]`, aux `[Y]`; `P₃`, `[x,y]`, aux `[z]`; aux `[]` | conditions on `k⟦X⟧` hold; on `k⟦x,y⟧`: `[y,x]` regular, `yᵐ`-torsion mod `(xⁿ)` is `0`; identity | Retain |
| K3.1 Rees module | `ℤ`, `I=(2)`, `M=ℤ/2`; `I=0`; `I=R` | degree-0 `ℤ/2`, positive degrees `0` (tensor model has `ℤ/2 ⊗ 2ℤ ≅ ℤ/2` in degree 1); only degree 0; all of `M[t]` | Retain image construction |
| K3.1 action and maps | `ℤ`, `I=(2)`, `2t`, `t`; `f=×3`, `g=×5` | `2 ∈ 2ℤ` so `2t` in, `1 ∉ 2ℤ` so `t` out; `2t·2t = 4t²` with `4 ∈ I²`; `g(f(2t)) = 30t = (g∘f)(2t)` | Retain |
| K3.2 `chartModule` | `ℤ`, `(2)`, `a=2`, `M=ℤ/2`; `I=R`, `a=1`; `Nd`, `I=(x)`, `a=x`; `a=0` | `M[1/2] = 0` so `M_(2) = 0` while `ℤ[(2)/2]⊗ℤ/2 = ℤ/2`; `M_(1) = M`; `M⟨x^∞⟩ = (y)`, `M_(x) = k⟦x⟧`; chart ring zero, module zero | Retain |
| K3.2 tensor-to-chart kernel | `ℤ`, `(2)`, `ℤ/2`, `a=2` | kernel `ℤ/2` = `2`-power torsion of `ℤ[(2)/2] ⊗ ℤ/2`; after inverting 2 both `0` | Retain |
| K3.2 homogeneous-localization comparison | `ℤ`, `(2)`, `M=ℤ`, `a=2`; `M=ℤ/2` | `x tⁿ/(2t)ⁿ = y tᵐ/(2t)ᵐ` iff `2ᵏ(2ᵐx − 2ⁿy) = 0` iff `x/2ⁿ = y/2ᵐ` in `M[1/2]`; for `ℤ/2` every class is `0` | Retain |
| K3.3 chart isomorphism, `Ñ` at twist 0 | `S = k[t]`, `N = S`; `S = A[t]`, `N = M[t]`; `N` in degree 0 with `tN = 0` | `S_(t) = k`, structure sheaf on `Spec k`; `N_(t) = M`; `x/1 = tx/t = 0`, sheaf `0` though `N ≠ 0` | Retain (agrees with AdicSpacesPartIII `gradedTwist_structure`, `gradedTwist_zeroModule`) |
| K3.3 shift and transition | `S = ℚ[X₀,X₁]`, `N = S(−1)` | `S(−1)_(Xᵢ)` free on `1/Xᵢ` (`x/Xᵢᵏ`, `x ∈ S_{k−1}`); `1/X₀ = (X₁/X₀)(1/X₁)`: `O(−1)`; `Γ = 0` | Retain `M(n)_d = M_{d+n}` (same as AdicSpacesPartIII `gradedTwist_projectiveLine`) |
| K3.3 negative control for invertibility | `S = A[t]`, `deg t = 2`, `N = S(1)` | `S(1)_{2k} = S_{2k+1} = 0`, so `N_(t) = 0` | Retain, no invertibility claimed |
| K3.3 exactness and tail invariance | `S = ℚ[t]`: `0 → S(−1) →t S → ℚ → 0`; `tS ↪ S` | `1/t ↦ 1`, first map iso, cokernel sheaf `0` though `ℚ ≠ 0`; `(tS)_(t) = k = S_(t)`, identity | Retain |
| K3.3 module blowing-up | `I = R`; `ℤ`, `(2)`, `ℤ/2`; `Nd`, `I=(x)`; `I = (r)` | `tilde M` on `Proj R[t] = Spec R`; charts `0` though `tilde(ℤ/2)` pulls back nonzero; sheaf of `k⟦x⟧` on `Spec k⟦x⟧`; sheaf of `M/M⟨r^∞⟩` on `Spec R/R⟨r^∞⟩` | Retain |
| K3.3 `IsCMBlowupChartwise` | `M=0`; `I=0`; `I=R` on `D`, on `Q`; `a=0 ∈ I` | all chart modules `0` ✓; only chart `a=0`, zero ring, no prime ✓; unit chart is the base: `D` ✓, `Q` ✗ at `𝔪`; `a=0` chart vacuous | True/true/true/false as intended |
| K3.4 strict transform | `ℤ`, `(2)`, `tilde(ℤ/2)`; `I = R`; `I=(a)`, `a` regular on `R`, `N` | pullback supported on `E = V(2)`, transform `0`; `E = ∅`, transform = pullback; no `a`-torsion, transform `tilde N` | Retain |
| K3.4 comparison with the strict transform | same three | `0/0`, `tilde N/tilde N`, `k⟦x⟧/k⟦x⟧` for `Nd`, `I=(x)` | Retain |
| K3.5 product of ideals, schemes | `P₂`, `I=(x)`, `J=(x,y)`; `Nd`, `I=(x)`, `J=(y)` | chart of `x²`: `R[xy/x²] = R[y/x]`; `IJ = 0`, both blow-ups empty, pulled-back `J` is `0` on `Spec k⟦x⟧` | Retain |
| K3.5 product of ideals, modules | `P₂`, `I=(x,y)`, `J=(x)`, `a=y`, `c=x`, `M=R/(x)`; `Nd`, `M=R/(y)`, `r₁=x` | `M_(y) = k⟦y⟧ ≠ 0`, then `x` inverted kills it; product chart `0`; `x` regular on `M` not on `R`: scheme `Spec R/(y)`, module `k⟦x⟧` | Retain module/ring regularity distinction |
| K3.6 support of `Bl_I(M)` | `I=R`; `ℤ`, `(2)`, `ℤ/2`; `P₂`, `I=(x,y)`, `M=R/(y)`, `x`-chart | `V(Ann M)`; `IA = 0` in `A = ℤ/2`, both empty; kernel of `R[y/x] → k((x))` is `(y/x)`, support `V(y/x)` of dimension `1 = dim Supp M` | Retain |
| K3.6 height inequality | `k ⊂ k[t]`, `q=(t)`, `q=0`; `k[x] ⊂ k[x,t]`, `q=(x,t)` | `1+0 ≤ 0+1`; `0+1 ≤ 0+1`; `2+0 ≤ 1+1` | Retain (02IJ hypotheses present) |
| K3.6 Rees dimension bound | `D`, `J=(t), 0, D`; zero ring | `2 ≤ 2`, `1 ≤ 2`, `2 ≤ 2`; `⊥ ≤ ⊥` | Retain inequality (`J = 0` strict) |
| K3.6 `Proj` bound | `A[t]`, `J=A`; `J=0`; `D`, `(t)` | chain `𝔭_l A[t] ⊊ 𝔭_l + tA[t]` gives `dim A + 1`; empty `Proj`, `⊥`; `1 + 1 = 2` | Retain nonemptiness |
| K3.6 `supportDim_chartModule_le` | `P₂`, `(x,y)`, `R/(y)`, `a=x`; `ℤ`, `(2)`, `ℤ/2`; `M=0`; `a=0` | `1 ≤ 1`; `⊥ ≤ 0`; `⊥ ≤ ⊥`; zero chart ring, `⊥ ≤ dim` | Retain; proof via `A = R/Ann M`, chart ⊆ `Proj A[IAt]`, `dim ≤ dim A` |
| K4.1 regular-element reduction | `P₂`, `[x]`, `r'=y`; `D`, `I=(x)`… `k⟦x⟧`, `I=(x)`, `r'=x`; `M=0`, `[]`, `r'=0` | `Bl_{(x)}(P₂)/y = k⟦x⟧ = Bl_{(x)}(P₂/y)`; `xM/x·xM = k` but `x(M/xM) = 0`, so regularity on `M/IM` is needed; `[0]` not secant for `0` (`⊥ < ⊥`), `M ≠ 0` needed | Retain |
| K4.2 first stages | `Nd`, `r₁=x`; `ℤ`, `ℤ/2`, `r₁=2` | `k⟦x⟧`, depth 1; principal chart module `0` | Retain |
| K4.2 two-generator chart | `P₂`, `(x,y)`, denominators `y`, `x`; `Nd`, numerator `y`, denominator `x` | `R'[T]/(yT−x)` torsion-free; `R'[T]/(xT−y)`; `x²T = 0`, removing `x`-torsion kills `T, y`: `k⟦x⟧` (10.70.6) | Retain `bT − a` |
| K4.2 closed fibre polynomial | residue field `𝔽₂`, `f = T² + T + 1` | `f(0) = f(1) = 1`, irreducible, residue extension of 4 elements; monic so regular on `L[T]` | Retain monic irreducible lift, not linear |
| K4.3 annihilation claim | `P₂`, `M=(x,y)`, `[x,y]`; `P₃`, `[x,y]`; `k⟦x,y,z⟧/(x²,xy)`, `[y,z]` | `H¹_𝔪(M) = k`, `a(M) = 𝔪 ∋ x`, `y`-torsion of `M/xM` is `k x̄`, `a(M/xM) = 𝔪 ∋ y`: CM-secant; chart module `M`, `H¹_{(x,y)}(M) = k` killed by `x, y`, not by `1`; `H¹ = 0`; chart removes `(x)`, `H¹_{(y,z)}(k⟦y,z⟧) = 0` | Retain, no regularity of the original list |
| K4.3 vanishing claim, cutoff `j < s−2` | `P₃`, `[x,y,z]`, chart `C = R[y/x]_{(x,y,z,y/x)}`, `(rᵢ,rₛ) = (x,z)` | `H¹_{(x,z)}(C) = 0`; `H⁰_{𝔪'}(H²_{(x,z)}(C)) = 0` (`y/x` regular on it); `H¹_{𝔪'}(H²_{(x,z)}(C)) ≠ 0`; `s = 2` gives empty range | Retain sharp cutoff |
| K4.3 relation kills `H¹` | `P₂`, `N=(x,y)`; `N = Nd`, `(x,y)` | `H¹_𝔪(N)[T] = k[T]`, `yT − x` and `xT − y` act by `0`, `1` does not; on `Nd`: `H¹ ↠ k((y))/k⟦y⟧`, `(yT − x)·y^{−2} = T y^{−1} ≠ 0` | Retain both annihilation hypotheses |
| K4.4 `depth_ge_of_kawasakiConditions` | `P₂`, `[x,y]`, `I₂ = (x²,xy)`; `Q`, `[y]`; `s=0`; `s=1` | charts `R[y/x]`, `R[x/y]`: closed points on the exceptional line, local rings regular of depth 2 ≥ 2; `k⟦y⟧` depth 1 ≥ 1; `j < 0` vacuous; regularity of `r₁` on `M/M⟨r₁^∞⟩` | Retain; no terminal-quotient hypothesis is used by the source's induction either (`cesnavicius` lines 605–610, 718–721) |
| K4.4 closed points lie over `𝔪` | `p` maximal in `R[I/a]` with `p ∩ R = 𝔪` | `κ(p)` finite over `κ` (Nullstellensatz), closed in the fibre, closed in the proper blow-up; conversely every closed point lies over `𝔪` | Lean's two hypotheses equal "closed point" |
| K4.5 `isCMBlowupChartwise_of_kawasakiConditions` | `P₂`, `[x,y]`; `Q`, `[y]`; `k`, `[]`; `M = 0` | (depth, dim) `(2,2)`, `(1,1)`, `(0,0)`; zero sheaf | Retain terminal CM plus secancy plus conditions |
| K4.5 `isCMBlowupChartwise_prefixProduct_of_isCMSecant` | `D`, `[t]`; `Q`, `[y]`; `P₂`, `[x,y]` | `Bl_{(t)}(D) = D` CM; `k⟦y⟧` CM though `Q` is not; `Bl_{(x)(x,y)} = Bl_{(x,y)}`, local rings regular | Retain |
| K4.6 Huckaba algebra | `u=x³, v=x⁵y³, w=x¹⁵y², z=y⁷` | `v³ = x¹⁵y⁹ = wz`; `w⁷ = x¹⁰⁵y¹⁴ = u³⁵z²`; `vⁱwʲ` (`i<3`, `j<7`) have `x`-exponent `≡ 2i (mod 3)` and then `y`-exponent `≡ 3i+2j (mod 7)`, 21 distinct classes: free of rank 21 over `k[u,z]`, CM of dimension 2 | Retain |
| K4.6 chart and non-CM conclusion | `a=x³, b=x⁵Y³, c=x¹⁴Y², d=x⁴Y⁷`, `Y = y/x` | `b²¹ = x¹⁰⁵Y⁶³ = a²³d⁹`, `c²¹ = x²⁹⁴Y⁴² = a⁹⁰d⁶`: `(a,d)` parameters; `c²/a = x²⁵Y⁴`, `Y`-degree 4 forces `c²` and `x`-degree `≥ 28`, so `c² ∉ aB`; `dc² = x³²Y¹¹ = ab³c`; `𝔫 = (a,b,c,d)` lies over `𝔪` (`u = a, v = ab, w = ac, z = ad`); grading keeps `c² ≠ 0` in `B_𝔫/a` | depth 1 < dim 2, independent of the field |
| K4.6 Lean statement | `k = 𝔽₂, 𝔽₃, ℚ` | `huckabaOrigin = (u,v,w,z)` (kernel of the constant coefficient on the monomial algebra); witness `a = u/1`, `p = 𝔫`: `LowLocalCohomologyVanishes` fails at `j = 1 < 2` | Retain |
| Worked examples | `Q`,`[y]`; `ℤ`,`[2,3]`; `ℤ`,`(2)`,`ℤ/2`; `[t,u]`; Huckaba | `k⟦y⟧`; `(2) ≠ ℤ`; `0 ≠ tilde(ℤ/2)`; `ker(tu) = ker u ≠ ker t`; depth 1 versus 2 | All agree with their targets |

78 rows; every headline, every sampled target and every definition and convention of the roadmap is covered, and the passages changed since `ec57b2b` (K3.3, the blow-up, the strict transform, the Rees-module and chart-module API) are each represented. The wrong models excluded by the definitions were tested: tensor instead of image for the Rees and chart modules; intersection instead of product in `a_J(M,d)`; unordered instead of ordered d-sequences; the full prefix ideal's power instead of the prefix product; a free `Prop` instead of the local-cohomology Cohen–Macaulay test; earlier instead of later index in the torsion characterization; `aT − b` instead of `bT − a`; `M(n)_d = M_{d−n}` instead of `M_{d+n}`.

### Pinned declarations opened

Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the manifest pins), paths relative to each library.

| Declaration | File and line | Note |
| --- | --- | --- |
| `localCohomology`, `localCohomology.isoOfSameRadical` | `Mathlib/Algebra/Homology/LocalCohomology.lean:173, 261` | Ext-colimit over ideal powers; `ModuleCat.{u} R ⥤ ModuleCat.{u} R`, hence the single universe `u` in the Lean file; radical invariance needs `IsNoetherian R R` |
| `Module.supportDim`, `supportDim_eq_bot_iff_subsingleton`, `supportDim_eq_ringKrullDim_quotient_annihilator` | `Mathlib/RingTheory/KrullDimension/Module.lean:32, 43, 49` | finite module for the annihilator comparison |
| `supportDim_le_supportDim_quotSMulTop_succ`, `supportDim_quotSMulTop_succ_eq_of_notMem_minimalPrimes_of_mem_maximalIdeal`, `supportDim_quotSMulTop_succ_eq_supportDim` | `Mathlib/RingTheory/KrullDimension/Regular.lean:141, 151, 157` | Noetherian, finite, `x ∈ 𝔪` |
| `Ideal.ofList` | `Mathlib/RingTheory/Regular/RegularSequence.lean:41` | span of the entries, not their product |
| `RingTheory.Sequence.IsWeaklyRegular`, `IsRegular` | same file, lines 135, 146 | `IsRegular` adds the final nonvanishing |
| `Module.annihilator` | `Mathlib/RingTheory/Ideal/Maps.lean:868` | |
| `Ideal.primaryComponent` | `Mathlib/Algebra/Module/Torsion/PrimaryComponent.lean:29` | `⨆ i, torsionBySet (I^i)`, the carrier of K0.1's supplier lemma |
| `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` | `Mathlib/RingTheory/Filtration.lean:425` | Krull intersection used in K0.5 |
| `PolynomialModule.single`, `smul_apply`, `map`, `map_smul`, `coeff_inj` | `Mathlib/Algebra/Polynomial/Module/Basic.lean:131, 228, 293, 308, 79` | carrier of the Rees module |
| `reesAlgebra`, `mem_reesAlgebra_iff`, `reesAlgebra.fg` | `Mathlib/RingTheory/ReesAlgebra.lean:40, 65, 116` | no dimension statement at the pin |
| `LocalizedModule.moduleOfIsLocalization`, `mkLinearMap` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean:363, 481` | |
| `IsLocalization.Away.invSelf` | `Mathlib/RingTheory/Localization/Away/Basic.lean:58` | |
| `Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | cardinal-valued |
| `Ideal.ResidueField.map` | `Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean:38` | |
| `Polynomial.ringKrullDim_of_isNoetherianRing` | `Mathlib/RingTheory/KrullDimension/Polynomial.lean:24` | |
| `topologicalKrullDim` | `Mathlib/Topology/KrullDimension.lean:37` | |
| `AlgebraicGeometry.projIsoSpec`, `Proj.awayι` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:847`, `Basic.lean:186` | |
| `HomogeneousLocalization.Away` | `Mathlib/RingTheory/GradedAlgebra/HomogeneousLocalization.lean:599` | rings only; no graded-module version at the pin |
| `SetLike.GradedSMul`, `DirectSum.Decomposition` | `Mathlib/Algebra/GradedMulAction.lean:109`, `Mathlib/Algebra/DirectSum/Decomposition.lean:55` | |
| `Scheme.Modules`, `presheaf`, `pullback`; `tilde`, `tilde.map` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:36, 89, 182`; `Modules/Tilde.lean:152, 202` | |
| `Ideal.affineBlowup`, `mem_affineBlowup_iff`, `map_algebraMap_affineBlowup`, `isRegular_algebraMap_affineBlowup`, `affineBlowupLift` | `TauCeti/RingTheory/Ideal/AffineBlowup.lean:60, 134, 146, 157, 222` | the object file exists, the import builds |
| `reesAlgebra.grade`, `gradedMonoid`, `isInternal_grade`, `gradeZeroEquiv`, `monomialDegreeOne` | `TauCeti/RingTheory/ReesAlgebra/Grading.lean:57, 85, 145, 167, 30 (header)` | |
| `reesAlgebra.awayEquivAffineBlowup` | `TauCeti/RingTheory/ReesAlgebra/AffineBlowup.lean:27 (header)` | ring form only |
| `affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι`, `affineBlowupι_toSpecZero` | `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean:61, 70, 76, 37 (header)` | |
| `Ideal.injective_primaryComponent` | `TauCeti/Algebra/Module/Injective/Noetherian.lean:61` | instance |

Absent at the pins, as the docstring and README say: any Cohen–Macaulay predicate, any depth function (the only `depth` is `Mathlib/Data/W/Basic.lean`), d-sequences, secant sequences, local cohomology in Tau Ceti, a Rees-algebra dimension bound.

### Cross-roadmap citations resolved

Main at `c994070` unless noted.

| Citation | Where it resolves | Checked |
| --- | --- | --- |
| SchemeAndStackFoundations §0.3 `relativeProj_affine_iso`, `relativeProj_eq_stableReduction` | `README.md:551, 567, 579` | affine comparison of relative Proj with `Proj` of the Rees algebra |
| §0.16 `Excellence.IsCatenary` | lines 1099, 1101 | |
| §0.17 `Module.depth`, `IsLocalRing.depth`, `depth_le_supportDim` (nonzero), `Module.IsCohenMacaulay` (zero or depth = support dimension), `localization`, `isCohenMacaulay_quotSMulTop_iff` | lines 1138–1160, 1235 | the zero-module convention and the two API items the README consumes are there |
| §0.18 `Scheme.Modules.IsCohenMacaulay` | lines 1254, 1260 | stalkwise |
| §2.7 `localCohomology_colimit_ext_comparison`, `localCohomology_module_comparison`, `localCohomology_flat_baseChange` (flat map of Noetherian rings, arbitrary `M`), `depth_localCohomology_vanishing`, `depth_localCohomology_nonvanishing` (only for natural depth) | lines 3482, 3493–3513 | hypotheses as the README states them |
| §2.18 `derivedTensor`, `derivedHom` | lines 3959, 3978 | |
| §2.21 `DualizingComplex`, `NormalizedDualizing`, `NormalizedDualizing.localization_shift` | lines 4390, 4394, 4401–4405 | `ω_p[−dim A/p]` normalised over `A_p` |
| §4.11 `strictTransformModule f φ U M`, `strictTransform_eq_blowup` | lines 5528, 5544, 5565 | dense witness `U`; K3.4's extension is genuine |
| StableReduction Layer 4 | `README.md:468` "Layer 4: blowups and intersection theory on arithmetic surfaces" | |
| AdicSpacesPartII *localization-cech-complex-exact*, `cechLocalizationTerm`, `cechLocalizationAugmentation`, `cechLocalizationDifferential` | `README.md:1149, 1159–1160` | exactness only for the unit ideal, as the README says |
| AdicSpacesPartIII §F0.9 `gradedTwistSections`, `gradedTwist`, `gradedTwist_restrict` | `README.md:3914, 3950–3957` | ℕ-graded ring, ℤ-graded module, `M(n)_d = M_{d+n}`; no chart-isomorphism, exactness or tail statement there, so K3.3 adds, not restates |
| GroebnerGeometry G4 (anchor `#g4-rees-algebras-and-flat-initial-families`) | `README.md:252, 362–375` | over the field κ (R03) |
| DerivedModuleAlgebra §0.K.1 `koszulComplex φ`; §1.3 `DerivedDeRham.derivedCompletion`; §1.5; §§1.M.1–1.M.2 | `README.md:516–534, 1733–1747, 1808, 2242, 2290–2300` | §1.M.2 is for arbitrary residue fields with the completion adjunction `Hom_{R̂}(N̂,E) ≅ Hom_R(N,E)` |
| DGFloer Layer 1 item 3 | `README.md:612–632` | bounded-below exhaustive filtration, strong convergence, no upper bound needed |
| ArithmeticGaloisDuality D7.1 | open head `c47fce6`, D7.1 at its line 4686, the target at 4812–4850 | result present; name wrong (R01) |

**Ownership.** By object, not only by name, I searched the pinned libraries, main, and the 431 open roadmap pull requests of the index (`roadmaps grep` for d-sequence, CM-secant, Kawasaki, Macaulayfication, Rees module, module blowing-up, Huckaba, annihilators of local cohomology), and read the hits: DerivedDeRhamCohomology (open head, §1.16) builds the Rees object of a filtered object in the filtered derived category as a graded `A[t]`-module, a different carrier from the `reesAlgebra I`-submodule `⊕ IⁿM` of the polynomial module; AdicSpacesPartII's "submodule blow-up" statements (lines 1146, 1456) are about the scheme `Proj(⊕ Jⁿ)`, which this roadmap imports from StableReduction; DeformationAndDerivedPatchingAlgebra (open head `7b0ba72`) consumes this roadmap and builds the associated graded quotient, not the Rees module. No other roadmap owns the annihilator calculus, CM-secant sequences, Kawasaki's conditions, the module blowing-up, its support bound or the Cohen–Macaulay theorem; no `Suggested.lean` I can read declares a fully qualified name of this file's. Ownership against open pull requests whose files the brief does not give was checked only through the index.

**Shape.** Every definition has an API list and at least three discriminating Checks (the chartwise predicate has four, the Rees module four, the chart module four, the graded sheaf seven); every theorem has its hypotheses in the sentence and a locator; every layer ends with Examples and Dependencies; `*Needs:*` lines are per target; the five source slips are stated as corrected conventions, not as process narrative. Unicode mathematics throughout, no LaTeX delimiters.

## Not verifiable

- **Kawasaki's 1999 author preprint** (K2.3: Propositions 3.2–3.5, p. 5; Theorem 3.6 and its proof, pp. 6–13, the estimates A–E). The author page serves a `.dvi.gz`, which the sources service rejects as not a document; no other legal copy was found. The five estimates were checked only on the instances in the table; Česnavičius's statement of Proposition 3.11, which is what the Lean headline states, was verified. Recorded in `needs-references.toml`.
- **Kawasaki 2000 and 2002** (Trans. AMS): the DOI landing pages are on a host in no licence class; not read. Cited historically through Česnavičius, whose list of five misprints (lines 531–539) I read. Recorded in `needs-references.toml`.
- **Schenzel 1982** (LNM 907, 2.4.2, 2.4.6): no legal copy found; the two statements used were checked in `cesnavicius` Remarks 3.3 and 3.7 and `kawasaki1996` Lemma 2.4. Recorded in `needs-references.toml`.
- **Huneke 1982** (Adv. Math.): the service reports it as uncertified (paywalled publisher); historical attribution only, the d-sequence definition was checked in `cesnavicius` Definition 3.8 and `kawasaki1996` Definition 2.1.
- **Herrmann–Ikeda–Orbanz 12.14 and 14.11**: cited only through Česnavičius; the README replaces 12.14 by its own K3.6 argument and 14.11 by HJLS Example 3.6, both read.

## Source issues

- **Misprint** in cesnavicius at §1.14, printed p. 4: the source says a coherent module is Cohen–Macaulay when depth equals support dimension at every point; it should quantify over the support, where zero stalks have depth `∞` and dimension `−∞`; affects a stated result.
- **Misprint** in cesnavicius at Remark 3.9, printed p. 12: the source says the `rᵢ`-torsion and the `rᵢr_{i'}`-torsion of the `i`-th prefix quotient agree; it should be the `r_{i'}`-torsion (later index), as `k⟦t,u⟧`, `R/(u) ⊕ R`, `[t,u]` shows; affects a stated result.
- **Misprint** in cesnavicius at Proposition 3.11(iii), printed p. 13: the source says the regular element is `r_{s'}`; it should be the last auxiliary element `r'_{s'}`; affects a stated result.
- **Misprint** in cesnavicius at the proof of Theorem 3.14, printed p. 15: the source defines `I_s` as a product of `s` copies of `(r₁, …, rₛ)`; the `i`-th factor should be `(r₁, …, rᵢ)`; affects the proof.
- **Misprint** in cesnavicius at (3.14.10), printed p. 16: the source says multiplication by `r_aT − r_b` is zero; the map of the exact sequence (3.14.7) is `r_bT − r_a`, although both act by zero under the hypotheses; affects the proof.
- **Misprint** in kawasaki1996 at the remark after Definition 2.5, printed p. 42: the source says a `p`-standard system of type `s` exists when `s ≤ dim A/a(M)`; it should be `s ≥ dim A/a(M)`, since `d − s` parameters must lie in `a(M)`; affects a stated result.
