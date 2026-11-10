# FIX-PKG-KloostermanMomentsAndPotentialAutomorphy~3

Repair round for `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2` (twelve findings, R01–R12) and
the gate failure `statement-hygiene=1`. Every finding was checked against FSY, the supplier
roadmaps at their current heads (or board packages), and the pinned Mathlib. All twelve are correct
in substance. Ten are applied as asked. R06 is applied differently. R12 is applied by the finding's
own fallback (a supplier contract).

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R01 (P1) — applied

Verified: the trace formula gives `m₂ᵏ(p^m) = −tr(F^m | H¹_c)`, and
`log det(1 − FT) = −Σ tr(F^m)T^m/m`. §1.4 now reads `Σ_m m₂ᵏ(p^m)T^m/m = log det(1 − F_pT | H¹_c)`,
with that derivation, in place of `−log`. A new §1.4 Check covers `k = 1`: moments `−1, −1, −1`
(recomputed), `log(1 − T) = Z₁`, and `−log` would give `(1 − T)⁻¹`. No other `log` occurs.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R02 (P1) — applied

Verified with FSY lines 613–629, 649–658 and 991, and §5.5: the cover uses `S_k` only, the
descended object uses `S_k × μ_r`.
- §3.2 now defines `e^S_χ = (k!)⁻¹Σ sgn^n σ` and `e_χ = e^S_χ·e_μ`, with denominator `k!·r`. It adds a
  `μ_r` group-scheme bullet and a cover/descent Check (`r = 2`, `k = 3`: deck eigenvalues
  `+1, −1, +1, −1`; dimensions 4→2 full and 3→1 middle). It also replaces the Check that dropped `μ₂`.
- §3.5 now states the three isomorphisms of FSY Proposition 2.13 and Corollary 2.15.
- Pattern repaired in §§3.6, 4.1, 4.2, 4.3, 4.4, 4.5 and the Layer 7 introduction (`χ = χ₁` on
  `S_k × μ₂`).

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R03 (P1) — applied

Verified with FSY (2.18)–(2.23), Lemma 2.24 and Corollary 4.10. §3.6 now reads
`M = FT⁻¹(j_{0,!*}Sym^k K̃l_r)` and `ΠM ≅ FT⁻¹(j_{0,+}Sym^k K̃l_r)` (by MHM §6.6). `M` is the image of
`G_{r,k}^{S_k,χ_n} → ΠM`, i.e. the middle Gauss–Manin module modulo its maximal constant summand,
where it used to be the whole image. The API is rewritten (MHM §12.8 for constant kernel and
cokernel). A new Check at `r = 2`, `k = 1` gives ranks 2, 1, 2, 1. §5.4 already used ranks
`k + 1` and `k` and is now consistent.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R04 (P1) — applied

Verified: at `n = 1`, `k = 3` we have `nk − 1 = 2`, and weight `1 + 2 = 3 ≠ 4`. In §4.3, the Check
`(gr^W₁H¹_c(K_{2,3}))^{sgn}(−1)` becomes `(gr^W₂H²_c(K_{2,3}))^{S₃×μ₂,χ₁}(−1)`: dimension 1, weight 4,
Hodge type `(2, 2)`, matching `d₃ = 1` and §6.6. It records the wrong-degree weight 3, and keeps the
`μ₂`-invariance explicit (the `S₃`-sign part alone of the cover middle cohomology is 3-dimensional).

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R05 (P1) — applied

Verified at the heads: MixedHodgeModulesAndIrregularHodgeTheory (board package, Layers 1–12);
SpringerResolutionAndCharacteristicCycles #1828 (§§8.1–8.4, 9.1–9.7; operators from
ComplexComparisonPartII §C5.1 and PBW from FormalConnectionsOpers F2.2);
PadicDifferentialEquationsAndRigidCohomology #1002 (§§RD.6.52a, RD.6.53). Every letter label
(D, F, H, H.0–H.1, E, I, C, P, G, T, N) is replaced, in scope, contracts, Conventions and every
`*Needs:*` line, by the subsection actually consumed. The stationary-phase gap section changes
`Layer T` → `§11.5`, in both plan.json and the README.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R06 (P2) — applied differently

