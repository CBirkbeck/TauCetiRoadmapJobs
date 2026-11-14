# PORT-KloostermanMomentsAndPotentialAutomorphy

Port of `packages/KloostermanMomentsAndPotentialAutomorphy/` (accepted review
`REV-PKG-KloostermanMomentsAndPotentialAutomorphy~7`, with red-team rounds 1–2 repaired) into
`TauCetiRoadmap/KloostermanMomentsAndPotentialAutomorphy/{README.md,Suggested.lean,metadata.toml}`.

- Branch: `roadmap/kloosterman-moments-and-potential-automorphy`, created from `e1cd6a5`.
- Head commit: `399a75b` — "KloostermanMomentsAndPotentialAutomorphy: roadmap (README, Suggested.lean,
  metadata)". Only the three files of the folder are added; nothing outside the folder changed.

## Checks

**Build** (`lake build TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy.Suggested`):

    Build completed successfully (18239 jobs).

Warnings: **5**, all `declaration uses 'sorry'` (lines 107, 127, 209, 219, 234: the five headline
theorems). No other warning.

**Gate** (`tauceti-roadmap … gate <worktree> KloostermanMomentsAndPotentialAutomorphy --base origin/main`),
after the commit:

    gate KloostermanMomentsAndPotentialAutomorphy: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

**Dependency check** (`gate --depcheck … --movable --content …`), complete output:

    depcheck: 240 roadmaps, 2191 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The one edge more than the package's last record (2190) is the
new supplier CharacterSumsOverFiniteFields, which the merge order lists before this roadmap.

**Signatures.** I appended `#check @…` for all 22 declarations of `Suggested.lean` to the file,
elaborated it once with the build command above, read the 22 elaborated types and restored the file
(the committed file carries no `#check`). Every type matches its README statement (§§0.1–0.3, 8.1–8.2,
8.5–8.6, 10.2, 10.4, 11.2, 11.4–11.5). The file has no `variable` or `include` block, so no binder can
be lost; nothing changed relative to the worker's `signatures.md`.

