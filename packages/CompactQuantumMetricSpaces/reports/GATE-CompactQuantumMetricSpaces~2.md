# GATE-CompactQuantumMetricSpaces~2: answers to human review

Commit `9647ef86` on the PR branch, on top of `25e9712` (not pushed). Files changed:
`TauCetiRoadmap/CompactQuantumMetricSpaces/README.md` and
`TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean`.

The comments to answer are one review by roed-math (2026-11-06), with two numbered points.
Point 1 is H01. Point 2 is split into H02 (the labels) and H03 (making the dependency visible).

## H01 (roed-math) — applied differently

§6.0 no longer builds `C*(ℤᵈ, σ)` itself. It defines `A_Θ` as HeisenbergImprimitivity §3.1's
reduced algebra `C*_r(L, c)` at `L = ℤᵈ`, `c = σ_Θ`, and takes three things from that section:
the universal property (through `C*(L, c) = C*_r(L, c)`), the faithful canonical trace with its
Fourier coefficients, and the gauge action with fixed algebra `ℂ·1`. It keeps the
identification theorem, gauge continuity and the gauge-finite subalgebra. In detail:

- **Scope.** The old paragraph "No roadmap on the main branch builds the twisted group
  C*-algebra … so §6.0 builds its regular model" (old README line 94) is replaced by a "does not
  own" bullet for HeisenbergImprimitivity §3.1 (README line 89) and the paragraph "The quantum
  tori" (line 104).
- **Sections.** §6.0 (line 1382) and the first paragraph of §6.1 are rewritten.
- **Conventions.** Both are now §6.0 Checks. HeisenbergImprimitivity's
  `(λ_c(x)h)(y) = c(x, y − x)h(y − x)` is `λ_Θ` at `c = σ_Θ`, while the variant `c(y − x, x)`
  would give the model of `−Θ`. Its star gives `W_p* = W_(−p)` because `σ_Θ(−p, p) = 1`.

OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists are not cited, for two reasons:

- They exist only in an open revision of OperatorAlgebraDynamics, a roadmap that is on main.
  Under the supplier rules such a revision cannot be a supplier, and citing its ids would make it
  one. HeisenbergImprimitivity adds a new roadmap folder, so it can be a supplier.
- With the twisted algebra consumed, this roadmap owns no copy of it. Whether
  HeisenbergImprimitivity §3.1 builds it or takes it from OperatorAlgebraDynamics is for those
  two roadmaps to settle.

## H02 (roed-math) — applied

SmoothBanachRepresentations has no SB labels, either at the reviewer's head `b04eb8f` or at its
current head `22e3c68`. The matching sections are:

- §2.1: differentiable and smooth vectors `E^k`, `E^∞`, with `dα(X)v` linear in `X`;
- §3.1: the Lie action on smooth vectors;
- §8.1: the dense complete Fréchet star algebra, with `dα(X)(a*) = (dα(X)a)*`.

All five occurrences now cite these sections ("SB2" → "§§2.1 and 3.1", "SB8" → "§8.1"): the
Scope bullet (line 68), the supplier contract (line 268, which now states what each section
supplies), §4.5's body and its *Needs:* line, and the Layer 4 Dependencies. Every other
cross-roadmap label was checked at its owner and resolves:

- on main: BanachSpaceTheory B1/B5, VonNeumannAlgebras Layer 0 and V8.CompactErgodicActions,
  CompactGroups Layers 0–5, LieGroups Layer 2, OptimalTransport Layers 0–3,
  NoncommutativeGeometry N5–N7, RiemannianGeometry R7.8, SpinGeometry G6,
  OperatorAlgebraDynamics D2, AmenableGroups Layer 6 and CharacteristicClasses C1;
- at its pull-request head: CStarAlgebras C1/C2.

## H03 (roed-math) — answered

The PR description and SmoothBanachRepresentations' "Downstream consumers" list are outside this
roadmap's two files.