Both forward edges are confirmed by a script over all `*Needs:*` lines.
- §6.4/§6.5: applied as asked. Cover Hodge numbers become §6.4 and the explicit-basis filtration
  §6.5, with references updated (§§5.6 Examples, 6.6, the Corrections list). No other roadmap
  cites these ids.
- §10.4→§11.2: removed without moving targets. §10.4 now uses only Layer 8's ℓ-independent
  odd-prime and odd-`k` factors and defines `Λ′_k`; the completion at 2 already lives in §11.5,
  after §11.2. Layer 11's dependencies are now "Layers 4 and 6–10". The script finds no forward edge.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R07 (P1) — applied

Recomputed: `Z₅(2; T) = 1 − 5T + 68T² − 64T³`, so `M₅ = 1 − 4T + 64T²` and
`M₅⁻¹ = 1 + 4T − 48T² + ⋯`. The Layer 8 example now says "Euler factors `M₅(p; T)⁻¹`", with the
`p = 2` product check (`4 − 4 = 0`, `−48 − 16 + 64 = 0`). Same pattern also fixed in §11.4's Check
("inverse Euler factor … contains `1 − 243T`") and in §10.3's Check ("inverse Euler factor is
`1 + 27T`").

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R08 (P2) — applied

Both counterexamples verified. In the §10.4 API:
- Multiplicativity, `eulerCoeff L 1 = 1` and `eulerCoeff L (p^j) = [T^j]L(p)` now hold for every
  family, and the Euler product now holds only under `[T⁰]L(p) = 1` and `LSeriesSummable`, via
  pinned `EulerProduct.eulerProduct_tprod`. The claim "wherever either converges" is deleted.
- New Checks: the normalized geometric case, `L₂ = 2`, and `1 + T − T²`.
- The `eulerCoeff` docstring is updated; both moment families have constant coefficient 1.
- No headline changes.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R09 (P2) — applied

