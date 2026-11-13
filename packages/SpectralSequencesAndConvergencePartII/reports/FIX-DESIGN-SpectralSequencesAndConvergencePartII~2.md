# FIX-DESIGN-SpectralSequencesAndConvergencePartII~2: repair report

Files changed: `packages/SpectralSequencesAndConvergencePartII/design/README.md`,
`packages/SpectralSequencesAndConvergencePartII/design/plan.json`. `sources.toml` is unchanged (every
locator added is inside a range the manifest already records: stacks-012K line 3241–3315,
stacks-05QI line 3269–3448, grothendieck1957 line 1309–1337). No new target, no layer change; one
new Check (1.3) and one rewritten Check (2.1).

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F01 (P2) — applied

Witness confirmed (`H^0 = ℤ ∉ P`). Old: weak Serre class containing `′E_r^{p,n−p}` for some `r`. New: all `′E_r^{p,q}` at some `r` (stacks-012K line 3289–3290; base §5.3), or antidiagonal `n` from a page where degree `n` stabilises (base §§1.3, 3.4); witness added as a Check. Same in `plan.json` 1.3.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F02 (P3) — applied

Confirmed: `φd − dφ = (hd₃ − d₁h)v`. Old: "nonzero degree-`0` map `h`". New: identity is a chain map exactly when `h` is; instance `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)`, `h` = id in degree 0, 0 in degree 1 (`(2u − 2v, 2v)` against `(2u, 2v)`); for `h = id` the augmentation still fails. `plan.json` test updated.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F03 (P3) — applied

Verified at the pins: `CochainComplex.isKInjective_of_injective` (Mathlib `HomotopyCategory/KInjective.lean:134`),
`CochainComplex.IsKInjective.Qh_map_bijective` (`DerivedCategory/KInjective.lean:42`),
`CategoryTheory.InjectiveResolution.desc`, `descHomotopy` (`Abelian/Injective/Resolution.lean:95, 170`),
`TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective` (`Exact/Injective.lean:426`).
2.1's *Needs:*, the route, "From Mathlib", "From Tau Ceti", Layer 2 Dependencies and `plan.json`
now name these; the complex form of (a) also names `CochainComplex.Plus.exists_quasiIso_injective`.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F04 (P3) — applied

Confirmed. Contract gains §4.3 (used by 5.2) and §7.4 "for its class of categories only". 1.3 *Needs:* now `base §§1.3, 2.2, 3.2, 3.4, 5.3, 5.4, 7.5, and §7.4 for its class`, matching `plan.json`. Same pattern: 6.1's *Needs:* lacked base §5.1 (in `plan.json`, used by its API); added.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F05 (P3) — applied

Confirmed: grothendieck1957 line 1330–1337 states only existence (Théorème 2.4.1). New: "base §3.6, first quadrant, applied to the sequence of 3.2, which for an object is the spectral sequence of grothendieck1957 line 1330–1337, Théorème 2.4.1". No unread uncertified locator added. `plan.json` 3.3 locator matched.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F06 (P3) — applied

Confirmed (§S.1 on main: anticommuting `d′`, `d″`). 1.2's Check now gives `d′ = d₁`, `d″ = (−1)^p d₂`: anticommuting, same total differential and column filtration; unit square `d″ = +1` on `K^{0,0}`, `−1` on `K^{1,0}`; `d″ = d₂` gives `2`. Referred to in Scope, the §S.1 contract and Layer 1 Examples; `plan.json` test updated.

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F07 (P3) — applied

Deleted "and can import Layers 2–4 in a revision". ArithmeticStatisticsPartVIII §5.16 (graded, possibly noncommutative, over a field; verified at its head) now under "It leaves to named owners" and out of consumers (README, `plan.json`). Exclusions name one-sided noncommutative Tor. The witness's "earlier in the merge order" fails under the gate's placement (Notes).

## REV-DESIGN-SpectralSequencesAndConvergencePartII/F08 (P3) — applied

