# Review of HeegnerPointEulerSystems (pull request #1423 at e9fc187)

**Verdict:** accepted

This is an incremental re-review: 0 lines of the folder changed since 8b8ee4a. The head e9fc187 is a merge of main (parents 8b8ee4a and 8101f2c8). Against `origin/main`, the pull request changes only `TauCetiRoadmap/HeegnerPointEulerSystems/` (`README.md`, `Suggested.lean`, `metadata.toml`), so there is no change outside the folder. The single previous finding is repaired on the board, the gate passes, and this round finds nothing that needs a change. The merge moved the library pins. The merge-induced checks below therefore cover every library declaration the README cites, re-checked at the new pins, and every main-branch supplier the merge rewrote. Three remarks on untouched text are recorded under Verified sound; none asks for a change.

No findings.

## Previous findings

- R01 — repaired: `packages/HeegnerPointEulerSystems/design/plan.json` now lists 12 gaps, adding `zhang-integral-realization` (HilbertModularVarietiesAndShimuraCurves §R18.4.26), `modified-heegner-descent` (EulerSystemsAndKolyvaginSystems §§4.18–4.19, 5.10–5.13, 8.28, 8.31, 8.36) and `kato-distinguished-lattice` (KatoEulerSystems §6.6). The `needs` of `zhang-level-raising` and `gl2-integral-rank-zero` are now the README's own sentences.

## Verified sound

**R01 repair, checked by a slug join.** The board commit "plan gaps follow the roadmap README" changed only `plan.json`. A script joining the plan's `gaps` with the README's `What <Supplier> must provide (gap:<slug>): …` lines gives these counts:
- README slugs: 12. Contract lines: 12. Plan entries: 12.
- Slugs only in the README: none. Slugs only in the plan: none.
- Supplier: identical on all 12.

On the `needs` text:
- Six are verbatim: `cm-local-dynamics`, `self-dual-rigidity-three`, `abelian-scalar-image`, `classical-uniform-square-index`, `surjective-three-integral-comparison`, `eisenstein-elliptic-unit-inputs`.
- The other six are the README contract with explanatory sentences left out. For `gl2-integral-rank-zero` (README line 225) and `zhang-level-raising` (line 215), the plan has the README's first sentence. What it leaves out names other owners: §1.3 for the main conjecture, and `gap:zhang-integral-realization` for the quaternionic realization. For `integral-family-logarithm`, `kato-distinguished-lattice`, `modified-heegner-descent` and `zhang-integral-realization`, the plan leaves out the proof route, the source locators of the inputs, and remarks on this roadmap's own §§8.35, 8.6a, 8.16.
- No plan sentence asks a supplier for anything the README does not, and none drops a requirement.

The two misdirected requests R01 named are gone. The plan's `zhang-level-raising` no longer asks SerreWeightAndLevelOptimisation for multiplicity-one identifications. Its `gl2-integral-rank-zero` no longer asks for the main conjecture, and its section is now §3.9 instead of §§1.3, 1.7.

Every plan section exists at the supplier's open head:
- ModularIwasawaMainConjectures (8f21cae): §3.9 "Schneider's leading-term theorem", line 1459.
- HilbertModularVarietiesAndShimuraCurves (3cac94e): §R18.4.26, line 4089.
- EulerSystemsAndKolyvaginSystems (ccd7e7a): §4.18, line 3355; §4.19, line 3381; §§5.10–5.13, lines 3801–3901; §8.28, line 5531; §8.31, line 5617; §8.36, line 5846.
- KatoEulerSystems (903763b): §6.6, line 2575.

