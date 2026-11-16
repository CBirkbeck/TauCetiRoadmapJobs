# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at 89aa877)

**Verdict:** needs changes

## Previous findings

- none: the previous review, of `a7ab0ad`, had no finding.

## R01 (P2) — Two headlines statable at the pins are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/README.md` lines 84–86: "it is not an exhaustive acceptance test, and the other headlines are targets of the same standing, stated in prose"; `Suggested.lean` line 12: "One headline is not stated here".

**Claim:** The Summary's "group of 120 symmetries" (6.1, README lines 918–925) and "Dougall's bilateral sum" (6.6, lines 1046–1053) are headlines with no Lean statement, and the module docstring names neither as not statable. Both are statable with simple definitions.

**Witness:** A scratch copy of `Suggested.lean` with the block below before `end` elaborates: exit 0, 63 `sorry` warnings, no error. The closure has 120 elements (computed); the invariant is constant on all 120 images (table).

**Repair:** Add the block to `Suggested.lean` under Layer 6, give the names in 6.1 and 6.6, and replace README lines 84–86 by "`Suggested.lean` states the headline theorems; the remaining targets are stated in prose."

```lean
/-- The Pochhammer symbol at an integer index: `(x)ₖ` for `k ≥ 0`, `(−1)ᵐ/(1 − x)ₘ` at `k = −m`. -/
def bilateralPochhammer (x : ℂ) : ℤ → ℂ
  | Int.ofNat n => poch(x, n)
  | Int.negSucc n => (-1) ^ (n + 1) / poch(1 - x, n + 1)

/-- 6.6: Dougall's bilateral sum. -/
theorem hasSum_bilateral_dougall {a b c d : ℂ} (h : 1 < (c + d - a - b).re)
    (hc : ∀ k : ℕ, c ≠ -k) (hd : ∀ k : ℕ, d ≠ -k) (ha : ∀ k : ℕ, 1 - a ≠ -k)
    (hb : ∀ k : ℕ, 1 - b ≠ -k) :
    HasSum (fun k : ℤ => bilateralPochhammer a k * bilateralPochhammer b k /
        (bilateralPochhammer c k * bilateralPochhammer d k))
      (Gamma c * Gamma d * Gamma (1 - a) * Gamma (1 - b) * Gamma (c + d - a - b - 1) *
        ((Gamma (c - a))⁻¹ * (Gamma (d - a))⁻¹ * (Gamma (c - b))⁻¹ * (Gamma (d - b))⁻¹)) := sorry

/-- `s = d + e − a − b − c` at `x = (a, b, c, d, e)`. -/
def thomaeExcess (x : Fin 5 → ℂ) : ℂ := x 3 + x 4 - x 0 - x 1 - x 2

/-- The generators of the Thomae group: the map of the symmetric form and the permutations of
`(a, b, c)` and of `(d, e)`. -/
def thomaeGenerators : Set (Function.End (Fin 5 → ℂ)) :=
  {fun x => ![x 3 - x 0, x 4 - x 0, thomaeExcess x, thomaeExcess x + x 1, thomaeExcess x + x 2]} ∪
    {f | ∃ σ : Equiv.Perm (Fin 5), (∀ i, (σ i : ℕ) < 3 ↔ (i : ℕ) < 3) ∧ f = fun x => x ∘ σ}

/-- 6.1: the Thomae group has `120` elements. -/
theorem natCard_closure_thomaeGenerators :
    Nat.card (Submonoid.closure thomaeGenerators) = 120 := sorry

/-- 6.1: `𝐅({a, b, c}; {d, e}; 1)/Γ(s)` is invariant under the Thomae group. -/
theorem regularizedHGFun_thomae_invariant {g : Function.End (Fin 5 → ℂ)}
    (hg : g ∈ Submonoid.closure thomaeGenerators) {x : Fin 5 → ℂ}
    (hx : 0 < (thomaeExcess x).re) (hgx : 0 < (thomaeExcess (g x)).re) :
    regularizedHGFun {x 0, x 1, x 2} {x 3, x 4} 1 * (Gamma (thomaeExcess x))⁻¹ =
      regularizedHGFun {g x 0, g x 1, g x 2} {g x 3, g x 4} 1 *
        (Gamma (thomaeExcess (g x)))⁻¹ := sorry
```

