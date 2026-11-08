# Review of ErdosProgressionPowers (pull request #1336 at 4b475b9)

**Verdict:** needs changes

This is an incremental re-review of the 112 lines changed since 8916ae8. There is one finding, P3, and nothing blocking. Both findings of the previous review are repaired. The repair of the second one added a false sentence about the EllipticCurves roadmap on main, in two places; that sentence is R01 below. The gate passes at this head (re-run here, build included). `lake env lean` gives only the eight `sorry` warnings. The dependency check reports 0 problems. Nothing changed outside the folder.

## R01 (P3) — The README says no roadmap targets the Frey curve; EllipticCurves on main declares it

**Location.** `TauCetiRoadmap/ErdosProgressionPowers/README.md:58`–60 (Scope and ownership): “The generic Frey–Hellegouarch equation is the pinned Tau Ceti `TauCeti.freyCurve`, and the geometric torsion subgroup is Mathlib's `AddSubgroup.torsionBy`; neither is a target of any roadmap.” Lines 363–365 (From TauCetiRoadmap.EllipticCurves): “The Frey–Hellegouarch model itself is the pinned `TauCeti.freyCurve` (From Tau Ceti), not a target of EllipticCurves”.

**Claim.** No roadmap, and in particular not EllipticCurves, states the Frey–Hellegouarch curve.

**Witness.** On main, `TauCetiRoadmap/EllipticCurves/README.md:1583` (§Worked examples, “acceptance criteria”) states `freyCurve A B`, the curve y² = x(x − A)(x + B) over any commutative ring. Its `Suggested.lean:1164` declares `def freyCurve … : WeierstrassCurve R` with the coefficients (0, B − A, 0, −AB, 0). The pinned `TauCeti.freyCurve` (`FreyCurve/Basic.lean:115`) formalises that curve.

**Repair.** At lines 58–60, replace the quoted sentence with: “The Frey–Hellegouarch curve of EllipticCurves' worked examples is formalised at the pin as Tau Ceti `TauCeti.freyCurve`, and the geometric torsion subgroup is Mathlib's `AddSubgroup.torsionBy`; this roadmap consumes both from the pins.” At lines 363–365, write: “The Frey–Hellegouarch curve of EllipticCurves' worked examples is consumed as the pinned `TauCeti.freyCurve` (From Tau Ceti); Layer 1 specializes it at (a,c).” Both sentences agree with EllipticCurves `README.md:1583`, its `Suggested.lean:1164` and the pinned file. The Lean is unaffected: the body of `progressionFreyCurve` stays `TauCeti.freyCurve a c`.

## Previous findings

- R01 — repaired: `Suggested.lean:88`–89 now reads `HasFullRationalTwoTorsion E := Nat.card (AddSubgroup.torsionBy E.toAffine.Point 2) = 4`. `ellTorsion` is deleted, and `comparison_curve` (l.110–113) uses `AddSubgroup.torsionBy` over `Ω`. EC.6 (README l.657), l.1188 and l.1210 cite EllipticCurveModularityPartII §5.1.
- R02 — repaired: `Suggested.lean:73` defines the curve as `TauCeti.freyCurve a c` and imports `…FreyCurve.Basic` at l.5. The README cites the pinned declaration at l.248–252 (From Tau Ceti) and l.1032 (§1.2 *Needs:*). The repair added the false “not a target of EllipticCurves” sentence, raised as R01 above.

## Verified sound

