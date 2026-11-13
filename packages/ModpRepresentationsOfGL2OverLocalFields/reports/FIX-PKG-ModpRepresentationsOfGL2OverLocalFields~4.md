# FIX-PKG-ModpRepresentationsOfGL2OverLocalFields~4

Repair of the four findings of `REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3`. Files changed:
`packages/ModpRepresentationsOfGL2OverLocalFields/README.md`, `.../Suggested.lean`,
`.../sources.toml`. `metadata.toml` and `design/plan.json` are unchanged (no new supplier gap).

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3/F01 (P2) — applied

Verified: `Mathlib/RepresentationTheory/Continuous/Basic.lean:541`/`:558` (`coindV`: `f(φ g * h) = π g (f h)`,
right translation) states CDN23 Corollaire 1.34 (line 917). New Lean headline
`exists_coind_approximation_of_lattice` (README §2.6 names it, restates the target on a lattice
`Θ ⊆ E`). Docstring: Banach version moved from "not statable" to "stated". Differences from the
review's witness are listed under Notes.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3/F02 (P2) — applied

Verified: `G = U = {1}`, `V = k` gives `1/dim U = 1/0`, and CompletedCohomologyPartII §5.8 assumes
`d > 0`. §4.1: growth clause → "uniform of dimension `d > 0` and `V ≠ 0`", bounds
`[U:U^{p^r}]^{dim_G V/d}`; a separate `dim G = 0` clause (V finite-dimensional, `dim_G V = 0`,
constant invariants); new negative-control Check `G = U = {1}`. Scope bullet: "uniform group" →
"of dimension `d > 0`".

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3/F03 (P2) — applied

Verified: ModularCharactersAndBlocks §3.1 (open, not in the merge order) states `Φ_φ = Σ d_{χφ} χ`,
the same identity. §5.4: "Let `Γ` be a finite group" → the layer's `Γ = GL₂(k_F)`; the Hom chain is
stated as the instance obtained from R17.5.11, the pinned lifts and Hom base change; "owns only this
transport" deleted. Checks rewritten for `GL₂(𝔽_p)`. Scope: generic Brauer reciprocity is not owned.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~3/F04 (P3) — applied

Verified: VIGNERAS11 line 723 (Théorème 6, pp. 19–21: finite length, subquotients admissible and
finitely presented); line 1025 (Théorème 7, p. 26: `U₀`-invariants of `B⁺`-submodules). §2.4 route:
"Proposition 8 and Théorème 7" → "Proposition 8, p. 21, and Théorème 6, pp. 19–21"; Théorème 6 also
added at the finite-length claim. References and the manifest locator corrected (same key).

## Notes on the repairs

**F01, how the statement differs from the review's witness.**

- `F ≠ ℚ_p` is the hypothesis `¬ (Irreducible (p : 𝒪[F]) ∧ Nat.card 𝓀[F] = p)`, that is `ef ≥ 2`,
  instead of `¬ Nonempty (F ≃+* ℚ_[p])`. The two agree, but the ring-isomorphism form is only
  equivalent to `[F:ℚ_p] > 1` because field isomorphisms of `p`-adic fields are automatically
  continuous. `ef ≥ 2` is the condition the proof uses (§2.2: the Hecke operator is nilpotent exactly
  when `ef ≥ 2`).
- The witness's extra binders `[Module 𝒪[L] E] [IsScalarTower 𝒪[L] L E] [ContinuousSMul 𝒪[L] E]` are
  dropped. Mathlib already supplies restriction of scalars to a subring
  (`Mathlib/Algebra/Ring/Subring/Basic.lean:1109`), so a second module instance would be a diamond.
  The statement elaborates without them.
- The topology on `M` is pinned by `IsModuleTopology 𝒪[L] M`
  (`Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`) instead of `CompactSpace`/`T2Space`.
  For a finite module over the compact `𝒪` the two agree (both give the `ϖ_L`-adic topology); this
  form says it directly. `IsTopologicalAddGroup` and `ContinuousSMul` stay as existential binders
  because `coind` needs them as instances.
- README §2.6 now states the target in the same form as the Lean (Banach space `E`, open bounded
  `Θ`, jointly continuous action on `Θ`, reduction in `𝒞_𝒪(G)`). It says why this is the source's
  setting: the action extends `L`-linearly to `E = L·Θ`, and that extension is admissible because
  its reduction is.
- New Checks: how `ef ≥ 2` reads on `ℚ_{p²}`, `ℚ_p(√p)` and `ℚ_p`; and a negative control for `F = ℚ_p`
  using lattices with supersingular reduction.
- The new citation PadicLocalLanglandsForGL2Qp §2.6 (constituents of mod `p` principal series) is
  added to that supplier's contract and to the Layer 2 dependencies. The Mathlib contract gains
  `ContIntertwiningMap`, `IsModuleTopology` and `Subrepresentation.quotient`, with a note that
  `ContRepresentation` includes no continuity in the group variable.