I re-checked that the four rehomed gaps are still genuine at those heads:
- §R18.4.26 is a characteristic-zero Jacquet–Langlands comparison. The roadmap has no integral `J(X_m)[𝔪] ≃ V ≃ A⁰_gm[𝔭_m,0]` identification; its only "Zhang" hits are Yuan–Zhang.
- EulerSystemsAndKolyvaginSystems mentions modified Selmer structures only in Mazur–Rubin's sense and in its own §4.13 proof (line 3246). It has no modified-edge extension of the listed theorems.
- KatoEulerSystems §6.6 is the local lattice `exp*(H¹_s) = [E(ℚ_p):E₁+tors]·p⁻¹ℤ_p` for an elliptic curve with its Néron differential. It has no `T_f` from `H¹(Y₁(N),ℤ_p(1))` and no `E•` with étale isogenies.
- §3.9 is Schneider's ℤ_p leading-term theorem for E or A over k. It has no coefficient-DVR GL₂-type control formula with `Σ t_g(ℓ)` and canonical periods.

I read `modified-heegner-descent` as one obligation, not a compound one: extend the supplier's ordinary-system theorems to the modified local edges. It enumerates which theorems, and each original hypothesis is kept explicit. Every declared gap names a supplier; none is `none`.

**Gate, direction, elaboration.** Gate rerun at e9fc187: every scanner 0, `OK`. The worker's gate (`scratch/gate.md`) also reports `build=0`. The dependency check, rerun with `--movable` against main and the merge order, printed:

```
depcheck: 225 roadmaps, 2087 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The roadmap is at line 376 of the merge order. Its latest suppliers are ModularIwasawaMainConjectures (375), AutomorphicCongruences (374), KatoEulerSystems (358), GrossZagierAndArithmeticHeights (340), HilbertModularVarietiesAndShimuraCurves (161) and EulerSystemsAndKolyvaginSystems (104). Its consumers RankOneConverse (377) and RankZeroOneBSDPartII (380) come after it.

`lake env lean TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean`, run from the worktree, exited 0 with no output (4.5 s) under the new toolchain `v4.36.0-rc2`. The file has 49 lines: `import Mathlib`, one module docstring and an empty `namespace`. With no declaration, there was nothing to `#check` and nothing to probe with one tactic, and there is no padding.

**Library pins after the merge.** The merge moved `lake-manifest.json` from Mathlib `6b7abb3c` to `1b1ccf4b` and Tau Ceti from `a91d3aa` to `2fd255d`; `lean-toolchain` moved from `v4.35.0-rc3` to `v4.36.0-rc2`. I re-opened every README library name at the new pins.

Mathlib `1b1ccf4b`, 26 of 26:
- `Subring.comap` (`Algebra/Ring/Subring/Basic.lean:173`)
- `ClassGroup.equivPic` (`RingTheory/PicardGroup.lean:876`) and `CommRing.Pic.mapRingHom` (`:579`)
- In `NumberTheory/Padics/PadicIntegers.lean`: `PadicInt` (`:71`), `PadicInt.isUnit_iff` (`:385`), `PadicInt.mem_span_pow_iff_le_valuation` (`:472`), `PadicInt.ideal_eq_span_pow_p` (`:545`)
- `WeierstrassCurve.Affine.Point` (`AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477`)
- `Module.length` (`RingTheory/Length.lean:31`)
- `Nat.primeFactorsList` (`Data/Nat/Factors.lean:39`)
- `IsDiscreteValuationRing.ideal_eq_span_pow_irreducible` (`RingTheory/DiscreteValuationRing/Basic.lean:362`)
- `DihedralGroup.sr_mul_r`, `sr_mul_sr`, `inv_r`, `inv_sr` (`GroupTheory/SpecificGroups/Dihedral.lean:98, 102, 106, 110`)
- `hensels_lemma` (`NumberTheory/Padics/Hensel.lean:460`)
- `MonoidAlgebra.single` (`Algebra/MonoidAlgebra/Defs.lean:222`)
- `Submodule.span` (`LinearAlgebra/Span/Defs.lean:46`)
- `LinearMap` (`Algebra/Module/LinearMap/Defs.lean:84`)
- `MonoidHom` (`Algebra/Group/Hom/Defs.lean:366`)
- `TensorProduct.tmul` (`LinearAlgebra/TensorProduct/Defs.lean:98`)
- `Module.finrank` (`LinearAlgebra/Dimension/Finrank.lean:61`)
- `ENat` (`Data/ENat/Defs.lean:18`)
- `Pi.compactSpace` (`Topology/Compactness/Compact.lean:1175`) and `IsCompact.inter_iInter_nonempty` (`:293`)
- `ContinuousCohomology.tateShafarevich` (`RepresentationTheory/Homological/ContCohomology/Sha.lean:72`). It is still a kernel of localizations with no elliptic Kummer identification, as README line 105 says.