Old: "`A^s → Hⁿ(M)[1/f]` … `gr^s ≅ A^s/(iA^{s+1} + ⋃_r ker i^r)`". New: `D^{s,n−s}` (which is `Hⁿ(M)` for
every `s`) and `gr^s ≅ D^{s,n−s}/(iD^{s+1,n−s−1} + ⋃_r ker i^r)`. `A` now denotes only the coefficient
ring in Layer 6. No other occurrence in README or `plan.json`.

## Checks run

### Dependency check

```
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2176 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Naming ArithmeticStatisticsPartVIII §5.16 as the owner of the graded forms did
not move the placement.

### Citations

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The tool
cannot check Mathlib and Tau Ceti names on this host; every name added was located by hand at the pins:
`CochainComplex.isKInjective_of_injective` (Mathlib `Algebra/Homology/HomotopyCategory/KInjective.lean:134`,
namespace `CochainComplex`), `CochainComplex.IsKInjective.Qh_map_bijective`
(`Algebra/Homology/DerivedCategory/KInjective.lean:42`), `CochainComplex.Plus.exists_quasiIso_injective`
(`Algebra/Homology/DerivedCategory/DerivabilityStructureInjectives.lean:61`),
`CategoryTheory.InjectiveResolution.desc` and `.descHomotopy`
(`CategoryTheory/Abelian/Injective/Resolution.lean:95, 170`), `TauCeti.ExactStructure.abelian`
(`TauCeti/CategoryTheory/Exact/Abelian.lean:124`), `TauCeti.ExactStructure.abelian_conflation` (:166),
`TauCeti.ExactStructure.abelian_isInjective_iff` (`Exact/Injective.lean:165`),
`TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective` (`Exact/Injective.lean:426`).
Cross-roadmap: DerivedModuleAlgebra §S.1 on main; ArithmeticStatisticsPartVIII §5.16 at its open head;
base §§1.3, 3.4, 4.3, 5.3, 7.4, 7.5 in the board design of SpectralSequencesAndConvergence.

### Lean

The design stage has no `Suggested.lean` and the brief names no Lean command. No `#check` comparison
was run.

### Ownership