**Citations.** `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name
found nowhere. Because the resolver could not read the pinned Lake packages, I grepped every Mathlib
and Tau Ceti name the README cites at the pins of this worktree's manifest; all exist
(e.g. `Algebra.trace_algebraMap` `Mathlib/RingTheory/Trace/Defs.lean:110`, `Algebra.trace_trace` :137,
`FiniteField.nonempty_algHom_of_finrank_dvd` `Mathlib/FieldTheory/Finite/GaloisField.lean:287`,
`EulerProduct.eulerProduct_tprod` `Mathlib/NumberTheory/EulerProduct/Basic.lean:225`,
`MeromorphicNFOn` `Mathlib/Analysis/Meromorphic/NormalForm.lean:632`,
`TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`
`TauCeti/Geometry/Hodge/Mixed/Strictness.lean:131`). I checked every cited section id of every supplier
at its head (via `roadmaps show`) or on main: all exist, including DiophantineApproximationAndTranscendence
§5.4, whose heading is "Specialisation and the Siegel–Shidlovskii method" but which contains the
"Picard–Vessiot fields and analytic solutions" paragraph the README cites.

## Draft pull request body

Adds the roadmap *Symmetric power moments of Kloosterman sums and their potential automorphy*. It
assembles the symmetric power moments of rank-two Kloosterman sums over all finite fields into the
generating series `Z_k(p; T)` and builds the theory needed to prove the theorems of Fresán, Sabbah
and Yu about them: `Z_k(p; T)` is an integer polynomial of explicit degree whose reciprocal roots have
weights `0`, `k` and `k + 1` and whose coefficients satisfy `p^{n(n−1)} ∣ c_n`; the middle cohomology
of `Sym^k Kl₂` is a motive `M_k` over `ℚ` whose Hodge numbers are all `0` or `1` and are computed
explicitly; its `ℓ`-adic realizations form a regular polarized weakly compatible system with explicit
Euler factors and conductors at every odd prime, hence are potentially automorphic; and the completed
moment `L`-functions continue meromorphically with functional equations under `s ↦ k + 2 − s`. The
route runs through the characteristic-zero Kloosterman connections of every rank, their exponential
and irregular Hodge theory, explicit bases and toric compactifications, the moment hypersurfaces and
their integral models, Picard–Lefschetz theory at the bad primes and the `p`-adic comparison; the
general machinery (character sums, Kloosterman sheaves, `D`-modules and mixed Hodge modules, étale
and rigid cohomology, Galois representations, potential automorphy) is imported by section from the
roadmaps that own it. `Suggested.lean` states the five headlines that are statable at the pins:
integrality and degree of `Z_k(p; T)`, the weights of its roots, the coefficient divisibility, and the
odd and even functional equations.

## Dependencies that are still pull requests

AnalyticToricGeometryPartII, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentationsPartII,
CharacterSumsOverFiniteFields, CohomologyComparisons, ComplexComparisonPartII, CongruenceSpectralGap,
DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves, FiniteFlatGroupsAndIntegralPadicHodgeTheory,
FormalConnectionsOpers, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles,
MixedHodgeModulesAndIrregularHodgeTheory, ModularityAndLanglandsExtensions, MotivesAndAlgebraicCycles,
NoncommutativeAndEquivariantIwasawa, PadicDifferentialEquationsAndRigidCohomology, PadicHodgeTheory,
PotentialModularityAndCompatibleSystems, ShimuraCompactifications, SpringerResolutionAndCharacteristicCycles.

All are earlier than this roadmap in the merge order. Suppliers on main: DiophantineApproximationAndTranscendence,
EtaleCohomologyFoundations, McKaySkewGroup, SchemeAndStackFoundations. No id cited here is defined only
by an open revision (overlap check: none dropped, none only-revision-defined). The consumer
KloostermanSheavesAndBesselIsocrystals (later in the order) cites §§1.1, 1.3, 2.1, 2.5–2.6 of this
roadmap; those ids are unchanged.

## What moved from the Lean file to the README

Nothing. The package's `Suggested.lean` already had the required form: 5 headline theorems and the
17 definitions with real bodies that they need, no padding, no sorry'd data, no `set_option`, no
`lemma`, no `example`. Changes to it:

- Header: `module` / `public import Mathlib` / `@[expose] public section` … `end`, the form several
  roadmaps on main use (e.g. `TauCetiRoadmap/AnalyticNumberTheoryPartII/Suggested.lean`). With the plain
  `import Mathlib` header the build emitted a sixth, non-`sorry` warning ("imports `Mathlib` … designed
  for use with the module system; consider adding `module`"); the module form removes it. The gate's
  import checks accept it (`imports=0`, `no-import-mathlib=0`). No `TauCeti.*` import is needed.
- Module docstring: title aligned with the README title; it now says that `kloostermanSum` and
  `traceChar` restate CharacterSumsOverFiniteFields §§5.1 and 0.1 on native carriers; the
  "not statable" item on Galois realizations now records that Mathlib's
  `AlgebraicGeometry.Scheme.EllAdicCohomology` (`Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`,
  pro-étale `Hⁿ(X, ℤ_ℓ)` as an abelian group) exists at the pin but carries no Galois action, compact
  supports or weight filtration, so `V_{k,ℓ}` cannot be formed. The earlier sentence "no étale
  cohomology of varieties over number fields" was imprecise at this pin. The sentence "a real body
  built from finite sums over finite fields and formal power series" was wrong for `paperGamma`
  (Gamma function) and `eulerCoeff` (factorization) and now reads "a real body".
- Docstrings of `kloostermanSum` and `traceChar` name the supplier notions; four docstring/code lines
  over 100 characters were rewrapped. No signature changed; no name was added, removed or renamed.

## Supplier replacements and duplication removals

1. **CharacterSumsOverFiniteFields** (open, order before this roadmap) owns, by object:
   the canonical additive character `stdAddChar F = ZMod.stdAddChar ∘ Tr` and its nontriviality (§0.1),
   its trace compatibility in extensions (§0.6), the Kloosterman sum `kloostermanSum χ ψ a b` with its
   symmetry, scaling, conjugation (realness) and its identification with `hyperKloosterman` (§5.1), the
   rank-two `L`-polynomial and lifting relation (§5.4), and degenerate values (§5.6). The package
   restated all of these in §0.2. Changes: new Scope bullet and supplier-contract section; §0.2 now says
   the rank-two sum is `kloostermanSum 1 ψ 1 a` and `traceChar p m` is `stdAddChar (GaloisField p m)`,
   restated in `Suggested.lean` only for statability; the API bullets on nontriviality, realness and the
   trivial character are replaced by citations of §§0.1, 5.1, 5.6 there; the tower law is stated as an
   instance of §0.6; the `ψ(c·)` scaling bullet cites the §5.1 scaling law and keeps only the moment
   consequence; the field-isomorphism bullet now cites CongruenceSpectralGap §4.2a's field-isomorphism
   law and keeps the moment consequence. The restriction-power law, the moment values and all Checks are
   kept (they test this roadmap's definitions). §1.2 gains a Check tying the Frobenius polynomial to the
   §5.4 `L`-polynomial (with the sign negative control `1 + KT − qT²`), and §0.2/§1.2 Needs and the
   Layer 0/1 Dependencies name the supplier. The Lean restatements cannot be deleted (no roadmap module
   may be imported) and live in namespace `TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy`, so
   no fully qualified name collides with `TauCetiRoadmap.CharacterSumsOverFiniteFields.kloostermanSum`.
2. **Tau Ceti `SymmetricPower`** at the pin: `SymmetricPower.map`
   (`TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:109`), `SymmetricPower.finrank_eq`
   (`TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:192`) and
   `Module.Basis.trace_map_symmetricPower_of_apply` (same file :203) supply the induced map, the rank
   `multichoose r n` and the trace on an eigenbasis. The package's Tau Ceti contract omitted them. Added
   to the contract and the Scope; §0.1's rank-two trace identity now names `SymmetricPower.map` and
   gives the route through the generic matrix and the eigenbasis trace formula (base-change
   compatibility being part of the target); §2.4's rank bullet cites `finrank_eq`. These are weaker than
   the targets (diagonal case only, no connection), so no target is dropped.
3. Checked and kept: PadicDifferentialEquationsAndRigidCohomology §§RD.7.21–RD.7.22 state the `p`-adic
   realization and Newton-above-Hodge only under geometric and filtered hypotheses, and §RD.7.21a the
   odd-prime factorization in rigid cohomology. This roadmap's §9.1 discharges those hypotheses, §8.2 uses
   §RD.7.21a for the odd-prime boundary factor and adds `p = 2`, the degrees and the `ℓ`-adic middle
   factor, and `momentSeries_coeff_dvd` is the unconditional end theorem (odd `p` from §RD.7.22, `p = 2`
   from §11.2). No second plan. The closest roadmaps of `overlaps.md` were read:
   MixedHodgeModulesAndIrregularHodgeTheory (its Scope leaves the Kloosterman connections, polytopes,
   bases and Hodge counts here), KloostermanSheavesAndBesselIsocrystals (consumer), LefschetzPencilsAndVanishingCycles
   (generic quadratic vanishing cycles and the FSY discriminant example, consumed),
   PotentialAutomorphyDworkMotivesPartII (Dwork families; no shared object). Object searches
   (`roadmaps grep`) for Kloosterman sums/sheaves/connections, symmetric power moments, `Sym^k Kl`,
   `momentSeries`, signed-permutation/permutohedral fans and Fresán–Sabbah–Yu found no other owner on
   main or in the open heads (AutomorphicSpectralTheory's `S(m, n; c)` and the half-integral-weight sums
   of MetaplecticAutomorphicForms are different objects).

Removals are recorded in the README only in Scope and ownership, as required. Ownership against open
pull requests was checked against the 234 heads listed with the brief and, through
`roadmaps grep`/`roadmaps show`, against all 464 indexed heads.

## Fixes from the upstream-reviewer read

- Summary: the locators "(Theorem 1.2)" and "(Theorem 1.3)" named no source; now "(FSY Theorem 1.2, p. 3)"
  and "(FSY Theorem 1.3, p. 4)".
- "How to read the build" said Layer 0 "needs only Mathlib"; it now names Tau Ceti's symmetric powers and
  CharacterSumsOverFiniteFields, matching the new Needs lines.
- Layer 2 Dependencies now list Tau Ceti (symmetric powers), matching §2.4's Needs.
- The Mathlib contract no longer lists `FiniteField.trace_to_zmod_nondegenerate`, which no Needs line
  consumes any longer (nontriviality is CharacterSumsOverFiniteFields §0.1).
- The Lean docstring corrections listed above (pro-étale `EllAdicCohomology` exists at the pin; "real body").

## Adversarial pass

Values recomputed this round: the moments by exact summation over `𝔽_{p^m}` (polynomial-basis arithmetic,
complex characters, rounded integer moments) and `Z_k` by `n c_n = Σ_{j ≤ n} m_j c_{n−j}`; root weights by
Durand–Kerner on `Z_k/(1 − T)`. Rows marked "unchanged" record a recomputation of a package value; the
remaining README targets (Layers 2–7, 9–11 geometry) were not recomputed beyond the rows below and rest
on the computed ledger of `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~7`.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| `kloostermanSum` (def) = CSoFF `kloostermanSum 1 ψ 1 a` | `𝔽₃`, `a = 1, 2`; `𝔽₂`, `a = 0` | `Kl(1) = ψ(2)+ψ(1) = −1`, `Kl(2) = 2`; `Kl₂(0) = ψ(1) = −1`, product fibre `0` | agrees; `a = 0` outside the hyper-Kloosterman comparison, as stated |
| `traceChar` (def) = CSoFF `stdAddChar (GaloisField p m)` | `𝔽₄` at `ω`; `m = 0` | `Tr ω = 1`, value `−1`; `GaloisField p 0 = 𝔽_p`, trace = identity | agrees; ring map `ZMod p → F` unique, so the algebra structures agree |
| §0.2 tower law via CSoFF §0.6 | `𝔽₄/𝔽₂` at `ι 1` | `Tr_ι(1) = 0`, `ψ₂(ι1) = 1 = ψ₁(0)`; plain restriction gives `−1` | holds; unchanged |
| §0.2 scaling via CSoFF §5.1 (`u = c`) | `K(1, ψ(c·); 1, a) = K(1, ψ; c, ca) = K(1, ψ; 1, c²a)` | identity of sums | holds; now cited |
| `symmetricTrace` | `h₂(3,2)`, `h₃(2,1)`; wrong model `t^k` | `7 = 4+2+1` vs `9`; `4 = 4·1³` | unchanged |
| §0.1 rank-two trace route | generic matrix: disc `(a−d)² + 4bc ≠ 0`; eigenbasis formula `Σ_{s ∈ Sym 2 k} Π` | `k = 2`: `α²+αβ+β² = t² − d = h₂` | route valid; added |
| `moment`, `momentSeries` | `p = 2`: `k = 1, 2, 3`; `p = 3`, `k = 4` | moments `(−1,−1,−1)`, `(−1,−1,−1)`, `(3,−17,63,−257)`; `Z₄(3) = 1 − 10T + 9T²` | match README §§0.2–0.3 |
| `momentDegree`, `momentSeries_eq_intPolynomial` | `(p,k) = (2,3),(2,5),(2,6),(2,10),(2,12),(2,13),(3,7),(3,9),(3,12),(5,6),(5,5),(3,5),(3,6)` | computed degrees `2,3,2,3,3,7,3,3,4,3,2,2,2` = `momentDegree`; all coefficients integers, `c₀ = 1` | holds; `k = 0`: `Z₀ = (1−T)/(1−pT)` not polynomial, `hk` needed |
| `momentSeries_weights` | `Z₁₃(2)`, `Z₁₀(2)`, `Z₇(3)`, `Z₆(5)`, `Z₁₂(3)`, `Z₆(2)`, `Z₉(3)`, `Z₁₂(2)`, `Z₅(2)`, `Z₈(3)` | reciprocal-root weights `14⁶`, `11²`, `8²`, `7²`, `12³`, `6`, `10²`, `12²`, `6²`, `8²`; allowed `k+1`, or `k` for even `k` | holds; boundary weight `k` only at even `k`; `Q = 0` excluded by `c₀ = 1` |
| `momentSeries_coeff_dvd` | `Z₁₃(2)`; `Z₉(3)`; `Z₇(3)`; `Z₆(5)`; `Z₁₂(3)`; `k = 0` | `v = 0,0,2,6,12,20,30,42` vs `n(n−1)` equal; `0,0,3,10 ≥ 0,0,2,6`; `0,0,2,8`; `0,0,2,7`; `0,0,6,12,18 ≥ 0,0,2,6,12`; `k = 0`: `v(c₂) = 1 < 2` | holds; `hk` needed; `p = 2`, even `k` (`Z₁₀(2)`: `0,0,3,11`) holds numerically, not asserted |
| §8.2 even odd-`p` factorization | `k = 12`, `p = 3`: `u = 2`, `v = 1`, `m = 3` | `(1−T)(1+729T)(1−729T)² = 1 − 730T − 530712T² + 387951930T³ − 387420489T⁴` = computed `Z₁₂(3)` | holds; agrees with RD.7.21a Check |
| §8.2 `p = 2` factorization | `k = 6, 8, 10, 12` | `a,b = (0,1),(1,0),(0,0),(1,1)`; `Z = (1−T)(1+8T)`, `(1−T)(1−16T)`, `(1−T)(1+24T+2048T²)`, `(1−T)(1−64T)(1+64T)` | `deg M = 0,0,2,0` = `2⌊(k+2)/12⌋ − 2δ_{12∣k}` |
| `thetaPlus`, `thetaMinus`, `oddConductor` | `k = 9`; `p = 2` | `Θ⁺₃ = {3}`, `Θ⁻₃ = {1}`, `Θ⁻₅ = Θ⁻₇ = {1}`, `N₉ = 105` (radical model `315`); `Θ⁺₂ = ∅` | unchanged |
| `oddEulerFactorInv` | `k = 9, p = 3`; `k = 5, p = 3, 5` | `(1 + 54T + 3¹⁰T²)(1 − 243T)` (Legendre `(−2/3) = 1`); `1 + 27T`; `1 − 125T` | unchanged; middle factor alone loses `E⁺` |
| `evenEulerFactorInv`, `evenConductor` | `k = 6, p = 3`; `k = 12, p = 3`; `k = 4`, odd `p` | `1 + 27T`; `(1+729T)(1−729T)`, of degree `2 = dim V^{I} = d₁₂ − u = 4 − 2`; `1`; `N′₆ = 3` | holds |
| `middleDim` | `k = 1,…,8`; `k = 0` | `0,0,1,0,2,2,3,2`; `k = 0` junk `0`, excluded by `hk0` | unchanged |
| `paperGamma` | `d = 0, 1, 2` | `1`; `Γ_ℝ(s−1) = π^{1/2}·paperGamma 1 s`; ratio `π^{3/2}` | unchanged |
| `eulerCoeff` | `n = 0`; family `L ≡ 1` at `s = 0` | `eulerCoeff L 0 = 1` but `LSeries.term` gives `0`; LSeries `1` = Euler product | unchanged |
| `oddMoment_functionalEquation` | `k = 1`; `k = 3`; Hodge recipe `k = 5, 7` | `Λ₁ = 1`; `Λ₃(s) = (3/π)^{1/2}·Λ(s−2, χ_{−3})`, reflection `s ↦ 5 − s`; `Γ` indices `j = 1..d` from pairs `(2,4)`, `(2,6)+(4,4)` | holds; abscissa `(k+3)/2` from weight `k+1` |
| `evenMoment_functionalEquation` | `k = 2, 4`; `k = 6, 8` | `r = 0, P = 1, ε = 1, Λ = 1`; Hodge pairs give `Γ_ℂ(s−2)… = Π_{j ≤ d_k} Γ_ℝ(s−j)`, `d₆ = d₈ = 2`; level `2^{r}·N′ = 6` for both | holds; existential `r, P, ε` before `Λ`, not vacuous (odd part must match) |
| `P(2^{−s})⁻¹` junk at a zero | `P = 1 − cT`, `|1/c| < 2^{−(k+3)/2}` | expression `0` at the pole = normal-form value `0` | no exploit; unchanged |
| §1.2 new Check | `𝔽₂`, `a = 1` | `1 + T + 2T²`, roots `|z| = 2^{−1/2}`; `1 + T − 2T²` roots `−1/2, 1` | correct |
| `SymmetricPower.finrank_eq` for §2.4 | `r = 2, k = 2`; `r = 3, k = 2` | `multichoose 2 2 = 3 = binomial(3,2)`; `6 = binomial(4,2)` | holds |

## Unresolved

- Saito-orthogonal stays `uncertified` (paywalled); §11.3 rests on the declared contract
  gap:orthogonal-motive-root-number. The six declared supplier gaps of the accepted review are unchanged:
  higher-thickness-picard-lefschetz, irregular-stationary-phase, nori-weight-filtration,
  orthogonal-motive-root-number, semisimplification-similitude-form, toric-polytope-projective-embedding.
- KloostermanSheavesAndBesselIsocrystals declares a gap on this roadmap
  (gap:scalar-kloosterman-ordinarity: the `p`-adic valuations `−(r−1)/2, …, (r−1)/2` of the Frobenius
  eigenvalues of the weight-zero `Kl_r` at every closed point, Sperber and Wan). The package does not
  state it, and I did not add it: it would extend the accepted scope. A maintainer should decide whether
  it becomes a target of Layer 1 here or moves to the consumer.
- `Suggested.lean` uses the `module` / `public import Mathlib` header (see above) rather than the literal
  line `import Mathlib`; the gate accepts it and it is the only way to a build whose only warnings are
  `sorry`. If the plain form is preferred, the build gains the one Lake module-system notice and nothing
  else changes.
- Cosmetic: ten README lines exceed 110 characters (all present in the package); left as they are.
- No suspicious instruction was found in any data read (package, reports, supplier READMEs).


Pull request: #2301 (roadmap/kloosterman-moments-and-potential-automorphy at 399a75b)
