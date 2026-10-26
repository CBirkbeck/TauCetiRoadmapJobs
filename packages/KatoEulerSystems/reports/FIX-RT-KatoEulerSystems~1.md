# FIX-RT-KatoEulerSystems~1

Two reviews were merged: pass a (F01–F20) and pass b (F01–F03). Pass b's F01 is the same
defect as pass a's F02 (the component at m = 1). Both are settled in one repair, which also
covers pass a's F06 (conductor components against field components). Each finding has its own
section below, headed by the review's `F` id; the first line of each section names the review (r1a or r1b), since both reviews number from F01. Line numbers refer to `packages/KatoEulerSystems/README.md` at the reviewed head.

## F01 (P2) — applied

Review r1a F01.

§0.1: the pair is now written `(α,β) = (a/N, b/N)` with `a, b ∈ ℤ/N`, and the unit is the
pullback of `thetaUnit c` along `ae₁ + be₂`, which is well defined because `Ne₁ = Ne₂ = 0`. The
fractional index is called a label. This agrees with Kato2004 lines 243–247. §3.2 already used
`F^(k)_(a/N,b/N)` and "the torsion section", so it needed no edit.

## F02 (P3) — applied

Review r1a F02.

Merged with r1b F01. The m = 1 Check now says that 1 lies outside Kato's domain
(`prime(1) ∩ Σ = ∅ ≠ {p}`) and that the class at ℚ is the corestriction of `c̃_p`, with no
Euler factor because p ∈ Σ. Components with p ∤ m are defined as corestrictions of `c̃_(mp)`.
Extensionality now runs through the §2.4(a) isomorphism of the supplier.

## F03 (P3) — applied

Review r1a F03.

Checked: the values of an E-linear map form an E-subspace, so `p⁻¹z(γ) = z(p⁻¹γ)`. The Check
now puts the distinction in the inputs. For a lattice T, the Λ-span of `z^Ka(T)` is finitely
generated and nonzero (7.1). If it were stable under `p⁻¹` it would be zero by Nakayama, since p
lies in the radical of Λ. It is therefore a proper Λ-submodule of `Z(f)`. The 7.2 comparison
uses lattice inputs.

## F04 (P1) — applied differently

Review r1a F04.

Checked against Weibel2013 lines 295–315 (Example 1.5.4) and 395–412 (Corollary 1.7.1). The
witness holds: `f_*{s,t} = f_*[s]·[t]` with `[A] ≠ 0` in `SK₁(B)`, `B` regular, and the Laurent
boundary is injective on `K₁(B)·[t]`. The integral K₂ claim is not repaired by restricting it
to unit classes, because no proof for the modular units is known.

Changes in Layer 1:
- 1.1 and 1.2 are now stated for the étale Chern realization (integral, ℤ/pⁿ(2)) and the real
  regulator, which are what 2.3 and 3.4 consume.
- The new target transferNormRealization combines the finite-étale trace, projection formula
  and Kummer norm (EtaleCohomologyFoundations §0.8) with the trace of η.
- The K₂ identity is claimed only when `SK₁ = 0`.
- The rotation counterexample is a Check.

## F05 (P1) — applied

Review r1a F05.

PadicHodgeRegulators §9.35 (open head) confirmed: it supplies `𝔐_z` on its range and the
chart identity `Λ = φ^(−n)𝔐_z`; its first Check refutes a global extension of the chart regulator.

Changes:
- The contract (§"From PadicHodgeRegulators") and §6.1 import only these two items.
- §6.1 constructs ℒ_η by the big exponential (Nakamura2014, Colmez1998), compares it with
  Perrin-Riou's map via Colmez Remark 8(i), and with §§8.8, 8.13–8.14 for odd p.
- New Check: the p = 5 example, `2^(−n)d` against d.

## F06 (P1) — applied

Review r1a F06.

Witness confirmed. EulerSystemsAndKolyvaginSystems §2.4(a) (open head) inserts Euler factors
at primes unramified in the field, and `ℚ(ζ_2m) = ℚ(ζ_m)` for odd m.

Changes in §2.1:
- The adapter is first the conductor-indexed family `c̃_m` over 𝒦.
- It is then transported by §2.4(a): the class at F is the corestriction from the conductor of F.
- The raw modular class is stated to be the conductor component.
- New Check: level 11, p = 3, c = 5, d = 7. There `P₂(X) − 1 = X(1 + X/2)` acts invertibly on
  every character component.

## F07 (P1) — applied

Review r1a F07.

