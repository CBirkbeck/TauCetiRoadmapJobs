<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6487726558 -->
Red team round 2 pass b (claude) of 9a2ec7c

Verdict: needs_changes

1. **F01** (P3) Serre's open-image theorem is planned a second time by a later open roadmap

   Location: README line 49–50 ("Serre's open-image theorem for E/ℚ through modularity and its
   consequences") and `Suggested.lean` line 47 (`serre_openImage`).

   Claim: this roadmap owns Serre's open-image theorem for elliptic curves over ℚ.

   Witness: `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md` at rev/1727, line 1217 ("Layer 4:
   Serre's open image theorem and the CM counterpart"), line 407 ("stated by no roadmap"), line 1286
   (no Lean declaration there). Its prerequisites include EllipticCurveModularityPartII (line 98),
   merge order 337, after KatoEulerSystems at 310.

   Why this roadmap is the owner: it is earlier in the merge order, the other roadmap is at the design
   stage and lands after a supplier that follows this one, so it cannot be cited here; and 4.7 is a
   corollary of 4.1 through modularity, not a re-plan of Serre's Lie-algebra proof. The statement
   "stated by no roadmap" at rev/1727 is false at this head.

   Exact repair: in the Scope bullet replace "Serre's open-image theorem for E/ℚ through modularity
   and its consequences" by "the case over ℚ of Serre's open-image theorem, as a corollary of 4.1 and
   modularity, with its consequences; the theorem over number fields with its Lie-algebra proof is not
   planned here". Under "Downstream consumers" add: "`AdelicImagesAndModularCurves` plans the
   open-image theorem over number fields; its case `K = ℚ` is 4.7 here." No change to the Lean
   statement.

2. **F02** (P2) The value at `r = 1` of the imprimitive twisted L-function can vanish

   Location: README line 1445–1448, "For `k ≥ 3` and χ ramified at p the value at `r = 1` is then
   nonzero as well, by the functional equation".

   Claim: `L_({p})(f*,χ,1) ≠ 0` for every newform f of weight `k ≥ 3` and every finite-order χ ramified
   at p.

   Witness: let g be the weight-3 CM newform of level 7 and nebentypus `χ_(−7)` (CM by `ℚ(√−7)`),
   `p = 3` (inert, `(−7/3) = −1`, so `a₃(g) = 0`, `ε(3) = −1`), ψ the quadratic character of
   conductor 3, and `f = g ⊗ ψ`, a newform of level 63. Then `f* ⊗ ψ = g` and
   `L_({3})(f*,ψ,s) = L_({3})(g,s) = L(g,s)·(1 − 3^(2−2s))`, which is `0` at `s = 1` although
   `L(g,1) ≠ 0`.

   The functional equation controls the primitive L-function of the twisted newform; when `p | N`
   and the twist lowers the level at p, the naive twisted series differs from it by the Euler factor
   of the primitive associate at p, whose roots have absolute value `p^((k−1)/2)` or `p^((k−2)/2)` and
   can equal p (`k = 3` at a prime of good reduction of the associate, `k = 4` at a special prime).
   No target consumes the sentence (2.3, 6.2 and 7.9 use `r = k − 1` or `k − r ≥ (k+1)/2`).

   Exact repair: replace the sentence by "For `k ≥ 3`, `p ∤ N` and χ of conductor `p^a`, `a ≥ 1`, the
   twist `f* ⊗ χ` is new at p with `a_p = 0`, so `L_({p})(f*,χ,1) = L(f*⊗χ,1)`, nonzero by the
   functional equation of `ModularForms` Layer 7 relating it to `L(f⊗χ^(−1),k−1)`; when `p | N` the
   primitive associate may carry an Euler factor at p vanishing at `s = 1`, and no claim is made."
   Add the level-63 example as a negative-control Check. On the instance the repaired sentence makes
   no claim; on `g` itself with `χ = ψ` (`p ∤ 7`) it gives `L(g⊗ψ,1) ≠ 0`.

3. **F03** (P3) The conductor-n interpolation omits the twist by exponent one

   Location: README line 1761–1764, "the dual exponential of the m-th specialization lies in
   `S(f) ⊗ ℚ(ζ_(np^m))` and its χ-weighted period sum is `L_({p},n)(f*,χ,k−1) γ^±`".

   Claim: the dual exponential is applied to the m-th specialization of `z^Ka_n(γ)` itself.

   Witness: Nakamura2023 line 3710–3717 defines `exp*_(m,r)` as twist by `(ζ_(p^j))^(⊗r)`, then
   specialization, localization and `exp*`, landing in `Fil^r D_dR ≅ S₁(f)`; Theorem A.1 (line
   3753–3754) uses `exp*_(m,1)`. Without the twist the image lies in `Fil⁰ D_dR(V(f)) ⊗ ℚ(ζ)`, not in
   `S(f) ⊗ ℚ(ζ_(np^m))`. At `n = 1` the statement must be 5.3 at `r = k − 1`, which twists by
   `k − r = 1`.

   Exact repair: replace "the dual exponential of the m-th specialization" by "the dual exponential
   of the m-th specialization of its twist by the compatible roots with exponent 1 (Nakamura's
   `exp*_(m,1)`; the case `r = k − 1` of 5.3)". At `n = 1` this gives exactly 5.3 with `k − r = 1`.

4. **F04** (P3) 5.4 states the Betti scalar of the edge value in two incompatible ways

   Location: README line 1911–1912, "the corresponding edge critical value is `L_({p},n)(f,χ,k−1)`
   with `(2πi)^(1−k)γ` and sign `χ(−1)`", against line 1923–1927, "the χ-sum of the periods ... is
   `L_({p},n)(f,χ,k−1)·γ^±` (Nakamura, Corollary A.5)".

   Claim: both describe the same value.

   Witness: Nakamura2023 line 3840–3852 (Corollary A.5) writes `L_({p},n)(f,χ,k−1)·γ^±` with
   `γ ∈ V′₁(f)_F` and the target `V₁(f)^±_ℂ`, no power of `2πi`; the identification of `V′₁(f)_F` with
   an F-structure on `V₁(f*)` is the Betti form of Lemma A.3 (line 3814–3817), which carries the
   twist `(1−k)`. The two README sentences differ by the factor `(2πi)^(1−k)` and the roadmap does not
   say which identification of γ it uses. The nonvanishing Check is unaffected (`2πi ≠ 0`).

   Exact repair: after "use the rank-two `Γ₁` literal-dual quotient `V′` with `V′(1−k) ≃ V(f*)`
   (2.2)" add "write γ′ for the image of `γ ∈ V′_F` under the Betti form of this isomorphism, which
   relative to the untwisted comparison multiplies coordinates by `(2πi)^(1−k)`; Nakamura's `γ^±` in
   Corollary A.5 is `γ′^±`". Then write the edge value once, in the text and in the Check, as
   `L_({p},n)(f,χ,k−1)·γ′^±`, and delete "`(2πi)^(1−k)γ`" from line 1912.

5. **F05** (P3) The repeated-prime identity factor for `ℓ ≠ p` is attributed to a supplier statement that covers only `p`

   Location: README line 830–834, "and to `c̃_m` when `ℓ | m`; this is `modularZeta_norm` and
   `modularZeta_trace` after projection".

   Claim: PadicFamilies §4.0.1 supplies the identity factor for `ℓ | m`, `ℓ ≠ p`.

   Witness: PadicFamilies §4.0.1 at its head: "For a new prime `ℓ ∤ Mpcd` ... the conductor norm
   factor is ...; the repeated `p`-level factor is the identity. Prove the `p`-level trace relation";
   the README's own contract (line 236) reads `modularZeta_trace` as "identity factor in the
   p-direction". The repeated-prime case for `ℓ ≠ p` is Kato Proposition 8.12 with `S′ = S`
   (Kato2004 line 2715–2724), proved through 8.10 and 8.7, that is, the prime-set-preserving level
   raise of 1.1 here followed by the moment.

   Exact repair: replace "this is `modularZeta_norm` and `modularZeta_trace` after projection" by
   "for `ℓ ∤ m` this is `modularZeta_norm` after projection; for `ℓ | m` it is the identity transfer
   of k2NormProjection (1.1) carried through the moment by `modularZeta_moment` and, for `ℓ = p`,
   `modularZeta_trace`; both are Kato Proposition 8.12 (S′ = S for the repeated prime)". Add "1.1" to
   the *Needs* line of 2.1. On the instance `m = 9·5`, `ℓ = 5` (`p = 3`), the identity factor is then
   owned by 1.1 (`(M,N) = (5,·) → (25,·)` keeps `prime(M)`).

6. **F06** (P3) pathClassCoefficient has one discriminating Check

   Location: README line 1251–1273 (definition of `δ_N(k,v)`, its smoothing and `c-δ_(N,n)`; Checks
   "coefficient zeta and path classes").

   Claim: each definition has at least three discriminating Checks.

   Witness: of the three bullets, only the last mentions the path class, and it tests only `k = 2`,
   `n = 1`. The smoothing operator, the push-forward identity `f_*δ_N(k,v) = δ_M(k,v) ⊗ 1` and the
   conjugation sign are untested; the zero class or a sign error in the smoothing passes every Check.

   Exact repair: add three Checks. "At `k = 2`, `j = 1` the smoothing is `(c² − c·diag(c,1)^*)(c² −
   c·diag(1,c)^*)`; with the exponents `k − j` and `j` exchanged it is unchanged only at `j = k/2`,
   so at `k = 4`, `j = 1` the two orders differ (`c³` against `c` on the first factor)." "For `N = M`
   and `n = 1` the push-forward is the identity and `δ_N(k,v) ⊗ 1 = δ_N(k,v)`; a push-forward that
   rescaled by the degree would give `[GL₂(ℤ/N) : 1]` times it at `N = M`." "Complex conjugation on
   `Y(N)(ℂ)` reverses the path `y ↦ (iy,1)` up to the action on the stalk basis, so `ι^*δ_N(k,v) =
   ±δ_N(k,ι v)` with the sign fixed by `k = 2` (`ι^*δ = −δ` on the class of Kato 2.7); a definition
   with the cusps interchanged changes `δ^−` to `−δ^−`." Each is refuted by the zero class.

Round 2. The head carries the round-1 repairs; each earlier finding is checked below against the
head first, then the full pass is run again. Line numbers refer to
`packages/KatoEulerSystems/README.md` at 9a2ec7c unless another file is named.

## Round-1 repairs at this head

| Finding | Repaired passage at 9a2ec7c (witness) | Status |
|---|---|---|
| r1a F01 torsion index | line 471–474: `(α,β) = (a/N, b/N)` with `a, b ∈ ℤ/N`, pullback along `ae₁ + be₂`, "well defined because `Ne₁ = Ne₂ = 0`" | repaired |
| r1a F02 / r1b F01 `m = 1` | line 794–795: domain "excludes `m = 1`"; line 858–860: class at ℚ is `Cor c̃_p`, no Euler factor since `p ∈ Σ`; line 822–829 components at ℚ, `ℚ(ζ_(p^n))`, `ℚ_n` | repaired |
| r1a F03 Λ-span | line 1816–1821: Λ-span and `Λ_ℚ`-span of all values coincide; distinction moved to lattice inputs with the Nakayama argument | repaired; the Nakayama step is correct (finitely generated, `p` in the radical) |
| r1a F04 K₂ norm | line 691–705 transferNormRealization (a),(b); K₂ identity only when `SK₁(R) = 0`; line 709–714 rotation Check | repaired; the Laurent-boundary witness recomputed: `∂([A]·[t]) = ±[A] ≠ 0` since `K₁(B) → K₁(B[t,t⁻¹])` is split injective |
| r1a F05 §9.35 | line 381–386 contract and 2068–2074: only `𝔐_z` on its range and `Λ_(D,z)(θ) = φ^(−n)𝔐_z(θ)`; Check 2085–2088 | repaired; matches PadicHodgeRegulators §9.35 at its head (its first Check gives `2^(−n)d` against `d`) |
| r1a F06 conductor components | line 796–809 conductor family `c̃_m`, transport by §2.4(a); Check 861–867 (level 11, `p = 3`, `P₂(X) − 1 = X(1 + X/2)`) | repaired; EulerSystemsAndKolyvaginSystems §2.4(a) at its head states exactly the transport used |
| r1a F07 theta base | line 475–479 (`ℤ[1/Nc]` first), 591–597 siegelIntegralDescent, contract 226–228 | repaired |
| r1a F08 phase | line 573–583, Check 608–612: `(−ζ₇)^(−10) = ζ₇⁴` (recomputed: `−10 ≡ 4 mod 7`) | repaired |
| r1a F09 conductor-n map | line 1749–1770 katoZetaMapConductor; line 1896 names it in 5.4 | repaired, with one new imprecision (S03 below) |
| r1a F10 coefficient zeta | line 1237–1259 operatorZetaCoefficient, pathClassCoefficient; §5.6 cites them | repaired, with one Check shortfall (S06 below) |
| r1a F11 identity Checks | deleted; nonzero Checks at 959–965, 1923–1928, 2136–2139 | repaired, with one inconsistency (S04 below) |
| r1a F12 Serre headline | `Suggested.lean` line 47–57 `serre_openImage`; README 4.7 | repaired; see S01 for ownership |
| r1a F13 twist_specialize | name gone (grep: no occurrence); line 1627–1633 imports the finite-coefficient description from SelmerIwasawaCohomology §3.7, whose head text states it | repaired |
| r1a F14 Hecke linear | line 926–935, 966–969 | repaired |
| r1a F15 finite Σ | line 792–793, 1469, 1176 | repaired |
| r1a F16 docstring | `Suggested.lean` line 18–35 | repaired |
| r1a F17 η owner | line 1275–1284, contract 433–438; Polylogarithms §5.13 at rev/1424 line 1240–1264 has `η(f,g) = log|f| d arg g − log|g| d arg f` and `curveEtaRegulator_beilinson` | repaired |
| r1a F18 Check | line 514–518 | repaired |
| r1a F19 division places | marked not actionable with a reason (no published argument at division places; Kato 12.8.2 fails there) | settled; the reason is accurate, not re-raised |
| r1a F20 pp. 163–179 | line 1297, 2900–2901, `sources.toml` Kato2004 locator | repaired |
| r1b F02 `ℋ_(k−1,L)` | line 2206–2212 | repaired |
| r1b F03 4.2a locators | line 1473–1474; References 2932–2935; `sources.toml` Rubin2000 locator | repaired |

No repair introduced an error beyond S03, S04 and S06 below, which are refinements of repaired
passages.

## Verified sound

Head: the board checkout is at 9a2ec7c; `git diff --stat origin/main...HEAD` touches only
`packages/KatoEulerSystems/` (README.md, Suggested.lean, metadata.toml, sources.toml,
design/plan.json, reports/). The whole README (2,968 lines) and `Suggested.lean` (101 lines) were
read line by line. `design/plan.json` declares no gaps and the README states none.

Dependency check, verbatim:

    depcheck: 188 roadmaps, 1163 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. The citation resolver's one lead (`ClassicalAlgebraic.finiteTrace`,
README line 430) is a name of EtaleCohomologyFoundations §0.8 on main (its README line 582 and
`Suggested.lean` line 514), not a library name; it resolves.

Policy: no `lemma`, `set_option`, `#eval`, `#print`, `#synth`, pull-request number, process word
or machine path in the README or the Lean file; no computational algorithm; `theorem` throughout;
imports are `import Mathlib` and three `TauCeti.*` modules that exist at the pinned Tau Ceti
(358314d4). Every backticked name of this roadmap's own in the README (`serre_openImage`,
`ellipticCharacterPart`, `ellipticCharacterPoints_finite`, `ellipticCyclotomicFiniteGeneration`) is
declared in the Lean file and every Lean name appears in the README.

