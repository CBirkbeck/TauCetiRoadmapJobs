# FIX-RT-SurfaceGroupCharacterVarieties~2

Repairs for red-team round 2 (passes a and b). Four findings, all P3. The two F01s are the same
claim, so one section settles both. All four were verified and applied. Files changed:
`packages/SurfaceGroupCharacterVarieties/README.md` and
`packages/SurfaceGroupCharacterVarieties/Suggested.lean` (the module docstring only).

## RT-SurfaceGroupCharacterVarieties~2a/F01, RT-SurfaceGroupCharacterVarieties~2b/F01 (P3) — applied

Verified. Both witnesses were recomputed. In `SL₂`, the pair `(diag(2, 1/2), [[1,1],[0,1]])` has
centralizer `{±1}`; its limit `(diag(2, 1/2), 1)` has centralizer `T`. The element `[[1,1],[0,1]]`
has a 1-dimensional centralizer; its limit `1` has a 3-dimensional one. BateMartinRohrle2005 lines
870–874 go the same way: the orbit gets smaller, the centralizer larger.

Change: in the §6.4 proof sketch, "a cocharacter limit … would lower the dimension of the
centralizer, while its adjoint image is `GL(𝔤)`-conjugate …" → the limit lies in the orbit
boundary, so its orbit is smaller (ReductiveGroups 3A.3), its centralizer is larger and, by
separability, its fixed space is larger:
`dim 𝔤^{z'} ≥ dim C_G(z') > dim C_G(z) = dim 𝔤^z`. The `Ad`-image of `z'` lies in the closed
`GL(𝔤)`-orbit, so the fixed spaces have equal dimension, a contradiction.

The rest of the pattern:
- I added a §6.4 Check that pins the direction on the pass-a witness.
- I added "3A.3, boundary orbits have strictly smaller dimension" to the ReductiveGroups contract's
  Layer 3A list. 3A.3 is on main (ReductiveGroups README, **3A.3 Finite dimensions, including
  disconnected groups**), and §6.4's *Needs:* already lists ReductiveGroups Layer 3A.

A grep for other claims about centralizer, orbit or fixed-space dimension (lines 150, 595, 1453,
1849) found no other one. §6.5's cocharacter-limit argument makes no dimension claim.

## RT-SurfaceGroupCharacterVarieties~2b/F02 (P3) — applied

Verified. §2.1 defines `Mod^±(X) := (X ≃ₜ X) ⧸ Homeo₀(X)` and puts a topology only on `X ≃ₜ X`,
for locally compact Hausdorff `X`. No topology on the quotient is stated.

Change: Conventions, "Notation shared with suppliers": "`Mod^±(X)` is the topological group of §2.1"
→ "`Mod^±(X)` is §2.1's group of ambient isotopy classes of self-homeomorphisms of a topological
space `X`, an abstract group on which no topology is put".

Pattern: every other occurrence of `Mod^±` (28 lines, including Scope line 43) already calls it a
group, with no topology.

## RT-SurfaceGroupCharacterVarieties~2b/F03 (P3) — applied

Verified. `exists_outAction_characterVariety` takes `[Field k] [TopologicalSpace k]`, with no
continuity of the field operations. Its own docstring and README §§7.1 and 7.4 say "field `k` with a
topology". The module docstring alone said "topological field".

Change: `Suggested.lean`, module docstring, Layer 7.4 bullet: "over a topological field" → "over a
field with a topology".

Pattern: a grep of both files for "topological field", "field with a topology", "affine group" and
"Hopf" found no other mismatch. "Affine group" is used throughout for an arbitrary commutative Hopf
algebra (`Spec A`), as in the declarations.

## Checks run

**Elaboration.** `lake env lean packages/SurfaceGroupCharacterVarieties/Suggested.lean`, run from the
content checkout, gives 13 `declaration uses 'sorry'` warnings (lines 96, 114, 124, 145, 204, 212,
220, 230, 240, 274, 324, 339, 362) and nothing else: no error and no other warning.

**Elaborated signatures.** I copied the file into scratch with one `#check @name` for each of its 25
declarations (the 24 of the signature listing plus the scoped instance `pointwiseTopology`) and
elaborated it once. Every one of the 24 elaborated types is identical, after whitespace
normalisation, to the worker's listing for the previous head. Nothing changed, as expected for a
docstring-only edit. The four flagged "dropped binder" leads are the four Layer 5 definitions, which
the README states without `FiniteDimensional`.

