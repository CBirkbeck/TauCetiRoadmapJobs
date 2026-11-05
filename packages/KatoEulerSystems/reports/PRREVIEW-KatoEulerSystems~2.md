# Review of KatoEulerSystems (pull request #1804 at 7d70b16)

**Verdict:** needs changes

## Repairs of the previous review (aad344d → 7d70b16)

- **R01 (labelled classes unowned): repaired.** New target 2.0 "Labelled classes at conductor m" (README lines 858–947) constructs `labelledZetaClass` and `labelledNewformClass` from the two-index classes of `PadicFamilies` §4.0.1 by Kato's pushforward, with the admissible levels, the auxiliary independence, the conductor norm relations 8.10 and 8.12 and the compatibilities; 2.1 (line 960), 5.1 (lines 1989–1991, 2016–2017, 2043–2045) and 5.2 (lines 2102–2105) now cite it. Checked against `Kato2004` lines 2477–2479 ((8.1.2)), 2672–2695 (8.9), 2699–2724 (8.10–8.12), 1402–1415 and 1446–1456 (5.1–5.2, the composite `(1 a;0 1)^*`, trace, `φ_A`, trace), 476–515 (2.8). The conditions, levels and the composite agree with the source; see the table.
- **R02 (openness owned by NoncommutativeAndEquivariantIwasawa): repaired.** Scope (lines 50–54, 94–96), the new supplier subsection (lines 448–456), 4.7 (lines 1908–1913) and 7.4 (lines 2794–2795) import the per-prime openness from `NoncommutativeAndEquivariantIwasawa` §4.0 (`elliptic_nonCM_openImage`), and `Suggested.lean` keeps only the almost-all clause as `serre_surjective_almostAll` (lines 49–62). The citation resolves at #1307 (README line 1917, "4.0 Local elliptic image theorems"; its Lean line 183). The almost-all clause itself has a second owner: R01 below.
- **R03 (EllipticCurveModularityPartII §6.0e not cited): repaired.** Lines 97–101, 458–463, 3028–3030, 3037–3041 and the Lean docstring (lines 86–93) cite §6.0e as the owner of finite `A_f(ℚ)` at `K = ℚ`, `χ = 1` and say in one clause what 7.9 adds. §6.0e exists at #1491 (README line 691).
- **R04 (invented supplier names): repaired.** The nine `PadicFamilies` names are replaced by descriptions (lines 244–260), `abelianSelmerGroup` by `Sel_([p^m])(A/K)` (line 2986; `SelmerIwasawaCohomology` §2.12a at #869, line 678, writes `Sel_φ(A/K)`), the anchor by §AL.3.6.3 (lines 324–325, 1663, 1705; heading at #924 line 2171), and the `EulerSystemsAndKolyvaginSystems` §2.1 description (lines 374–377) now matches #1272 lines 1564–1568 (Rubin, Mazur–Rubin, Burns–Sakamoto–Sano; no Kato).
- **R05 (Momose–Ribet openness used but not owned): repaired.** `ribetMomoseOpenImage` is a target of 4.1 (lines 1572–1594) with clauses (1)–(3), locators and inputs; `admissible_of_split` and 4.7 cite it. Checked: `Ribet1985` lines 259–263 (Momose: `H_l` open in `{x : nrd x ∈ ℚ_l}`), 266–271 (Theorem 3.1, `H_l = A_l` for almost all l); `Loeffler2017` lines 126–137 (Definition 1.2.1), 175–180 (Theorem 1.2.3, three hypotheses), 254–263 (Theorem 2.2.2 with the GGQ bound), 282–289 (Theorem 2.3.1), 198–202 (Remark 1.2.4), 235–253 (Momose's Lemma 1.5, Proposition 1.7, the group law, `H`); `GhateGonzalezQuer2005` lines 641–642, printed p. 714 (Corollary 4.7).

## R01 (P2) — Serre's almost-all surjectivity is built by AdelicImagesAndModularCurves §4.3 as well

**Location.** `TauCetiRoadmap/KatoEulerSystems/README.md` lines 1913–1916 ("Prove `serre_surjective_almostAll`: the image is the whole automorphism group for all but finitely many p"), 51–53 (Scope), 3208–3210 ("`AdelicImagesAndModularCurves` Layer 4 plans the adelic open-image theorem … its almost-all surjectivity is 4.7 here"); `TauCetiRoadmap/KatoEulerSystems/Suggested.lean` lines 49–62 and the docstring lines 10–14.

**Claim.** This roadmap owns, for a non-CM elliptic curve over ℚ, that `ρ_(E,p)` is surjective onto `GL₂(ℤ_p)` for all but finitely many p, and `AdelicImagesAndModularCurves` takes that statement from 4.7.

**Witness.** `AdelicImagesAndModularCurves` README at its head (#1727, another author, a new roadmap folder), Layer 4 "Serre's open image theorem and the CM counterpart" with standing hypotheses "K a number field, E/K an elliptic curve" (lines 1218–1226), §4.3 "Surjectivity for almost all ℓ" (lines 1298–1301): "If E has no geometric CM, `ρ̄_(E,ℓ)` is surjective onto `GL₂(𝔽_ℓ)` for all but finitely many ℓ, hence (2.2) `ρ_(E,ℓ^∞)` is surjective for all but finitely many ℓ", with a five-step proof route (determinant, Dickson, Borel, Cartan-normaliser, exceptional). That README cites neither `KatoEulerSystems` nor `NoncommutativeAndEquivariantIwasawa`. It is not in the merge order yet, so it is placed after its last supplier; its suppliers (README lines 96–122: `ModularCurvesPartII` at 73, `ShimuraVarieties` 94, `AutomorphicGaloisRepresentations` 154, `EffectiveDiophantineMethods` 165, `EllipticCurveModularityPartII` 186, `EisensteinIdealAndRationalTorsion`, roadmaps on main) all precede `KatoEulerSystems` (319), so it is the earlier roadmap and the owner. Two open pull requests build the same object, and the Downstream-consumers sentence describes a dependency that does not exist at #1727.

**Repair.** Cite `AdelicImagesAndModularCurves` §4.3, at `K = ℚ`, under `## Exact supplier contracts` and in 4.7 for the almost-all surjectivity (an open pull request of another author that adds a new folder is an admissible supplier); keep in 4.7 the consequences proved here (`Hyp(ℚ_∞, V_p(E))`, `Hyp(ℚ_∞, T_p(E))` under surjectivity, finiteness of `H¹(ℚ(E[p^∞])/ℚ, E[p^∞])`, finite `E(ℚ_∞)_tors`) with the openness and the surjectivity as imported inputs, and drop the sentence at lines 3208–3210 that reads 4.7 as the owner. Delete `serre_surjective_almostAll` from `Suggested.lean` (with its Layer-4 section comment) and say in the module docstring that the surjectivity for all but finitely many p is `AdelicImagesAndModularCurves` §4.3. Rewrite the Scope bullet (lines 50–54) accordingly.

## R02 (P3) — Leftover words in the scope paragraph

**Location.** `README.md` lines 73–74: "the classes modular zeta classes with parameters c, d, M, N, k, r, r′".

**Claim.** The sentence lists what `PadicFamilies` §4.0 owns.

**Witness.** The phrase "the classes" survives from the deleted backticked name (the diff at aad344d had "the classes `modularZeta c d M N k r r′`"); the sentence now has two subjects.

**Repair.** Delete "the classes" so the item reads "the modular zeta classes with parameters c, d, M, N, k, r, r′ with their norm, trace, moment, coefficient, Hecke and smoothing relations (§4.0.1)".

## Verified sound

**Gate and build.** Worker's gate at 7d70b16: every check passed. Dependency check rerun by me:

```
depcheck: 231 roadmaps, 2107 edges, 0 problem(s)
```

no UPWARD, no CYCLE, no `moved:` line (the roadmap is at line 319 of the merge order; `NoncommutativeAndEquivariantIwasawa` at 26, `PadicFamilies` 160, `EllipticCurveModularityPartII` 186, `PadicHodgeRegulators` 308). `lake env lean TauCetiRoadmap/KatoEulerSystems/Suggested.lean`: three `declaration uses sorry` warnings (lines 55, 69, 94) and nothing else. Changes outside the folder: none (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/KatoEulerSystems'` is empty). No `set_option`, no `lemma`, no sorry'd data, no `#eval`; imports are `Mathlib` and three existing `TauCeti.*` modules (the `module`/`public import` header is the pinned toolchain's form and is accepted by the gate; other open roadmaps of the same author use it). `metadata.toml` contains only the topic.

**Lean signatures.** Elaborated `#check @` for all four declarations on a scratch copy; the types agree with the worker's `signatures.md` and with the README: `serre_surjective_almostAll` (4.7, non-CM as "every geometric endomorphism is an integer", finitely many non-surjective ℓ, the openness no longer stated), `ellipticCyclotomicFiniteGeneration` (7.9, Kato 14.4, `1 ≤ m`, the union of the `ℚ(ζ_(m^n))`), `ellipticCharacterPart` (Kato's χ-part with `I_ψ = ker(ℤ[G] → ℂ)`, no division by `|G|`), `ellipticCharacterPoints_finite` (Kato 14.3(2), the entire continuation `F` as hypothesis, the zero-extended character modulo m, `autEquivPow` with `cyclotomic.irreducible_rat`). No section binder is lost: the `def` carries `[DecidableEq K]` and `[Algebra ℚ K]` explicitly. One-tactic probes (`simp`, `rfl`, `infer_instance`, `decide`, `simp_all`, `aesop`, `exact Set.toFinite _` on the finiteness goals) closed none of the three theorems; no `example`, no padding. Pinned carriers opened: `WeierstrassCurve.tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71`), `WeierstrassCurve.pointGaloisAction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:47`), `TauCeti.Isogeny.Hom` (`Isogeny/Hom/Basic.lean:106`) with its ring instance (`Isogeny/Hom/Ring.lean:174`), `IsCyclotomicExtension.autEquivPow` (`Mathlib/NumberTheory/Cyclotomic/Gal.lean:77`), `WeierstrassCurve.LFunction` (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:79`).

**Cross-roadmap citations resolved at the heads named in the brief or by `roadmaps show`.** `NoncommutativeAndEquivariantIwasawa` §4.0 (#1307 line 1917; `elliptic_nonCM_openImage` in its Lean at line 183, on `tateModuleGaloisRepresentation` with the same non-CM hypothesis, basis-conjugation and finite-extension compatibility as the README's contract); `EllipticCurveModularityPartII` §6.0e (#1491 lines 691–711: `A_f(ℚ)` finite for weight-two trivial-character f with `L(f,1) ≠ 0`, CM and non-CM, every coefficient degree); `ModularCurvesPartII` §§3.14, 3.15, 5.12, 5.15, 5.16, 8.1–8.5, 9.1, 9.2, 9.12, 14.1–14.3, 14.8, 14.9a, 14.11, 14.12, 16.2 (#913 lines 1287–4120, all headings present); `ArithmeticGaloisDuality` §§R02.1.2, R02.2.1, R02.4.2–R02.4.4, D7.3, D7.4 (#858); `SelmerIwasawaCohomology` §§2.12, 2.12a, 3.7, 3.11, 3.15, 3.20, 4.26 (#869); `EulerSystemsAndKolyvaginSystems` §§2.1, 2.2, 2.4, 2.5 (#1272 lines 1564–1684); `AutomorphicLFunctionsAndLocalFactors` §AL.3.6.3 (#924 line 2171); `AutomorphicGaloisRepresentations` §§1.5, 1.5a, 1.6, 4.8, 5.2, 6.1, 7.2, 7.5 (#1007; §7.5 supplies the Zariski closure and residual largeness and says "preserve the inner-twist fixed field and quaternion algebra in the open-image formulation", not the openness, as 4.1 says); `EllipticCurveModularity` Layers R29.4–R29.6 (#1018); `PadicFamilies` §4.0.1 (#1019 line 2369: the two-index class with parameters c, d, M, N, k, r, r′; no label, conductor m or cyclotomic base, as the README now says); `EtaleCohomologyFoundations` §0.8 with `ClassicalAlgebraic.finiteTrace` (main, README line 565 heading, line 582 statement, Lean line 514); `ModularForms` Layer 9 (main, inner twists, line 1434). Ownership against open pull requests was checked with `roadmaps grep` for the labelled classes (only `EllipticCurveModularityPartII` #1491 names them, through its declared gap on `PadicFamilies`; no other pull request builds them), for Momose's openness (only `AutomorphicGaloisRepresentations` §7.5, which disclaims it) and for the almost-all surjectivity (`AdelicImagesAndModularCurves` #1727, R01).

**Ownership remark (no change requested).** `EllipticCurveModularityPartII` declares `gap:kato-labelled-pushforward` on `PadicFamilies` §4.0.1 for the weight-two labelled classes with exactly the level and label conditions of 2.0 (#1491 line 67). At its head `PadicFamilies` does not state them, so 2.0 is the only construction in any open pull request and the README says why it is the owner (lines 88–92). When `PadicFamilies` answers that gap, its reviewer should reconcile the weight-two case with 2.0; nothing in this folder needs to change for that.

**Sources (seeded sample and the passages the repairs rely on), read in the cached texts.** `Kato2004`: 2.2–2.4 (lines 398–427; Proposition 2.3 with `prime(M) = prime(M′)`, `prime(N) = prime(N′)` separately, Proposition 2.4 with both branches), 2.5–2.7 (lines 432–475), 2.8 (lines 476–519, `Y(M,N(A))`, `Y(M(A),N)`, `φ_A` with `E′ = E/NC`), 2.11 (lines 583–604, the norm projection formula), 3.2–3.11 (lines 766–1019: smoothing `c²E − c^kE_(cα,cβ)`, `F = N^(−k)∑E ζ^(bx−ay)`, `E = N^(k−2)∑F ζ^(bx−ay)`, Lemma 3.7(1)–(2), the analytic formula with `(−1)^k(k−1)!(2πi)^(−k)`, 3.10, 3.11(1)–(2)), 4.2 (lines 1028–1045), 5.1–5.2 (lines 1394–1472), (8.1.1)–(8.1.3) (lines 2474–2483), 8.3 (lines 2519–2547), 8.7–8.12 (lines 2652–2724), 9.2.2 (lines 2763–2769), 12.4–12.6 and 12.8 (lines 4046–4141), 13.1–13.5 (lines 4178–4272), 13.6–13.7 (lines 4274–4293), 13.12–13.14 (lines 4443–4558), 14.1–14.6 (lines 4566–4691), 14.22 (lines 5124–5160), 16.2–16.6 (lines 5902–6004). `Rubin2000`: Theorem I.7.3 (lines 957–991), `Hyp(K_∞,T)`, `Hyp(K_∞,V)`, `Hyp(K_∞/K)` (lines 1365–1386), Theorems II.3.2–3.4, Proposition II.3.7, Theorem II.3.8 (lines 1405–1468), III.5.1–5.3 (lines 2200–2256), 5.4, 5.6, 5.8–5.11 (lines 2260–2346), 5.13–5.18 (lines 2374–2476). `Loeffler2017`, `Ribet1985`, `GhateGonzalezQuer2005` as listed under R05 above. `Greenberg1999` Theorem 4.1 (lines 1480–1488). `Nakamura2023`, `Weibel2013`, `BurungaleTian2025`, `Ribet1981`, `Nakamura2014`, `Colmez1998`: unchanged since the previous review, whose checks I did not repeat.

**Adversarial pass** (statement; instances; values on each side; result; change):

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Conventions: arithmetic polynomial from (14.10.3) | `k=2, ℓ=3, a=2, ε=1` | geometric `1 − 2u + 3u²`; arithmetic `1 − (2/3)t + (1/3)t²` (eigenvalues `1/α,1/β`: sum `2/3`, product `1/3`) | agrees | none |
| 2.0 conditions versus (8.1.2) | `ξ=a(A)`, `S ⊇ prime(mA) ∪ {p}`; `ξ∈SL₂(ℤ)`, `S ⊇ prime(mN) ∪ {p}`; `prime(cd)∩S=∅`, `(cd,6)=1`, `(d,N)=1` | `Kato2004` lines 2477–2479 and 1395–1397: identical | agrees | none |
| 2.0 admissible levels, `ξ=a(A)` | `mA | M`, `N | L`, `M | L`, `prime(M)=S`, `prime(L)=S∪prime(N)`, `L ≥ 4` | `Kato2004` lines 2672–2673: identical; `SL₂` case `m | L`, `N | L`, `prime(L)=S`, `L ≥ 3` (lines 2688–2689) | agrees | none |
| 2.0 composite map | pullback by `(1 a;0 1)`, trace `Y(M,L)→Y(m(A),L)`, `φ_A`, trace to `Y₁(N)⊗ℚ(ζ_m)` | `Kato2004` line 1415 (schemes) and 1449–1452 (forms): the same four steps; the norm along `φ_A^(−1)` is the pullback along `φ_A : Y(m,L(A)) → Y(m(A),L)` | agrees | none |
| 2.0 `(d,A)=1` | `ξ=a(A)`, `d` sharing a prime with A | the class `c,d-z_(M,L)` needs `(d,6pL)=1` (line 2476) and `A | M | L`, so `(d,A)=1`; 12.6(1) and 13.3 print only `(d,6pN)=1` (lines 4098–4099, 4211–4212) | the README's correction is right | none (source issue below) |
| 2.0 raise `L → Lℓ`, `ℓ ∈ S` | `k=2, r=1, a_ℓ=0, ε=1, ℓ=3, σ=1` | wrong rule would multiply by `1 − 0 + 1/3 = 4/3 ≠ 1`; 8.7(1) gives the identity since `prime(Lℓp) = prime(Lp)` | agrees | none |
| 2.0 relation is in `σ_ℓ` | `k=2, r=1, a_3=2, ε=1`; `ψ(σ_3)=−1` / `ψ=1` | `1 + 2/3 + 1/3 = 2` / `1 − 2/3 + 1/3 = 2/3` | two values, so not a scalar | none |
| 2.0 ramified factor | `3 | N`, `k=2, r=1, σ=1` | `1 − a_3/3` versus wrong `1 − a_3/3 + 1/3` | agrees with 8.10 (`A′(ℓ)=0` for `ℓ | N`, line 2710) | none |
| 2.0 label prime sets | `N=11, m=3, p=5` | `a(1)`: `S ⊇ {3,5}`; `SL₂(ℤ)`: `S ⊇ {3,5,11}` | differ, as claimed | none |
| 2.0 `m=1, ξ=a(1), S={p}` | | `M = p^i`, `i ≥ 1`; `L ≥ 4`, `p^iN | L`, `prime(L) = {p}∪prime(N)`; class over `ℤ[1/p]` | agrees | none |
| 2.1 Euler polynomial | `k=4, r=2, ℓ=3, a=2, ε=1` | `1 − (2/9)X + (1/3)X²`; at `t = X`: `1 − (2/3)X + 3X²` | agrees with the Check | none |
| 2.1 Kato's `P_ℓ` is arithmetic | `T=ℤ_p(1)` | `Kato2004` line 4202: `P_ℓ(t) = 1 − ℓt`, `P_ℓ(ℓ^(−1)σ^(−1)) = 1 − σ^(−1)`, the cyclotomic-unit relation | arithmetic Frobenius, as read | none |
| 2.1 `c̃_(2m)` versus `c̃_m` | level 11, `a_2=−2`, `p=3`, `2∉Σ` | `P_2(X) = 1 + X + X²/2`; `P_2 − 1 = X(1 + X/2)`; on ψ: `|ψ(σ_2)^(−1)/2| = 1/2`, nonzero | agrees | none |
| 2.1 norm relation, `ℓ | m` | `m=45, ℓ=5, p=3`, `m′=225` | `S_(m′) = prime(225·A) = prime(45·A) = S_m`: empty product in 8.12 | identity, as claimed | none |
| 2.2 integral pairing | antidiagonal `−2b, b, −2b` | `det = −(−2b)(b)(−2b) = −4b³`; `b=1`: `−4`, nonunit in `ℤ₂` | agrees | none |
| 3.2 `E^(4)_(0,0)` | level one | `6·2ζ(4)/(2πi)^4 = 12(π⁴/90)/(16π⁴) = 1/120 = ζ(−3)` | agrees | none |
| 3.2 level-three sum | `N=3, k=4`, zero class | constant term `2ζ(4)/81`, times `6/(2πi)^4`: `1/9720`; `81/9720 = 1/120` | agrees | none |
| 3.2 Fourier transform twice | pairing `bx − ay` | `N^(k−2)·N^(−k)·N² = 1`; forward `N^(k−2)` would give `N^(2k−2)` | agrees (`Kato2004` lines 860–866) | none |
| 3.3 overlap `r=r′=k−1` | `k=2, M=N=5` | `(−1)(0!)^(−1)5^(−1)5^(−1) = −1/25` both branches | agrees | none |
| 3.3 smoothing exponents | `(u,v)=(1,1)`, `c=5, d=7`, trivial χ | `25−5=20`, `49−7=42` | agrees with (4.2.4) | none |
| 4.1 reduced norms at `k=3` | odd p | `(k−1)=2`, `[ℤ_p^×:(ℤ_p^×)²] = 2` | openness only in the group of pairs | none |
| 4.1 clause (1) at `B=M₂(ℚ)` | elliptic curve, `F=ℚ` | `{x ∈ GL₂(ℚ_p)}`; `GL₂(ℤ_p)` is open in it, so an open subgroup of `GL₂(ℤ_p)` is open there | consistent with 4.7's reading | none |
| 4.1 clause (3) inputs | Loeffler 1.2.3 | hypotheses: per-p open, almost-all `G(ℤ_p)`, image in `ℚ̂^×` open (lines 175–180); (1), (2), `κ̂(H)` open supply them | agrees | none |
| 4.2 boundary line | `k=3`: `(k+1)/2 = 2`; `k=4`: `2.5`, `r=3` | `k−1 ≥ (k+1)/2 ⇔ k ≥ 3` | agrees | none |
| 4.2 CM example | weight 3, level 7, `p=3` inert, ψ mod 3 | `(−7/3) = −1`; `L_({3})(g,s) = L(g,s)(1 − 3^(2−2s))`: zero at `s=1` | agrees | none |
| 4.2a local `H²_Iw` | `T=ℤ_p(2)`, p odd | `H⁰(ℚ_p,(ℚ_p/ℤ_p)(−1)) = 0`; over `ℚ_p(μ_(p^∞))` all of `ℚ_p/ℤ_p`, dual `ℤ_p ≠ 0` | agrees | none |
| 4.3 `Hyp(ℚ_∞,V)(i)` at `K=ℚ` | units `±1`, `K(1)=ℚ` | `p`-power roots of `−1` lie in `μ_(2p^∞)`; σ fixing `μ_(2p^∞)` satisfies Rubin's three bullets (lines 1379–1381) | agrees | none |
| 4.3 integral clause | Kato 13.4(3) | `p ≠ 2`, `Coker(1−σ)` free of rank one, residual irreducibility over `G_ℚ` (lines 4251–4256) | identical | none |
| 4.4 CM subfields | `p=2`, odd p | `ζ₈ + ζ₈³ = i√2`; `ℚ(√p*)` imaginary iff `p ≡ 3 (4)` | agrees | none |
| 4.5 `finite_of_regular_annihilator` | `μ = p` | `Λ/(p)` infinite, support contains `(p)`; a height-one prime over `(p,μ)` is minimal over `(μ)`, hence associated | hypothesis needed and present | none |
| 4.6 twist scalar | `κ(γ)=4` over `ℚ₃`, `j=1` | `4t = t ⇒ 3t = 0 ⇒ t = 0`; `μ₃` fixed since `4 ≡ 1 (3)` | agrees | none |
| 4.7 openness ≠ surjectivity | `p=5` | `1 + 5M₂(ℤ₅)` open; `|GL₂(𝔽₅)| = 24·20 = 480` | agrees | none |
| 4.7 dyadic `H¹` | `GL₂(ℤ/4)` on `(ℤ/4)²` | brute force: `|Z¹| = 32`, `M^G = 0`, `|B¹| = 16`, `H¹ ≅ ℤ/2`; inflation from `GL₂(ℤ/4)` into `H¹(GL₂(ℤ₂), E[2^∞])` is injective since `E[2^∞]^(1+4M₂) = E[4]` | the README's remark is right; Rubin 5.8(ii) fails at `p=2` (source issue) | none |
| 4.7 CM witness | `y² = x³ − x` | `(x,y) ↦ (−x, iy)` has degree one, is not `[±1]` | hypothesis fails as stated | none |
| 4.7 ownership | `AdelicImagesAndModularCurves` §4.3 | same statement over every number field, with its own proof route | second owner | R01 |
| 5.3 interpolation | Kato 12.5(1) | sign `(−1)^(k−r−1)χ(−1)`, factor `(2πi)^(k−r−1)L_({p})(f*,χ,r)γ^±`, conjugation `−σ_(−1)` (lines 4053–4070) | agrees | none |
| 6.1 Gauss sum | quadratic χ mod 3 | `G = ζ₃ − ζ₃² = i√3`, `G^(−1) = −i/√3`, `G(χ)G(χ^(−1)) = −3 = χ(−1)·3` | agrees | none |
| 6.1 (ii) factor | `r=1` | `1 − p^(r−1)φ^(−1) = 1 − φ^(−1)` (line 5953) | agrees | none |
| 6.2 hypotheses | Kato 16.2, 16.6 | `v_p(α) < k−1`, `γ^± ≠ 0`, `⟨ω,η⟩ = 1`, `φ(η) = αη` in `F_λ(α) ⊗ D_crys` (lines 5902–5904, 5978–5979) | agrees | none |
| 6.4 CM curve at 3 | `y² = x³ − x`, `p=3` | reduction has 4 points, `a_3 = 0`, `α² = −3`, `α^(−1) = −α/3`, `(1 + α/3)² = 2/3 + 2α/3 ∉ ℚ₃` | agrees | none |
| 6.5 critical slope | `p=3, u=4, k=2` | `log₃(4/4) = 0`; `log₃(1/4)` has valuation `v₃(4−1) = 1` | agrees | none |
| 6.6 real period | `y² = x³ − x`; `y² = x³ + x` | two components, `Ω_E = 2Ω_E⁺`; one component, `Ω_E = Ω_E⁺` | agrees with Rubin 5.3's normalization once `r_E = c_∞ r_E⁺` | none |
| 6.6 dyadic logarithm | `y² + xy = x³ + 1` | `b₂=1, b₄=0, b₆=4, b₈=1`, `Δ = −1 − 432 = −433`; `log(2u) = 2u + 2u² + (8/3)u³ + …`; `2u(1+u) ∈ 4ℤ₂`, tail in `4ℤ₂` | image `4ℤ₂`, not `2ℤ₂` | none |
| 7.5 reduction group | `y² = x³ + x`, `p=5` | affine points `(0,0),(2,0),(3,0)`, order 4, `a_5 = 2`, ordinary; `[5] = id` on it; `Ẽ(𝔽₅)[5^∞] = 0` | agrees | none |
| 7.7 anomalous factor | unit root α | `|Ẽ(𝔽_p)| = (1−α)(1−β)`, `1−β` a unit, `1−α^(−1) = (α−1)/α` | p-parts agree | none |
| 7.9 arithmetic factor | level 11 ⊗ cubic θ, `ℓ=2`, `θ(2)=ζ₃`, `p=5` | `a_2(f) = −2ζ₃`, `ε_f(2) = ζ₃²`; `V(f*)(1)`: `1 + 2ζ₃t + 2ζ₃²t²`; `V(f)(1)`: `1 + 2ζ₃²t + 2ζ₃t²` | differ, as claimed | none |
| 7.9 character part | `K=ℚ(ζ₃)`, quadratic χ | kernel generated by `1+σ`; order-3 fixed point: `2P ≠ 0`; order-2 fixed point: `2P = 0` | agrees | none |
| 7.9 extra Euler factors | `m=5, a_5=1`; split; nonsplit; `m ≡ 2 (4)` good at 2 | `1 − 1/5 + 1/5 = 1`; `4/5`; `6/5`; `(3 − a_2)/2 ≠ 0` for `|a_2| ≤ 2` | nonzero | none |
| `ellipticCyclotomicFiniteGeneration` | `m=0` (junk); `m=1`; `m=6` | `x^(0^n)=1`: `n ≥ 1` admits every x, field ℂ, `E(ℂ)` not finitely generated; `m=1`: ℚ, Mordell–Weil; `6^n | 6^(n+1)`, nested | `1 ≤ m` needed and present | none |
| `ellipticCharacterPoints_finite` | `m=1`; `m=2` | `χ(0)=1`, part `= E(ℚ)`, series `L(E,s)`; `K=ℚ`, factor at 2 removed and nonzero | agrees with the docstring | none |
| `serre_surjective_almostAll` | non-prime ℓ; CM curve | excluded by `∃ _ : Fact ℓ.Prime`; hypothesis fails on `y² = x³ − x` | sound as a statement | R01 (ownership) |

**Headline theorems.** From the README: Kato's canonical zeta morphism, its interpolation and the finite index (5.1–5.3), the module structure (4.4), Nakamura's twist-one map and the parabolic characterisation (5.4, 5.6), Perrin-Riou's map (6.1), the regulator equality (6.4), Beilinson's formula (3.4), the cohomological bound (7.1–7.2), the elliptic divisibilities and control (7.4, 7.6, 7.7), the rank-zero Ш bound (7.8), finite generation over the cyclotomic towers (7.3, 7.9), Selmer finiteness over abelian fields with the χ-parts (7.9), the Tamagawa bound (7.9), Momose–Ribet–Loeffler openness (4.1) and Serre's almost-all surjectivity (4.7). Those not statable are named in the module docstring with the missing carrier (4.1 is not statable at the pins either, lacking the modular Galois representation; its omission from the docstring is not a finding). The statable ones are stated; the one that is stated but owned elsewhere is R01.

**Gaps.** None declared by this roadmap; `HeegnerPointEulerSystems` and `ModularIwasawaMainConjectures` declare gaps on it, which are their contracts.

## Not verifiable

- `Serre1972` and `FontaineMessing1987`: waived, cited by locator only.
- `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `BlochKato1990`, `DiamondShurman2005`: uncertified, cited by locator only; the uses in 4.2, 7.5, 7.7 and 7.9 agree with how Kato §§13–14 and Rubin III.5 cite them.
- `Kato2004` is a scan whose OCR garbles displayed formulas: the Euler factor of Proposition 8.10 (line 2707), the coefficient of 8.12 (line 2723) and the operator `A′(ℓ)` (lines 2708–2711) are read from the surrounding text and from 13.3 (lines 4224–4225), and agree with the README; the displayed formula of Theorem 2.6 (line 457) and the sign in 3.11(2) (line 1018) could not be read.

## Source issues

- **Misprint** in Kato2004 at Theorem 12.6(1) and Example 13.3, printed pp. 222 and 225: the source lists only `(c,6pA) = (d,6pN) = 1` for the labels `a(A)`; it should also require `(d,A) = 1`, since the class on `Y(M,L)` of 8.9 needs `(d,6pL) = 1` with `A | L`; affects a stated result (its hypotheses).
- **Error** in Rubin2000 at Proposition III.5.8(ii), printed p. 50: the source says `H¹(ℚ(E[p^∞])/ℚ, E[p^∞]) = 0` whenever `ρ_(E,p)` is surjective; it should exclude `p = 2`, where `H¹(GL₂(ℤ/4), (ℤ/4)²) ≅ ℤ/2` inflates injectively into that group; affects a stated result (the proof of Theorem 5.11 already restricts to `p ≠ 2`, line 2344).
- **Misprint** in Kato2004 at 14.5(3), printed p. 237: the source says "the condition (12.5.1) in Thm. 12.5(4)"; it should be (12.5.2); affects nothing.
- **Misprint** in Kato2004 at 16.4(ii), printed p. 270: the source says `η′ ∈ D_crys(V_(F_λ)(f))`; it should be `η′ ∈ D_crys(V*(1))`; affects nothing.