### Suggested.lean against the pins (4 declarations)

No Lean was run (read-only pass; the worker's elaboration failed on a missing object file, which is
tooling, not the package). Each declaration was compared with the pinned sources by reading.
Pins: Mathlib f6090c70, Tau Ceti 358314d4. Declarations opened:
`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean` line 71
(`tateModuleGaloisRepresentation : Representation ℤ_[ℓ] (K ≃ₐ[F] K) (TateModule ℓ (W⁄K).toAffine.Point)`,
with `[DecidableEq K]`), `TateModule/Basic.lean` line 74–95 (free of rank 2 over `ℤ_[ℓ]`),
`Isogeny/Hom/Basic.lean` line 106 (`structure Hom`, zero map included),
`Isogeny/Hom/Ring.lean` line 174 (`Ring (Hom W₁ W₁)` under `IsElliptic`),
`Affine/Point/Galois.lean` line 47–60 (`pointGaloisAction`, `toAdd` applies `Affine.Point.map`),
`Mathlib/RepresentationTheory/Basic.lean` line 512 (`asGroupHom : G →* Units (V →ₗ[k] V)`),
`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` line 66–85 (`LFunction : ArithmeticFunction ℤ`
over a number field, Euler product of the local polynomials),
`Mathlib/NumberTheory/Cyclotomic/Gal.lean` line 77 (`autEquivPow`, σ ↦ k with σμ = μ^k),
`Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean` line 190 (`cyclotomic.irreducible_rat`),
`Mathlib/Algebra/MonoidAlgebra/Defs.lean` line 76–81 (`MonoidAlgebra` is a structure with `coeff`),
`Mathlib/NumberTheory/MulChar/Basic.lean` line 151 (`toUnitHom`), `Mathlib/Algebra/Group/Units/Hom.lean`
line 111 (`coeHom`). The docstring's library claims hold at the pins:
`ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean`
line 71) and Tau Ceti `selmerGroup₂` (`MordellWeil/SelmerGroup.lean` line 104).