Tau Ceti `2fd255d`:
- `TauCeti.TateModule` (`TauCeti/Algebra/Module/Torsion/TateModule.lean:125`)
- `WeierstrassCurve.nonempty_linearEquiv_tateModule`, `free_tateModule`, `finrank_tateModule` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Basic.lean:73, 80, 94`)
- `WeierstrassCurve.Affine.fg_point_of_numberField` (`MordellWeil/FinitelyGenerated.lean:145`)
- `TauCeti.ContinuousCohomology.map_eq_id_of_inner` (`RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297`). Its hypothesis is `IsSmoothDiscrete k X`, as README line 107 says.

No citation breaks.

**What the new Tau Ceti pin adds, and statability.** Compared with `a91d3aa` (I checked each file's absence at the old commit), `2fd255d` adds:
- Ring class fields for every order: `TauCeti.ClassFieldTheory.ringClassField` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111`), `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O/K)` (`:178`), `isUnramifiedAt_ringClassField` (`:155`), `ncard_primesOver_ringClassField_eq_finrank_iff` (`:251`).
- The elliptic Selmer group and Sha over a number field: `WeierstrassCurve.selmerGroup` (`AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:176`), `kummerMap_mem_selmerGroup` (`:215`), `WeierstrassCurve.sha` (`Selmer/NumberField.lean:65`).
- `WeierstrassCurve.LFunction` (`AlgebraicGeometry/EllipticCurve/LFunction.lean`).
- `NumberFieldOrder.mapPic` (`NumberTheory/NumberField/Global/Orders/Functoriality.lean:164`).

None of these makes a headline statable. Every headline listed in the module docstring (§§6.1–6.6, 6.7–6.11, 6.18–6.19, 7.11–7.13, 8.9–8.12, 8.21–8.24, 8.30–8.45, 8b.6–8b.13) quantifies over the Heegner point `y_K`, the Heegner Kummer or Λ-adic system, or CM points on quaternionic curves. Neither pin has a modular curve, `X₀(N)`, a modular parametrization or a CM-point map. In Tau Ceti, "Heegner" occurs only in `NumberTheory/ClassNumberOne/` (Heegner numbers); in Mathlib, only in `Analysis/Real/Pi/Chudnovsky.lean`. The README states its headlines from a non-torsion point and says the Gross–Zagier formula is not needed (line 9), so the new L-function supplies nothing a headline needs.

The README restates none of these objects as its own target. It reaches them through its owners, which now cite the Tau Ceti names:
- ClassFieldTheory Layer 13 on main, lines 2120–2140, names `ringClassField`, `ringClassArtinEquiv`, `isUnramifiedAt_ringClassField` and the splitting law.
- EllipticCurves Layer 7.
- ImaginaryQuadraticClassNumber H1.4 on main, line 20, names `intAddMulOrder` and the residue-unit sequence declarations.

§0.5's API (restriction between conductors, its kernel, Artin compatibility) and §0.4's successive-conductor kernel are not at the pin: `ClassNumber.lean` gives only the sequence relative to the maximal order.

**Main-branch suppliers rewritten by the merge, re-resolved at main d2dabb0:**
- ClassFieldTheory Layer 12 "separate arithmetic global existence, the norm index, and the global correspondence": line 1834.
- ClassFieldTheory Layer 13 "norm theorems and class fields": line 1924, with ring class fields at lines 2120–2140.
- ImaginaryQuadraticClassNumber H1.4 "Orders and conductor comparisons": line 59. It still gives the residue-unit sequence, the `h(O_f)` formula and the `D = −3, −4` unit exceptions.
- PadicMeasuresIwasawaAlgebras: Layer 4 at line 2328, Layer 5 at 3165, §1.6 at 888, §1.7 at 909, §3.1 at 1978, §3a.1 at 2213.
- `Completed/Chebotarev` Layer 10 "Dirichlet-density Chebotarev": line 410.
- `Completed/GlobalNumberFields` Layer 11 "orders and Picard groups": line 571.
- `Completed/LocalFieldsRamification` Layer 0: line 72.
- EllipticCurves: Layers 2, 4, 6, 7 at lines 647, 793, 1200, 1262.