PadicFamilies README line 2356 (open head) confirmed: `thetaUnit c` is constructed only with c
invertible. Kato 1.3 (line 212) works over any base. §0.1 now forms `c-g` over the base with c
inverted and in `O(Y_ℚ)^×⊗ℚ`. siegelIntegralDescent (§0.3) now proves the extension over
`ℤ[1/N]`, using regularity and the cusp expansion (Kato 1.10). The PadicFamilies contract states
the invertibility. No supplier gap is needed, because this roadmap already owns the integral
descent.

## F08 (P2) — applied

Review r1a F08.

Checked from Kato's 1.3(3): `q^((c²−1)/12)(−t)^((c−c²)/2)γ(q,t)^(c²)γ(q,t^c)^(−1)`.

Changes in §0.3:
- siegelAnalyticProduct now asserts agreement in `O(Y_ℚ)^×⊗ℚ`.
- The actual function is given by the full theta expansion, including the phase.
- New Check at N = 7, (0,1/7), c = 5: the q-powers are 2 on both sides and the phase is
  `(−ζ₇)^(−10) = ζ₇⁴`.

## F09 (P1) — applied

Review r1a F09.

Confirmed against Nakamura2023 lines 3749–3796: the conductor-n map is a separate construction
with its own μ_n and denominator argument.

Changes:
- §5.1 now constructs katoZetaMapConductor n: `V_E(f) → H¹_Iw(ℤ[1/Σ_f n, ζ_n], V_E(f))`, with
  the μ_n smoothing, auxiliary independence, membership, interpolation
  `L_({p},n)(f*,χ,k−1)γ^±`, uniqueness and conductor relation, and n = 1 giving z^Ka. It has
  three Checks.
- §5.4 now names this map and its base.

## F10 (P1) — applied

Review r1a F10.

Confirmed against Nakamura2023 lines 1782–1890.

Changes in §3.4:
- New operatorZetaCoefficient: `Z_(Σ,n)(s)` on `H¹(Y(N),V_k)⊗ℂ[Gal(ℚ(ζ_n)/ℚ)]`, with
  convergence for Re s > k, continuation with at most a pole at s = k, and push-forward
  compatibility (15).
- New pathClassCoefficient: `δ_N(k,v)`, its c-smoothing and `δ_(N,n)`.
- Three Checks. The pole at s = k is shown on the E_k Eisenstein component.
- §5.6 and its Needs line cite these.

## F11 (P3) — applied

Review r1a F11.

The three toy identity Checks are deleted (§2.3, §5.4, §6.2). Each is replaced by a Check that
the map is nonzero on its actual carriers: a nonzero partial L-value (from 4.2) times a nonzero
period. For §5.4 this is Nakamura Corollary A.5 over `ℚ(ζ_(np^m))`. For §6.2 it is the 6.4
value at r = k − 1. The other Checks are kept.

## F12 (P2) — applied

Review r1a F12.

Confirmed at the pin: `WeierstrassCurve.tateModuleGaloisRepresentation`
(TateModule/Galois.lean), `Representation.asGroupHom`, and `Ring (TauCeti.Isogeny.Hom W W)`
(Isogeny/Hom/Ring.lean), where the integer n is `n • 1`, that is [n]. A scratch check of this
elaborated.

Changes:
- `Suggested.lean` now states `serre_openImage`: finite index for every ℓ, and full image for
  all but finitely many ℓ.
- Non-CM is an inline hypothesis on the endomorphism ring over `AlgebraicClosure ℚ`.
- README §4.7, the supplier contract and the y² = x³ − x negative Check match the Lean statement.

## F13 (P2) — applied

Review r1a F13.

Confirmed: SelmerIwasawaCohomology §3.7 (open head) contains the diagonal finite cup
description. §4.6 now imports the global twist_specialize content, and the name is deleted. It
keeps twist_loc_comm and the local finite-coefficient form, which the supplier does not state.
The §3.7 contract line now lists the finite-coefficient description.

## F14 (P2) — applied

Review r1a F14.

"Hecke linear" is removed from the §2.3 title, its text and the Scope bullet. The map is now
called `ℤ_p`-linear in the literal-dual input, with the Hecke operators acting on the target.
The corestriction relation holds in the full cohomology. New Check: the rank-one case k = 2.

## F15 (P2) — applied

Review r1a F15.

Σ is now required to be finite in three places:
- §2.1: "a finite set of rational primes", citing Kato 13.1.
- §4.2a: "a finite set Σ of places containing p, ∞ and the ramified primes".
- The same pattern in §3.3 (archimedeanCriticalValues): "a finite set S of primes".

All other Σ in the README are given as `prime(·)` and are finite already.

## F16 (P3) — applied

Review r1a F16.

The module docstring now names §3.4 (it lacks modular-curve K₂, the regulator map and the
operator zeta), §4.4, §5.2 and §5.3 (they lack Iwasawa cohomology and the modular realization),
and §6.1 (it lacks local Iwasawa cohomology, D_crys/D_dR and ℋ_h). It also says that §4.7 is now
stated. No substitute theorems were added.