Ownership against the open pull requests listed in the brief was checked by object for the one new
ownership statement (graded Tor spectral sequences): ArithmeticStatisticsPartVIII §5.16 owns them;
InverseGaloisAndArithmeticFundamentalGroupsPartII's gap `dga-graded-tor-spectral-sequences` names
DGAInfinity Layer 5, not this roadmap. No new construction is owned here.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3(a), old one-antidiagonal form | `ℚ → ℚ/ℤ`, `P` = ℚ-vector spaces, `n = 0`, `r = 1` | `′E_1^{0,0} = ℚ ∈ P`, others on antidiagonal `0` zero; `H^0 = ker = ℤ ∉ P` | false | replaced |
| 1.3(a), form "all `p, q`, some `r`" | same; `ℤ →(×2) ℤ` horizontal with `P` = finite groups; `P = {0}` | witness: `′E_1^{1,0} = ℚ/ℤ ∉ P`, `′E_r^{0,0} = ℤ ∉ P` for `r ≥ 2`; `×2`: `E_1 = ℤ ∉ P`, `E_2 = (0, ℤ/2) ⊂ P` and `H^0 = 0`, `H^1 = ℤ/2 ∈ P`; `P = {0}` gives vanishing | holds; hypothesis excludes witness | Check added |
| 1.3(a), form "antidiagonal `n` from stabilisation" | same three | witness: `′d_1 ≠ 0` out of `(0,0)` excludes `r = 1`, `′E_2^{0,0} = ℤ ∉ P`; `×2`, `n = 1`: stabilises from `2`, `E_2^{1,0} = ℤ/2 ∈ P`, `H^1 = ℤ/2` | holds | none |
| Page step for weak Serre `P` | homology of `E_r(in) → E_r(pq) → E_r(out)` with terms in `P` | `ker d_out ∈ P` (kernel), homology `= coker(E_r(in) → ker d_out) ∈ P` | holds without finiteness | route clause |
| 2.1 Check 3 | `h` chain map (`I₁ = I₃`, `h = id`); `h⁰ = id`, `h¹ = 0` on `ℚ/ℤ →(×2) ℚ/ℤ` | `φd − dφ = (hd₃ − d₁h)v`: `0`; `×2 ≠ 0`, transported `d⁰(u,v) = (2u − 2v, 2v)` vs `(2u, 2v)`; for `h = id` augmentation `(ε₁a + ε₃c, ε₃c) ≠ (ε₁a, ε₃c)` | old Check false for chain-map `h`; new Check holds | rewritten |
| 2.1(b) route via K-injectivity | `A[0] → R₂` arbitrary resolution into `I₂′` in degrees `≥ 0` | homotopy `B[0] → I₂′` has components `B → I^{−1} = 0` and `0 → I^0`: zero, so homotopy-commutation is equality over `f₂` | holds | names added |
| 2.1(a) complex route | `C = 0`; `A = 0`; `0 → ℤ →(2) ℤ → ℤ/2 → 0` | `C = 0`: `I₃ = 0`, `I₂ = I₁`; `A = 0`: `I₁ = 0`, connecting map `0`; third: middle `ℚ ⊕ ℚ/ℤ`, `ℚ/ℤ ⊕ ℚ/ℤ`, `H^0 = ℤ` | holds | route clause |
| Tau Ceti one-step horseshoe for objects | step `0` of the `×2` example | `I_X = ℚ`, `I_Z = ℚ/ℤ`, `M = ℚ ⊕ ℚ/ℤ`, cokernel extension of `C_Z = ℚ/ℤ` by `C_X = ℚ/ℤ` | matches Check 2 | none |
| 1.2 dictionary with §S.1 | unit square of `ℤ`'s | `d″ = +1` on `K^{0,0}`, `−1` on `K^{1,0}`; `d′d″ + d″d′ = 1 − 1 = 0`; with `d″ = d₂`: `2` | holds | Check |
| 3.3 low-degree sequence (locator) | coextension example `ℤ/4 → ℤ/2` | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, middle iso; `m = 0` excluded (base §3.6 Check) | unchanged | locator |
| 6.2 limit-page route, `D^{s,n−s}` | `M = ℤ[0]`, `f = p`, `n = 0`; `ℤ →(×p^r) ℤ`, `n = 1` | `ℤ/(pℤ + 0) = ℤ/p = ker k/B_∞`; `H^1 = ℤ/p^r = H^1[p^∞]`, `gr^s = 0 = H^1[1/p]` | holds | notation |
| Contract §7.4 / §4.3 | 1.3(c) on `ModuleCat R`; 5.2 limit pairing | `ModuleCat R` in the §7.4 class (base Conventions); 5.2 reads weak convergence through §4.3's comparison | consistent | contract bullets |

## Notes for the maintainer

- Ordering: by the brief's list of earlier roadmaps, the six roadmaps of the old consumers paragraph are
  "earlier". The gate places this roadmap after ArithmeticGaloisDuality (ORDER line 61). That puts all
  six later: EtaleDualityAndPerverseSheaves (107), K3BlochGroups (139), ArithmeticStatisticsPartVIII
  (146), TorsionCohomologyInfrastructure (186), InverseGaloisAndArithmeticFundamentalGroupsPartII (225)
  and HilbertModularVarietiesAndShimuraCurvesPartII (357). So an import by them would be downward, not
  upward as F07 claims. F07's repair holds either way: the README cannot promise another roadmap's
  revision.
- ArithmeticStatisticsPartVIII §5.16 items (i) and (iv) (the double-complex and hyperhomology sequences
  for graded modules) are instances of Layers 1–2 here in the abelian category of graded modules. Since
  this roadmap is placed earlier, that roadmap could cite them. Nothing here depends on it.
- No declaration name of this roadmap changed; no id other roadmaps cite was dropped.
- Suspicious text: none. The review and the roadmaps read contained no instructions addressed to the
  worker.
