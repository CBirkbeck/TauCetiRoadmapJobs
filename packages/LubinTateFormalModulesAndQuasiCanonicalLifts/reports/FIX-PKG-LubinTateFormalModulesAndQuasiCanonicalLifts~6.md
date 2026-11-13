# FIX-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~6

One review (`REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~5`, one finding).

## F01 (P1) — applied

§2.1: `G[π^m] = Spf R[[X]]/([π^m]_G)` → `G[π^m] = Spec A_m`, `A_m = R[[X]]/([π^m]_G)`, with
comultiplication, counit, antipode and `O_K`-action built from the formal law. Its formal
completion is the kernel on `Spf R[[X]]`, and its `L̄`-points are the `π^m`-torsion of §0.2. Added
an API list, a `μ₃` Spec-versus-Spf Check and a square-zero Check.

**Verification.** The finding is right. At the pinned Tau Ceti,
`TauCeti.FormalScheme.Spf.carrier_eq_zeroLocus`
(`TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:92`) makes the points of `Spf A` the zero
locus `V(I)` of an ideal of definition. For `A = ℤ₃[[X]]/(3X + 3X² + X³) ≅ ℤ₃[T]/(T³ − 1)`
(`T = 1 + X`), `Spec A` has three primes: `(T − 1)`, `(T² + T + 1)` (prime because `−3` is not a
square in `ℚ₃`) and `(3, T − 1)`. `Spf A` for the 3-adic topology has only `(3, T − 1)`. So the
formal spectrum has no generic fibre, while §§2.2, 5.1 and 5.5 use the generic fibre (geometric
points, schematic closure). The supplier agrees with the repair: FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.1.13 writes the levels of a connected `p`-divisible group as `Spec A_v` and the formal Lie
group as `Spf(lim A_v)`.

**What changed, and why the construction is sound.**

- `A_m ⊗_R A_m ≅ R[[X, Y]]/([π^m]_G(X), [π^m]_G(Y))`. This follows from Weierstrass division in
  `Y` over the complete local ring `A_m`, after division in `X` over `R[[Y]]`.
- `[π^m]_G(G(X, Y)) = G([π^m]_G X, [π^m]_G Y)` lies in that ideal, so the comultiplication is well
  defined. The same argument covers the antipode, the action and the counit.
- `X^(q^(hm)) ∈ 𝔪_R A_m`, because the distinguished polynomial has non-leading coefficients in
  `𝔪_R`. So the `𝔪_R`-adic and `(𝔪_R, X)`-adic topologies agree, and the formal completion is the
  closed formal subgroup of `Spf R[[X]]` cut out by `[π^m]_G`.
- The repair also places `G[π^m]` in the pinned carrier `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`, through
  `TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122,139`).
  Both names were checked with `#check` (below). The README now says in Scope and ownership and in
  the Tau Ceti contract that this carrier is already in Tau Ceti.
