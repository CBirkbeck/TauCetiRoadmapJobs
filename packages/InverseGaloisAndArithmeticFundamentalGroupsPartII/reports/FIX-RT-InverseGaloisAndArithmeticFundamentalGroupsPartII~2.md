# FIX-RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2

Repair round for the red-team reviews `RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a`
(four findings) and `~2b` (seven findings). Files changed:
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md` and `sources.toml` (the
EVW16 locator now also lists §2.6, §7.3 and Lemma 7.4). `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: no Lean statement changes, and no new gap is needed. Two
findings describe one defect and are settled once: 2a/F02 with 2b/F01. 2a/F04 and 2b/F07 touch
the same contract line but are different defects (plane against disc; `c₁` against `c`). They are
settled separately with one shared rewrite.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a/F01 (P2) — applied

Witness holds: ReductiveGroups on main, line 51 and the 11A paragraph "Construct the ordered and
unordered configuration spaces of the open unit disc", owns the disc spaces and `z ↦ z/√(1+|z|²)`.
Scope, the 11A contract, the §5.1 sketch and Check, and §2.1 now cite 11A. The `Homeomorph.unitBall`
contract bullet and its §5.1 *Needs*/Layer 5 *Dependencies* entries are deleted.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a/F02, RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F01 (P3) — applied

Layer 2 preamble `P_j = j/√(1 + j²)` of §5.1 → `P_j = (j − 1)/√(1 + (j − 1)²)`, `1 ≤ j ≤ n`, the
image of 11A's base `planeBase n = fun i => (i : ℂ)`; `σ_i` is native `sigma (i − 1)`. Pattern:
11A contract and §5.1 now say `0 ≤ j ≤ n − 1`.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a/F03 (P3) — applied

EVW16 lines 516–517: homotopy associative only. §0.4 "up to coherent homotopy" → "up to homotopy
(an H-space), hence on homology"; `B_m × B_n → B_(m+n)` is `(x, y) ↦ castAdd n x · shiftHom m n y`,
commuting by `sigma_mul_sigma_comm`. `castAdd`, `castAdd_sigma` added to Scope, *From Tau Ceti*,
§0.4 *Needs*; new `m = n = 2` Check.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2a/F04 (P3) — applied

The parent's *Analytic and topological Hurwitz comparison* at its open head is for "`CHur^{c₁}_{G,n}`
of the plane". Contract and §5.3 now say so. §5.3 identifies the plane space with the disc one: 11A's
map extends to ℂ with its circle at `∞`, onto `D`, and is transported along §IG.5.2's marked-cover
description. 11A was added to §5.3's *Needs*, §4.5's wording follows.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F02 (P2) — applied differently

Witness holds (parent §IG.3.2: "may correspond to the inverse generator"). §2.1 now takes
`π_1(Conf_n(int D), P) ≅ B_n` from 11A only, `sigma (i−1)` ↦ counterclockwise twist on
`[P_i, P_(i+1)]`; the §IG.3.2 attribution and §IG.5.1 leave its *Needs*. No comparison target.

Why: "equal or inverse" is uncheckable (parent's base and path unspecified; path changes add inner
automorphisms) and unused: Layer 3 needs only algebraic `A(n)` and the connectivity of `|A(n)|`.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F03 (P3) — applied

DGAInfinity Layer 5 on main covers derived categories of `A∞` modules and twisted complexes, not
graded `Tor` over `TauCeti.GradedModuleCat`. "(gap:dga-graded-tor-spectral-sequences)" was appended
to the *Needs* of §§1.5, 1.6, 1.10, 1.16, 1.17. Pattern: also on the Scope bullet and Layer 1
*Dependencies*. Each use (resolution, LES, filtration, hyperhomology) is in the gap's `needs`.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F04 (P3) — applied differently

