# GATE-ReductiveGroups~1: answers to the human review of the ReductiveGroups pull request

Review answered: roed-math, 2026-11-06 (cross-PR overlap check, six points). Repairs are in
commit `528579c6` on top of `92ab639`, in `TauCetiRoadmap/ReductiveGroups/README.md` and
`TauCetiRoadmap/ReductiveGroups/Suggested.lean`.

## H01 (roed-math) — applied

The reviewer offered two owners. The second is applied: Layer 3A.5 stays the owner of the
classical topology and smooth charts on `X(ℂ)`. The first (consume ComplexComparisonPartII
C-1.1, as main did) is excluded because ReductiveGroups is on main and ComplexComparisonPartII
is an unmerged draft. A trial README that consumed C-1.1 fails the direction check with
`UPWARD: ReductiveGroups (on main) -> ComplexComparisonPartII (#38) at README lines [259, 325, 854, 970, 3330, 3600]`.
No roadmap on main and nothing at the Mathlib/Tau Ceti pins carries a topology on the complex
points of a scheme, so Layer 3A.5 is the lowest available owner.

The README now names the other two roadmaps as consumers:
- README L33–34 adds: "FormalConnectionsOpers §2.4 and SchubertGeometry S9 likewise take
  complex points, their classical topology and smooth charts from Layer 3A.5."
- README L3729–3730 changes "outputs for ComplexComparisonPartII C-1.1" to "outputs for
  ComplexComparisonPartII C-1.1, FormalConnectionsOpers §2.4 and SchubertGeometry S9".

The other side still has to change:
- FormalConnectionsOpers at its head 0694b63 (L46–55) takes complex points from C-1.1.
- SchubertGeometry at its head b6cf2e7 (S9.0, L1084–1097) builds its own analytification,
  which also duplicates C-1.1. That duplication is between those two pull requests.

Both roadmaps already consume ReductiveGroups, so consuming Layer 3A.5 adds no new edge.

## H02 (roed-math) — applied

The `G(ℂ)` complex Lie-group dictionary stays in Layer 3A.5, as suggested. FormalConnectionsOpers
at its current head 0694b63 already consumes it: L76–83 and L1417–1440 say 3A.5 owns the
complex Lie-group structure and §4.3 owns only the transport to `WithConv (H →ₐ[ℂ] ℂ)`.
The README now says the same:
- L22–24 adds that FormalConnectionsOpers §4.3 consumes the dictionary and transports it to the
  Hopf-point carrier, and that no target of FormalConnectionsOpers is an input here.
- L886: "consumed by Layer 11" → "consumed by Layer 11 and by FormalConnectionsOpers §4.3".
- L3720–3722 states that FormalConnectionsOpers consumes the dictionary in its §4.3 and that
  Layer 11 consumes no target of FormalConnectionsOpers.

One mismatch remains, on #1056's side. Its L2479–2481 still says "ReductiveGroups Layer 11
consumes … what §4.3 adds". That would be a cycle, since FormalConnectionsOpers consumes
ReductiveGroups Layers 0–9, 3A.5 and 6B. It is also unnecessary: 11C proves its own central
splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and its own infinitesimal-to-group invariant comparison, and works on
scheme points, so it needs no native-carrier transport.

## H03 (roed-math) — applied differently

The reviewer suggests consuming #1196's §2.1 `weyl_based_complement`. #1196 revises RootSystems,
which is already on main, and a revision cannot be a supplier; main's RootSystems has no such
target. The pinned Tau Ceti already proves the needed fact: `RootPairing.Base.existsUnique_map_eq`
(`TauCeti/LinearAlgebra/RootSystem/Weyl/Bases.lean`) gives exactly one Weyl element carrying any
base to any other. It holds for finite reduced crystallographic root pairings over a
characteristic-zero domain, with no spanning hypothesis. The factorization `g=w∘d` follows in
one step, and the pin's own `Weyl/Automorphism.lean` uses exactly this step.

- §9A.1a-L (README L2247–2259) now derives the factorization from that theorem instead of
  "RootSystems Layer 4", and keeps only the ADE restriction and the lift comparison. The
  "*Needs:*" line reads Tau Ceti `RootPairing.Base.existsUnique_map_eq`.
- Scope (L59–63): "§9A.1a-L owns its Weyl/based factorization adapter" → "§9A.1a-L applies the
  simple transitivity on bases to the ADE root lattice".
- New Check (L2262–2264, §9A.1a-L Checks): in A₂, `−1=w₀∘flip`, with the diagram flip not in W.

## H04 (roed-math) — applied differently