**F03, why §5.4 was narrowed rather than ModularCharactersAndBlocks being cited.** That roadmap is
an open pull request by another author and is not in the merge order. The review twice asked for it
not to be added as a supplier. Layer 5 already fixes `Γ = GL₂(k_F)` and `p > 3`, and §5.4 was the
only place that widened `Γ` to an arbitrary finite group. Every consumer of §5.4 inside the roadmap
(§§5.5, 8.4, 9.1) and outside it (HilbertModularVarietiesAndShimuraCurvesPartII's citations of
MP.5/projective-adjoint) uses only `Γ = GL₂(k_F)`. The generic lifting results are still imported
from Tau Ceti, and the pairing from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, which owns
it.

The new §5.4 Checks:

- **Steinberg weight.** `Sym^{p−1}` is free over the Sylow subgroup `⟨u⟩`, because
  `(u−1)^{p−1} Y^{p−1} = (p−1)! X^{p−1} ≠ 0`, so it is projective. Its lift is the Steinberg
  lattice, and `p ∤ [Γ:B] = p+1` makes `Ind_B^Γ k = k ⊕ St_k`.
- **Equal characteristic.** The trivial weight's lift has the trivial character at least twice
  (`k[Γ]` is symmetric and `P_k ≠ k`), against `[k:k] = 1` for the trivial lattice.
- **Hom base change.** On `M = 𝒪` and `M = k` both sides have rank (dimension) 1.

## Checks run

- **Elaboration.** `lake env lean` on `packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean`,
  run from the content checkout: exit 0. There are exactly seven warnings, all "declaration uses `sorry`", at
  theorem lines 104, 121, 133, 151, 166, 180 and 202, and no errors. There are no `TauCeti.*`
  imports to build.
- **Signatures.** One scratch file with `#check @name` for all 12 declarations elaborated with exit
  0. The 11 unchanged declarations have the same elaborated types as in `signatures.md`. For
  `exists_coind_approximation_of_lattice`, every binder of the README statement is present in the
  elaborated type:
  - `[CharZero F]`, `[CharZero L]`, `[CharP 𝓀[F] p]`, `[CharP 𝓀[L] p]`;
  - `hF`, `hϖ`, `hB`;
  - `[CompleteSpace E]`, `hopen`, `hbdd`, `hρ`, `hS`, `hadm`, `hfp`.

  No section variable is involved; the declaration carries its binders itself.
- **One-tactic check.** The new theorem is an existential with no library counterpart: no Mathlib
  or Tau Ceti declaration concludes anything about `ContRepresentation.coind` with finite kernel or
  cokernel.