Verified: CongruenceSpectralGap §4.2a (#1504) takes `r ∈ Fˣ`. Over 𝔽₂ with `a = 0`, the sum is `−1`
while the product fibre is empty (sum 0). The comparison is now qualified by `a ∈ Fˣ` in Scope,
the CongruenceSpectralGap contract, §0.2 and its Needs, Layer 0 Dependencies and the Lean
docstring. A new §0.2 Check covers the zero-parameter negative control and the `a = 1` agreement.
The total definition is kept.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R10 (P2) — applied

Verified: DeligneWeightsAndPurity §8.24 (#929) assumes `X₀` smooth proper, and `K̄_{𝔽₃}` at `k = 3`
is singular at `(1,1,1)`. FSY (5.10) uses purity only on boundary strata.
- New §7.1 target "boundary localization": (a) the resolution and spectral sequence; (b) the
  finite-field weight-`m` statement with no interior smoothness; (c) `E₂` degeneration only for
  smooth `Y`, via §8.24, specialization, or the MHM §§5.1–5.2 Betti route. It has three Checks.
- §§7.3, 7.4, 8.3, 8.4 and 11.3 now route through it. §8.24's contract is restricted to smooth
  compactifications.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R11 (P2) — applied

Verified that PotentialModularityAndCompatibleSystems §1.6 (#1075) gives strictness only away from
the residue characteristic.
- §11.2 adds the named target "Frobenius slopes at the coefficient prime 2". It compares `WD` over
  `F′_v`, with N and inertia kept, using AutomorphicGaloisRepresentationsPartII AG2.6 (totally real
  coefficient-prime descent), AG2.5, ModularityAndLanglandsExtensions §§2.42–2.43, §8.3, §9.1 and
  PadicHodgeTheory §§5.1–5.3.
- The 2-adic bound becomes a Corollary, using weak admissibility (§5.2).
- New Checks: `k = 3` (`0, 0, 2`), `k = 5` (`0, 0, 2, 6`), and why §1.6 is insufficient.
- New contracts are added.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~2/R12 (P2) — applied

Verified: ShimuraCompactifications §0.15 (#1053) only gives refinements at neat level, and no
roadmap owns projective embedding of a toric scheme from a smooth lattice polytope over any ring.
- §6.1 now proves `Σ_k` is the normal fan of `P_k = conv{signed permutations of (1,…,k)}`, with
  support values `j(2k − j + 1)/2`, and deduces that `X_k`, hence `K̄`, is projective over ℤ.
- New supplier gap `toric-polytope-projective-embedding` with AnalyticToricGeometryPartII §0.5
  (#1647).
- New Checks: `k = 1` (the conic), `k = 2` (21 lattice points; the square is a non-example).
- §0.15 is dropped from the contracts, and §11.3 is re-cited.

## Gate failure: statement-hygiene=1 (P3, `kloostermanSum`, line 51) — cleared

`[Fintype F] [DecidableEq F]` → `[Finite F]`, and the body `∑ x : Fˣ` → `∑ᶠ x : Fˣ`. The same
construction in `moment` (`letI … Fintype.ofFinite`, `Classical.decEq` in a def body) is replaced
by `∑ᶠ a : (GaloisField p m)ˣ`, using Mathlib's derived `Finite (GaloisField p m)`. The values are
unchanged, since the types are finite. The gate rerun on a copy of the package shows
`statement-hygiene=0`.

## Checks run

- `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`, from the content
  checkout: exit 0. The only output is four `declaration uses 'sorry'` warnings, at lines 90, 109,
  191 and 206 (the four headlines). There is a single `import Mathlib` and no `TauCeti.*` module.
- `#check @name` for all 21 declarations, in one scratch file, elaborated once (exit 0). The
  signatures were compared with the README. The only change is `kloostermanSum : (F) → [Field F] →
  [Finite F] → AddChar F ℂ → F → ℂ`. No declaration lost a binder; the others are identical to the
  worker's `signatures.md`.
- Dependency check:

  ```text
  depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- Full gate on a copy of the package laid out as a worktree. All content checks are 0, including
  `statement-hygiene`, `residue`, `latex`, `readme-ids-missing`, `layer-ids` and `target-ids`.
  The only failure is `git=1`, because the scratch copy is not a git repository.
- `roadmaps resolve` flags one lead: "MixedHodgeModulesAndIrregularHodgeTheory §2.1: no roadmap on
  main or in an open pull request". This is a false positive. That roadmap is a board package
  (`packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`, merge order 261, before this
  roadmap at 310), and its §2.1 exists there. Before this round the letter labels were not parsed as
  ids. No Lean name was found missing.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `kloostermanSum`, total in `a`; unit comparison | 𝔽₂, ψ(1)=−1, a=0,1; trivial ψ on 𝔽₅ | a=0: −1 vs empty fibre 0; a=1: 1=1; trivial: 4 | comparison only at units | §0.2 Check, contracts, docstring |
| `moment` via `∑ᶠ` | p=2, k=1,3,5, m≤3; p=3, k=3,5, m≤2 | moments −1,−1,−1; 3,−17,63; −5,111,703; −1,−1; 26,−730 | equal to previous values | binder only |
| §1.4 log identity | k=1 | Σ m T^m/m = −T−T²/2−T³/3 = log(1−T); det = 1−T = Z₁ | `log` correct, `−log` gives (1−T)⁻¹ | R01 |
| §3.2 projectors | r=2,k=3; r=2,k=2; r=3; char 2, r=2 | ranks 4→2, 3→1; transposition −1; sign trivial on S_k for r=3; μ₂ infinitesimal: e_μ=1 | two projectors needed | R02 |
| §3.5 isomorphisms | r=2, k=1,3,4 | cover full/middle (2,1),(4,3),(4,2); descended (1,0),(2,1),(2,0) | matches §5.5 | R02 |
| §3.6 `M`, `ΠM` | r=2, k=1,2 | k=1: G 2, M 1, ΠM 2, M′ 1; k=2: M 2, ΠM 3, singularities −4,0,4 | ΠM≠M | R03 |
| §4.3 Check | r=2,k=3; r=2,k=2 | nk−1=2, weight 2+2=4, (2,2), dim 1; at k=2 nk=2, singular | wrong-degree weight 3 refuted | R04 |
| Layer 8 Example, k=5 | p=2 | (1−4T+64T²)(1+4T−48T²) = 1+0T+0T²+O(T³) | inverse factor | R07 |
| `eulerCoeff` API | n=1, 2^j, 6; L₂=2; L_p=1+T−T² | 1; a_p^j; a₂a₃; Dirichlet 1 vs product 2; product 1 at s=0 but Σ_p 1 diverges | needs normalization and summability | R08 |
| §6.1 polytope, projectivity | k=1,2,3; square | 3, 21, 251 lattice points; support values (1),(2,3),(3,5,6) = j(2k−j+1)/2; sampled normal cone = dominant chamber; square's support function abs(x)+abs(y) linear on quadrants | `Σ_k` normal fan of `P_k`; square not ample | R12 |
| §7.1 boundary localization | k=3,p=3; k=3,m=2; nodal cubic; k=2 | (1,1,1): g=6≡0, ∇g=0, tangent dim 3>2; E₁ weights 1,0 <2; nodal H¹ weight 0; K̄₂ = two ℙ¹ meeting twice: gr^W₁H¹_c=0 = M₂ | (b) holds without interior smoothness | R10 |
| §11.2 slopes and bound | k=1,3,5 at 2 | k=1: M₁=1, v(1),v(−1)=0,0 ≥ 0,0; k=3: v(4)=2, Z: 0,0,2; k=5: M Newton slopes 2,4 = Hodge (2,4); Z: 0,0,2,6 = n(n−1) | equality at k=5 | R11 |
| §10.4 / §11.5 order | Needs-line scan | 0 forward edges besides a CongruenceSpectralGap §4.2b parse artifact | acyclic | R06 |

## For the maintainer

- `Suggested.lean`: no declaration was renamed or removed. `kloostermanSum`'s binders changed
  (`[Finite F]`), and `moment` uses `finsum`. No other roadmap cites either name.
- Renumbered here: §6.4 ↔ §6.5 (cover Hodge numbers and explicit-basis filtration). A grep of
  board packages, main and open pull requests found no external citation of either id.
  KloostermanSheavesAndBesselIsocrystals cites only Layers 1–2 (under old `KM.n` labels, which are
  outside this round).
- New supplier gap `gap:toric-polytope-projective-embedding` → AnalyticToricGeometryPartII §0.5
  (#1647, merge order 164). Gap `irregular-stationary-phase` now points to
  MixedHodgeModulesAndIrregularHodgeTheory §11.5.
- New supplier citations, all earlier in the merge order:
  - AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 (#1006)
  - ModularityAndLanglandsExtensions §2.43 (#1180)
  - FormalConnectionsOpers F2.2 (#1056)
  - ComplexComparisonPartII §C5.1 (#848)
  - PadicHodgeTheory §§5.1–5.3 (#1062)
  - DeligneWeightsAndPurity §§0.16, 0.18, 7.15, 8.14, 8.19 (#929)
  - Mathlib `EulerProduct.eulerProduct_tprod`

  The section numbers are as at those heads, or at the board package for
  MixedHodgeModulesAndIrregularHodgeTheory; they need updating if those roadmaps renumber.
- Ownership. Projective embedding from a smooth lattice polytope over every ring is unowned at
  ShimuraCompactifications #1053, AnalyticToricGeometryPartII #1647 and
  HeightsRationalPointsAndObstructions #1017. The last proves projectivity only over number fields,
  and only for its own fan construction. Hence the gap.

  The boundary localization of §7.1 is stated for these compactifications, as the finding asked.
  DWP §8.24 and LefschetzPencilsAndVanishingCycles 7a.8 own different objects: the smooth proper
  case and strictly semistable degenerations.

  Coefficient-prime comparison is cited from AG2.6, not restated.

  Ownership was checked by object against the open roadmap pull requests through
  `roadmaps grep` / `roadmaps show`.
- `sources.toml`, `metadata.toml`: unchanged. No new source was needed, and no request for a
  missing text was written.