| Declaration (section) | Binders carried | README statement | Instances and values | Result |
|---|---|---|---|---|
| `serre_openImage` (4.7) | `W`, `[W.IsElliptic]`, `[DecidableEq (AlgebraicClosure ℚ)]`, `hW : ∀ φ : Hom (W⁄ℚ̄) (W⁄ℚ̄), ∃ n : ℤ, φ = n` | line 1665–1671 | `(n : Hom)` is `n • 1 = [n]` (`zsmul_one` in any ring); `n = 0` is the zero map, allowed in the carrier. `y² = x³ − x`: `(x,y) ↦ (−x,iy)` has degree 1 and is not `[±1]`, so `hW` fails, as it must. Range is a subgroup of `(End_(ℤ_ℓ) T_ℓ)ˣ ≅ GL₂(ℤ_ℓ)` since `T_ℓ` is free of rank 2; `FiniteIndex` of a closed subgroup of a profinite group is openness. `ℓ = 2`: only finite index asserted; the exceptional set is finite. | agrees; headline statable and stated |
| `ellipticCyclotomicFiniteGeneration` (7.9, Kato 14.4) | `W`, `[W.IsElliptic]`, `m`, `1 ≤ m` | line 2788–2793 | `m = 1`: `{x : x = 1}`, field ℚ, Mordell–Weil; `m = 0` would adjoin all of ℂ and is excluded; `m = 6`: `6^n | 6^(n+1)`, nested union. Kato 14.4 (line 4630–4631) is for every `m ≥ 1` and every quotient of `J₁(N)`, CM included; modularity (EllipticCurveModularity R29.6) supplies the quotient. | agrees |
| `ellipticCharacterPart` (7.9, Kato 14.2's `M^(χ)`) | `W`, `[W.IsElliptic]`, `K`, `[Field K] [DecidableEq K] [Algebra ℚ K]`, `ψ` | line 2729–2739 | Kato line 4600–4603: `I_χ = ker(ℤ[G] → ℂ)`, `M^(χ) = {x : I_χ x = 0}`. Trivial `G`: kernel 0, all points. `C₂`, `ψ(σ) = −1`: `1 + σ` kills; fixed `P` of order 3 gives `2P ≠ 0`, of order 2 gives `2P = 0`. Zero point always belongs. | agrees; real body, no division by `|G|` |
| `ellipticCharacterPoints_finite` (7.9, Kato 14.3(2)) | `W`, `[W.IsElliptic]`, `m`, `[NeZero m]`, `K`, instances, `[IsCyclotomicExtension {m} ℚ K]`, `χ`, `F`, `hF`, `hcont`, `hne` | line 2741–2753 | `m = 2`: `K = ℚ`, series `L_((2))(E,s)`, `F(1) = L(E,1)(1 − a₂/2 + 1/2)`, the factor nonzero. The statement is insensitive to `χ` against `χ̄`: `E(K) ⊗ ℂ` is defined over ℚ so the `χ`- and `χ̄`-multiplicities agree, and `L(E,χ̄,1) = conj L(E,χ,1)`. `F` entire with agreement on `Re s > 3/2` determines the continued value; the total `LSeries` at 1 is never used. | agrees |

Headlines and padding: the README's headlines are the zeta morphisms (§§5.1, 5.4, 5.6), the
regulator equality (§6.4), non-torsion and the bound (§§7.1–7.2), finite generation and classical
finiteness (§7.3), the divisibilities (§7.4), no finite submodule (§7.6), the rank-zero bound
(§7.8), Serre's theorem (§4.7) and §7.9's theorems. The three statable at the pins are stated; the
module docstring names each of the others with the carrier it lacks. One-tactic probe by reading:
none of the three theorems is a library lemma, a restated definition, a Check or a small value;
the one `def` is used by a headline. Zero padding.

### Targets, suppliers and sources

Targets read: every target of §§0.1–7.9 (46 sections, 76 named targets including the four added
in round 1). Supplier citations resolved at this round (each roadmap read as it is now: on main for
ModularCurves §§0A, 2A, 2D, 2E, 5B; ModularForms Layers 0, 7, 9; EllipticCurves Layers 1, 4, 4.5b,
6, 7; PadicMeasuresIwasawaAlgebras §§4.1–4.6; EtaleCohomologyFoundations §0.8; and at the open
heads for PadicFamilies §§4.0.1–4.0.3 (#1019), SelmerIwasawaCohomology (32 sections),
EulerSystemsAndKolyvaginSystems §§2.1–2.2, 2.4–2.5, 4.3, 4.17, 8.2–8.3, 8.6–8.7, 8.16, 8.37–8.39,
AutomorphicGaloisRepresentations §§1.2, 1.5–1.6, 4.5, 4.8, 5.1–5.2, 6.1, 7.2–7.3, 7.5,
ModularCurvesPartII (29 sections, including 5.8(c)'s `⊔ Spec ℤ[ζ_n][[q^(1/n)]]` and 16.2),
ModularSymbolsPadicLFunctions §§0.2, 0.7–0.8, 1.1–1.3, 2.5, 3.0–3.3,
CompletedCohomologyAndLocalGlobalCompatibility §2.6 (its (b) has twist `(1)` with `𝒱_W`, rational
isomorphism, integral map), EllipticCurveModularity R29.4–R29.6, SchemeKTheoryOperations §§2.2–2.4,
3.6, 6.1, K2SymbolsBrauer §§6.4, 6.7–6.9, 8.1, ArithmeticGaloisDuality §§R02.1.2, R02.2.1–R02.2.3,
R02.4.2–R02.4.4, D7.3–D7.4, AutomorphicLFunctionsAndLocalFactors anchor `rs-boundary-nonvanishing`
(line 2294 of its head: zero-free on `Re(s) ≥ 1`, pole exception, removed factors regular and
nonzero), GL2AutomorphicRepresentationsAndTransfer §R16.5.3, HeightsRationalPointsAndObstructions
§1.7, PadicHodgeRegulators §§1.4, 1.7, 1.11, 8.8, 8.13–8.16, 8.18, 8.20–8.22, 9.31–9.36 (rev/1498),
Polylogarithms §5.13 (rev/1424)): 160 section citations located, all present with the hypotheses
the README states. Every supplier is on main or earlier than KatoEulerSystems (merge order 310).
Downstream: ModularIwasawaMainConjectures and HeegnerPointEulerSystems (rev/1423, lines 59, 1060,
1467) cite this roadmap as the README says; RankZeroOneBSDPartII (rev/1732) does not cite it, and
the README only says it "can use" the statements.

Locators verified in the cached texts this round (34): Kato2004 2.5–2.6 (line 432–457: `Re(s) > 2`,
holomorphic at `s ≠ 2`, `Z(0) = 0`), 4.5–4.6 (1087–1130: `Re(s) > k`, holomorphic at `s ≠ k`),
8.9–8.12 (2671–2724), 12.4–12.6 (4046–4102), 13.1–13.7 (4174–4293), 14.2–14.8 (4596–4739), 14.13
(4850–4875); Nakamura2023 §3.1.5 (1782–1823), (19)–Corollary 3.6 (2040–2120, the factor
`1/(2πi)^(k−1)` in (20)), Appendix A (3700–3862: `exp*_(m,r)`, `μ_n`, Theorem A.1, Lemma A.3,
Definition A.4, Corollary A.5, Remark A.6); Rubin2000 Hyp(K,T)/Hyp(K,V) and `K(1)` (1223–1235:
the maximal p-extension inside the Hilbert class field, so `ℚ(1) = ℚ`), Hyp(K_∞,·) (1373–1386),
Proposition II.3.7 (1442–1443), III.5.1–5.3 (2200–2253), 5.4–5.11 (2260–2330), 5.13–5.18
(2374–2470); Loeffler2017 Theorem 2.2.2 with (†), Corollary 2.2.3, Theorem 2.3.1 (254–289);
Weibel2013 as in round 1; Polylogarithms, EtaleCohomologyFoundations as above. All agree with the
README as stated except S02–S05.

### Adversarial computations

"Retain" means the instance agrees with the passage; it proves nothing beyond it.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 2.1 Euler polynomial | `k = 2, r = 1, ℓ = 3, a = 2, ε = 1` | `1 − (2/3)X + (1/3)X²`; Kato 13.3 line 4224–4225 | Retain |
| 2.1 repeated prime | `m = 45`, `ℓ = 5`, `p = 3` | supplier: identity only for repeated `p`; Kato 8.12 with `S′ = S`: identity | S05 |
| 2.1 layers | `p = 2`, `ℚ_n` | conductor `2^(n+2)`; `ℚ(ζ_2) = ℚ` conductor 1 | Retain |
| 3.4 `Z_(M,N)` poles | weight-2 Eisenstein `(1,ψ)`, ψ even | `ζ(s)L(ψ̄,s−1)`: `L(ψ̄,0) = 0` cancels the pole at `s = 1`; pole at `s = 2` | Retain (Kato line 445) |
| 3.4 `Z_(M,N)` poles | `(1,1)` on `Y(ℓ₀,ℓ₀)` | `ζ(s)ζ(s−1)(1−ℓ₀^(−s))(1−ℓ₀^(1−s))`: zero of `(1−ℓ₀^(1−s))` at 1 cancels; pole at 2 | Retain |
| 3.4 `Z_(Σ,n)` poles | `E_k`, even `k ≥ 4` | `ζ_Σn(s)ζ_Σn(s−k+1)`: pole at `s = k`; at `s = 1`, `ζ(2−k) = 0` cancels | Retain ("at most a pole at `s = k`") |
| 3.4 `Z_(Σ,n)` poles | `k` odd, `(1,ψ)` with ψ odd | `L(ψ̄,2−k) = 0` (odd ψ, odd negative integer) | Retain |
| 4.2 edge values | `k = 3`, `s = 2 = (k+1)/2` | removed factors `1 − αℓ^(−2)`, `|αℓ^(−2)| ≤ ℓ^(−1) < 1` | Retain |
| 4.2 `r = 1` claim | `g` level 7 weight 3 CM, `p = 3`, ψ mod 3, `f = g⊗ψ` | `L_({3})(f*,ψ,1) = L(g,1)(1 − 3⁰) = 0` against "nonzero" | S02 |
| 4.3 Hyp over ℚ | `K = ℚ` | `K(1) = ℚ` (Rubin line 1223–1224), units `±1` | Retain |
| 4.5 regular annihilator | height-one `𝔭 ∋ p, μ` | `𝔭` minimal over `μR` (any prime between has height 1), so `𝔭 ∈ Ass(R/μR)`, `p` a zero divisor there | Retain |
| 4.5 regular annihilator | `μ = p`, `M = Λ/(p)` | `Λ/pΛ` has p-torsion; `M` infinite | Retain (hypothesis needed) |
| 4.7 full image | open in `SL₂` on the cyclotomic kernel, `det = κ` onto `ℤ_p^×` | index in `GL₂(ℤ_p)` equals `[SL₂ : H ∩ SL₂]`, finite | Retain |
| 5.1 `μ_n` | Nakamura line 3776 | `(c² − c^(k+1−j)σ_c)(d² − d^(j+1)σ_d)∏(1 − a_ℓℓ^(−k)σ_ℓ^(−1))`; line 3785 prints `d`, corrected `d²` | Retain |
| 5.1 interpolation | `n = 1` | must reduce to 5.3 at `r = k − 1`, twist `1`; text has no twist | S03 |
| 5.4 norm relation | `k = 2, ℓ = 3, a = 2, ε = 1` | `1 − 2X + 3X²` (Remark A.6, line 3857–3860) | Retain |
| 5.4 Betti scalar | text against Check | `(2πi)^(1−k)γ` against `γ^±` | S04 |
| 5.6 reciprocity | Nakamura (20) line 2108 | `1/(2πi)^(k−1) = (2πi)^(1−k)` | Retain |
| 6.6 local lattice | odd `p`, index `p^e` | `log E(ℚ_p) = p^(1−e)ℤ_p`, dual `p^(e−1)ℤ_p = index·p^(−1)ℤ_p` (Rubin 5.1, line 2200–2209) | Retain |
| 6.6 Euler system | Rubin 5.3 line 2247–2253 | `r_E L_(Np)(E,1)/Ω_E` and the `ℚ_n` sums | Retain |
| 7.4 divisibility | Rubin 5.16 line 2421–2430 | `p^t L_(E,N)Λ`; exact under surjectivity and `p ∤ r_E∏ℓ_q(q^(−1))`; `J` in the split case | Retain |
| 7.4 trivial character | Rubin 5.13–5.14 | `(1 − α^(−1))²`, `(1 − α^(−1))/(1 − β^(−1))` | Retain |
| 7.8 hypotheses | Rubin 5.18 line 2455–2460 | `p ∤ 2r_E∏ℓ_q(q^(−1))|E(ℚ_q)_tors|`, surjective, good reduction, `L(E,1) ≠ 0` | Retain |
| 7.9 Tamagawa | Kato 14.5 line 4638–4649 | `L(f,k/2) ≠ 0` at `r = k/2`; `L_({p})(f,k−r) ≠ 0` for `r > k/2` in (2),(3); `± = (−1)^(r−1)`; `p ≠ 2`; `k ≥ 3` or potentially good | Retain |
| 7.9 specialization prime | Kato 14.13 line 4862–4865 | `σ_c ↦ c^(−r)` | Retain |
| 7.9 `χ` against `χ̄` | cubic χ | equal multiplicities in `E(K) ⊗ ℂ`; conjugate L-values | Retain |
| 7.9 away from p | `v ∤ p` | `A(K_v) ⊗ ℚ_p/ℤ_p = colim A(K_v)/p^n = 0` (pro-ℓ open subgroup, finite part killed by iterated `p`) | Retain |
| 1.1 Weibel ring | `s = x + iy`, `r = t` | `∂([A]·[t]) = ±[A] ≠ 0`; `{1,t} = 0`; Chern side `0 = 0` | Retain |
| 0.3 phase | `N = 7`, `c = 5` | `(−ζ₇)^(−10) = ζ₇^(−10) = ζ₇⁴` | Retain |
| Lean non-CM | `y² = x³ − x` | `(x,y) ↦ (−x,iy)` not `[n]`; `n = 0` allowed | Retain |
| Lean cyclotomic field | `m = 0, 1, 6` | all of ℂ (excluded), `{1}`, nested union | Retain |
| Lean L-series | `m = 2` | factor `1 − a₂/2 + 1/2 ≥ 1/2` | Retain |

Ownership against open pull requests was checked for Serre's theorem (S01) and, by object, for the
conductor-n map, the coefficient zeta function, transferNormRealization and the elliptic character
part in the sibling checkouts the brief gives and through `roadmaps grep`; no other owner was found.
Counts: declarations read 4, named targets read 76 (every target of §§0.1–7.9), locators verified
34 this round (56 in round 1 by this pass, not repeated), README Checks recomputed 29, sibling
section citations checked 160. The sibling roadmap AdelicImagesAndModularCurves at rev/1727 line
407 says Serre's open image theorem is stated by no roadmap; that is false at this head (4.7 here)
and is recorded under S01 for the intake, not as a source erratum.

## Not verifiable

- No Lean was elaborated in this pass; binder retention was checked by reading against the pinned
  declarations, and the worker's signature extraction failed on a missing Tau Ceti object file.
- Rohrlich1984, Rohrlich1988, Ribet1980, PerrinRiou1990, PerrinRiou1994, Schneider1985, BlochKato1990,
  DiamondShurman2005 and JacquetShalika1976 remain uncertified and FontaineMessing1987 waived; their
  locators were left as recorded.
- The Betti form of Nakamura's Lemma A.3 (which identification S04 asks the README to fix) is not
  written in the source; the factor `(2πi)^(1−k)` is the README's accounting and was not derived
  independently here.
- The nonzero class of `GL₂(ℤ/4)` with coefficients `(ℤ/4)²` asserted at line 1676 was not
  recomputed; it is used only to withhold a vanishing claim at `p = 2`.
- Kato2004 line 4860 (14.13, the period of `z`) is garbled in the extraction; the README's
  correction was read from 12.5(1) only.

## Source issues

- **Gap** in Nakamura2023 at Corollary A.5, arXiv v2 printed p. 89: the source says the χ-weighted
  period sum of `ω_(γ,m)` is `L·γ^±` for `γ ∈ V′₁(f)_F` with target `V₁(f)^±_ℂ`; it should name the
  identification of `V′₁(f)_F` with an F-structure on `V₁(f*)` (Lemma A.3 in Betti form, carrying the
  twist `1 − k`) under which `γ^±` is read; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9a2ec7c832901df0bfb00a8ee1460bc143bbb2c1", "job": "RT-KatoEulerSystems~2b", "model": "fable", "worker": "chris-x10"} -->
