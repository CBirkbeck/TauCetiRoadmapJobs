# FIX-RT-StackPointsAndResidualGerbes~1

Repair round for red-team round 1 (passes a and b). Eleven findings; two overlapping pairs are
settled once each, so there are nine sections. Every finding was checked against the cited texts,
SchemeAndStackFoundations and AlgebraicModuliForArithmeticGeometry on main (51d880d), the board
package VirtualFundamentalClasses, and the pinned Tau Ceti (2fd255d). Files changed:
`packages/StackPointsAndResidualGerbes/README.md`, `sources.toml`, and the top-level `gaps` list of
`design/plan.json` (one entry added). `Suggested.lean` is unchanged.

## RT-StackPointsAndResidualGerbes~1b/F01 (P1) — applied

Checked: SchemeAndStackFoundations §1.22 (main, lines 3797–3812) states only pullback,
`presentationEquiv`, `ofSpaceEquiv` and pushforward; *QCoh.abelian* is §1.11, for spaces. No roadmap
or package owns abelian/tensor `Stacks.QCoh`.

Change: new gap:qcoh-stacks-abelian-tensor (`plan.json`, README contract): abelian with kernels on
`U`, `O_𝒳`, tensor products, right-exact ⊗-compatible pullback (Lemmas 96.15.1, 96.11.2–3, 96.12.5,
78.12.6). Cited in 0.4, 7.2, both layer Dependencies, the §1.22 bullet. 7.2: "coherent sheaf" →
"quasi-coherent module"; finite-dimensionality proved on a Noetherian chart; Scope likewise.

## RT-StackPointsAndResidualGerbes~1a/F01 (P2) — applied

Checked: `packages/VirtualFundamentalClasses/README.md` §1.2 (lines 508–549) states closed
substacks, the presentation bijection, reduced induced substacks and the factorisation, never naming
this roadmap or using 0.4's ideals.

Change: Scope and Downstream: "consumes 0.3–0.5 … no other roadmap states them" → its §1.2 states
the Deligne–Mumford finite-type case of 0.3 and 0.5, owned here for all stacks; carriers agree by
0.3's unique factorisation; 0.4 unused. That roadmap's citation of 0.3/0.5 is its own package's fix.

## RT-StackPointsAndResidualGerbes~1a/F02 (P3) — applied

Checked: `AlgebraicGeometry.Scheme.Hom.exists_finite_isSeparable_comp_eq` is at
`TauCeti/AlgebraicGeometry/Morphisms/Smooth/SeparablePoint.lean:43` at the pin, as quoted.

Change: added to "From Tau Ceti", 7.3's *Needs* and Layer 7's Dependencies; 7.3 now proves the chart
exists: `U_x = U ×_𝒳 Spec k` is smooth and nonempty, a scheme étale over it has a point over a finite
separable `k'`, giving a `k'`-point of `U ×_k k'` over `x_{k'}`.

## RT-StackPointsAndResidualGerbes~1a/F03 (P3) — applied

Checked: stacks-decent-spaces lines 1546–1552 prove Lemma 68.13.7 from 68.11.1, 67.10.8 and
68.13.4; gap:decent-algebraic-spaces lists 68.11.1, not 68.13.7.

Change: "a decent reduced locally Noetherian one-point space is a field spectrum (68.13.7)" → 68.11.1
(through the gap) gives a monomorphism `Spec K → 𝒵_x^♭`; 3.4 and 3.1 give a flat lfp point; 3.2
makes it an isomorphism. *Needs* gained 3.1, 3.2. No other step cites 68.13.7.

## RT-StackPointsAndResidualGerbes~1a/F04, RT-StackPointsAndResidualGerbes~1b/F02 (P3) — applied

Checked: AlgebraicModuliForArithmeticGeometry §4.1 (main, line 1866) defines the site-level
`IsGerbe(F, J)`; on `(Scheme, fppf)` it is a gerbe over the final object `Spec ℤ`.

Change: *Stacks.IsGerbe* → *Stacks.IsGerbeOverSomeSpace* (named nowhere else, not in `plan.json`).
2.1 now says `IsGerbe` is the strictly stronger case of a gerbe over `Spec ℤ`. New Check: `𝔸¹_k`
and `B𝔾_{m,𝔽_p}` satisfy the weaker notion, not `IsGerbe`; `B𝔾_{m,ℤ}` satisfies both.

## RT-StackPointsAndResidualGerbes~1a/F05 (P3) — applied

Checked: AlgebraicModuliForArithmeticGeometry §8.1 (line 9651) frames `x|_k ≅ x₀`; §8.3's
`FramedDeformation` (line 9727) frames `α : x₀ ≅ y|_k`.

Change: Convention 8 "`(τ, α : x ≅ τ|_k)` as §8.1's" → both forms, `β : τ|_k ≅ x` (§8.1) and `α`
(§8.3), with `α = β⁻¹`; the roadmap uses `α`; in §8.1's form the left action is `(τ, g ∘ β)`.
Witness on `[𝔸¹/𝔾_m]`: weight `+1` in both. Convention 5 and 7.3 already use `α`; unchanged.