**Gate, build, dependencies.** I re-ran the gate on this head:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check (`--movable`, against the content repository's main) printed:

```text
depcheck: 244 roadmaps, 2464 edges, 0 problem(s)
```

It printed no UPWARD, CYCLE or moved line. In `ORDER.txt`, EllipticCurveModularityPartII is line 194 and this roadmap is line 195. EllipticCurves is on main. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml, and only the first two changed. `lake env lean` on `Suggested.lean` took 4 s and gave exactly eight `declaration uses sorry` warnings (l.94, 105, 130, 143, 149, 155, 164, 172), nothing else. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Both `TauCeti.*` imports (`…TateAlgorithm.Reduction.Conductor`, `…FreyCurve.Basic`) have object files at the pin.

**Signatures.** On a scratch copy, `#check @name` for all 16 declarations matches the README. The changes since 8916ae8:
- `ellTorsion` is gone, leaving 16 declarations instead of 17.
- `progressionFreyCurve : ℤ → ℤ → ℕ → ℕ → ℕ → WeierstrassCurve ℚ` is unchanged in type.
- `HasFullRationalTwoTorsion : WeierstrassCurve ℚ → Prop` is unchanged in type.
- In `comparison_curve`, both torsion groups are now `↥(AddSubgroup.torsionBy (…⁄Ω).toAffine.Point ↑ell)`, quantified over `σ : Gal(Ω/ℚ)` with `Affine.Point.map ↑σ`. The hypotheses are unchanged: `H n d k y ell`, `h < k`, `i < j`, `i + h = 2 * j` and the instance `[(progressionFreyCurve n d i j h).IsElliptic]`.

There are no section `variable` blocks, so no binder can be lost.

**Scratch probes.** All of these elaborated on a scratch copy; none needed `set_option`.
1. `ext <;> simp [progressionFreyCurve]` proves that the new body equals the previous head's literal `⟨0, c − a, 0, −(a·c), 0⟩`. Plain `rfl` no longer closes it, because `TauCeti.freyCurve` is not exposed under the module system. The pinned `freyCurve_a₁`…`freyCurve_a₆` (`FreyCurve/Basic.lean:124`–128) carry the coefficients.
2. The three §1.2 Checks hold, and the negative control `a₂ = 3` at (1,1,0,1,2) is refuted.
3. `HasFullRationalTwoTorsion E ↔ Nat.card {P // 2 • P = 0} = 4` (the previous body) follows from `two_zsmul`/`two_nsmul`.
4. `HasFullRationalTwoTorsion E ↔ Nat.card (AddSubgroup.torsionBy E.toAffine.Point (2 : ℤ)) = 4` holds by `Iff.rfl`; the right side is EllipticCurveModularityPartII's `FullRationalTwo` body.
5. `AddSubgroup.torsionBy ((E⁄Ω).toAffine.Point) ell = AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (ell : ℤ)` holds by `rfl`; the right side is the supplier's `GeometricTorsion` body.
6. With `import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`, `simp` proves that `torsionGaloisAction (ell : ℤ) σ` applied to `P` is `Affine.Point.map σ.toAlgHom P`, as README l.253–257 and l.1177 say.

**Padding probe on the changed headline.** `comparison_curve` was tried with `simp [HasFullRationalTwoTorsion, deletionLevel, progressionFreyCurve]`, `aesop`, `rfl`, `infer_instance`, `exact?`, `simp_all` and `decide`. None closed it. The attempt with `F := E_a` and `AddEquiv.refl` also fails, at the conductor clause. It is not padding. The other seven theorems are unchanged since r4, where the same probes failed.

**Library declarations opened at the pins.**
- Mathlib:
  - `AddSubgroup.torsionBy` (`Algebra/Module/Torsion/Basic.lean:971`): `(Submodule.torsionBy ℤ A n).toAddSubgroup` for `n : ℤ`, as README l.207–211 says.
  - The base-change notation `W⁄A := baseChange W A` (`AlgebraicGeometry/EllipticCurve/Weierstrass.lean:239`).
  - `WeierstrassCurve.Affine.Point.map` (`EllipticCurve/Affine/Point.lean:822`, `(W'⁄F).Point →+ (W'⁄K).Point`).
- Tau Ceti:
  - `TauCeti.freyCurve` (`AlgebraicGeometry/EllipticCurve/FreyCurve/Basic.lean:115`): over any `CommRing`, a₂ = B − A, a₄ = −(A·B), others 0, as README l.248–252 says.
  - In `Affine/Point/Galois.lean`: `pointGaloisAction` (l.60), `pointGaloisAction_apply` (l.70), `torsionGaloisAction` (l.77), `torsionGaloisAction_apply_coe` (l.98). The variables (l.55) are fields `F`, `K` with `[DecidableEq K] [Algebra F K]` and `W` elliptic, which covers `F = ℚ`, `K = Ω`.

**Supplier citations resolved** (the ones the diff adds or touches).
- EllipticCurveModularityPartII at its open head:
  - §5.1 (README l.565–589) owns `GeometricTorsion`, `torsionModule`, `torsionRepresentation`, `FullRationalTwo` and `RationalTwo`. Its `Suggested.lean:174`–201 declares `GeometricTorsion E n := AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (n : ℤ)` and `FullRationalTwo E := Nat.card (AddSubgroup.torsionBy E.toAffine.Point (2 : ℤ)) = 4`. This matches the EC.6 row (README l.657).
  - Its §5.1 Checks have “n=1 zero group” and “n=0 all geometric points”, as §1.12's second Check (l.1183) says.
  - §4.7 (l.477) is unchanged and is still EC.3.
- EllipticCurves on main: Layers 2–4, 6 and 8 are still cited for torsion, Hasse, minimality, the Kummer map and the semistable comparison. Its worked example (README l.1583, Suggested l.1164) is the witness of R01.

**Ownership and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no cited id that is dropped, and no id that this pull request drops. `roadmaps grep 'ellTorsion|HasFullRationalTwoTorsion|progressionFreyCurve'` finds no other roadmap using these names, so deleting `ellTorsion` breaks no citation. No declaration here has the fully qualified name of a declaration in another roadmap. `HasFullRationalTwoTorsion` restates EllipticCurveModularityPartII's `FullRationalTwo` under a different name, because `Suggested.lean` cannot import another roadmap's module. The README names §5.1 as the owner.

**Seeded sample.** Of the fifteen seeded targets, only §1.2 falls in the diff. I read it at its locator in the publisher text (BS20; cache page N = printed page N + 354):
- §1.2: BS20 line 277–280, (7)–(8), printed p. 361. The source has g = gcd(n+id, 2(n+jd), n+(2j−i)d), a = (n+id)/g, b = −2(n+jd)/g, c = (n+(2j−i)d)/g and E_a : Y² = X(X−a)(X+c). This matches the README and `TauCeti.freyCurve a c` (A = a, B = c).
- §1.12, which the diff changed: BS20 line 423–426, Lemma 5.1, printed p. 365. Under k ≥ 10⁸ and prime ℓ > exp(10^k), the source gives F_a/ℚ with full rational 2-torsion, conductor M_a and ρ_{E_a,ℓ} ∼ ρ_{F_a,ℓ}. The Lean statement is this.

The other seeded targets are untouched by the diff and were not re-read this round. r4 verified §§1.1, 2.3, 2.7 and 6.1 at their locators. The README flags no locator as unverified.

**Computed adversarial pass.** Rows marked (r4) carry forward the previous report's computations for statements the diff leaves untouched. The rest are recomputed for the changed statements; Lean rows were elaborated on the scratch copy.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §1.2 `progressionFreyCurve` (body changed) | (1,1,0,1,2); (2,1,0,1,2); (−3,2,0,1,2) | t = (1,2,3), g = 1, a = 1, c = 3 → (a₂,a₄) = (2,−3); t = (2,3,4), g = gcd(2,2) = 2, a = 1, c = 2 → (1,−2); t = (−3,−1,1), g = 1, a = −3, c = 1 → (4,3). Lean `simp` gives the same; `a₂ = 3` refuted | Checks hold on the pinned body |
| §1.2 degenerate | n = d = 0 | g = 0, ℤ-division by 0 gives a = c = 0, `freyCurve 0 0` is y² = x³ (singular); excluded by H since gcd(0,0) = 0 ≠ 1 | matches “g=0 only when t_i=t_j=t_h=0” |
| §1.2 coefficientwise | arbitrary (n,d,i,j,h) | `ext; simp`: a₁, a₃, a₆ = 0, a₂ = c − a, a₄ = −(a·c) on both bodies | same curve as the previous head |
| §1.12 `HasFullRationalTwoTorsion` (body changed) | X(X−1)(X+3); X³−2; X(X²+1) | rational roots {0,1,−3}, {}, {0} → 4, 1, 2 points killed by 2 | Check correct; ↔ previous body proved in Lean |
| same, wrong models | count of nonzero points; geometric count | first gives 3 on X(X−1)(X+3); second gives 4 on X³−2 | both excluded by the first Check |
| same, singular Frey curves | `freyCurve 0 1`: y² = x²(x+1); `freyCurve 1 (−1)`: y² = x(x−1)² | nonsingular 2-torsion: (−1,0), ∞ → 2; (0,0), ∞ → 2 ((1,0) singular, ∂ₓ = −3+4−1 = 0) | false, so no junk positive on degenerate Frey curves |
| same vs EC-PartII §5.1 Checks | y²=x³−x; y²=x³−2x; y²=x³+x+1 | 4, 2, 1 | agrees with `FullRationalTwo` (`Iff.rfl`) |
| §1.12 `comparison_curve` (carriers changed) | σ = id; ℓ = 0, 1; F := E_a | `map id P = P`, so the clause is e P = e P; torsionBy at 1 is {0} and at 0 everything, both outside H (prime ℓ > exp(10⁸)); F := E_a has full 2-torsion (roots 0, a, −c) but fails N_{E_a} = M_a whenever a prime is deleted | not vacuous; probes fail |
| §1.12 torsion carrier | `AddSubgroup.torsionBy ((E⁄Ω).toAffine.Point) ell` vs `GeometricTorsion E ell` | equal by `rfl` | the geometric torsion of EC.6 |
| §1.12 Galois action | `torsionGaloisAction (ell:ℤ) σ P` vs `Affine.Point.map σ.toAlgHom P` | equal by `simp` | README l.1177 holds |
| §1.12 vs Kraus (r4) | hypotheses of EC.3 | full 2-torsion of E_a; ℓ ≥ 5; conductor exactly N; Galois-compatible F[ℓ] ≅ E[ℓ] | the Lean's `≃+` with equivariance is the source's conclusion |
| §0.1 `primitive_solution`, `H` (r4) | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2); k = 0; H at k = 2 | 1225 = 35²; 9 = 3²; gcd 2; `0<0` false; `10⁸ ≤ 2` false | keep |
| §0.4 `smallPart` (r4) | (3,64), (2,27), (5,−12), (5,60), (5,0) | 64; 1; 12; 12; 1 | Checks hold |
| §0.5 `A(k)` (r4) | k = 0,1,2,3,5 | ∅, ∅, ∅, {(0,1,2)}, 4 elements | keep |
| §0.6 `κ` (r4) | (0,1,1,2), (0,1,2,3), (1,2,2,3); (0,1,1,3) | −1, −2, −1; sums 2 ≠ 3 | keep |
| §0.8 (r4) | n=1, d=2, k=6, r=3; r=1000, n=1000, k=3 | I₃ = {1,4}, 2 ≤ 3; +1 needed | keep |
| §1.3 invariants (r4) | n = d = 1, (0,1,2) | 16(abc)² = 2304; c₄ = 208 | source's 64(abc)² is the misprint |
| §1.7 `deletionLevel` (r4) | 11a1 at ℓ = 5, 3; M = 33, 99 at ℓ = 3; ℓ = 0 | 1, 11; 11; 9; no deletion | Checks hold |
| §1.9 headline (r4) | p = k prime; k = 10⁸ | p = k admitted; log(2⁷e^{1.000081k}) ≪ 10^k | keep |
| §1.11 (r4) | N = 1, 11 | μ(11) = 12, μ(44) = 72, F_K(11) = 9, G_K(11) = 169; F_K(1) = 1, G_K(1) = 4 | keep |
| §2.3 (r4) | ε = 0.002811 | (1−3ε)/8 = 0.123945875 > 0.1239 | keep |
| §2.4 (r4) | 𝔽₅, λ = 4 | #F_λ = 8, #F′_λ = 4 | keep |
| §2.7 `oddPart`, headline (r4) | N = 12, 16, 24, 48, 0; k = 5 | 3, 1, 3, 3, 0; `Ioc 2 5` = {3,4,5} | keep |
| §3.1 (r4) | N = 8, 24, 16 | 8; 24; 16 > 8 | keep |
| §3.3 (r4) | — | 1/68 = 0.014706 < 0.015351 | keep |
| §4.1 (r4) | δ = 10⁻⁵ | 9 149 543 ∈ (10⁶, 10⁷) | keep |
| §5.7 (r4) | x = 64 | 8·64^{7/2} = 64⁴ = 16 777 216 | keep |
| §5.8 (r4) | N = 120; 3, 5, 1 | 15 = 120/8; 5 ≥ 2.47 | keep |
| ComputationalNumberTheory §4.22 (r4) | q = 1, 4, 8 | 10⁸, 2.5·10⁷, 1.25·10⁷ > 10⁴ | keep |
| §6.2 headline (r4) | d = 0; n = 0 | y·d = 0; y = 0 | keep |
| §6.3 range (r4) | (3,4),(4,3),(5,2),(4,2),(3,3),(3,2) | 2g−2 = 4, 18, 8, 0, 0, −2; strict range admits the first three | keep |
| §6.3 signed boundary (r4) | (−3,2), k = 4 | product 9 = 3² | keep |
| §7.1 headline (r4) | n = 1, k = 2; n = 4, k = 1 | 2 not a power; k = 1 excluded | keep |
| §7.3 (r4) | b = 2, n = d = y = 1, k = ℓ = 2; b = 0 | 2 = 2·1²; b = 0 excluded | keep |

**Headlines.** The headline tests at README l.696–700 are §1.9, §1.12, §2.7, §6.2, §6.3 (two statements), §6.5 and §7.1. All eight are stated in `Suggested.lean` on native carriers. The docstring names §1.10 (the residual Artin conductor) as the one headline that is not statable at the pins, and correctly so.

## Not verifiable

- **Green2026**: no legal source is known. It is consumed only through AnalyticNumberTheoryPartI §0.34c, and the diff does not touch it.
- **Waived and uncertified texts.** IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived and cited by locator. Mazur1978 is uncertified. None is touched by the diff.
- **Gap registration.** The board package has no `design/plan.json`. I could not check whether the four `gap:` slugs of the AnalyticNumberTheoryPartI contract are announced on the supplier's job. They are unchanged by the diff.

## Source issues

- **Misprint** in BS20 at Lemma 3.2, printed p. 361 (line 283): the source gives the discriminant of Y² = X(X−a)(X+c) as 64(abc)²; it should be 16(abc)², the Weierstrass discriminant of that model; affects a stated result.