- **PR description.** The merge-order paragraph should name the open new-roadmap suppliers:
  SmoothBanachRepresentations (#1145), HeisenbergImprimitivity (#1149, a new supplier this round)
  and CStarAlgebras (#860).
- **Consumer list.** An entry "CompactQuantumMetricSpaces §4.5 consumes §§2.1, 3.1 and 8.1" is
  for SmoothBanachRepresentations to add.

## The same defect elsewhere

H01's defect is the roadmap planning an object that another roadmap owns or the pinned library
has. I searched for other cases by object and repaired them:

- **Faithful representation (§4.4).** CharacteristicClasses C1, item 3 (on main) already plans
  "one finite faithful unitary representation" of every compact Lie group, finite and
  disconnected ones included (CharacteristicClasses' scope, "the compact Lie branch, including
  finite discrete groups"). PositiveScalarCurvature already consumes it as "CharacteristicClasses
  C1, items 3–4". Changes:
  - §4.4 (line 1055) now takes the representation from there instead of proving it.
  - The headline `exists_faithful_unitary_representation` is removed from `Suggested.lean`; no
    roadmap on main or in an open pull request cites it.
  - Scope, supplier contracts (new CharacteristicClasses row), *Needs:* and Layer 4 Dependencies
    are updated.
  - LieGroups Layer 2 is now cited only for automatic smoothness of continuous homomorphisms,
    which gives smooth coefficient functions.
  - The CompactGroups point-separation clause, used only by the old proof route, is removed.
- **Tau Ceti twisted algebra.** The pinned Tau Ceti has `TauCeti.IsFactorSet`,
  `TauCeti.twistedMonoidAlgebra`, `TauCeti.TwistedMonoidAlgebra.of`, `of_mul_of`, `lift` and
  `equivOfCoboundary` (`TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`, lines 99, 288, 322,
  336, 397, 498), and the README cited none of them. Now:
  - §6.0 identifies the finite Fourier polynomials with the injective image of
    `twistedMonoidAlgebra ℂ (Multiplicative (Fin d → ℤ)) σ_Θ` under `lift`.
  - §6.5 (line 1589) states its periodicity transport `W_p^(Θ+N) ↦ b_N(p)W_p^Θ` as
    `equivOfCoboundary` with `c = b_N`, from the `σ_(Θ+N)`-algebra to the `σ_Θ`-algebra, and
    extends it by the universal property.
  - A new "From Tau Ceti" contract row (line 229) records these declarations.
- **Suppliers that dropped out.** OperatorAlgebraDynamics D2 and AmenableGroups Layer 6 were
  needed only for the old §6.0 route. Their supplier rows are removed, and the Scope bullet now
  says they enter only through HeisenbergImprimitivity §3.1.

Two further corrections come from the adversarial pass on the changed statements:

- **Identification theorem.** The hypothesis "faithful state" is not needed. Since
  `τ_B ∘ Φ = τ_Θ` and `τ_Θ` is faithful, any state with `τ_B(V_p) = 0` for `p ≠ 0` forces `Φ` to
  be injective, and then `τ_B = τ_Θ ∘ Φ⁻¹` is faithful. The theorem now assumes a state and
  concludes faithfulness.
- **Trace formula.** `τ_Θ(a) = ⟨aδ₀, δ₀⟩` became `τ_Θ(a) = (aδ₀)(0)`. With Mathlib's inner
  product, which is conjugate-linear in its first variable, the old formula is conjugate-linear:
  it gives `−i` at `a = i·1`. A Check records this.

In `Suggested.lean`, besides the removal, the module docstring now says precisely what is
missing:

- for §6.5, the pinned Tau Ceti has only the finitely supported `TauCeti.twistedMonoidAlgebra`,
  with no involution, norm or completion;
- for `Φ_θ`, Tau Ceti has only the smooth subalgebra `TauCeti.SmoothNoncommutativeTorus θ`
  (`TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`, line 230), not the rotation
  C*-algebra.

## Notes for the worker

- **#1137's consumer list is stale.** OperatorAlgebraDynamics' "Downstream consumers" at its
  head `0e44b61` (line 2903) says CompactQuantumMetricSpaces specializes D1/D2.CentralTwists at
  §6.0 and consumes D2's amenable norm comparison. After this round it does neither directly.
- **#1149's ownership is contested.** At `950df62`, #1149 claims ownership of `C*(L, c)`, while
  #1137 names HeisenbergImprimitivity as its own consumer. If HeisenbergImprimitivity §3.1 later
  becomes a consumer of OperatorAlgebraDynamics, the citation here stays valid as long as §3.1
  exists. Once the revision is on main, it can move to OperatorAlgebraDynamics' sections.
- **Suppliers outside the merge order.** HeisenbergImprimitivity, SmoothBanachRepresentations
  and CStarAlgebras are not in `ORDER.txt` and are treated as other authors' new-roadmap pull
  requests. HeisenbergImprimitivity does not cite this roadmap, so there is no cycle.

## Build

`lake build TauCetiRoadmap.CompactQuantumMetricSpaces.Suggested`: `Build completed successfully
(8991 jobs).` There are no errors and 17 `declaration uses 'sorry'` warnings: the 17 sorry'd
theorems, down from 18 after the removal.

## Gate

`gate CompactQuantumMetricSpaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable`), output: `depcheck: 239 roadmaps, 2360 edges,
0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.

## Signature check

I appended `#check @name` for all 39 declarations to `Suggested.lean`, elaborated it once with the
allowed build command, and then removed the lines.

- Every `theorem` carries the binders its README statement needs, including the order instances
  `[IsOrderedAddMonoid E] [PosSMulMono ℝ E]`, `[CompleteSpace E] [CompleteSpace F]` in
  `quantumGHEDist_eq_zero_iff`, and `[CompactSpace G] [T2Space G]` in
  `exists_closedLipNorm_actionLip`.
- The `def`s and `structure`s keep only the instances their bodies use (`stateSpace` keeps
  `PartialOrder`; `ExtendedLipschitzSeminorm` keeps none of the order instances), as intended.
- The only change is the removal of `exists_faithful_unitary_representation`.

## Ownership and citations

- **Ownership searches.** Done against the sibling checkouts of #1149, #1137, #1097, #1145, #860
  and #1143, and with `roadmaps grep` by object. The search terms were twisted group
  C*-algebra, noncommutative tori, `C*(ℤᵈ…)`, faithful unitary representation of a compact Lie
  group, Lip-norm, order-unit space and quantum Gromov–Hausdorff. Apart from the items above, the
  only hits are consumers of this roadmap: SpectralManifolds (§3.1, §3.6) and QuantumFoundations
  (1.4, 3.3, 3.6). No id they cite changed.
- **Revisions of CharacteristicClasses.** The open revisions (#1807, #1808, #1854) all keep
  C1, item 3.
- **`roadmaps overlaps`.** No dropped ids, and no ids that only an open revision defines.
- **`roadmaps resolve`.** No citation or Lean name is found nowhere. Each Tau Ceti name cited
  was checked by hand at the pin, with its namespace.

## Adversarial pass on added or changed statements

The numerical checks are in a scratch script; the maximum errors are listed where used.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| `σ_Θ` is a normalized 2-cocycle with `σ_Θ(−p, p) = 1` | d = 0, 1, 2, 3, 4; random real skew Θ | `σ(−p,p) = exp(−πi pᵀΘp) = 1` (error 0); d = 0: empty exponent, σ = 1; d = 1: Θ = 0, σ ≡ 1 | holds |
| `λ_Θ(p)λ_Θ(q) = σ_Θ(p,q)λ_Θ(p+q)` | on `δ_r`, d = 1..4, 800 random triples | `σ(q,r)σ(p,q+r)` vs `σ(p,q)σ(p+q,r)`: max error 6.1e-14 | holds |
| `λ_Θ` = HeisenbergImprimitivity's `λ_c` at `c = σ_Θ` | `h = δ_q` | `(λ_c(x)δ_q)(y) = c(x,y−x)δ_q(y−x)`, nonzero only at y = x+q, value `c(x,q)`; variant `c(y−x,x)` gives `σ_Θ(q,x) = σ_(−Θ)(x,q)` (error 0) | holds; variant added as Check |
| `W_p* = W_(−p)` | HeisenbergImprimitivity's star `δ_x* = conj(c(−x,x))δ_(−x)` | `c(−p,p) = 1`, so `W_p* = W_(−p)` | holds |
| finite Fourier polynomials = injective image of `twistedMonoidAlgebra` under `lift` | d = 0; general d | `lift` needs `u 1 = W_0 = 1` (σ(0,q) = 1) and `u p u q = σ(p,q)u(p+q)`; `Σ c_pW_pδ₀ = Σ c_pδ_p` (σ(p,0) = 1), zero only for c = 0; d = 0: ℂ → ℂ identity | holds |
| universal property of `A_Θ` | d = 1, `B = C({±1})`, `V_p = t^p`; d = 0 | unique hom `C(T) → C({±1})`, restriction; d = 0: `ℂ → B`, `1 ↦ 1` | holds |
| `τ_Θ(a) = (aδ₀)(0)` is the faithful trace | `a = W_p`, `a = i·1`, `a*a` | `τ(W_p) = δ_(p,0)`; `τ(i·1) = i`, whereas the old `⟨aδ₀,δ₀⟩` gives `−i` under Mathlib's convention; `τ(a*a) = ⟨aδ₀,aδ₀⟩ = ‖aδ₀‖²` | formula changed; Check added |
| gauge action implemented by `M_z δ_q = z^qδ_q` | d = 1..4 random z, p, q | `z^(−q)z^(p+q) = z^p`: max error 6.8e-16 | holds |
| identification theorem with a state rather than a faithful state | d = 1, `B = C({±1})`; `B = C(T)` with Haar measure; d = 0; d = 1, `B = C(K)` with K ⊆ T closed | `V_2 = 1` so no state kills it, and Φ is not injective; Haar measure: Φ = id; d = 0: τ(1) = 1 forces B = ℂ; K: `∫z^p dμ = 0` for p ≠ 0 forces μ = Haar, so K = T | hypothesis weakened; faithfulness now a conclusion; negative control added |
| `E_p(a) = ∫ z^(−p)α_z(a) dz = τ_Θ(aW_p*)W_p` | `a = W_q` | left side `δ_(p,q)W_q`; right side `σ(q,−p)δ_(p,q)W_p = σ(p,−p)δ_(p,q)W_p = δ_(p,q)W_p` (error 0) | holds |
| gauge action point-norm continuous | d = 1, rotation on `C(T)` | each `α_z` isometric; `‖z^pW_p − w^pW_p‖ = |z^p − w^p| → 0`; ε/3 over the dense span | holds |
| §6.5: `equivOfCoboundary` with β = σ_(Θ+N), α = σ_Θ, c = b_N | d = 1..4, random integer skew N; d = 2 with `N₁₂ = 1` on `[−2,2]⁴` | hypothesis `σ_(Θ+N)(p,q)b(p+q) = σ_Θ(p,q)b(p)b(q)`: max error 1.2e-13; d = 2 exact; `of p ↦ b(p)•of p` is `W^(Θ+N)_p ↦ b_N(p)W^Θ_p` | holds; direction matches |
| §4.4 consumes a faithful π from CharacteristicClasses C1, item 3 | K = ℤ/2 (regular representation), K = T with `1 ⊕ z`, `1 ⊕ z²`, `T^ℕ` | ℤ/2: χ = 4 at 1, 0 at −1, `k_n = 2δ_1`, `δ_n = 0`; T: χ = 2 + 2cos θ, unique maximum 4 at θ = 0; `1 ⊕ z²`: maxima at 0 and π; `T^ℕ`: every finite-dimensional representation factors through finitely many coordinates | holds; the supplier's scope includes finite and disconnected groups |
| coefficient functions smooth via LieGroups Layer 2 | K = T, `π(θ) = e^(iθ)` | continuous homomorphism, smooth coefficient `e^(iθ)` | holds |
| SmoothBanachRepresentations §§2.1/3.1/8.1 supply what §4.5 uses | G = T on `C(T)` | `E¹ = C¹(T)`, `dα(∂θ)f = f′`, `L_der = ‖f′‖_∞`; star law at `f = e^(ix)`: `D(f*) = −ie^(−ix) = (Df)*` | holds |
| Lean docstring: the claims of what is missing at the pins | `Twisted/Basic.lean`, `Twisted/Finite.lean`, `SmoothTorus/Basic.lean` | no `star`, norm or completion on `twistedMonoidAlgebra`; `SmoothNoncommutativeTorus θ` is a structure of rapidly decreasing coefficients with no C*-completion | holds |

## Sources

No new source is cited and no locator changed. `needs-references.toml` was not written. No
manifest entry changed; this job may edit only the README and `Suggested.lean`.

## Untrusted text

Nothing in the review asks for an action outside the job. Its closing status note ("Moving this
to `awaiting-author` …") is process text and was not acted on.