## RT-StackPointsAndResidualGerbes~1a/F06, RT-StackPointsAndResidualGerbes~1b/F03 (P3) — applied

Checked: SchemeAndStackFoundations §1.12 (main, line 3180), `translationQuotient_space`: the space
`𝔸¹_ℚ/ℤ` over `ℚ` only, no group law.

Change: 1.4's Check "`G = 𝔸¹_k/ℤ`, characteristic zero" → `G = 𝔾_{a,ℚ}/ℤ` over `ℚ`, its space §1.12's,
group law from the abelian sheaf quotient, flat lfp through its atlas `𝔸¹_ℚ`. 4.3's Check now
points to it and says why the inertia is quasi-compact. The computations are unchanged; all other
`/ℤ` examples were already over `ℚ`.

## RT-StackPointsAndResidualGerbes~1b/F04 (P3) — applied

Checked: Lemma 101.33.7 (stacks-06RD lines 3335–3338): `X → Y` a smooth morphism of algebraic
spaces, `G` a group algebraic space over `Y`.

Change: 2.3 now says so; *Needs* add `actionQuotient` and Theorem 97.17.2 / Lemma 97.17.1 (through
gap:flat-groupoid-quotients) for `[X/G]` with the action groupoid `G ×_Y X ⇉ X`. The same untyped
`G`, `X` appeared in a Check of 2.4, which now names its carriers too.

## RT-StackPointsAndResidualGerbes~1b/F05 (P3) — applied

Checked: `rydh2015` is cited nowhere in the README. Part of the witness is wrong: the entry had a
`cited_for`, which read "not cited by the roadmap". The substance holds: a manifest records cited works.

Change: the `[[source]]` table `rydh2015` was deleted from `sources.toml` (24 entries remain; no
other key changed).

## Checks run

- **Elaboration**: from the content checkout, `lake env lean packages/StackPointsAndResidualGerbes/Suggested.lean`
  exits 0 with no output. The file is unchanged and declares nothing. Its docstring says why no
  headline can be stated at the pins: the pins have no algebraic stack. So there was no declaration
  to `#check` and no elaborated signature to compare. Nothing changed.