## F17 (P2) — applied

Review r1a F17.

Confirmed at Polylogarithms §5.13 (open head, earlier in the merge order, line 229 against 261):
`η(f,g) = log|f| d arg g − log|g| d arg f`, with the current equation and
`curveEtaRegulator_beilinson`.

Changes:
- realRegulatorUnits is deleted.
- §3.4 imports η, and the regulator is `i·η`.
- A supplier contract, Needs lines and the Scope paragraph are added.
- The Checks were recomputed: `∫ η(2,z) = 2π log 2`, so `i·η` gives `2πi log 2`.

## F18 (P3) — applied

Review r1a F18.

The tautological Check is replaced by the level-four, `(1/2,0)` Check. Recomputed from Kato's
theta expansion: the c = 5 exponent is `2 − 5 + 2 = −1` and the c = 7 exponent is
`4 − 10.5 + 4.5 = −2`. Normalized, both give −1/24. The orders in q^(1/4) are −4 and −8. The
wrong smoothing (c in place of c²) gives −1/144 and −1/192.

## F19 (P2) — not actionable in this package: scope decision requiring unpublished mathematics

Review r1a F19.

The finding asks for a construction of the canonical map and Selmer finiteness at division
places of Momose's algebra.

- No legal source the roadmap holds supplies one. Kato's 12.8.2 fails there, as §4.1 shows with
  fixed dimensions 0 and 2.
- Rubin's machinery needs Hyp(V), and no published argument provides it at those places.
- Writing such a target would invent an unsourced theorem.

Admissibility is the hypothesis of the only known proof; it is not a good-primes shortcut.
Whether the roadmap should plan open research is a human scope decision.

## F20 (P3) — applied

Review r1a F20.

Kato2004 line 2429 marks printed p. 179, and lines 2449–2450 contain the deduction of
Theorem 2.6. The range is now pp. 163–179 in §3.4, in the References and in the Kato2004 entry of
`sources.toml`.

## F01 (P3) — applied

Review r1b F01.

The same defect as r1a F02; the repair is described there. The Extensionality and m = 1 Checks
were rewritten as the reviewer proposed, adapted to the conductor presentation of r1a F06.

## F02 (P3) — applied

Review r1b F02.

Confirmed from Kato 16.1 (line 5871: ℋ_h for integers h ≥ 1) and Remark 16.3(1) (lines
5920–5925). §6.4 now applies uniqueness in `ℋ_(k−1,L)`. Both sides lie there because
v_p(α) < k − 1, and they agree at the k − 1 points. The text adds the growth explanation for the
critical slope. The CM example (slope 1/2, k = 2) is consistent: it uses ℋ_(1,L) and one point.

## F03 (P3) — applied

Review r1b F03.

§4.2a now cites Rubin Theorem I.7.3 (p. 17; PDF p. 27, line 923), Proposition II.3.7 (p. 29;
line 1442) and Kato 13.13 (pp. 233–234; line 4517). These are added to the References and to
the Rubin2000 locator in `sources.toml`.

## Checks run

- `lake env lean packages/KatoEulerSystems/Suggested.lean`: only the three "declaration uses
  `sorry`" warnings (lines 47, 64, 88). No errors. Before this, the module
  `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois` was built with `lake build`, which
  succeeded (3781 jobs).
- `#check @name` for all four declarations, in one scratch file. The three existing signatures
  are unchanged and agree with the README §7.9. `serre_openImage` keeps W, `[W.IsElliptic]`, the
  DecidableEq instance and the non-CM hypothesis, and agrees with the README §4.7. No binder was
  dropped; no section variables are used.