The suggested text ("only the predicate is pinned; that a bundle belongs to it is AlgebraicTopology's")
is wrong at the pin: `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
(`SerreFibration/FiberBundle.lean`) proves locally trivial maps are Serre fibrations. The new contract
bullet names both declarations, and §2.1 now uses the theorem. The fibration LES is unpinned; the
based-pair sequence is pinned (`Relative/Exact.lean`).

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F05 (P3) — applied

ArithmeticStatisticsPartVIII (order line 146; this roadmap 224) imports nothing from here (its scope,
line 30). *Downstream consumers* now opens "No roadmap on main or earlier in the build order consumes
a target of this one" and says it uses its own §5.16. `roadmaps grep` finds no other citing roadmap
but an ownership mention.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F06 (P3) — applied

§1.11: "and differential `(g_0, …, g_q) ⊗ m ↦ Σ_i …`" → "and differential `K(M)_(q+1) → K(M)_q`,
`(g_0, …, g_q) ⊗ m ↦ Σ_(i=0)^q …`" (EVW16 line 731). The §1.11 Checks (`q = 0, 1`) and the §1.15
Check (`t` for `q` even) were recomputed against the new indexing, and all hold.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~2b/F07 (P3) — applied

The parent gives the class locus only marked at unramified `∞`; unmarked, only
`CHur^{c₁}_{G,n}/G`. The contract now cites that. §5.3 derives the `c`-locus as local monodromies in
`c` (generator-free as `c` is rational), defined at the `n` finite branch points (EVW16 lines
1461–1471), with a new Check and source note.

## Checks

- `lake env lean packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean`, run
  from the content directory: exit code 0, two warnings (`declaration uses 'sorry'`, lines 472 and
  489, the two headlines), no errors, 24 s.
- `#check @name` for all 35 declarations: a scratch copy of `Suggested.lean` with 35 appended
  `#check` lines, elaborated once (exit 0). The elaborated types are unchanged from the supplied
  signatures (the file is unchanged), and both headlines carry `[Fintype G]`, `IsNonsplitting c`,
  `∀ (k : Type) [Field k]` and `↑(Fintype.card G) ≠ 0`, as the README states. Nothing changed.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 208 roadmaps, 1898 edges, 0 problem(s)`.
  No UPWARD, CYCLE or `moved:` line. New edges: none. ReductiveGroups Layer 11A, already a supplier,
  is cited in more places.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name of a roadmap found
  nowhere. The pinned names newly cited (`TauCeti.BraidGroup.castAdd`, `castAdd_sigma`,
  `sigma_mul_sigma_comm`, `TauCeti.TopCat.serreFibrations`,
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`) were each found at the pinned Tau Ceti:
  `GroupTheory/SpecificGroups/Braid/Basic.lean` lines 477, 482, 120;
  `Topology/Homotopy/SerreFibration/Basic.lean` line 107; `…/FiberBundle.lean` line 365.