- **Dependency direction**, output in full:

  ```text
  depcheck: 237 roadmaps, 2151 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name
  found nowhere.
- **Ownership against open pull requests.** I checked with `roadmaps grep` and `roadmaps show`.
  - `Corollaire 1.34|exists_coind_approximation` matches nothing on main or in any open pull
    request, so the Banach headline has no other owner.
  - Brauer reciprocity: ModularCharactersAndBlocks §3.1 owns the generic identity. This roadmap now
    states only its `GL₂(k_F)` instance, built from earlier inputs.
  - No `Suggested.lean` declaration takes the fully qualified name of another roadmap's declaration.
- **Manifest.** `sources.toml` parses (18 sources). VIGNERAS11 keeps its key; its locator is now
  "§5, Lemme 11, Propositions 8-10 and Théorème 6, pp. 19-21 (arXiv numbering)". Propositions 7
  and 11 are not cited anywhere in the README, so they leave the locator.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `exists_coind_approximation_of_lattice` | `E = 0`, `Θ = 0` | `Θ/ϖΘ = 0`: admissible, presented by `W₂ = 0`. Take `M = 0`, `f = 0`: ker rank 0, coker rank 0. | Holds. |
| same | `E = L`, `Θ = 𝒪` trivial | Reduction `k` (invariants dimension 1; presented with `Δ = k`). Take `M = 0`: ker 0, coker `𝒪` of rank 1. | Holds; Check kept. |
| same | `Θ` the induced lattice of a unitary `χ` | `M = 𝒪(χ)`, `f = id`: ker 0, coker 0. | Holds; Check kept. |
| same, boundedness | `E = L`, `Θ = L` (open, not bounded) | `ϖL = L`, so the reduction is 0 and in `𝒞`. A map into `L` with coker finite over `𝒪` is impossible, since `L` is not finite over `𝒪`. | Statement false without `hbdd`; hypothesis present. |
| same, `F ≠ ℚ_p` | `ℚ_p`; `ℚ_{p²}`; `ℚ_p(√p)` | `ℚ_p`: `p` irreducible and `#k_F = p`, so excluded. `ℚ_{p²}`: `#k_F = p²`. `ℚ_p(√p)`: `p = (√p)²` is not irreducible. | Exactly `ℚ_p` excluded; Check added. |
| same, `F = ℚ_p` control | `Θ` with supersingular reduction `π` | Finite coker forces the image of `Ind σ` to have finite codimension in infinite-dimensional irreducible `π`, so to map onto `π`. But irreducible subquotients of `Ind_{B̄}^G τ` are characters, Steinberg twists and principal series (PLLGL2 §2.6). | No `σ` exists; `hF` necessary; Check added. |
| same, topology on `M` | `M = 𝒪`: discrete vs `ϖ_L`-adic | `f = Σ ϖ_L^n 1_{U_n}` gives `f(x) − f(0) = −ϖ_L^{m+1}/(1−ϖ_L) ≠ 0` at `v(x) = m`, so `f` is continuous for the `ϖ_L`-adic topology but not locally constant. | `IsModuleTopology` excludes the discrete (smooth-induction) model. |
| same, Borel convention | `(a 0; c d)` vs `(a b; 0 d)` | `hB` (entry `(0,1) = 0`) admits the lower and excludes the upper. Inflation: `σ(1 0; c 1) = 1`. `coindV`: `f(b̄g) = σ(b̄)f(g)`. | Matches the §2.1 opposite-Borel convention. |
| §4.1 growth clause | `U = ℤ_p`, `V = k`; `V = C^∞(ℤ_p,k)`; `U = {1}`, `V = k` | `1 = (p^r)^{0/1}`; `p^r = (p^r)^{1/1}`. For `U = {1}`: `d = 0`, index 1, invariants 1, grade 0, `dim_G = 0`; `1/0` undefined. | Growth only for `d > 0`, `V ≠ 0`; zero-dimensional clause and Check added. |
| §4.1 zero-dimensional clause | `G` discrete, `V = k²` | Admissibility with `U = {1}` gives `dim V = 2 < ∞`. Over `k`, `V^∨ = k²` has grade 0, so `dim_G = 0 − 0 = 0`. Invariants are constantly 2. | Holds. |
| §5.4 identity (`Γ = GL₂(𝔽_5)`) | Steinberg `σ = Sym⁴` | `|Γ| = 480`, `p`-part 5 `= dim Sym⁴`. `(u−1)⁴Y⁴ = 24X⁴ ≡ 4X⁴ ≠ 0` (mod 5). `[Γ:B] = 6`, `5 ∤ 6`. `[L⊗P̃_σ : St_L] = 1 = [St̄ : σ]`; `[L⊗P̃_σ : 1] = 0 = [k : σ]`. | Holds; Check. |
| §5.4 dimension identity | Steinberg | `dim P_σ = 5 = 1·dim St_L`. | Holds; API bullet. |
| §5.4, characteristic zero needed | `𝒪 = 𝔽_5[[t]]`, `σ = k` | `soc P_k = cosoc P_k = k` and `P_k ≠ k` (`5 ∣ 480`), so the trivial multiplicity is at least 2, against `[k:k] = 1`. | Identity fails in equal characteristic; Check kept as negative control. |
| §5.4 Hom base change | `σ = k`; `M = 𝒪`, `M = k` | `rank Hom(P̃_k, 𝒪) = [k:k] = 1`; `dim Hom(P_k, k) = 1` (cosocle `k`). | Holds for torsion `M` too. |
| §2.4 locator | `V = k ⊕ k` trivial | Length 2, subobjects of lengths 0, 1, 2. Théorème 6 (line 723) gives finite length and finitely presented subquotients; Théorème 7 (line 1025) concerns `U₀`-invariants. | Locator corrected; mathematics unchanged. |

## For the maintainer

- **New Lean name:** `TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields.exists_coind_approximation_of_lattice`.
  No existing name changed or disappeared.
- **No identifier dropped.** §5.4 keeps its number and title. The "Former identifier" table row
  MP.5/projective-adjoint → §§5.4–5.5 still resolves.
- **Consumers.** HilbertModularVarietiesAndShimuraCurvesPartII cites MP.5/projective-adjoint and
  MP.4/gk-dimension. It uses them only for `GL₂(k_F)` covers and for `K₁/Z₁` of dimension
  `3f > 0`, so neither the §5.4 narrowing nor the §4.1 `d > 0` clause affects it.
- **Generic Brauer reciprocity** (`Φ_φ = Σ_χ d_{χφ} χ` for arbitrary finite groups) is not owned
  here. Its open-pull-request owner is ModularCharactersAndBlocks §3.1. It is not cited as a
  supplier, because it is not in the merge order.
- **No suspicious instructions** were found in the review text.
- **No new source was needed;** `needs-references.toml` was not written.
