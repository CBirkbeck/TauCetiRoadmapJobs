# Review of SchemeAndStackFoundations (pull request #1656 at 31b1931)

**Verdict:** needs changes

:robot: Independent AI review, an incremental re-review of the 47 lines changed in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` since `a072c0d`. `Suggested.lean` did not change. Three of the five previous findings are repaired (R02, R03, R05). Two P3 findings remain, with no P1 or P2: the generated description blocks are still stale, and the new Kempf locator in §2.8 is attached to the degree-concentration clause, which the cited notion does not cover. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — The two generated description blocks are still stale

**Location.** Pull-request description, `roadmap-summary` block: “The curve dichotomy drops quasi-compactness …” and “Quasi-compactness follows from the other curve hypotheses.” `merge-order` block: “#1276 (SchemeAndStackFoundations) → **this pull request**” and “#1276 → **this pull request** → #1807 → #1808 → #1854”.

**Claim.** The summary says a hypothesis was dropped, but the head keeps it. The merge-order block lists a merged pull request as a predecessor.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:735` still has `[QuasiCompact (X ↘ Spec (.of k))]`. Commit `c20f72af` (#1276) is on `origin/main`. The description's own free text says the dichotomy “retains main's statement”.

**Repair.** Regenerate both blocks from this head. In `roadmap-summary`, replace the two sentences with: “The curve dichotomy retains main's statement; finite type is expressed by `LocallyOfFiniteType` together with `QuasiCompact`.” In `merge-order`, remove #1276 from both lines, leaving #1656 → #1807 → #1808 → #1854. No roadmap or Lean edit is needed.

## R02 (P3) — §2.8: the Kempf locator is attached to degree concentration, but the notion it cites is the resolution property

**Location.** `README.md:4489–4492`: “the relative support sheaves vanish in degrees different from `i` (Kempf 1978, Theorem 10.9, with the notion of a sheaf locally Cohen–Macaulay with respect to a filtration, p. 358), and the augmentation is a quasi-isomorphism ([BCGP, Theorem 3.9.6] …)”.

**Claim.** Kempf's Theorem 10.9, read with the notion on p. 358, gives the vanishing of `H^k_{Z_i/Z_{i+1}}(F)` for `k ≠ i`.

**Witness.** boxer-calegari-gee-pilloni-2021 lines 3117–3119: Kempf's p. 358 notion means that `Cous_Z(F)` resolves `F`, which is the second clause. On `𝔸²_k`, `Z_1 = {0}`: `Cous(O) = (k[x,y] → 0)` resolves `O`, yet `H¹_{Z_0/Z_1}(O) = H¹(𝔸² ∖ 0, O) ≠ 0`.

The `𝔸²` instance lies outside §2.8, because `𝔸² ∖ 0 → 𝔸²` is not affine. It only shows that a source stating “`Cous_Z(F)` resolves `F`” does not state the vanishing. This is what remains of the previous R04 (see below). The previous report proposed this locator itself, on the condition that it be checked against Kempf's text. The manifest records Kempf as uncertified, so that check could not be made. I did not read Kempf either (see Not verifiable).

**Repair.** Move the Kempf parenthetical to the quasi-isomorphism clause, and give the vanishing a route whose inputs are readable. The vanishing is true under §2.8's hypotheses. Replace lines 4489–4492 with:

“sheaf: the relative support sheaves vanish in degrees different from `i`, and the augmentation is a quasi-isomorphism (Kempf 1978, Theorem 10.9, with the notion of a sheaf locally Cohen–Macaulay with respect to a filtration, p. 358; [BCGP, Theorem 3.9.6](https://www.math.uchicago.edu/~fcale/papers/surfaces.pdf), printed p. 64, whose proof is a reference to the same theorem of Kempf). Below `i` the vanishing holds because every point `x` of `Z_i` has `dim O_{X,x} ≥ i`, hence `depth F_x ≥ i` where `F_x ≠ 0`, and local cohomology of a finite module vanishes below its depth (§2.7 `depth_localCohomology_vanishing`; Stacks, Lemma 47.11.1 (0AVZ)). Above `i` it holds for every quasi-coherent `F`, by induction on `i`, because the strata are affine over `X`: `R^m(X ∖ Z_i → X)_* F = 0` for `m ≥ i`; for `m ≥ 2`, `H^m_{Z_i/Z_{i+1}}(F)` is the direct image to `X` of `R^{m−1}(X ∖ Z_i → X ∖ Z_{i+1})_* F`, a sheaf supported on the stratum `Z_i ∖ Z_{i+1}`, whose higher direct images to `X` vanish; the case `i = 0` is the affineness of `X ∖ Z_1 → X`.”

The *Needs:* line already lists §2.7. Tested on the DVR Check of the same section, the route accounts for each off-diagonal term:
- `H⁰_{Z_1}(O) = 0` holds because `depth R = 1 ≥ 1`.
- `H¹_{Z_0/Z_1}(O) = R¹j_*O_η = 0` holds because `Spec K → Spec R` is affine.
- `H^m_{Z_1}(O) = R^{m−1}j_*O_η = 0` for `m ≥ 2`.

The Kempf and BCGP locators then sit on `K → K/R` resolving `R`. If Kempf's text is later read and one of its statements asserts the vanishing, that statement may be cited in addition.

## Previous findings

- R01 — not repaired: the description still reads “The curve dichotomy drops quasi-compactness” and “#1276 (SchemeAndStackFoundations) → **this pull request** (#1656)”, while `Suggested.lean:735` keeps `QuasiCompact`. Repeated as R01.
- R02 — repaired: “(Stacks, Lemmas 106.13.2, 106.13.4 (0DUP) and 106.13.6 (0DUR), with Lemmas 106.12.2 (0DUH) and 106.12.3 (0DUI) … Rydh, Theorem (4.1), pp. 19–20, for the geometric quotient”; “Theorem (6.12), p. 28”; “Theorem (4.4), p. 20 … Theorem (6.10), p. 27” (`README.md:3823–3836`).
- R03 — repaired: “`IsTame X` for an algebraic stack `X` locally of finite presentation over `S` with finite inertia and coarse space `ρ : X → M` (the `π` of `keel_mori`): `ρ_* : QCoh(X) → QCoh(M)` is exact” (`README.md:3837–3839`), with two new Checks (`README.md:3861–3867`).
- R04 — partly repaired: Kempf 1978 is now in `## References` (`README.md:8876`) and in the manifest (`kempf-1978`, uncertified), but it is cited for “the relative support sheaves vanish in degrees different from `i`”, a clause the cited notion does not cover. Repeated as R02.
- R05 — repaired: “pairwise distinct integral closed subschemes `D_1, …, D_r` of codimension one” (`README.md:5957`), with the repeated-divisor negative control and the `r = 0` case as a Check (`README.md:6003–6007`).

## Verified sound

### Gate, dependency check, elaboration

- Folder diff `a072c0d..31b1931`: `README.md` only, 35 insertions and 12 deletions; `Suggested.lean` is unchanged. No file changed outside the folder against `origin/main`, and the worktree is clean.
- Gate rerun, exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's gate on this head also reports `build=0`.
- Dependency check (`--movable --pr 1656`), exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`: exit 0, 48 warnings, all 48 “declaration uses `sorry`”.
- Carried from the previous report, because `Suggested.lean` is byte-identical:
  - the `#check @name` binder audit (100 declarations, none lost a binder);
  - the one-tactic padding probe (none of the 48 `sorry`s closes);
  - the import list (`import Mathlib` plus 25 `TauCeti.*` modules present at Tau Ceti `2fd255d9`);
  - the headline list. Stated: `Ring.IsJapanese.of_complete_local`, `Ring.IsNagata.of_complete_local`, `Excellence.IsQuasiExcellentRing.isNagata`, `LinearNormalization.exists_linear_normalization`, `Groups.artinBootstrap`, `Formal.grothendieck_existence`, `Formal.algebraize_hom`, `Formal.DeJong.alteration_theorem`, `Formal.DeJong.semistable_alteration_theorem`, `hodge_index`, `weil_bound`. Named as not statable: Keel–Mori, coherent duality, the Brauer class, Picard torsors, Schlessinger, GRR.

### Sources read at their locators (changed passages)

| Passage | Locator | Text read | Result |
|---|---|---|---|
| §1.23 `keel_mori` | Rydh (6.12), p. 28 | rydh-2013 line 1392, between the page 28 and 29 markers (lines 1378, 1426) | matches; the proof (lines 1403–1408) uses (4.4) on the cover and (6.10) to descend, as the README says |
| §1.23 route | Rydh (4.4), p. 20; (6.10), p. 27 | lines 1021 (page 20 marker 1001) and 1336 (page 27 marker 1329) | match |
| §1.23 `finite_quotient_coarse` | Rydh (4.1), pp. 19–20 | lines 995–1004; Definition (2.2)(ii), (iv), (vi), lines 293–311: a geometric quotient is a universal Zariski quotient, so its fibres after base change to `Spec k̄` are orbits | matches, including “gives the bijection on geometric points” |
| same | Stacks 106.13.2 (0DUM), 106.13.4 (0DUP), 106.13.6 (0DUR), 106.12.2 (0DUH), 106.12.3 (0DUI) | More on Morphisms of Stacks extraction, lines 1661, 1699, 1798, 1602, 1613 | all match: 0DUM is well-nigh affine iff `[U/R]` with `U`, `R` affine and `s, t` finite locally free; 0DUP gives `Spec` of the `R`-invariant functions, uniform categorical among affine schemes, a universal homeomorphism; 0DUR makes it uniform categorical among algebraic spaces |
| §1.23 `IsTame` | AOV Definition 3.1 and the remark after it | abramovich-olsson-vistoli-2008 lines 796–806 | matches; the extraction loses the calligraphic/roman distinction between the stack and its moduli space, which is the source of the old R03 slip; the remark gives `.classifying_iff` |
| §2.8 | BCGP Theorem 3.9.6, proof, Remark 3.9.7 | boxer-calegari-gee-pilloni-2021 lines 3092–3121 (page 64 marker 3094) | “whose proof is a reference to the same theorem of Kempf” is accurate (line 3117); R02 for the clause the locator is attached to |
| §2.7, used by the R02 repair | Stacks 47.11.1 (0AVZ) | Dualizing Complexes extraction, line 809 | `H^i_I(M) = 0` for `i < depth_I(M)`, `A` Noetherian, `M` finite |

The seeded sample of this round (§§0.7, 0.27, 0.28, 1.13, 1.25, 2.7, 2.13, 2.16, 3.6, 4.1, 4.3, 4.4, 4.19, 5.1, 5.4) has no target in the changed passages. §2.7 was checked only where the §2.8 repair depends on it (0AVZ above). The README flags no locator as unverified.

### Pinned declarations opened

- `linearlyReductiveAffineGroupSchemeProperty`, `TauCeti/AlgebraicGeometry/AffineGroupScheme/LinearlyReductive.lean:60`. It is the completely reducible comodule property, as `.classifying_iff` uses it.
- `TauCeti.AffineInvariantQuotient.quotient`, `TauCeti/AlgebraicGeometry/Quotient/Affine.lean:57`, `Spec` of `FixedPoints.subring A G`.
- Also read, because the rewritten `finite_quotient_coarse` route touches the same object:
  - `existsUnique_desc_of_finite` (`Quotient/FiniteGroup/UniversalProperty.lean:242`: categorical quotient among all schemes);
  - `projection_eq_iff_exists_smul` and `exists_comp_specComap_eq` (`Quotient/FiniteGroup/Affine.lean:90, 112`: fibres are orbits, and domain-valued points with equal image differ by `G`);
  - `existsUnique_fppfYoneda_comp_eq` (`Quotient/FiniteGroup/Fppf.lean:78`, for free actions only).

  The scope section already credits these facts to Tau Ceti (`README.md:268–271`). The route's Stacks and Rydh locators cover the stack-level passage (algebraic-space targets, flat base change, `[Spec A/G]` against `Spec A`), which the pins lack. No duplication.

### Consumers of the changed targets and ownership

- `picard_units_sequence` is consumed by K3SurfacesAndSymplecticBoundedness (`README.md:90`, vertical components, which are distinct), so the added hypothesis breaks no consumer.
- `finite_quotient_coarse` and `IsTame` are consumed by ModularCurvesPartII (`README.md:178, 335, 337, 1199`), ShimuraVarieties (`README.md:1262`) and PeriodsAndSpecialValues (`README.md:112`), and AlgebraicModuliForArithmeticGeometry cites §1.23 (`README.md:93, 8759`). None depends on the changed locators, and none restates the objects.
- AutomorphicBundlesPartII §5.10 (`README.md:1062–1071`) cites §§2.6–2.8 for the Kempf resolution, not for the concentration, so R02 does not affect it.
- `roadmaps grep` for “tame stack”, “Cousin complex” and “locally Cohen–Macaulay with respect” finds no second owner.
- Overlaps: #1807, #1808 and #1854 change this folder, and the description states the order #1656 → #1807 → #1808 → #1854. No cited id is dropped, none is defined only by an open revision, and this pull request drops none.

### Adversarial table

Rows marked “r88” are carried unchanged from the previous report (head `a072c0d`), whose statements this diff leaves untouched. The other rows are recomputed for the changed statements.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §1.23 `keel_mori` (locators changed) | `B(ℤ/2)` over `k = k̄`; `[𝔸¹/𝔾_m]` | Coarse space `Spec k`, `π` proper and quasi-finite. Inertia `𝔾_m` at `0` is not finite, so excluded; its categorical space `Spec k` has two geometric orbits against one point | Pass; locators verified |
| §1.23 `finite_quotient_coarse` (route rewritten) | `G = 1`; `ℤ/2` on `k[x]`, `x ↦ −x`, `char k ≠ 2`; `ℤ/2` on `𝔽₂[x]`, `x ↦ x+1`; `ℤ/2` acting trivially on `k`; `ℤ[i]` with conjugation, mod 2 | `A^G = A`. `A^G = k[x²]`, fibre over `a²` is `{a, −a}`, one point over `0`. `A^G = 𝔽₂[x²+x]`, fibre `{a, a+1}`. `[Spec k/(ℤ/2)] = B(ℤ/2)`, coarse `Spec k`. Invariants `ℤ`; mod 2 the action is trivial on `𝔽₂[ε]/(ε²)` (dimension 2) against `ℤ ⊗ 𝔽₂ = 𝔽₂`: consistent, since “uniform” means flat base change and `ℤ → 𝔽₂` is not flat | Pass |
| §1.23 `IsTame` (definition repaired) | `B(ℤ/p)` and `Bμ_p` over `𝔽_p`; `B(ℤ/ℓ)`, `ℓ ≠ p`; wrong model `ρ = 𝟙_X` | `0 → 𝔽_p → J₂ → 𝔽_p → 0`: invariants `𝔽_p → 𝔽_p → 𝔽_p` with the last map zero, not surjective, `H¹ = 𝔽_p`: not tame. `μ_p`: `ℤ/p`-graded, degree 0 exact: tame. Maschke: tame. `(𝟙)_*` exact on all three; excluded since `ρ_*` lands in `QCoh(M)` | Pass |
| §2.8 `relativeSupportCohomology_concentration` | DVR, `Z_1` closed point; `k[x,y]_{(x,y)}`, `Z_1 = V(x)`, `Z_2 = {𝔪}`; `𝔸²`, `Z_1 = {0}` (non-affine stratum) | Diagonal `K`, `K/R`; off-diagonal `H⁰_{Z_1} = 0` (depth 1), `R¹j_*O_η = 0`. `H^{>0}_{Z_0/Z_1} = 0` (`R[1/x]` affine), `H^{≠1}_{Z_1/Z_2} = 0` (Cartier divisor on the punctured spectrum, affine stratum), `H^{≠2}_𝔪(R) = 0` (depth 2). Outside hypotheses: `Cous(O)` resolves `O` but `H¹_{Z_0/Z_1}(O) ≠ 0` | Statement true; R02 (locator) |
| §2.8 `kempf_cousin_resolution` | DVR; `k[x,y]/(xy, y²)`, `Z_1` origin; `𝔸¹ ⊇ V(t)` | `K → K/R`, kernel `R`, cokernel `0`. `H⁰_{Z_1}(O) = (y) ≠ 0`: not injective. `k[t,t⁻¹] → k[t,t⁻¹]/k[t]`, kernel `k[t]` | Pass |
| §3.4 `picard_units_sequence` (hypothesis repaired) | `𝔸¹`, `r = 1`; `r = 2`, `D_1 = D_2 = {0}`; `r = 0`; `ℙ¹`, `D = {0}, {∞}` | `k^× → k^× × t^ℤ → ℤ → 0 → 0` exact. Kernel `ℤ²` against image `{(n,n)}`, now excluded. Identities, exact. `tⁿ ↦ (n, −n)`; `ℤ² → Pic ℙ¹ = ℤ`, `(a,b) ↦ a+b`, kernel `{(a,−a)}` = image, onto `ℤ`, `Pic 𝔾_m = 0` | Pass |
| §0.2 `relativeSpec_modulesEquiv` (r88) | `S = Spec k`, `A = k[t]`, `F = O`; `A = O_S`; `G = 0` | `p^*p_*F = A ⊗_k A`, `t ⊗ 1 − 1 ⊗ t ≠ 0` in the kernel of multiplication; over `p^*A` gives `A`. Identity. `0 ↦ 0` | Pass |
| §0.11 `unramified_criteria` (r88) | `𝔽_p(t^{1/p})/𝔽_p(t)`; `k[ε]/k`; separable `L/K` | `Ω = L·dt^{1/p} ≠ 0`, inseparable: both false. `Ω = k·dε`, not reduced: false. `Ω = 0`, open diagonal: true | Pass |
| §0.11 `absoluteIntegralClosure` (r88) | `Spec k̄`; `Spec ℝ`; `Spec k[t]` | `Spec k̄`. `Spec ℂ ≇ Spec ℝ`. `t^{1/n}` integral, not in `k[t]` | Pass |
| §0.14 henselian characterisations (r88) | `(ℤ_p, p)`; `(ℤ_(3), 3)`; `I = 0`; `(ℤ_p ⊗ ℤ_p, p)` | Henselian. `T² − 7`: simple root `1` mod 3, no root in `ℚ`: not henselian. `Tⁿ(T−1)` root `1`: all five hold. `Spec` disconnected | Pass |
| §0.27 annihilator formulas (r88) | `ℤ → ℤ[1/2]`, `(4) ∩ (6)`; `k[x,y] → k[x]`; `ℤ/4 → ℤ/2`, `m = 2`; `ℤ → ℤ/2`, `f = 2`; `⊕ℤ/n` over `ℚ` | `(12) ↦ (3)`. `(xy) ↦ (x²) ≠ (x)`. `(2) ↦ 0` against `(1)`. `Ann = (2) ↦ 0` on both. `0` against `ℚ` | Pass |
| §0.30 normality, ramification (r88) | `k[t², t³]`; `x ↦ x²`, `char ≠ 2`; `y − x²`, `y² − x³` in `k[x,y]_{(x,y)}` | `t` integral, not in ring. `e = 2` at `0`, `e = 1` at `1`. `∉ 𝔪²` regular; `∈ 𝔪²`, `dim 𝔪/𝔪² = 2` | Pass |
| §1.3 `IsAlgebraicSpace` (r88) | `h_{Spec L}/Gal`, `L/K` quadratic; constant presheaf `{0,1}` | Two classes on `Spec L ⊔ Spec L`, one on each component: not a sheaf. `F(∅) = 2 ≠ 1` | Pass |
| §1.16 contracted product (r88) | `Spec L ×^{ℤ/2} Spec L`; `P ×^G pt`; frame torsor of `O(1)` | `(L ⊗ L)^G = K × K`, two `K`-points; presheaf quotient `∅`. `pt`. Degree `+1` | Pass |
| §1.20 points, properness (r88) | `B(ℤ/2)`; `B𝔾_m`; `ℂ[[t]]`, `K(√t)` | One point, `Spec k ×_{BG} Spec k = G` two points. Diagonal fibre `𝔾_m` not proper. `v(t) = 1` odd, no lift; after `t = u²` trivial | Pass |
| §2.20 dualising complex (r88) | `𝟙_S`; `ℙ¹_S`; `k[x,y]/(x,y)²`; nodal cubic; two planes in `𝔸⁴`; `ℙ²` | `O_S[0]`. `O(−2)[1]`. Socle 2-dimensional, not invertible. `deg ω = 0`. Depth 1 < 2. `h²(O(−3)) = 1 = h⁰(O)` | Pass |
| §3.4 `picard_excision_sequence` (r88) | `𝔸¹ ⊇ {0}`; cone `xy = z²` | `ℤ → 0 → 0 → 0`. `Pic = 0 → Cl = ℤ/2` injective, not onto | Pass |
| §3.4 `gradedPicardGroupoid` (r88) | `Spec(k × k)`, `f = (0,1)`; `𝔸¹_ℚ`, `f = δ_0` | Symmetry `(1, −1)`. Would need a unit `−1` at `0` and `1` generically: none | Pass |
| `lineBundleClass_spec_equiv_pic` (r88) | field; `R = 0`; `ℤ[√−5]` | Trivial; trivial; `ℤ/2` on both, class of `(2, 1+√−5)~` | Pass |
| §3.5 `lineBundleNorm` (r88) | `z ↦ z²` on `ℙ¹`; hyperelliptic `C → ℙ¹`; `𝟙` | `Norm π^*O(1) = O(2)`. `det π_*O = O(−g−1)`. Identity | Pass |
| §4.2 `C_Λ` (r88) | `ℤ/p²`; `ℤ_p`; `k[ε] ×_k k[ε]`; `k[x]/(x³) → k`; `k[x]/(x²) × k` | Artinian local. Not Artinian. `dim 𝔪/𝔪² = 2`. Kernel `(x)`, `x² ≠ 0`, not small. Two maximal ideals | Pass |
| `hodge_index` (r88) | `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)`; `H = (1,0)`; `H = (1,−1)`; `ℙ² ⊔ ℙ²`; blow-up, `H = 2L + E`, `D = L + 2E` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0` excluded. `H² = −2` excluded. Not integral, excluded. `H² = 3`, `D·H = 0`, `D² = −3` | Pass |
| §5.10 reduction, adjunction, RR, Noether (r88) | `E = (D·A)H − (H·A)D`; plane curve of degree `d`; `O(a,b)`; `ℙ²`, `ℙ¹×ℙ¹` | `E·A = 0`. `g = (d−1)(d−2)/2`. `ab + a + b + 1`. `12 = 9 + 3`, `12 = 8 + 4` | Pass |
| `weil_bound` (r88) | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `0 ≤ 0`. `|3 − 3| = 0 ≤ 2√2` | Pass |
| `exists_linear_normalization` (r88) | `n = 0`; `𝔽₂[X,Y]/(XY(X+Y))` | `d = 0`. Every `𝔽₂`-linear form divides the relation: excluded by `Infinite k` | Pass |
| Nagata/Japanese headlines (r88) | `k[[x,y]]`; a field; `ℤ` | Nagata; Japanese; G-ring and J-2, Nagata | Pass |
| `artinBootstrap` (r88) | `a = 𝟙_U`; `Spec L → h_{Spec K}` | `U` a space. `F = h_{Spec K}` | Pass |
| `Torsor.trivial_iff_section`, `torsorRepresentability` (r88) | `P = G`; `Spec ℂ` over `ℝ`, `ℤ/2` | Unit section. No `ℝ`-point, nontrivial | Pass |
| `grothendieck_existence`, `algebraize_hom` (r88) | `Spec A`; same-support ideal; `X = ∅` | `M = lim M_n`. Same completion. Unique empty map | Pass |
| `alteration_theorem`, `semistable_alteration_theorem` (r88) | `𝔸¹`, `Z = {0}`, `∅`, `X`; `ℤ_p[x,y]/(xy − p²)` | `ℙ¹`, `B = {0, ∞}`; `{∞}`; excluded by `Z ≠ ⊥`. One blow-up, `uv = p` | Pass |
| Azumaya headlines (r88) | `A = 0`, `R ≠ 0`; `R = 0`; `M_n(R)`; `ι = ∅` | Both false; both true; rank `n²`; `A = 0` | Pass |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` (r88) | `∅`; `ℙ¹`; `𝔸² ∖ 0` | `⊥ ≤ d`. `H¹(O(−2)) = k`. `H¹(O)` infinite-dimensional | Pass |
| `flat_over_dedekind`, `genus_of_finite_etale`, `vectorBundleDegree_pullback`, `CH_coprod` (r88) | `k[t,x]/(tx)`, `(x², tx)`; `[n]` on `E`; `z ↦ z²`; `I = ∅` | Excluded, excluded. `0 = n²·0`. `2 = 2·1`. Zero cycles | Pass |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR (r88) | pins, by object | No carrier in either pin; named in the docstring | Pass |

### Remarks on the changed text (no change requested)

- “Stacks, Lemmas 106.13.2, …” gives the number of 0DUM but not its tag, while the neighbouring lemmas carry tags. The number is correct (line 1661).

## Not verifiable

- `kempf-1978` (Theorem 10.9, p. 358): the manifest records it as uncertified (paywalled, cited by its locator), so it is settled and was not requested. The only text read is BCGP's report of it (lines 3100–3126), which R02 relies on.
- `hartshorne-1977` II, Proposition 6.5 (`picard_units_sequence`): uncertified and settled. The statement was checked mathematically (table), not against the text.
- Fulton 1998, Proposition 1.8: not read. No legal copy was sought beyond the manifest.

## Source issues

- none