## R02 (P3) — The limit named for Sheppard's transformation gives a different identity

**Location:** `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/README.md` line 776: "the limit `f → ∞` with `f − c` fixed of Whipple's transformation, termwise in a finite sum".

**Claim:** In the lettering of the Whipple bullet (lines 762–765), that limit is `(e − a)ₙ/(e)ₙ · ₃F₂(−n, a, d − b; d, a − e − n + 1; 1)`, not the displayed right side with the factor `(d − a)ₙ (e − a)ₙ/((d)ₙ (e)ₙ)`.

**Witness:** `n = 3`, `(a, b, d, e) = (0.3, 0.4, 1.6, 1.2)`. `f = 10⁶`: factor `0.587002`, inner sum `1.469551`. Displayed: `0.386749`, `2.230464`. Whipple's bottom `d = 10⁶` with `(e, f) = (1.6, 1.2)`: `0.386749`, `2.230463`.

**Repair:** "the limit `d → ∞` of Whipple's transformation, where the balance condition keeps `d − c` fixed, with `(e, f)` then renamed `(d, e)`, termwise in a finite sum".

## Verified sound

Values are in double precision; "both" means the two sides of the statement.

| Statement | Instances tried | Left side / computed data | Right side / comparison | Result; change |
|---|---|---|---|---|
| 1.2 definition, Check 1 | `𝐅({0.3,0.5,0.7}; {−1,1.9}; 0.4)`; `F` there | `0.010091837669` | `F = 0` (junk of `Γ(−1)`) | agrees with README |
| 1.2 principal branch (seeded), Layer 1 Examples | `F({0.3,0.5,0.7}; {1.2,1.9}; z)`, `z = 2 ± i`, `−3`, continued by the equation of 3.4 | `1.055494823002 ± 0.120380594181i`; `0.913947180866` | README values; `F(1,1;2;2+i)` equals `−log(1−z)/z` to 12 digits | agrees |
| `_shift_bottom`, `_shift_top` | `a₀ = 0.3+0.1i`, `b₀ = −1` (a pole), `z = 0.4−0.2i` | `0.007989454945 − 0.010080314793i` | same for both relations | holds at a pole of `Γ(b₀)` |
| `_eq_eulerIntegral` (seeded 1.2) | `(a₀,b₀) = (0.3,1.2)`, inner `{0.5,0.7};{1.9}`, `z = −3` | integral `1.03499` | `1.03497` (quadrature error `10⁻⁵`) | agrees; `p = q + 1` inside iff outside |
| `differentiableOn_…`, `_conj` (seeded 1.4) | values at `2 + i` and `2 − i` | conjugates to 12 digits | set `{p = q+1 → 1 − z ∈ slitPlane}` is open | no change |
| `norm_…_le` (1.5) | `p = q = 0` | `‖e^w‖ = e^{Re w}` | `C = 1`, `K = 0` | consistent |
| 1.6, four theorems (seeded) | coefficient size for `p = q + 1` | `n^{Re(Σ𝐚−Σ𝐛)−1}` | summable iff `Re γ > 0`; terms `↛ 0` iff `Re γ ≤ −1` | matches DLMF-16.2 lines 211–218 |
| `_confluence_top` (seeded 2.1) | `a={0.3}`, `b={1.4}`, `z=1.5−2i`; `α = 10³, 10³i, −10³, 10⁵e^{2.5i}` | `0.9579−0.7523i`, `0.9591−0.7516i`, `0.9598−0.7528i`, `0.958860−0.752546i` | limit `0.958851−0.752550i` | converges in every direction |
| `_confluence_bottom` (seeded 2.1) | `{0.3,0.6};{1.4}`, `z=0.3+0.2i`; `β = 10³e^{2.2i}`, `10⁵e^{−2.2i}`; control `z=0.9`, `ph β=2.6` | `1.040664+0.034173i`, `1.040675+0.034167i`; control `10²¹` at `|β|=200` | `1.040675+0.034167i`; control `1.2374` | holds; the `sin δ` bound is needed |
| `_shift_16_11_10` (seeded 2.2) | `{0.3,0.5,0.7};{1.2,1.9}`, `m=2`, `r=50,100,200`, `z=2+i` | `r²·|rem|`: `k=1`: `0.1556, 0.1568, 0.1573`; `k=2`: `2.14, 2.18, 2.32` | bounded | holds off the disk |
| `_shift` 16.11.11 (2.2) | `p=1`, `q=3`, `m=2`, `z=3−2i`, `r=20,40,80` | `r⁴·|rem|`: `4.29, 5.25, 5.83` | bounded | holds |
| 16.3.1–16.3.4, `thetaShift_*` | coefficients by hand; `n=1`, `γ=0.6+0.2i`, `z=0.4+0.1i` by differences | `1.1060903+0.0770432i`; `0.4323941+0.1781645i`; `−0.7137009+0.7343131i` | same to `10⁻⁹` | regularized forms hold |
| 16.3.6; `_contiguous_16_3_7` (seeded 3.2) | `b=1.7`, `z=2−i`; `(0.3,0.4,0.5,1.6,1.2)`, `z=0.37` and `2+i` | residuals `0` to 12 digits | `0` | matches DLMF-16.3 lines 243, 270 |
| 3.3 (seeded), `_equation`, `_equation_16_8_4` | `q=1,p=2`; `q=0,p=1`; `p=q=1` | `β₁=c`, `α₁=−(a+b+1)`; `(1−z)w′−aw`; `zw″+(b−z)w′−aw` | Gauss, binomial, Kummer equations | coefficients right |
| `solution_16_8_6`, `wronskian_solution_16_8_6` (seeded 3.5) | `b={0.4,0.75}`, `z=0.37`, `a={0.3,0.55,0.8}`, `{0.3,0.55}`, `{0.3}` by differences | `−1.4131043`, `−0.6444876`, `−0.4451697` | formula: `−1.4131043`, `−0.6444876`, `−0.4451697` | agrees with README |
| `wronskian_solution_16_8_7` | Abel exponent; `q=0` | `(−z)^{−Σ𝐚−q(q+1)/2}(1−1/z)^{Σ𝐛−Σ𝐚−q}` | `(1−z)^{−a}=(−z)^{−a}(1−1/z)^{−a}` on `ℂ∖[0,∞)` | consistent |
| Lerch 16.4.2_5; `_reverse_16_2_3` | `(a,c,n)=(0.3+0.1i,1.7,5)`; `p=2,q=3,m=4,z=0.8−0.5i` | `1.370806724+0.149535193i`; `1.062200763+0.986655729i` | same | holds |
| `_saalschutz`, `_dougall_7F6` | `n=3` complex; README instances | `0.993487081+0.371033982i`; `4/3`; `1.036115844321` | same | holds |
| `_dixon_even`, `_watson_even`, `_dzrbasjan` | README instances; odd `n=3` | `−6`; `2.555555555556`; `1.626123852610+0.868361575823i`; `1.071004407534+0.031934828317i`; odd sums `0` | same | holds |
| `_whipple_4F3`, `_whipple_7F6` (seeded 4.5) | `n=3,(0.3,0.4,0.5,1.6,1.2)`; `n=2,(1.3,0.4,0.25,0.3,0.2)` | `1.032015061693`; `0.999443560621` | same | matches DLMF-16.4 lines 718, 765 |
| `_sheppard` (seeded 4.5; R02) | README instances | `0.862630208333`; `1.111885332422+0.118354930399i` | same | statement holds; route: R02 |
| `_zero_one_mul` | `(0.7,1.3,2−i)`; `a=−1` (pole) | `9.694617625480−20.117508138201i`; `−8.937150051−21.120901927i` | same | regularized form holds at a pole |
| `_sq_clausen` | `(0.3,0.45)`, `z=3+2i` | `0.723868385168+0.562866443769i` | same | holds off the disk |
| `hasSum_…_sq` 16.12.3 | `c=3/2`; `a=−1,b=c=1`; generic | `0.907727414+0.034954904i`; `0.27+0.36i` | same; `(1−z)²` | denominators safe as claimed |
| `_quadratic_16_6_1` (seeded 5.2) | `z=0.9i`; control `z=−2.5` | `0.941241977846+0.132602927753i`; control `0.7928−0.1127i` | same; control `0.7186−0.0284i` | holds on the disk only |
| `_cubic_16_6_2` (seeded 5.2) | `(a,b)=(0.3+0.1i,0.8)`, `z=0.3+0.35i`, `−0.45+0.1i`; image of `‖z‖<½` | `1.006140992+0.008440195i`; `0.990432362+0.001618156i`; no real value `≥ 1` on 2000 circles | same | image avoids the cut |
| `hasSum_fieldsWimp` | `p=0,q=1,r=s=0` at README points; `p=1,q=2,r=s=1` | `12.461191861182`; `−0.135803789514`; `0.746239138−0.047283012i` | same | holds |
| `hasSum_norlund` | `q=1`, `(z,ζ)=(0.2+0.3i,1.4−0.5i)`, `(−3+2i,0.5+0.6i)` | `1.033430470+0.079515408i`; `0.822958841−0.083537686i` | same | `zζ` stays in the cut plane (by hand) |
| `_thomae`, `_thomae_symmetric` (seeded 6.1) | `(0.3,0.4,0.5,1.6,1.2)`; complex point | `1.275774069278` (unregularized `1.046642322110`); `3.816566140949`; `1.337085341−0.045584121i` | same | matches DLMF-16.4 lines 593, 624 |
| 6.1 symmetry group (R01) | closure of generators as integer matrices; `x=(0.3+0.2i,0.4−0.1i,0.5,1.6+0.3i,1.2)` | order `120`; element orders `1,2,3,4,5,6` in numbers `1,25,20,30,24,20`; 10 forms `s∘g`, minimum `0.3` at the base point | invariant `1.520357706−0.091666487i` at all 120 images, deviation `2·10⁻¹³` | true as stated; R01 |
| `_three_term_16_4_12`, `_16_4_13` | `(0.3,0.4+0.1i,0.5,2.6,1.9)`; `(…,1.6,1.2)` | `0.108626266+0.026306876i`; `1.046087107+0.013479919i` | same | holds |
| `_rogersDougall`, `_dixon` | README instances | `0.838092195013` (unregularized `1.039621674494`); `1.182497219411` (`0.986538134922`) | same | holds; `h₁` of Rogers–Dougall and `h₂` of Dixon follow from the convergence hypothesis |
| `_watson`, `_whipple` (seeded 6.4) | README instances; Whipple at complex `d=−1.4+0.1i` | `1.176543388030` (`1.171017670070`); `1.514143279405` (`1.233508789589`); `0.112127589+0.133948108i` | same | matches DLMF-16.4 lines 351, 383, 400, 433 |
| `_whipple_7F6_16_4_15` (seeded 6.5) | `m=1`, `(1.3,1.5,1.8,0.2,0.3,0.25)`; convergence exponent | `1.075457341814`; `Σ𝐛−Σ𝐚 = 4a+4−2S` | same; `< 2` condition | holds |
| 6.6 Dougall bilateral (R01) | complex generic; `a=−1`; `(0,½,2,½)` by hand | `1.130726103+0.443532570i`; `1.516303777−0.040391126i`; `1−1=0` | same; `Γ(0)⁻¹=0` | true as stated; R01 |
| `_eq_laplace`, `_inverseLaplace_16_5_4` | `p=q=1`, `z=0.4+0.6i`; `p=q+1`, `b₀=3.5`, `z=0.5+2i`, `c=0.7` | `1.096790477+0.192016951i`; `0.340289279+0.026310219i` | same to `10⁻⁹` | holds with `Re z < c < ‖z‖` |
| `_eq_mellinBarnes` (seeded 7.2) | README instances; `z=−2+1.5i` | `0.843329228801`; `0.578540704346`; `2.941377002+0.257198426i` | same | matches DLMF-16.5 lines 59, 108–114 |
| `_eq_loopIntegral` (seeded 7.2) | `p=q+1`, `z=0.5` (on the cut of the power); `p=q`, `z=3` | `3.843529`; `6.161026` | `3.843526`; `6.161025` | orientation and sign right |
| `_eq_balancedH`, `_connection_infty` (seeded 7.3) | README parameters, `z=−3+i`, `0.5+0.4i`, `2.5−0.7i`, `−0.3−0.2i` | `5.158671934−1.827385832i`; `5.909814094−1.808524128i`; `6.377444531−3.145555670i`; `5.666185188−2.037550316i` | same | matches DLMF-16.8 line 357, DLMF-16.11 lines 115, 320 |
| `centeredDomain`, `_eq_centered_expansion` (seeded 7.3) | `q=1`, `a={0.3,0.8+0.2i}`, `b={1.4}`; `(−4+i,0.5+0.3i)`, `(5+2i,1+i)`; control `(3+i,2i)` | `2.634944488−0.554129870i`; `2.652515793+0.964635283i`; control `3.1254+1.0125i` | same; control `2.5302−4.1593i` | holds on the component; fails off it, as the README says |