- **Dependency check**: `gate --depcheck … --name StackPointsAndResidualGerbes --movable` printed
  `depcheck: 235 roadmaps, 2229 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The
  edge count is the same as before the edits, so naming VirtualFundamentalClasses in Scope created
  no edge.
- **Citation resolver** (`roadmaps resolve`): none unresolved, for both cross-roadmap citations and
  Lean names.
- **Gap consistency**: 17 gap slugs in the README's supplier contracts and 17 in `plan.json`, the same
  set, and every `gap:` the README uses is declared. In `plan.json` only the `gaps` list changed: the
  rest compares identical to the original.
- **Manifest**: `sources.toml` parses, with 24 entries and no local path.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap:qcoh-stacks-abelian-tensor: abelian, kernels on `U` | `[𝔸¹/𝔾_m]`, `ℐ` of `B𝔾_m`; `Spec k`; `Bμ_p/𝔽_p` | kernel of `k[t] → k` on the atlas is `(t)` with its `𝔾_m`-structure, matching 0.4's Check; `QCoh(Spec k) = Vect_k`; `QCoh(Bμ_p)` = comodules over the flat `𝔽_p[λ]/(λ^p−1)` | holds | new gap |
| same: pullback right exact, not exact | origin `Spec k → 𝔸¹`, `0 → (t) → k[t] → k → 0` | pulls back to `k·t → k → k → 0`, where `k·t → k` is zero | holds; consistent with 0.4's Check | none |
| 0.4: `ℐ^{n+1}` = image of `ℐ^{⊗(n+1)}` | `𝔸¹` at origin, `n = 0, 1`; `Spec k[ε]` | `(t)⊗(t) ≅ k[t]`, image `(t²)`, lengths 1, 2; `(ε)⊗(ε) = k`, `ε⊗ε ↦ ε² = 0`, so `ℐ² = 0` | holds; agrees with both 0.4 Checks | gap cited |
| 7.2: finite-dimensionality via chart | `[𝔸¹/𝔾_m]` at 0 (`U = 𝔸¹`); `BG` (`U = Spec k`); `Bμ_p/𝔽_p(t)` (`U = 𝔾_m`); `𝔸¹_ℚ` at 0 with `U = Spec ℚ(i)[t]`, `k(u) = ℚ(i)`; `[𝔸ⁿ/GLₙ]` | dims 1; 0 (`J = 0`); 0 (`W = U`); `dim_{ℚ(i)} = 1 = dim_ℚ`; `n` | holds; matches 7.2's Checks | new bullet |
| same, negative control | `Spec k[x₀, x₁, …]` at origin | `ℐ/ℐ²` infinite-dimensional; excluded because the standing hypothesis asks `𝒳` locally of finite type | hypothesis needed | none |
| 7.3: chart over a finite separable `k'` | `Bμ_p/𝔽_p(t)` with atlas `𝔾_m`; `𝒳 = Spec k`, `U = Spec k'` with `k'/k` finite separable | `U_x = {(λ, z) : z = λ^{−p}} ≅ 𝔾_m` with rational point `λ = 1`, so `k' = k`; `U_x = Spec k'` has no `k`-point but has a `k'`-point | holds; the extension is needed | text added |
| 5.3: residue field via 68.11.1 + 3.1 + 3.2 | `𝔸¹_ℚ` at `t²+1`; `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ` | bases `Spec ℚ(i)`, `Spec ℝ`; not decent, no field monomorphism represents its point (or 3.2 would make it a field, against 3.4's Check) | holds; fails where it should | proof rewritten |
| 2.1: site-level `IsGerbe` ⇔ gerbe over `Spec ℤ` | `𝔸¹_k`; `B𝔾_{m,𝔽_p}`; `B𝔾_{m,ℤ}`; `Spec ℤ`; the empty space | `0 ≠ 1` in the sheaf `𝔸¹(k)`, so not locally isomorphic; no objects over `ℚ`-schemes; line bundles are locally trivial; single object; no object over the members of a covering of `Spec ℤ` | weaker notion holds in the first two and the last, `IsGerbe` fails there; both hold for `B𝔾_{m,ℤ}` and `Spec ℤ` | sentence + Check |
| Convention 8: `β = α⁻¹`, `g·(τ,β) = (τ, g∘β)` | `[𝔸¹/𝔾_m]` at 0, `τ = bε` | framed isos `(b, α) ↦ (μ₀b, μ₀α)`, invariant `α⁻¹b`; in `β`-form `(b, β) ↦ (μ₀b, βμ₀⁻¹)`, invariant `βb`; action gives `gα⁻¹b` in both | weight `+1`, as in Convention 5 | convention restated |
| 1.4 Check: `G = 𝔾_{a,ℚ}/ℤ` | diagonal over `𝔸¹×𝔸¹`; in characteristic `p` | `ℤ × 𝔸¹ → 𝔸²`, `(n, x) ↦ (x, x+n)`, not quasi-compact; image dense, missing the generic point; translation by `p` is the identity, so the action is not free (hence `ℚ`) | holds over `ℚ` | carrier fixed |
| 4.3 Check: `BG`, same `G` | inertia over `Spec ℚ → BG` | `G → Spec ℚ` is the image of `𝔸¹_ℚ`, so quasi-compact, and not quasi-separated; `BG` is a gerbe over `Spec ℚ` | both statements apply | text fixed |
| 2.3: `[X/G]` smooth over `Y` | `X = Y = Spec 𝔽_p`, `G = μ_p`; `X = Spec 𝔽_p[t]/(t²)`, `G = 1` | `Bμ_p` smooth although `μ_p` is not; `[X/1] = X` is not smooth, so `X → Y` must be smooth | holds; hypothesis needed | carriers added |
| 2.4 Check: free action | `G = 𝔾_m` acting on `X = 𝔾_m` by translation over `Spec k` | `[X/G] = Spec k`, trivial inertia | holds | carriers added |
| Scope: the carriers of VirtualFundamentalClasses agree | `𝒳 = Spec k ⊔ Spec k`, closed immersion onto the first copy | its class up to equivalence holds exactly one substack, `Spec k ⊔ ∅` (Convention 4's witness) | holds | text |
| Downstream: 0-dim integral closed substacks = residual gerbes | `BG` over `k̄` with `G` finite; a closed point of a finite type DM stack | integral closed substack `BG` = `𝒵_x`; the reduced induced substack on a closed point is `𝒵_x` by 4.5 | holds | text |

## Ownership and supplier direction

- New gap: SchemeAndStackFoundations is on main and earlier than this roadmap, and §1.22 is where
  `Stacks.QCoh` is defined. I searched `roadmaps grep` for `QCoh` with abelian, tensor or monoidal,
  on main and at the open heads (SchemeAndStackFoundationsPartII included), and the board package
  QuasicoherentSheavesOnPrestacks. Nothing proves that `Stacks.QCoh` of a stack is abelian, so no
  other owner exists.
- No notion was moved down from a later roadmap. No supplier was added. The only Tau Ceti name added
  exists at the pin.
- Nothing on main or at an open head cites this roadmap (`roadmaps grep --fixed
  StackPointsAndResidualGerbes`: no match), so renaming *Stacks.IsGerbe* breaks no citation.

## For the maintainer

- **VirtualFundamentalClasses** (board package, line 423 of the merge order) states, in its §1.2,
  objects this roadmap owns earlier in the order: closed substacks, the presentation bijection, the
  reduced induced closed substack and the reduced-source factorisation. That package should cite
  StackPointsAndResidualGerbes 0.3 and 0.5 instead of stating them. This package cannot make that
  change.
- **SchemeAndStackFoundations** now has one more gap addressed to §1.22,
  gap:qcoh-stacks-abelian-tensor.
- **Renamed name:** *Stacks.IsGerbe* is now *Stacks.IsGerbeOverSomeSpace*. It is a proposed name,
  not declared in `Suggested.lean`, and no roadmap cites it.
- No suspicious instructions were found in the reviews or in the texts I read.