- Dependency check, verbatim: `depcheck: 56 roadmaps, 658 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or moved line.
- `roadmaps resolve`: no unresolved citations and no unresolved Lean names.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 0.1 torsion section | N=7, (1/7,0) | ae₁+be₂ = e₁; changing a by 7 gives the same point | holds |
| 0.1 base | N=7, c=5 | 5 not invertible on ℤ[1/7]; the unit exists over ℤ[1/35]; 0.3 extends it | target placed |
| 0.1 Check | N=4, (1/2,0), c=5,7 | exponents −1, −2; /24, /48 → −1/24; wrong smoothing −1/144, −1/192 | discriminates |
| 0.3 phase | N=7, (0,1/7), c=5 | q-power 2 = 2; ratio ζ₇⁴ ≠ 1 | Check added |
| transferNormRealization (a) | Weibel ring, s=x+iy, r=t | K₂: [A]·[t] ≠ 0 against {1,t} = 0; Chern: κ(1)∪κ(t) = 0 on both sides | K₂ form false, realization holds |
| transferNormRealization (b) | w² = z on 𝔾_m, r = 2 | trace of −log2·d arg w = −log2·d arg z = η(−z,2) | holds |
| transfer norm over a field | ℚ(i)/ℚ, s = 2+i | norm 5, trace 4 | SK₁ = 0, K₂ identity holds |
| 2.1 conductor components | level 11, p=3, c=5, d=7 | Σ = {3,5,7,11}, 2 ∉ Σ; P₂(X) − 1 = X + X²/2, root −2 | field identification refuted |
| 2.1 m=1 | prime(1)∩Σ = ∅ | c_ℚ = Cor c̃_p, identity factor at p ∈ Σ | holds |
| 2.1 ℚ_n | p odd, n=1 | conductor p²; class = Cor of c̃_(p²) | holds |
| 2.3 rank one | k=2 | source ℤ_p; (a,b) ↦ (λa, μb), λ ≠ μ | Hecke linearity not asserted |
| Z_(Σ,n) at k=2 | factor at ℓ ∉ Σ | ℓS′ = ⟨1/ℓ,1/ℓ⟩*ℓ, matching 3.4 | agrees |
| Z_(Σ,n) pole | E_k, k=4 | (1−ℓ^−s)(1−ℓ^(3−s)) → ζ(s)ζ(s−3), pole at s=4; evaluation at s=3 | correct exception s=k |
| δ smoothing | j, c | (c²−c^(k−j)diag(c,1)*)(c²−c^j diag(1,c)*) as in Nakamura line 1880 | holds |
| η import | f=2, g=z | ∫η = 2π log 2; i·η gives 2πi log 2 | matches old Check |
| 4.2a finiteness | Σ = all primes | excluded (not finite) | fixed |
| 4.6 import | κ(γ)=4, p=3, j=1 | (1/4)γφ₁(x) on both sides; ζ₉³ = ζ₃ | consistent with supplier |
| serre_openImage | y²=x³−x | (x,y) ↦ (−x,iy) has degree 1, not ±1 | CM excluded |
| serre_openImage | ℓ = 2 | finite index only, not ⊤ | allowed |
| serre_openImage | intCast | (n : Hom) = n • 1 (zsmul_one), elaborated | is [n] |
| 5.1 conductor n | n=1 | μ₁, base ℤ[1/Σ_f] | gives z^Ka |
| 5.1 d² | trivial character | d − d^(j+1) against d² − d^(j+1) | d² required |
| 5.1 sign | r = k−1 in 5.3 | (2πi)^0, sign χ(−1) | agrees with Theorem A.1 |
| 6.1 chart | p=5, φd = 2d | chart 2^(−n)d against global d | only 𝔐_z global |
| 6.2 nonzero | k ≥ 3, r = k−1 | (k−2)!·p^(n(k−1))·α^(−n)·G^(−1)·L, all ≠ 0 | discriminates zero map |
| 6.4 space | y²=x³−x, p=3 | v₃(α) = 1/2 < 1; ℋ_(1,L) with one point | holds |
| 3.3 S finite | prime(mN) ⊂ S | finite S needed for L_S | fixed |

## Ownership and suppliers

- Ownership was checked against the open pull requests whose files the brief provides.
  - The theta-unit extension over primes dividing c: PadicFamilies §4.0.1 (c invertible) and
    EllipticCurveModularityPartII §6.0e (base not stated) do not own it, and this roadmap
    already owns the integral descent.
  - The coefficient-valued zeta function, the conductor-n map and transferNormRealization were
    searched with `roadmaps grep`; no other owner was found.
- New supplier citations, all on main or earlier in the merge order:
  - EtaleCohomologyFoundations §0.8 (main).
  - Polylogarithms §5.13 (merge-order line 229).
  - ModularCurvesPartII §9.12 (already a supplier).
- `design/plan.json` is unchanged. No gap was added.

## For the maintainer

- These names were removed, and no other roadmap cites them (checked with `roadmaps grep`):
  - k2ProjectionFormulaNorm and realRegulatorUnits.
  - twist_specialize, now imported from SelmerIwasawaCohomology §3.7.
  - The heading "Full-level Hecke-linear zeta classes", now "Full-level zeta classes".
- New names:
  - `serre_openImage`, declared in Lean.
  - transferNormRealization, operatorZetaCoefficient, pathClassCoefficient and
    katoZetaMapConductor (prose targets).
- Layer 1 no longer asserts integral K₂ relations. Consumers that relied on Kato 2.3–2.4 in
  `K₂` itself should use the Chern or regulator realizations.
- PadicHodgeRegulators: this roadmap no longer relies on a global extension of the de Rham
  regulator.
- r1a F19 needs a human scope decision.