- DLMF locators checked against the text: 50 equations and 22 condition sentences in DLMF-16.2, 16.3, 16.4, 16.5, 16.6, 16.8, 16.10, 16.11, 16.12; all agree with the README and the Lean statements.
- Library declarations opened at the pins: Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean` lines 67, 192, 201, 249, 302, 342, 414; Tau Ceti `Analysis/SpecialFunctions/RegularizedHypergeometric.lean` line 53; no pinned declaration states a target; the 50 `#check` lines elaborate.
- Cross-roadmap citations resolved on main: SpecialFunctionsHypergeometric 1.2–1.4, 4.2, 4.3, 5.1, 6.3, 7.3; ZerosOfLFunctions 1.2, 1.3; AsymptoticExpansions 8.2, 8.6, 8.7 (14 sections, all present with the cited content).
- Elaboration of `Suggested.lean`: exit 0, 60 warnings, all `declaration uses sorry`. One-tactic probe (`rfl`, `simp` with the definitions unfolded, `infer_instance`): 0 of 60 theorems close.
- Worker gate at `89aa877`: every check passed. Dependency check: `depcheck: 253 roadmaps, 2397 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Title and description against the head: new roadmap, 7 layers as listed, 60 theorems, three Tau Ceti imports and the `#check` block, the Beyond list, the three suppliers; no sentence contradicts the head.
- Overlap check: read SpecialFunctionsAppell, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsStruve, SpecialFunctionsConfluent (open) and SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, AsymptoticExpansions (main); nothing shared. SpecialFunctionsGamma 8.1 owns Hankel's loop integral, this roadmap the vertical-line form; SpecialFunctionsHypergeometric 4.2 owns the Gamma form of Dougall's bilateral sum, which 6.6 cites.
- Source independence: 8 passages compared with 1 source (DLMF Chapter 16), none shared; largest share DLMF Chapter 16, 58 of 116 locators; contents compared with DLMF Chapter 16: independent (Layer 1 draws on §§16.2 and 16.5, Layer 2 on §§16.8(iii) and 16.11(iii), Layer 5 on §§16.6, 16.10 and 16.12, Layer 7 on §§16.5, 16.8 and 16.11). The six books could not be read.