**Dependency check.**

    depcheck: 240 roadmaps, 2260 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Citations.** `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean
name that is missing anywhere. This includes the new citation ReductiveGroups 3A.3.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §6.4 sketch: the limit's orbit has strictly smaller dimension | `SL₂`, `(diag(2,1/2), u)`; `SL₂`, `u = [[1,1],[0,1]]`; a closed orbit (`N(T)` generators) | `3 → 2`; `2 → 0`; closed orbit, no limit outside it, hypothesis of the step fails | true; ReductiveGroups 3A.3 gives `dim O_y < dim O_x` for boundary orbits |
| centralizer strictly larger (`dim C = dim G − dim orbit`) | same two | `0 → 1`; `1 → 3` | true |
| `dim 𝔤^{z'} ≥ dim C_G(z') > dim C_G(z) = dim 𝔤^z` | pass-a tuple on `𝔰𝔩₂` (basis `e, h, f`) | `Ad diag(2,1/2)` has eigenvalues `4, 1, 1/4`, fixed space `⟨h⟩`; `Ad u` fixes `⟨e⟩`; common `0`; limit `⟨h⟩ = 𝔱`; `1 ≥ 1 > 0 = 0` | true; `Lie C ⊆ 𝔤^z` always, equality from separability (BateMartinRohrle2005 line 873–874) |
| `Ad` carries `z'` into the closure of the `GL(𝔤)`-orbit of `Ad z` | `λ(t) = diag(t, t⁻¹)` | `Ad λ(t) ∈ GL(𝔤)` and `Ad` is continuous, so `Ad λ(t)·Ad z → Ad z'` | true |
| that `GL(𝔤)`-orbit is closed when `𝔤` is a semisimple `Z`-module | `Z = T` (semisimple: weights `2, 0, −2`); `Z = B` (not: `𝔟` stable, no stable complement) | closed; for `B`, `Ad u` is a nontrivial unipotent, its `GL₃` orbit is not closed (`→ 1`) | true; `Ad(Z)` is the closure of `⟨Ad zᵢ⟩`, since `Ad` maps the closure of a subgroup onto a closed subgroup containing the image densely |
| conclusion: equal fixed-space dimensions contradict `>` | `Z = N(T)` in `SL₂` (`Z⁰ = T` reductive) | the orbit is closed (§6.4 Check), so no limit leaves it; consistent | true |
| new Check (direction witness) | as computed above; the Borel subgroup is dense-generated | `d u d⁻¹ = [[1,4],[0,1]]`, infinite subgroup of `U`, closure `U`; `⟨d⟩` closure `T`; closure `B` | correct; `𝔟`'s only stable lines are inside `𝔟` (`Ad u·h = h − 2e`, `Ad u·f` leaves `⟨f⟩`) |
| contract: ReductiveGroups 3A.3, boundary orbits strictly smaller | read at main | 3A.3 names `TauCeti.SchemeAction.topologicalKrullDim_orbit_lt_of_mem_orbitBoundary` | matches |
| Conventions: `Mod^±(X)` an abstract group | `X = ℝ`, two-point discrete space, `S¹` (§2.1 Checks) | orders `2`, `2`, `2`; §2.1 states no topology on the quotient | consistent with §2.1 and Scope line 43 |
| module docstring, 7.4 bullet: "field with a topology" | `ℝ` with the lower-limit topology (not a topological field), `𝔾_a`, `Γ = ℤ` | the declaration admits it; the docstring now does too | docstring equals the declaration's generality |

## Notes for the maintainer

- No Lean name was added, removed or renamed, and no elaborated signature changed. No other roadmap
  is affected.
- One supplier citation is new: ReductiveGroups 3A.3, on main. No open pull request revises
  ReductiveGroups; the only related open folder is the new roadmap ReductiveGroupsPartIII. No new
  object is owned here, so no ownership question arises.
- `design/plan.json` and its `gaps` list are unchanged. No source was fetched, and nothing was added
  to `needs-references.toml`.
- I made no change for the "For the human reviewers" sections of either review, as the brief
  requires.
- Neither review contained instructions or suspicious text.