Every heading and title matches the README's citation. The citation resolver (main and 437 open heads) reports no citation and no Lean name found nowhere. The overlap check reports no other pull request changing this roadmap, no id dropped by an open revision and none defined only by one.

The two closest open roadmaps are consumers, not owners. RankOneConverse (#1805) cites §§1.4–1.6 and 7.11–7.12 and declares `gap:gl2-full-forward` against this roadmap; that request is for a later revision of this roadmap and is not a defect of this head. RankZeroOneBSDPartII (#1732) cites §§8.6–8.6a, 8.24, 8.31, 8.34, 8b.2 and 8b.10. Every section both cite exists here. Ownership against open pull requests whose files the brief did not supply was not searched.

**Seeded sample, verified at the cached texts.** Page markers were checked for each page quoted.

| Target | Source passage | Result |
| --- | --- | --- |
| 0.3 | khayutin line 811–829, 913–926 (pp.164–167) | verified in the previous report; text unchanged |
| 0.5 | gross §3 (OCR lines 83–142, printed pp.238–239: `O_n = ℤ + nO_K`, ring class field `K_n`, `Pic(O_n)`, dihedral action); cornut-vatsal §2 line 642–770 (pp.20–23) | matches |
| 0.8 | cornut-vatsal line 636 (§1.7, p.19: Frob_v is geometric, reciprocity normalized accordingly); line 654–688 (§2.1, Lemma 2.1, pp.20–21); line 1236–1240 (§3.8, p.35: `rec_K(λ)·[g] = [λ^ε g]`) | matches |
| 1.5 | howard line 843–852 (§1.7, p.19: `h_m` via `C/O_m → C/(O_m∩a)⁻¹`, cusp ∞ to origin, `P[m]` its image); gross line 36–60 (p.236); zhang line 785 ((3.22), p.213: `y_K = tr_{K[1]/K} y(1)`) | matches |
| 5.1 | howard line 896–916 (Lemma 1.7.3 and proof: restriction to `K[ℓ]_λ′ = K[n]_λ″` vanishes; `Σ i = ℓ(ℓ+1)/2`) | matches; the lemma and proof lie on p.20 (remark below) |
| 5.5 | howard line 357–376 (H.3–H.5, pp.8–9); line 811–829 (Theorem 1.6.5 proof, pp.18–19: Weil pairing modified, `(sτ,tτ) = e(sτ,t) = e(s,tτ)^τ`) | matches |
| 6.6 | zanarella line 615–651; zhang line 1773–1856 | verified in the previous report; text unchanged |
| 7.3 | nekovar line 1631–1644 (Prop. 6.1.2, p.35: `C₂(𝔭) = ord_𝔭(u−1)` via Sah, 0 if `p−1 > c(A/H)`); line 1646–1663 (Prop. 6.2.1, p.35); line 1739–1745 (Prop. 6.2.2, p.36: image contains `𝔭^{C₃} End`, `C₃ = 0` almost always) | matches |
| 7.10 | gross line 59–66 (Prop. 2.1, p.237: p odd, `GL₂(ℤ/p)` image, `p ∤ y_K` ⇒ rank one, `Sha_p = 0`; almost all p when `y_K` has infinite order); nekovar line 933–952 ((3.5), (3.5.2)); line 2216 ((7.4), p.45) | matches; (3.5.2) itself is on p.20 (remark below) |
| 8.6 | cgls line 1428–1447 (Theorem 4.1.1, p.27, with the `d(k)` construction); line 1477–1487 (Remark 4.1.3, p.28) | matches |
| 8.10 | cv-dynamics line 436–438 (Corollary 2.10, p.12: for all but finitely many x, `Red(G·x) = C⁻¹(G·x̄)`) | matches |
| 8.27 | howard line 1321–1340; cgls line 1448–1467 | verified in the previous report; text unchanged |
| 8.28 | howard line 1341–1347 (Lemma 2.3.4, p.30, transverse part "exactly as in Lemma 1.7.3", proof to p.32); cgls Theorem 4.1.1 (above) | matches |
| 8.29 | howard line 1467 (Lemma 2.3.5, p.32), line 1503–1509 (Lemma 2.3.6, p.33, proof to p.34) | matches |
| 8.37 | bcgs line 699–712 (Conjecture 1.2.10, Remark 1.2.11, Corollary 1.2.12, p.14: `#(H¹_Ford/ℤ_pκ₁)² = #Sha·∏c_w^(p)·#H⁰(ℚ_p,E₀[p∞])⁴`); cs line 742 (Prop. 3.3.2, p.14), 835 (Lemma 3.3.3, p.16), 856 (Cor. 3.3.4, p.16) | matches; the README's `b₀⁴` is the correction recorded under Source issues |

**Adversarial pass.** First, new rows for the sampled targets, computed this round.

| Statement | Instances tried and values computed | Result / change |
| --- | --- | --- |
| 0.5 ring-class tower | ℚ(i), `c = 1 → 3` (3 inert): `[ℤ[i]× : ℤ[3i]×] = 4/2 = 2`, kernel `(3+1)/2 = 2`, `#Pic(ℤ+3ℤi) = 2`, `#Pic(ℤ[i]) = 1`, so `[K[3]:K[1]] = 2`. The new Tau Ceti `finrank_ringClassField_neg_thirty_six_eq_two` (`NumberTheory/BinaryQuadraticForm/Ideal/RingClassField.lean:209`) gives 2 for discriminant `−36 = 9·(−4)`. Restriction `C₂ → 1` is onto with kernel of order 2. ℚ(√−5): reduced forms of discriminant −20 are `x²+5y²` and `2x²+2xy+3y²`, so `h = 2` and `P₁` is not K-rational (Check). For `c ∣ c′`: `O_{c′} ⊂ O_c` and `K[c] ⊂ K[c′]` | sound |
| 0.8 Frobenius conversion | `Gal(𝔽₂₇/𝔽₃) = C₃`: arithmetic `s: x ↦ x³`, geometric `s⁻¹ = s² ≠ s`. `27 − s − s² ↦ 27 − s² − s⁴ = 27 − s² − s` (`s³ = 1`), unchanged. For `𝔽₉/𝔽₃`, `s = s⁻¹`, so a C₂ test cannot see the convention and the C₃ Check is the discriminating one | sound |
| 1.5 point family | Zero homomorphism: `0(P_c) = 0` for every c. ℤ with negation: the selected point is 1 and the orbit trace `1 + (−1) = 0 ≠ 1`, so the constructor returns the point, not its trace. Cusp branch `d = 1`: `φ([x_c − ∞])` | sound |
| 5.1 transverse | `ℓ = 3`: `Σ_{i≤3} i = 6 = 3·4/2`. At p = 2 with `I ∋ ℓ+1 = 4`: `v₂(6) = 1 < 2`, so `ℓ(ℓ+1)/2·c(Fr) ∈ I_n·T` fails, as the README warns. At p = 5, `ℓ = 19`: `ℓ+1 = 20`, `190 = 19·20/2`, `v₅(190) = 1 ≥ v₅(20) = 1` | sound |
| 5.5 pairing | `e(τx,τy) = e(x,y)⁻¹` (τ inverts μ). Hence `(t,s) = e(t,τs) = e(τt,s)⁻¹ = e(s,τt) = (s,t)`, symmetric as H.4 requires. At p = 2, `(1±τ)/2` needs `1/2 ∉ ℤ₂` (Check) | sound |
| 7.3 constants | `u = −1`: `v₃(−2) = 0`, `v₂(−2) = 1`. Nekovář gives `C₂ = ord_𝔭(u−1)` and `u ≢ 1 mod p` once `p − 1 > c(A/H)`, so `C₂ = 0` for almost all p | sound |
| 7.10 primary vanishing | In ℤ/25, the element 1 has order 25 and `5·1` has order 5. So `Sha[p∞] ≠ 0` forces `Sha[p] ≠ 0`, and `Sha[p] = 0` gives `Sha[p∞] = 0`, with no finiteness used | sound |
| 8.6 tower class | Two-coordinate model: `(1,0) ≠ 0` but its second projection is 0. The zero compatible family has zero class. CGLS asserts `κ₁^Hg ≠ 0` only, not nonvanishing of every specialization | sound |
| 8.10 fibres | Two components: `X = {a,b}`, `C(a) = 0`, `C(b) = 1`, `G·x̄ = {0}` gives `C⁻¹ = {a} ≠ X`. The fibre keeps C, as stated | sound |
| 8.28 local conditions | The transverse part at `ℓ ∣ n` reduces to 5.1 (howard line 1343). At p = 2 the same `ℓ(ℓ+1)/2` obstruction applies, and the target is stated for odd p | sound |
| declared gaps (R01) | README 12, plan 12; join 12/0/0; 6 verbatim, 6 condensed with no requirement dropped; 4 rehomed sections resolved at their heads | repaired |
| headline docstring | Carrier search at both new pins: modular curve / `X₀(N)` / parametrization / CM-point map: none. "Heegner": Heegner numbers only (Tau Ceti), Chudnovsky only (Mathlib). 13 groups, each naming the missing carrier, with no stand-in. 0 declarations, 0 `sorry`, 0 `set_option`, 0 imports beyond `Mathlib` | sound |

Second, rows carried from the previous report (`PRREVIEW-HeegnerPointEulerSystems~7`). Their statements are untouched, and the values are those of that report.

| Statement | Values (as computed in the previous report) | Result |
| --- | --- | --- |
| 0.1 local order | `ℤ₅[√2]` maximal; `O + π(O×O)` for `g = [[1,π⁻¹],[0,1]]`; `ℤ₅ + 5ℤ₅√2` | sound |
| 0.2 / 0.3 / 0.4 | `ℤ+3ℤi` index 3, discriminant −36; `(2,1+√−5)` invertible non-principal; ℚ(i), ℓ = 3: `u = 2`, kernel 2, `h = 2` | sound |
| 0.9 different | trace-form determinant π²; ℚ₂(i) different of valuation 2 | sound |
| 2.1–2.6 | q = 5 counts `(0,6),(1,5),(2,4)`; residue size 2 gives `e₁+e₂ = −e₀`; `Fr₃(i) = −i` on 𝔽₉ | sound |
| 4.1–4.9 | `y² = x³−x`: `#E(𝔽₁₉) = 20`, `#E(𝔽₁₉₉) = 200`; `(s−1)(s+2s²) = 2−s−s²`; `σ′ = σ^u` changes scalar and tensor by `u⁻¹, u`; parity `ε(−1)^ν` | sound |
| 5.2 / 5.7 | `ℓ ≡ −1 mod 5`: `4·4 ≡ 1`; Sah annihilator −2: units at p = 3, 7, zero at 2 | sound |
| 6.6 / 6.9 / 6.12–6.18 | Zanarella equality iff `d(κ) = 0`; `g_K` level `ND_K²` keeps `ℓ ∥ N`; zero family `ν = ∞`; ν = 1 gives dimensions 2, ≤1 and 3 detecting primes | sound |
| 7.6 / 7.7 / 7.13 | `B = 2C₀+2C₁+4C₂+4C₃+C₆+21v(2)`; `(ℤ/5)³`: exponent 5, order 125 (cardinality is the declared gap) | sound |
| 8.1 / 8.13 / 8.14 / 8.25 | `(5−s+s²)(5+s−s²) = 27−s−s²`; split 9 ≡ 4 and inert 21 ≡ 1 mod 5; `v_p((1+p)^{p^r} − 1) = r+1` for odd p, `v₂(9−1) = 3` | sound |
| 8.15 / 8.16 / 8.19 / 8.32 | `ind(5) = 2` in `ℤ₅[ϖ]`; cokernel `(ℤ/5)²` of order 25; `(p+1)²−a_p² = #Ẽ(𝔽_{p²})` | sound |
| 8.29 | `α(γ) = 6`: `ι(γ) ↦ 1/6`; `−1 → 24 → 4`; corestriction `(1,2) ↦ (−1,−2)`, sum −3 | sound |
| 8.33 / 8.34 | `5³e` length 3 vs `5⁵e` length 5; `A/(T²)` vs `A/(T³)`: `4 ≤ 6`, while `A/(T⁴)` fails | sound |
| 8.35 / 8.36 / 8.37 | `y² = x³+8x+2` mod 5: `a₅ = 1`, `b = 5`, `h = 1`, `s = 5`; `(hbs)² = 625 = b⁴ ≠ h⁴ = 1`; `I² = 5⁶ = 25·5⁴`. Recomputed this round: affine points mod 5 are `(1,±1), (2,±1)`, so `#Ẽ(𝔽₅) = 5`. From `P = (1,6)` mod 25: `2P = (7,1)`, `3P = (17,24)`, `4P = (11,14) ≢ −P = (1,19)`, so `5P ∈ E₁ ∖ E₂` and `E(ℚ₅)[5] = 0` | sound |
| 8.38 / 8.40 / 8.41 / 8.42 | `γ·ι(γ) = 1`; `5⁴ℤ₅` of index 625; `2(3−1) = 4`; BCGS §2.1 contradiction route via §§8.32, 8.26, 8.35, 8.36, 8.17, 8.33, 8.15 | sound |
| 8.6a / 8b.2 / 8b.3 / 8b.5 | correction valuation 2 for `a = 5`; ℚ(√−7) ramified at 7 ⇒ `7 ∤ N`; `(1) ⊇ (S)` under `T ↦ 0`; factorwise cancellation forces `(1,2)` | sound |

**Shape and policy at this head.** The folder is byte-identical to 8b8ee4a, so the previous report's counts stand: every definition has ≥3 Checks, every theorem a locator, and every layer Examples and Dependencies. The gate's scanners for LaTeX, pull-request numbers, round labels, `set_option`, `sorry` data, imports, stray files and private paths are all 0. `metadata.toml` is `topic = "math.NT"`.

**Remarks on untouched text** (no change requested):
- README line 73 names the pins it was written against (Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`). The worktree pins are now `1b1ccf4b` and `2fd255d`. Every cited declaration resolves at both, in the same file, and 16 READMEs on main likewise keep their original commit links.
- §5.1 cites howard "Lemma 1.7.3 and proof, pp.20–21". The lemma and its proof both end on p.20 (line 896–916; p.21 starts at line 917).
- §7.10 cites nekovar "§3.5.2 p.19". (3.5) begins on p.19 (line 933), but (3.5.2) itself is on p.20 (line 952).

## Not verifiable

- none. Every text consulted was readable: the cached `howard`, `gross` (OCR), `cornut-vatsal`, `cv-dynamics`, `nekovar`, `zhang`, `cgls`, `bcgs` and `cs` extractions, the supplier READMEs on main and at their open heads, the board's `plan.json`, and both pinned libraries.

## Source issues

- **Misprint** in cgls at Remark 4.1.3, equation (4.3), printed p.28: the stabilized point is defined for `k > 1` and for `k = 0`, leaving `k = 1` undefined; it should read `k ≥ 1` and `k = 0`; affects nothing.
- **Error** in bcgs at Corollary 1.2.12 and its proof, printed p.14: the source equates `#H⁰(ℚ_p, E₀[p∞])` with `#(ℤ_p/(1 − α_p)) = #Ẽ₀(𝔽_p)[p∞]`; it should keep these distinct (for `y² = x³+8x+2` at p = 5 they are 1 and 5), giving the local factor `b₀⁴`; affects a stated result.