- `sources.toml` parses as TOML; no new key, no local path.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 2 base `P_j = (j−1)/√(1+(j−1)²)` | `n = 1, 2, 3` | `0`; `(0, 0.7071)`; `(0, 0.7071, 0.8944)`; old formula `n = 2`: `(0.7071, 0.8944)` ≠ §5.1 Check `(0, 1/√2)` | increasing; matches §5.1 | repaired |
| clockwise order from `∗ = −i` | `n = 3` | arguments of `(P_j, 1)`: `90°, 54.74°, 48.19°`, decreasing | `P_1` first, as §2.2 Check | none |
| `σ_i` = native `sigma (i−1)` | `i = 1`, 11A loop `z_0(t) = 1/2 − e^(πit)/2` | `t = 1/2`: `1/2 − i/2`, image `0.408 − 0.408 i`, lower half-plane | `P_1` passes on the side of `∗`, as §2.1 and §2.5 Checks | none |
| 11A transport values | `1, 2`; inverse at `1/√2` | `1/√2`, `2/√5`; `(1/√2)/√(1 − 1/2) = 1` | ok | wording only |
| §0.4 `B_m × B_n → B_(m+n)` | `m = n = 2`; `m = 0`; `n = 0`; `m = 1` | native `σ_0` and `σ_2`, `0 + 2 ≤ 2`; `x' = 1`, map `= shiftHom 0 n`; `castAdd 0` fixes generators; `B_1 = 1` | images commute in every case | new Check (natAdd on both factors sends both `σ_0` to `σ_2`) |
| §0.4 associativity | EVW16 lines 516–517 | "associative up to homotopy", H-space | coherence not claimed | repaired |
| §1.11 differential `K_(q+1) → K_q` | `q = 0`; `q = 1`; `k[t]` | `(g) ⊗ m ↦ r_g m`; `(h) ⊗ r(h⁻¹gh)m − (g) ⊗ r_h m`; `q + 1` signs: `t` (even `q`), `0` (odd) | §1.11, §1.15 Checks agree | repaired |
| §2.1 Serre fibration step | `n = 0`; `n = 2` | `Conf_0` a point, the bundle is trivial; exact sequence `π_1(Diff) = 0 → π_1(Conf_2) ≅ ℤ → π_0 Diff(D, P; ∂D) → π_0(Diff) = 0` | boundary map bijective | cites pinned theorem |
| §2.1 independence of the parent's orientation | parent `ψ = (11A) ∘ τ`, `τ: σ_i ↦ σ_i⁻¹` (an automorphism: the inverted braid relation is the braid relation of inverses) | `X(n)_q = EB_n ×_(B_n) (A(n)_q × c^n)` algebraic; fibre `|A(n)|` (n−2)-connected for any action | Layers 3–5 unchanged | sentence added |
| §5.3 class locus at finite points | `S₃`, transpositions, `n = 2`; `n = 3` | `n = 2`: 6 generating pairs, products 3-cycles; fibre 1 point (finite reading) vs 0 (with `∞`). `n = 3`: product a transposition, readings agree | finite reading matches `CHur_n/G` | defined; Check and source note added |
| §5.3 rationality | `C₃`, `c = {g}` | `g² = g⁻¹ ∉ {g}`: not rational, so excluded | independence of generator needs rationality | stated |
| §5.3 plane against disc | `S₃`, `n = 2`; radial extension | both fibres one point over a base `≃ S¹`; `(r, θ) ↦ (r/√(1+r²), θ)`, `r → ∞` ↦ `∂D` | homeomorphic quotients | derived |
| §5.3 trivial group | `G = 1`, `n = 0, 1` | `Spec ℤ`, empty; dims `1` at `(0,0)`, else `0` | unchanged | none |
| *Downstream consumers* | order lines 146, 224 | ASP8 earlier, imports nothing | consistent | repaired |
| gap tags §§1.5–1.17 | `k[t]`, `M = k` | `Tor_1 = k[1]`, from the resolution `0 → k[t][1] → k[t]`, in the gap's `needs` | ok | tagged |

## Ownership and open work

No new construction is owned here. The plane-against-disc identification of the Hurwitz spaces
in §5.3 is a step of a proof sketch built from ReductiveGroups Layer 11A (on main) and §IG.5.2. The
parent's §IG.5.1 (open, earlier in the order) and ReductiveGroups Layer 11A (main) both construct
the topological configuration spaces of the open disc. The Scope now attributes the spaces and
the homeomorphisms to 11A and the asphericity and the identification defining `Hur_n` to §IG.5.1,
noting they are the same space. Ownership against open pull requests: `roadmaps grep` over main
and all open heads, as listed under 2b/F05; the closest-roadmap list of `overlaps.md` was not
changed by this round.

## Source issues

- **Gap** in EVW16 at §7.3 with Lemma 7.4, p. 32 (EVW16 lines 1461–1471): the source says the class
  condition holds at each branch point of the cover; it should be at the finite branch points
  only, since the lemma's space puts no condition on the boundary monodromy; affects a stated
  result.

## For the maintainer

- The parent roadmap (InverseGaloisAndArithmeticFundamentalGroups, open) leaves the orientation
  of its §IG.5.1 identification to §IG.3.2, which does not fix it. This roadmap no longer depends on
  it, but the parent's §IG.5.3 comparison, a moduli statement, still needs it settled.
- The parent's §IG.5.1 and ReductiveGroups Layer 11A both construct `PConf_n(𝔻)` and `Conf_n(𝔻)`.
  By the ownership rule the parent, which is open, should cite 11A. That is the parent's edit, not
  this package's.
- No name another roadmap cites changed. No Lean declaration changed.