The defect is real: main's RootSystems has only Layers 1–3, so "Layer 4" and "Layers 5–6" resolve
nowhere on main. The suggested fix (#1196 as a dependency) is excluded for the reason given in
H03. Every such citation now points at pinned Tau Ceti declarations, all checked in the sources
at TauCeti 2fd255d. A new supplier bullet "Finite root systems." (README L203–227) lists them with
their hypotheses and files:

- Finite root/reflection API: `TauCeti.posRoots`, `TauCeti.exists_mem_support_height_reflectionPerm_lt`,
  `TauCeti.weylGroup_eq_closure_simple`, `TauCeti.inversions`, `TauCeti.longestElement`.
- Weyl Coxeter presentation: `TauCeti.weylCoxeterSystem`, `TauCeti.weylCoxeterHom_injective`,
  `TauCeti.length_weylCoxeterSystem_eq`.
- Bases and chambers: `RootPairing.Base.existsUnique_map_eq`, `RootPairing.dominantChamber`,
  `TauCeti.openWeylChamber`, `TauCeti.weylGroupEquivOpenWeylChambers`.
- Classification: `TauCeti.existsUnique_dynkinType`, `TauCeti.HasCartanType.of_base`,
  `TauCeti.nonempty_equiv_of_hasCartanType`, `TauCeti.DynkinType.Valid`.
- Numbered root data: `TauCeti.DynkinType.simplyConnectedRootDatum`,
  `TauCeti.DynkinType.rationalRootSystem`.

Citations changed:
- "Layers 1–4" → the Tau Ceti finite root-system API and Weyl Coxeter presentation, at
  L1439, L1470, the Layer 7 root-subgroup paragraph, L1511 and L1531.
- "Layers 5–6" → the Tau Ceti Cartan–Killing classification and numbered root data, at L2053,
  L2067, L2095, L2454, L2468, L2888, L2900 and L3011.
- "Layer 4" (L54, L2218 and L2223 at 92ab639) → the H03 change.
- Same pattern: L3485–3488 claimed that injectivity of `weylCoxeterHom` "remains that lower
  written target". The pin proves it (`TauCeti.weylCoxeterHom_injective`), so the text now
  consumes it. L3358, L3601 and the Layer 11 Dependencies (L3639) also cite the pinned
  presentation.

The reviewer's name `RootPairing.dominantChamber` is right: `Chamber.lean` opens
`namespace RootPairing` at L97. Main's RootSystems README calls it `TauCeti.dominantChamber`.

## H05 (roed-math) — applied

README L1364: "FormalConnectionsOpers F6 consumes it" → "FormalConnectionsOpers §3A.5 consumes
it". At FormalConnectionsOpers head 0694b63, §3A.5 is "Loop Grassmannian, affine flags and the
Cartan decomposition (F3A.5)" (L1212), and it consumes Layer 6B's coset affineness for `GL_n/G`
at L1222–1224. F6 is oper reduction (L1823).

## H06 (roed-math) — answered

No change here. The renamed text is a bold paragraph label inside §9A.1b, not a section id, and
§9A.1b keeps its number. The old label said "certificates", which the house rules exclude
(mathematics, not algorithms). RootSystemsPartII at its current head 06bbb0c (L59) already cites
§9A.1b by content. All three paragraphs it names exist:
- "Signed orbit modules and brackets", L2326
- "Folded frame, finite Cartan and presentation", L2358
- "Integral and full-Y comparisons", L2494

## Repair outside the review: `plane_braid`

The gate failed statement-hygiene on the existing `PlaneBraidAcceptance.plane_braid`, which
concluded `Nonempty (π₁(Conf_n(ℂ)) ≃* B_n)`. README §11A already asks for the
generator-characterized isomorphism. The theorem is restated as
`∃ e : FundamentalGroup (UnorderedPlane n) (unorderedBase n) ≃* TauCeti.BraidGroup n, ∀ i, e [halfTwistLoop n i] = TauCeti.BraidGroup.sigma i`.

Two definitions and one supporting theorem make this statable, all with real bodies and no
`sorry`:
- `halfTwist n i t`: points `i`, `i+1` at `i+1/2 ∓ exp(πtI)/2`, the other points fixed.
- `halfTwist_injective`, which keeps the points distinct.
- `halfTwistLoop n i : Path (unorderedBase n) (unorderedBase n)`, with continuity, source and
  target proved.

README §11A (L3369–3377) names them, adds an API bullet and two Checks. The module docstring is
updated to match. The statement does not depend on the half-twist orientation or on Mathlib's
product order in π₁, because `σᵢ↦σᵢ⁻¹` extends to an automorphism and every braid relation reads
the same reversed.

## Build, gate and direction check

- `lake build TauCetiRoadmap.ReductiveGroups.Suggested`: `Build completed successfully (9234 jobs).`
  The only warnings are `declaration uses 'sorry'` on the 12 headline theorems (L121, 130, 141,
  150, 160, 181, 198, 214, 227, 249, 413, 422); `halfTwist_injective` and `halfTwistLoop` are
  proved.
- Gate: `gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`.
  No UPWARD, CYCLE or moved line.
- Signature check: a scratch file importing the built module ran `#check @name` on all 28
  declarations and elaborated without error. The 24 unchanged declarations match the earlier
  transcript. `plane_braid`, `halfTwist`, `halfTwist_injective` and `halfTwistLoop` elaborate to
  the types stated in README §11A. No section binder is involved: every declaration carries its
  binders explicitly.
- `roadmaps resolve` on the final README: no cross-roadmap citation or Lean name found nowhere.
  Its Tau Ceti check was unavailable on this host, so the 21 cited Tau Ceti names were checked
  in the pinned sources with their namespaces.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Weyl/based factorization `g=w∘d` (§9A.1a-L) | A₁, g=−1 | gΔ={−α}; v=s_α gives v(−α)=α; d=s_α∘(−1)=1 on ℤα; w=s_α=−1 | (−1,1), agrees with existing Check | none |
| same | A₁×A₁, g=swap σ; g=s_α∘σ | σΔ=Δ ⇒ (1,σ); s_ασ(α)=β, s_ασ(β)=−α, v=s_α ⇒ (s_α,σ) | unique pair, w first | none |
| same | A₂, g=−1 | w₀α₁=−α₂, w₀α₂=−α₁ ⇒ v=w₀, d=w₀∘(−1) swaps α₁,α₂ | (w₀, flip); −1∉W | Check added |
| same | empty root span | W=1, Aut=1 | (1,1) | none |
| same: uniqueness | g=wd=w'd', dΔ=d'Δ=Δ | wΔ=gΔ=w'Δ ⇒ w=w' by `existsUnique_map_eq` ⇒ d=d' | holds | none |
| `existsUnique_map_eq` scope | ℤ-lattice vs ℝ-span | pin needs Finite ι, IsDomain, CharZero, crystallographic, reduced; ℤ qualifies | applies to integral ADE realization | text says so |
| Supplier bullet hypotheses | `longestElement`; `weylCoxeterSystem`; `existsUnique_dynkinType` | pin: `[P.IsRootSystem]` at LongestElement L192; Presentation L80–83, L109 has no spanning; Classification L130–131 needs spanning, irreducible, `Nonempty ι` | stated as at pin | none |
| `TauCeti.DynkinType.Valid` | B 1, C 2, D 3 | Valid: A≥1, B≥2, C≥3, D≥4 (DynkinType L153–158) ⇒ B1, C2, D3 invalid | README C2=B2, B1=A1 consistent | none |
| `halfTwist` endpoints | t=0; t=1 | exp(0)=1 ⇒ (i, i+1); exp(πI)=−1 ⇒ (i+1, i) = swap•base | proved in `source'`/`target'` | new |
| `halfTwist` orientation | n=2, i=0, t=1/2 | exp(πI/2)=I ⇒ (1/2−I/2, 1/2+I/2); point from 1 goes to upper half-plane | counterclockwise, matches README | Check added |
| `halfTwist_injective` | n=3, i=0 and i=1; moving pair | fixed point distance \|2−1/2\|=3/2 or \|0−3/2\|=3/2 > 1/2; m−E/2=m+E/2 ⇒ E=0 vs ‖E‖=1 | injective | proved |
| `plane_braid` | n=0, 1 | Fin(n−1)=Fin 0; B₀=B₁=1; Conf₀ = point, Conf₁ = ℂ, π₁=1 | vacuous characterization, e exists | none |
| `plane_braid` | n=2 | B₂=ℤ=⟨σ₀⟩, π₁(Conf₂)=ℤ, half-twist generates | e[ht₀]=σ₀ | none |
| `plane_braid` conventions | reversed π₁ product; clockwise orientation | relations σ₀σ₁σ₀=σ₁σ₀σ₁ and commutations are palindromic; σᵢ↦σᵢ⁻¹ is an automorphism | statement invariant | none |
| H01 ownership | trial consumption of C-1.1 | depcheck: 1 UPWARD line (quoted in H01) | rejected | 3A.5 kept |

## Ownership, overlaps and suppliers

- **Ownership checks.** No new construction is added. The Weyl/based adapter is no longer
  owned; it is derived from a pinned theorem. The half-twist definitions are §11A's own
  carriers, which this roadmap already owns (Scope L24–25). Ownership was checked against open
  pull requests where files were available:
  - FormalConnectionsOpers (head 0694b63)
  - SchubertGeometry (head b6cf2e7)
  - RootSystems (head 265d185)
  - RootSystemsPartII (head 06bbb0c)
  - ComplexComparisonPartII (#848, read with `roadmaps show`; it cites no ReductiveGroups target)
- **Ids that only an open revision defines.** None remain. The RootSystems Layer 4/5 citations
  that `overlaps.md` listed are gone.
- **Other open pull requests that change this roadmap.** These conflict with this head in
  README.md and Suggested.lean or in the deleted target files: #1332, #1797, #1807, #1808 and
  #1854. Whichever merges second is rebased on the first; none of their changes is restated here.
- **No upward dependency.** No `*Needs:*` line or supplier contract cites a later roadmap.
  SchemeAndStackFoundations, ModularCurves, SmoothBundlesConnections and LieGroups are on main.
- **Sources.** No source was fetched and none is missing; `needs-references.toml` was not
  written.
- **Untrusted text.** The review contains no instruction addressed to tools or credentials. Its
  request to move the pull request between `awaiting-author` and `awaiting-review` is for the
  worker.