## Not verifiable

- Andrews–Askey–Roy (25 locators), Beals–Wong (5), Paris–Kaminski (2), Srinivasa Rao–Lakshminarayanan (3): no legal copy found (publisher landing pages only); theorem numbers and pages not checked.
- Duverney (14 locators) and Koepf (9): paywalled; theorem numbers and pages not checked.
- For the seeded targets 1.2, 1.6, 2.1, 3.2, 4.5, 6.1, 6.4, 6.5 and 7.2 the book locators are therefore unverified; their DLMF locators were verified.
- "Nor is there a WZ pair in Watson's top parameter `a` (Koepf, p. 110)" (README line 989): not checked.

## Source issues

- **Error** in DLMF Release 1.2.8 at 16.4.8, §16.4(ii) (DLMF-16.4 line 448, unpaginated): the source says Džrbasjan's sum is 16.4.7 in the case `c = −n`; it should be a separate terminating sum, since at `n = 0`, `a = d = ½` the regularized values are `1/π` and `2/π`; affects nothing.
- **Error** in DLMF Release 1.2.8 at 16.8.9, §16.8(ii) (DLMF-16.8 lines 393–394, unpaginated): the source says `|z − z₀| > max(|z₀|, |z₀ − 1|)` and `|ph(z₀ − z)| < π` suffice; it should be restricted to the component containing `z₀ − t` for large `t` (at `q = 1`, `(z, z₀) = (3 + i, 2i)` the two sides differ); affects a stated result.

## For the human reviewers

- **Licence.** `README.md` lines 1262–1279 name the author's `lean-DLMF` (Apache-2.0) as prior proofs and say reused code carries attribution; `Suggested.lean` was not compared with that repository.
- **Not tested.** Six of the seven sources (58 of 116 locators) are books that could not be read legally; wording and arrangement were compared with DLMF Chapter 16 only.
