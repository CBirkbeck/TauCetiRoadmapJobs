# GATE-KloostermanSheavesAndBesselIsocrystals~3: answers to human review

Head `0f55f75`; one unanswered comment, one point. Nothing changed in
`TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md` or `Suggested.lean`.
There was nothing to commit.

## H01 (mycaule) — answered

No change: `LeanPool/KloostermanWeil` proves Weil's bound for the two-variable Kloosterman sum over
`ZMod N`. It does the prime moduli by Stepanov's method together with Carlitz's generating identity
for the sums over `𝔽_{p^n}`, then the squarefree moduli by the Chinese remainder theorem. This
roadmap does not state any of that or use it in a proof route. Its archimedean input is the purity
of the Kloosterman sheaves, taken from CongruenceSpectralGap §4.2b, and its own bounds are `p`-adic:
the Newton bounds of Layers 5 and 11. The only shared object is the sum itself, `K(a, b) =
kloostermanSum ψ 2 (ab)` for `ab ≠ 0`, which the README already takes from CongruenceSpectralGap
§4.2a. Everything LeanPool proves there is owned by CharacterSumsOverFiniteFields §§4.1–4.4
(Stepanov), §5.4 (the Kloosterman `L`-polynomial and lifting relation), §5.5 (Weil's bound,
`norm_kloostermanSum_le`) and §7.3 (moduli `c`). A citation of the LeanPool project belongs in that
roadmap's Provenance section, which does not list it.

## Evidence for H01

- **What LeanPool proves.** These files were read at the commit the comment links,
  `f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0`. They are Apache-2.0, by Charlie Dorsey.
  - `LeanPool/KloostermanWeil/Weil/PrimeKloosterman.lean`: `prime_bound` and `weil1948_bound`.
  - `Weil/ChineseRemainderAndCompletion.lean`: `kloostermanUnitSum N a b`, the sum of
    `stdAddChar(b x + a/x)` over the units of `ZMod N`, valued in `ℂ`.
    - `kloostermanUnitSum_prime_le_two_sqrt_of_not_both_zero` gives `‖·‖ ≤ 2√p`.
    - `kloostermanUnitSum_squarefree_unit_le` gives `‖·‖ ≤ 2^{ω(q)} √q` for squarefree `q`.
    - The file also has Fourier completion of incomplete sums and partial summation.
  - `Carlitz/GeneratingIdentity.lean`: `carlitz_generating_identity`. Its `KSeries` is the
    logarithm of the quadratic `L`-polynomial, for `t ∈ 𝔽_p^×` and the sums over `𝔽_{p^n}`.
  - The project also has a `Stepanov/` folder.
  - The project has no sum of rank above two, no general finite field `𝔽_q` in the Weil bound, and
    no sheaf.
- **What this roadmap contains.** A search of the README finds no archimedean bound on Kloosterman
  sums, no Stepanov argument and no rank-two lifting relation.
  - Its only "lifting relation" is Hasse–Davenport for Gauss sums, in Scope and in the
    CharacterSumsOverFiniteFields §3.3 contract.
  - Scope already gives the raw sums, the Kloosterman sheaf of every rank and its purity to
    CongruenceSpectralGap §§4.2a–4.2b. That roadmap's §4.2b proves `hyperKloosterman_bound`,
    `‖Kl_k‖ ≤ k|F|^{(k−1)/2}`, which is Weil's bound at `k = 2`.
- **The shared sum.** For `a, b ∈ F^×`, the map `x ↦ (ax, b/x)` is a bijection from `F^×` onto the
  pairs `uv = ab`, so `Σ_x ψ(ax + b/x) = kloostermanSum ψ 2 (ab)`.
  - Computed check over `𝔽₃`, with `ψ(x) = ω^x` and `a = b = 1`. The left side is
    `ψ(2) + ψ(2 + 2) = ω² + ω = −1`. The right side sums over the pairs `(1,1)` and `(2,2)`, giving
    `ω² + ω = −1`.
  - The degenerate case `ab = 0`, which LeanPool covers when exactly one of `a, b` is zero, is a
    Ramanujan sum. `kloostermanSum` takes `a : Fˣ` and does not reach it.
- **Owners, checked at their heads.**
  - CharacterSumsOverFiniteFields: Scope lists Stepanov's method and Weil's bounds (Layer 4) and
    Kloosterman sums with the `L`-polynomial, lifting relation and Weil's bound `|K(χ; a, b)| ≤
    2√q` (Layer 5). It has §5.4 and §5.5 as above, and §7.3, Kloosterman sums modulo `c`.
  - Its Provenance section cites `AxiomMath/Weil`, `formal-arithmetic-geometry/weil-conjectures`
    and `AxiomMath/Stacks`, and says Kloosterman sums have no counterpart in those three.
  - AutomorphicSpectralTheory §1.16 owns the classical sum `S(m, n; c)`. CharacterSumsOverFiniteFields
    §7.3 compares its sum with that one.
  - A search for `KloostermanWeil` finds no roadmap that cites it, on main or at any open head.
- **Adversarial pass.** No statement was added or changed, so there is nothing to record. The one
  identity the answer relies on is the bijection above, checked at `𝔽₃`.
- **Lean.** `Suggested.lean` is unchanged, so no `#check @name` comparison was rerun.
  `scratch/signatures.md` reports 0 declarations that lost a section binder.
- **Ownership against open pull requests.** I checked CharacterSumsOverFiniteFields and
  CongruenceSpectralGap at the heads the brief lists. I also ran `roadmaps grep` for `LeanPool`,
  `lean-pool` and `KloostermanWeil` across main and every open head.
- **Untrusted text.** The comment contains no instructions.

## Build

`lake build TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals.Suggested`: `Build completed
successfully (18239 jobs).` There are four `declaration uses 'sorry'` warnings, at lines 68, 135,
147 and 160; these are the four headline theorems.

## Gate

`gate KloostermanSheavesAndBesselIsocrystals: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Dependency direction

`depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