- ModularCurves §0B stays in the Needs line, now only for fppf exactness of short sequences of
  finite locally free groups. That is what §0B on main supplies ("Prove exactness for fppf-exact
  short sequences whose terms are finite locally free").
- The generality of `R` (any complete noetherian local `O_K`-algebra with residue characteristic
  `p`) and every rank statement are unchanged. The geometric-point identification is stated for
  `R = O_L`, the only base where §2.2 uses it.

**The same pattern elsewhere (repaired).**

- §2.2: `G[π^m](L̄)` is now defined as the geometric points of the generic fibre of
  `Spec A_m`, identified in §2.1 with the torsion of §0.2. The proof route said "the levels are
  étale". It now says "the generic fibres of the levels are étale": `μ₃` over `ℤ₃` has special fibre
  `𝔽₃[X]/(X³)`, so the level is not étale.
- §5.1: the schematic closure is now taken in the base change to `R′` of `G[ϖ₀^m] = Spec A_m`, for
  any `m` with `ϖ₀^m L ⊂ T`, and is independent of `m`. A schematic closure needs a scheme with a
  generic fibre; the formal spectrum has none.
- §5.5: the old text read "`C_L` is the completion of a finite flat subgroup", which mixes up a set
  of geometric points with a completion. Now `H ⊂ E` is a finite locally free subgroup scheme
  whose special fibre is supported at the zero section. It is shown to be `Spec(R[[X]]/J)` inside
  `G[p^m] = Spec(R[[X]]/([p^m]_G))`, and it is the §5.1 subgroup when `H(K̄)` is `O₀`-stable, as
  always when `O₀ = ℤ_p`.
  - The `O₀`-stability hypothesis is new and needed. It gets its own Check: in the §4.4 case
    `O₀ = W(𝔽_(p²))`, an order-`p` subgroup has an `𝔽_p`-line in `𝔽_(p²)` as points.
  - The "kernel of `[p]`" Check now says `H = G[p] = E[p]⁰`, and excludes `E[p]` for ordinary
    reduction.
  - The Needs line gains §§2.1, 5.1 and ModularCurves §§0B, 7E (PD-2). Layer 5 Dependencies gain
    ModularCurves §7E. Layer 2 Dependencies name Tau Ceti's finite locally free commutative affine
    group schemes.
- No other `Spf` construction remains. The only other use of `Spf` is the formal Lie group
  `Spf R[[X]]` of the supplier.

## Checks run

- **Elaboration.** `lake env lean packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
  run from the content checkout, exited 0. The only diagnostics are five
  `declaration uses 'sorry'` warnings, at lines 77, 91, 113, 129 and 151. `Suggested.lean` is
  unchanged in this round, and no build was needed: its three Tau Ceti imports have object files.
- **Signatures.** A scratch file holding `Suggested.lean`, plus an import of
  `TauCeti.AlgebraicGeometry.AffineGroupScheme.CartierDuality.FiniteLocallyFree`, plus `#check @name`
  for all seven declarations and for the two new Tau Ceti names, elaborated with exit 0.
  - All seven elaborated types match their README statements and the signatures the worker recorded
    before this round. Both predicates keep `CommRing` and `IsLocalRing`. The two
    construction theorems keep the domain, DVR, finite residue field and irreducible `π`. The two
    field theorems keep `CharZero` and the local-field instances, with `1 ≤ m`, primitivity and
    `↑ϖ = ↑π`. The elliptic theorem keeps primality, `s = ±1`, unit `Δ` and the point count. Nothing
    changed.
  - `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat : CommRingCat → Type`.
  - `TauCeti.finiteLocallyFreeBicommutativeHopfAlgCatOpEquivFiniteLocallyFreeCommAffineGroupSchemeCat (R) [CommRing R] : (FiniteLocallyFreeBicommutativeHopfAlgCat R)ᵒᵖ ≌ FiniteLocallyFreeCommAffineGroupSchemeCat (CommRingCat.of R)`.
  - `TauCeti.FormalScheme.Spf.carrier_eq_zeroLocus`, cited in the contract, was read in the pinned
    source (`Carrier.lean:92`). It was not `#check`ed: its module has no object file, and
    `Suggested.lean` does not import it, so no build is sanctioned for it.
- **Depcheck.** The required command printed exactly:

  ```text
  depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. The new citations are Tau Ceti at the pin, ModularCurves
  §§0B, 7C, 7E (on main) and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.12–R07.1.13
  (earlier in the merge order, already cited).
- **Citations.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None",
  "Lean names found nowhere: None". The tool notes that it did not check Lean names outside
  TauCetiRoadmap on this host; the two new Tau Ceti names were checked by `#check` above.
- `sources.toml`, `metadata.toml`, `Suggested.lean` and `design/plan.json` are unchanged. No source
  was added or fetched; the repair is standard algebra, and its locators are unchanged.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §2.1 `A_m` free of rank `q^(hm)` | `Ĝ_m/ℤ₃`, m=0,1,2; `Ĝ_m/𝔽₃[ε]`; additive `/𝔽_p` | `[3]=3X+3X²+X³`, rank 3; m=0 rank 1; `[9]=(1+X)⁹−1` distinguished of degree 9; over `𝔽₃[ε]`, `[3]=X³`, rank 3; additive `[p]=0`, quotient not finite | Holds; finite height needed (existing Check) |
| §2.1 Hopf structure from the law | `Ĝ_m/ℤ₃`, m=1, with `T=1+X`; wrong model: additive comultiplication `X⊗1+1⊗X` | `Δ(T)=(1+X)⊗(1+X)=T⊗T`, `ε(T)=1`, `S(T)=T⁻¹=T²`, `T·S(T)=T³=1`; the additive model gives `[3](X+Y) ≡ 6XY+3X²Y+3XY² ≠ 0` in `A_1⊗A_1` (basis `X^iY^j`) | Law-induced maps are well defined; the wrong model is not; Check added |
| §2.1 Spec vs formal completion | `ℤ₃`, `μ₃`; `𝔽₃[ε]/ε²`; m=0 | Spec: 3 primes `(T−1)`, `(T²+T+1)`, `(3,T−1)`; Spf (3-adic): 1 point; `X³=−3X−3X²∈(3)`, so the topologies agree; square-zero base: `𝔪_R`-adic topology discrete, Spec = Spf (1 point); m=0: `Spec R`, completion `Spf R` | Negative control and artinian case added as Checks |
| §2.1 killed by `π^m`, exact sequence | `Ĝ_m/ℤ₃`, m=n=1 | On `A_1`, `[3]: T↦T³=1` (counit composite); ranks `3·3=9=rank A_2`; `A_2` free of rank 3 over `A_1` via `X↦[3](X)`; kernel `A_2/([3]X)=A_1` since `[9]=[3]∘[3]` | Holds |
| §2.1 geometric points = torsion of §0.2 | `Ĝ_m/ℤ₃`, m=1 | `Hom(A_1, ℚ̄₃)` has 3 elements, `X ↦ 0, (−3±√−3)/2 = ζ₃^(±1)−1`, valuation `1/2 > 0`; `(ζ−1)+_G(ζ−1)=ζ²−1`, matching `T⊗T` | Holds; stated only for `R=O_L` |
| §2.1 base change and homomorphisms | `φ:G→G′` with `φ(0)=0` | `[π^m]_{G′}(φ(X)) = φ([π^m]_G X) ∈ ([π^m]_G X)`, so `X′ ↦ φ(X)` is well defined | Holds |
| §2.2 "generic fibres étale" (was "levels étale") | `μ₃/ℤ₃` | Special fibre `𝔽₃[X]/(X³)` is non-reduced; generic fibre `ℚ₃[T]/(T³−1)` is separable | Wording corrected |
| §5.1 closure in `Spec A_m`, independent of `m` | `L=T`; `L=ϖ₀⁻¹T` with m=1,2 | `L=T`, m=0: closure of the trivial group in `Spec R` is `Spec R`; `L=ϖ₀⁻¹T`: closure is `G[ϖ₀]` in both `G[ϖ₀]` and `G[ϖ₀²]` (closed flat, same generic fibre) | Holds |
| §5.5 `H` in `G[p^m]` | supersingular (height 2), ordinary (height 1), étale subgroup | Supersingular: `E[p]=G[p]` of rank `p²`. Ordinary: `E[p]⁰=G[p]` of rank `p`, while `E[p]` (rank `p²`) has `p` points in its special fibre, so it is excluded. An étale subgroup of order `p` has `p` reduced special points, so it is excluded | Holds; Check rewritten |
| §5.5 `O₀`-stability (new hypothesis) | §4.4 curve, `O₀=W(𝔽_(p²))`, `ϖ₀=sp` | `G[p](K̄) ≅ O₀/p = 𝔽_(p²)` (order `p²`); an order-`p` subgroup is an `𝔽_p`-line, not `𝔽_(p²)`-stable, so it has no `O₀`-lattice; it is a lattice kernel for `O₀=ℤ_p` | Hypothesis needed; Check added |
| §5.5 "order `p^m` kills `H`" | `H=G[p]` supersingular | Order `p²` kills `H` (so does `p`) | Correct (Deligne, via ModularCurves §0B) |

## Ownership and consumers

- The torsion group scheme of a formal `O_K`-module was already a §2.1 target. Its construction is
  repaired here, not newly claimed.
  - An object search with `roadmaps grep` for the `Spec R[[X]]/([π^m])` construction found no
    other owner on main or in any open roadmap pull request.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.12–R07.1.13 owns the `p`-adic formal Lie
    group and the equivalence with connected `p`-divisible groups. §2.1 compares with it and adds
    the `π`-adic levels with the `O_K`-action.
  - The finite locally free carrier is Tau Ceti's at the pin.
- ComplexMultiplicationAndExplicitReciprocityPartII consumes §2.1 as "finite flat `πⁿ`-torsion
  group schemes … identified with the `π`-power torsion of a `p`-divisible group", with geometric
  points `G_π[πⁿ](K̄)`. The repaired `Spec` construction is what that contract needs. The §2.1
  heading and numbering are unchanged, so no citation of another roadmap breaks.
- No Lean name changed and no section was renumbered. No supplier gap was needed, so
  `design/plan.json` is untouched.

## Notes for the maintainer

- §5.5 now carries an explicit `O₀`-stability hypothesis on `H(K̄)`; it is automatic for
  `O₀ = ℤ_p`. Any consumer applying §5.5 to a formal `O₀`-module with `O₀ ≠ ℤ_p` (such as the BKO
  `W(𝔽_(p²))` setting of Layers 7–8) needs that hypothesis. Its own uses inside this roadmap (the
  quasi-canonical kernels of Layers 6–7) are `O₀`-stable by construction.
- No suspicious instructions were found in the review text.
